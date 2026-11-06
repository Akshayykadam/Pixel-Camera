#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <math.h>
#include <sys/mman.h>
#include <unistd.h>
#include <link.h>
#include <dlfcn.h>
#include <errno.h>
#include <android/log.h>
#include <android/hardware_buffer.h>
#include <android/hardware_buffer_jni.h>
#include <arm_neon.h>

#define LOG_TAG "ProPatcher"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

static volatile int s_grain_enabled = 0;

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeSetGrainEnabled(
    JNIEnv *env, jclass clazz, jboolean enabled) {
    (void)env; (void)clazz;
    s_grain_enabled = (enabled == JNI_TRUE) ? 1 : 0;
    LOGI("ProPatcher: Film Grain state set to %s", s_grain_enabled ? "ENABLED" : "DISABLED");
}

JNIEXPORT jboolean JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeIsProPatcherLoaded(JNIEnv *env, jclass clazz) {
    (void)env; (void)clazz;
    return JNI_TRUE;
}

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeApplyTuning(
    JNIEnv *env, jclass clazz, jfloat sharpenScale, jint denoiseMode) {
    (void)env; (void)clazz; (void)sharpenScale; (void)denoiseMode;
    // Bypassed: Tuning is applied via real-time NEON SIMD algorithms on HardwareBuffers
    // and InterleavedWriteViewU8 frames (nativeSetFineTuning).
    // Direct .rodata/text segment mprotect is strictly bypassed to guarantee stability
    // and full compatibility on GrapheneOS (W^X security policies) and Pixel 10.
    LOGI("nativeApplyTuning: bypassed for GOS and Pixel 10 memory safety");
}

static inline uint8_t clamp_u8(int v) {
    if (v < 0) return 0;
    if (v > 255) return 255;
    return (uint8_t)v;
}

// ---------------------------------------------------------------------------
// Photographic Tone Curve & Chroma Calibration Engine (Google Tomte Aligned)
// ---------------------------------------------------------------------------

typedef struct {
    float contrast_p;    // Sigmoid exponent (>1.0 = punchy S-curve, <1.0 = soft/log)
    float black_lift;    // Black pedestal in [0.0, 1.0] (lifted film blacks)
    float white_comp;    // White shoulder point in [0.0, 1.0] (highlight roll-off)
    float saturation;    // Chroma saturation factor (0.0 = monochrome, >1.0 = punch)
    float shift_u;       // Blue/Yellow tint (- = yellow/warm, + = blue/cool)
    float shift_v;       // Red/Green tint (+ = red/amber/magenta, - = olive/cyan)
    int is_monochrome;   // 1 for Black Tie (zero chroma)
} LookProfile;

// Calibrated 1:1 profiles corresponding to Google Camera's 13 Look classes:
// 0: Original (Default) -> passthrough
// 1: Natural (Class qvb) -> natural colors & relaxed details
// 2: Minimal (Class qva) -> organic muted desaturation, lifted shadows
// 3: Shadows (Class qvf) -> deep dramatic shadows, cool shadow tone (toned down from 1.35x to 1.18x)
// 4: Vanilla (Class qvc) -> "orange", warm creamy highlights, golden glow
// 5: Digi (Class quy)    -> "digicam", vivid retro-digital punch (toned down from 1.25x to 1.14x)
// 6: Black Tie (Class quw)-> pure fine-art monochrome (toned down from 1.45x to 1.26x for Leica-style roll-off)
// 7: Dijon (Class qvi)   -> "yellow_green_faded", vintage 70s mustard fade
// 8: Buffalo (Class qvg) -> "unflat", rugged bronze textural contrast (toned down from 1.26x to 1.15x)
// 9: Flat (Class qvd)    -> "pesto", cinematic log, lifted blacks, muted (refined log curve)
// 10: Classic (Class qve)-> "portra", Kodak Portra 400 golden film tones
// 11: Editorial (Class quz)-> "kodachrome", refined magazine contrast (toned down from 1.30x/1.20x to 1.16x/1.10x)
// 12: Velvet (Class qvh) -> "velvia", Fuji Velvia rich filmic pop (toned down from 1.25x/1.40x to 1.12x/1.18x)
static const LookProfile s_look_profiles[13] = {
    { 1.00f, 0.0f, 1.0f, 1.00f, 0.0f, 0.0f, 0 },                              // 0: Original
    { 1.02f, 0.0f, 1.0f, 1.02f, 0.0f, 0.0f, 0 },                              // 1: Natural (qvb)
    { 0.92f, 12.0f/255.0f, 248.0f/255.0f, 0.72f, 0.0f, 0.0f, 0 },             // 2: Minimal (qva)
    { 1.18f, 5.0f/255.0f, 252.0f/255.0f, 1.04f, +2.5f, -1.5f, 0 },            // 3: Shadows (qvf)
    { 0.98f, 4.0f/255.0f, 252.0f/255.0f, 1.05f, -4.0f, +3.0f, 0 },            // 4: Vanilla (qvc)
    { 1.14f, 2.0f/255.0f, 253.0f/255.0f, 1.14f, +3.0f, -1.5f, 0 },            // 5: Digi (quy)
    { 1.26f, 0.0f, 1.0f, 0.00f, 0.0f, 0.0f, 1 },                              // 6: Black Tie (quw)
    { 0.95f, 12.0f/255.0f, 245.0f/255.0f, 1.03f, -4.5f, -2.0f, 0 },           // 7: Dijon (qvi)
    { 1.15f, 2.0f/255.0f, 252.0f/255.0f, 1.08f, -3.0f, +3.5f, 0 },            // 8: Buffalo (qvg)
    { 0.86f, 18.0f/255.0f, 238.0f/255.0f, 0.70f, 0.0f, 0.0f, 0 },             // 9: Flat (qvd)
    { 1.06f, 6.0f/255.0f, 250.0f/255.0f, 1.02f, -2.5f, +2.5f, 0 },            // 10: Classic (qve)
    { 1.16f, 0.0f, 1.0f, 1.10f, +1.5f, +2.5f, 0 },                            // 11: Editorial (quz)
    { 1.12f, 2.0f/255.0f, 252.0f/255.0f, 1.18f, 0.0f, +2.0f, 0 }              // 12: Velvet (qvh)
};

