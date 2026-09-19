# Pixel Camera Looks Backport Project

Reverse-engineering and backporting investigation for Google's **Pixel 11 Camera Looks** feature to older Google Pixel generations (Pixel 6 through Pixel 10).

Reference Implementation: **Google Pixel Camera `11.0.073.972752740.32` (Build `69623294`)**

---

## Directory Structure

```text
pixel-camera-looks-research/
├── README.md                          # Project overview, directory layout, and quickstart
├── RESEARCH.md                        # Comprehensive technical report answering all 10 core questions
├── COMPATIBILITY.md                   # Detailed generational compatibility matrix & hardware analysis
│
├── analysis/                          # Per-generation deep dive reports
│   ├── pixel11_reference.md           # Master teardown of Pixel 11 reference bundle
│   ├── pixel10.md                     # Tensor G5 compatibility, HAL differences & behavior
│   ├── pixel9.md                      # Tensor G4 compatibility & HAL analysis
│   ├── pixel8.md                      # Tensor G3 compatibility & HAL analysis
│   ├── pixel7.md                      # Tensor G2 compatibility & HAL analysis
│   └── pixel6.md                      # Tensor G1 compatibility & HAL analysis
│
└── tests/                             # Verification framework
    ├── test-plan.md                   # Systematic test protocols (UI, Capture, Image, Stability)
    └── results.md                     # Test evaluation report & image diff benchmarks
```

> [!NOTE]
> The official bytecode patch implementation for Camera Looks is located in [`morphe-patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt`](../morphe-patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt).


---

## Executive Summary

1. **Feature Architecture**:
   * Google designates the user-facing feature **"Camera Looks"** internally as **`sauce`**.
   * The tone mapping, color rendering, and grain engine is designated as **`tomte`**.
   * The 10 Looks presets are:
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
   * Official implementation: [`CameraLooksPatch.kt`](../morphe-patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt).
   * Unlocks all 10 Looks across Tensor G1–G5 on-device via Morphe Manager without root.

For in-depth analysis, proceed to [RESEARCH.md](RESEARCH.md) and [COMPATIBILITY.md](COMPATIBILITY.md).
