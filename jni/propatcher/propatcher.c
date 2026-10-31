#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
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
    int patched_denoise_files = 0;
    int patched_denoise_floats = 0;

    float denoiseScale = 1.0f;
    if (denoiseMode == 0) denoiseScale = 0.0f;       // Off
    else if (denoiseMode == 1) denoiseScale = 0.5f;  // Minimal
    else denoiseScale = 1.0f;                        // Standard

    uintptr_t tuning_start = base + TUNING_START_OFFSET;
    uintptr_t tuning_end = tuning_start + TUNING_SIZE;

    for (uintptr_t toc_ptr = base + TOC_START_OFFSET; toc_ptr < base + TOC_END_OFFSET; toc_ptr += sizeof(TocEntry)) {
        TocEntry* entry = (TocEntry*)toc_ptr;
        uintptr_t data_addr = (uintptr_t)entry->p_data;
        if (data_addr >= tuning_start && data_addr + entry->sz <= tuning_end &&
            entry->sz > 0 && entry->sz < 10000) {
            
            const char* name = (const char*)entry->p_name;
            uintptr_t rel_offset = data_addr - tuning_start;

            // Handle Sharpen assets
            if (strstr(name, "sharpen_")) {
                patched_sharpen_files++;
                for (size_t j = 0; j + 7 <= entry->sz; j++) {
                    if (s_backup[rel_offset + j] == 0x0a &&
                        s_backup[rel_offset + j + 1] == 0x14 &&
                        s_backup[rel_offset + j + 2] == 0x0d) {
                        
                        float orig_val;
                        memcpy(&orig_val, &s_backup[rel_offset + j + 3], sizeof(float));
                        float new_val = orig_val * sharpenScale;
                        memcpy((void*)(data_addr + j + 3), &new_val, sizeof(float));
                        patched_sharpen_floats++;
                        j += 6;
                    }
                }
            }
            // Handle Denoise assets
            else if (strstr(name, "denoise")) {
                patched_denoise_files++;
                for (size_t j = 0; j + 7 <= entry->sz; j++) {
                    if (s_backup[rel_offset + j] == 0x0a &&
                        (s_backup[rel_offset + j + 1] == 0x0f || s_backup[rel_offset + j + 1] == 0x0a) &&
                        s_backup[rel_offset + j + 2] == 0x0d) {
                        
                        float orig_val;
                        memcpy(&orig_val, &s_backup[rel_offset + j + 3], sizeof(float));
                        float new_val = orig_val * denoiseScale;
                        memcpy((void*)(data_addr + j + 3), &new_val, sizeof(float));
                        patched_denoise_floats++;
                        j += 6;
                    }
                }
            }
        }
    }

    mprotect((void*)page_start, protect_len, PROT_READ);

    LOGI("Dynamic Tuning Applied: Sharpen=%.2fx (%d assets, %d floats), Denoise=%.2fx (mode=%d, %d assets, %d floats)",
         sharpenScale, patched_sharpen_files, patched_sharpen_floats,
         denoiseScale, denoiseMode, patched_denoise_files, patched_denoise_floats);
}

static inline uint8_t clamp_u8(int v) {
    if (v < 0) return 0;
    if (v > 255) return 255;
    return (uint8_t)v;
}

// Grade 8 signed 16-bit values with 32-bit multiplication (immune to 16-bit overflow):
// out = clamp_u8(((w - 128) * scale_q8) / 256 + offset)
static inline uint8x8_t neon_grade_8(int16x8_t w, int16x4_t v_scale, int32x4_t v_offset) {
    int32x4_t p0 = vaddq_s32(vshrq_n_s32(vmull_s16(vget_low_s16(w), v_scale), 8), v_offset);
    int32x4_t p1 = vaddq_s32(vshrq_n_s32(vmull_s16(vget_high_s16(w), v_scale), 8), v_offset);
    return vqmovun_s16(vcombine_s16(vqmovn_s32(p0), vqmovn_s32(p1)));
}