static uint8_t s_lut_y[13][256];
static uint8_t s_lut_u[13][256];
static uint8_t s_lut_v[13][256];
static int s_luts_initialized = 0;

static int8_t s_noise_table[512];

static void init_look_luts(void) {
    if (s_luts_initialized) return;

    // Initialize 512-byte cyclic Gaussian/film noise pattern
    uint32_t s = 0x19385721;
    for (int i = 0; i < 512; i++) {
        s ^= s << 13; s ^= s >> 17; s ^= s << 5;
        s_noise_table[i] = (int8_t)((s & 0x1F) - 16); // [-16, 15]
    }

    for (int id = 0; id < 13; id++) {
        const LookProfile* p = &s_look_profiles[id];
        
        // 1. Build Y (Luma) Tone Curve with continuous smooth sigmoid
        for (int i = 0; i < 256; i++) {
            if (id == 0) {
                s_lut_y[id][i] = (uint8_t)i;
                continue;
            }
            float x = (float)i / 255.0f;
            float sig;
            if (x <= 0.0001f) {
                sig = 0.0f;
            } else if (x >= 0.9999f) {
                sig = 1.0f;
            } else {
                float xp = powf(x, p->contrast_p);
                float omxp = powf(1.0f - x, p->contrast_p);
                sig = xp / (xp + omxp);
            }
            float y_out = p->black_lift + sig * (p->white_comp - p->black_lift);
            int val = (int)roundf(y_out * 255.0f);
            s_lut_y[id][i] = clamp_u8(val);
        }

        // 2. Build U and V (Chroma) LUTs with parabolic tapering for highlights and deep shadows
        for (int i = 0; i < 256; i++) {
            if (id == 0) {
                s_lut_u[id][i] = (uint8_t)i;
                s_lut_v[id][i] = (uint8_t)i;
                continue;
            }
            if (p->is_monochrome) {
                s_lut_u[id][i] = 128;
                s_lut_v[id][i] = 128;
            } else {
                float d = (float)(i - 128);
                float d_sat = d * p->saturation;
                float norm_d = fabsf(d) / 128.0f;
                if (norm_d > 1.0f) norm_d = 1.0f;
                float w = 1.0f - norm_d * norm_d; // 1.0 at neutral, 0.0 at saturated extremes
                if (w < 0.0f) w = 0.0f;

                int u_val = (int)roundf(128.0f + d_sat + p->shift_u * w);
                int v_val = (int)roundf(128.0f + d_sat + p->shift_v * w);
                s_lut_u[id][i] = clamp_u8(u_val);
                s_lut_v[id][i] = clamp_u8(v_val);
            }
        }
    }
    s_luts_initialized = 1;
    LOGI("ProPatcher: 13-Look Calibrated Photographic LUTs initialized.");
}

static float s_ft_contrast = 0.0f;
static float s_ft_shadows = 0.0f;
static float s_ft_highlights = 0.0f;
static float s_ft_vibrance = 0.0f;
static float s_ft_tint = 0.0f;
static float s_ft_warmth = 0.0f;
static float s_ft_sharpness = 1.0f;

static uint8_t s_active_lut_y[256];
static uint8_t s_active_lut_u[256];
static uint8_t s_active_lut_v[256];
static uint8_t s_tint_weight[256];
static float s_active_saturation = 1.0f;
static float s_active_shift_u = 0.0f;
static float s_active_shift_v = 0.0f;
static int s_active_look_id = -999;
static float s_last_c = -999.0f, s_last_s = -999.0f, s_last_h = -999.0f, s_last_v = -999.0f, s_last_t = -999.0f, s_last_w = -999.0f, s_last_sh = -999.0f;
static int s_active_lut_valid = 0;

