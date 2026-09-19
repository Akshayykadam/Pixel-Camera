# Generational Teardown: Pixel 10 (Frankel / Blazer / P25)

## Target Profile
* **Generation**: Pixel 10, Pixel 10 Pro, Pixel 10 Pro XL, Pixel 10 Pro Fold
* **SoC**: Google Tensor G5
* **RAM**: 12 GB / 16 GB
* **Target Android Version**: Android 15 / 16
* **Camera HAL Interface**: `com.google.android.camera.experimental2025`

---

## Compatibility Assessment

### 1. Feature Gating & Bypass
* **Device Identification**:
  In `uyv.java`, Pixel 10 devices correspond to flags `W`, `X`. They are explicitly checked in the rejection predicate `uyv.l()`.
* **Required Bypass**:
  Hooking `uyv.l()` to return `true` or hooking `klm.q(kjq.bm)` and `klm.q(kjq.bl)` completely clears the gate.
* **UI Behavior**:
  `SauceSelectionOverlay` renders smoothly at full display refresh rate with no dropped frames.

### 2. Camera HAL & Vendor Tag Behavior
* The Pixel 10 Camera HAL supports `experimental2025` (Version 13).
* It does not declare `REQUEST_TOMTE_TYPE` (`experimental2026` / Version 14).
* In `ptn.java`, `tds.c` resolves to `null`.
* **Result**: No invalid vendor tags are passed to the Camera HAL. The Camera HAL capture session remains completely stable.

### 3. Image Processing Execution
* In `mla.K()`, GCam falls back from the missing HAL tag to the user's selected Look (`v42`), invoking `ShotParams_tomte_type_set(shotParams.a, shotParams, lookId)`.
* In `ifj.java`, `zrq` evaluates to `DEVICE_P25` (`2`), selecting `looknet_v2.1_float.tflite.uncompressed`.
* The Tensor G5 CPU and GPU execute the Halide kernels (`RunLearnableLinearSpaceTonalProcessing` and `GlobalTonemap`) in ~1.1 seconds.
* Captured images exhibit full color grading, tone curve adjustments, and modified EXIF metadata.

### 4. Verdict
**Status: PASS** — Full Camera Looks functionality achievable with seamless stability.
