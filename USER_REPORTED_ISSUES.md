# User-Reported Bugs & Feedback Tracker

This document tracks bugs, image tuning observations, and feature requests reported by users across issues on GitHub.

---

## 🐛 Confirmed Bugs & Broken Behavior

### 1. Duplicate "Shadows" Preset in Looks Bar
* **Issue:** [#57](https://github.com/Akshayykadam/Pixel-Camera/issues/57)
* **Reporter:** `@hubertmeier`
* **Description:** In the Camera Looks / Styles selector bar in settings, the "Shadows" preset appears twice.
* **Planned Action:** Remove the duplicate entry registration in the Looks carousel list adapter.

### 2. Camera Styles Breaking HDR & Causing Blown-Out Highlights
* **Issue:** [#55](https://github.com/Akshayykadam/Pixel-Camera/issues/55)
* **Reporter:** `@TheArka96`
* **Description:** Creative styles (Editorial, Velvet, Classic, Digi, etc.) produce non-HDR pictures with burned-out highlights on captured photos, failing to match what is displayed in the live viewfinder preview.
* **Planned Action:** Route style tone-mapping through a software CLUT fallback so HDR exposure fusion and dynamic range are maintained during still capture.

### 3. Styles Not Applying & Missing Metadata in Google Photos
* **Issue:** [#55](https://github.com/Akshayykadam/Pixel-Camera/issues/55)
* **Reporter:** `@TheArka96`
* **Description:** Styles such as **Flat**, **Buffalo**, and **Dijon** do not apply to captured photos (the camera silently saves a default picture) and lack the Google Photos "Sauce" style tag.
* **Planned Action:** Fix `ShotParams` Look ID enum mapping and LUT descriptor loading for `qvd`, `qvg`, and `qvi`.

### 4. Missing 50MP "High Resolution" Badge in Google Photos
* **Issue:** [#54](https://github.com/Akshayykadam/Pixel-Camera/issues/54)
* **Reporter:** `@TheArka96`
* **Description:** Even when photos are captured at 50MP, Google Photos does not display the high-resolution badge because the Google-specific XMP/EXIF tags are missing.
* **Planned Action:** Ensure required Google XMP metadata (`OriginalImageSize`, `SpecialTypes`) is embedded into the output JPEG file during 50MP capture.

### 5. Broken Transition from Camera to Google Photos (In-Flight Processing)
* **Issue:** [#54](https://github.com/Akshayykadam/Pixel-Camera/issues/54)
* **Reporter:** `@TheArka96`
* **Description:** Tapping the gallery thumbnail immediately after taking a heavy photo (50MP, Night Sight, Portrait) does not show the temporary "Still processing..." screen in Google Photos. The photo remains unavailable until background processing completely finishes.
* **Cause:** The cloned app identifier (`.morphe`) lacks the private signature trust bridge with Google Photos.
* **Planned Action:** Investigate enhancing the in-app quick viewer to display processing status locally.

### 6. Status Bar & Privacy Chip Overlapping Top Camera Controls
* **Issue:** [#53](https://github.com/Akshayykadam/Pixel-Camera/issues/53)
* **Reporter:** `@TheArka96`
* **Description:** On app launch, the system status bar and Android camera privacy chip overlay the top camera controls for several seconds instead of hiding immediately like the stock camera.
* **Cause:** Cloned/third-party app status causes Android to display the full privacy chip expansion animation, combined with a brief delay in applying full-screen window insets.
* **Planned Action:** Enforce immediate immersive full-screen window flags (`WindowInsetsControllerCompat`) during Activity creation to hide the status bar before controls render.

---

### 7. Color Warmth & Vibrance Sliders Have No Effect on Captured Photos
* **Issue:** User Feedback (Issue [#52](https://github.com/Akshayykadam/Pixel-Camera/issues/52) / Testing)
* **Reporter:** User testing
* **Description:** Color changes and styles are visible in the live viewfinder preview, but the actual saved photos show no color warmth/vibrance changes. The color-related adjustment sliders have no effect on the final photo.
* **Cause:** Look fine-tuning parameters and color adjustment sliders are hooked into the viewfinder GLSL shader but not properly bound to the native `ShotParams` / `ApplyTomteImageFinalizer` offline processing pipeline.
* **Planned Action:** Connect the warmth, vibrance, and look fine-tuning slider values to the native capture parameters so adjustments apply to saved photos.

---

## ⚙️ Performance, Usability & Image Tuning Issues

### 8. Phone Overheating During Camera Operation
* **Issue:** User Feedback (Issue [#52](https://github.com/Akshayykadam/Pixel-Camera/issues/52) / Testing)
* **Reporter:** User testing
* **Description:** The phone heats up noticeably during camera use even when JPEG compression quality is lowered to 95%.
* **Cause:** Heavy continuous per-frame GLSL fragment shader execution on high-resolution preview buffers, combined with 100% max display backlight and background post-processing services.
* **Planned Action:** Optimize OpenGL fragment shaders (reduce unnecessary instructions, use `lowp`/`mediump` precision), throttle shader overhead, and review display backlight enforcement.

### 9. Viewfinder Preview Lag / Stutter
* **Issue:** User Feedback (Issue [#52](https://github.com/Akshayykadam/Pixel-Camera/issues/52) / Testing)
* **Reporter:** User testing
* **Description:** The live viewfinder preview experiences stutter/frame drops when Look shaders are active.
* **Planned Action:** Profile and optimize GLSL shader compilation and execution in `wlo.c` / `TomteInitHelper` to maintain smooth 60 FPS playback.

### 10. Default JPEG Quality Set Too High (File Size Bloat)
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Out-of-the-box JPEG quality defaults to 100%, causing excessively large file sizes (15–25MB+) for everyday users.
* **Planned Action:** Change initial factory default to stock **95%**, while keeping 98% and 100% available in Settings.

### 11. Edge Control Halo Elimination Causes Overly Soft Telephoto Shots
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Lowering edge control to remove halo rings significantly reduces microcontrast, making the telephoto lens look overly soft.
* **Planned Action:** Explore per-lens sharpness profile tuning so telephoto retains acutance while main camera avoids halos.

### 12. Elevated Shadow Noise on Pixel 10 Pro
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Pixel 10 Pro exhibits more noise in shadow regions compared to Pixel 8 Pro due to sensor DCG gain switching and bracketing differences.
* **Planned Action:** Evaluate shadow-specific tuning and exposure bracketing adjustments for Tensor G5 / Pixel 10 family.

---

## 💡 Feature Requests & Inquiries

### 13. 10-Step Noise Reduction & Independent Luma/Chroma Control
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Offer a granular 10-step scale (`0.0` to `1.0` in `0.1` increments) instead of 3 coarse presets, plus separate controls for chrominance vs. luminance noise.
* **Planned Action:** Investigate hooking Bayer denoise multipliers directly in Gcam's native pipeline.

### 14. Grainy Photos & Degraded Clarity in Standard Mode
* **Status:** ✅ **Fixed**
* **Reporter:** User testing (Pixel 8 Pro `husky`)
* **Description:** Captured photos appeared grainy, gritty, and less clear than stock Pixel Camera output even when Spatial Noise Reduction and Edge Sharpness were set to "Standard".
* **Root Causes:**
  1. **Continuous Camera2 Session Mode Conflict:** `plh.smali` and `pbe.smali` passed `NOISE_REDUCTION_MODE = 2` (`HIGH_QUALITY`) and `EDGE_MODE = 2` (`HIGH_QUALITY`) to continuous Camera2 requests. On Google Tensor hardware (Lyric HAL), high-quality mode on real-time preview streams caused GTNR merge failure (`FAILED_PRECONDITION: Invalid feedback image, force sharpen only process!`), which completely bypassed hardware temporal noise reduction and forced raw ISP edge sharpening.
  2. **Active Look Override:** `TomteInitHelper.getEffectiveLookId()` persisted Look 5 ("Digi") from `pref_sauce_key` and forcibly overrode `ShotParams.tomte_type` to `5` for all still shots. Look 5 intentionally applies digital sensor grain (`TomteGrainRunner`) and punchy digicam edge contrast.
  3. **Loss of Stock Curve Bit-Parity in ProPatcher:** In `libpropatcher.so`, standard mode re-multiplied floats in `.rodata` curves rather than directly restoring the backup buffer.
* **Fix Implemented:**
  1. Added `getCamera2NoiseReductionMode()` and `getCamera2EdgeMode()` in `TomteInitHelper`: returns `1` (`FAST`) for Standard mode (matching stock Google Camera continuous requests), preventing Lyric HAL GTNR merge failures and ensuring hardware temporal denoising runs normally.
  2. Guarded `TomteInitHelper.getEffectiveLookId()` with `if-lez v0`: Look overrides now only apply if a positive Look ID (> 0) is actively selected, preserving pure stock HDR+ when Look 0 ("Original") or uninitialized.
  3. Updated `propatcher.c`: When Sharpen is 1.0x and Denoise is Standard (mode 2), directly restores `s_backup` via `memcpy`, guaranteeing 100% bit-for-bit parity with stock Google Camera `.rodata` tuning curves.
