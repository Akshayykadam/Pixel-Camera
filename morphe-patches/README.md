# 🧩 Morphe Patches for Pixel Camera (v1.0.9)

Official Morphe Patch definitions to unlock Google Pixel 11 **Camera Looks**, **Viewfinder Quick Access Controls**, **True 50MP Pro Capture**, and **Creator Suite** on older Pixel devices (Pixel 6 through Pixel 10).

---

## 🔗 Quick Links & Navigation

* **Master Guide**: [Root Project README](../README.md)
* **Pre-Patched Standalone APK**: [⬇️ Download Latest Patched APK v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download)
* **Morphe Patch Package**: [⬇️ Download Morphe Patch .mpp v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download) • [GitHub Raw](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp)
* **Smali Reference & Helper Classes**: [smali_patches/README.md](../smali_patches/README.md)
* **Unified Smali Diffs**: [patches/README.md](../patches/README.md)
* **Automated Python Builder**: [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py)
* **Camera Looks Research**: [pixel-camera-looks-research/README.md](../pixel-camera-looks-research/README.md)
* **Quick Access Controls Research**: [camera-looks-quick-access/README.md](../camera-looks-quick-access/README.md)
* **Creator Suite Research**: [creator-suite-research/README.md](../creator-suite-research/README.md)
* **Release Metadata**: [`patches-bundle.json`](../patches-bundle.json) • [`patches-list.json`](../patches-list.json)

---

## 🎯 What is Morphe?