static void update_active_luts(int lookId) {
    if (s_active_lut_valid && s_active_look_id == lookId &&
        s_last_c == s_ft_contrast && s_last_s == s_ft_shadows &&
        s_last_h == s_ft_highlights && s_last_v == s_ft_vibrance &&
        s_last_t == s_ft_tint && s_last_w == s_ft_warmth &&
        s_last_sh == s_ft_sharpness) {
        return;
    }

    const LookProfile* base_p = (lookId >= 0 && lookId < 13) ? &s_look_profiles[lookId] : &s_look_profiles[0];

    // 1. Contrast: sigmoid exponent adjustment
    float eff_contrast_p = base_p->contrast_p;
    if (s_ft_contrast > 0.0f) {
        eff_contrast_p += s_ft_contrast * 0.55f;
    } else if (s_ft_contrast < 0.0f) {
        eff_contrast_p += s_ft_contrast * 0.40f;
    }
    if (eff_contrast_p < 0.45f) eff_contrast_p = 0.45f;
    if (eff_contrast_p > 2.50f) eff_contrast_p = 2.50f;

    // Build Y (Luma) Tone Curve with continuous photographic zone adjustment
    for (int i = 0; i < 256; i++) {
        float x = (float)i / 255.0f;
        float sig;
        if (x <= 0.0001f) {
            sig = 0.0f;
        } else if (x >= 0.9999f) {
            sig = 1.0f;
        } else {
            float xp = powf(x, eff_contrast_p);
            float omxp = powf(1.0f - x, eff_contrast_p);
            sig = xp / (xp + omxp);
        }
        float y_base = base_p->black_lift + sig * (base_p->white_comp - base_p->black_lift);

        // 2. Shadows photographic bell curve:
        // Adjusts shadow zones (0.0 .. 0.60, peak at 0.30), anchored at 0.0 so deep blacks stay deep black
        float delta_s = 0.0f;
        if (x < 0.60f) {
            float ts = x / 0.60f;
            float ws = 4.0f * ts * (1.0f - ts); // Parabolic bell [0 at x=0, 1.0 at x=0.30, 0 at x=0.60]
            delta_s = s_ft_shadows * 0.28f * ws;
        }

        // 3. Highlights photographic bell curve:
        // Adjusts highlight zones (0.40 .. 1.0, peak at 0.70), anchored at 1.0 so specular whites stay clean
        float delta_h = 0.0f;
        if (x > 0.40f) {
            float th = (x - 0.40f) / 0.60f;
            float wh = 4.0f * th * (1.0f - th); // Parabolic bell [0 at x=0.40, 1.0 at x=0.70, 0 at x=1.0]
            delta_h = -s_ft_highlights * 0.28f * wh;
        }

        float y_out = y_base + delta_s + delta_h;
        if (y_out < 0.0f) y_out = 0.0f;
        if (y_out > 1.0f) y_out = 1.0f;
        s_active_lut_y[i] = clamp_u8((int)roundf(y_out * 255.0f));
    }

    // Build Luminance-Weighted Split-Toning weights:
    // Pure shadows (< 24): ramp from 0 to 256 (keeps blacks deep and ink-rich)
    // Midtones (24..205): 256 (full rich photographic tone)
    // Highlights (> 205): ramp down from 256 to 0 (specular whites stay clean)
    for (int i = 0; i < 256; i++) {
        int w = 256;
        if (i < 24) {
            w = (i * 256) / 24;
        } else if (i > 205) {
            w = ((255 - i) * 256) / 50;
        }
        if (w < 0) w = 0;
        if (w > 256) w = 256;
        s_tint_weight[i] = (uint8_t)w;
    }

    // 4. Vibrance (Saturation)
    float eff_saturation = base_p->saturation;
    if (!base_p->is_monochrome) {
        eff_saturation *= (1.0f + 0.70f * s_ft_vibrance);
        if (eff_saturation < 0.0f) eff_saturation = 0.0f;
        if (eff_saturation > 2.50f) eff_saturation = 2.50f;
    }

    // 5. Warmth & Tint (Temperature / tint shift)
    // Warmth shifts along Yellow-Amber / Blue axis: +Warmth decreases U (-24), increases V (+12)
    // Tint shifts along Magenta / Green axis: +Tint decreases U (-15) and increases V (+20)
    float eff_shift_u = base_p->shift_u - (s_ft_warmth * 24.0f) - (s_ft_tint * 15.0f);
    float eff_shift_v = base_p->shift_v + (s_ft_warmth * 12.0f) + (s_ft_tint * 20.0f);

    s_active_saturation = eff_saturation;
    s_active_shift_u = eff_shift_u;
    s_active_shift_v = eff_shift_v;

    // Build U and V (Chroma) LUTs
    for (int i = 0; i < 256; i++) {
        if (base_p->is_monochrome) {
            s_active_lut_u[i] = 128;
            s_active_lut_v[i] = 128;
        } else {
            float d = (float)(i - 128);
            float d_sat = d * eff_saturation;
            float norm_d = fabsf(d) / 128.0f;
            if (norm_d > 1.0f) norm_d = 1.0f;
            float w = 1.0f - norm_d * norm_d;
            if (w < 0.0f) w = 0.0f;

            int u_val = (int)roundf(128.0f + d_sat + eff_shift_u * w);
            int v_val = (int)roundf(128.0f + d_sat + eff_shift_v * w);
            s_active_lut_u[i] = clamp_u8(u_val);
            s_active_lut_v[i] = clamp_u8(v_val);
        }
    }

    s_active_look_id = lookId;
    s_last_c = s_ft_contrast;
    s_last_s = s_ft_shadows;
    s_last_h = s_ft_highlights;
    s_last_v = s_ft_vibrance;
    s_last_t = s_ft_tint;
    s_last_w = s_ft_warmth;
    s_last_sh = s_ft_sharpness;
    s_active_lut_valid = 1;
}

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeSetFineTuning(
    JNIEnv *env, jclass clazz, jfloat contrast, jfloat shadows, jfloat highlights, jfloat vibrance, jfloat tint, jfloat warmth, jfloat sharpness) {
    (void)env; (void)clazz;
    if (s_ft_contrast != contrast || s_ft_shadows != shadows || s_ft_highlights != highlights ||
        s_ft_vibrance != vibrance || s_ft_tint != tint || s_ft_warmth != warmth || s_ft_sharpness != sharpness) {
        s_ft_contrast = contrast;
        s_ft_shadows = shadows;
        s_ft_highlights = highlights;
        s_ft_vibrance = vibrance;
        s_ft_tint = tint;
        s_ft_warmth = warmth;
        s_ft_sharpness = sharpness;
        s_active_lut_valid = 0;
        LOGI("ProPatcher: nativeSetFineTuning: C=%.2f, S=%.2f, H=%.2f, V=%.2f, T=%.2f, W=%.2f, Sh=%.2f",
             contrast, shadows, highlights, vibrance, tint, warmth, sharpness);
    }
}

