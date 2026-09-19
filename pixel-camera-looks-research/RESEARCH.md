# Technical Research Report: Pixel 11 Camera Looks

This report delivers the technical reverse-engineering findings regarding the implementation, feature gates, hardware dependencies, and backportability of the **Pixel 11 Camera Looks** feature from **Google Pixel Camera `11.0.073.972752740.32`** (version code `69623294`).

---

## 1. Where Exactly Is Camera Looks Implemented?

Camera Looks is implemented across three core layers: UI/Framework, Capture Request Pipeline, and Native Post-Processing Engine.

```text
┌────────────────────────────────────────────────────────┐
│ UI / Presentation Layer                                │
│ - SauceSelectionOverlay (Compose overlay view)         │
│ - qnt / qmy (Selection state machine & observation)    │
│ - qlz / qmc (SauceSettings: 9 adjustment sliders)      │
│ - qkj (Look strings, icons, and labels)                │
└──────────────────────────┬─────────────────────────────┘
                           │ User selects Look
                           ▼
┌────────────────────────────────────────────────────────┐
│ Capture & Configuration Layer                          │
│ - qmy.t() -> rex.x = lookId                            │
│ - hzs -> ysc.i = yza proto (ShotParams metadata)       │
│ - ptn -> Camera2 vendor tag: REQUEST_TOMTE_TYPE (opt)  │
│ - mla.K() -> ShotParams_tomte_type_set(lookId)         │
└──────────────────────────┬─────────────────────────────┘
                           │ Capture dispatched to Gcam
                           ▼
┌────────────────────────────────────────────────────────┐
│ Native Image Processing Engine (libgcastartup.so)      │
│ - GcamModuleJNI / Gcam C++                             │
│ - wireless/android/camera/tomte/tomte_tonemap.cc       │
│   ├── RunLearnableLinearSpaceTonalProcessing()         │
│   ├── GlobalTonemap()                                  │
│   └── ApplyContrastBoost()                             │
│ - wireless/android/camera/tomte/tomte_grain_runner.cc   │
│   └── ApplyTomteImageFinalizer()                       │
│ - TFLite Models (split_all_in, split_hdrplus)          │
│   ├── looknet_v2.1_float.tflite (CPU/GPU fallback)     │
│   └── 3cdbac706c98421a96e16fdbfd97a35f.tflite (Grain)  │
└────────────────────────────────────────────────────────┘
```

### A. UI and Presentation Layer
* **View Hierarchy**:
  * Main stub: `id/sauce_overlay_view_stub` (`0x7f0a0477`) defined in viewfinder layouts.
  * Layout: `layout/sauce_overlay` (`0x7f0d0169`).
  * Root View: `com.google.android.apps.camera.sauce.viewfinder.SauceSelectionOverlay` (extends `dbc`, host for Jetpack Compose UI).
* **UI Controllers**:
  * `qnv.java`: Inflates `id/sauce_overlay_view_stub` and binds it to `qnt.b` (`StateFlow<qnu>`).
  * `qmy.java`: Central state manager implementing `qms`. Manages active Look (`f()`), default Look (`e()`), stickiness (`pref_sauce_stickiness_key`), and carousel events.
  * `qlz.java` (implements `qmb`): Stores the 9 per-Look fine-tuning parameters represented by `qmc.java` (`SauceSettings`):
    1. Contrast (`setContrast`)
    2. Highlights (`setHighlights`)
    3. Shadows (`setShadows`)
    4. Vibrance (`setVibrance`)
    5. Color Tint (`setColorTint`)
    6. Color Tone (`setColorTone`)
    7. Mono Filter (`setMonoFilter`)
    8. Sharpness (`setSharpness`)
    9. Grain (`setGrain`)