// ARM NEON SIMD accelerated grading for Y plane (Luma)
static inline void neon_grade_y(uint8_t* y_data, uint32_t width, uint32_t height, uint32_t stride, int16_t scale_q8, int16_t offset) {
    if (scale_q8 == 256 && offset == 128) return;

    int16x4_t v_scale = vdup_n_s16(scale_q8);
    int32x4_t v_offset = vdupq_n_s32(offset);
    int16x8_t v_128 = vdupq_n_s16(128);

    for (uint32_t y = 0; y < height; y++) {
        uint8_t* row = y_data + y * stride;
        uint32_t x = 0;
        for (; x + 16 <= width; x += 16) {
            uint8x16_t vy = vld1q_u8(row + x);
            uint8x8_t lo = vget_low_u8(vy);
            uint8x8_t hi = vget_high_u8(vy);

            int16x8_t w_lo = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(lo)), v_128);
            int16x8_t w_hi = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(hi)), v_128);

            uint8x8_t r_lo = neon_grade_8(w_lo, v_scale, v_offset);
            uint8x8_t r_hi = neon_grade_8(w_hi, v_scale, v_offset);

            uint8x16_t res = vcombine_u8(r_lo, r_hi);
            vst1q_u8(row + x, res);
        }
        for (; x < width; x++) {
            int val = ((int)row[x] - 128) * (int)scale_q8 / 256 + (int)offset;
            row[x] = clamp_u8(val);
        }
    }
}

// ARM NEON SIMD accelerated grading for NV12/NV21 UV plane (Chroma)
static inline void neon_grade_uv_nv12(uint8_t* uv_data, uint32_t width, uint32_t uv_h, uint32_t stride, int16_t scale_q8, int16_t shift_u, int16_t shift_v) {
    if (scale_q8 == 0 && shift_u == 0 && shift_v == 0) {
        for (uint32_t y = 0; y < uv_h; y++) {
            memset(uv_data + y * stride, 128, width);
        }
        return;
    }
    if (scale_q8 == 256 && shift_u == 0 && shift_v == 0) return;

    int16x4_t v_scale = vdup_n_s16(scale_q8);
    int16x8_t v_128 = vdupq_n_s16(128);
    int32x4_t v_off_u = vdupq_n_s32(128 + shift_u);
    int32x4_t v_off_v = vdupq_n_s32(128 + shift_v);

    for (uint32_t y = 0; y < uv_h; y++) {
        uint8_t* row = uv_data + y * stride;
        uint32_t x = 0;
        for (; x + 16 <= width; x += 16) {
            uint8x8x2_t uv = vld2_u8(row + x);

            int16x8_t u_w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(uv.val[0])), v_128);
            int16x8_t v_w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(uv.val[1])), v_128);

            uv.val[0] = neon_grade_8(u_w, v_scale, v_off_u);
            uv.val[1] = neon_grade_8(v_w, v_scale, v_off_v);

            vst2_u8(row + x, uv);
        }
        for (; x < width; x += 2) {
            int u = ((int)row[x] - 128) * (int)scale_q8 / 256 + 128 + shift_u;
            int v = ((int)row[x+1] - 128) * (int)scale_q8 / 256 + 128 + shift_v;
            row[x] = clamp_u8(u);
            row[x+1] = clamp_u8(v);
        }
    }
}

// ARM NEON SIMD accelerated grading for planar channels (YUV420 planar)
static inline void neon_grade_channel_planar(uint8_t* data, uint32_t width, uint32_t height, uint32_t stride, int16_t scale_q8, int16_t offset) {
    if (scale_q8 == 0) {
        for (uint32_t y = 0; y < height; y++) {
            memset(data + y * stride, (uint8_t)offset, width);
        }
        return;
    }
    neon_grade_y(data, width, height, stride, scale_q8, offset);
}

// ARM NEON SIMD accelerated grading for RGBA
static inline void neon_grade_rgba(uint8_t* data, uint32_t width, uint32_t height, uint32_t stride, int16_t scale_q8, int16_t offset, int is_monochrome) {
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
                for (int c = 0; c < 3; c++) {
                    int16x8_t w = vsubq_s16(vreinterpretq_s16_u16(vmovl_u8(rgba.val[c])), v_128);
                    rgba.val[c] = neon_grade_8(w, v_scale, v_offset);
                }
                vst4_u8(row + x * 4, rgba);
            }
            for (; x < width; x++) {
                uint8_t* pix = row + x * 4;
                for (int c = 0; c < 3; c++) {
                    int val = ((int)pix[c] - 128) * (int)scale_q8 / 256 + (int)offset;
                    pix[c] = clamp_u8(val);
                }
            }
        }
    }
}

