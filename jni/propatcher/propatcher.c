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
