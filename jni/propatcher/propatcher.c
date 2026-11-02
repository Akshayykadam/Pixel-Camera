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

#define TUNING_START_OFFSET 0x1969000
#define TUNING_SIZE         0xB000
#define TOC_START_OFFSET    0x79f0000
#define TOC_END_OFFSET      0x7a05000

typedef struct {
    uint64_t p_name;
    uint64_t p_data;
    uint64_t sz;
    uint64_t h1;
    uint64_t h2;
} __attribute__((packed)) TocEntry;

static uint8_t s_backup[TUNING_SIZE];
static int s_backup_initialized = 0;
static uintptr_t s_cached_base = 0;

static int phdr_callback(struct dl_phdr_info *info, size_t size, void *data) {
    (void)size;
    const char* target = (const char*)data;
    if (info->dlpi_name && strstr(info->dlpi_name, target)) {
        s_cached_base = (uintptr_t)info->dlpi_addr;
        LOGI("dl_iterate_phdr found %s at dlpi_addr: 0x%lx (path: %s)",
             target, (unsigned long)s_cached_base, info->dlpi_name);
        return 1;
    }
    return 0;
}

static uintptr_t get_module_base(const char* module_name) {
    if (s_cached_base != 0) return s_cached_base;

    // 1. dl_iterate_phdr scans all loaded ELFs in process memory
    dl_iterate_phdr(phdr_callback, (void*)module_name);
    if (s_cached_base != 0) return s_cached_base;

    // 2. Try dlopen RTLD_NOLOAD / RTLD_NOW
    void* handle = dlopen(module_name, RTLD_NOLOAD);
    if (!handle) {
        handle = dlopen(module_name, RTLD_NOW | RTLD_GLOBAL);
    }
    if (handle) {
        dl_iterate_phdr(phdr_callback, (void*)module_name);
        if (s_cached_base != 0) return s_cached_base;
    }

    // 3. Fallback: scan /proc/self/maps
    FILE* fp = fopen("/proc/self/maps", "r");
    if (!fp) {
        LOGE("Failed to open /proc/self/maps");
        return 0;
    }
    char line[512];
    uintptr_t base = 0;
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, module_name)) {
            base = (uintptr_t)strtoull(line, NULL, 16);
            break;
        }
    }
    fclose(fp);
    if (base != 0) {
        s_cached_base = base;
        LOGI("Found %s base via maps: 0x%lx", module_name, (unsigned long)base);
    }
    return base;
}

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
    (void)env; (void)clazz;

    uintptr_t base = get_module_base("libgcastartup.so");
    if (!base) {
        LOGE("libgcastartup.so not loaded yet, skipping nativeApplyTuning");
        return;
    }

    // Dynamic Tuning Curves Scaling in .rodata (Sharpen & Denoise)
    uintptr_t tuning_addr = base + TUNING_START_OFFSET;
    uintptr_t page_size = sysconf(_SC_PAGESIZE);
    uintptr_t page_start = tuning_addr & ~(page_size - 1);
    uintptr_t page_end = (tuning_addr + TUNING_SIZE + page_size - 1) & ~(page_size - 1);
    size_t protect_len = page_end - page_start;

    // Backup stock curves on first call
    if (!s_backup_initialized) {
        memcpy(s_backup, (const void*)tuning_addr, TUNING_SIZE);
        s_backup_initialized = 1;
        LOGI("Initialized stock tuning backup buffer (44 KB) at 0x%lx", (unsigned long)tuning_addr);
    }

    if (mprotect((void*)page_start, protect_len, PROT_READ | PROT_WRITE) != 0) {
        LOGE("mprotect write failed at 0x%lx (len 0x%zx): %s (errno=%d)",
             (unsigned long)page_start, protect_len, strerror(errno), errno);
        return;
    }

    int patched_sharpen_files = 0;
    int patched_sharpen_floats = 0;
    int patched_dering_floats = 0;
    int patched_denoise_files = 0;
    int patched_denoise_floats = 0;

    float denoiseScale = 1.0f;
    if (denoiseMode == 0) denoiseScale = 0.001f;      // Off: disable bilateral spatial smoothing
    else if (denoiseMode == 1) denoiseScale = 0.40f;  // Minimal / Low: restrained smoothing preserving shadow microtextures
    else denoiseScale = 1.0f;                         // Standard: stock Google bilateral curve

    uintptr_t tuning_start = base + TUNING_START_OFFSET;
    uintptr_t tuning_end = tuning_start + TUNING_SIZE;

    // Standard mode (1.00x sharpen & stock denoise mode 2): directly restore 100% bit-for-bit stock curves
    if (fabsf(sharpenScale - 1.0f) < 0.001f && denoiseMode == 2) {
        if (s_backup_initialized) {
            memcpy((void*)tuning_start, s_backup, TUNING_SIZE);
            LOGI("Dynamic Tuning Applied: Standard Mode - Restored 100%% stock tuning curves bit-for-bit from backup buffer (Sharpen=1.00x, Denoise=Stock)");
        }
        mprotect((void*)page_start, protect_len, PROT_READ);
        return;
    }

    for (uintptr_t toc_ptr = base + TOC_START_OFFSET; toc_ptr < base + TOC_END_OFFSET; toc_ptr += sizeof(TocEntry)) {
        TocEntry* entry = (TocEntry*)toc_ptr;
        uintptr_t data_addr = (uintptr_t)entry->p_data;
        if (data_addr >= tuning_start && data_addr + entry->sz <= tuning_end &&
            entry->sz > 0 && entry->sz < 10000) {
            
            const char* name = (const char*)entry->p_name;
            uintptr_t rel_offset = data_addr - tuning_start;

            // Handle Sharpen & De-Ring assets
            if (strstr(name, "sharpen_")) {
                patched_sharpen_files++;
                int is_tele = (strstr(name, "tele") != NULL);
                // Issue 11 fix: Telephoto optics (5x/10x periscope) require full unsharp masking
                // to overcome aperture diffraction and optical softness. When edge control is lowered
                // (Natural 0.5x or Soft 0.0x), exempt telephoto curves so telephoto keeps 100% acutance
                // and stock de-ring suppression, while wide/ultrawide have edge halos eliminated.
                float asset_sharpen_scale = is_tele ? fmaxf(1.0f, sharpenScale) : sharpenScale;
                float asset_dering_scale  = is_tele ? 1.0f : (0.25f + 0.75f * sharpenScale);

                size_t off = 0;
                while (off + 5 <= entry->sz) {
                    uint8_t tag = s_backup[rel_offset + off];
                    if (tag == 0x0d) { // Field 1: fixed32 gain
                        float orig_val;
                        memcpy(&orig_val, &s_backup[rel_offset + off + 1], sizeof(float));
                        if (orig_val >= 0.01f && orig_val <= 50.0f) {
                            float new_val = orig_val * asset_sharpen_scale;
                            memcpy((void*)(data_addr + off + 1), &new_val, sizeof(float));
                            patched_sharpen_floats++;
                        }
                        off += 5;
                    } else if (tag == 0x2d) { // Field 5: fixed32 de-ring / halo suppression ratio
                        float orig_val;
                        memcpy(&orig_val, &s_backup[rel_offset + off + 1], sizeof(float));
                        if (orig_val >= 0.01f && orig_val <= 10.0f) {
                            // When soft (0.0x) or natural (0.5x), clamp overshoot to eliminate edge ringing
                            float new_val = orig_val * asset_dering_scale;
                            memcpy((void*)(data_addr + off + 1), &new_val, sizeof(float));
                            patched_dering_floats++;
                        }
                        off += 5;
                    } else {
                        off++;
                    }
                }
            }
            // Handle Denoise assets (luma_denoise_*, chroma_denoise, sky_luma_denoise)
            else if (strstr(name, "denoise")) {
                patched_denoise_files++;
                size_t off = 0;
                while (off + 5 <= entry->sz) {
                    uint8_t tag = s_backup[rel_offset + off];
                    if (tag == 0x0d) { // Field 1: fixed32 filter strength / sigma
                        float orig_val;
                        memcpy(&orig_val, &s_backup[rel_offset + off + 1], sizeof(float));
                        if (orig_val >= 0.01f && orig_val <= 50.0f) {
                            float new_val = orig_val * denoiseScale;
                            memcpy((void*)(data_addr + off + 1), &new_val, sizeof(float));
                            patched_denoise_floats++;
                        }
                        off += 5;
                    } else {
                        off++;
                    }
                }
            }
        }
    }

    mprotect((void*)page_start, protect_len, PROT_READ);

    LOGI("Dynamic Tuning Applied: Sharpen=%.2fx (%d assets, %d gains, %d de-rings), Denoise=%.3fx (mode=%d, %d assets, %d floats)",
         sharpenScale, patched_sharpen_files, patched_sharpen_floats, patched_dering_floats,
         denoiseScale, denoiseMode, patched_denoise_files, patched_denoise_floats);
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
// 3: Shadows (Class qvf) -> deep dramatic shadows, cool shadow tone
// 4: Vanilla (Class qvc) -> "orange", warm creamy highlights, golden glow
// 5: Digi (Class quy)    -> "digicam", vivid retro-digital punch
// 6: Black Tie (Class quw)-> pure fine-art monochrome
// 7: Dijon (Class qvi)   -> "yellow_green_faded", vintage 70s mustard fade
// 8: Buffalo (Class qvg) -> "unflat", rugged bronze textural contrast
// 9: Flat (Class qvd)    -> "pesto", cinematic log, lifted blacks, muted
// 10: Classic (Class qve)-> "portra", Kodak Portra 400 golden film tones
// 11: Editorial (Class quz)-> "kodachrome", high contrast magazine punch
// 12: Velvet (Class qvh) -> "velvia", Fuji Velvia ultra-rich saturated pop
static const LookProfile s_look_profiles[13] = {
    { 1.00f, 0.0f, 1.0f, 1.00f, 0.0f, 0.0f, 0 },                     // 0: Original
    { 1.02f, 0.0f, 1.0f, 1.02f, 0.0f, 0.0f, 0 },                     // 1: Natural (qvb)
    { 0.90f, 14.0f/255.0f, 246.0f/255.0f, 0.65f, 0.0f, 0.0f, 0 },          // 2: Minimal (qva)
    { 1.35f, 0.0f, 1.0f, 1.06f, +3.0f, -2.0f, 0 },                   // 3: Shadows (qvf)
    { 0.96f, 4.0f/255.0f, 250.0f/255.0f, 1.08f, -5.0f, +4.0f, 0 },          // 4: Vanilla (qvc)
    { 1.25f, 0.0f, 1.0f, 1.25f, +4.0f, -2.0f, 0 },                   // 5: Digi (quy)
    { 1.45f, 0.0f, 1.0f, 0.00f, 0.0f, 0.0f, 1 },                     // 6: Black Tie (quw)
    { 0.92f, 16.0f/255.0f, 240.0f/255.0f, 1.05f, -6.0f, -3.0f, 0 },         // 7: Dijon (qvi)
    { 1.26f, 0.0f, 1.0f, 1.15f, -4.0f, +5.0f, 0 },                   // 8: Buffalo (qvg)
    { 0.80f, 26.0f/255.0f, 228.0f/255.0f, 0.62f, 0.0f, 0.0f, 0 },          // 9: Flat (qvd)
    { 1.08f, 10.0f/255.0f, 248.0f/255.0f, 1.02f, -3.0f, +3.0f, 0 },         // 10: Classic (qve)
    { 1.30f, 0.0f, 1.0f, 1.20f, +2.0f, +4.0f, 0 },                   // 11: Editorial (quz)
    { 1.25f, 0.0f, 1.0f, 1.40f, 0.0f, +2.0f, 0 }                    // 12: Velvet (qvh)
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

static uint8_t s_active_lut_y[256];
static uint8_t s_active_lut_u[256];
static uint8_t s_active_lut_v[256];
static float s_active_saturation = 1.0f;
static float s_active_shift_u = 0.0f;
static float s_active_shift_v = 0.0f;
static int s_active_look_id = -999;
static float s_last_c = -999.0f, s_last_s = -999.0f, s_last_h = -999.0f, s_last_v = -999.0f, s_last_t = -999.0f;
static int s_active_lut_valid = 0;

static void update_active_luts(int lookId) {
    if (s_active_lut_valid && s_active_look_id == lookId &&
        s_last_c == s_ft_contrast && s_last_s == s_ft_shadows &&
        s_last_h == s_ft_highlights && s_last_v == s_ft_vibrance &&
        s_last_t == s_ft_tint) {
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

    // 2. Shadows (black lift / pedestal)
    float eff_black_lift = base_p->black_lift + (s_ft_shadows * 0.20f);
    if (eff_black_lift < 0.0f) eff_black_lift = 0.0f;
    if (eff_black_lift > 0.45f) eff_black_lift = 0.45f;

    // 3. Highlights (white shoulder compression / roll-off)
    float eff_white_comp = base_p->white_comp - (s_ft_highlights * 0.20f);
    if (eff_white_comp < eff_black_lift + 0.10f) eff_white_comp = eff_black_lift + 0.10f;
    if (eff_white_comp > 1.0f) eff_white_comp = 1.0f;

    // Build Y (Luma) Tone Curve
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
        float y_out = eff_black_lift + sig * (eff_white_comp - eff_black_lift);
        s_active_lut_y[i] = clamp_u8((int)roundf(y_out * 255.0f));
    }

    // 4. Vibrance (Saturation)
    float eff_saturation = base_p->saturation;
    if (!base_p->is_monochrome) {
        eff_saturation *= (1.0f + 0.70f * s_ft_vibrance);
        if (eff_saturation < 0.0f) eff_saturation = 0.0f;
        if (eff_saturation > 2.50f) eff_saturation = 2.50f;
    }

    // 5. Tint (Temperature / tint shift)
    float eff_shift_u = base_p->shift_u - (s_ft_tint * 20.0f);
    float eff_shift_v = base_p->shift_v + (s_ft_tint * 20.0f);

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
    s_active_lut_valid = 1;
}

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeSetFineTuning(
    JNIEnv *env, jclass clazz, jfloat contrast, jfloat shadows, jfloat highlights, jfloat vibrance, jfloat tint) {
    (void)env; (void)clazz;
    if (s_ft_contrast != contrast || s_ft_shadows != shadows || s_ft_highlights != highlights ||
        s_ft_vibrance != vibrance || s_ft_tint != tint) {
        s_ft_contrast = contrast;
        s_ft_shadows = shadows;
        s_ft_highlights = highlights;
        s_ft_vibrance = vibrance;
        s_ft_tint = tint;
        s_active_lut_valid = 0;
        LOGI("ProPatcher: nativeSetFineTuning: C=%.2f, S=%.2f, H=%.2f, V=%.2f, T=%.2f",
             contrast, shadows, highlights, vibrance, tint);
    }
}

static inline uint8x8_t neon_grade_8(int16x8_t w, int16x4_t v_scale, int32x4_t v_offset) {
    int32x4_t p_lo = vmull_s16(vget_low_s16(w), v_scale);
    int32x4_t p_hi = vmull_s16(vget_high_s16(w), v_scale);

    int32x4_t s_lo = vshrq_n_s32(p_lo, 8);
    int32x4_t s_hi = vshrq_n_s32(p_hi, 8);

    int32x4_t a_lo = vaddq_s32(s_lo, v_offset);
    int32x4_t a_hi = vaddq_s32(s_hi, v_offset);

    int16x4_t n_lo = vqmovn_s32(a_lo);
    int16x4_t n_hi = vqmovn_s32(a_hi);

    int16x8_t comb = vcombine_s16(n_lo, n_hi);
    return vqmovun_s16(comb);
}

// 128-bit dual-burst NEON SIMD vector grading for Y plane (Luma) - Zero memory table stalls
static inline void neon_grade_y(uint8_t* y_data, uint32_t width, uint32_t height, uint32_t stride, int16_t scale_q8, int16_t offset) {
    if (scale_q8 == 256 && offset == 128) return;

    int16x4_t v_scale = vdup_n_s16(scale_q8);
    int32x4_t v_offset = vdupq_n_s32(offset);
    int16x8_t v_128 = vdupq_n_s16(128);

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = y_data + y * stride;
        uint32_t x = 0;

        // 32 bytes per iteration (Dual 128-bit vector burst)
        for (; x + 32 <= width; x += 32) {
            uint8x16_t vy0 = vld1q_u8(row + x);
            uint8x16_t vy1 = vld1q_u8(row + x + 16);

            int16x8_t w0_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy0))), v_128);
            int16x8_t w0_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy0))), v_128);
            int16x8_t w1_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy1))), v_128);
            int16x8_t w1_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy1))), v_128);

            uint8x8_t r0_lo = neon_grade_8(w0_lo, v_scale, v_offset);
            uint8x8_t r0_hi = neon_grade_8(w0_hi, v_scale, v_offset);
            uint8x8_t r1_lo = neon_grade_8(w1_lo, v_scale, v_offset);
            uint8x8_t r1_hi = neon_grade_8(w1_hi, v_scale, v_offset);

            vst1q_u8(row + x, vcombine_u8(r0_lo, r0_hi));
            vst1q_u8(row + x + 16, vcombine_u8(r1_lo, r1_hi));
        }

        for (; x + 16 <= width; x += 16) {
            uint8x16_t vy = vld1q_u8(row + x);
            int16x8_t w_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy))), v_128);
            int16x8_t w_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy))), v_128);
            uint8x8_t r_lo = neon_grade_8(w_lo, v_scale, v_offset);
            uint8x8_t r_hi = neon_grade_8(w_hi, v_scale, v_offset);
            vst1q_u8(row + x, vcombine_u8(r_lo, r_hi));
        }

        for (; x < width; x++) {
            int val = ((int)row[x] - 128) * (int)scale_q8 / 256 + (int)offset;
            row[x] = clamp_u8(val);
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

// Luminance-preserving color grading for RGB (3 channels) or RGBA (4 channels) frames with optional Film Grain
static inline void lut_grade_raster(uint8_t* data, uint32_t width, uint32_t height, uint32_t channels, uint32_t stride,
                                    const uint8_t lut_y[256], float sat, float shift_u, float shift_v, int is_monochrome) {
    int s_q8 = (int)roundf(sat * 256.0f);
    int s_r = (int)roundf(shift_v * 1.402f);
    int s_g = (int)roundf(-0.344136f * shift_u - 0.714136f * shift_v);
    int s_b = (int)roundf(shift_u * 1.772f);
    int grain_on = s_grain_enabled;

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = data + y * stride;
        uint32_t y_offset = (y * 79) & 0xFF;

        if (is_monochrome) {
            for (uint32_t x = 0; x < width; x++) {
                uint8_t* pix = row + x * channels;
                uint8_t gray = (uint8_t)((pix[0]*77 + pix[1]*150 + pix[2]*29) >> 8);
                uint8_t out = lut_y[gray];
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
                int graded_luma = lut_y[luma];
                int dl = graded_luma - luma;
                int gr = 0;
                if (grain_on) {
                    int n = s_noise_table[(y_offset + x) & 0xFF];
                    int mw = 255 - abs(luma * 2 - 255);
                    gr = (n * mw) >> 10;
                }

                pix[0] = clamp_u8(r + dl + (((r - luma) * (s_q8 - 256)) >> 8) + s_r + gr);
                pix[1] = clamp_u8(g + dl + (((g - luma) * (s_q8 - 256)) >> 8) + s_g + gr);
                pix[2] = clamp_u8(b + dl + (((b - luma) * (s_q8 - 256)) >> 8) + s_b + gr);
            }
        }
    }
}

