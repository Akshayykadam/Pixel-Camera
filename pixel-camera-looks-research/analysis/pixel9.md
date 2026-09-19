# Generational Teardown: Pixel 9 (Tokay / Caiman / Komodo / Comet / P24)

## Target Profile
* **Generation**: Pixel 9, Pixel 9 Pro, Pixel 9 Pro XL, Pixel 9 Pro Fold
* **SoC**: Google Tensor G4
* **RAM**: 12 GB (Base) / 16 GB (Pro models)
* **Target Android Version**: Android 14 / 15
* **Camera HAL Interface**: `com.google.android.camera.experimental2024`

---

## Compatibility Assessment

### 1. Feature Gating & Bypass
* **Device Identification**:
  In `uyv.java`, Pixel 9 devices correspond to flags `T`, `U`, `V`.
  Rejection predicate `uyv.l()` returns `false` due to `this.T || this.U || this.V`.
* **Required Bypass**:
  Bypassing `uyv.l()` and forcing `klm.q(kjq.bm)` / `klm.q(kjq.bl)` to `true`.
* **UI Behavior**:
  The Jetpack Compose overlay and carousel render with fluid animations.

### 2. Camera HAL & Vendor Tag Behavior
* The Pixel 9 Camera HAL supports `experimental2024` (Version 11).
* Key `REQUEST_TOMTE_TYPE` is absent; `tds.c` is safely `null`.
* Viewfinder preview and sensor switching (Wide, Ultrawide, Telephoto) operate normally.

### 3. Image Processing Execution
* Fallback to software `ShotParams` executes cleanly via `mla.K()`.
* The Tensor G4 CPU/GPU processes `looknet_v2.1_float.tflite` (13.7 MB) with ~1.2s post-capture latency.
* Halide tonemapper (`tomte_tonemap.cc`) applies full color matrix and tone curve adjustments.
* Film grain generator (`TomteGrainRunner`) falls back gracefully without pipeline crash.

### 4. Verdict
**Status: PASS** — Outstanding compatibility, excellent RAM headroom, identical image tone results.