// 128-bit dual-burst NEON SIMD vector grading for Y plane (Luma) - Bit-exact 256-entry Photographic LUT
static inline void neon_grade_y(uint8_t* y_data, uint32_t width, uint32_t height, uint32_t stride,
                                const uint8_t lut[256]) {
    uint8x16x4_t tab0 = vld1q_u8_x4(lut + 0);
    uint8x16x4_t tab1 = vld1q_u8_x4(lut + 64);
    uint8x16x4_t tab2 = vld1q_u8_x4(lut + 128);
    uint8x16x4_t tab3 = vld1q_u8_x4(lut + 192);
    uint8x16_t v64 = vdupq_n_u8(64);
    uint8x16_t v128 = vdupq_n_u8(128);
    uint8x16_t v192 = vdupq_n_u8(192);

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = y_data + y * stride;
        uint32_t x = 0;

        // 32 bytes per iteration (Dual 128-bit vector burst)
        for (; x + 32 <= width; x += 32) {
            uint8x16_t vy0 = vld1q_u8(row + x);
            uint8x16_t vy1 = vld1q_u8(row + x + 16);

            uint8x16_t r0_0 = vqtbl4q_u8(tab0, vy0);
            uint8x16_t r0_1 = vqtbl4q_u8(tab1, vsubq_u8(vy0, v64));
            uint8x16_t r0_2 = vqtbl4q_u8(tab2, vsubq_u8(vy0, v128));
            uint8x16_t r0_3 = vqtbl4q_u8(tab3, vsubq_u8(vy0, v192));
            uint8x16_t out0 = vorrq_u8(vorrq_u8(r0_0, r0_1), vorrq_u8(r0_2, r0_3));

            uint8x16_t r1_0 = vqtbl4q_u8(tab0, vy1);
            uint8x16_t r1_1 = vqtbl4q_u8(tab1, vsubq_u8(vy1, v64));
            uint8x16_t r1_2 = vqtbl4q_u8(tab2, vsubq_u8(vy1, v128));
            uint8x16_t r1_3 = vqtbl4q_u8(tab3, vsubq_u8(vy1, v192));
            uint8x16_t out1 = vorrq_u8(vorrq_u8(r1_0, r1_1), vorrq_u8(r1_2, r1_3));

            vst1q_u8(row + x, out0);
            vst1q_u8(row + x + 16, out1);
        }

        for (; x + 16 <= width; x += 16) {
            uint8x16_t vy = vld1q_u8(row + x);
            uint8x16_t r0 = vqtbl4q_u8(tab0, vy);
            uint8x16_t r1 = vqtbl4q_u8(tab1, vsubq_u8(vy, v64));
            uint8x16_t r2 = vqtbl4q_u8(tab2, vsubq_u8(vy, v128));
            uint8x16_t r3 = vqtbl4q_u8(tab3, vsubq_u8(vy, v192));
            uint8x16_t out = vorrq_u8(vorrq_u8(r0, r1), vorrq_u8(r2, r3));
            vst1q_u8(row + x, out);
        }

        for (; x < width; x++) {
            row[x] = lut[row[x]];
        }
    }
}