* **Look Definitions (`qlh` hierarchy)**:
  * ID 0: `qkv` — **Original** (`sauce_default_label`)
  * ID 1: `qkz` — **Natural** (`sauce_natural_label`)
  * ID 2: `qky` — **Shadows** (`sauce_shadows_label`)
  * ID 3: `qld` — **Vanilla** (`sauce_orange_label`)
  * ID 4: `qla` — **Editorial** (`sauce_kodachrome_label`)
  * ID 5: `qkw` — **Velvet** (`sauce_velvia_label`)
  * ID 6: `qku` — **Classic** (`sauce_portra_label`)
  * ID 7: `qlg` — **Digi** (`sauce_digicam_label`)
  * ID 8: `qle` — **Black Tie** (`sauce_black_and_white_label`)
  * ID 9: `qlb` — **Minimal** (`sauce_minimal_label`)

### B. Capture & Request Layer
* When the shutter is pressed, `qmy.t()` stores the selected Look ID in `rex.x`.
* In `hzs.java` (lines 752–790), `rex.x` is serialized into protobuf message `yza` and assigned to `ysc.i` (`ShotParams` payload).
* In `mla.K()` (`classes.dex`), `ShotParams_tomte_type_set(shotParams.a, shotParams, lookId)` is invoked on the native Gcam shot configuration.

### C. Native Image Processing Layer
* In `libgcastartup.so` (166 MB), the processing is executed in C++ and Halide:
  * `wireless/android/camera/tomte/tomte_tonemap.cc`:
    * `RunLearnableLinearSpaceTonalProcessing`: Implements non-linear color matrices and spline transformations in linear RGB space.
    * `GlobalTonemap`: Halide kernel evaluating per-Look tone curves with slider control weighting.
    * `ApplyContrastBoost`: Adaptive contrast booster for 3-channel images.
  * `wireless/android/camera/tomte/tomte_grain_runner.cc`:
    * `ApplyTomteImageFinalizer`: Injects organic film grain calibrated per Look preset.
  * Metadata embedding: Written to Google Photos EXIF header `GFileMetadata$Sauce`.

---

## 2. Where Exactly Is It Gated?

The feature is gated by a multi-tiered hierarchy of device checks and feature flags:

| Gate | Class / Method | Condition / Bytecode | Caller | Impact |
| :--- | :--- | :--- | :--- | :--- |
| **Gate 1: Device Model Check** | `uyv.l()` | Checks device against blacklist: `!p() && !a && ... && !X`. Evaluates to `false` on Pixel 1–10; `true` only on Pixel 11 (`Y, Z, aa, ab`). | `kjq.b` | Flags device as ineligible for Camera Looks. |
| **Gate 2: Eligibility Flag** | `kjq.bm` (`camera.sauce_eligible`) | `klmVar.o(bm, uyvVar.l())` | `kjq.b` | Default setting for device eligibility in `klm` flag registry. |
| **Gate 3: Enablement Flag** | `kjq.bl` (`camera.sauce_enabled`) | Initialized to `false` in `kjq.b`. Set to `true` in `hpq.bb()` only if `uyvVar.k()` is `true` (Pixel 11). | `hpq.bb` | Master flag enabling Camera Looks functionality. |
| **Gate 4: Master Predicate** | `qau.java` (Case 19) | `if (klmVar.q(kjq.bm) && klmVar.q(kjq.bl))` | Dagger Provider | Emits `Boolean.TRUE` or `Boolean.FALSE` for all dependent controllers. |
| **Gate 5: UI Overlay Inflation** | `pzs.java` (Case 5) | `bool ? ((qnw) accgVar2).a() : spg.s` | Dagger Provider | If `false`, returns no-op `spg.s`. The overlay view stub is never inflated. |
| **Gate 6: Controller Selection** | `qau.java` (Case 17) | `bool ? new qlu() : new qlt()` | Dagger Provider | If `false`, installs stub `qlt` which returns 0 for accessibility and controls. |
| **Gate 7: Viewfinder Flow** | `qnt.java` (Lines 36–45) | `this.b = zBooleanValue ? adhh.C(...) : new adrs(...)` | Viewfinder init | If `false`, passes empty null-state flow to Compose overlay. |
| **Gate 8: Grain Runner Init** | `mia.java` (Lines 34–70) | `if (this.f)` (`f` = Master Predicate) | `mia.run()` | If `false`, skips loading Tomte Grain model `kjq.V`. |
| **Gate 9: HAL Vendor Key** | `tds.java` (Line 15, 64) | `tdt.a(14)` checks for `com.google.android.camera.experimental2026` | `tds.<clinit>` | If missing, `tds.c` (`REQUEST_TOMTE_TYPE`) is `null`. Safely handled by `ptn.java`. |
| **Gate 10: Package Min SDK** | `AndroidManifest.xml` | `minSdkVersion = 37` (Android 17 preview) | Package Manager | Prevents APK installation on older devices running Android 14/15/16. |

