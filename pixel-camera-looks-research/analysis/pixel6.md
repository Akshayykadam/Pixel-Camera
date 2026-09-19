# Generational Teardown: Pixel 6 (Oriole / Raven / Bluejay / P21)

## Target Profile
* **Generation**: Pixel 6, Pixel 6 Pro, Pixel 6a
* **SoC**: Google Tensor G1 (First-gen Google Silicon)
* **RAM**: 6 GB (Pixel 6a) / 8 GB (Pixel 6) / 12 GB (Pixel 6 Pro)
* **Target Android Version**: Android 13 / 14 / 15
* **Camera HAL Interface**: `com.google.android.camera.experimental2021`

---

## Compatibility Assessment

### 1. Feature Gating & Bypass
* **Device Identification**:
  In `uyv.java`, Pixel 6 devices correspond to flags `a` (Pixel 6), `b` (Pixel 6 Pro), and `d` (Pixel 6a).
  `uyv.l()` returns `false` due to these explicit flags.
* **Required Bypass**:
  Bypassing `uyv.l()` and forcing `klm.q(kjq.bm)` / `klm.q(kjq.bl)` to `true`.
* **UI Behavior**:
  The Camera Looks overlay loads and functions properly. UI navigation and slider adjustments are responsive.

### 2. Camera HAL & Vendor Tag Behavior
* The Pixel 6 Camera HAL implements `experimental2021` (Version 7).
* `tds.c` is `null`; vendor tag passing is skipped.
* No low-level driver failures or sensor timeouts occur.

### 3. Image Processing & Memory Considerations
* `mla.K()` sets `ShotParams_tomte_type_set(shotParams.a, shotParams, lookId)`.
* In `ifj.java`, `zrq` maps to `DEVICE_UNSPECIFIED` (`0`), triggering `looknet_v2.1_float.tflite.uncompressed`.
* **Memory & Processing Latency**:
  * On Tensor G1, Halide tonal processing takes ~2.0s–2.4s per shot.
  * On the 6 GB RAM model (Pixel 6a), shooting rapid consecutive bursts with Camera Looks active can cause memory pressure, potentially triggering background app eviction or delayed post-processing.
  * For single captures and normal photo sessions, processing completes successfully.

### 4. Verdict
**Status: PARTIAL / PASS WITH ADVISORY**
* Single and moderate-paced photography: **PASS** (image processing functions correctly).
* Rapid burst photography on 6 GB Pixel 6a: **ADVISORY** (elevated capture latency).
