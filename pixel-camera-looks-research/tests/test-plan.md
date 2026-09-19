# Camera Looks Backport — Comprehensive Test Plan

This document outlines the systematic, end-to-end verification and testing methodology for the backported **Pixel 11 Camera Looks** feature on older Google Pixel devices (Pixel 6 through Pixel 10).

---

## 1. Test Objectives & Scope

The primary objective is to verify that:
1. The **Sauce UI** (`Camera Looks`) renders correctly and responsively across viewports and orientations.
2. Preset selection updates internal state and propagates `LookType` to the capture pipeline.
3. Photo capture completes without ANR, crash, or pipeline freeze.
4. Native image processing (`ApplyTomteImageFinalizer` / Halide `tomte_tonemap`) successfully executes on captured frames, altering RGB distributions as intended.
5. All 10 presets function reliably across lenses (Ultrawide, Wide, Telephoto) and capture modes (Photo, Portrait, Night Sight).
6. Camera stability is maintained across app lifecycles, memory pressure, and thermal states.

---

## 2. Test Matrix

| Test ID | Phase | Focus Area | Success Criterion | Failure Signature |
| :--- | :--- | :--- | :--- | :--- |
| **TEST-A** | UI | Carousel & Selector | Carousel icon appears in viewfinder; tray opens smoothly | Icon missing, tray unresponsive, inflate crash |
| **TEST-B** | Selection | State Propagation | Selecting preset updates preview LUT and UI selection indicator | Preset reverts to default; preview freezes |
| **TEST-C** | Capture | Shutter Pipeline | Shutter releases, progress ring animates, capture completes | Shutter disabled, watchdog timer crash, frame dropped |
| **TEST-D** | Processing | Image & Metadata | Resulting JPEG shows measurable tonal/color shift; EXIF/XMP has Sauce tag | Image identical to "Original"; metadata missing |
| **TEST-E** | Stability | Stress & Mode Switch | No crashes across 50 captures, lens switching, and mode toggles | Fatal SIGSEGV in `libgcastartup.so`, OOM kill |
| **TEST-F** | Metadata | EXIF / XMP Audit | `GFileMetadata$Sauce` contains `preset_id` and `render_pipeline: CPU_HALIDE` | Corrupted EXIF headers, default baseline metadata |
| **TEST-G** | Fallback | HAL Tag Graceful Degradation | Missing `REQUEST_TOMTE_TYPE` in HAL falls back to software `ShotParams` | Null pointer exception in `tds.c`, camera server crash |

---

## 3. Systematic Test Execution Protocols

### 3.1 Test A: UI Verification (Sauce Viewfinder & Tray)
* **Goal**: Validate that `SauceSelectionOverlay` inflates and responds to touch gestures.
* **Pre-conditions**:
  - LSPosed module enabled for `com.google.android.GoogleCamera` (or APK patched).
  - Clean app state (`adb shell pm clear com.google.android.GoogleCamera`).
* **Procedure**:
  1. Launch Pixel Camera: `adb shell am start -n com.google.android.GoogleCamera/com.google.android.apps.camera.legacy.app.activity.main.CameraActivity`
  2. Observe the bottom-right viewfinder area (next to exposure slider or in bottom sheet depending on device orientation).
  3. Verify presence of the Camera Looks icon (`ic_sauce_sparkle` / `sauce_mode_button`).
  4. Tap the Camera Looks button.
  5. Inspect logcat for UI initialization:
     ```bash
     adb logcat -s "GcaSauce:*" "CameraApp:*" | grep -E "(SauceOverlay|inflate|qlh)"
     ```
* **Expected Output**:
  - `SauceOverlay` inflates from layout `0x7f0a0477`.
  - Horizontal carousel renders 10 preset thumbnails with live/pre-rendered style previews.

---

### 3.2 Test B: Preset Selection Verification
* **Goal**: Validate that selecting each of the 10 presets updates the active `qlh` model and triggers preview tone-mapping updates.
* **Presets Under Test**:
  1. `Original` (`qkv`, ID 0)
  2. `Natural` (`qkz`, ID 1)
  3. `Shadows` (`qky`, ID 2)
  4. `Vanilla` (`qld`, ID 3)
  5. `Editorial` (`qla`, ID 4)
  6. `Velvet` (`qkw`, ID 5)
  7. `Classic` (`qku`, ID 6)
  8. `Digi` (`qlg`, ID 7)
  9. `Black Tie` (`qle`, ID 8)
  10. `Minimal` (`qlb`, ID 9)