[Morphe](https://morphe.software) is an open-source Android app modification framework. Instead of downloading multi-gigabyte pre-compiled APKs from third parties, Morphe allows users to patch clean, official APKs **directly on their Android device or PC** using lightweight patch bundles (`.mpp`).

### Key Benefits:
- 🚀 **Tiny Download**: The patch package is only a few kilobytes (no 1.5 GB downloads).
- 🔒 **Zero Malware / Tampering Risk**: You download the official base APK directly from APKMirror and patch it on your own device.
- ⚖️ **100% Legal & Open Source**: Distributes only bytecode recipes, no proprietary Google binaries.

---

## 📦 Available Patches in this Package

| Patch Name | Type | Implementation | Description |
| :--- | :---: | :--- | :--- |
| **Camera Looks Backport** | `BytecodePatch` | [`CameraLooksPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt) | Unlocks 13 hardware-gated Camera Looks (Sauce/Tomte) across Tensor G1–G5 and fixes photo saving. |
| **Viewfinder Quick Access** | `BytecodePatch` | [`QuickAccessPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt) | Enables customizable Left/Right viewfinder quick-access slots, interactive Dual/Single EV sliders, and mode-aware sync. |
| **10x Viewfinder Quick Zoom** | `BytecodePatch` | [`TelephotoPortraitAndZoomPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/portrait/TelephotoPortraitAndZoomPatch.kt) | Exposes discrete 10x quick zoom button on viewfinder in Photo mode for telephoto Pixels. |
| **Permanent Portrait Mode Fix** | `BytecodePatch` | [`PortraitModeFixPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/portrait/PortraitModeFixPatch.kt) | Resolves front camera blur and EdgeTPU permission crashes via pure-TFLite monocular depth pipeline. |
| **Pixel 10 Photo Saving Fix** | `BytecodePatch` | [`PhotoSavingFixPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/photosaving/PhotoSavingFixPatch.kt) | Populates binned RAW dimension mappings and disables failing Eclipse AE, allowing 12MP photos to save properly. |
| **Creator Suite** | `BytecodePatch` | [`CreatorSuitePatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/creator/CreatorSuitePatch.kt) | Unlocks Teleprompter HUD (Biotite), Audio VU Meter (Mica), and Framing Guides (Slate). |
| **Pro Manual Controls** | `BytecodePatch` | [`ProControlsPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/pro/ProControlsPatch.kt) | Precision manual focus slider, GPU focus peaking, manual shutter speed, and ISO controls. |
| **True 50MP Pro Capture** | `BytecodePatch` | [`TomteInitHelper.smali`](../smali_patches/TomteInitHelper.smali) | Restores unbinned 50.13 MP capture on Pro Pixels while gating 12MP on non-Pro models via `isProDevice()`. |
| **Pro Settings & Sharpness Tuning** | `BytecodePatch` | [`TomteProSettingsPanel.smali`](../smali_patches/TomteProSettingsPanel.smali) | Bottom sheet Material You panel with 16-bit DNG, custom sharpness (Standard/Natural/Soft), and Looks selector. |
| **AV1 Video Hardware Encoding** | `BytecodePatch` | [`Av1VideoEncodingPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/video/Av1VideoEncodingPatch.kt) | Unlocks 3-way video format selection (AVC, HEVC, AV1) on Tensor G3 & G4 with graceful HEVC 10-bit HDR fallback. |
| **Max Display Brightness** | `BytecodePatch` | [`MaxBrightnessPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/brightness/MaxBrightnessPatch.kt) | Enforces 100% display backlight exclusively on viewfinder activities with an in-app toggle in Settings. |
| **Pro Image Quality & Denoise Tuning** | `BytecodePatch` | [`ProImageQualityPatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/quality/ProImageQualityPatch.kt) | Adds in-app Settings menus for JPEG Quality (100% Ultra, 98% High, 95% Stock) and Spatial Noise Reduction (Stock, Minimal, Off). |
| **Pixel Camera Clone** | `RawResourcePatch` | [`PixelCameraClonePatch.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/clone/PixelCameraClonePatch.kt) | Renames package to `com.google.android.GoogleCamera.morphe` for side-by-side install without root. |
| **Patch Utilities & Helpers** | `Utility` | [`PixelCameraPatchUtils.kt`](patches/src/main/kotlin/app/morphe/patches/pixelcamera/PixelCameraPatchUtils.kt) | Shared instruction manipulators, register allocators, and bytecode AST helpers. |

---

## 📚 Technical Documentation & Guides

* **[Developer Guide: How to Create Morphe Patches from Scratch](../docs/HOW_TO_CREATE_MORPHE_PATCHES.md)**: Step-by-step guide on patch architecture, SMALI hooking, and packaging.
* **[Pixel Camera Patches Architecture & Root Cause Analysis](../docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md)**: Comprehensive deep dive on Dual-EV, HAL negotiation, and sensor calibration.
* **[Comprehensive Root Cause Analysis & Audit](../CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)**: Complete chronological changelog of technical fixes and decompilation traces.
* **[Unified Smali Patches Catalog](../patches/README.md)**: Standard unified `.patch` diffs for decompiled APK trees.
* **[Smali Reference Classes](../smali_patches/README.md)**: Decompiled reference smali classes and injected runtime helpers.

---

## ⚠️ Technical Limitations & Non-Root Architectural Constraints

Because Morphe patches run in an unprivileged `untrusted_app` SELinux context on non-rooted devices:

1. **Motion Blur (Action Pan & Long Exposure) Disabled**:
   - **Reason**: Motion estimation neural networks require Google EdgeTPU hardware access (`/dev/gxp`), which the Linux kernel restricts to system-signed OEM packages. Non-root apps lack DAC and SELinux permissions to open `/dev/gxp`. Since the custom operators (`edgetpu-custom-op-2`) have no CPU/GPU fallback, the mode has been cleanly hidden via `camera.lasagna` flags to ensure captures in Photo, Portrait, Night Sight, and Video never stall.
2. **Looks Applied Post-Capture**:
   - **Reason**: Live 60 fps viewfinder tone-mapping on Pixel 11 relies on a proprietary vendor Camera HAL hardware tag (`REQUEST_TOMTE_TYPE`). On Tensor G1–G5, the patch utilizes Google's native Halide C++ pipeline (`tomte_tonemap.cc`) during HDR+ processing, guaranteeing full-resolution quality with zero viewfinder lag.
3. **Creator Suite "Save to Project" Disabled**:
   - **Reason**: Cross-process gRPC calls to Google Photos require matching OEM platform signatures. The option is neutralized to prevent authorization errors.
4. **Physical Periscope Lens Required for 10x Quick Zoom**:
   - **Reason**: 10x Quick Zoom utilizes Google's Super Res Zoom and telephoto fusion. Base/non-Pro devices without a physical periscope sensor use standard zoom ranges.

---

## 📱 How to Use (For End Users)

> [!TIP]
> **Prefer a pre-patched 1-tap install?**
> **[⬇️ Download Latest Patched APK (SourceForge Direct)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download)** • **[All Files](https://sourceforge.net/projects/pixel-camera-patches/files/)**.

### Option 1: On Your Android Phone (Morphe Manager — Recommended)

1. **Install Morphe Manager**: Download the latest release from [morphe.software](https://morphe.software) or GitHub.
2. **Add Patch Source**:
   * **1-Click**: Tap [Add to Morphe Manager](https://morphe.software/add-source?github=Akshayykadam/Pixel-Camera) on your phone.
   * **Or Manually**: Open Morphe Manager → **Settings** → **Sources** → Add custom source: `Akshayykadam/Pixel-Camera` (or import the [morphe-patches-pixelcamera-1.0.9.mpp](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp) file directly from GitHub or [SourceForge](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download)).
3. **Get the Base Camera APK**:
   * Download `Pixel Camera 11.1.040.982810059.19` (`.apkm` bundle) from APKMirror.
4. **Patch & Install**:
   * In Morphe Manager, select the downloaded APKM file.
   * Select your desired patches (e.g. **Camera Looks Backport**, **10x Viewfinder Quick Zoom**, and **Pixel Camera Clone**).
   * **Universal Options Guide**:
     * ✅ **Clone app**: **Keep Checked** (required to install alongside stock camera on non-rooted devices).
     * ⚡ **Change installer source**: **Checked (Recommended)** (prevents Play Protect warnings).
     * ❌ **Disable Play Store updates**: **Uncheck** (not needed for cloned apps).
     * ❌ **Override certificate pinning**: **Uncheck** (not needed).
   * Tap **Proceed to patching**. Once compiled on-device, tap **Install**.

---

### Option 2: On Your PC / Mac (Morphe Desktop / CLI)

1. Download **Morphe Desktop** from [morphe.software](https://morphe.software).
2. Download the latest [morphe-patches-pixelcamera-1.0.9.mpp](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp) directly from GitHub or [SourceForge](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download).
3. Drop the `Pixel Camera 11.1.040` APKM into Morphe Desktop.
4. Select the patches and click **Start Patching**.
5. Transfer the generated `PixelCamera_signed.apk` to your phone or install via ADB:
   ```bash
   adb install -r PixelCamera_signed.apk
   ```

---

## 🔧 Troubleshooting & Known Tips

### 1. `ZipException: invalid stored block lengths` during Patching (Issue #21)
* **Cause**: This error occurs when the downloaded `.apkm` file is corrupt, truncated during mobile browser download, or has malformed compression headers for stored split entries.
* **Solution**:
  1. Re-download clean `Pixel Camera 11.1.040.982810059.19` (or `11.0.073.972752740.32`) APKM using a PC browser or dedicated download manager.
  2. Verify that the file size matches the APKMirror listing (~650 MB to 1.1 GB depending on split bundle).
  3. Alternatively, rename the file to `.zip`, extract `base.apk` using ZArchiver or 7-Zip, and feed `base.apk` directly to Morphe Manager.

### 2. Viewfinder Live Looks Preview vs Capture Processing (Issue #28 Part 2)
* Live 60 fps viewfinder Looks preview requires Google's proprietary Camera HAL vendor tag `REQUEST_TOMTE_TYPE` (Pixel 11 hardware ISP).
* On Pixel 6 through Pixel 10 (Tensor G1–G5), the viewfinder renders the standard preview stream, and full 3D LUT + Halide look styling is rendered seamlessly during HDR+ post-capture processing (`tomte_tonemap.cc`).

---

## 🛠️ How to Build the `.mpp` Package (For Developers)

### Prerequisites:
* Java JDK 17+
* GitHub Personal Access Token (PAT) with `read:packages` permission (for GitHub Packages registry)

### Build Commands:
```bash
cd morphe-patches

# Set your GitHub credentials
export GITHUB_ACTOR="your-username"
export GITHUB_TOKEN="your-github-pat"

# Build the Morphe Patch Package (.mpp)
./gradlew buildAndroid
```

The output patch package will be generated at:
```text
morphe-patches/patches/build/libs/patches-1.0.9.mpp
```

---

## ⚠️ Legal Disclaimer

* **No Proprietary Binaries**: This module provides bytecode patch source code only. It does not contain, distribute, or bundle proprietary Google binaries, APKs, or models.
* **Fair Use & Interoperability**: Conducted for non-commercial educational and software interoperability purposes (17 U.S.C. § 107).
* **Trademarks**: Pixel, Google Camera, Android, and Tensor are trademarks of Google LLC. This project is not affiliated with or endorsed by Google LLC.
* **As-Is Warranty**: Provided without warranties of any kind. Users assume full responsibility for modifying applications on their own devices.
