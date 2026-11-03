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
    float contrast_p;       // Sigmoid exponent (>1.0 = punchy S-curve, <1.0 = soft/log)
    float black_lift;       // Black pedestal in [0.0, 1.0] (lifted film blacks)
    float white_comp;       // White shoulder point in [0.0, 1.0] (highlight roll-off)
    float saturation;       // Chroma saturation factor (0.0 = monochrome, >1.0 = punch)
    float shadow_u;         // Shadow Blue/Yellow tint (- = yellow/warm, + = blue/cool)
    float shadow_v;         // Shadow Red/Green tint (+ = magenta/red, - = olive/cyan)
    float highlight_u;      // Highlight Blue/Yellow tint (- = yellow/warm, + = blue/cool)
    float highlight_v;      // Highlight Red/Green tint (+ = amber/red, - = cyan)
    float cyan_sky;         // Sky blue rotation toward filmic cyan/teal [0.0 to 1.0]
    float foliage_warmth;   // Green shift toward olive/amber (+ = olive/warm, - = emerald)
    float bloom_strength;   // Highlight halation/bloom strength [0.0 to 1.0]
    float bloom_r;          // Halation Red weight [0.0 to 1.0]
    float bloom_g;          // Halation Green weight [0.0 to 1.0]
    float bloom_b;          // Halation Blue weight [0.0 to 1.0]
    float micro_contrast;   // Midtone local contrast enhancement [-0.5 to +0.5]
    int is_monochrome;      // 1 for Black Tie (zero chroma)
} LookProfile;

// Bold, authentic photographic signatures corresponding to Google Camera's 13 Look classes:
// 0: Original (Default) -> passthrough stock HDR+
// 1: Natural (Class qvb) -> relaxed natural colors, organic tonal response
// 2: Minimal (Class qva) -> Scandinavian aesthetic: muted pastels, lifted matte shadows, clean whites
// 3: Shadows (Class qvf) -> dramatic film noir: deep cool slate-navy shadows, crisp highlights
// 4: Vanilla (Class qvc) -> Golden Hour: radiant honeyed amber highlights, warm creamy shadows
// 5: Digi (Class quy)    -> Y2K CCD Digicam: snappy midtone contrast, flash pop, cool shadow base
// 6: Black Tie (Class quw)-> Leica Monochrom: silky zone-system gradation, luminous whites, inky blacks
// 7: Dijon (Class qvi)   -> 1970s Vintage Mustard: yellow-green shadow cast, warm fade, retro nostalgia
// 8: Buffalo (Class qvg) -> Rugged Bronze: earthy copper warmth, textured contrast, rich midtones
// 9: Flat (Class qvd)    -> Cinematic Log: wide dynamic range latitude, lifted blacks, soft pastels
// 10: Classic (Class qve)-> Kodak Portra 400: creamy golden-peach highlights, cyan skies, olive foliage, signature film halation
// 11: Editorial (Class quz)-> Kodachrome 64: high-fashion magazine contrast, deep navy shadows, punchy tactile clarity
// 12: Velvet (Class qvh) -> Fuji Velvia 50: hyper-vivid landscape slide film, cobalt-cyan skies, lush emerald foliage
static const LookProfile s_look_profiles[13] = {
    // contrast, black_lift,   white_comp,    sat,   sh_u,  sh_v,  hl_u,  hl_v, cyan, fol,  bloom_s, bl_r, bl_g, bl_b,   mc, mono
    { 1.00f,     0.0f,         1.0f,          1.00f,  0.0f,  0.0f,  0.0f,  0.0f, 0.0f, 0.0f, 0.00f, 0.0f,  0.0f,  0.0f,  0.00f, 0 }, // 0: Original
    { 1.05f,     0.0f,         1.0f,          1.02f,  0.0f,  0.0f, -1.5f, +1.5f, 0.15f, 0.10f, 0.10f, 1.0f,  0.60f, 0.30f,+0.08f, 0 }, // 1: Natural
    { 0.90f,    16.0f/255.0f, 240.0f/255.0f,  0.65f, +1.5f, -1.0f,  0.0f,  0.0f, 0.10f, 0.20f, 0.00f, 0.0f,  0.0f,  0.0f, -0.08f, 0 }, // 2: Minimal
    { 1.28f,     3.0f/255.0f, 254.0f/255.0f,  1.06f, +8.0f, -4.0f, +1.0f, +2.0f, 0.35f,-0.10f, 0.16f, 0.70f, 0.75f, 0.95f,+0.28f, 0 }, // 3: Shadows
    { 1.06f,     6.0f/255.0f, 250.0f/255.0f,  1.12f, -5.0f, +3.0f,-12.0f, +8.0f, 0.20f, 0.35f, 0.35f, 1.0f,  0.58f, 0.15f,+0.10f, 0 }, // 4: Vanilla
    { 1.22f,     3.0f/255.0f, 255.0f/255.0f,  1.18f, +6.0f, -3.0f, +3.0f, -1.0f, 0.50f, 0.00f, 0.18f, 0.85f, 0.90f, 1.00f,+0.22f, 0 }, // 5: Digi
    { 1.30f,     4.0f/255.0f, 253.0f/255.0f,  0.00f,  0.0f,  0.0f,  0.0f,  0.0f, 0.0f, 0.0f, 0.25f, 1.0f,  1.0f,  1.0f, +0.25f, 1 }, // 6: Black Tie
    { 1.04f,    18.0f/255.0f, 242.0f/255.0f,  1.06f, -9.0f, -4.0f, -8.0f, +4.0f, 0.15f, 0.50f, 0.30f, 1.0f,  0.65f, 0.20f,+0.12f, 0 }, // 7: Dijon
    { 1.20f,     5.0f/255.0f, 252.0f/255.0f,  1.12f, -5.0f, +5.0f, -6.0f, +8.0f, 0.25f, 0.40f, 0.25f, 1.0f,  0.40f, 0.10f,+0.32f, 0 }, // 8: Buffalo
    { 0.78f,    24.0f/255.0f, 230.0f/255.0f,  0.62f,  0.0f,  0.0f,  0.0f,  0.0f, 0.0f, 0.0f, 0.00f, 0.0f,  0.0f,  0.0f,  0.00f, 0 }, // 9: Flat
    { 1.14f,     8.0f/255.0f, 248.0f/255.0f,  1.08f, -4.0f, +3.0f, -7.0f, +6.0f, 0.45f, 0.35f, 0.35f, 1.0f,  0.32f, 0.08f,+0.14f, 0 }, // 10: Classic (Portra)
    { 1.25f,     2.0f/255.0f, 254.0f/255.0f,  1.16f, +5.0f, -2.0f, -4.0f, +6.0f, 0.40f, 0.15f, 0.38f, 1.0f,  0.28f, 0.06f,+0.30f, 0 }, // 11: Editorial (Kodachrome)
    { 1.22f,     3.0f/255.0f, 252.0f/255.0f,  1.28f, +3.0f, +5.0f, -3.0f, +4.0f, 0.55f,-0.25f, 0.22f, 1.0f,  0.48f, 0.12f,+0.28f, 0 }  // 12: Velvet (Velvia)
};