* **Procedure**:
  1. Open the Looks carousel.
  2. Sequentially select presets 0 through 9.
  3. For each selection, verify:
     - The selected chip highlights.
     - Viewfinder preview displays a subtle tone/LUT shift via GPU shader preview pass.
     - Logcat records state change:
       ```bash
       adb logcat -s "GcaSauce:*" | grep "Selected look type"
       ```
* **Expected Output**:
  - `Selected look type: <id>` logged without framework exceptions.

---

### 3.3 Test C: Photo Capture Pipeline Verification
* **Goal**: Validate that the full shutter pipeline executes without deadlocks.
* **Procedure**:
  1. Position device on a tripod facing a static calibration chart (e.g. Macbeth ColorChecker or standard interior scene).
  2. Set Look to `Velvet`.
  3. Tap Shutter.
  4. Monitor capture pipeline via logcat:
     ```bash
     adb logcat -E "GcaShot|ShotParams|PostProcessing|libgcastartup"
     ```
  5. Verify the following milestone events:
     - `FrameServer: CaptureRequest submitted with look_id=5`
     - `ShotParams_tomte_type_set called with type=5`
     - `GcaPostProcessing: Processing Shot...`
     - `JpegCompressor: Finished encoding in XXXms`
* **Expected Output**:
  - Thumbnail appears in gallery circle within 1.5–3.5 seconds.
  - No dropped frames or watchdog timeouts.

---

### 3.4 Test D: Image Processing & Quantitative Analysis
* **Goal**: Objectively prove that the captured image differs between presets and is not simply a placebo UI.
* **Procedure**:
  1. Lock scene lighting (diffused 5000K daylight or consistent indoor studio LED).
  2. Capture 10 successive photos at the exact same framing, one for each preset:
     ```text
     photo_00_original.jpg
     photo_01_natural.jpg
     photo_02_shadows.jpg
     photo_03_vanilla.jpg
     photo_04_editorial.jpg
     photo_05_velvet.jpg
     photo_06_classic.jpg
     photo_07_digi.jpg
     photo_08_blacktie.jpg
     photo_09_minimal.jpg
     ```
  3. Pull images to workstation:
     ```bash
     adb pull /sdcard/DCIM/Camera/ ./captured_looks/
     ```
  4. Run automated histogram and delta verification script:
     ```bash
     python3 tests/verify_looks_output.py --baseline captured_looks/photo_00_original.jpg --targets captured_looks/
     ```
* **Pass Criteria**:
  - Difference norm $\|\text{Image}_i - \text{Original}\| > 0$ for all $i \in [1, 9]$.
  - `Black Tie` channel difference: $|R - G| \approx 0$ and $|G - B| \approx 0$ across all pixels (monochrome).
  - `Shadows` 5th percentile luminance $> \text{Original}$ 5th percentile luminance (lifted toe).
  - `Editorial` mean blue/red balance shifted toward cool highlights.

---

### 3.5 Test E: Camera App Stability & Stress Testing
* **Goal**: Ensure long-term stability, memory bounds, and crash-free operation across edge cases.
* **Stress Protocols**:
  1. **Rapid Preset Switching**:
     - Swipe through all 10 presets back-and-forth 20 times within 10 seconds.
     - Verify no UI thread lockup or memory leak.
  2. **Lens Switching**:
     - Switch between 0.5x (UW), 1x (Wide), and 5x (Telephoto) while a Look is active.
     - Verify preview shader updates correctly for each physical sensor.
  3. **Mode Switching**:
     - Switch `Photo` $\rightarrow$ `Portrait` $\rightarrow$ `Night Sight` $\rightarrow$ `Video` $\rightarrow$ `Photo`.
     - Note: Sauce tray should cleanly hide in `Video` mode and reappear in `Photo` mode.
  4. **Burst / Rapid Fire**:
     - Tap shutter 10 times consecutively.
     - Verify thread pool queues `ApplyTomteImageFinalizer` jobs without out-of-memory crash.
  5. **Process Kill & Restore**:
     - Close app, send `SIGKILL`, reopen app.
     - Verify last-selected Look persists in `SharedPreferences` (`pref_sauce_active_look`).

---

### 3.6 Test F: EXIF & XMP Metadata Verification
* **Goal**: Verify that custom Google Camera metadata is written into the JPEG APP1/APP2 segments.
* **Procedure**:
  ```bash
  exiftool -G -s photo_05_velvet.jpg | grep -i -E "sauce|tomte|look|camera"
  ```
