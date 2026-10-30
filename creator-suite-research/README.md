# Pixel Camera Creator Suite Unlock: Reverse Engineering & Patch

This repository contains the complete reverse engineering analysis, hardware compatibility investigation, and minimal reversible patches to unlock the **Pixel Camera Creator Suite** on older Google Pixel smartphones (Pixel 6 through Pixel 10 Pro XL).

Reference Implementation: **Pixel Camera `11.1.040.982810059.19` & `11.0.073.972752740.32`**

---

## 🔗 Quick Links & Navigation

* **Master Guide**: [Root Project README](../README.md)
* **Pre-Patched Standalone APK**: [⬇️ Download Latest Patched APK v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download)
* **Morphe Patch Package**: [⬇️ Download Morphe Patch .mpp v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download) • [GitHub Raw](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp)
* **Creator Suite Patch Implementation**: [`CreatorSuitePatch.kt`](../morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/creator/CreatorSuitePatch.kt)
* **Unified Smali Patches**: [`patches/kid_creator_suite.patch`](../patches/kid_creator_suite.patch) • [`patches/kqc_project_album.patch`](../patches/kqc_project_album.patch)
* **Decompiled Smali Reference**: [`smali_patches/kid.smali`](../smali_patches/kid.smali) • [`smali_patches/kqc.smali`](../smali_patches/kqc.smali)
* **Technical Architecture**: [docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md](../docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md)
* **Root Cause & Fixes Audit**: [CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md](../CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)

---

## 📸 What is Pixel Camera Creator Suite?

The **Creator Suite** is Google's advanced video creation toolkit integrated into the Pixel Camera Options drawer (`OptionsMenuView`). It introduces dedicated tools tailored for content creators, vloggers, and mobile journalists:

1. **Creator Drawer Tab (`granite`)**: A dedicated drawer tab situated alongside "General" video options.
2. **Teleprompter (`biotite`)**: A floating viewfinder script presenter featuring real-time auto-scrolling, customizable WPM speed, text size adjustments, and a Jetpack Compose script editor.
3. **Live Audio Visualizer (`mica`)**: A dynamic stereo/mono VU meter overlay that displays microphone input levels directly on the camera preview.
4. **Social Media Framing Guides (`slate` / `basalt`)**: Viewfinder overlays for 9:16 vertical, 1:1 square, and 4:5 social media aspect ratios.
5. **Project Album Tool ("Save to a project", `pa_` / `pam_`)**: A video project management connector to Google Photos. *(Note: Commercial Google Photos builds do not yet implement the required gRPC backend service `VideoShareabilityPhotosServer`; our patch cleanly hides this button to eliminate crashes while keeping all other Creator Suite tools 100% functional).*

---

## 🎯 Key Findings & Compatibility

* **Gating Classification**: **100% Software-Gated**. There are no camera sensor, ISP, EdgeTPU, or hardware dependencies.
* **Asset Location**: Monolithic within `base.apk`. No split modules or missing native binaries are needed.
* **Hardware Compatibility**: Fully compatible with **Pixel 6, Pixel 6 Pro, Pixel 7, Pixel 7 Pro, Pixel 8, Pixel 8 Pro, Pixel 9, Pixel 9 Pro, Pixel 9 Pro XL, Pixel 10, Pixel 10 Pro, and Pixel 10 Pro XL**.
* **Physical Device Validation**: Tested and verified end-to-end on a physical **Google Pixel 8 Pro (`husky`)** running Android 14, 15, and 16/17 previews.

For in-depth technical analysis and device tables, see:
* 📄 [RESEARCH.md](RESEARCH.md) — Exhaustive reverse engineering report across all 9 phases.
* 📋 [COMPATIBILITY.md](COMPATIBILITY.md) — Detailed device-by-device compatibility matrix.

---

## 🛠️ Official Morphe Patch Implementation

The bytecode hooks for unlocking the Creator Suite (Teleprompter HUD, VU Meter, Aspect Guides, and Drawer Tab) are packaged in:

* **Patch Source**: [`CreatorSuitePatch.kt`](../morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/creator/CreatorSuitePatch.kt)
* **Unified Smali Patch**: [`patches/kid_creator_suite.patch`](../patches/kid_creator_suite.patch)
* **Project Album Crash Guard**: [`patches/kqc_project_album.patch`](../patches/kqc_project_album.patch)
* **Installation**: Apply on-device via Morphe Manager (Android) or Morphe Desktop (PC) following the [master installation guide](../README.md#-installation-guide).

For complete Dalvik bytecode analysis and method call traces, see [RESEARCH.md](RESEARCH.md).
