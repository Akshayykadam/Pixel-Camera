# Pixel Camera Smali Unified Patches (v1.0.9)

This directory contains standalone standard Unified Diffs (`.patch` / `.diff`) capturing all modifications made to Google Pixel Camera (`11.1.040.982810059.19` and `11.0.073.972752740.32`).

These patches allow exact git-style tracking and reproducible application onto clean decompiled APK directories using standard Unix utilities (`patch` or `git apply`).

---

## 🔗 Quick Links & Navigation

* **Master Guide**: [Root Project README](../README.md)
* **Pre-Patched Standalone APK**: [⬇️ Download Latest Patched APK v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.0.9.apk/download)
* **Morphe Patch Package**: [⬇️ Download Morphe Patch .mpp v1.0.9 (SourceForge)](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.0.9.mpp/download) • [GitHub Raw](https://github.com/Akshayykadam/Pixel-Camera/raw/main/morphe-patches-pixelcamera-1.0.9.mpp)
* **Morphe Source & Kotlin Patches**: [morphe-patches/README.md](../morphe-patches/README.md)
* **Smali Reference & Helper Classes**: [smali_patches/README.md](../smali_patches/README.md)
* **Automated Python Builder**: [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py)
* **Architecture & Root Cause Analysis**: [docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md](../docs/PIXEL_CAMERA_PATCHES_DOCUMENTATION.md)
* **Developer Guide**: [docs/HOW_TO_CREATE_MORPHE_PATCHES.md](../docs/HOW_TO_CREATE_MORPHE_PATCHES.md)
* **Changelog & Technical Audit**: [CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md](../CAMERA_ROOT_CAUSE_FIXES_AND_AUDIT.md)

---

## 📦 Complete Patch Catalog

| Patch File | Affected Target Classes | Description & Functionality |
| :--- | :--- | :--- |
| [`all_smali_changes.patch`](all_smali_changes.patch) | All Modified Smali Classes | Single cumulative patch applying all smali modifications in one command. |
| [`zoom_10x_buttons.patch`](zoom_10x_buttons.patch) | `kgy`, `kgx`, `khk`, `kgs`, `kfl`, `kfw`, `hpq` | Discrete 10x Quick Zoom button on viewfinder zoom strip across Pixel 8 Pro, 9 Pro, 10 Pro, 9 Pro Fold, and dynamic hook in Photo & Night Sight modes. |
| [`guh_focal_length_cycling.patch`](guh_focal_length_cycling.patch) | `smali/guh.smali` | 1x Main Camera Focal Length Cycling: tapping the 1x button repeatedly cycles through 1.0x (24mm) $\rightarrow$ 1.2x (28mm) $\rightarrow$ 1.5x (35mm) $\rightarrow$ 1.0x. |
| [`looks_pipeline.patch`](looks_pipeline.patch) | `ioy`, `mla`, `sdo`, `CameraApp` | Looks processing pipeline hooks: Catshark bypass in `ioy`, effective Look ID application in `mla`, Look persistence across mode changes in `sdo`, and `TomteInitHelper` initialization in `CameraApp`. |
| [`looks_native_engine.patch`](looks_native_engine.patch) | `mia`, `muh`, `mjy`, `mwg`, `kic`, `aaog`, `LasagnaModelLoader`, `pzs`, `qau` | Native Tomte engine initialization, CPU inference fallback in `mwg`, TPU model crash guards, and Sauce overlay forced installation. |
| [`qkj_exif_fallback.patch`](qkj_exif_fallback.patch) | `smali/qkj.smali` | Direct EXIF fallback to `TomteInitHelper.getLastSelectedLook()` when the active Look object is null during image packaging. |
| [`qmy_look_callback.patch`](qmy_look_callback.patch) | `smali_classes2/qmy.smali` | Dispatches `TomteInitHelper.onLookObjectSelected(qlh)` callback whenever a user selects or scrolls to a Look preset. |
| [`qau_predicate.patch`](qau_predicate.patch) | `smali/qau.smali` | Overrides Sauce eligibility predicate (`qau.b`) to unconditionally return `true`. |
| [`uyv_eligibility.patch`](uyv_eligibility.patch) | `smali/uyv.smali` | Device Eligibility: forces `l()Z` and related checks to return `true` to enable Camera Looks across older Pixels (Pixel 6 through 10). |
| [`qkp_look_manager.patch`](qkp_look_manager.patch) | `smali/qkp.smali` | Real Look Manager provider: returns real `qms` manager unconditionally. |
| [`qkq_look_provider.patch`](qkq_look_provider.patch) | `smali/qkq.smali` | Real Look State provider: returns real `qmb` provider unconditionally. |
| [`sauce_onboarding.patch`](sauce_onboarding.patch) | `isu`, `qlr`, `rmn` | Bypasses onboarding and tutorial dialogs for Camera Looks. |
| [`stream_crash_guards.patch`](stream_crash_guards.patch) | `psk`, `psh`, `num`, `tba` | Stream crash guards: telephoto, binned RAW, and Centaur/Boba Jelly stream configurations. |
| [`nrd_brightness.patch`](nrd_brightness.patch) | `smali/nrd.smali` | Brightness controller: extends `qhr`, implements `rst:Lsmq`, `h()`, reset method `e()`, and unified Dual-EV hardware calculation in `s()`. |
| [`nrm_shadows.patch`](nrm_shadows.patch) | `smali/nrm.smali` | Shadows controller: extends `qhr`, implements `rst:Lsmq`, `h()`, reset method `e()`, and unified Dual-EV hardware calculation in `s()`. |
| [`nrc_dispatcher.patch`](nrc_dispatcher.patch) | `smali_classes2/nrc.smali` | Pro bottom sheet event listener: delegates `:pswitch_8` and `:pswitch_3` directly to `nrd` and `nrm`. |
| [`pfh_ae_compensation.patch`](pfh_ae_compensation.patch) | `smali_classes2/pfh.smali` | Camera2 direct AE dispatch: bypasses `ppn.i()` abort in `:pswitch_8` so exposure index changes are dispatched via `uoi.r()`. |
| [`klm_feature_flags.patch`](klm_feature_flags.patch) | `smali_classes2/klm.smali` | Feature flag interceptor: enables `camera.ark` (Pro controls: Focus, Shutter, ISO, Peaking) while disabling `camera.ark_lens_selector`. Also overrides Mantis, Gouda max zoom, and Creator flags. |
| [`pro_controls_live.patch`](pro_controls_live.patch) | `qaa`, `qbb`, `nrn` | Live Viewfinder response: removes dragging suppression for ISO (`qaa`), Shutter Speed (`qbb`), and Manual Focus (`nrn`). |
| [`qaa_iso.patch`](qaa_iso.patch) | `smali/qaa.smali` | Live ISO: removes dragging suppression in `v(IZLsnw;)V`. |
| [`qbb_shutter.patch`](qbb_shutter.patch) | `smali/qbb.smali` | Live Shutter Speed: removes dragging suppression in `v(JZLsnw;)V`. |
| [`nrn_focus.patch`](nrn_focus.patch) | `smali/nrn.smali` | Live Manual Focus: removes dragging suppression in `t(FZLsnw;)V`. |
| [`mzc_controllers.patch`](mzc_controllers.patch) | `smali/mzc.smali` | UI Binding: binds exposure control enum keys (`nqq.h`, `nqq.b`, `nqq.j`, `nqq.i`) to `nrd` and `nrm`. |
| [`qhm_quick_access.patch`](qhm_quick_access.patch) | `smali_classes2/qhm.smali`, `nqj`, `nqp` | Quick Access: initializes shortcut items with `[nqq.h, nqq.b]` and bypasses capability verification (`nqj.G`, `nqj.I`, `nqp.a`). |
| [`kid_creator_suite.patch`](kid_creator_suite.patch) | `smali/kid.smali` | Creator Suite: unlocks Teleprompter (`biotite`), Audio VU Meter (`mica`), and Framing Guides (`slate`/`basalt`). |
| [`kqc_project_album.patch`](kqc_project_album.patch) | `smali/kqc.smali` | Project Album: neutralizes 'Save to a project' button to prevent signature verification crashes with Google Photos. |
| [`ppn_field_access.patch`](ppn_field_access.patch) | `smali/ppn.smali` | Changes field access of `f:Losw` and `u:AtomicBoolean` to public. |
| [`clone_authority.patch`](clone_authority.patch) | `smali/klh.smali` | Synchronizes `SpecialTypesProvider` authority for clone package `com.google.android.GoogleCameraEng`. |
| [`display_max_brightness.patch`](display_max_brightness.patch) | `smali/tcc.smali` | Max Display Brightness: enforces 100% display backlight exclusively on active viewfinder sessions with ambient sensor dimming immunity. |
| [`image_quality_preferences.patch`](image_quality_preferences.patch) | `smali/pbe.smali`, `JpgEncodeOptions.smali` | In-App JPEG Quality & Spatial Noise Reduction Settings: routes Camera2 requests and Gcam encoder to `TomteInitHelper.getJpegQuality()` and `getNoiseReductionMode()`. |
| [`video_exposure_control.patch`](video_exposure_control.patch) | `smali/lts.smali`, `smali_classes2/poo.smali` | Video Mode Exposure Control Fix: bypasses `pzj.i()` aborts so single-slider AE compensation changes dispatch directly to Camera2 HAL. |
| [`tomte_init_helper.patch`](tomte_init_helper.patch) | `smali_patches/TomteInitHelper.smali` | Helper routines: preference interception, Look state management, `isProDevice()` 50MP gating, and sharpness filtering. |

---

## 🛠️ How to Apply

### Method 1: Apply All Smali Patches at Once

To apply all unified diffs to a clean decompiled `apktool` directory:

```bash
# 1. Decompile clean base APK with apktool
apktool d base.apk -o apktool_out

# 2. Apply all unified diffs in one command
cd apktool_out
patch -p1 < /path/to/Patch-Pixel-Camera/patches/all_smali_changes.patch
```

### Method 2: Apply Targeted Patches Individually

You can apply specific modular patches depending on the features you want to unlock:

```bash
cd apktool_out

# Example: Apply only 10x Quick Zoom button
patch -p1 < /path/to/Patch-Pixel-Camera/patches/zoom_10x_buttons.patch

# Example: Apply only Focal Length cycling
patch -p1 < /path/to/Patch-Pixel-Camera/patches/guh_focal_length_cycling.patch

# Example: Apply Creator Suite
patch -p1 < /path/to/Patch-Pixel-Camera/patches/kid_creator_suite.patch
patch -p1 < /path/to/Patch-Pixel-Camera/patches/kqc_project_album.patch

# Example: Apply Pro Manual Controls
patch -p1 < /path/to/Patch-Pixel-Camera/patches/klm_feature_flags.patch
patch -p1 < /path/to/Patch-Pixel-Camera/patches/pro_controls_live.patch
```

### Method 3: Automated One-Click Python Pipeline

Use our master build script [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py) which handles decompilation, smali patching, resource modification, DEX injection, re-assembly, zipalign, and signing automatically:

```bash
python3 build_and_patch_pixelcamera.py
```