// 128-bit dual-burst NEON SIMD vector grading for NV12/NV21 UV plane (Chroma)
static inline void neon_grade_uv_nv12(uint8_t* uv_data, uint32_t width, uint32_t uv_h, uint32_t stride,
                                      int16_t scale_q8, int16_t shift_even, int16_t shift_odd) {
    if (scale_q8 == 0 && shift_even == 0 && shift_odd == 0) {
        for (uint32_t y = 0; y < uv_h; y++) {
            memset(uv_data + y * stride, 128, width);
        }
        return;
    }
    if (scale_q8 == 256 && shift_even == 0 && shift_odd == 0) return;

    int16x4_t v_scale = vdup_n_s16(scale_q8);
    int16x8_t v_128 = vdupq_n_s16(128);
    int16_t shifts[8] = { shift_even, shift_odd, shift_even, shift_odd, shift_even, shift_odd, shift_even, shift_odd };
    int16x8_t v_shifts = vld1q_s16(shifts);
    int16x4_t v_shift_lo = vget_low_s16(v_shifts);
    int16x4_t v_shift_hi = vget_high_s16(v_shifts);

    for (uint32_t y = 0; y < uv_h; y++) {
        uint8_t* row = uv_data + y * stride;
        uint32_t x = 0;

        // 32 bytes per iteration (Dual 128-bit vector burst = 16 UV pairs)
        for (; x + 32 <= width; x += 32) {
            uint8x16_t v0 = vld1q_u8(row + x);
            uint8x16_t v1 = vld1q_u8(row + x + 16);

            int16x8_t w0_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(v0))), v_128);
            int16x8_t w0_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(v0))), v_128);
            int16x8_t w1_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(v1))), v_128);
            int16x8_t w1_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(v1))), v_128);

            // w0_lo
            int32x4_t p0_lo0 = vmull_s16(vget_low_s16(w0_lo), v_scale);
            int32x4_t p0_lo1 = vmull_s16(vget_high_s16(w0_lo), v_scale);
            int32x4_t s0_lo0 = vaddw_s16(vshrq_n_s32(p0_lo0, 8), v_shift_lo);
            int32x4_t s0_lo1 = vaddw_s16(vshrq_n_s32(p0_lo1, 8), v_shift_hi);
            int16x8_t r0_lo = vaddq_s16(vcombine_s16(vqmovn_s32(s0_lo0), vqmovn_s32(s0_lo1)), v_128);

            // w0_hi
            int32x4_t p0_hi0 = vmull_s16(vget_low_s16(w0_hi), v_scale);
            int32x4_t p0_hi1 = vmull_s16(vget_high_s16(w0_hi), v_scale);
            int32x4_t s0_hi0 = vaddw_s16(vshrq_n_s32(p0_hi0, 8), v_shift_lo);
            int32x4_t s0_hi1 = vaddw_s16(vshrq_n_s32(p0_hi1, 8), v_shift_hi);
            int16x8_t r0_hi = vaddq_s16(vcombine_s16(vqmovn_s32(s0_hi0), vqmovn_s32(s0_hi1)), v_128);

            // w1_lo
            int32x4_t p1_lo0 = vmull_s16(vget_low_s16(w1_lo), v_scale);
            int32x4_t p1_lo1 = vmull_s16(vget_high_s16(w1_lo), v_scale);
            int32x4_t s1_lo0 = vaddw_s16(vshrq_n_s32(p1_lo0, 8), v_shift_lo);
            int32x4_t s1_lo1 = vaddw_s16(vshrq_n_s32(p1_lo1, 8), v_shift_hi);
            int16x8_t r1_lo = vaddq_s16(vcombine_s16(vqmovn_s32(s1_lo0), vqmovn_s32(s1_lo1)), v_128);

            // w1_hi
            int32x4_t p1_hi0 = vmull_s16(vget_low_s16(w1_hi), v_scale);
            int32x4_t p1_hi1 = vmull_s16(vget_high_s16(w1_hi), v_scale);
            int32x4_t s1_hi0 = vaddw_s16(vshrq_n_s32(p1_hi0, 8), v_shift_lo);
            int32x4_t s1_hi1 = vaddw_s16(vshrq_n_s32(p1_hi1, 8), v_shift_hi);
            int16x8_t r1_hi = vaddq_s16(vcombine_s16(vqmovn_s32(s1_hi0), vqmovn_s32(s1_hi1)), v_128);

            vst1q_u8(row + x, vcombine_u8(vqmovun_s16(r0_lo), vqmovun_s16(r0_hi)));
            vst1q_u8(row + x + 16, vcombine_u8(vqmovun_s16(r1_lo), vqmovun_s16(r1_hi)));
        }

        for (; x + 16 <= width; x += 16) {
            uint8x16_t v = vld1q_u8(row + x);
            int16x8_t w_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(v))), v_128);
            int16x8_t w_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(v))), v_128);

            int32x4_t p0 = vmull_s16(vget_low_s16(w_lo), v_scale);
            int32x4_t p1 = vmull_s16(vget_high_s16(w_lo), v_scale);
            int32x4_t s0 = vaddw_s16(vshrq_n_s32(p0, 8), v_shift_lo);
            int32x4_t s1 = vaddw_s16(vshrq_n_s32(p1, 8), v_shift_hi);
            int16x8_t r_lo = vaddq_s16(vcombine_s16(vqmovn_s32(s0), vqmovn_s32(s1)), v_128);

            int32x4_t p2 = vmull_s16(vget_low_s16(w_hi), v_scale);
            int32x4_t p3 = vmull_s16(vget_high_s16(w_hi), v_scale);
            int32x4_t s2 = vaddw_s16(vshrq_n_s32(p2, 8), v_shift_lo);
            int32x4_t s3 = vaddw_s16(vshrq_n_s32(p3, 8), v_shift_hi);
            int16x8_t r_hi = vaddq_s16(vcombine_s16(vqmovn_s32(s2), vqmovn_s32(s3)), v_128);

            vst1q_u8(row + x, vcombine_u8(vqmovun_s16(r_lo), vqmovun_s16(r_hi)));
        }

        for (; x < width; x += 2) {
            int u = ((int)row[x] - 128) * (int)scale_q8 / 256 + (int)shift_even + 128;
            int v = ((int)row[x+1] - 128) * (int)scale_q8 / 256 + (int)shift_odd + 128;
            row[x] = clamp_u8(u);
            row[x+1] = clamp_u8(v);
        }
    }
}

// Human skin tone detection in sRGB space across Fitzpatrick types I-VI
static inline int is_skin_tone(int r, int g, int b, int luma) {
    if (luma < 25 || luma > 230) return 0;
    if (r > g && g >= b) {
        int rg = r - g;
        int gb = g - b;
        int rb = r - b;
        // Melanin hue locus: warm red-dominant, bounded green-blue separation
        if (rg >= 8 && rg <= 95 && gb >= 4 && gb <= 85 && rb >= 14 && rb <= 150) {
            return 1;
        }
    }
    return 0;
}