static inline void neon_grade_rgba(uint8_t* data, uint32_t width, uint32_t height, uint32_t stride,
                                   int16_t scale_q8, int16_t offset, int is_monochrome) {
    int16x4_t v_scale = vdup_n_s16(scale_q8);
    int32x4_t v_offset = vdupq_n_s32(offset);
    int16x8_t v_128 = vdupq_n_s16(128);

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = data + y * stride;
        uint32_t x = 0;
        if (is_monochrome) {
            for (; x + 8 <= width; x += 8) {
                uint8x8x4_t rgba = vld4_u8(row + x * 4);
                uint16x8_t r16 = vmull_u8(rgba.val[0], vdup_n_u8(77));
                uint16x8_t g16 = vmlal_u8(r16, rgba.val[1], vdup_n_u8(150));
                uint16x8_t gray16 = vmlal_u8(g16, rgba.val[2], vdup_n_u8(29));
                uint8x8_t gray8 = vshrn_n_u16(gray16, 8);

                int16x8_t w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(gray8)), v_128);
                uint8x8_t out = neon_grade_8(w, v_scale, v_offset);

                rgba.val[0] = out;
                rgba.val[1] = out;
                rgba.val[2] = out;
                vst4_u8(row + x * 4, rgba);
            }
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                uint8_t gray = (uint8_t)((pix[0]*77 + pix[1]*150 + pix[2]*29) >> 8);
                int c = ((int)gray - 128) * (int)scale_q8 / 256 + (int)offset;
                uint8_t out = clamp_u8(c);
                pix[0] = out; pix[1] = out; pix[2] = out;
            }
        } else {
            for (; x + 8 <= width; x += 8) {
                uint8x8x4_t rgba = vld4_u8(row + x * 4);
                int16x8_t r_w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(rgba.val[0])), v_128);
                int16x8_t g_w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(rgba.val[1])), v_128);
                int16x8_t b_w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(rgba.val[2])), v_128);

                rgba.val[0] = neon_grade_8(r_w, v_scale, v_offset);
                rgba.val[1] = neon_grade_8(g_w, v_scale, v_offset);
                rgba.val[2] = neon_grade_8(b_w, v_scale, v_offset);
                vst4_u8(row + x * 4, rgba);
            }
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                int r = ((int)pix[0] - 128) * (int)scale_q8 / 256 + (int)offset;
                int g = ((int)pix[1] - 128) * (int)scale_q8 / 256 + (int)offset;
                int b = ((int)pix[2] - 128) * (int)scale_q8 / 256 + (int)offset;
                pix[0] = clamp_u8(r);
                pix[1] = clamp_u8(g);
                pix[2] = clamp_u8(b);
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
                           fabsf(s_ft_tint) > 0.01f);

    if (lookId == 0 && !has_fine_tuning) {
        return;
    }

    const LookProfile* prof = (lookId >= 0 && lookId < 13) ? &s_look_profiles[lookId] : &s_look_profiles[0];

    int16_t scale_y = (int16_t)roundf((prof->contrast_p + s_ft_contrast * 0.35f) * 256.0f);
    int16_t offset_y = 128 + (int16_t)roundf((prof->black_lift * 64.0f) + (s_ft_highlights + s_ft_shadows) * 20.0f);

    int16_t scale_uv = prof->is_monochrome ? 0 : (int16_t)roundf((prof->saturation + s_ft_vibrance * 0.45f) * 256.0f);
    if (scale_uv < 0) scale_uv = 0;

    int16_t shift_u = (int16_t)roundf(prof->shift_u + s_ft_tint * (-10.0f));
    int16_t shift_v = (int16_t)roundf(prof->shift_v + s_ft_tint * (+10.0f));
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
                                scale_y, offset_y, is_monochrome);
            } else {
                uint32_t y_size = desc.stride * desc.height;
                neon_grade_y((uint8_t*)virt, desc.width, desc.height, desc.stride, scale_y, offset_y);
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
                        planes.planes[0].rowStride, scale_y, offset_y, is_monochrome);
    } else if (planes.planeCount == 1) {
        uint32_t y_size = planes.planes[0].rowStride * height;
        neon_grade_y((uint8_t*)planes.planes[0].data, width, height,
                     planes.planes[0].rowStride, scale_y, offset_y);
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
                     planes.planes[0].rowStride, scale_y, offset_y);

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
                           fabsf(s_ft_tint) > 0.01f);

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

    LOGI("ProPatcher: Grading Captured Photo: %dx%d (%d channels, stride=%d), Look=%d, Mono=%d, Sat=%.2f, U_shift=%.1f, V_shift=%.1f",
         width, height, channels, stride, lookId, is_monochrome, sat, shift_u, shift_v);

    lut_grade_raster((uint8_t*)dataPtr, (uint32_t)width, (uint32_t)height, (uint32_t)channels, (uint32_t)stride,
                     lut_y, sat, shift_u, shift_v, is_monochrome);
}


