# Generational Teardown: Pixel 7 (Panther / Cheetah / Lynx / Felix / Tangor / P22)

## Target Profile
* **Generation**: Pixel 7, Pixel 7 Pro, Pixel 7a, Pixel Fold, Pixel Tablet
* **SoC**: Google Tensor G2
* **RAM**: 8 GB / 12 GB
* **Target Android Version**: Android 13 / 14 / 15
* **Camera HAL Interface**: `com.google.android.camera.experimental2022`

---

## Compatibility Assessment

### 1. Feature Gating & Bypass
* **Device Identification**:
  In `uyv.java`, Pixel 7 devices correspond to flags `E`, `F`, `G`.
  Predicate `uyv.l()` returns `false` due to `this.E || this.F || this.G`.
* **Required Bypass**:
  Bypassing `uyv.l()` and forcing `klm.q(kjq.bm)` / `klm.q(kjq.bl)` to `true`.
* **UI Behavior**:
  UI operates reliably. On Pixel Fold (`Felix`), unfolding and folding transitions trigger `MainActivityLayout` re-measurement cleanly.

### 2. Camera HAL & Vendor Tag Behavior
* The Pixel 7 Camera HAL implements `experimental2022` (Version 8).
* `tds.c` is `null`; vendor tag passing is skipped.
* Camera preview, autofocus, and zoom operate normally.

### 3. Image Processing Execution
* `mla.K()` sets `ShotParams_tomte_type_set(shotParams.a, shotParams, lookId)`.
* In `ifj.java`, `zrq` maps to `DEVICE_UNSPECIFIED` (`0`), triggering `looknet_v2.1_float.tflite.uncompressed`.
* Tensor G2 executes `tomte_tonemap.cc` Halide kernels in ~1.7s.
* Color grading (Editorial, Velvet, Digi, etc.) is applied to the final image.

### 4. Verdict
**Status: PASS** — Fully viable with slight capture latency increase (~1.7s post-shot).
