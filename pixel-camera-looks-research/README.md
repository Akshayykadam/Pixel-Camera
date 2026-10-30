# Pixel Camera Looks Backport Project

Reverse-engineering and backporting investigation for Google's **Pixel 11 Camera Looks** feature to older Google Pixel generations (Pixel 6 through Pixel 10).

Reference Implementation: **Google Pixel Camera `11.1.040.982810059.19` (Build `70000000`) & `11.0.073.972752740.32` (Build `69623294`)**

---

## 🔗 Quick Links & Navigation

* **Master Guide**: [Root Project README](../README.md)
* **Pre-Patched Standalone APK**: [⬇️ Download Latest Patched APK v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download)
* **Morphe Patch Package**: [⬇️ Download Morphe Patch .mpp v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download) • [GitHub Raw](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp)
* **Camera Looks Patch Source**: [`CameraLooksPatch.kt`](../morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt)
* **Injected Neural Runtime Helper**: [`TomteInitHelper.smali`](../smali_patches/TomteInitHelper.smali)
* **Material You Pro Panel**: [`TomteProSettingsPanel.smali`](../smali_patches/TomteProSettingsPanel.smali)
* **Unified Smali Patches**: [`patches/looks_pipeline.patch`](../patches/looks_pipeline.patch) • [`patches/looks_native_engine.patch`](../patches/looks_native_engine.patch) • [`patches/qkj_exif_fallback.patch`](../patches/qkj_exif_fallback.patch) • [`patches/qmy_look_callback.patch`](../patches/qmy_look_callback.patch)
* **Technical Architecture & Dual-EV Teardown**: [docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md](../docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md)
* **Changelog & Technical Audit**: [CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md](../CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)

---

## 📁 Directory Structure & Research Reports

* 📄 [README.md](README.md) — Project overview, directory layout, and quickstart (this file).
* 🔬 [RESEARCH.md](RESEARCH.md) — Comprehensive technical report answering all 10 core questions regarding gating, Halide kernels, neural style models, and vendor HAL tags.
* 📋 [COMPATIBILITY.md](COMPATIBILITY.md) — Detailed generational compatibility matrix & hardware analysis (Tensor G1 through G6).
* 👤 [PORTRAIT_RESEARCH.md](PORTRAIT_RESEARCH.md) — Portrait mode integration, Gouda pipeline teardown, and monocular depth routing.

### 📱 Per-Generation Hardware Deep Dives (`analysis/`)
* 📑 [analysis/pixel11_reference.md](analysis/pixel11_reference.md) — Master teardown of Pixel 11 reference bundle & hardware ISP vendor tags.
* 📑 [analysis/pixel11.md](analysis/pixel11.md) — Pixel 11 Tensor G6 architecture and preview LUT integration.
* 📑 [analysis/pixel10.md](analysis/pixel10.md) — Tensor G5 compatibility, HAL differences & 12MP binned RAW dimension behavior.
* 📑 [analysis/pixel9.md](analysis/pixel9.md) — Tensor G4 compatibility & HAL analysis (Pixel 9 Pro / 9 Pro XL / 9 Pro Fold).
* 📑 [analysis/pixel8.md](analysis/pixel8.md) — Tensor G3 compatibility & HAL analysis (Pixel 8 Pro / 8 / 8a).
* 📑 [analysis/pixel7.md](analysis/pixel7.md) — Tensor G2 compatibility & HAL analysis (Pixel 7 Pro / 7 / 7a).
* 📑 [analysis/pixel6.md](analysis/pixel6.md) — Tensor G1 compatibility & HAL analysis (Pixel 6 Pro / 6 / 6a).

### 🧪 Verification Framework (`tests/`)
* 🧪 [tests/test-plan.md](tests/test-plan.md) — Systematic test protocols (UI, Capture, Image, Stability, Memory limits).
* 📊 [tests/results.md](tests/results.md) — Test evaluation report & image diff benchmarks across devices.

---

## Executive Summary

1. **Feature Architecture**:
   * Google designates the user-facing feature **"Camera Looks"** internally as **`sauce`**.
   * The tone mapping, color rendering, and grain engine is designated as **`tomte`**.
   * The 13 Looks presets are:
     * `0`: **Original** (`sauce_default_label`)
     * `1`: **Natural** (`sauce_natural_label`)
     * `2`: **Shadows** (`sauce_shadows_label`)
     * `3`: **Vanilla** (`sauce_orange_label`)
     * `4`: **Editorial** (`sauce_kodachrome_label`)
     * `5`: **Velvet** (`sauce_velvia_label`)
     * `6`: **Classic** (`sauce_portra_label`)
     * `7`: **Digi** (`sauce_digicam_label`)
     * `8`: **Black Tie** (`sauce_black_and_white_label`)
     * `9`: **Minimal** (`sauce_minimal_label`)
     * `10`: **Flat** (`sauce_pesto_label`)
     * `11`: **Buffalo** (`sauce_unflat_label`)
     * `12`: **Dijon** (`sauce_yellow_green_faded_label`)

2. **Feature Gating**:
   * **Device Eligibility**: Controlled by `uyv.l()`, which explicitly blacklists Pixel 1 through Pixel 10.
   * **Feature Flags**:
     * `camera.sauce_eligible` (`kjq.bm`)
     * `camera.sauce_enabled` (`kjq.bl`)
     * `camera.sauce_onboarding_enabled` (`kjq.bn`)
   * **UI Instantiation**: `pzs.java` (Case 5) inflates `id/sauce_overlay_view_stub` with `SauceSelectionOverlay` (Jetpack Compose View) only when both flags evaluate to `true`.

3. **Image Processing & Hardware Independence**:
   * **Camera HAL Vendor Tags**: On Pixel 11, the camera sends `REQUEST_TOMTE_TYPE` (`com.google.android.camera.experimental2026`). On older Pixels, this tag is safely skipped without crashing.
   * **Native Software Fallback**: In `mla.K()`, GCam checks `RESULT_TOMTE_TYPE`. When the HAL tag is absent, GCam falls back to setting `ShotParams_tomte_type_set(shotParams.a, shotParams, lookId)` using the user's selected Look directly.
   * **Halide/C++ Finalizer**: Native library `libgcastartup.so` contains `wireless/android/camera/tomte/tomte_tonemap.cc`, executing `RunLearnableLinearSpaceTonalProcessing`, `GlobalTonemap`, and `ApplyContrastBoost` on CPU/GPU.
   * **Neural Style Models**: `split_all_in_feature_module_p26.apk` includes both TPU-accelerated (`looknet_v2.1_custom-op_26.tflite`) and generic floating-point (`looknet_v2.1_float.tflite`) models, enabling non-Tensor G6 devices to perform neural style inference.

4. **Morphe Patch Package**:
   * Official implementation: [`CameraLooksPatch.kt`](../morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt).
   * Unlocks all 13 Looks across Tensor G1–G5 on-device via Morphe Manager without root.

For in-depth analysis, proceed to [RESEARCH.md](RESEARCH.md), [COMPATIBILITY.md](COMPATIBILITY.md), and [PORTRAIT_RESEARCH.md](PORTRAIT_RESEARCH.md).
