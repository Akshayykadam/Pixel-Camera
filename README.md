<div align="center">

# Pixel Camera: Looks & Quick Access Backport

**Unlocking Google Pixel 11's next-generation "Camera Looks" & Viewfinder Quick Access on Pixel 6 through Pixel 10.**
<br />

<!-- DOWNLOAD CTA BUTTONS -->
<p align="center">
  <a href="https://github.com/akshayykadam/Patch-Pixel-Camera/releases/latest">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F%20DOWNLOAD%20LATEST%20RELEASE-PixelCamera%20Morphe%20Patch%20v1.0.0%20(.mpp)-00acc1?style=for-the-badge&logo=android&logoColor=white&labelColor=00838f" alt="Download Latest Release" height="42">
  </a>
</p>

---

</div>

## Overview

Google introduced **"Camera Looks"** (designated internally as `sauce` and `tomte`) and customizable **Quick Access Viewfinder Shortcuts** with Pixel Camera `11.0.073.972752740.32` on the Pixel 11 family. 

Through deep reverse-engineering of Dalvik bytecode and native Halide binaries, we discovered that **the complete feature framework is present across older Pixel devices**. The features were withheld exclusively via runtime feature flags and device checks.

This repository provides **comprehensive reverse-engineering research**, **device-by-device compatibility analyses**, architectural documentation on **hardware limitations & technical reasons**, and the **official Morphe patch package (`.mpp`)** to bring these features to older Google Pixel phones directly on-device without root.

---

## Key Features Unlocked

### 1. Ten Signature Camera Looks (Sauce & Tomte)
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

---

## Generational Compatibility Matrix

Tested on physical hardware and verified through Dalvik bytecode and native binary teardowns:

| Generation | Device Models | SoC | Looks Capture | Quick Access | Pro Controls | 10x Zoom | Processing Engine | Status |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: | :--- | :--- |
| **Pixel 11** | Pixel 11, 11 Pro | Tensor G6 | ✅ | ✅ | ✅ | ✅ | Hardware TPU + HAL | **Native** |
| **Pixel 10 Series** | Pixel 10, 10 Pro, 10 Pro XL | Tensor G5 | ✅ | ✅ | ✅ | ✅ (Pro) | Hybrid TPU / GPU | **Verified** |
| **Pixel 9 Series** | Pixel 9, 9 Pro, 9 Pro XL, 9 Pro Fold | Tensor G4 | ✅ | ✅ | ✅ | ✅ (Pro) | GPU / TPU Fallback | **Verified** |
| **Pixel 8 Series** | Pixel 8, 8 Pro, 8a | Tensor G3 | ✅ | ✅ | ✅ | ✅ (Pro) | Mali-G715 GPU / Halide | **Verified** |
| **Pixel 7 Series** | Pixel 7, 7 Pro, 7a | Tensor G2 | ✅ | ✅ | ✅ | ✅ (Pro) | GPU / Halide CPU | **Verified** |
| **Pixel 6 Series** | Pixel 6, 6 Pro, 6a | Tensor G1 | ✅ | ✅ | ✅ | ✅ (Pro) | Halide CPU Worker | **Verified\*** |

> [!TIP]
> **\*Memory Optimization for 6GB RAM Devices (Pixel 6a / 7a)**: Continuous burst captures (>4 rapid shots) can trigger low-memory trimming. The patch limits concurrent Halide worker threads to 2 on devices with $\le 6\text{ GB}$ RAM to guarantee continuous stability.

---

## Known Issues & Future Scope

### Known Issues Tracker
- [x] **Motion Blur (Action Pan / Long Exposure) Stalls**: **Resolved** — Cleanly hidden and disabled via `camera.lasagna` flags to prevent photo-saving hangs caused by SELinux `/dev/gxp` restrictions.
- [x] **Brightness & Shadows Quick Sliders**: **Resolved** — Fully mapped to all 4 exposure controllers (`mzc`, `nrh`, `nre`, `nrd`).
- [x] **Portrait Mode Crash**: **Resolved** — Preserved stable stock portrait pipeline across all devices.
- [ ] **Camera Looks Viewfinder Preview**: Looks apply post-capture due to hardware ISP vendor tag requirements on older SoCs.
- [ ] **Grain Adjustment Slider**: Uses fixed baseline organic tone grain; fine-tuning slider has minimal impact without TPU kernel access.
- [ ] **Photos App Project Album Integration**: Neutralized to prevent signature mismatch gRPC authentication exceptions with Google Photos.

### Future Scope
- [ ] **Add Me & Best Take** backporting research.
- [ ] **OpenCL Shader Pipeline for Live Preview**: Experimental GPU shader LUT emulation for real-time viewfinder Looks.
- [ ] **Custom Film Look Preset Importer**: Allow users to load custom 3D LUT `.cube` or `.png` HaldCLUT profiles into the Tomte engine.
- [ ] **Enhanced Pro Controls**: Additional manual shutter speed, ISO, and focus peaking options.

---

## Quick Download