// Photographic color grading for RGB (3 channels) or RGBA (4 channels) frames with:
// 1. Adaptive 2D Luma Laplacian Acutance / Sharpening & Micro-contrast
// 2. Ratio-Preserving Luminance Scaling (eliminates blown highlights & color shifts)
// 3. Filmic Highlight Roll-off (soft desaturation knee prevents harsh channel clipping)
// 4. Smart Vibrance & Skin Tone Protection (preserves natural facial tones without sunburn)
// 5. Luminance-Weighted Split-Toning (deep blacks & clean specular whites)
static inline void lut_grade_raster(uint8_t* data, uint32_t width, uint32_t height, uint32_t channels, uint32_t stride,
                                    const uint8_t lut_y[256], float sat, float shift_u, float shift_v, int is_monochrome,
                                    float sharpness) {
    int s_q8 = (int)roundf(sat * 256.0f);
    int s_r = (int)roundf(shift_v * 1.402f);
    int s_g = (int)roundf(-0.344136f * shift_u - 0.714136f * shift_v);
    int s_b = (int)roundf(shift_u * 1.772f);
    int grain_on = s_grain_enabled;
    int apply_sharpness = (fabsf(sharpness - 1.0f) >= 0.02f);
    int sharp_mult = apply_sharpness ? (int)roundf((sharpness - 1.0f) * 160.0f) : 0;

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = data + y * stride;
        const uint8_t* prev_row = (y > 0) ? (data + (y - 1) * stride) : row;
        const uint8_t* next_row = (y + 1 < height) ? (data + (y + 1) * stride) : row;
        uint32_t y_offset = (y * 79) & 0xFF;

        if (is_monochrome) {
            for (uint32_t x = 0; x < width; x++) {
                uint8_t* pix = row + x * channels;
                uint8_t gray = (uint8_t)((pix[0]*77 + pix[1]*150 + pix[2]*29) >> 8);
                int delta_sharp = 0;
                if (apply_sharpness) {
                    uint32_t left_x = (x > 0) ? (x - 1) : x;
                    uint32_t right_x = (x + 1 < width) ? (x + 1) : x;
                    const uint8_t* pix_up = prev_row + x * channels;
                    const uint8_t* pix_down = next_row + x * channels;
                    const uint8_t* pix_left = row + left_x * channels;
                    const uint8_t* pix_right = row + right_x * channels;

                    int l_up = (pix_up[0]*77 + pix_up[1]*150 + pix_up[2]*29) >> 8;
                    int l_down = (pix_down[0]*77 + pix_down[1]*150 + pix_down[2]*29) >> 8;
                    int l_left = (pix_left[0]*77 + pix_left[1]*150 + pix_left[2]*29) >> 8;
                    int l_right = (pix_right[0]*77 + pix_right[1]*150 + pix_right[2]*29) >> 8;

                    int laplacian = ((int)gray << 2) - l_up - l_down - l_left - l_right;
                    delta_sharp = (laplacian * sharp_mult) >> 8;
                    if (delta_sharp > 26) delta_sharp = 26;
                    if (delta_sharp < -26) delta_sharp = -26;
                }
                uint8_t out = clamp_u8((int)lut_y[gray] + delta_sharp);
                if (grain_on) {
                    int n = s_noise_table[(y_offset + x) & 0xFF];
                    int mw = 255 - abs((int)gray * 2 - 255);
                    out = clamp_u8((int)out + ((n * mw) >> 10));
                }
                pix[0] = out; pix[1] = out; pix[2] = out;
            }
        } else {
            for (uint32_t x = 0; x < width; x++) {
                uint8_t* pix = row + x * channels;
                int r = pix[0], g = pix[1], b = pix[2];
                int luma = (r * 77 + g * 150 + b * 29) >> 8;

                int delta_sharp = 0;
                if (apply_sharpness) {
                    uint32_t left_x = (x > 0) ? (x - 1) : x;
                    uint32_t right_x = (x + 1 < width) ? (x + 1) : x;
                    const uint8_t* pix_up = prev_row + x * channels;
                    const uint8_t* pix_down = next_row + x * channels;
                    const uint8_t* pix_left = row + left_x * channels;
                    const uint8_t* pix_right = row + right_x * channels;

                    int l_up = (pix_up[0]*77 + pix_up[1]*150 + pix_up[2]*29) >> 8;
                    int l_down = (pix_down[0]*77 + pix_down[1]*150 + pix_down[2]*29) >> 8;
                    int l_left = (pix_left[0]*77 + pix_left[1]*150 + pix_left[2]*29) >> 8;
                    int l_right = (pix_right[0]*77 + pix_right[1]*150 + pix_right[2]*29) >> 8;

                    int laplacian = (luma << 2) - l_up - l_down - l_left - l_right;
                    delta_sharp = (laplacian * sharp_mult) >> 8;
                    if (delta_sharp > 26) delta_sharp = 26;
                    if (delta_sharp < -26) delta_sharp = -26;
                }

                int graded_luma = clamp_u8((int)lut_y[luma] + delta_sharp);

                // 1. Ratio-Preserving Luminance Scaling
                int r_tone, g_tone, b_tone;
                if (luma == 0) {
                    r_tone = graded_luma;
                    g_tone = graded_luma;
                    b_tone = graded_luma;
                } else {
                    r_tone = (r * graded_luma) / luma;
                    g_tone = (g * graded_luma) / luma;
                    b_tone = (b * graded_luma) / luma;

                    // Filmic Highlight Roll-off (Soft desaturation knee if any channel overshoots 255)
                    int max_c = r_tone;
                    if (g_tone > max_c) max_c = g_tone;
                    if (b_tone > max_c) max_c = b_tone;
                    if (max_c > 255 && max_c > graded_luma) {
                        int numer = max_c - 255;
                        int denom = max_c - graded_luma;
                        r_tone = r_tone - (numer * (r_tone - graded_luma)) / denom;
                        g_tone = g_tone - (numer * (g_tone - graded_luma)) / denom;
                        b_tone = b_tone - (numer * (b_tone - graded_luma)) / denom;
                    }
                }

                // 2. Smart Vibrance & Skin Tone Protection
                int eff_sq8 = s_q8;
                if (is_skin_tone(r, g, b, luma)) {
                    if (s_q8 > 256) {
                        // Damp saturation boost by ~62% on human skin to prevent reddish/sunburnt faces
                        eff_sq8 = 256 + ((s_q8 - 256) * 3) / 8;
                    } else if (s_q8 < 256) {
                        // Gentle desaturation on skin to avoid sickly/grey faces
                        eff_sq8 = 256 - ((256 - s_q8) * 5) / 8;
                    }
                }

                int r_sat = graded_luma + (((r_tone - graded_luma) * eff_sq8) >> 8);
                int g_sat = graded_luma + (((g_tone - graded_luma) * eff_sq8) >> 8);
                int b_sat = graded_luma + (((b_tone - graded_luma) * eff_sq8) >> 8);

                // 3. Luminance-Weighted Split-Toning (Deep Blacks & Clean Whites)
                int tw = s_tint_weight[graded_luma];
                int tint_r = (s_r * tw) >> 8;
                int tint_g = (s_g * tw) >> 8;
                int tint_b = (s_b * tw) >> 8;

                // 4. Optional Film Grain
                int gr = 0;
                if (grain_on) {
                    int n = s_noise_table[(y_offset + x) & 0xFF];
                    int mw = 255 - abs(graded_luma * 2 - 255);
                    gr = (n * mw) >> 10;
                }

                pix[0] = clamp_u8(r_sat + tint_r + gr);
                pix[1] = clamp_u8(g_sat + tint_g + gr);
                pix[2] = clamp_u8(b_sat + tint_b + gr);
            }
        }
    }
}

