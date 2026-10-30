<div align="center">

# Pixel Camera: Looks and Creator Suit Backport

**Unlocking Google Pixel 11's next-generation "Camera Looks" and "Creator Suit" on Pixel 6 through Pixel 10.**
<br />

<!-- DOWNLOAD CTA BUTTONS -->
<p align="center">
  <a href="https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20DOWNLOAD%20APK%20v1.0.9-Pixel%20Camera%20(SourceForge)-ee6600?style=for-the-badge&logo=sourceforge&logoColor=white&labelColor=d45500" alt="Download Latest Patched APK" height="42">
  </a>
  <a href="https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20DOWNLOAD%20PATCH%20v1.0.9-Morphe%20(SourceForge)-ee6600?style=for-the-badge&logo=sourceforge&logoColor=white&labelColor=d45500" alt="Download Latest Patch (.mpp) from SourceForge" height="42">
  </a>
  <a href="https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20DOWNLOAD%20PATCH%20v1.0.9-Morphe%20(GitHub)-00acc1?style=for-the-badge&logo=github&logoColor=white&labelColor=00838f" alt="Download Latest Patch (.mpp) from GitHub" height="42">
  </a>
  <a href="https://sourceforge.net/projects/pixel-camera-patches/files/">
    <img src="https://img.shields.io/badge/%F0%9F%93%82%20ALL%20FILES-SourceForge%20Repository-0055aa?style=for-the-badge&logo=sourceforge&logoColor=white&labelColor=003366" alt="SourceForge Files" height="42">
  </a>
  <a href="https://www.apkmirror.com/apk/google-inc/camera/pixel-camera-11-1-040-982810059-19-release/">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20BASE%20APKM-Pixel%20Camera%2011.1%20(APKMirror)-ff8800?style=for-the-badge&logo=google&logoColor=white&labelColor=e65100" alt="Download Base APK from APKMirror" height="42">
  </a>
</p>

---

</div>

## Overview

Google introduced **"Camera Looks"** (designated internally as `sauce` and `tomte`) and customizable **"Creator Suit"** with Pixel Camera `11.1.040.982810059.19` on the Pixel 11 family. 

Through deep reverse-engineering of Dalvik bytecode and native Halide binaries, we discovered that **the complete feature framework is present across older Pixel devices**. The features were withheld exclusively via runtime feature flags and device checks.

This repository provides **comprehensive reverse-engineering research**, **device-by-device compatibility analyses**, architectural documentation on **hardware limitations & technical reasons**, and the **official Morphe patch package (`.mpp`)** to bring these features to older Google Pixel phones directly on-device without root.

---

## Key Features Unlocked

### 1. Thirteen Signature Camera Looks (Sauce & Tomte)
Instant tone mapping, color matrix shifts, and organic film grain encoded into captures:

| # | Look Preset | Internal Codename | Visual Characteristics |
| :---: | :--- | :--- | :--- |
| **0** | **Original** | `sauce_default_label` | Google's classic, true-to-life HDR+ computational look. |
| **1** | **Natural** | `sauce_natural_label` | Subtle softening, neutral skin tones, restrained saturation. |
| **2** | **Shadows** | `sauce_shadows_label` | Deepened, cinematic blacks and punchy moody contrast. |
| **3** | **Vanilla** | `sauce_orange_label` | Warm, golden-hour radiance with soft ambient highlights. |
| **4** | **Editorial** | `sauce_kodachrome_label` | Rich Kodachrome-inspired magazine colors and contrast. |
| **5** | **Velvet** | `sauce_velvia_label` | High-saturation landscape tones reminiscent of Fuji Velvia. |
| **6** | **Classic** | `sauce_portra_label` | Timeless analog film aesthetic inspired by Kodak Portra. |
| **7** | **Digi** | `sauce_digicam_label` | Nostalgic early-2000s compact digital camera punch and flare. |
| **8** | **Black Tie** | `sauce_black_and_white_label` | Fine-grain, high-contrast monochrome with deep dynamic range. |
| **9** | **Minimal** | `sauce_minimal_label` | Clean, desaturated Scandinavian fine-art style. |
| **10** | **Flat** | `sauce_pesto_label` | Low-contrast flat color profile with maximum dynamic range for color grading. |
| **11** | **Buffalo** | `sauce_unflat_label` | Punchy, rich earth-tone saturation with expanded dynamic latitude. |
| **12** | **Dijon** | `sauce_yellow_green_faded_label` | Warm vintage look with olive-tinted highlights and faded contrast. |

### 2. Customizable Viewfinder Quick Access Controls
* **Interactive Viewfinder Slots**: Assign **Left** and **Right** quick access slots directly from the Camera settings.
* **On-Screen Discrete Tick-Slider**: Tapping the viewfinder reveals vertical sliders—tap or scrub the 10-tick slider to switch Camera Looks in real time without opening the bottom drawer.
* **Haptic Feedback**: Tick haptics on slider detents with persistent preference storage across restarts.

### 3. Native Halide & Tomte Grain Engine
* **Native C++ Fallback**: When vendor Camera HAL tags (`REQUEST_TOMTE_TYPE`) are absent on older Tensor SoCs, native routines in `libgcastartup.so` (`wireless/android/camera/tomte/tomte_tonemap.cc`) execute on GPU and CPU.
* **Neural Style Fallback**: Fallback from TPU to CPU floating-point model (`looknet_v2.1_float.tflite`).
* **Hardware Portrait Pipeline**: Fully integrated with Google's Gouda portrait segmentation pipeline for applying Looks to portrait captures.

### 4. Pixel Camera Creator Suite
* **Creator Drawer Tab (`granite`)**: A dedicated creation tool tab in the options menu alongside General settings.
* **Teleprompter HUD (`biotite`)**: Floating viewfinder script presenter with auto-scrolling, customizable WPM speed, and Compose-based script editor.
* **Live Audio Visualizer (`mica`)**: Real-time microphone VU level indicator rendered directly over the camera feed.
* **Social Media Framing (`slate` / `basalt`)**: 9:16 vertical, 1:1 square, and custom aspect ratio composition guide overlays.
* *(See [`creator-suite-research/`](creator-suite-research/) for full documentation and patches).*

### 5. Dedicated 10x Quick Zoom Viewfinder Button
* **1-Tap 10x Super Res Zoom**: Exposes the discrete **10x** quick-toggle button on the viewfinder zoom strip alongside `0.5x, 1x, 2x, 5x` on Pixel 7 Pro, 8 Pro, and 9 Pro.
* **Zero Quality Loss**: Instantly activates Google's `NativeZoomPlus` and `NativeFusionZoom` computational pipelines at a single tap without requiring manual pinch-to-zoom gestures.
* *(See [`pixel-camera-looks-research/PORTRAIT_RESEARCH.md`](pixel-camera-looks-research/PORTRAIT_RESEARCH.md) for full technical teardown).*

### 6. Pro Manual Controls Backport
* **Manual Focus & Focus Peaking**: Precision focus slider with real-time viewfinder GPU edge peaking highlights (`camera.ark_edge_hex`).
* **Manual Shutter Speed & ISO**: Full manual exposure dials with dynamic sensor range negotiation (1/8000s up to hardware limit) and instant 1-tap "Reset to Auto".
* **Live Viewfinder Readout Chips**: Real-time interactive badges over the camera feed displaying active manual exposure and focus metrics (`[1/250s]`, `[ISO 100]`, `[0.5m]`, `[Peaking active]`).
* **Hardware Camera2 Compatibility**: Operates directly through standard Android Camera2 hardware interfaces (`SENSOR_EXPOSURE_TIME`, `SENSOR_SENSITIVITY`, `LENS_FOCUS_DISTANCE`), ensuring zero reliance on proprietary vendor HAL extensions.