* **Expected Output**:
  - `XMP-GCamera:SauceLookType = 5` (or `Velvet`)
  - `XMP-GCamera:SauceVersion = 1`

---

## 4. Hardware Degradation & Fallback Test Matrix

| Device Under Test | Expected Execution Engine | Maximum Concurrency | Latency Expectation | Risk Factors |
| :--- | :--- | :--- | :--- | :--- |
| **Pixel 10** | Tensor G5 EdgeTPU + HAL3 | 4 parallel frames | 650 ms | Negligible |
| **Pixel 9** | Tensor G4 Mali GPU / TPU | 3 parallel frames | 820 ms | Negligible |
| **Pixel 8** | Tensor G3 Mali-G715 GPU | 2 parallel frames | 1100 ms | Thermal throttle after 15 continuous shots |
| **Pixel 7** | Tensor G2 Mali-G710 GPU / CPU | 1 frame serialized | 1650 ms | CPU frequency ramp; 6GB RAM (7a) limit |
| **Pixel 6** | Tensor G1 CPU Halide / GPU | 1 frame serialized | 2200 ms | 6GB RAM (6a) OOM if 5 bursts fired |

---

## 5. Automated Verification Script (`verify_looks_output.py`)

Save the following Python validation script to execute automated quantitative checks against captured photos:

```python
#!/usr/bin/env python3
"""
Automated Verification Script for Pixel Camera Looks Outputs
Compares target preset photos against the Original baseline photo.
"""

import sys
import os
import argparse
import numpy as np
from PIL import Image

def analyze_photo(path):
    img = Image.open(path).convert('RGB')
    arr = np.array(img, dtype=np.float32)
    mean_rgb = arr.mean(axis=(0, 1))
    std_rgb = arr.std(axis=(0, 1))
    lum = 0.299 * arr[:,:,0] + 0.587 * arr[:,:,1] + 0.114 * arr[:,:,2]
    percentiles = np.percentile(lum, [5, 25, 50, 75, 95])
    return {
        'mean_rgb': mean_rgb,
        'std_rgb': std_rgb,
        'lum_percentiles': percentiles,
        'array': arr
    }

def main():
    parser = argparse.ArgumentParser(description="Verify Camera Looks image output.")
    parser.add_argument("--baseline", required=True, help="Path to photo_00_original.jpg")
    parser.add_argument("--targets", required=True, help="Directory containing preset photos")
    args = parser.parse_args()

    print("[*] Analyzing Baseline (Original)...")
    base = analyze_photo(args.baseline)
    print(f"    Baseline Mean RGB: {base['mean_rgb']}")
    print(f"    Baseline Luminance P5/P50/P95: {base['lum_percentiles'][[0, 2, 4]]}")

    target_files = sorted([f for f in os.listdir(args.targets) if f.endswith(('.jpg', '.jpeg')) and f != os.path.basename(args.baseline)])
    
    passes = 0
    failures = 0

    print("\n[*] Comparing Presets...")
    for tf in target_files:
        full_path = os.path.join(args.targets, tf)
        tgt = analyze_photo(full_path)
        
        # Calculate Mean Absolute Difference (MAD)
        mad = np.mean(np.abs(tgt['array'] - base['array']))
        
        # Check specific preset rules
        is_pass = False
        notes = []
        
        if "blacktie" in tf.lower() or "08" in tf:
            # Check monochrome: R == G == B
            diff_rg = np.mean(np.abs(tgt['array'][:,:,0] - tgt['array'][:,:,1]))
            diff_gb = np.mean(np.abs(tgt['array'][:,:,1] - tgt['array'][:,:,2]))
            if diff_rg < 1.0 and diff_gb < 1.0:
                is_pass = True
                notes.append("Monochrome verified (Delta RG/GB < 1.0)")
            else:
                notes.append(f"Monochrome FAILED (Delta RG={diff_rg:.2f}, GB={diff_gb:.2f})")
        else:
            if mad > 1.5:  # Significant perceptible difference
                is_pass = True
                notes.append(f"Image processing confirmed (MAD = {mad:.2f})")
            else:
                notes.append(f"Placebo detected! (MAD = {mad:.2f} <= 1.5)")

        status = "PASS" if is_pass else "FAIL"
        if is_pass: passes += 1
        else: failures += 1

        print(f"[{status}] {tf:<25} | MAD: {mad:6.2f} | Notes: {', '.join(notes)}")

    print(f"\nSummary: {passes} PASSED, {failures} FAILED out of {len(target_files)} presets tested.")
    if failures > 0:
        sys.exit(1)

if __name__ == "__main__":
    main()
```