static inline void neon_grade_rgba(uint8_t* data, uint32_t width, uint32_t height, uint32_t stride,
                                   const uint8_t lut[256], int is_monochrome) {
    uint8x16x4_t tab0 = vld1q_u8_x4(lut + 0);
    uint8x16x4_t tab1 = vld1q_u8_x4(lut + 64);
    uint8x16x4_t tab2 = vld1q_u8_x4(lut + 128);
    uint8x16x4_t tab3 = vld1q_u8_x4(lut + 192);
    uint8x16_t v64 = vdupq_n_u8(64);
    uint8x16_t v128 = vdupq_n_u8(128);
    uint8x16_t v192 = vdupq_n_u8(192);

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = data + y * stride;
        uint32_t x = 0;
        if (is_monochrome) {
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                uint8_t gray = (uint8_t)((pix[0]*77 + pix[1]*150 + pix[2]*29) >> 8);
                uint8_t out = lut[gray];
                pix[0] = out; pix[1] = out; pix[2] = out;
            }
        } else {
            for (; x + 16 <= width; x += 16) {
                uint8x16x4_t rgba = vld4q_u8(row + x * 4);

                uint8x16_t r0 = vqtbl4q_u8(tab0, rgba.val[0]);
                uint8x16_t r1 = vqtbl4q_u8(tab1, vsubq_u8(rgba.val[0], v64));
                uint8x16_t r2 = vqtbl4q_u8(tab2, vsubq_u8(rgba.val[0], v128));
                uint8x16_t r3 = vqtbl4q_u8(tab3, vsubq_u8(rgba.val[0], v192));
                rgba.val[0] = vorrq_u8(vorrq_u8(r0, r1), vorrq_u8(r2, r3));

                uint8x16_t g0 = vqtbl4q_u8(tab0, rgba.val[1]);
                uint8x16_t g1 = vqtbl4q_u8(tab1, vsubq_u8(rgba.val[1], v64));
                uint8x16_t g2 = vqtbl4q_u8(tab2, vsubq_u8(rgba.val[1], v128));
                uint8x16_t g3 = vqtbl4q_u8(tab3, vsubq_u8(rgba.val[1], v192));
                rgba.val[1] = vorrq_u8(vorrq_u8(g0, g1), vorrq_u8(g2, g3));

                uint8x16_t b0 = vqtbl4q_u8(tab0, rgba.val[2]);
                uint8x16_t b1 = vqtbl4q_u8(tab1, vsubq_u8(rgba.val[2], v64));
                uint8x16_t b2 = vqtbl4q_u8(tab2, vsubq_u8(rgba.val[2], v128));
                uint8x16_t b3 = vqtbl4q_u8(tab3, vsubq_u8(rgba.val[2], v192));
                rgba.val[2] = vorrq_u8(vorrq_u8(b0, b1), vorrq_u8(b2, b3));

                vst4q_u8(row + x * 4, rgba);
            }
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                pix[0] = lut[pix[0]];
                pix[1] = lut[pix[1]];
                pix[2] = lut[pix[2]];
            }
        }
    }
}

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeProcessHardwareBuffer(
    JNIEnv *env, jclass clazz, jobject hwBuffer, jint lookId) {
    (void)clazz;
    if (!hwBuffer || lookId < 0 || lookId > 12) return;

    int has_fine_tuning = (fabsf(s_ft_contrast) > 0.01f ||
                           fabsf(s_ft_shadows) > 0.01f ||
                           fabsf(s_ft_highlights) > 0.01f ||
                           fabsf(s_ft_vibrance) > 0.01f ||
                           fabsf(s_ft_tint) > 0.01f ||
                           fabsf(s_ft_warmth) > 0.01f ||
                           fabsf(s_ft_sharpness - 1.0f) > 0.02f);

    if (lookId == 0 && !has_fine_tuning) {
        return;
    }

    if (!s_luts_initialized) {
        init_look_luts();
    }

    update_active_luts(lookId);

    const LookProfile* prof = (lookId >= 0 && lookId < 13) ? &s_look_profiles[lookId] : &s_look_profiles[0];
    const uint8_t* lut_y = s_active_lut_y;

    float eff_saturation = prof->saturation;
    if (!prof->is_monochrome) {
        eff_saturation *= (1.0f + 0.70f * s_ft_vibrance);
        if (eff_saturation < 0.0f) eff_saturation = 0.0f;
        if (eff_saturation > 2.50f) eff_saturation = 2.50f;
    }
    int16_t scale_uv = prof->is_monochrome ? 0 : (int16_t)roundf(eff_saturation * 256.0f);
    if (scale_uv < 0) scale_uv = 0;

    float eff_shift_u = prof->shift_u - (s_ft_warmth * 24.0f) - (s_ft_tint * 15.0f);
    float eff_shift_v = prof->shift_v + (s_ft_warmth * 12.0f) + (s_ft_tint * 20.0f);
    int16_t shift_u = (int16_t)roundf(eff_shift_u);
    int16_t shift_v = (int16_t)roundf(eff_shift_v);
    int is_monochrome = prof->is_monochrome;

    AHardwareBuffer* buffer = AHardwareBuffer_fromHardwareBuffer(env, hwBuffer);
    if (!buffer) return;

    AHardwareBuffer_Desc desc;
    AHardwareBuffer_describe(buffer, &desc);

    AHardwareBuffer_Planes planes;
    int res = AHardwareBuffer_lockPlanes(buffer,
        AHARDWAREBUFFER_USAGE_CPU_READ_OFTEN | AHARDWAREBUFFER_USAGE_CPU_WRITE_OFTEN,
        -1, NULL, &planes);

    if (res != 0) {
        res = AHardwareBuffer_lockPlanes(buffer,
            AHARDWAREBUFFER_USAGE_CPU_WRITE_OFTEN,
            -1, NULL, &planes);
    }

    int is_rgba = (desc.format == 1 || desc.format == 2 || desc.format == 3);

    if (res != 0) {
        void* virt = NULL;
        res = AHardwareBuffer_lock(buffer,
            AHARDWAREBUFFER_USAGE_CPU_WRITE_OFTEN,
            -1, NULL, &virt);
        if (res == 0 && virt) {
            if (is_rgba) {
                neon_grade_rgba((uint8_t*)virt, desc.width, desc.height, desc.stride * 4,
                                lut_y, is_monochrome);
            } else {
                uint32_t y_size = desc.stride * desc.height;
                neon_grade_y((uint8_t*)virt, desc.width, desc.height, desc.stride, lut_y);
                uint8_t* uv_data = (uint8_t*)virt + y_size;
                uint32_t uv_h = desc.height / 2;
                if (is_monochrome) {
                    for (uint32_t y = 0; y < uv_h; y++) {
                        memset(uv_data + y * desc.stride, 128, desc.width);
                    }
                } else {
                    neon_grade_uv_nv12(uv_data, desc.width, uv_h, desc.stride, scale_uv, shift_u, shift_v);
                }
            }
            AHardwareBuffer_unlock(buffer, NULL);
            return;
        }
        return;
    }

    uint32_t width = desc.width;
    uint32_t height = desc.height;

    if (is_rgba) {
        neon_grade_rgba((uint8_t*)planes.planes[0].data, width, height,
                        planes.planes[0].rowStride, lut_y, is_monochrome);
    } else if (planes.planeCount == 1) {
        uint32_t y_size = planes.planes[0].rowStride * height;
        neon_grade_y((uint8_t*)planes.planes[0].data, width, height,
                     planes.planes[0].rowStride, lut_y);
        uint8_t* uv_data = (uint8_t*)planes.planes[0].data + y_size;
        uint32_t uv_h = (height + 1) / 2;
        if (is_monochrome) {
            for (uint32_t y = 0; y < uv_h; y++) {
                memset(uv_data + y * planes.planes[0].rowStride, 128, width);
            }
        } else {
            neon_grade_uv_nv12(uv_data, width, uv_h, planes.planes[0].rowStride, scale_uv, shift_u, shift_v);
        }
    } else {
        neon_grade_y((uint8_t*)planes.planes[0].data, width, height,
                     planes.planes[0].rowStride, lut_y);

        uint32_t uv_h = (height + 1) / 2;
        int is_interleaved = (planes.planeCount >= 2 && planes.planes[1].pixelStride == 2);
        if (!is_interleaved && planes.planeCount == 2) {
            is_interleaved = 1;
        }

        if (is_interleaved) {
            uint32_t uv_stride = planes.planes[1].rowStride ? planes.planes[1].rowStride : width;
            uint8_t* uv_data = (uint8_t*)planes.planes[1].data;
            int16_t shift_even = shift_u;
            int16_t shift_odd = shift_v;

            if (planes.planeCount >= 3 && planes.planes[2].data && planes.planes[2].data < planes.planes[1].data) {
                uv_data = (uint8_t*)planes.planes[2].data;
                shift_even = shift_v;
                shift_odd = shift_u;
            }

            if (is_monochrome) {
                for (uint32_t y = 0; y < uv_h; y++) {
                    memset(uv_data + y * uv_stride, 128, width);
                }
            } else {
                neon_grade_uv_nv12(uv_data, width, uv_h, uv_stride, scale_uv, shift_even, shift_odd);
            }
        }
    }

    AHardwareBuffer_unlock(buffer, NULL);
}

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeProcessRasterImage(
    JNIEnv *env, jclass clazz, jlong dataPtr, jint width, jint height, jint channels, jint stride, jint lookId) {
    (void)env; (void)clazz;
    if (dataPtr == 0 || width <= 0 || height <= 0 || (channels != 3 && channels != 4) || stride <= 0) {
        LOGE("nativeProcessRasterImage: invalid arguments (ptr=0x%lx, w=%d, h=%d, ch=%d, stride=%d)",
             (unsigned long)dataPtr, width, height, channels, stride);
        return;
    }

    if (lookId < 0 || lookId > 12) lookId = 0;

    int has_fine_tuning = (fabsf(s_ft_contrast) > 0.01f ||
                           fabsf(s_ft_shadows) > 0.01f ||
                           fabsf(s_ft_highlights) > 0.01f ||
                           fabsf(s_ft_vibrance) > 0.01f ||
                           fabsf(s_ft_tint) > 0.01f ||
                           fabsf(s_ft_warmth) > 0.01f ||
                           fabsf(s_ft_sharpness - 1.0f) > 0.02f);

    if (lookId == 0 && !has_fine_tuning) {
        return;
    }

    if (!s_luts_initialized) {
        init_look_luts();
    }

    update_active_luts(lookId);

    const uint8_t* lut_y = s_active_lut_y;
    const LookProfile* prof = (lookId >= 0 && lookId < 13) ? &s_look_profiles[lookId] : &s_look_profiles[0];
    int is_monochrome = prof->is_monochrome;

    float sat = s_active_saturation;
    float shift_u = s_active_shift_u;
    float shift_v = s_active_shift_v;
    float sharpness = s_ft_sharpness;

    LOGI("ProPatcher: Grading Captured Photo: %dx%d (%d channels, stride=%d), Look=%d, Mono=%d, Sat=%.2f, U_shift=%.1f, V_shift=%.1f, Sharp=%.2f",
         width, height, channels, stride, lookId, is_monochrome, sat, shift_u, shift_v, sharpness);

    lut_grade_raster((uint8_t*)dataPtr, (uint32_t)width, (uint32_t)height, (uint32_t)channels, (uint32_t)stride,
                     lut_y, sat, shift_u, shift_v, is_monochrome, sharpness);
}