---

## 3. Is the Feature Contained in the Pixel Camera 11 APK/Bundle?

**YES.** The complete implementation is contained within the reference bundle:
* UI code, Compose layouts, and resource strings are in `base.apk`.
* Native processing engines (`ApplyTomteImageFinalizer`, `tomte_tonemap.cc`, Halide kernels) are in `split_startup_jni_split_module.apk` (`libgcastartup.so`).
* Neural network weights and assets are distributed in `split_all_in_feature_module_p26.apk` and `split_hdrplus_asset_module_p26.apk`.

No server-side dynamic code download is required.

---

## 4. Is It Contained in a Dynamic Feature Module?

**YES, in part.** The feature is partitioned between the base APK and split modules:
* `base.apk`: Houses `SauceSelectionOverlay`, `qmy`, `qnt`, `qlz`, string resources, and XML layouts.
* `split_startup_jni_split_module.apk`: Houses `libgcastartup.so` containing the native image processing pipeline.
* `split_all_in_feature_module_p26.apk`: Houses `looknet_v2.1_float.tflite.uncompressed` (13.7 MB floating-point neural style model) and `looknet_v2.1_custom-op_26.tflite.uncompressed` (7.4 MB TPU model).
* `split_hdrplus_asset_module_p26.apk`: Houses `3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed` (1.06 MB Tomte grain generator).

All required splits must be retained when deploying to older devices.

---

## 5. Does the Pixel 9/8/7/6 Camera Implementation Already Contain Compatible Processing?

**NO.** Older Google Camera releases (such as GCam 9.x shipped with Pixel 9 and older) do **not** contain the `wireless/android/camera/tomte/` namespace, `SauceSelectionOverlay`, or `TomteMetadata` in their binaries.

Therefore, enabling Camera Looks requires deploying the **Pixel Camera 11 implementation** (via modded APK or system module) onto the target older Pixel device, rather than merely toggling flags in GCam 9.x.

---

## 6. Is a UI-Only Unlock Possible?

**YES.** By overriding `camera.sauce_eligible` and `camera.sauce_enabled` to return `true` (or hooking `qau.java` Case 19 to return `Boolean.TRUE`):
1. `SauceSelectionOverlay` is immediately inflated.
2. The Camera Looks carousel appears above the shutter button.
3. All 10 Looks (Original through Minimal) can be scrolled, selected, and previewed.
4. The 9 fine-tuning sliders (Contrast, Shadows, Highlights, Vibrance, Tint, Tone, Mono, Sharpness, Grain) appear and operate interactively.

---

## 7. Is Actual Image Processing Possible?

**YES.** Reverse engineering reveals that image processing **does not rely solely on the Pixel 11 Camera HAL**:
1. In `mla.K()`, GCam checks whether the Camera HAL returned `RESULT_TOMTE_TYPE`.
2. If `RESULT_TOMTE_TYPE` is absent (which is true on Pixel 6–10 HALs), `mla.K()` executes an explicit fallback to the user's selected Look:
   ```smali
   invoke-static {v11, v12, v9, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_tomte_type_set(JLcom/google/googlex/gcam/ShotParams;I)V
   ```
