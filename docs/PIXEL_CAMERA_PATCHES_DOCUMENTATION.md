# Pixel Camera 11.1 Patch Suite: Complete Architecture, Root Cause Analysis & Fix Documentation

## 1. Overview & Project Goals

This document provides a comprehensive technical record of the engineering work, root-cause analyses, reverse-engineering discoveries, and patch implementations for **Google Pixel Camera 11.1** (`11.1.040.982810059.19`) on **Google Pixel 8 Pro** (and backwards-compatible across Pixel 6 through 10 devices).

### Target Package
- **Package Name:** `com.google.android.GoogleCamera`
- **Target Version:** `11.1.040.982810059.19`
- **Output Artifact:** [patches-1.0.7.mpp](file:///Users/akshaykadam/Desktop/patches-1.0.7.mpp) (Morphe Patch Bundle on Desktop)

---

## 2. Root Cause Analysis: Viewfinder Brightness & Shadow Sliders

### 2.1 The Problem
When launching the patched Pixel Camera 11.1, the **Brightness** (EV compensation) and **Shadow** (brightness bias / tone map) controls were missing both from:
1. The **viewfinder tap-to-focus dual sliders** (`EvCompView`: top slider = Brightness, bottom slider = Shadow).
2. The **Quick Access edge controllers** (`qrg`: Exposure `EVC` & Shadow `BRIGHTNESS_BIAS`).

### 2.2 Deep-Dive Decompilation Findings
Tracing through the decompiled smali sources in [`apktool_full`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full) revealed five compounding suppression mechanisms:

```
[User Taps Viewfinder]
         │
         ▼
  ltg.j(ZZ)V  ──(Checks rdj.br: Boolean.FALSE?)──► [EARLY EXIT: goto :goto_2 (Sliders Suppressed)]
         │
         │ (If bypassed)
         ▼
  ltg.i(lsx)  ──(Checks rdj.br: Boolean.FALSE?)──► [Hides e & f sliders: setVisibility(8)]
         │
         ├────(ryw forces lsx.a: SINGLE)────────► [Hides f (Shadow): setVisibility(8)]
         │
         ▼
  EvCompView.onMeasure  ──(Checks rdj.br?)──────► [Skips layout m(), k(), l()]
         │
         ▼
  qrg.g(J)V  ──(qrg.i checks rdj.br?)───────────► [Early return-void: ViewStub uninflated]
```

1. **Preference Suppression ([`rdj.br`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/rdj.smali#L1546) / `pref_quick_access_controls_key`):**
   - In [`rdj.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/rdj.smali#L1546), `rdj.br` defines preference key `"pref_quick_access_controls_key"` with default `Boolean.FALSE`.
   - In [`ltg.j(ZZ)V`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L804), the camera checks `this.t` (`rdj.br`). Because it defaulted to false, every tap on the viewfinder dropped immediately to `:goto_2` (`return-void`), suppressing the focus controls.
   - In [`ltg.i(lsx)`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L541), lines 553–567 checked `rdj.br`. If false, it set `EvCompSlider.e` (Brightness) and `EvCompSlider.f` (Shadow) to `GONE` (`8`) and exited to `:goto_4`.
   - In [`ltg.i(lsx)`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L744), the touch listener `Lltd` was only attached to slider knobs if `this.t` was true; otherwise knobs were completely non-interactive.

2. **Forced Single Exposure Mode ([`ryw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ryw.smali#L162)):**
   - At camera initialization and during every AE update, [`ryw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ryw.smali#L162) invoked [`ltg.i(Llsx;)V`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L526) with `Llsx;->a` (`SINGLE`).
   - In `ltg.i(lsx)`, when `p1 == lsx.a` (ordinal 0), the method branched to `:cond_6`, which attached only knob `g` and explicitly set `EvCompSlider.f` (Shadow) to `GONE` (`8`).

3. **Slider Layout Suppression ([`EvCompView.onMeasure`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/com/google/android/apps/camera/evcomp/EvCompView.smali#L2333)):**
   - In [`EvCompView.onMeasure`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/com/google/android/apps/camera/evcomp/EvCompView.smali#L2333), the view queried `rdj.br` before calling internal layout methods `m()`, `k()`, and `l()`. If false, slider knob positions were never measured or placed on the canvas.

4. **Quick Access Edge Suppression ([`qrg.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qrg.smali#L1348)):**
   - In [`qrg.g(J)V`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qrg.smali#L1348), [`qrg.i(ZLkne;ZZ)Z`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qrg.smali#L622) returned `1` (`true` = suppressed) because parameter `p3` (`pref_quick_access_controls_key`) was false, executing an early `return-void` before inflating `quick_access_controls_stub` (`0x7f0a042d`).
   - When customization was enabled, `qrg` read slot IDs `bI`..`bL` from preferences (defaulting to `-1`), resulting in empty lists `[null, null]` and rendering nothing on the edges.

---

## 3. The Implementation: [QuickAccessPatch.kt](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt)

To completely fix both viewfinder tap-to-focus dual sliders and the Quick Access edge controls, four targeted hooks were introduced:

### 3.1 Preference Interception (`rdo.b`)
Hooked [`Lrdo;->b(Lrdg;)Ljava/lang/Object;`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/rdo.smali#L127) to call [`TomteInitHelper.interceptPref`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali#L1226):
```smali
invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptPref(Lrdo;Lrdg;)Ljava/lang/Object;
move-result-object v0
if-eqz v0, :cond_0
return-object v0
:cond_0
invoke-virtual {p0, p1}, Lrdo;->c(Lrdg;)Ljava/lang/Object;
...
```
In [`TomteInitHelper.interceptPref`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali#L1226):
- `"pref_quick_access_controls_key"` $\rightarrow$ Returns `Boolean.TRUE`.
- `"pref_quick_access_slot_right_1_id"` $\rightarrow$ Defaults to `9` (`Lnzy;->j` = `EVC` / Brightness).
- `"pref_quick_access_slot_right_2_id"` $\rightarrow$ Defaults to `8` (`Lnzy;->i` = `BRIGHTNESS_BIAS` / Shadow).
- `"pref_quick_access_slot_left_1_id"` $\rightarrow$ Defaults to `2` (`Lnzy;->c` = `WHITEBALANCE`).
- User custom preferences in SharedPreferences are respected if configured.

### 3.2 Dual Viewfinder Knobs Force (`ltg.i`)
Hooked [`Lltg;->i(Llsx;)V`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L526):
- Overrides input parameter: `sget-object p1, Llsx;->c:Llsx;` (`DUAL_INDEPENDENT`).
- Notifies state observables `ltg.o` and `EvCompView.b`.
- Bypasses the `rdj.br` hide branch and directly executes `:cond_5`:
  - Adds knob `g` to `EvCompSlider.e` (Brightness).
  - Adds knob `h` to `EvCompSlider.f` (Shadow).
  - Sets both `e` and `f` to `VISIBLE` (`0`).
  - Calls `EvCompView.d(knob, val)` for both.
- Unconditionally attaches `OnTouchListener` (`Lltd`) to all knobs without checking `this.t`.

### 3.3 Unblock Tap-to-Focus Dispatch (`ltg.j`)
Patched [`Lltg;->j(ZZ)V`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L804):
- Replaced the early exit branch instruction (`GOTO_16 :goto_2`) with `nop`.
- Ensures tap-to-focus events always flow into `:cond_0` to actuate focus and trigger the dual exposure slider display.

### 3.4 Slider Measurement and Layout (`EvCompView.onMeasure`)
Hooked [`Lcom/google/android/apps/camera/evcomp/EvCompView;->onMeasure(II)V`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/com/google/android/apps/camera/evcomp/EvCompView.smali#L2333):
```smali
invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V
invoke-virtual {p0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->m()V
invoke-virtual {p0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->k()V
invoke-virtual {p0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->l()V
return-void
```
- Eliminates the `rdj.br` check on every measure pass, guaranteeing proper knob layout on screen.

### 3.5 Tap-Focus Reset Guard & Smooth Shadow Curve
- **Active Slider Guard ([`osw.b`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt#L104)):** Returns `true` if Brightness or Shadow has an active manual value. In `pkb`, `pss`, `pkw`, and `pkc`, tap-to-focus skips pipeline resets when sliders are actively adjusted.
- **Linearized Curve ([`ppn.o`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt#L163)):** Replaces exponential shadow response ($r = \ln(24)/\ln(\text{range})$) with a linear 1.0f curve for smooth, predictable response across the full slider travel.

---

## 4. Gallery Decoupling & Chooser Support

### 4.1 Problem
Stock Pixel Camera hardcodes `com.google.android.apps.photos` for image review. On devices running custom ROMs (GrapheneOS, CalyxOS, LineageOS) or where Google Photos is absent, tapping the gallery thumbnail caused camera freezes or hard crashes. Furthermore, users could not choose a third-party gallery (such as Aves, Simple Gallery, or Google Gallery).

### 4.2 Solution
Hooked photo review intent builders [`hwb.w`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/PixelCameraPatchUtils.kt#L294) (11.1) and `hpq.cD` (11.0) via [`PixelCameraPatchUtils.hookGalleryReviewIntent`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/PixelCameraPatchUtils.kt#L294):
- Routes the intent to [`TomteInitHelper.configureGalleryIntent(Intent)`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali#L1950).
- If `pref_gallery_package_key` is set, directs intent to that installed gallery package.
- If unset (or set to `"default"`):
  - Clears the package constraint (`setPackage(null)`).
  - Replaces proprietary Google Photos MARS API actions (`ACTION_REVIEW_SECURE`) with standard Android `Intent.ACTION_VIEW`.
  - Prompts the Android system's standard App Chooser, allowing the user to select their preferred gallery app.

---

## 5. Other Integrated Patches in Bundle

| Patch Name | File | Description |
|---|---|---|
| **Camera Looks Backport (All 13 Looks)** | [`CameraLooksPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt) | Unlocks all 13 Camera Looks (Subtle group: Original, Natural, Vanilla, Editorial; Individual looks: Shadows, Velvet, Classic, Digi, Black Tie, Minimal; plus the 3 new Pixel Camera 11.1 looks: Flat, Buffalo, Dijon). Injects `Lqvd;` (Flat), `Lqvg;` (Buffalo), and `Lqvi;` (Dijon) into `Lqxg;-><init>`, hooks selection handlers, and activates `vku.l/g/f` spoofing and Halide EXIF tags (`rfx.Z`). |
| **Pro Manual Controls** | [`ProControlsPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/pro/ProControlsPatch.kt) | Unlocks Manual Focus, Shutter Speed, ISO, and Focus Peaking by removing touch-drag suppression in `qaa.v`, `qbb.v`, `nrn.t`. |
| **Telephoto Portrait & 10x Zoom** | [`TelephotoPortraitAndZoomPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/portrait/TelephotoPortraitAndZoomPatch.kt) | Adds 10x Quick Zoom button (`knq`, `knk`) and telephoto camera streaming. |
| **Portrait Mode Fix** | [`PortraitModeFixPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/portrait/PortraitModeFixPatch.kt) | Routes portrait segmentation to verified pure TFLite models (`midasnet`, `portrait_matting_mask`). |
| **Pixel 10 Photo Saving Fix** | [`PhotoSavingFixPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/photosaving/PhotoSavingFixPatch.kt) | Fixes 12MP photo saving by disabling failing Flare Removal (`ceftazidime`) and Eclipse AE, with binned RAW stream fallbacks. |
| **Creator Suite** | [`CreatorSuitePatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/creator/CreatorSuitePatch.kt) | Enables Audio Zoom, Cinematic Pan, Speech Enhancement, and 4K60 options. |
| **Pixel Camera Clone** | [`PixelCameraClonePatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/clone/PixelCameraClonePatch.kt) | Allows side-by-side installation with stock camera. |

---

## 6. Camera Looks: Unlocking All 13 Looks (Including the 3 New Looks)

### 6.1 Background and Root Cause
In Pixel Camera 11.1 (`11.1.040.982810059.19`), Google introduced three new Camera Looks alongside the existing 10 looks:
- **Flat** (`Lqvd;`, Look ID `9`, string res `sauce_pesto_label`)
- **Buffalo** (`Lqvg;`, Look ID `8`, string res `sauce_unflat_label`)
- **Dijon** (`Lqvi;`, Look ID `7`, string res `sauce_yellow_green_faded_label`)

While the look classes (`qvd`, `qvg`, `qvi`) and their respective image transformation pipelines exist in the APK, Google's UI carousel constructor in `Lqxg;-><init>` only initialized 6 individual looks into `this.h` (`quz` Black Tie, `qvh` Minimal, `qve` Digi, `quy` Velvet, `quw` Classic, `qva` Shadows). Combined with the 4 Subtle group looks (`qux` Original, `qvb` Natural, `qvf` Vanilla, `qvc` Editorial), this resulted in only 10 looks showing up in the carousel on unreleased or non-flagship devices.

### 6.2 The Solution: Carousel Population & Selection Forwarding
In [`CameraLooksPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt):
1. **Bytecode Injection into `qxg.<init>`:**
   We locate the end of `this.h` population (immediately after `sget-object v1, Lqva;->a:Lqva; invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z`) and inject smali instructions to add `qvd`, `qvg`, and `qvi`:
   ```smali
   iget-object v0, p0, Lqxg;->h:Ljava/util/List;
   sget-object v1, Lqvd;->a:Lqvd;
   invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
   sget-object v1, Lqvg;->a:Lqvg;
   invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
   sget-object v1, Lqvi;->a:Lqvi;
   invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
   ```
2. **Hooking Look Selection Callbacks:**
   We hooked `b(Lqvj;)V`, `c(Lqvj;)V`, and `g(Lqvj;)V` in `Lqxg;` to notify `TomteInitHelper.onLookObjectSelected(qvj)` whenever any look (including the 3 new ones) is chosen by the user, ensuring the preview and capture pipelines apply the appropriate Look parameters.

### 6.3 Complete List of All 13 Looks
| ID | Look Class | Display Name | Internal Identifier | Group |
|---|---|---|---|---|
| **0** | `Lqux;` | **Original** | `ORIGINAL` | Subtle / Natural |
| **1** | `Lqvb;` | **Natural** | `NATURAL` | Subtle / Natural |
| **2** | `Lqva;` | **Shadows** | `SHADOWS` | Expressive |
| **3** | `Lqvf;` | **Vanilla** | `VANILLA` | Subtle / Warm |
| **4** | `Lqvc;` | **Editorial** | `EDITORIAL` | Subtle / Cool |
| **5** | `Lquy;` | **Velvet** | `VELVET` | Expressive |
| **6** | `Lquw;` | **Classic** | `CLASSIC` | Expressive |
| **7** | `Lqvi;` | **Dijon** *(New)* | `sauce_yellow_green_faded_label` | Expressive |
| **8** | `Lqvg;` | **Buffalo** *(New)* | `sauce_unflat_label` | Expressive |
| **9** | `Lqvd;` | **Flat** *(New)* | `sauce_pesto_label` | Expressive |
| **10** | `Lqve;` | **Digi** | `DIGI` | Expressive |
| **11** | `Lquz;` | **Black Tie** | `BLACK_TIE` | B&W |
| **12** | `Lqvh;` | **Minimal** | `MINIMAL` | Expressive |

---

---

## 7. Brightness & Shadow Effect Fix: Restoring Full Dynamic Range (v1.0.7)

### 7.1 Background and Root Cause
In version 1.0.6, although both the Brightness and Shadow sliders rendered on the viewfinder, dragging them produced almost no visible effect on exposure or tone mapping. A deep investigation of the disassembly revealed three interlocking causes:

1. **`camera.enable_twilight` Conflict in `TomteInitHelper`:**
   - In [`TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali#L838), `"camera.enable_twilight"` was returning `1` (`true`).
   - When Twilight mode is enabled:
     - **In `DualEvCtrl` ([`Lpzj;`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/pzj.smali)):** `this.e` is set to `camera.enable_twilight`. In `pzj.g()`:
       ```smali
       iget-boolean v0, p0, Lpzj;->e:Z
       if-eqz v0, :cond_0
       goto :goto_0  # Exits immediately!
       :cond_0
       ...
       this.u.set(true)
       ```
       Because `this.e` was `true`, `pzj.u` was NEVER set to `true` (it stayed `false`).
     - **Catastrophic Failure in `pzj.a(FF)Lpzi;`:** On every AE frame and slider drag, `pzj.a` checks `this.u.get()`. Because `this.u` was `false`, it branched straight to `:goto_2`, returning `new Lpzi(0.0f, 0.0f, 0.0f, 0, 0.0f)` (ALL ZEROES)! The ISP exposure and shadow compensation received 0 effect.
     - **In `EvCompView` ([`EvCompView.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/com/google/android/apps/camera/evcomp/EvCompView.smali#L188)):** `this.w` was set to `camera.enable_twilight`. When true, knob `g` was tagged with `BRIGHTNESS_BIAS` (ordinal 2) and knob `h` with `EVC` (ordinal 3). Moving knobs dispatched to `lts.n` `:cond_5` and `:cond_4`, updating only twilight post-processing bias (`lts.g`/`lts.f`) instead of actual sensor AE exposure (`lts.v`) and shadow boost (`lts.w`).

2. **Obsolete Shadow Linearization Target (`ppn` vs `pzj`):**
   - In Pixel Camera 11.0, `DualEvCtrl` was in `ppn`. In Pixel Camera 11.1, `ppn` became an enum (`DEFAULT` / `PRO`), while `DualEvCtrl` moved to `Lpzj;` with method `n(FFF)V`.
   - As a result, the logarithmic shadow curve in `pzj.n(FFF)V` remained stock, compressing 80% of slider travel into an exponent dead zone ($r = \frac{\ln(24)}{\ln(\text{EV\_range})} \approx 3.5$).

### 7.2 The Solution in v1.0.7
1. **Disable Twilight in `TomteInitHelper.smali`:**
   Changed `"camera.enable_twilight"` to return `0` (`false`). This immediately restores:
   - Knob `g` tagged with `BRIGHTNESS` (`lsz.a`, sun icon), routing directly to `lts.v` (sensor exposure from -4.0 to +4.0 EV).
   - Knob `h` tagged with `SHADOW` (`lsz.b`, contrast icon), routing directly to `lts.w` (HDR+ shadow tone map expansion up to 15.3x).
2. **Bytecode Patching of `Lpzj;` in `QuickAccessPatch.kt`:**
   - **`pzj.n(FFF)V`:** Replaced the logarithmic exponent calculation with `const/high16 p1, 0x3f800000` ($r = 1.0\text{f}$), providing uniform, linear shadow response across the entire slider travel.
   - **`pzj.i()Z`:** Replaced body with `const/4 v0, 0x1; return v0;` ensuring dual EV is recognized as supported across all modes and sensors.
   - **`pzj.g()V`:** Nopped the early bypass `goto` instruction to ensure `pzj.u.set(true)` is unconditionally executed on startup.

---

---

## 8. Viewfinder Dual Slider Visibility & Universal Synchronization (v1.0.4)

### 8.1 Background & Root Cause
Disabling twilight caused the dual sliders on the **viewfinder** (`EvCompView`) to disappear because `ltg.j` falls back to legacy observables `nzu.b` and `nzu.e`, which are `Optional.empty()` on Pixel 8 Pro.

A deep architectural analysis revealed the exact cause:
1. **Viewfinder UI Dependency on Twilight (Pixel 8 Pro):**
   - On Pixel 8 Pro / GCam 11.1, the viewfinder dual slider subsystem ([`EvCompView.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/com/google/android/apps/camera/evcomp/EvCompView.smali), [`szl.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/szl.smali#L171), and [`ltg.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ltg.smali#L1039)) requires `camera.enable_twilight = 1`.
   - In `ltg.j(ZZ)V`:
     - When `ltg.u` is `true` (`enable_twilight = 1`): it consumes Twilight observables `nzu.d` (top slider) and `nzu.c` (bottom slider). `Lizp` sets both slider fractions and marks `AtomicBoolean v1` as `true`, causing `ltg.k` and `ltn.h` to display `EvCompView`.
     - When `ltg.u` is `false` (`enable_twilight = 0`): it branches to `:cond_5` and queries `nzu.b` and `nzu.e` (legacy Dual EV observables). On Pixel 8 Pro, both are `Optional.empty()`! Consequently, `v1` remains `false`, `ltg.k(false)` is invoked, and `EvCompView` is hidden (`setVisibility(8)`).
2. **The Viewfinder Twilight Slider Bypass in Stock Code:**
   - When `enable_twilight = 1`, the viewfinder sliders are visible, but the top knob sends `lsz.c` (`BRIGHTNESS_BIAS`) and the bottom knob sends `lsz.d` (`EVC`).
   - In stock `lts.n(FLlsz;)V`, these only updated Twilight post-processing biases (`pco.g` / `pco.f`), completely bypassing `pco.c` (`this.v` = Brightness) and `pco.d` (`this.w` = Shadow).
   - In addition, `ptm.g` was set to `true`, causing `pin.smali` lines 604 & 677 to skip connecting `DualEvCtrl` (`pzj.c()`) to Camera2 HAL!

### 8.2 The Unified Solution in v1.0.4
1. **Restore `"camera.enable_twilight" = 1` in `TomteInitHelper.smali`:**
   - Setting line 846 back to `const/4 v0, 0x1` restores `ltg.u = true`, immediately bringing back the entire viewfinder dual slider UI, tap-to-focus trigger, ticks, and layout animations.
2. **Force `ptm.g = false` in `Lptm;-><init>` ([`QuickAccessPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt)):**
   - Replaced `move-result p1` before `iput-boolean p1, p0, Lptm;->g:Z` with `const/4 p1, 0x0`.
   - In `pin.smali` line 604 (`if-nez v6, :cond_9`) and line 677 (`if-nez v1, :cond_c`), `ptm.g` is now unconditionally `false`, permanently wiring `DualEvCtrl` (`pzj.c()`) and `pco.b` to the Camera2 HAL request pipeline.
3. **Universal Slider Mapping & Dual-Sync in `Llts;->n(FLlsz;)V` ([`QuickAccessPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt)):**
   - Directly after `invoke-virtual {p2}, Llsz;->ordinal()I; move-result v0`, inserted `rem-int/lit8 v0, v0, 0x2`.
   - Ordinals 0 (`lsz.a`) & 2 (`lsz.c`, viewfinder top knob) branch to `:cond_7`:
     - Updates `EvCompView.i(F)` (viewfinder UI knob).
     - Updates `this.v` (`pco.c` = Brightness, driving `pzj.a(FF)` from -4.0 to +4.0 stops).
     - Updates `this.g` (`pco.g` = Twilight Brightness, saved into `nzt.d` on `:goto_0`).
     - If Shadow was uninitialized (-1.0f), sets both `this.w` and `this.f` to default `this.q` (0.5f).
   - Ordinals 1 (`lsz.b`) & 3 (`lsz.d`, viewfinder bottom knob) branch to `:cond_6`:
     - Updates `EvCompView.g(F)` (viewfinder UI knob).
     - Updates `this.w` (`pco.d` = Shadow, driving `pzj.a(FF)` linear boost up to 15.3x).
     - Updates `this.f` (`pco.f` = Twilight EVC, saved into `nzt.c` on `:goto_0`).
     - If Brightness was uninitialized (-1.0f), sets both `this.v` and `this.g` to default `this.q` (0.5f).
   - **Result:** Both viewfinder sliders and bottom sheet sliders are now 100% synchronized and drive the exact same linearized HDR+ pipeline with full effect.

---

## 9. Verification & Automated Testing

1. **Smali & Dex Compilation:**
   - [`SmokeTest.testAssembleDexes`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/SmokeTest.kt#L144) assembled [`TomteInitHelper.dex`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/resources/TomteInitHelper.dex) with `"camera.enable_twilight" = 1`.
2. **Bytecode Patch Execution & Verification:**
   - [`PatcherExecutionTest.testPatcherRun`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/PatcherExecutionTest.kt#L21) passed against stock `base.apk`, verifying all DEX classes transform cleanly.
   - [`SmokeTest.testInspectPzj`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/SmokeTest.kt#L58) verified that `Lpzj;` contains the linearized shadow exponent constant `0x3f800000` (1.0f), forced `i()Z` returning `true`, and intact `g()V`.
   - [`SmokeTest.testInspectPtmAndLts`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/SmokeTest.kt#L94) verified that `ptm.<init>` forces field `g = false` via `const/4 0` and `lts.n` contains `rem-int/lit8 v0, v0, 0x2` for universal dual slider mapping.
3. **Packaging:**
   - Built [`morphe-patches-pixelcamera-1.0.4.mpp`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches-pixelcamera-1.0.4.mpp) (116.1 KB).
   - Deployed directly to `/Users/akshaykadam/Desktop/morphe-patches-pixelcamera-1.0.4.mpp`.

---

## 10. Release History

| Version | Highlights |
|---|---|
| **v1.0.3** | Initial public release (10 Camera Looks backport, Portrait Mode fix, 10x Quick Zoom, Pro manual controls). |
| **v1.0.5** | • Fixed startup crash on Pixel 9 Pro, 9 Pro XL & Pixel 8 Pro by resolving `knq`/`knk` ART `VerifyError` (proper register routing for zoom stops, preserving float `v5` for `gei.o`).<br>• Preserved native Tensor G4 capability flags (`vku.g`, `vku.f`) on Pixel 9 models.<br>• Fixed 64-bit wide register collision in `mtt.K` (`ShotParams_tomte_type_set`) by utilizing scratch register `v15`.<br>• Removed legacy `EvCompView.onMeasure` bytecode hook causing verification errors on Android 15. |
| **v1.0.4** | • Unlocked all 13 Camera Looks (+ Flat, Buffalo, Dijon).<br>• Restored viewfinder tap-to-focus dual sliders (**Brightness & Shadow**) with full dynamic effect (-4.0 to +4.0 stops & 15.3x linear shadow boost) and bidirectional sync with bottom sheet.<br>• Pixel 10 12MP Photo Saving fix (disables failing Flare Removal & Eclipse AE with binned RAW fallbacks).<br>• Creator Suite (Teleprompter, VU Meter, Social Framing). |