static uint8_t s_lut_y[13][256];
static uint8_t s_lut_u[13][256];
static uint8_t s_lut_v[13][256];
static uint8_t s_midtone_weight[256];
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

    // Initialize midtone bell-curve weights for micro-contrast (255 at midtone 128, 0 at deep black / specular white)
    for (int i = 0; i < 256; i++) {
        int dist = abs(i - 128);
        int dist_sq = dist * dist;
        int w = 255 - ((dist_sq * 255) >> 14);
        if (w < 0) w = 0;
        if (w > 255) w = 255;
        s_midtone_weight[i] = (uint8_t)w;
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

        // 2. Build U and V (Chroma) LUTs with midtone tint
        float mid_u = (p->shadow_u + p->highlight_u) * 0.5f;
        float mid_v = (p->shadow_v + p->highlight_v) * 0.5f;
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

                int u_val = (int)roundf(128.0f + d_sat + mid_u * w);
                int v_val = (int)roundf(128.0f + d_sat + mid_v * w);
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
static uint8_t s_tint_weight[256];
static float s_active_saturation = 1.0f;
static float s_active_shadow_u = 0.0f;
static float s_active_shadow_v = 0.0f;
static float s_active_highlight_u = 0.0f;
static float s_active_highlight_v = 0.0f;
static float s_active_cyan_sky = 0.0f;
static float s_active_foliage_warmth = 0.0f;
static float s_active_bloom_strength = 0.0f;
static float s_active_bloom_r = 1.0f;
static float s_active_bloom_g = 0.5f;
static float s_active_bloom_b = 0.2f;
static float s_active_micro_contrast = 0.0f;
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

    // 5. Dual Split-Toning & 3D Selective Color Parameters
    float eff_sh_u = base_p->shadow_u - (s_ft_tint * 20.0f);
    float eff_sh_v = base_p->shadow_v + (s_ft_tint * 20.0f);
    float eff_hl_u = base_p->highlight_u - (s_ft_tint * 20.0f);
    float eff_hl_v = base_p->highlight_v + (s_ft_tint * 20.0f);

    s_active_saturation = eff_saturation;
    s_active_shadow_u = eff_sh_u;
    s_active_shadow_v = eff_sh_v;
    s_active_highlight_u = eff_hl_u;
    s_active_highlight_v = eff_hl_v;
    s_active_cyan_sky = base_p->cyan_sky;
    s_active_foliage_warmth = base_p->foliage_warmth;

    // 6. Highlight Bloom & Micro-Contrast with Fine-Tuning Integration
    float eff_bloom = base_p->bloom_strength;
    if (s_ft_highlights > 0.0f) {
        eff_bloom *= (1.0f + 0.35f * s_ft_highlights);
    } else if (s_ft_highlights < 0.0f) {
        eff_bloom *= (1.0f + 0.50f * s_ft_highlights);
    }
    if (eff_bloom < 0.0f) eff_bloom = 0.0f;
    if (eff_bloom > 1.0f) eff_bloom = 1.0f;

    float eff_mc = base_p->micro_contrast;
    if (s_ft_contrast > 0.0f) {
        eff_mc += s_ft_contrast * 0.15f;
    } else if (s_ft_contrast < 0.0f) {
        eff_mc += s_ft_contrast * 0.10f;
    }
    if (eff_mc < -0.40f) eff_mc = -0.40f;
    if (eff_mc > 0.50f) eff_mc = 0.50f;

    s_active_bloom_strength = eff_bloom;
    s_active_bloom_r = base_p->bloom_r;
    s_active_bloom_g = base_p->bloom_g;
    s_active_bloom_b = base_p->bloom_b;
    s_active_micro_contrast = eff_mc;

    // Midtone tint for 2D chroma LUTs
    float mid_u = (eff_sh_u + eff_hl_u) * 0.5f;
    float mid_v = (eff_sh_v + eff_hl_v) * 0.5f;

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

            int u_val = (int)roundf(128.0f + d_sat + mid_u * w);
            int v_val = (int)roundf(128.0f + d_sat + mid_v * w);
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

// 128-bit NEON SIMD smooth Sigmoid S-curve evaluator matching offline raster tone-mapping (0.4% mean error)
static inline uint8x8_t neon_s_curve_8(int16x8_t y, int16x4_t v_k_curv, int32x4_t v_k_bl, int16x4_t v_slope) {
    int16x8_t v_128 = vdupq_n_s16(128);
    int16x8_t w = vsubq_s16(y, v_128);
    int16x8_t abs_w = vabdq_s16(y, v_128);
    int16x8_t ts = vsubq_s16(v_128, abs_w);
    int16x8_t w_ts = vmulq_s16(w, ts); // fits in s16 [-16384, +16256]

    // S-curve non-linear displacement: (w * ts * k_curv) >> 20
    int32x4_t curv_lo = vshrq_n_s32(vmull_s16(vget_low_s16(w_ts), v_k_curv), 20);
    int32x4_t curv_hi = vshrq_n_s32(vmull_s16(vget_high_s16(w_ts), v_k_curv), 20);

    // Linear pedestal and highlight roll-off: k_bl + (y * slope) >> 8
    int32x4_t lin_lo = vaddq_s32(v_k_bl, vshrq_n_s32(vmull_s16(vget_low_s16(y), v_slope), 8));
    int32x4_t lin_hi = vaddq_s32(v_k_bl, vshrq_n_s32(vmull_s16(vget_high_s16(y), v_slope), 8));

    // Combine y + curv + lin
    int32x4_t out_lo = vaddq_s32(vmovl_s16(vget_low_s16(y)), vaddq_s32(curv_lo, lin_lo));
    int32x4_t out_hi = vaddq_s32(vmovl_s16(vget_high_s16(y)), vaddq_s32(curv_hi, lin_hi));

    int16x4_t n_lo = vqmovn_s32(out_lo);
    int16x4_t n_hi = vqmovn_s32(out_hi);
    return vqmovun_s16(vcombine_s16(n_lo, n_hi));
}

// 128-bit dual-burst NEON SIMD vector grading for Y plane (Luma) - True WYSIWYG Sigmoid S-Curve & Micro-Contrast
static inline void neon_grade_y(uint8_t* y_data, uint32_t width, uint32_t height, uint32_t stride,
                                int16_t k_curv_q8, int32_t k_bl, int16_t slope_q8, int16_t mc_gain_q8) {
    if (k_curv_q8 == 0 && k_bl == 0 && slope_q8 == 0 && mc_gain_q8 == 0) return;

    int16x4_t v_k_curv = vdup_n_s16(k_curv_q8);
    int32x4_t v_k_bl = vdupq_n_s32(k_bl);
    int16x4_t v_slope = vdup_n_s16(slope_q8);
    int16x8_t v_mc_gain = vdupq_n_s16(mc_gain_q8);
    int16x8_t v_128 = vdupq_n_s16(128);

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = y_data + y * stride;
        const uint8_t* prev_row = (y > 0) ? (y_data + (y - 1) * stride) : row;
        const uint8_t* next_row = (y + 1 < height) ? (y_data + (y + 1) * stride) : row;
        uint32_t x = 0;

        if (mc_gain_q8 != 0) {
            for (; x + 16 <= width; x += 16) {
                uint8x16_t vy = vld1q_u8(row + x);
                uint8x16_t vp = vld1q_u8(prev_row + x);
                uint8x16_t vn = vld1q_u8(next_row + x);

                // Vertical binomial average: (prev + 2*curr + next) / 4
                uint8x16_t v_avg = vrhaddq_u8(vy, vrhaddq_u8(vp, vn));

                int16x8_t y_lo = vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy)));
                int16x8_t y_hi = vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy)));
                int16x8_t avg_lo = vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(v_avg)));
                int16x8_t avg_hi = vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(v_avg)));

                int16x8_t det_lo = vsubq_s16(y_lo, avg_lo);
                int16x8_t det_hi = vsubq_s16(y_hi, avg_hi);

                int16x8_t mw_lo = vsubq_s16(v_128, vabdq_s16(y_lo, v_128));
                int16x8_t mw_hi = vsubq_s16(v_128, vabdq_s16(y_hi, v_128));

                // delta = (detail * mc_gain * mw) >> 15
                int32x4_t p_lo0 = vmull_s16(vget_low_s16(det_lo), vget_low_s16(v_mc_gain));
                int32x4_t p_lo1 = vmull_s16(vget_high_s16(det_lo), vget_high_s16(v_mc_gain));
                int16x4_t d_scaled_lo0 = vshrn_n_s32(p_lo0, 8);
                int16x4_t d_scaled_lo1 = vshrn_n_s32(p_lo1, 8);
                int16x8_t d_scaled_lo = vcombine_s16(d_scaled_lo0, d_scaled_lo1);

                int32x4_t p_hi0 = vmull_s16(vget_low_s16(det_hi), vget_low_s16(v_mc_gain));
                int32x4_t p_hi1 = vmull_s16(vget_high_s16(det_hi), vget_high_s16(v_mc_gain));
                int16x4_t d_scaled_hi0 = vshrn_n_s32(p_hi0, 8);
                int16x4_t d_scaled_hi1 = vshrn_n_s32(p_hi1, 8);
                int16x8_t d_scaled_hi = vcombine_s16(d_scaled_hi0, d_scaled_hi1);

                int32x4_t dm_lo0 = vmull_s16(vget_low_s16(d_scaled_lo), vget_low_s16(mw_lo));
                int32x4_t dm_lo1 = vmull_s16(vget_high_s16(d_scaled_lo), vget_high_s16(mw_lo));
                int16x4_t del_lo0 = vshrn_n_s32(dm_lo0, 7);
                int16x4_t del_lo1 = vshrn_n_s32(dm_lo1, 7);
                int16x8_t del_lo = vcombine_s16(del_lo0, del_lo1);

                int32x4_t dm_hi0 = vmull_s16(vget_low_s16(d_scaled_hi), vget_low_s16(mw_hi));
                int32x4_t dm_hi1 = vmull_s16(vget_high_s16(d_scaled_hi), vget_high_s16(mw_hi));
                int16x4_t del_hi0 = vshrn_n_s32(dm_hi0, 7);
                int16x4_t del_hi1 = vshrn_n_s32(dm_hi1, 7);
                int16x8_t del_hi = vcombine_s16(del_hi0, del_hi1);

                int16x8_t y_mod_lo = vaddq_s16(y_lo, del_lo);
                int16x8_t y_mod_hi = vaddq_s16(y_hi, del_hi);

                uint8x8_t r_lo = neon_s_curve_8(y_mod_lo, v_k_curv, v_k_bl, v_slope);
                uint8x8_t r_hi = neon_s_curve_8(y_mod_hi, v_k_curv, v_k_bl, v_slope);
                vst1q_u8(row + x, vcombine_u8(r_lo, r_hi));
            }
        } else {
            // 32 bytes per iteration (Dual 128-bit vector burst)
            for (; x + 32 <= width; x += 32) {
                uint8x16_t vy0 = vld1q_u8(row + x);
                uint8x16_t vy1 = vld1q_u8(row + x + 16);

                int16x8_t y0_lo = vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy0)));
                int16x8_t y0_hi = vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy0)));
                int16x8_t y1_lo = vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy1)));
                int16x8_t y1_hi = vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy1)));

                uint8x8_t r0_lo = neon_s_curve_8(y0_lo, v_k_curv, v_k_bl, v_slope);
                uint8x8_t r0_hi = neon_s_curve_8(y0_hi, v_k_curv, v_k_bl, v_slope);
                uint8x8_t r1_lo = neon_s_curve_8(y1_lo, v_k_curv, v_k_bl, v_slope);
                uint8x8_t r1_hi = neon_s_curve_8(y1_hi, v_k_curv, v_k_bl, v_slope);

                vst1q_u8(row + x, vcombine_u8(r0_lo, r0_hi));
                vst1q_u8(row + x + 16, vcombine_u8(r1_lo, r1_hi));
            }

            for (; x + 16 <= width; x += 16) {
                uint8x16_t vy = vld1q_u8(row + x);
                int16x8_t y_lo = vreinterpretq_s16_u16(vmovl_u8(vget_low_u8(vy)));
                int16x8_t y_hi = vreinterpretq_s16_u16(vmovl_u8(vget_high_u8(vy)));
                uint8x8_t r_lo = neon_s_curve_8(y_lo, v_k_curv, v_k_bl, v_slope);
                uint8x8_t r_hi = neon_s_curve_8(y_hi, v_k_curv, v_k_bl, v_slope);
                vst1q_u8(row + x, vcombine_u8(r_lo, r_hi));
            }
        }

        for (; x < width; x++) {
            int y_val = row[x];
            if (mc_gain_q8 != 0) {
                int y_loc = ((int)prev_row[x] + ((int)row[x] << 1) + (int)next_row[x]) >> 2;
                int det = y_val - y_loc;
                int mw = 128 - abs(y_val - 128);
                int del = (det * (int)mc_gain_q8 * mw) >> 15;
                y_val = clamp_u8(y_val + del);
            }
            int w = y_val - 128;
            int ts = 128 - abs(w);
            int w_ts = w * ts;
            int curv = (w_ts * k_curv_q8) >> 20;
            int lin = k_bl + ((y_val * slope_q8) >> 8);
            row[x] = clamp_u8(y_val + curv + lin);
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

// ---------------------------------------------------------------------------
// Highlight Bloom (Halation) & Micro-Contrast Helpers
// ---------------------------------------------------------------------------

static inline int sample_bloom_bilinear(const uint8_t* buf, uint32_t bw, uint32_t bh, uint32_t x, uint32_t y) {
    uint32_t bx = x >> 3;
    uint32_t by = y >> 3;
    if (bx >= bw) bx = bw - 1;
    if (by >= bh) by = bh - 1;
    uint32_t bx1 = (bx + 1 < bw) ? (bx + 1) : bx;
    uint32_t by1 = (by + 1 < bh) ? (by + 1) : by;

    int fx = (x & 7) * 32; // [0, 224] in Q8
    int fy = (y & 7) * 32; // [0, 224] in Q8

    int p00 = buf[by * bw + bx];
    int p10 = buf[by * bw + bx1];
    int p01 = buf[by1 * bw + bx];
    int p11 = buf[by1 * bw + bx1];

    int top = p00 + (((p10 - p00) * fx) >> 8);
    int bot = p01 + (((p11 - p01) * fx) >> 8);
    return top + (((bot - top) * fy) >> 8);
}

static void generate_bloom_map(const uint8_t* data, uint32_t width, uint32_t height,
                               uint32_t channels, uint32_t stride,
                               uint8_t* bloom_map, uint8_t* bloom_temp,
                               uint32_t bw, uint32_t bh) {
    // 1. Extract peak specular highlight excess in each 8x8 block (sampled across 16 points)
    for (uint32_t by = 0; by < bh; by++) {
        uint32_t y0 = by << 3;
        uint32_t y1 = y0 + 8;
        if (y1 > height) y1 = height;

        for (uint32_t bx = 0; bx < bw; bx++) {
            uint32_t x0 = bx << 3;
            uint32_t x1 = x0 + 8;
            if (x1 > width) x1 = width;

            int max_exc = 0;
            for (uint32_t py = y0; py < y1; py += 2) {
                const uint8_t* row = data + py * stride;
                for (uint32_t px = x0; px < x1; px += 2) {
                    const uint8_t* pix = row + px * channels;
                    int luma = (pix[0] * 77 + pix[1] * 150 + pix[2] * 29) >> 8;
                    if (luma > 192) {
                        int exc = luma - 192;
                        if (exc > max_exc) max_exc = exc;
                    }
                }
            }
            bloom_map[by * bw + bx] = (uint8_t)(max_exc << 2);
        }
    }

    // 2. Horizontal Gaussian pass: [1, 4, 6, 4, 1] / 16 (radius = 2 blocks = 16 pixels)
    for (uint32_t by = 0; by < bh; by++) {
        const uint8_t* in_row = bloom_map + by * bw;
        uint8_t* out_row = bloom_temp + by * bw;
        for (uint32_t bx = 0; bx < bw; bx++) {
            int xm2 = (bx >= 2) ? (bx - 2) : 0;
            int xm1 = (bx >= 1) ? (bx - 1) : 0;
            int xp1 = (bx + 1 < bw) ? (bx + 1) : (bw - 1);
            int xp2 = (bx + 2 < bw) ? (bx + 2) : (bw - 1);
            int sum = in_row[xm2] + (in_row[xm1] << 2) + in_row[bx] * 6 + (in_row[xp1] << 2) + in_row[xp2];
            out_row[bx] = (uint8_t)(sum >> 4);
        }
    }

    // 3. Vertical Gaussian pass: [1, 4, 6, 4, 1] / 16
    for (uint32_t bx = 0; bx < bw; bx++) {
        for (uint32_t by = 0; by < bh; by++) {
            int ym2 = (by >= 2) ? (by - 2) : 0;
            int ym1 = (by >= 1) ? (by - 1) : 0;
            int yp1 = (by + 1 < bh) ? (by + 1) : (bh - 1);
            int yp2 = (by + 2 < bh) ? (by + 2) : (bh - 1);
            int sum = bloom_temp[ym2 * bw + bx] + (bloom_temp[ym1 * bw + bx] << 2) +
                      bloom_temp[by * bw + bx] * 6 + (bloom_temp[yp1 * bw + bx] << 2) +
                      bloom_temp[yp2 * bw + bx];
            bloom_map[by * bw + bx] = (uint8_t)(sum >> 4);
        }
    }

    // 4. Second soft diffusion pass [1, 2, 1] / 4 expands filmic glow falloff to ~24-32 full-res pixels
    for (uint32_t by = 0; by < bh; by++) {
        const uint8_t* in_row = bloom_map + by * bw;
        uint8_t* out_row = bloom_temp + by * bw;
        for (uint32_t bx = 0; bx < bw; bx++) {
            int xm1 = (bx >= 1) ? (bx - 1) : 0;
            int xp1 = (bx + 1 < bw) ? (bx + 1) : (bw - 1);
            out_row[bx] = (uint8_t)((in_row[xm1] + (in_row[bx] << 1) + in_row[xp1]) >> 2);
        }
    }
    for (uint32_t bx = 0; bx < bw; bx++) {
        for (uint32_t by = 0; by < bh; by++) {
            int ym1 = (by >= 1) ? (by - 1) : 0;
            int yp1 = (by + 1 < bh) ? (by + 1) : (bh - 1);
            bloom_map[by * bw + bx] = (uint8_t)((bloom_temp[ym1 * bw + bx] +
                                                (bloom_temp[by * bw + bx] << 1) +
                                                 bloom_temp[yp1 * bw + bx]) >> 2);
        }
    }
}

static inline void extract_row_luma(const uint8_t* row, uint32_t width, uint32_t channels, uint8_t* out_luma) {
    for (uint32_t x = 0; x < width; x++) {
        const uint8_t* pix = row + x * channels;
        out_luma[x] = (uint8_t)((pix[0] * 77 + pix[1] * 150 + pix[2] * 29) >> 8);
    }
}

// Photographic color grading for RGB (3 channels) or RGBA (4 channels) frames with:
// 1. Ratio-Preserving Luminance Scaling (eliminates blown highlights & color shifts)
// 2. 3D Color Separation (Cyan Sky hue rotation, foliage olive/emerald shift, melanin peach glow)
// 3. True Dual Split-Toning (independent shadow tint vs highlight tint)
// 4. Filmic Highlight Roll-off (soft desaturation knee prevents harsh channel clipping)
// 5. Smart Vibrance & Melanin Gamut Protection (preserves natural facial tones without sunburn)
// 6. Highlight Bloom / Halation (warm optical glow on specular lights & bright edges)
// 7. Micro-Contrast / Clarity (midtone local contrast enhancement without shadow noise)
static inline void lut_grade_raster(uint8_t* data, uint32_t width, uint32_t height, uint32_t channels, uint32_t stride,
                                    const uint8_t lut_y[256], float sat,
                                    float sh_u, float sh_v, float hl_u, float hl_v,
                                    float cyan_sky, float fol_warmth,
                                    float bloom_strength, float bloom_r, float bloom_g, float bloom_b,
                                    float micro_contrast, int is_monochrome) {
    int s_q8 = (int)roundf(sat * 256.0f);
    int sh_r = (int)roundf(sh_v * 1.402f);
    int sh_g = (int)roundf(-0.344136f * sh_u - 0.714136f * sh_v);
    int sh_b = (int)roundf(sh_u * 1.772f);

    int hl_r = (int)roundf(hl_v * 1.402f);
    int hl_g = (int)roundf(-0.344136f * hl_u - 0.714136f * hl_v);
    int hl_b = (int)roundf(hl_u * 1.772f);

    int cyan_sky_q8 = (int)roundf(cyan_sky * 256.0f);
    int fol_warmth_q8 = (int)roundf(fol_warmth * 256.0f);
    int bloom_strength_q8 = (int)roundf(bloom_strength * 256.0f);
    int bloom_r_q8 = (int)roundf(bloom_r * 256.0f);
    int bloom_g_q8 = (int)roundf(bloom_g * 256.0f);
    int bloom_b_q8 = (int)roundf(bloom_b * 256.0f);
    int mc_gain_q8 = (int)roundf(micro_contrast * 256.0f);
    int grain_on = s_grain_enabled;

    // Allocate & generate downsampled bloom map if halation is enabled
    uint8_t* bloom_map = NULL;
    uint8_t* bloom_temp = NULL;
    uint32_t bw = 0, bh = 0;
    if (bloom_strength_q8 > 0) {
        bw = (width + 7) >> 3;
        bh = (height + 7) >> 3;
        if (bw > 0 && bh > 0) {
            bloom_map = (uint8_t*)malloc(bw * bh);
            bloom_temp = (uint8_t*)malloc(bw * bh);
            if (bloom_map && bloom_temp) {
                generate_bloom_map(data, width, height, channels, stride,
                                   bloom_map, bloom_temp, bw, bh);
            } else {
                if (bloom_map) { free(bloom_map); bloom_map = NULL; }
                if (bloom_temp) { free(bloom_temp); bloom_temp = NULL; }
            }
        }
    }

    // Allocate 3-line rolling luma buffers for micro-contrast if enabled
    uint8_t* luma_buf0 = NULL;
    uint8_t* luma_buf1 = NULL;
    uint8_t* luma_buf2 = NULL;
    int has_mc = 0;
    uint8_t* r_prev = NULL;
    uint8_t* r_curr = NULL;
    uint8_t* r_next = NULL;

    if (mc_gain_q8 != 0) {
        luma_buf0 = (uint8_t*)malloc(width);
        luma_buf1 = (uint8_t*)malloc(width);
        luma_buf2 = (uint8_t*)malloc(width);
        if (luma_buf0 && luma_buf1 && luma_buf2) {
            has_mc = 1;
            r_prev = luma_buf0;
            r_curr = luma_buf1;
            r_next = luma_buf2;
            extract_row_luma(data, width, channels, r_curr);
            memcpy(r_prev, r_curr, width);
            if (height > 1) {
                extract_row_luma(data + stride, width, channels, r_next);
            } else {
                memcpy(r_next, r_curr, width);
            }
        } else {
            if (luma_buf0) { free(luma_buf0); luma_buf0 = NULL; }
            if (luma_buf1) { free(luma_buf1); luma_buf1 = NULL; }
            if (luma_buf2) { free(luma_buf2); luma_buf2 = NULL; }
        }
    }

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = data + y * stride;
        uint32_t y_offset = (y * 79) & 0xFF;

        if (is_monochrome) {
            for (uint32_t x = 0; x < width; x++) {
                uint8_t* pix = row + x * channels;
                int luma = has_mc ? r_curr[x] : ((pix[0]*77 + pix[1]*150 + pix[2]*29) >> 8);
                int eff_luma = luma;
                if (has_mc) {
                    uint32_t xm1 = (x > 0) ? (x - 1) : 0;
                    uint32_t xp1 = (x + 1 < width) ? (x + 1) : (width - 1);
                    int sum_p = r_prev[xm1] + (r_prev[x] << 1) + r_prev[xp1];
                    int sum_c = r_curr[xm1] + (r_curr[x] << 1) + r_curr[xp1];
                    int sum_n = r_next[xm1] + (r_next[x] << 1) + r_next[xp1];
                    int y_local = (sum_p + (sum_c << 1) + sum_n) >> 4;
                    int detail = luma - y_local;
                    int mw = s_midtone_weight[luma];
                    int delta_mc = (detail * mc_gain_q8 * mw) >> 16;
                    eff_luma = clamp_u8(luma + delta_mc);
                }
                uint8_t out = lut_y[eff_luma];
                if (grain_on) {
                    int n = s_noise_table[(y_offset + x) & 0xFF];
                    int mw = 255 - abs((int)eff_luma * 2 - 255);
                    out = clamp_u8((int)out + ((n * mw) >> 10));
                }
                if (bloom_map) {
                    int bl = sample_bloom_bilinear(bloom_map, bw, bh, x, y);
                    if (bl > 0) {
                        int d_mono = (bl * bloom_strength_q8) >> 8;
                        out = clamp_u8((int)out + d_mono);
                    }
                }
                pix[0] = out; pix[1] = out; pix[2] = out;
            }
        } else {
            for (uint32_t x = 0; x < width; x++) {
                uint8_t* pix = row + x * channels;
                int r = pix[0], g = pix[1], b = pix[2];
                int luma = has_mc ? r_curr[x] : ((r * 77 + g * 150 + b * 29) >> 8);
                int eff_luma = luma;

                // Micro-contrast midtone texture enhancement
                if (has_mc) {
                    uint32_t xm1 = (x > 0) ? (x - 1) : 0;
                    uint32_t xp1 = (x + 1 < width) ? (x + 1) : (width - 1);
                    int sum_p = r_prev[xm1] + (r_prev[x] << 1) + r_prev[xp1];
                    int sum_c = r_curr[xm1] + (r_curr[x] << 1) + r_curr[xp1];
                    int sum_n = r_next[xm1] + (r_next[x] << 1) + r_next[xp1];
                    int y_local = (sum_p + (sum_c << 1) + sum_n) >> 4;
                    int detail = luma - y_local;
                    int mw = s_midtone_weight[luma];
                    int delta_mc = (detail * mc_gain_q8 * mw) >> 16;
                    eff_luma = clamp_u8(luma + delta_mc);
                }

                int graded_luma = lut_y[eff_luma];

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

                // 2. 3D Color Separation: Cyan Sky & Foliage Hue Twisting
                if (cyan_sky_q8 > 0 && b > r + 10 && b > g) {
                    int max_rg = (r > g) ? r : g;
                    int blue_diff = b - max_rg;
                    int d_cyan = (blue_diff * cyan_sky_q8) >> 9;
                    g_tone += d_cyan;
                    r_tone -= (d_cyan >> 1);
                }
                if (g > r + 10 && g > b + 10) {
                    int max_rb = (r > b) ? r : b;
                    int green_diff = g - max_rb;
                    if (fol_warmth_q8 > 0) {
                        int d_olive = (green_diff * fol_warmth_q8) >> 9;
                        r_tone += d_olive;
                        g_tone -= (d_olive >> 2);
                    } else if (fol_warmth_q8 < 0) {
                        int d_em = (green_diff * (-fol_warmth_q8)) >> 9;
                        b_tone += (d_em >> 1);
                        r_tone -= (d_em >> 2);
                    }
                }

                // 3. Smart Vibrance & Melanin Gamut Protection
                int eff_sq8 = s_q8;
                int is_skin = is_skin_tone(r, g, b, luma);
                if (is_skin) {
                    if (s_q8 > 256) {
                        eff_sq8 = 256 + ((s_q8 - 256) * 3) / 8;
                    } else if (s_q8 < 256) {
                        eff_sq8 = 256 - ((256 - s_q8) * 5) / 8;
                    }
                }

                int r_sat = graded_luma + (((r_tone - graded_luma) * eff_sq8) >> 8);
                int g_sat = graded_luma + (((g_tone - graded_luma) * eff_sq8) >> 8);
                int b_sat = graded_luma + (((b_tone - graded_luma) * eff_sq8) >> 8);

                // Subtle skin peach/golden glow for warm film looks
                if (is_skin && hl_v > 2.0f) {
                    r_sat += (int)(hl_v * 0.70f);
                    g_sat += (int)(hl_v * 0.35f);
                }

                // 4. True Dual Split-Toning (Shadow Tint vs Highlight Tint with protected bounds)
                int tw = s_tint_weight[graded_luma];
                int w_sh = 255 - graded_luma;
                int w_hl = graded_luma;
                int tint_r = (((sh_r * w_sh + hl_r * w_hl) >> 8) * tw) >> 8;
                int tint_g = (((sh_g * w_sh + hl_g * w_hl) >> 8) * tw) >> 8;
                int tint_b = (((sh_b * w_sh + hl_b * w_hl) >> 8) * tw) >> 8;

                // 5. Optional Film Grain
                int gr = 0;
                if (grain_on) {
                    int n = s_noise_table[(y_offset + x) & 0xFF];
                    int mw = 255 - abs(graded_luma * 2 - 255);
                    gr = (n * mw) >> 10;
                }

                // 6. Highlight Bloom / Halation Glow
                int d_r = 0, d_g = 0, d_b = 0;
                if (bloom_map) {
                    int bl = sample_bloom_bilinear(bloom_map, bw, bh, x, y);
                    if (bl > 0) {
                        int b_scaled = (bl * bloom_strength_q8) >> 8;
                        d_r = (b_scaled * bloom_r_q8) >> 8;
                        d_g = (b_scaled * bloom_g_q8) >> 8;
                        d_b = (b_scaled * bloom_b_q8) >> 8;
                    }
                }

                pix[0] = clamp_u8(r_sat + tint_r + gr + d_r);
                pix[1] = clamp_u8(g_sat + tint_g + gr + d_g);
                pix[2] = clamp_u8(b_sat + tint_b + gr + d_b);
            }
        }

        // Advance 3-line rolling luma buffer
        if (has_mc) {
            uint8_t* tmp = r_prev;
            r_prev = r_curr;
            r_curr = r_next;
            if (y + 2 < height) {
                extract_row_luma(data + (y + 2) * stride, width, channels, tmp);
                r_next = tmp;
            } else {
                r_next = r_curr;
            }
        }
    }

    if (bloom_map) free(bloom_map);
    if (bloom_temp) free(bloom_temp);
    if (luma_buf0) free(luma_buf0);
    if (luma_buf1) free(luma_buf1);
    if (luma_buf2) free(luma_buf2);
}