3. Native engine `libgcastartup.so` receives the `tomte_type` in `ShotParams` and dispatches `ApplyTomteImageFinalizer` in `wireless/android/camera/tomte/tomte_tonemap.cc`.
4. The image finalizer executes Halide kernels (`RunLearnableLinearSpaceTonalProcessing`, `GlobalTonemap`, `ApplyContrastBoost`) directly on CPU/GPU, producing an altered image file.
5. In addition, `ifj.java` includes `looknet_v2.1_float.tflite.uncompressed`, a standard floating-point model that executes on CPU/GPU via standard TFLite without requiring Tensor G6 hardware custom ops.

---

## 8. Does the Feature Require Pixel 11-Specific Hardware?

**NO for core tonal/color processing; PARTIALLY for hardware-level optimizations.**

### Hardware Breakdown:
1. **Camera HAL3 Vendor Tags (`REQUEST_TOMTE_TYPE`)**:
   * Hardware ISP tuning is specific to the Pixel 11 HAL (`com.google.android.camera.experimental2026`).
   * Older HALs ignore this key. GCam handles this via its software fallback path in `mla.K()`.
2. **Tomte Film Grain TPU Acceleration**:
   * Model `3cdbac706c98421a96e16fdbfd97a35f.tflite` is compiled with DarwiNN for Tensor G6.
   * On older Tensors, `tomte_grain_runner.cc` logs `"TOMTE: Darwinn delegate failed to modify graph"` and gracefully disables film grain while allowing tone mapping to complete normally.
3. **Core Color & Tone Mapping (`tomte_tonemap.cc`)**:
   * Uses Halide runtime and OpenCL/CPU compute. Fully compatible with Tensor G1, G2, G3, G4, and G5.

---

## 9. What Is the Minimum Patch Required?

### For Rooted Devices (LSPosed / Xposed):
The minimal reversible patch requires hooking three methods:
1. `defpackage.klm.q(kiz)`: Return `true` when `kiz` is `kjq.bm` (`camera.sauce_eligible`), `kjq.bl` (`camera.sauce_enabled`), or `kjq.bn` (`camera.sauce_onboarding_enabled`).
2. `defpackage.uyv.l()`: Return `true` (spoofing device eligibility).
3. `defpackage.qau.a()`: For Case 19, return `Boolean.TRUE`.

### For Standalone APK Installation:
1. **Manifest Patch**: Lower `minSdkVersion` in `AndroidManifest.xml` from 37 to 34 (Android 14) or 35 (Android 15).
2. **Bytecode Patch**: In `kjq.b`, modify opcodes:
   * Change `klmVar.o(bl, false)` to `klmVar.o(bl, true)`.
   * Change `klmVar.o(bm, uyvVar.l())` to `klmVar.o(bm, true)`.
3. **Split Packaging**: Assemble `base.apk` with `split_startup_jni`, `split_all_in`, and `split_hdrplus` and resign with a custom test key.

---

## 10. Which Older Pixel Generations Can Realistically Support It?

| Pixel Generation | SoC / ISP | UI | Capture | Processing | Grain | Overall Rating |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Pixel 10** | Tensor G5 | PASS | PASS | PASS (Halide + Float) | PARTIAL | **EXCELLENT** |
| **Pixel 9** | Tensor G4 | PASS | PASS | PASS (Halide + Float) | FALLBACK | **EXCELLENT** |
| **Pixel 8** | Tensor G3 | PASS | PASS | PASS (Halide + Float) | FALLBACK | **GOOD** |
| **Pixel 7** | Tensor G2 | PASS | PASS | PASS (Halide + Float) | FALLBACK | **GOOD** |
| **Pixel 6** | Tensor G1 | PASS | PASS | PASS (Halide) | FALLBACK | **MODERATE** (Memory sensitive) |
