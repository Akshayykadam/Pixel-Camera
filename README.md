<div align="center">

# Pixel Camera: Looks and Creator Suit Backport

**Unlocking Google Pixel 11's next-generation "Camera Looks" and "Creator Suit" on Pixel 6 through Pixel 10.**
<br />

<!-- DOWNLOAD CTA BUTTONS -->
<p align="center">
  <a href="https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.1.3.apk/download">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%201--CLICK%20DOWNLOAD%20APK%20v1.1.3-Pixel%20Camera%20(SourceForge)-ee6600?style=for-the-badge&logo=sourceforge&logoColor=white&labelColor=d45500" alt="1-Click Download Latest Patched APK" height="42">
  </a>
  <a href="https://morphe.software/add-source?github=Akshayykadam/Pixel-Camera">
    <img src="https://img.shields.io/badge/%E2%9A%A1%EF%B8%8F%201--CLICK%20INSTALL-Add%20to%20Morphe%20Manager-4285f4?style=for-the-badge&logo=android&logoColor=white&labelColor=1a73e8" alt="1-Click Add to Morphe Manager" height="42">
  </a>
  <a href="https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.1.3.mpp/download">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20DOWNLOAD%20PATCH%20v1.1.3-Morphe%20(SourceForge)-ee6600?style=for-the-badge&logo=sourceforge&logoColor=white&labelColor=d45500" alt="Download Latest Patch (.mpp) from SourceForge" height="42">
  </a>
  <a href="https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.1.3.mpp">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20DOWNLOAD%20PATCH%20v1.1.3-Morphe%20(GitHub)-00acc1?style=for-the-badge&logo=github&logoColor=white&labelColor=00838f" alt="Download Latest Patch (.mpp) from GitHub" height="42">
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

| Feature | Description | Supported Devices |
| :--- | :--- | :---: |
| **13 Camera Looks** | Pixel 11 signature color profiles with real-time live viewfinder OpenGL preview. | Pixel 6 → 10 |
| **Pro Manual Controls** | Precision manual focus, GPU edge peaking, manual shutter speed (up to 1/8000s), manual ISO, and live viewfinder metrics. | Pixel 6 → 10 |
| **10x Quick Zoom** | Discrete 1-tap 10x Super Res Zoom button on the viewfinder zoom strip. | Pixel 7P, 8P, 9P, 10P |
| **Quick Access Slots** | Customizable Left/Right shortcut slots with interactive on-screen vertical slider for fast switching. | Pixel 6 → 10 |
| **Night Sight Tagging** | Official Google Photos `SpecialType-NIGHT` badge, animation, and auto-night session retention. | Pixel 6 → 10 |
| **Separate RAW Folder** | In-app toggle to save DNG RAW photos to `Pictures/Raw/` to avoid eating Google Photos cloud storage. | Pixel 6 → 10 |
| **Video Bitrates & Modes** | Custom bitrates (Stock, High, Ultra) and stabilization modes (Standard, OIS Only for cinematic handheld, Off for tripod). | Pixel 6 → 10 |
| **AV1 Video Encoding** | Next-generation 10-bit AV1 hardware video recording (~30% higher efficiency than HEVC). | Tensor G3 & G4 |
| **Pro Image Quality** | In-app JPEG Quality (100% Ultra, 98% High, 95% Stock) and Spatial Noise Reduction (Stock, Minimal, Off). | Pixel 6 → 10 |
| **True 50MP Capture** | Unbinned 50 MP full-resolution capture on Pro models (`8160 x 6144`, ~15–30 MB) with clean 12MP on non-Pro models. | Pro Pixels |
| **100% Display Backlight** | In-app toggle forcing full screen brightness during active viewfinder sessions for clear outdoor sunlight visibility. | Pixel 6 → 10 |
| **Creator Suite** | Floating Teleprompter HUD with auto-scroll, live microphone VU visualizer, and composition framing guides (9:16, 1:1). | Pixel 6 → 10 |
| **Native App Label** | Clean "Pixel Camera" app drawer title with native international localization across 124 languages. | Pixel 6 → 10 |

<details>
<summary><b>Click to view all 13 Camera Looks presets</b></summary>

| # | Look Preset | Visual Characteristics |
| :---: | :--- | :--- |
| **0** | **Original** | Google's classic true-to-life HDR+ computational look |
| **1** | **Natural** | Subtle softening, neutral skin tones, restrained saturation |
| **2** | **Shadows** | Deepened cinematic blacks and moody contrast |
| **3** | **Vanilla** | Warm golden-hour radiance with soft ambient highlights |
| **4** | **Editorial** | Rich Kodachrome-inspired magazine colors and contrast |
| **5** | **Velvet** | High-saturation landscape tones inspired by Fuji Velvia |
| **6** | **Classic** | Timeless analog film aesthetic inspired by Kodak Portra |
| **7** | **Digi** | Nostalgic early-2000s compact digital camera punch and flare |
| **8** | **Black Tie** | Fine-grain monochrome with deep dynamic contrast |
| **9** | **Minimal** | Clean, desaturated fine-art Scandinavian look |
| **10** | **Flat** | Low-contrast flat profile with maximum latitude for color grading |
| **11** | **Buffalo** | Punchy earth-tone saturation with expanded dynamic latitude |
| **12** | **Dijon** | Warm vintage look with olive-tinted highlights and faded contrast |

</details>

---

## ⚠️ Known Hardware Limitations