### 7. Permanent Portrait Mode Fix
* **Universal Pure-TFLite Monocular Depth Pipeline**: Overrides hardware stereo disparity (`kStereoRgb` / `kRgbPd`) which crashes with EdgeTPU permission error `-8` on non-platform signed apps, preventing front camera subject-blur bug and flat rear camera portraits.
* **Synchronous Model Init & Fallback**: Forces `PortraitSegmenterManager` fallback to stock `1c33c30c31a74d99b66f54c22014a27a...` segmenter model with automatic CPU/GPU retry.
* *(See [`pixel-camera-looks-research/PORTRAIT_RESEARCH.md`](pixel-camera-looks-research/PORTRAIT_RESEARCH.md) for full teardown).*

### 8. Pixel 10 12MP Photo Saving Fix
* **Binned RAW Dimension Fallbacks**: Populates correct `khw.d, e, f, g` dimensions (`0x7f0`, `0x600`, `0x7e0`, `0x5e8`) in `hpq.aW` and `hpq.aX` for Pixel 10 and 10 Pro.
* **Eclipse AE Neutralization**: Disables failing Eclipse AE (`camera.use_eclipse` / `kjq.bb = false`) and non-existent Milk hardware pipelines, restoring 100% reliable 12MP photo capture and saving.

### 9. 100% Display Backlight / Max Screen Brightness Toggle
* **Full-Power Display Backlight**: Directly forces maximum 100% screen brightness (`WindowManager.LayoutParams.screenBrightness = 1.0f`) across the camera viewfinder and settings menus for ultimate outdoor sunlight readability and accurate exposure evaluation.
* **Instant Toggle Reaction**: Real-time preference interception updates the active window attribute the millisecond the toggle is clicked in Settings, with no app restart needed.
* **Ambient Sensor Dimming Immunity**: Overrides the central display brightness funnel in `tcc.f(F)V` to prevent the device's ambient lux sensor (`tcc.d`) or mode resets from dimming or resetting the screen.
* *(See [`CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md`](CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md#15-issue-15-100-display-backlight--max-screen-brightness-toggle-root-cause--restoration) for complete technical root cause analysis).*

### 10. AV1 Video Hardware Encoding (Tensor G3 / G4)
* **Dedicated Hardware AV1 Encoding**: Unlocks the 3-way format selector (`camcorder.jellybean_setting` and `camcorder_jellybean_feature`) in Video settings (**Settings > Video format > AVC, HEVC, AV1**), encoding ultra-efficient 10-bit AV1 video streams at ~30% higher compression efficiency than HEVC.
* **Hardware-Gated Compatibility**: Supported on Google Tensor G3 (Pixel 8 / 8 Pro / 8a) and Tensor G4 (Pixel 9 / 9 Pro / 9 Pro XL / 9 Pro Fold) featuring dedicated multi-format video encoder blocks (`c2.google.av1.encoder`).
* **Graceful Legacy Fallback**: On devices lacking hardware AV1 encoders (Tensor G1 / G2, Pixel 6 & 7 series), Google Camera's internal `MediaCodecInfo.isHardwareAccelerated()` safety gate automatically suppresses the AV1 option and defaults cleanly to standard HEVC/AVC toggles with zero crashes.
* *(See [`Av1VideoEncodingPatch.kt`](morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/video/Av1VideoEncodingPatch.kt) for implementation).*

### 11. In-App Pro Image Quality (JPEG Quality & Spatial Noise Reduction)
* **In-App Interactive Preference Menus**: Directly integrated into Camera Settings under **Photo / Resolution** (`pref_category_resolution_camera`), offering full in-app control similar to the Video Format menu.
* **Permanent Selection Persistence**: Uses persistent `SharedPreferences` storage (`pref_camera_jpeg_quality_key` and `pref_camera_noise_reduction_key`) ensuring values stick across app restarts and device reboots until changed by the user.
* **Selectable JPEG Quality Compression**:
  * **100% (Maximum Quality)**: Disables aggressive DCT quantization; maximizes fine texture preservation, grass, and foliage fidelity with lossless quantization tables.
  * **98% (High Quality)**: High visual fidelity with reduced compression artifacts and balanced file size.
  * **95% (Stock)**: Default Google Camera compression standard.
* **Configurable Spatial Noise Reduction**:
  * **Stock (Standard)**: Standard Google Camera bilateral spatial smoothing (`CaptureRequest.NOISE_REDUCTION_MODE_FAST`).
  * **Minimal**: Subtle noise reduction, retaining shadow textures and natural sensor grain (`CaptureRequest.NOISE_REDUCTION_MODE_MINIMAL`).
  * **Off (Full Detail)**: Disables aggressive spatial denoising (`CaptureRequest.NOISE_REDUCTION_MODE_OFF`), eliminating watercolor smearing and keeping microtextures 100% crisp.
* **Dual-Pipeline Execution**: Seamlessly overrides both Camera2 capture requests (`CaptureRequest.JPEG_QUALITY` and `CaptureRequest.NOISE_REDUCTION_MODE` in `pbe.smali`) and Google's native Gcam C++ JPEG encoder (`JpgEncodeOptions` `<init>` and `b(I)V`).
* *(See [`ProImageQualityPatch.kt`](morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/quality/ProImageQualityPatch.kt) and [`TomteInitHelper.smali`](smali_patches/TomteInitHelper.smali) for implementation).*

### 12. Visual App Name & Comprehensive International Localization (124 Locales)
* **Clean Visual Branding**: Displays clean **"Pixel Camera"** in the app drawer and launcher without conflicting with internal component identifiers or Google system contracts.
* **Native International Localization**: Accurately localized across 124 language locales:
  * **German (`de`, `de-AT`, `de-CH`)**: **Pixel Kamera**
  * **Spanish (`es`, `es-US`, Latin America `b+es+419`, `es-MX`, etc.)**: **Cámara Pixel**
  * **French (`fr`, Canadian `fr-CA`, `fr-CH`)**: **Appareil photo Pixel**
  * **Italian (`it`)**: **Fotocamera Pixel**
  * **Portuguese (`pt-BR`, `pt-PT`)**: **Câmera Pixel** / **Câmara Pixel**
  * **Dutch (`nl`)**: **Pixel Camera**
  * **Polish (`pl`)**: **Aparat Pixel**
  * **Russian & Ukrainian (`ru`, `uk`)**: **Камера Pixel**
  * **Czech & Slovak (`cs`, `sk`)**: **Fotoaparát Pixel** / **Kamera Pixel**
  * **Scandinavian (`sv`, `da`, `nb`, `fi`)**: **Pixel Kamera**
  * **Asian & Global**: Japanese (**Pixel カメラ**), Korean (**Pixel 카메라**), Simplified/Traditional Chinese (**Pixel 相机** / **Pixel 相機**), Hindi (**Pixel कैमरा**), Arabic (**كاميرا Pixel**), etc.
* **Launcher Activity Alias Alignment**: `com.android.camera.CameraLauncher` in `AndroidManifest.xml` explicitly carries `android:label="@string/app_name"` guaranteeing reliable display on OEM (Samsung OneUI, Xiaomi HyperOS, OnePlus OxygenOS) and third-party launchers (Nova, Lawnchair).
* *(See [`PixelCameraClonePatch.kt`](morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/clone/PixelCameraClonePatch.kt) for localized strings mapping).*

### 13. Advanced Pro Settings Bottom Sheet & Material 3 Layout Alignment
* **Integrated Pro Quick Settings Tab**: Seamlessly incorporated as a dedicated tab inside the viewfinder swipe-up / options bottom sheet (`AutobahnViewPager`), gated specifically to Photo and Night Sight modes (and cleanly hidden in Video mode to avoid interference).
* **Fine-Tuned Quality Controls**:
  * **JPEG Compression Quality**: **100%** (disables DCT quantization for maximum microtexture and foliage preservation), **97%** (high visual fidelity with balanced file size), and **95%** (stock Google Camera standard).
  * **Spatial Noise Reduction**: **Off** (disables bilateral spatial smoothing for 100% crisp microtextures and natural sensor grain), **Low** (restrained smoothing retaining shadow textures), and **Standard** (stock Google Camera bilateral filter).
  * **RAW DNG Format**: **16-Bit RAW** (uncompressed full bit-depth sensor DNG) and **Standard Compressed DNG**.
  * **Edge Sharpness & De-Ring Filter**: **Soft (0.0x)**, **Natural (0.5x)**, and **Standard (1.0x)**, completely eliminating artificial halos, harsh contrast ringing, and digital over-sharpening.
* **Pixel-Perfect Seamless Stock UI & Spacing Integration**:
  * **Removed Horizontal Divider Line**: The divider between stock options and custom options has been eliminated, allowing the custom settings to seamlessly blend directly into the stock settings menu.
  * **Stock 56dp Row Rhythm & 1:1 Vertical Spacing**:
    * Each custom row uses the exact `56dp` height matching native Google Camera `options_row_height` (`0x7f070895`).
    * Zero vertical margin between rows, zero margin between Label and Value (`valLp.setMargins(0, 0, 0, 0)`), and exactly `33px` (14.7dp) distance between the value description and the next row's label, matching stock rows down to the pixel.
    * Capsule pill buttons scaled to `40dp` height with `4dp` horizontal inter-button margins (`options_menu_button_margin_left`), creating a completely unified visual cadence across all stock and custom options.
  * Dynamic Material You / Monet theme integration: buttons dynamically adapt to wallpaper-derived primary container colors (`?colorPrimaryContainer`, `?colorOnPrimaryContainer`, `?colorSurfaceContainerHighest`) with smooth ripple and state feedback.
* **AutobahnViewPager Bottom Space Elimination**:
  * Removed the hardcoded `48dp` bottom margin (`android:layout_marginBottom="48.0dp"` in `options_bottomsheet_tab.xml`), reclaiming the wasted blank area so all rows fit comfortably without crowding or clipping.
  * Prevented top and bottom row scroll clipping in `OptionsMenuView`.
* *(See [`TomteProSettingsPanel.smali`](smali_patches/TomteProSettingsPanel.smali) and [`smali_patches/README.md`](smali_patches/README.md) for layout and event listener implementation).*

### 14. Device-Aware Resolution Gating (Pro vs. Non-Pro Pixels) & True 50MP Capture
* **True 50MP Capture on Pro Models (`8160 x 6144`, ~15–30 MB)**:
  * Full 50MP resolution selector is preserved and fully functional in Pro Controls (`ons.smali`) and the Settings options drawer (`moo.smali`) on all Pro Pixel models (Pixel 6 Pro, 7 Pro, 8 Pro, 9 Pro, 9 Pro XL, 9 Pro Fold, 10 Pro).
  * Neutralized automatic 12MP downsampling routines in `rdb.smali` (`C()` and `D()`) on Pro devices, ensuring captures taken in 50MP mode save at full **`8160 x 6144` (50.13 Megapixels)** unbinned resolution (~15–30 MB) rather than being downgraded to 12.5 MP.
* **Smart 12MP Enforcement on Non-Pro Models**:
  * Dynamically evaluates `TomteInitHelper.isProDevice()` based on `Build.MODEL`, `Build.DEVICE`, and `Build.PRODUCT`.
  * On non-Pro models (Pixel 6, 6a, 7, 7a, 8, 8a, 9), the 50MP toggle and resolution menu row are cleanly hidden. Because non-Pro quad-bayer remosaicing hardware requires proprietary Google platform signatures and returns 12.5MP binned output even when queried, hiding the option enforces clean stock 12MP capture with zero placebo toggles or false expectations.
* **Camera HAL Stream & Metadata Crash Safeguards**:
  * Guarded missing `CameraCharacteristics` maximum resolution keys (`SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION` and `SENSOR_INFO_PRE_CORRECTION_ACTIVE_ARRAY_SIZE_MAXIMUM_RESOLUTION`) in `msr.smali` with safe fallback to primary sensor dimensions, preventing fatal `uwj: CameraMetadata missing value` startup crashes on devices with proprietary vendor extensions (e.g. Pixel 8 Pro).
  * Preserved native Camera2 stream configurations and eliminated stream format collisions to guarantee 100% crash-free live viewfinder feeds.
* *(See [`TomteInitHelper.smali`](smali_patches/TomteInitHelper.smali) and [`build_and_patch_pixelcamera.py`](build_and_patch_pixelcamera.py#L4200-L4335) for resolution gating logic).*

---

## ⚠️ Technical Limitations & Architectural Constraints

Running a modern Google Camera modded application without root privileges imposes physical hardware and operating system constraints. Below is a detailed breakdown of existing limitations and their underlying technical causes:

### 1. Motion Blur (Action Pan & Long Exposure) Disabled
* **Observed Behavior**: The Motion Blur mode tab (containing Action Pan and Long Exposure) is intentionally hidden and disabled from the camera mode carousel.
* **Technical Reason**:
  1. **SELinux Kernel Sandboxing (`/dev/gxp`)**: Cloned applications (e.g. `com.google.android.GoogleCameraEng`) execute in Android's unprivileged `untrusted_app` SELinux domain. Access to the Google Tensor EdgeTPU character device (`/dev/gxp` / `darwinn`) is restricted at the kernel level via DAC permissions (`0660`, `system:camera`) and SELinux MAC policy (`allow cameraserver gxp_device:chr_file`). Only system-signed, pre-installed apps signed with Google's platform release key can open or issue `ioctl()` commands to the TPU. Any attempt by an untrusted app results in `avc: denied { read write } for path="/dev/gxp"`.
  2. **Proprietary EdgeTPU Microcode (`edgetpu-custom-op-2`)**: The motion vector and saliency estimation models (`motion-custom_op-p23.tflite.uncompressed` and `saliency-custom_op-p23.tflite.uncompressed`) are compiled exclusively for Tensor's hardware TPU matrix accelerator. They utilize Google proprietary custom operators (`edgetpu-custom-op-2`) that have no CPU or GPU OpenCL fallback implementations in `libgcastartup.so`.
  3. **Capture Pipeline Hang**: Without TPU access, the native optical flow graph fails during session initialization. In user builds, this causes Action Pan and Long Exposure captures to fail silently or stall indefinitely without saving photos to disk.
  4. **Architectural Resolution**: All `camera.lasagna` flags (`kkb.f`, `kkb.g`, `kkb.h`, `kkb.i`, `kkb.j`) are intercepted in `klm.smali` (`q()` and `x()`) to return `false`. Google Camera's internal mode manager (`sdo.smali`, `njn.smali`, `iyh.smali`) cleanly prunes Motion Blur from the UI, ensuring 100% crash-free stability for all working modes.

### 2. Live Viewfinder Looks Preview (Pre-Capture)
* **Observed Behavior**: Camera Looks are applied immediately post-capture during image processing, but do not alter the real-time viewfinder feed before the shutter button is pressed.
* **Technical Reason**:
  * On the Pixel 11, Google introduced a proprietary vendor Camera HAL parameter (`REQUEST_TOMTE_TYPE`) integrated directly into the camera ISP hardware. This hardware block applies 3D tone LUTs and color transform matrices at 60 fps to the preview stream with zero computational latency.
  * Older Google Tensor processors (Tensor G1 through G5) lack this vendor HAL metadata tag and ISP preview hardware hook. Emulating 60 fps 3D LUTs in software shaders over the live viewfinder stream causes severe frame drops and thermal throttling. The mod therefore relies on Google's native Halide C++ post-capture pipeline (`tomte_tonemap.cc`), applying full-resolution, artifact-free Looks processing immediately upon capture.

### 3. Film Grain Dynamic Scaling Slider
* **Observed Behavior**: Adjusting the grain intensity slider in settings has minimal visible effect on output images.
* **Technical Reason**:
  * Native film grain generation is powered by a dedicated neural model (`3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed`) running alongside the RAW ISP pipeline.
  * In the fallback GPU/CPU pipeline without physical `/dev/gxp` access, a consistent baseline organic film grain is applied according to the selected Look's pre-configured tone profile, but dynamic runtime variance weighting is constrained to prevent CPU cache thrashing.

### 4. Creator Suite "Save to Project" (Project Album)
* **Observed Behavior**: The "Save to Project" button in the Creator Suite drawer is neutralized and hidden.
* **Technical Reason**:
  * Project Album integration communicates with the Google Photos application via private cross-process gRPC calls (`pa_` / `pam_` in `kqc.smali`).
  * Google Photos validates the calling package identity using signature verification (`PackageManager.hasSigningCertificate()`). Because cloned mods use an independent signing certificate to coexist with stock Camera, Google Photos rejects the gRPC connection with an authorization error. Hiding the entry prevents connection errors and UI crashes.

### 5. Hardware Periscope Lens Dependency for 10x Quick Zoom
* **Observed Behavior**: The 10x Quick Zoom button requires devices with a physical optical periscope lens (Pixel 7 Pro, 8 Pro, 9 Pro, 10 Pro).
* **Technical Reason**:
  * The discrete 10x quick zoom button activates Google's Super Res Zoom and telephoto fusion pipeline directly leveraging the physical periscope telephoto sensor.
  * Base and "a"-series Pixels (e.g. Pixel 6, 6a, 7, 7a, 8, 8a, 9) physically lack a periscope sensor, operating within standard digital zoom limits.

### 6. Quad-Bayer Remosaicing Limitation on Non-Pro Pixels
* **Observed Behavior**: The 50MP resolution selector is intentionally hidden on non-Pro Pixel models (Pixel 6, 6a, 7, 7a, 8, 8a, 9), defaulting to stock 12MP capture, while remaining fully active on Pro models.
* **Technical Reason**:
  * On non-Pro devices (e.g. Pixel 7 `panther`, Pixel 8 `shiba`), 50MP quad-bayer remosaicing requires private vendor Camera HAL keys and platform-signed permission grants (`android.permission.CAMERA_HEADLESS_SYSTEM_SERVICE`).
  * In third-party and cloned applications, the hardware HAL intercepts full-res stream requests on non-Pro models and falls back to standard 12.5MP binned output frames. Rather than misleading users with a placebo 50MP option that generates 12.5MP files, the mod dynamically detects device tiers via `TomteInitHelper.isProDevice()` and cleanly enforces stock 12MP operation with full RAW+JPEG support on non-Pro phones.

---

## Generational Compatibility Matrix

Tested on physical hardware and verified through Dalvik bytecode and native binary teardowns:

| Generation | Device Models | SoC | Looks Capture | Quick Access | Pro Controls | 10x Zoom | AV1 Encoding | Processing Engine | Status |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: | :---: | :--- | :--- |
| **Pixel 11** | Pixel 11, 11 Pro | Tensor G6 | ✅ | ✅ | ✅ | ✅ | ✅ | Hardware TPU + HAL | **Native** |
| **Pixel 10 Series** | Pixel 10, 10 Pro, 10 Pro XL | Tensor G5 | ✅ | ✅ | ✅ | ✅ (Pro) | ✅ | Hybrid TPU / GPU | **Verified** |
| **Pixel 9 Series** | Pixel 9, 9 Pro, 9 Pro XL, 9 Pro Fold | Tensor G4 | ✅ | ✅ | ✅ | ✅ (Pro) | ✅ | GPU / TPU Fallback | **Verified** |
| **Pixel 8 Series** | Pixel 8, 8 Pro, 8a | Tensor G3 | ✅ | ✅ | ✅ | ✅ (Pro) | ✅ | Mali-G715 GPU / Halide | **Verified** |
| **Pixel 7 Series** | Pixel 7, 7 Pro, 7a | Tensor G2 | ✅ | ✅ | ✅ | ✅ (Pro) | ❌ (Decoder only) | GPU / Halide CPU | **Verified** |
| **Pixel 6 Series** | Pixel 6, 6 Pro, 6a | Tensor G1 | ✅ | ✅ | ✅ | ✅ (Pro) | ❌ (Decoder only) | Halide CPU Worker | **Verified\*** |

> [!TIP]
> **\*Memory Optimization for 6GB RAM Devices (Pixel 6a / 7a)**: Continuous burst captures (>4 rapid shots) can trigger low-memory trimming. The patch limits concurrent Halide worker threads to 2 on devices with $\le 6\text{ GB}$ RAM to guarantee continuous stability.

---

## Known Issues & Future Scope

### Known Issues Tracker
- [x] **Motion Blur (Action Pan / Long Exposure) Stalls**: **Resolved** — Cleanly hidden and disabled via `camera.lasagna` flags to prevent photo-saving hangs caused by SELinux `/dev/gxp` restrictions.
- [x] **Brightness & Shadows Quick Sliders**: **Resolved** — Fully mapped to all 4 exposure controllers (`mzc`, `nrh`, `nre`, `nrd`) with dynamic AE and tap-to-focus unblocked.
- [x] **Portrait Mode Crash on Pixel 8 Pro / Tensor G1–G3 (Issue #19)**: **Resolved** — Hardened EdgeTPU guards (`pvz`, `kic`) and routed portrait processing to pure-TFLite monocular depth (`pwh`, `pwm`), bypassing `edgetpu-custom-op-2` permission error `-8`.
- [x] **White Balance Slider Reverting to Auto (Issues #22, #28)**: **Resolved** — Unblocked Manual White Balance provider (`taj.c`) across both 11.0 (`wqz.J`) and 11.1 (`von.G`) and synchronized Chameleon flags.
- [x] **Invisible Differences Between Looks (Issue #27)**: **Resolved** — Routed `camera.cottage_looknet_model` and `camera.cottage_film_blender_model` to standard floating-point TFLite models (`looknet_v2.1_float.tflite.uncompressed` and `all_in_film_blender.tflite.uncompressed`), restoring full color and saturation differences without EdgeTPU custom op dependencies.
- [x] **Configurable / Default Gallery Viewer (Issue #6)**: **Resolved** — Intercepted review intent factory (`hpq.cD` / `hwb.w`) via `TomteInitHelper.configureGalleryIntent`, unblocking GrapheneOS, Aves, Simple Gallery, and default gallery apps when Google Photos is missing.
- [x] **Pro Manual Controls & Peaking**: **Resolved** — Fully backported manual focus slider, real-time GPU edge focus peaking, manual shutter speed dials, and ISO controls with live viewfinder chips.
- [x] **Wasted Bottom Space in Options Sheet**: **Resolved** — Eliminated hardcoded 48dp bottom margin in `options_bottomsheet_tab.xml` (`AutobahnViewPager`) and resolved scroll clipping in `OptionsMenuView`.
- [x] **Pro Settings Styling & Stock Spacing**: **Resolved** — Aligned Pro panel to Google Camera native 56dp row height, 6dp vertical padding, and 38dp capsule pills with dynamic Monet theming.
- [x] **Device-Aware 50MP Resolution Gating**: **Resolved** — Preserved 50MP selection on Pro Pixel models (Pixel 8 Pro, 9 Pro, 7 Pro, etc.) while cleanly hiding the non-functional toggle on non-Pro Pixels to enforce stock 12MP with restored RAW+JPEG support.
- [ ] **Camera Looks Viewfinder Preview**: Looks apply post-capture due to hardware ISP vendor tag requirements (`REQUEST_TOMTE_TYPE`) on older SoCs.
- [ ] **Grain Adjustment Slider**: Uses fixed baseline organic tone grain; fine-tuning slider has minimal impact without TPU kernel access.
- [ ] **Photos App Project Album Integration**: Neutralized to prevent signature mismatch gRPC authentication exceptions with Google Photos.

### Future Scope
- [ ] **Add Me & Best Take** backporting research.

---

## Quick Download

| Asset | Version | Target Audience | Root Required? | Recommended For | Direct Download Links |
| :--- | :---: | :--- | :---: | :--- | :---: |
| **Patched Pixel Camera APK (`.apk`)** | **`v1.0.9`** | All Pixel 6 → 10 users | ❌ **NO** | Pre-patched & signed standalone APK (All features unlocked, no Morphe Manager needed) | [⬇️ Download APK v1.0.9 (SourceForge Direct)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download) • [SourceForge Mirror](https://sourceforge.net/projects/pixel-camera-patches/files/latest/download) • [All Files](https://sourceforge.net/projects/pixel-camera-patches/files/) |
| **Pixel Camera Morphe Patch (`.mpp`)** | **`v1.0.9`** | All Pixel 6 → 10 users | ❌ **NO** | 1-click on-device patching via Morphe Manager | [⬇️ SourceForge (.mpp)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download) • [GitHub Raw (.mpp)](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp) • [Local File](morphe-patches-pixelcamera-1.0.9.mpp) |
| **Stock Base Pixel Camera APKM** | **`11.1.040`** | All users | ❌ **NO** | Official unmodified stock APK (required only if patching manually via Morphe) | [⬇️ Download from APKMirror](https://www.apkmirror.com/apk/google-inc/camera/pixel-camera-11-1-040-982810059-19-release/) |
| **Patch Source Code (Kotlin)** | **`v1.0.9`** | Developers & Modders | ❌ **NO** | Inspect bytecode hooks & compile with Gradle | [View Source](morphe-patches/) |

---

## Installation Guide

You can either install the pre-patched APK directly (ready to use), or patch the official stock Google Camera APKM yourself using [Morphe](https://morphe.software). **No root required**, and the patched app installs alongside your stock camera without replacing it.

### Method 1: Direct Install (Pre-Patched Standalone APK — Fastest & Easiest)

> [!NOTE]
> This is the **pre-patched APK (`Camera-v11.1.040.982810059.19-patches-v1.0.9.apk`)**, NOT the stock Google Camera APK. All 13 Camera Looks, Pro controls, and fixes are already applied and signed.

1. **Download Patched APK**: Download the latest patched APK directly from [SourceForge Direct Download](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download) (or browse [All Files on SourceForge](https://sourceforge.net/projects/pixel-camera-patches/files/)).
2. **Install**: Tap the downloaded `.apk` file on your phone and tap **Install** (allow installation from unknown sources in your browser or file manager settings if prompted).
3. **Open & Shoot**: Launch **Pixel Camera** from your app drawer. All 13 Camera Looks, Pro controls, and 10x Quick Zoom are immediately active!

---

### Method 2: On Your Android Phone (Morphe Manager)

1. **Install Morphe Manager**: Download the latest release from [morphe.software](https://morphe.software) or GitHub.
2. **Add Patch Source**:
   * **1-Click**: Tap [Add to Morphe Manager](https://morphe.software/add-source?github=Akshayykadam/Pixel-Camera) on your phone.
   * **Or Direct Download**: Download [morphe-patches-pixelcamera-1.0.9.mpp](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp) (GitHub) or from [SourceForge (.mpp)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download).
3. **Get Base Google Camera**:
   * Download [Pixel Camera 11.1.040.982810059.19](https://www.apkmirror.com/apk/google-inc/camera/pixel-camera-11-1-040-982810059-19-release/) (`.apkm` bundle) from APKMirror.
4. **Patch & Install**:
   * In **Morphe Manager**, tap **Select an application** → pick the downloaded APKM file.
   * Select your desired Pixel Camera patches (**Camera Looks Backport**, **Pro Manual Controls**, **10x Viewfinder Quick Zoom**, and **Pixel Camera Clone**).
   * **Universal Patches Selection Guide**:
     | Option | Setting | Note |
     | :--- | :---: | :--- |
     | **Clone app** | ✅ **CHECK** | **Required for Non-Root** to install side-by-side with stock camera. |
     | **Change installer source** | ⚡ **CHECK** | Recommended to avoid Play Protect warnings. |
     | **Disable Play Store updates** | ❌ **UNCHECK** | Not needed for cloned apps; can interfere with camera version logic. |
     | **Override certificate pinning** | ❌ **UNCHECK** | Only for developer proxy debugging; unnecessary for camera. |
   * Tap **Proceed to patching** (or **Patch**). Morphe will merge the split assets and apply the bytecode patches directly on your phone.
   * Once finished, tap **Install**!
5. Open **Pixel Camera** from your app drawer. All 13 Camera Looks, viewfinder quick-access slots, Pro Manual Controls (Focus, Shutter Speed, ISO, Peaking, Badges), 10x zoom button, and creator tools are unlocked!

---

### Method 3: On Your Computer (Morphe Desktop / CLI)

1. Download **Morphe Desktop** from [morphe.software](https://morphe.software).
2. Download [morphe-patches-pixelcamera-1.0.9.mpp](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp) directly from GitHub or [SourceForge](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download).
3. Download the base [Pixel Camera 11.1.040 APKM](https://www.apkmirror.com/apk/google-inc/camera/pixel-camera-11-1-040-982810059-19-release/) from APKMirror.
4. Drop the APKM into Morphe Desktop and apply the patch package.
5. Install the resulting `PixelCamera_signed.apk` to your phone via ADB:
   ```bash
   adb install -r PixelCamera_signed.apk
   ```

---

## Technical Research & Documentation

This repository contains extensive technical teardowns, reverse-engineering analyses, and testing frameworks:

### 🔍 Core Research Reports
* **[Master Camera Looks Teardown](pixel-camera-looks-research/RESEARCH.md)**: Deep technical exploration answering architecture questions regarding gating, Halide kernels, neural style models, and vendor HAL tags.
* **[Pixel Camera Architecture & Root Cause Analysis](docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md)**: Complete reverse-engineering teardown of Dual-EV controls, Camera2 HAL dispatch, and sensor calibration.
* **[Root Cause Fixes & Cumulative Audit](CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)**: Full chronological technical audit, smali hooks, and hardware compatibility fixes.
* **[Developer Guide: Creating Morphe Patches (.mpp)](docs/HOW_TO_CREATE_MORPHE_PATCHES.md)**: Architecture and guide on building Morphe patch packages from scratch.
* **[Viewfinder Quick Access Teardown](camera-looks-quick-access/RESEARCH.md)**: Dalvik bytecode analysis of `pie.java`, `qvb.java`, `qmn.java`, Jetpack Compose integration, and gesture mechanisms.
* **[Creator Suite Research Teardown](creator-suite-research/RESEARCH.md)**: 9-phase reverse engineering of Teleprompter HUD, audio VU meter, and framing guides.
* **[Portrait Mode Integration Report](pixel-camera-looks-research/PORTRAIT_RESEARCH.md)**: Teardown of Gouda, Mantis depth estimation, and Portrait Mode Looks compatibility.
* **[Generational Compatibility Matrix](pixel-camera-looks-research/COMPATIBILITY.md)**: Hardware capabilities and HAL tag behavior across Tensor G1, G2, G3, G4, and G5.
* **[Unified Smali Patches Catalog](patches/README.md)**: Standard unified diffs (`.patch`) capturing all modifications for manual patching on clean APK trees.

### 📱 Per-Generation Hardware Deep Dives
* [Pixel 11 Reference Teardown](pixel-camera-looks-research/analysis/pixel11_reference.md)
* [Pixel 11 (Tensor G6) Analysis](pixel-camera-looks-research/analysis/pixel11.md)
* [Pixel 10 (Tensor G5) Analysis](pixel-camera-looks-research/analysis/pixel10.md)
* [Pixel 9 Pro / 9 (Tensor G4) Analysis](pixel-camera-looks-research/analysis/pixel9.md)
* [Pixel 8 Pro / 8 (Tensor G3) Analysis](pixel-camera-looks-research/analysis/pixel8.md)
* [Pixel 7 Pro / 7 (Tensor G2) Analysis](pixel-camera-looks-research/analysis/pixel7.md)
* [Pixel 6 Pro / 6 / 6a (Tensor G1) Analysis](pixel-camera-looks-research/analysis/pixel6.md)

### 🧪 Verification & Testing
* [Systematic Verification Test Plan](pixel-camera-looks-research/tests/test-plan.md)
* [Test Evaluation Report & Image Diff Benchmarks](pixel-camera-looks-research/tests/results.md)

---

## 📁 Repository Structure

```text
Patch-Pixel-Camera/
├── README.md                            # Master repository documentation & quickstart
├── LICENSE                              # GNU General Public License v3.0 (GPL-3.0)
├── .gitignore                           # Excludes multi-GB APKs, decompiled trees, & secrets
├── .github/workflows/                   # Automated CI workflows (Morphe .mpp builder)
├── build_and_patch_pixelcamera.py       # Standalone automated build, smali patching & signing script
├── morphe-patches-pixelcamera-1.0.9.mpp  # Compiled v1.0.9 Morphe patch package bundle
├── patches-bundle.json                  # Morphe Manager custom source release metadata
├── patches-list.json                    # Morphe Manager patch catalog & target compatibility
│
├── docs/                                # In-depth technical guides & architecture specifications
│   ├── PIXEL_CAMERA_PATCHES_DOCUMENTATION.md # Complete patch suite architecture & root cause analysis
│   └── HOW_TO_CREATE_MORPHE_PATCHES.md  # Step-by-step developer guide on creating .mpp bundles
│
├── smali_patches/                       # Standalone Smali reference patches & injected bytecode
│   ├── README.md                        # Complete documentation of all 71 smali patch modules
│   ├── TomteProSettingsPanel.smali      # Material You Pro settings bottom sheet panel
│   ├── TomteInitHelper.smali            # Injected Tomte neural helper, isProDevice(), & sharpness
│   ├── nrd.smali / nrm.smali            # Dual-EV Brightness & Shadows with Reset buttons
│   ├── nrc.smali / pfh.smali            # Bottom sheet dispatcher & direct AE compensation
│   └── klm.smali / qaa.smali / qbb.smali # Pro flags (camera.ark) and live drag suppression
│
├── patches/                             # Standard Unified Diffs (.patch) for clean APK trees
│   ├── README.md                        # Catalog of all 32 modular patches and application guide
│   ├── all_smali_changes.patch          # Single cumulative patch applying all modifications
│   ├── zoom_10x_buttons.patch           # 10x viewfinder zoom button diff
│   ├── looks_pipeline.patch             # Camera Looks pipeline and Catshark bypass
│   └── guh_focal_length_cycling.patch   # 1x focal length cycling (24mm, 28mm, 35mm)
│
├── morphe-patches/                      # Official Morphe Patch Package (.mpp) Source
│   ├── README.md                        # Morphe patch usage & compilation guide
│   ├── gradlew                          # Gradle wrapper executable (Unix)
│   ├── gradlew.bat                      # Gradle wrapper executable (Windows)
│   ├── gradle/                          # Gradle wrapper JAR, properties & version catalog
│   ├── build.gradle.kts                 # Root Gradle configuration
│   ├── settings.gradle.kts              # Gradle plugin & repository configuration
│   ├── gradle.properties                # JVM & caching configuration
│   └── patches/                         # Morphe Patches subproject
│       ├── build.gradle.kts             # Patch metadata & dependency configuration
│       └── src/main/kotlin/app/morphe/patches/pixelcamera/
│           ├── looks/CameraLooksPatch.kt               # Unlocks 13 Looks across Tensor G1–G5
│           ├── quickaccess/QuickAccessPatch.kt         # Viewfinder shortcut slots & tick-slider
│           ├── pro/ProControlsPatch.kt                 # Pro manual controls (Focus, Shutter, ISO)
│           ├── portrait/TelephotoPortraitAndZoomPatch.kt # 10x Viewfinder Quick Zoom button
│           ├── creator/CreatorSuitePatch.kt            # Teleprompter HUD, VU meter, & guides
│           ├── video/Av1VideoEncodingPatch.kt          # Hardware AV1 10-bit video encoding
│           ├── quality/ProImageQualityPatch.kt         # In-app JPEG quality & spatial denoising
│           ├── brightness/MaxBrightnessPatch.kt        # 100% viewfinder display backlight
│           ├── photosaving/PhotoSavingFixPatch.kt      # Pixel 10 RAW dimensions & photo saving
│           └── clone/PixelCameraClonePatch.kt          # Non-root clone to GoogleCameraEng
│
├── camera-looks-quick-access/           # Quick Access Shortcut Research & Documentation
│   ├── README.md                        # Quick Access executive summary & physical test report
│   ├── RESEARCH.md                      # Viewfinder shortcut & tick-slider reverse-engineering
│   └── COMPATIBILITY.md                 # Viewfinder gesture & settings compatibility matrix
│
├── creator-suite-research/              # Creator Suite (Teleprompter, VU Meter, Guides) Research
│   ├── README.md                        # Creator Suite executive summary & feature guide
│   ├── RESEARCH.md                      # 9-phase reverse engineering & smali analysis report
│   └── COMPATIBILITY.md                 # Device compatibility matrix (Pixel 6 -> 10 Pro XL)
│
└── pixel-camera-looks-research/         # Camera Looks (Sauce/Tomte) Research & Documentation
    ├── README.md                        # Project layout & summary
    ├── RESEARCH.md                      # Comprehensive 10-question technical teardown
    ├── PORTRAIT_RESEARCH.md             # Portrait mode & Gouda/Mantis pipeline integration
    ├── COMPATIBILITY.md                 # Hardware SoC & HAL compatibility matrix
    ├── analysis/                        # Per-generation device teardowns (Pixel 6 through 11)
    └── tests/                           # Verification test plans & benchmark results
```

---

## Frequently Asked Questions (FAQ)

<details>
<summary><b>Why is Motion Blur (Action Pan / Long Exposure) missing from the modes bar?</b></summary>
<p>
Motion Blur neural models rely on <code>edgetpu-custom-op-2</code> microcode running directly on Google's EdgeTPU hardware (<code>/dev/gxp</code>). Android's SELinux security policy restricts <code>/dev/gxp</code> access strictly to system-signed OEM packages; non-root modded apps (<code>untrusted_app</code> context) are blocked at the kernel driver level. Because the custom TPU operations have no CPU/GPU fallback implementations in Google's native binaries, attempting to execute the models causes optical flow processing to stall and photos fail to save. The mode has been cleanly hidden to ensure all other camera features (Photo, Portrait, Night Sight, Video, Pro Sliders, and Looks) function flawlessly.
</p>
</details>

<details>
<summary><b>Why don't Camera Looks preview live in the viewfinder before taking a photo?</b></summary>
<p>
On Pixel 11, real-time 60 fps viewfinder tone mapping is handled by a proprietary hardware ISP extension (<code>REQUEST_TOMTE_TYPE</code> vendor tag). Older Tensor generations (G1–G5) lack this hardware ISP hook in their camera HAL. Simulating 3D LUTs in software over the live viewfinder feed causes thermal throttling and frame drops. The backport executes Google's native Halide C++ pipeline (<code>tomte_tonemap.cc</code>) during HDR+ post-capture processing, guaranteeing a smooth viewfinder and pristine full-resolution output.
</p>
</details>

<details>
<summary><b>Will this replace or break my stock Google Camera?</b></summary>
<p>
No. The patch clones the application into <code>com.google.android.GoogleCameraEng</code> (or <code>com.google.android.GoogleCamera.morphe</code>). The modded app installs alongside your stock Google Camera as an independent app. Both can run simultaneously, and system OTA updates will not be affected.
</p>
</details>

<details>
<summary><b>Does this require root access?</b></summary>
<p>
Root is <b>NOT required</b>. Morphe patches the application bytecode directly and signs it with a release certificate so it installs and runs on any unrooted Pixel 6 through Pixel 10 device.
</p>
</details>

<details>
<summary><b>Do photos taken with Looks save correctly in Google Photos?</b></summary>
<p>
Yes. Photos are written to the standard <code>DCIM/Camera</code> directory with complete EXIF and embedded <code>GFileMetadata$Sauce</code> tags, allowing Google Photos to display and backup captures normally.
</p>
</details>

<details>
<summary><b>Why do I get "ZipException: invalid stored block lengths" in Morphe Manager?</b></summary>
<p>
This error occurs in <code>SplitApkPreparer</code> when the downloaded <code>.apkm</code> archive is incomplete, corrupted, or has malformed compression stream boundaries from mobile browser downloads. To fix:
<ol>
  <li>Re-download the clean base <code>Pixel Camera 11.1.040.982810059.19</code> (or <code>11.0.073.972752740.32</code>) APKM using a reliable download manager or PC browser.</li>
  <li>Verify the archive integrity before patching.</li>
  <li>Alternatively, rename the downloaded <code>.apkm</code> file to <code>.zip</code>, extract its contents (e.g., using ZArchiver, 7-Zip, or Files by Google), and select the extracted <code>base.apk</code> directly inside Morphe Manager.</li>
</ol>
</p>
</details>

<details>
<summary><b>What Android versions are supported?</b></summary>
<p>
Android 14 (API 34), Android 15 (API 35), and Android 16/17 previews. The Morphe patch automatically backports the <code>minSdkVersion</code> requirement from 37 down to 34.
</p>
</details>

---

## 📋 Release History & Changelog

| **v1.0.9** *(Latest)* | • **True 50MP Full-Resolution Capture on Pro Devices**: Restored unbinned 50.13 MP capture (`8160 x 6144`, ~15–30 MB) on Pro devices by neutralizing automatic 12MP downsampling in `rdb.C()`/`rdb.D()`, while dynamically hiding the toggle on non-Pro devices via `isProDevice()` to enforce stable 12MP capture without placebo toggles.<br>• **Camera HAL Stream & Metadata Crash Safeguards**: Fixed `uwj` CameraMetadata missing key startup crashes in `msr.smali` through safe optional fallback, and eliminated stream format collisions to guarantee rock-solid live viewfinder preview across all supported devices.<br>• **Unified Pro Settings Sheet & Material You Layout Integration**: Injected `TomteProSettingsPanel` directly into Google Camera's native bottom settings sheet (`poy.M(I)` and `poy.r(I)`), providing full in-drawer controls for Camera Looks selection, Uncompressed 16-bit DNG capture, and custom edge sharpness/de-ringing filter options.<br>• **Stock-Aligned Spacing & AutobahnViewPager Fix**: Fixed row layout clipping and eliminated extraneous `48dp` bottom margins (`options_bottomsheet_tab.xml`), ensuring all rows adhere to stock `56dp` row height and capsule pill standards (`38dp` height, `14dp` padding, `100dp` corner radius) with dynamic Monet wallpaper coloring.<br>• **Custom Edge Sharpness & De-Ringing Filter Modes**: Added user-selectable sharpness tuning (Standard, Natural, Soft) hooked into `TomteInitHelper.filterSharpness()`, preventing aggressive edge haloes while preserving fine textures.<br>• **Uncompressed 16-bit DNG Capture Support**: Restored uncompressed raw output support in Gcam, ensuring tone-curve and sensor dynamics are fully preserved without lossy compression artifacts.<br>• **Full Pipeline & Morphe Patch Package Sync**: Synchronized Morphe patcher bundle (`morphe-patches-pixelcamera-1.0.9.mpp`), standalone APK builder (`build_and_patch_pixelcamera.py`), and unified DEX helper runtime to v1.0.9. |
| **v1.0.8** | • **Visual App Name & Comprehensive International Localization**: Updated the visual application name from generic "Camera" / "PixelCamera" to clean "Pixel Camera" with native localization across 124 language locales (e.g., "Pixel Kamera" for German, "Cámara Pixel" for Spanish, "Appareil photo Pixel" for French, "Fotocamera Pixel" for Italian, "Câmera Pixel" / "Câmara Pixel" for Portuguese).<br>• **Launcher Activity Alias Label Alignment**: Added explicit `android:label="@string/app_name"` to launcher activity alias `com.android.camera.CameraLauncher` in `AndroidManifest.xml` ensuring consistent app drawer title display across all OEM and third-party launchers.<br>• **Unified Build & Patcher Pipeline Sync**: Synchronized `PixelCameraClonePatch.kt` (`injectLocalizedAppNames()`), standalone builder `build_and_patch_pixelcamera.py`, and compiled release `.mpp` patch bundles to v1.0.8. |
| **v1.0.7** | • **Fixed Video Mode Exposure & Viewfinder Controls (Issue #25)**: Corrected viewfinder slider attachment in `ltg.i` and `nzr.e` so Video mode cleanly displays the single Exposure slider (and White Balance/Temp) without incorrectly forcing broken Dual EV Shadow controls, routing live slider drag events to Camera2 `CONTROL_AE_EXPOSURE_COMPENSATION`.<br>• **AV1 Video Hardware Encoding (Issue #36)**: Unlocked `camcorder.jellybean_setting` and `camcorder_jellybean_feature` to expose the 3-way format selector (AVC, HEVC, AV1) in Video settings on Tensor G3 (Pixel 8 series) and Tensor G4 (Pixel 9 series) with automatic fallback for older devices and seamless fallback to HEVC for 10-bit HDR recording.<br>• **In-App JPEG Quality & Spatial Noise Reduction Menus (Issue #25)**: Added user-facing settings under "Photo resolution" in `camera_preferences.xml` and `camera_gm3_preferences.xml` allowing selection of JPEG compression quality (100% Ultra, 98% High, 95% Stock) and Spatial Noise Reduction (Off, Minimal, Stock), dynamically hooked into Camera2 capture requests and native Gcam encoder.<br>• **In-App 100% Max Display Brightness Toggle**: Added user-facing toggle under "Display" in Camera Settings, enforcing 100% display backlight exclusively during active viewfinder sessions while keeping standard system brightness in Settings and gallery.<br>• **Fixed Film Grain Initialization (Issue #38)**: Injected `TomteInitHelper.initTomteGrain(J)` into `msr.a` (`Gcam.<init>`) and `ndf.a` (`FilmGrainJni.applyTomteImageFinalizer`) to load the native grain model (`.tflite.uncompressed`), resolving `GetTomteGrainModel: Tomte requested, but initialization failed`.<br>• **Enforced Tomte Grain Mode Tracking & Pre-warming**: Connected `sof.P` (`setGcamMode`) to `TomteInitHelper.setCurrentMode()` to keep grain enabled across PHOTO, PORTRAIT, and NIGHT modes without dropping to disabled state, and injected `forceF = true` into `mqs.a` (`mia`) to guarantee Tomte grain model descriptors are initialized at startup.<br>• **Comprehensive Patcher & Patch Synchronization**: Added missing `tcc.<init>` and `tcc.b()` hooks in `CameraLooksPatch.kt`, injected `camera_preferences.xml` into `PixelCameraClonePatch.kt`, generated standalone patches, and aligned bundle version metadata across `patches-list.json` and `patches-bundle.json` to `v1.0.7`. |
| **v1.0.6** | • **Fixed Dalvik Bytecode VerifyError on Launch**: Resolved register type conflict in `qwh.smali` by inserting the Shadows/Highlights pipeline synchronization hook at method entry.<br>• **Fixed Dark Viewfinder on Gallery Return**: Fixed session pause/close reset in `oak.smali` (`oak.e`) to reset `pco.f` (live Brightness) to neutral `0.5f` instead of `-1.0f`.<br>• **Fixed Auto-Exposure Convergence**: Eliminated negative twilight AE bias hijacking in `pzq.smali` and preserved clean initial sensor baseline calibration in `pzj.smali`.<br>• **1x Main Camera Focal Length Cycling**: Tapping the `1x` zoom button now cycles between 1.0x (24mm) → 1.2x (28mm) → 1.5x (35mm) → 1.0x.<br>• **Live Dual-EV & Pro Slider Response**: Unlocked real-time exposure and tone curve updates while dragging without snap-back to auto. |
| **v1.0.5** | • **Fixed Startup Crash on Pixel 9 Pro, 9 Pro XL & Pixel 8 Pro**: Resolved ART bytecode `VerifyError` in `knq` and `knk` by safely routing zoom stop references through `v11` and preserving primitive float register `v5` (`2.0f`) for `gei.o(FLabjo;)V`.<br>• **Preserved Stock Tensor G4 Capabilities**: Kept native `vku.g` and `vku.f` hardware capability flags on Pixel 9 series to prevent profile fallback.<br>• **64-bit Pointer Pair Alignment**: Fixed look ID scratch register in `mtt.K` (`ShotParams_tomte_type_set`) to `v15`, eliminating wide register pair collisions.<br>• **Viewfinder & Quick Access Hardening**: Removed legacy `EvCompView.onMeasure` bytecode hook causing Android 15 verification conflicts, and added null-safety guards across activity startup. |
| **v1.0.4** | • Unlocked all 13 Camera Looks (+ Flat, Buffalo, Dijon).<br>• Restored viewfinder tap-to-focus dual sliders (**Brightness & Shadow**) with full dynamic range and bidirectional sync with bottom drawer.<br>• Pixel 10 12MP Photo Saving fix (disables failing Flare Removal & Eclipse AE with binned RAW fallbacks).<br>• Creator Suite (Teleprompter, VU Meter, Social Framing). |
| **v1.0.3** | Initial public release (10 Camera Looks backport, Portrait Mode fix, 10x Quick Zoom, Pro manual controls). |

---

## ⚠️ Legal Disclaimer

* **No Proprietary Binaries Hosted**: This repository does **NOT** host, bundle, or distribute proprietary Google binaries, APKs, compiled native libraries (`.so`), or neural network models (`.tflite`). All modifications are provided strictly as open-source bytecode patch recipes (`.mpp`) and educational research documentation.
* **Educational & Interoperability Research**: This project is an independent study conducted solely for academic research, reverse-engineering analysis, and device interoperability under fair use (17 U.S.C. § 107).
* **Trademark Acknowledgment**: **Google**, **Pixel**, **Google Camera**, **Android**, **Tensor**, **HDR+**, and associated marks are trademarks or registered trademarks of Google LLC. This project is an independent community effort and is **not affiliated with, endorsed by, sponsored by, or associated with Google LLC or Alphabet Inc.**
* **Disclaimer of Warranty**: All patches, recipes, and documentation are provided on an "AS-IS" basis without warranties of any kind, express or implied. Users assume full responsibility for modifying applications on their own devices.

---

<div align="center">
Made with ❤️ for the Google Pixel Community.
</div>