JNIEXPORT void JNICALL
Java_com_google_android_patch_cameralooks_TomteInitHelper_nativeProcessHardwareBuffer(
    JNIEnv *env, jclass clazz, jobject hwBuffer, jint lookId) {
    (void)clazz;
    if (!hwBuffer || lookId <= 0) return;

    // Accurate 1:1 Look mapping aligned with Google Camera look classes:
    // 0: Original (Default) -> passthrough
    // 1: Natural (Class qvb)
    // 2: Minimal (Class qva)
    // 3: Shadows (Class qvf)
    // 4: Vanilla (Class qvc)
    // 5: Digi (Class quy)
    // 6: Black Tie (Class quw) - B&W Fine Art
    // 7: Dijon (Class qvi)
    // 8: Buffalo (Class qvg)
    // 9: Flat (Class qvd)
    // 10: Classic (Class qve)
    // 11: Editorial (Class quz) - Kodachrome
    // 12: Velvet (Class qvh) - Velvia

    int16_t scale_y = 256;
    int16_t offset_y = 128;
    int16_t scale_uv = 256;
    int16_t shift_u = 0;
    int16_t shift_v = 0;
    int is_monochrome = 0;

    // Calibrated 1:1 Look profiles matching Google Camera's native Tomte HDR+ pipeline:
    // 0: Original (Default) -> passthrough
    // 1: Natural (Class qvb) -> natural colors & relaxed details
    // 2: Minimal (Class qva) -> organic muted desaturation, lifted shadows
    // 3: Shadows (Class qvf) -> deep dramatic shadows, cool shadow tone
    // 4: Vanilla (Class qvc) -> "orange", warm creamy highlights, golden glow
    // 5: Digi (Class quy)    -> "digicam", vivid cyber retro-digital punch
    // 6: Black Tie (Class quw)-> pure high-contrast monochrome
    // 7: Dijon (Class qvi)   -> "yellow_green_faded", vintage 70s mustard fade
    // 8: Buffalo (Class qvg) -> "unflat", rugged bronze textural contrast
    // 9: Flat (Class qvd)    -> "pesto", cinematic log, lifted blacks, muted
    // 10: Classic (Class qve)-> "portra", Kodak Portra 400 golden film tones
    // 11: Editorial (Class quz)-> "kodachrome", high contrast magazine punch
    // 12: Velvet (Class qvh) -> "velvia", Fuji Velvia ultra-rich saturated pop

    switch (lookId) {
        case 1: // Natural: subtle, natural colors, relaxed contrast
            scale_y = 262; // 1.02x
            offset_y = 128;
            scale_uv = 262; // 1.02x
            break;
        case 2: // Minimal: organic, clean modern neutral, subdued
            scale_y = 236; // 0.92x
            offset_y = 132;
            scale_uv = 150; // 0.59x
            break;
        case 3: // Shadows: deep moody shadows, cool shadow tone
            scale_y = 312; // 1.22x
            offset_y = 118; // deep dark blacks
            scale_uv = 268;
            shift_u = +6;  // cool shadow bias
            shift_v = -4;
            break;
        case 4: // Vanilla ("orange"): warm creamy highlights, golden glow
            scale_y = 250; // 0.98x soft
            offset_y = 130;
            scale_uv = 276; // 1.08x
            shift_u = -12; // yellow
            shift_v = +8;  // amber/gold
            break;
        case 5: // Digi: punchy retro-digital cool tones
            scale_y = 300; // 1.17x
            offset_y = 128;
            scale_uv = 320; // 1.25x
            shift_u = +10; // cool digital
            shift_v = -4;
            break;
        case 6: // Black Tie: pure high-contrast monochrome
            scale_y = 340; // 1.33x
            offset_y = 128;
            scale_uv = 0;
            is_monochrome = 1;
            break;
        case 7: // Dijon ("yellow_green_faded"): vintage 70s mustard fade
            scale_y = 235; // 0.92x faded contrast
            offset_y = 135; // lifted shadows
            scale_uv = 270;
            shift_u = -16; // mustard yellow
            shift_v = -6;  // olive green
            break;
        case 8: // Buffalo ("unflat"): rugged bronze tint, textural contrast
            scale_y = 320; // 1.25x
            offset_y = 128;
            scale_uv = 295; // 1.15x
            shift_u = -10; // terracotta warm
            shift_v = +10; // bronze red
            break;
        case 9: // Flat ("pesto"): cinematic log, lifted blacks, muted highlights
            scale_y = 190; // 0.74x low contrast
            offset_y = 142; // lifted black point
            scale_uv = 160; // 0.62x muted saturation
            break;
        case 10: // Classic ("portra"): Kodak Portra golden tones, lifted blacks
            scale_y = 248; // 0.97x soft film contrast
            offset_y = 132; // lifted film shadows
            scale_uv = 265;
            shift_u = -8;  // warm golden
            shift_v = +6;  // filmic skin tone
            break;
        case 11: // Editorial ("kodachrome"): high fashion punch & rich reds
            scale_y = 315; // 1.23x
            offset_y = 126;
            scale_uv = 295; // 1.15x
            shift_u = +2;
            shift_v = +4;  // Kodachrome red pop
            break;
        case 12: // Velvet ("velvia"): ultra-rich saturated pop, vibrant
            scale_y = 300; // 1.17x
            offset_y = 126;
            scale_uv = 365; // 1.42x saturation
            break;
        default:
            return; // 0 or unknown: passthrough
    }

    AHardwareBuffer* buffer = AHardwareBuffer_fromHardwareBuffer(env, hwBuffer);
    if (!buffer) return;

    AHardwareBuffer_Desc desc;
    AHardwareBuffer_describe(buffer, &desc);

    static int s_last_logged_look = -1;
    if (s_last_logged_look != lookId) {
        LOGI("nativeProcessHardwareBuffer ACTIVE: %ux%u, format=0x%x, usage=0x%llx, stride=%u, lookId=%d",
             desc.width, desc.height, desc.format, (unsigned long long)desc.usage, desc.stride, lookId);
        s_last_logged_look = lookId;
    }

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
        // Fallback to simple lock
        void* virt = NULL;
        res = AHardwareBuffer_lock(buffer,
            AHARDWAREBUFFER_USAGE_CPU_WRITE_OFTEN,
            -1, NULL, &virt);
        if (res == 0 && virt) {
            if (is_rgba) {
                neon_grade_rgba((uint8_t*)virt, desc.width, desc.height, desc.stride * 4, scale_y, offset_y, is_monochrome);
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

        static int s_err_logged = 0;
        if (!s_err_logged) {
            LOGE("AHardwareBuffer_lock failed: err=%d (usage=0x%llx)", res, (unsigned long long)desc.usage);
            s_err_logged = 1;
        }
        return;
    }

    uint32_t width = desc.width;
    uint32_t height = desc.height;

    if (is_rgba || planes.planeCount == 1) {
        neon_grade_rgba((uint8_t*)planes.planes[0].data, width, height,
                        planes.planes[0].rowStride, scale_y, offset_y, is_monochrome);
    } else {
        // 1. Grade Luma (Y) across full width x height
        neon_grade_y((uint8_t*)planes.planes[0].data, width, height,
                     planes.planes[0].rowStride, scale_y, offset_y);

        // 2. Grade Chroma (UV) across full width x (height/2)
        uint32_t uv_h = (height + 1) / 2;

        // On Android YUV_420_888 (format 0x23), Gralloc almost always uses semi-planar NV12/NV21
        // where pixelStride == 2 and U/V are interleaved across the FULL row of `width` bytes.
        int is_interleaved = (planes.planeCount >= 2 && planes.planes[1].pixelStride == 2);
        if (!is_interleaved && planes.planeCount == 2) {
            is_interleaved = 1;
        }

        if (is_interleaved) {
            uint32_t uv_stride = planes.planes[1].rowStride ? planes.planes[1].rowStride : width;
            uint8_t* uv_data = (uint8_t*)planes.planes[1].data;
            int16_t shift_even = shift_u;
            int16_t shift_odd = shift_v;

            // Check if NV21 (V plane data address is before U plane data address)
            if (planes.planeCount >= 3 && planes.planes[2].data && planes.planes[2].data < planes.planes[1].data) {
                uv_data = (uint8_t*)planes.planes[2].data;
                shift_even = shift_v;
                shift_odd = shift_u;
            }

            if (is_monochrome) {
                // Neutralize Chroma across all rows and the ENTIRE width (no 50% split)
                for (uint32_t y = 0; y < uv_h; y++) {
                    memset(uv_data + y * uv_stride, 128, width);
                }
            } else {
                // Process all width bytes (width/2 pairs of UV)
                neon_grade_uv_nv12(uv_data, width, uv_h, uv_stride, scale_uv, shift_even, shift_odd);
            }
        } else if (planes.planeCount >= 3) {
            // Truly planar YUV420 (separate U and V planes with pixelStride == 1)
            uint32_t uv_w = (width + 1) / 2;
            if (is_monochrome) {
                for (uint32_t y = 0; y < uv_h; y++) {
                    memset((uint8_t*)planes.planes[1].data + y * planes.planes[1].rowStride, 128, uv_w);
                    memset((uint8_t*)planes.planes[2].data + y * planes.planes[2].rowStride, 128, uv_w);
                }
            } else {
                neon_grade_channel_planar((uint8_t*)planes.planes[1].data, uv_w, uv_h, planes.planes[1].rowStride, scale_uv, 128 + shift_u);
                neon_grade_channel_planar((uint8_t*)planes.planes[2].data, uv_w, uv_h, planes.planes[2].rowStride, scale_uv, 128 + shift_v);
            }
        }
    }

    AHardwareBuffer_unlock(buffer, NULL);
}