* **Motion Blur (Action Pan & Long Exposure)**: Intentionally hidden. Running as a non-root app cannot access Google's internal `/dev/gxp` TPU kernel driver, which would stall photo capture.
* **50MP Capture**: Available on Pro models with physical 50MP sensor hardware. Non-Pro models cleanly default to 12MP binned capture.
* **10x Quick Zoom Button**: Requires physical telephoto periscope hardware (Pixel 7 Pro, 8 Pro, 9 Pro, 10 Pro).
* **Film Grain Slider**: Operates at a fixed natural baseline profile across all Looks; dynamic variance weighting is restricted to prevent GPU/CPU thrashing without EdgeTPU access.
*(For deep engineering teardowns, smali hooks, and kernel analysis, see [CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md](CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)).*

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
- [x] **Camera Looks Viewfinder Preview**: **Resolved** — Real-time live viewfinder Look preview active across all supported Pixel devices.
- [x] **DNG Backup Folder Selection (Issue #85)**: **Resolved** — Added in-app setting toggle to save RAW (DNG) captures to `Pictures/Raw` to avoid automatic Google Photos cloud sync, or keep in `DCIM/Camera` based on user choice.
- [ ] **Grain Adjustment Slider**: Uses fixed baseline organic tone grain; fine-tuning slider has minimal impact without TPU kernel access.
- [ ] **Photos App Project Album Integration**: Neutralized to prevent signature mismatch gRPC authentication exceptions with Google Photos.

### Future Scope
- [ ] **Add Me & Best Take** backporting research.

---

## Quick Download

| Asset | Version | Target Audience | Root Required? | Recommended For | Direct Download Links |
| :--- | :---: | :--- | :---: | :--- | :---: |
| **Patched Pixel Camera APK (`.apk`)** | **`v1.1.3`** | All Pixel 6 → 10 users | ❌ **NO** | Pre-patched & signed standalone APK (All features unlocked, no Morphe Manager needed) | [⬇️ 1-Click Download APK v1.1.3 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.1.3.apk/download) • [All Files](https://sourceforge.net/projects/pixel-camera-patches/files/) |
| **Pixel Camera Morphe Patch (`.mpp`)** | **`v1.1.3`** | All Pixel 6 → 10 users | ❌ **NO** | 1-click on-device patching via Morphe Manager | [⚡ 1-Click Add to Morphe](https://morphe.software/add-source?github=Akshayykadam/Pixel-Camera) • [⬇️ SourceForge (.mpp v1.1.3)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.1.3.mpp/download) • [GitHub Raw (.mpp)](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.1.3.mpp) |
| **Stock Base Pixel Camera APKM** | **`11.1.040`** | All users | ❌ **NO** | Official unmodified stock APK (required only if patching manually via Morphe) | [⬇️ Download from APKMirror](https://www.apkmirror.com/apk/google-inc/camera/pixel-camera-11-1-040-982810059-19-release/) |
| **Patch Source Code (Kotlin)** | **`v1.1.3`** | Developers & Modders | ❌ **NO** | Inspect bytecode hooks & compile with Gradle | [View Source](morphe-patches/) |

---

## Installation Guide

You can either install the pre-patched APK directly (ready to use), or patch the official stock Google Camera APKM yourself using [Morphe](https://morphe.software). **No root required**, and the patched app installs alongside your stock camera without replacing it.

### Method 1: Direct Install (Pre-Patched Standalone APK — Fastest & Easiest)

> [!NOTE]
> This is the **pre-patched APK (`Camera-v11.1.040.982810059.19-patches-v1.1.3.apk`)**, NOT the stock Google Camera APK. All 13 Camera Looks, Pro controls, and fixes are already applied and signed.

1. **Download Patched APK**: Download the latest patched APK via [1-Click Direct Download (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.1.3.apk/download) (or browse [All Files on SourceForge](https://sourceforge.net/projects/pixel-camera-patches/files/)).
2. **Install**: Tap the downloaded `.apk` file on your phone and tap **Install** (allow installation from unknown sources in your browser or file manager settings if prompted).
3. **Open & Shoot**: Launch **Pixel Camera** from your app drawer. All 13 Camera Looks, Pro controls, and 10x Quick Zoom are immediately active!

---

### Method 2: On Your Android Phone (Morphe Manager)

1. **Install Morphe Manager**: Download the latest release from [morphe.software](https://morphe.software) or GitHub.
2. **Add Patch Source**:
   * **1-Click**: Tap [Add to Morphe Manager](https://morphe.software/add-source?github=Akshayykadam/Pixel-Camera) on your phone.
   * **Or Direct Download**: Download [morphe-patches-pixelcamera-1.1.3.mpp](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.1.3.mpp) (GitHub) or from [SourceForge (.mpp)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.1.3.mpp/download).
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
2. Download [morphe-patches-pixelcamera-1.1.3.mpp](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.1.3.mpp) directly from GitHub or [SourceForge](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.1.3.mpp/download).
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
├── morphe-patches-pixelcamera-1.1.3.mpp  # Compiled v1.1.3 Morphe patch package bundle
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
Android 11 (API 30), Android 12 (API 31/32), Android 13 (API 33), Android 14 (API 34), Android 15 (API 35), and Android 16/17 previews. Both the Morphe patch and standalone APK automatically backport the <code>minSdkVersion</code> requirement from 37 down to 30 with complete tripartite signing (v1, v2, v3).
</p>
</details>

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