static inline void neon_grade_rgba(uint8_t* data, uint32_t width, uint32_t height, uint32_t stride,
                                   int16_t k_curv_q8, int32_t k_bl, int16_t slope_q8, int is_monochrome) {
    int16x4_t v_k_curv = vdup_n_s16(k_curv_q8);
    int32x4_t v_k_bl = vdupq_n_s32(k_bl);
    int16x4_t v_slope = vdup_n_s16(slope_q8);

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

                int16x8_t y_s16 = vreinterpretq_s16_u16(vmovl_u8(gray8));
                uint8x8_t out = neon_s_curve_8(y_s16, v_k_curv, v_k_bl, v_slope);

                rgba.val[0] = out;
                rgba.val[1] = out;
                rgba.val[2] = out;
                vst4_u8(row + x * 4, rgba);
            }
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                uint8_t gray = (uint8_t)((pix[0]*77 + pix[1]*150 + pix[2]*29) >> 8);
                int w = (int)gray - 128;
                int ts = 128 - abs(w);
                int curv = (w * ts * k_curv_q8) >> 20;
                int lin = k_bl + (((int)gray * slope_q8) >> 8);
                uint8_t out = clamp_u8((int)gray + curv + lin);
                pix[0] = out; pix[1] = out; pix[2] = out;
            }
        } else {
            for (; x + 8 <= width; x += 8) {
                uint8x8x4_t rgba = vld4_u8(row + x * 4);
                int16x8_t r_s16 = vreinterpretq_s16_u16(vmovl_u8(rgba.val[0]));
                int16x8_t g_s16 = vreinterpretq_s16_u16(vmovl_u8(rgba.val[1]));
                int16x8_t b_s16 = vreinterpretq_s16_u16(vmovl_u8(rgba.val[2]));

                rgba.val[0] = neon_s_curve_8(r_s16, v_k_curv, v_k_bl, v_slope);
                rgba.val[1] = neon_s_curve_8(g_s16, v_k_curv, v_k_bl, v_slope);
                rgba.val[2] = neon_s_curve_8(b_s16, v_k_curv, v_k_bl, v_slope);
                vst4_u8(row + x * 4, rgba);
            }
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                for (int c = 0; c < 3; c++) {
                    int val = pix[c];
                    int w = val - 128;
                    int ts = 128 - abs(w);
                    int curv = (w * ts * k_curv_q8) >> 20;
                    int lin = k_bl + ((val * slope_q8) >> 8);
                    pix[c] = clamp_u8(val + curv + lin);
                }
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

    // True WYSIWYG parameters synchronized with offline still photo grading
    float eff_contrast_p = prof->contrast_p;
    if (s_ft_contrast > 0.0f) {
        eff_contrast_p += s_ft_contrast * 0.55f;
    } else if (s_ft_contrast < 0.0f) {
        eff_contrast_p += s_ft_contrast * 0.40f;
    }
    if (eff_contrast_p < 0.45f) eff_contrast_p = 0.45f;
    if (eff_contrast_p > 2.50f) eff_contrast_p = 2.50f;

    float eff_black_lift = prof->black_lift + (s_ft_shadows * 0.20f);
    if (eff_black_lift < 0.0f) eff_black_lift = 0.0f;
    if (eff_black_lift > 0.45f) eff_black_lift = 0.45f;

    float eff_white_comp = prof->white_comp - (s_ft_highlights * 0.20f);
    if (eff_white_comp < eff_black_lift + 0.10f) eff_white_comp = eff_black_lift + 0.10f;
    if (eff_white_comp > 1.0f) eff_white_comp = 1.0f;

    float k_curv = (eff_contrast_p - 1.0f) * 42.0f;
    float k_bl_f = eff_black_lift * 255.0f;
    float k_wc_f = (eff_white_comp - 1.0f) * 255.0f;

    int16_t k_curv_q8 = (int16_t)roundf(k_curv * 256.0f);
    int32_t k_bl = (int32_t)roundf(k_bl_f);
    int16_t slope_q8 = (int16_t)roundf(k_wc_f - k_bl_f);

    float eff_mc = prof->micro_contrast;
    if (s_ft_contrast > 0.0f) {
        eff_mc += s_ft_contrast * 0.15f;
    } else if (s_ft_contrast < 0.0f) {
        eff_mc += s_ft_contrast * 0.10f;
    }
    int16_t mc_gain_q8 = (int16_t)roundf(eff_mc * 256.0f);

    float eff_saturation = prof->saturation;
    if (!prof->is_monochrome) {
        eff_saturation *= (1.0f + 0.70f * s_ft_vibrance);
        if (eff_saturation < 0.0f) eff_saturation = 0.0f;
        if (eff_saturation > 2.50f) eff_saturation = 2.50f;
    }
    int16_t scale_uv = prof->is_monochrome ? 0 : (int16_t)roundf(eff_saturation * 256.0f);
    if (scale_uv < 0) scale_uv = 0;

    float eff_mid_u = (prof->shadow_u * 0.45f + prof->highlight_u * 0.55f) - (s_ft_tint * 20.0f);
    float eff_mid_v = (prof->shadow_v * 0.45f + prof->highlight_v * 0.55f) + (s_ft_tint * 20.0f);
    int16_t shift_u = (int16_t)roundf(eff_mid_u);
    int16_t shift_v = (int16_t)roundf(eff_mid_v);
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
                                k_curv_q8, k_bl, slope_q8, is_monochrome);
            } else {
                uint32_t y_size = desc.stride * desc.height;
                neon_grade_y((uint8_t*)virt, desc.width, desc.height, desc.stride, k_curv_q8, k_bl, slope_q8, mc_gain_q8);
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
                        planes.planes[0].rowStride, k_curv_q8, k_bl, slope_q8, is_monochrome);
    } else if (planes.planeCount == 1) {
        uint32_t y_size = planes.planes[0].rowStride * height;
        neon_grade_y((uint8_t*)planes.planes[0].data, width, height,
                     planes.planes[0].rowStride, k_curv_q8, k_bl, slope_q8, mc_gain_q8);
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
                     planes.planes[0].rowStride, k_curv_q8, k_bl, slope_q8, mc_gain_q8);

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
    float sh_u = s_active_shadow_u;
    float sh_v = s_active_shadow_v;
    float hl_u = s_active_highlight_u;
    float hl_v = s_active_highlight_v;
    float cyan_sky = s_active_cyan_sky;
    float fol_warmth = s_active_foliage_warmth;
    float bloom_s = s_active_bloom_strength;
    float bloom_r = s_active_bloom_r;
    float bloom_g = s_active_bloom_g;
    float bloom_b = s_active_bloom_b;
    float micro_c = s_active_micro_contrast;

    LOGI("ProPatcher: Grading Captured Photo: %dx%d (%d channels, stride=%d), Look=%d, Mono=%d, Sat=%.2f, ShTint=(%.1f,%.1f), HlTint=(%.1f,%.1f), CyanSky=%.2f, FolWarmth=%.2f, Bloom=%.2f (R=%.2f,G=%.2f,B=%.2f), MicroContrast=%.2f",
         width, height, channels, stride, lookId, is_monochrome, sat, sh_u, sh_v, hl_u, hl_v, cyan_sky, fol_warmth, bloom_s, bloom_r, bloom_g, bloom_b, micro_c);

    lut_grade_raster((uint8_t*)dataPtr, (uint32_t)width, (uint32_t)height, (uint32_t)channels, (uint32_t)stride,
                     lut_y, sat, sh_u, sh_v, hl_u, hl_v, cyan_sky, fol_warmth,
                     bloom_s, bloom_r, bloom_g, bloom_b, micro_c, is_monochrome);
}


