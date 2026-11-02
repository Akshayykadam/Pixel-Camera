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

### 7. Prebuilt Standalone APK Fails to Install on Pixel 10 Pro
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** The provided prebuilt APK cannot be installed on Pixel 10 Pro due to package signature conflicts with the stock camera (whereas the Morphe-built clone `.morphe` installs cleanly).
* **Planned Action:** Ensure all prebuilt standalone releases use the cloned package ID (`com.google.android.GoogleCamera.morphe`) and valid signing keys.

---

## ⚙️ Image Tuning & Usability Issues

### 8. Default JPEG Quality Set Too High (File Size Bloat)
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Out-of-the-box JPEG quality defaults to 100%, causing excessively large file sizes (15–25MB+) for everyday users.
* **Planned Action:** Change initial factory default to stock **95%**, while keeping 98% and 100% available in Settings.

### 9. Edge Control Halo Elimination Causes Overly Soft Telephoto Shots
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Lowering edge control to remove halo rings significantly reduces microcontrast, making the telephoto lens look overly soft.
* **Planned Action:** Explore per-lens sharpness profile tuning so telephoto retains acutance while main camera avoids halos.

### 10. Elevated Shadow Noise on Pixel 10 Pro
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Pixel 10 Pro exhibits more noise in shadow regions compared to Pixel 8 Pro due to sensor DCG gain switching and bracketing differences.
* **Planned Action:** Evaluate shadow-specific tuning and exposure bracketing adjustments for Tensor G5 / Pixel 10 family.

---

## 💡 Feature Requests & Inquiries

### 11. 10-Step Noise Reduction & Independent Luma/Chroma Control
* **Issue:** [#56](https://github.com/Akshayykadam/Pixel-Camera/issues/56)
* **Reporter:** `@hubertmeier`
* **Description:** Offer a granular 10-step scale (`0.0` to `1.0` in `0.1` increments) instead of 3 coarse presets, plus separate controls for chrominance vs. luminance noise.
* **Planned Action:** Investigate hooking Bayer denoise multipliers directly in Gcam's native pipeline.

### 12. 50MP Panoramic Mode Feasibility
* **Issue:** [#58](https://github.com/Akshayykadam/Pixel-Camera/issues/58)
* **Reporter:** `@hubertmeier`
* **Description:** Inquiry on whether full 50MP streaming capture can be used in Panorama mode.
* **Status:** Hardware & memory streaming limits prevent real-time 50MP raw frames during sweep; exploring higher resolution input stream buffers (4K) to maximize stitched output sharpness.
