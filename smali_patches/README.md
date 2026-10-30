# Pixel Camera Smali Patches Directory (v1.0.9)

This directory contains standalone, decompiled Smali bytecode reference implementations and injected helper classes for all functional modifications made in the Pixel Camera backport for Google Pixel devices (Pixel 6 through Pixel 10).

---

## 🔗 Quick Links & Navigation

* **Master Guide**: [Root Project README](../README.md)
* **Pre-Patched Standalone APK**: [⬇️ Download Latest Patched APK v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download)
* **Morphe Patch Package**: [⬇️ Download Morphe Patch .mpp v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download) • [GitHub Raw](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp)
* **Morphe Kotlin Source**: [morphe-patches/README.md](../morphe-patches/README.md)
* **Unified Smali Diffs**: [patches/README.md](../patches/README.md)
* **Automated Python Builder**: [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py)
* **Architecture & Root Cause Analysis**: [docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md](../docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md)
* **Developer Guide**: [docs/HOW_TO_CREATE_MORPHE_PATCHES.md](../docs/HOW_TO_CREATE_MORPHE_PATCHES.md)
* **Changelog & Technical Audit**: [CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md](../CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)

---

## 📋 Patch Index & Module Architecture

| Category | Smali Files | Purpose & Modifications |
| :--- | :--- | :--- |
| **Unified Pro Settings Sheet & Dynamic Theming** | [`TomteProSettingsPanel.smali`](TomteProSettingsPanel.smali)<br>• [`$1.smali`](TomteProSettingsPanel$1.smali)<br>• [`$2.smali`](TomteProSettingsPanel$2.smali)<br>• [`$3.smali`](TomteProSettingsPanel$3.smali)<br>• [`$4.smali`](TomteProSettingsPanel$4.smali) / [`$4$1.smali`](TomteProSettingsPanel$4$1.smali)<br>• [`$5.smali`](TomteProSettingsPanel$5.smali) / [`$5$1.smali`](TomteProSettingsPanel$5$1.smali)<br>• [`$6.smali`](TomteProSettingsPanel$6.smali)<br>• [`$DynamicPalette.smali`](TomteProSettingsPanel$DynamicPalette.smali) | Injects Google Camera's native bottom drawer with full Material You Monet wallpaper theming. Controls 13 Camera Looks, uncompressed 16-bit DNG capture, custom edge sharpness/de-ringing (Standard, Natural, Soft), and JPEG compression quality adhering to stock `56dp` row heights and `38dp` capsule pills. |
| **Injected Neural & Runtime Helpers** | [`TomteInitHelper.smali`](TomteInitHelper.smali)<br>[`LasagnaModelLoader.smali`](LasagnaModelLoader.smali)<br>[`TomtePreviewRenderer.smali`](TomtePreviewRenderer.smali) | Core patch helper: manages look state, active Look ID, `isProDevice()` hardware tier detection, sharpness factor filtering (`filterSharpness`), uncompressed DNG handling, gallery intent unblocking, and native Tomte grain initialization. |
| **Pro Device 50MP Gating & Resolution Handling** | Target: `rdb.smali`, `ons.smali`, `moo.smali`, `poy.smali`, `pji.smali`<br>Configured in: [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py) & [`TomteInitHelper.smali`](TomteInitHelper.smali) | Restores unbinned 50.13 MP capture (`8160 x 6144`, ~15–30 MB) on Pro Pixels in `rdb.C()`/`D()`. Dynamically hides 50MP on non-Pro models via `TomteInitHelper.isProDevice()` to enforce reliable 12MP captures with full RAW support. Injects Pro settings panel in `poy.M(I)`/`r(I)` and `pji`. |
| **10x Quick Zoom & Focal Length Cycling** | [`kgy.smali`](kgy.smali), [`kgx.smali`](kgx.smali), [`khk.smali`](khk.smali), [`kgs.smali`](kgs.smali), [`kfl.smali`](kfl.smali), [`kfw.smali`](kfw.smali), [`kha.smali`](kha.smali), [`guh.smali`](guh.smali), [`hpq.smali`](hpq.smali) | Dedicated 10x quick zoom presets for Pixel 8 Pro, 9 Pro, 10 Pro, 9 Pro Fold; dynamic button generation in `kfl`; mode row toggle in `kfw`/`kha`; dynamic 1x focal length cycling (1.0x $\rightarrow$ 1.2x $\rightarrow$ 1.5x) in `guh.smali`; zoom ceiling override in `hpq`. |
| **Camera Looks Pipeline & EXIF** | [`qmy.smali`](qmy.smali), [`qkj.smali`](qkj.smali), [`ioy.smali`](ioy.smali), [`mla.smali`](mla.smali), [`sdo.smali`](sdo.smali), [`CameraApp.smali`](CameraApp.smali) | Sauce EXIF metadata fallback via `TomteInitHelper.getLastSelectedLook()`; `onLookObjectSelected` callbacks; catshark bypass in `ioy` for all photo modes; mode change retention in `sdo`. |
| **Camera Looks Native Engine & Guards** | [`mia.smali`](mia.smali), [`muh.smali`](muh.smali), [`mjy.smali`](mjy.smali), [`mwg.smali`](mwg.smali), [`kic.smali`](kic.smali), [`aaog.smali`](aaog.smali), [`pzs.smali`](pzs.smali), [`qau.smali`](qau.smali), [`uyv.smali`](uyv.smali), [`qkp.smali`](qkp.smali), [`qkq.smali`](qkq.smali) | Native Tomte model initialization; CPU inference enforcement in `mwg` to avoid OpenCL crashes; TPU crash nulling; overlay and eligibility bypasses. |
| **Exposure Pipeline & Gallery Return Stability** | Target: `qwh.smali`, `pzq.smali`, `oak.smali`<br>Configured in: [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py) | Fixes Dalvik verification conflict in `qwh.l`; prevents post-capture/gallery-return dark viewfinder by initializing `oak.e()` brightness reset to neutral `0.5f`; purges negative twilight bias in `pzq.c`. |
| **Stream Stability Guards** | [`psk.smali`](psk.smali), [`psh.smali`](psh.smali), [`num.smali`](num.smali), [`tba.smali`](tba.smali), [`mkm.smali`](mkm.smali), [`nij.smali`](nij.smali) | Guards telephoto streams, RAW binned stream depth, and Centaur/Boba Jelly. Makes flare removal in `mkm` safe to prevent `FinishShot` crashes. |
| **Sauce Onboarding & Tutorials** | [`isu.smali`](isu.smali), [`qlr.smali`](qlr.smali), [`rmn.smali`](rmn.smali) | Disables onboarding popups and tutorial overlays that interrupt Camera Looks usage. |
| **Pro Controls (Live Sliders & EV)** | [`nrd.smali`](nrd.smali), [`nrm.smali`](nrm.smali), [`nrc.smali`](nrc.smali), [`pfh.smali`](pfh.smali), [`ppn.smali`](ppn.smali), [`mzc.smali`](mzc.smali), [`qaa.smali`](qaa.smali), [`qbb.smali`](qbb.smali), [`nrn.smali`](nrn.smali), [`klm.smali`](klm.smali), [`nrh.smali`](nrh.smali), [`nre.smali`](nre.smali) | Full Dual-EV coordination in `nrd`/`nrm`; live dragging in `qaa` (ISO), `qbb` (Shutter), `nrn` (Focus); event listener delegation in `nrc`; Camera2 direct AE dispatch in `pfh`; flag interception in `klm`. |
| **Quick Access Shortcuts** | [`qhm.smali`](qhm.smali), [`nqj.smali`](nqj.smali), [`nqp.smali`](nqp.smali) | Initializes viewfinder shortcuts with `[nqq.h, nqq.b]` and bypasses capability verification. |
| **Portrait Mode & Monocular Depth** | [`pvz.smali`](pvz.smali), [`pwo.smali`](pwo.smali), [`pwp.smali`](pwp.smali) | Forces pure-TFLite monocular depth routing in Gouda pipeline to bypass EdgeTPU permission errors on non-root builds. |
| **Creator Suite** | [`kid.smali`](kid.smali), [`kqc.smali`](kqc.smali) | Unlocks Teleprompter HUD (Biotite), Audio VU Meter (Mica), Framing Guides (Slate); neutralizes 'Save to a project' crash. |
| **Non-Root Clone & Localization** | [`klh.smali`](klh.smali) | Updates `SpecialTypesProvider` authority to match cloned package name `com.google.android.GoogleCameraEng`. |

---

## 🧮 Dual-EV Coordination Algorithm ([`nrd.smali`](nrd.smali) & [`nrm.smali`](nrm.smali))

Both sliders query their partner's current value and compute a single unified hardware EV step:
$$b_{\text{offset}} = (\text{brightness} - 0.5) \times 24.0$$
$$s_{\text{offset}} = (\text{shadows} - 0.5) \times 12.0$$
$$\text{total\_ev} = \text{clamp}(\text{round}(b_{\text{offset}} + s_{\text{offset}}), -24, 24)$$

The resulting integer is dispatched directly to `CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION` (`osw.b`), which is fully supported by the Pixel 6/7/8/9/10 camera HAL without vendor key rejection.

---

## 🛠️ Build Integration

These smali files are automatically maintained, injected, and patched by the standalone build script [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py).