| Asset | Version | Target Audience | Root Required? | Recommended For | Link |
| :--- | :---: | :--- | :---: | :--- | :---: |
| **Pixel Camera Morphe Patch (`.mpp`)** | **`v1.0.0`** | All Pixel 6 → 10 users | ❌ **NO** | 1-click on-device patching via Morphe Manager | [Download v1.0.0 (.mpp)](https://github.com/akshayykadam/Patch-Pixel-Camera/releases/latest) |
| **Patch Source Code (Kotlin)** | **`v1.0.0`** | Developers & Modders | ❌ **NO** | Inspect bytecode hooks & compile with Gradle | [View Source](morphe-patches/) |

---

## Installation Guide

Using [Morphe](https://morphe.software), you patch the official, clean Google Camera APKM directly on your Android phone or PC. **No root required**, and the patched app installs alongside your stock camera without replacing it.

### Method 1: On Your Android Phone (Morphe Manager — Recommended)

1. **Install Morphe Manager**: Download the latest release from [morphe.software](https://morphe.software) or GitHub.
2. **Add Patch Source**:
   * **1-Click**: Tap [Add to Morphe Manager](https://morphe.software/add-source?github=akshayykadam/Patch-Pixel-Camera) on your phone.
   * **Or Manual Import**: Download `morphe-patches-pixelcamera-1.0.0.mpp` from [Releases](https://github.com/akshayykadam/Patch-Pixel-Camera/releases/latest).
3. **Get Base Google Camera**:
   * Download `Pixel Camera 11.0.073.972752740.32` (`.apkm` bundle) from APKMirror.
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
5. Open **PixelCamera** from your app drawer. All 10 Camera Looks, viewfinder quick-access slots, Pro Manual Controls (Focus, Shutter Speed, ISO, Peaking, Badges), 10x zoom button, and creator tools are unlocked!

---

### Method 2: On Your Computer (Morphe Desktop / CLI)

1. Download **Morphe Desktop** from [morphe.software](https://morphe.software).
2. Download `morphe-patches-pixelcamera-1.0.0.mpp` from [Releases](https://github.com/akshayykadam/Patch-Pixel-Camera/releases/latest).
3. Drop the `Pixel Camera 11.0.073` APKM into Morphe Desktop and apply the patch package.
4. Install the resulting `PixelCamera_signed.apk` to your phone via ADB:
   ```bash
   adb install -r PixelCamera_signed.apk
   ```

---

## Technical Research & Documentation

This repository contains extensive technical teardowns, reverse-engineering analyses, and testing frameworks:

### 🔍 Core Research Reports
* **[Master Camera Looks Teardown](pixel-camera-looks-research/RESEARCH.md)**: Deep technical exploration answering architecture questions regarding gating, Halide kernels, neural style models, and vendor HAL tags.
* **[Viewfinder Quick Access Teardown](camera-looks-quick-access/RESEARCH.md)**: Dalvik bytecode analysis of `pie.java`, `qvb.java`, `qmn.java`, Jetpack Compose integration, and gesture mechanisms.
* **[Portrait Mode Integration Report](pixel-camera-looks-research/PORTRAIT_RESEARCH.md)**: Teardown of Gouda, Mantis depth estimation, and Portrait Mode Looks compatibility.
* **[Generational Compatibility Matrix](pixel-camera-looks-research/COMPATIBILITY.md)**: Hardware capabilities and HAL tag behavior across Tensor G1, G2, G3, G4, and G5.

### Per-Generation Hardware Deep Dives
* [Pixel 11 Reference Teardown](pixel-camera-looks-research/analysis/pixel11_reference.md)
* [Pixel 10 (Tensor G5) Analysis](pixel-camera-looks-research/analysis/pixel10.md)
* [Pixel 9 Pro / 9 (Tensor G4) Analysis](pixel-camera-looks-research/analysis/pixel9.md)
* [Pixel 8 Pro / 8 (Tensor G3) Analysis](pixel-camera-looks-research/analysis/pixel8.md)
* [Pixel 7 Pro / 7 (Tensor G2) Analysis](pixel-camera-looks-research/analysis/pixel7.md)
* [Pixel 6 Pro / 6 / 6a (Tensor G1) Analysis](pixel-camera-looks-research/analysis/pixel6.md)

---

## 📁 Repository Structure

```text
Patch-Pixel-Camera/
├── README.md                            # Master repository documentation & quickstart
├── LICENSE                              # GNU General Public License v3.0 (GPL-3.0)
├── .gitignore                           # Excludes multi-GB APKs, decompiled trees, & secrets
├── .github/workflows/                   # Automated CI workflows (Morphe .mpp builder)
├── patches-bundle.json                  # Morphe Manager custom source release metadata
├── patches-list.json                    # Morphe Manager patch catalog & target compatibility
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
│           ├── looks/CameraLooksPatch.kt               # Unlocks 10 Looks across Tensor G1–G5
│           ├── quickaccess/QuickAccessPatch.kt         # Viewfinder shortcut slots & tick-slider
│           ├── portrait/TelephotoPortraitAndZoomPatch.kt # 10x Viewfinder Quick Zoom button
│           ├── creator/CreatorSuitePatch.kt            # Teleprompter HUD, VU meter, & guides
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
<summary><b>What Android versions are supported?</b></summary>
<p>
Android 14 (API 34), Android 15 (API 35), and Android 16/17 previews. The Morphe patch automatically backports the <code>minSdkVersion</code> requirement from 37 down to 34.
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
