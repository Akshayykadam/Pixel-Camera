# Reference Architecture: Pixel 11 (Kodiak / P26)

This document serves as the master baseline reference for how **Pixel 11 Camera Looks** functions in its native environment.

---

## Device & Build Specifications

* **Product Generation**: Pixel 11 Series (Pixel 11, Pixel 11 Pro, Pixel 11 Pro XL)
* **Internal Codenames**: `kodiak`, `p26`
* **SoC / TPU**: Google Tensor G6
* **OS Platform**: Android 17 (Target API 37)
* **Camera Version**: `11.0.073.972752740.32` (`69623294`)
* **Camera APEX / HAL**: `com.google.pixel.camera.hal.apex` (Release keys `kodiak_CD1A`)

---

## Native Execution Flow

```text
User selects Look (e.g., Editorial)
                 │
                 ▼
SauceSelectionOverlay (Jetpack Compose View)
                 │
                 ▼
qmy / qnt state machine updates pref_sauce_key
                 │
                 ▼
Shutter button pressed
                 │
                 ▼
hzs attaches yza protobuf (Look ID 4) to ShotLog/Capture
                 │
                 ▼
Camera2 capture request dispatched with:
  - CaptureRequest.Key: REQUEST_TOMTE_TYPE = 4
  - CaptureRequest.Key: REQUEST_TOMTE_CAPS (Contrast/Highlights/Shadows vector)
  - CaptureRequest.Key: REQUEST_TOMTE_AURA (Tint/Tone/Vibrance vector)
  - CaptureRequest.Key: REQUEST_TOMTE_EXTRA (Sharpness/Grain vector)
                 │
                 ▼
Tensor G6 Camera HAL & ISP:
  - Configures sensor pipeline & preliminary color calibration
                 │
                 ▼
Gcam Native Core (libgcastartup.so):
  - Ingests raw frames + FrameMetadata
  - Invokes Tomte tonemapper (wireless/android/camera/tomte/tomte_tonemap.cc)
  - Evaluates Halide global tone curve & non-linear color matrix
  - Executes TomteGrainRunner on Tensor G6 TPU via DarwiNN delegate
                 │
                 ▼
Final Output:
  - Processed JPEG / Ultra HDR with applied style
  - EXIF metadata includes GFileMetadata$Sauce
```

---

## Key Assets in Reference Bundle

| Asset File | Split APK | Size | Description |
| :--- | :--- | :--- | :--- |
| `looknet_v2.1_custom-op_26.tflite.uncompressed` | `split_all_in_feature_module_p26.apk` | 7.4 MB | TPU-accelerated style classification model |
| `looknet_v2.1_float.tflite.uncompressed` | `split_all_in_feature_module_p26.apk` | 13.7 MB | CPU/GPU floating point fallback model |
| `all_in_film_blender.tflite.uncompressed` | `split_all_in_feature_module_p26.apk` | 10.7 MB | Film blend blending model |
| `3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed` | `split_hdrplus_asset_module_p26.apk` | 1.06 MB | DarwiNN TPU film grain model |
| `libgcastartup.so` | `split_startup_jni_split_module.apk` | 166.4 MB | Core GCam engine + Tomte Halide kernels |

---

## Reference Constants & Presets

```java
// Look Identifiers (qlh subclasses)
public static final int LOOK_ORIGINAL   = 0; // qkv
public static final int LOOK_NATURAL    = 1; // qkz
public static final int LOOK_SHADOWS    = 2; // qky
public static final int LOOK_VANILLA    = 3; // qld
public static final int LOOK_EDITORIAL  = 4; // qla
public static final int LOOK_VELVET     = 5; // qkw
public static final int LOOK_CLASSIC    = 6; // qku
public static final int LOOK_DIGI       = 7; // qlg
public static final int LOOK_BLACK_TIE  = 8; // qle
public static final int LOOK_MINIMAL    = 9; // qlb
```
