# Pixel Camera 11.1 Patch Suite: Complete Architecture, Root Cause Analysis & Fix Documentation

## 1. Overview & Project Goals

This document provides a comprehensive technical record of the engineering work, root-cause analyses, reverse-engineering discoveries, and patch implementations for **Google Pixel Camera 11.1** (`11.1.040.982810059.19`) on **Google Pixel 8 Pro** (and backwards-compatible across Pixel 6 through 10 devices).

### Target Package
- **Package Name:** `com.google.android.GoogleCamera`
- **Target Version:** `11.1.040.982810059.19`
- **Output Artifact:** [patches-1.1.3.mpp](file:///Users/akshaykadam/Desktop/patches-1.1.3.mpp) (Morphe Patch Bundle on Desktop)

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
- Routes the intent to [`TomteInitHelper.configureGalleryIntent(Intent)`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali#L3996).
- **Lock-Screen / Keyguard Secure Review Support**:
  - Detects secure review state via `KeyguardManager.isKeyguardLocked()` and intent actions (`ACTION_REVIEW_SECURE`).
  - Emits the standard Android platform action `android.provider.action.REVIEW_SECURE` (`MediaStore.ACTION_REVIEW_SECURE`) supported across all secure gallery implementations (Aves, Fossify Gallery, Simple Gallery, GrapheneOS Gallery, Google Gallery Go, Google Photos).
  - Explicitly binds to the resolved secure gallery package, bypassing Android Keyguard's block on `ResolverActivity` (the system chooser) while locked.
  - Automatically queries and routes to any installed secure gallery if Google Photos is absent, preventing null resolution crashes.
- **Unlocked Camera Gallery Review**:
  - Uses standard Android `Intent.ACTION_VIEW`.
  - Routes directly to custom gallery package (`pref_gallery_package_key`) or prompts the system App Chooser when set to `"default"`.
- **Viewfinder Freeze Safeguard**:
  - Patched [`lys.smali:cond_4`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/lys.smali#L1947) to call `qyr.v()` to unpause/resume the camera preview if activity resolution ever aborts, preventing dark viewfinder freezes.


---

## 5. Other Integrated Patches in Bundle

| Patch Name | File | Description |
|---|---|---|
| **Camera Looks Backport (All 13 Looks)** | [`CameraLooksPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt) | Unlocks all 13 Camera Looks (Subtle group: Original, Natural, Vanilla, Editorial; Individual looks: Shadows, Velvet, Classic, Digi, Black Tie, Minimal; plus the 3 new Pixel Camera 11.1 looks: Flat, Buffalo, Dijon). Injects `Lqvd;` (Flat), `Lqvg;` (Buffalo), and `Lqvi;` (Dijon) into `Lqxg;-><init>`, hooks selection handlers, and activates `vku.l/g/f` spoofing and Halide EXIF tags (`rfx.Z`). |
| **Pro Manual Controls** | [`ProControlsPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/pro/ProControlsPatch.kt) | Unlocks Manual Focus, Shutter Speed, ISO, and Focus Peaking by removing touch-drag suppression in `qaa.v`, `qbb.v`, `nrn.t`. |
| **Telephoto Portrait & 10x Zoom** | [`TelephotoPortraitAndZoomPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/portrait/TelephotoPortraitAndZoomPatch.kt) | Adds 10x Quick Zoom button (`knq`, `knk`), dynamic 1x focal length cycling (1.0x -> 1.2x -> 1.5x), and automatic persistence of the last used focal length across app launches (`guh`, `kmd`). |
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
   - Built [`morphe-patches-pixelcamera-1.1.3.mpp`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches-pixelcamera-1.1.3.mpp) (162.3 KB).
   - Deployed release build directly to `/Users/akshaykadam/Desktop/morphe-patches-pixelcamera-1.1.3.mpp` and `/Users/akshaykadam/Desktop/PixelCamera-1.1.3.apk`.
   - Live on SourceForge: [⬇️ Download Latest Patched APK v1.1.3](https://sourceforge.net/projects/pixel-camera-patches/files/Camera-v11.1.040.982810059.19-patches-v1.1.3.apk/download) • [⬇️ Download Latest Patch .mpp v1.1.3](https://sourceforge.net/projects/pixel-camera-patches/files/morphe-patches-pixelcamera-1.1.3.mpp/download).

---

## 10. Complete Release History

| Version | Highlights & Changes |
|---|---|
| **v1.1.3** *(Latest)* | • **True 50MP Full-Resolution Capture on Pro Devices**: Restored unbinned 50.13 MP capture (`8160 x 6144`, ~15–30 MB) on Pro devices by neutralizing automatic 12MP downsampling in `rdb.C()`/`rdb.D()`, while dynamically hiding the toggle on non-Pro devices via `isProDevice()` to enforce stable 12MP capture without placebo toggles.<br>• **Camera HAL Stream & Metadata Crash Safeguards**: Fixed `uwj` CameraMetadata missing key startup crashes in `msr.smali` through safe optional fallback, and eliminated stream format collisions to guarantee rock-solid live viewfinder preview across all supported devices.<br>• **Unified Pro Settings Sheet & Material You Layout Integration**: Injected [`TomteProSettingsPanel.smali`](../smali_patches/TomteProSettingsPanel.smali) directly into Google Camera's native bottom settings sheet (`poy.M(I)` and `poy.r(I)`), providing full in-drawer controls for Camera Looks selection, Uncompressed 16-bit DNG capture, and custom edge sharpness/de-ringing filter options.<br>• **Stock-Aligned Spacing & AutobahnViewPager Fix**: Fixed row layout clipping and eliminated extraneous `48dp` bottom margins (`options_bottomsheet_tab.xml`), ensuring all rows adhere to stock `56dp` row height and capsule pill standards (`38dp` height, `14dp` padding, `100dp` corner radius) with dynamic Monet wallpaper coloring.<br>• **Custom Edge Sharpness & De-Ringing Filter Modes**: Added user-selectable sharpness tuning (Standard, Natural, Soft) hooked into `TomteInitHelper.filterSharpness()`, preventing aggressive edge haloes while preserving fine textures.<br>• **Uncompressed 16-bit DNG Capture Support**: Restored uncompressed raw output support in Gcam, ensuring tone-curve and sensor dynamics are fully preserved without lossy compression artifacts.<br>• **Full Pipeline & Morphe Patch Package Sync**: Synchronized Morphe patcher bundle (`morphe-patches-pixelcamera-1.1.3.mpp`), standalone APK builder ([`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py)), and unified DEX helper runtime to v1.1.3. |
| **v1.0.8** | • **Visual App Name & Comprehensive International Localization**: Updated the visual application name from generic "Camera" / "PixelCamera" to clean "Pixel Camera" with native localization across 124 language locales (e.g., "Pixel Kamera" for German, "Cámara Pixel" for Spanish, "Appareil photo Pixel" for French, "Fotocamera Pixel" for Italian, "Câmera Pixel" / "Câmara Pixel" for Portuguese).<br>• **Launcher Activity Alias Label Alignment**: Added explicit `android:label="@string/app_name"` to launcher activity alias `com.android.camera.CameraLauncher` in `AndroidManifest.xml` ensuring consistent app drawer title display across all OEM and third-party launchers.<br>• **Unified Build & Patcher Pipeline Sync**: Synchronized [`PixelCameraClonePatch.kt`](../morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/clone/PixelCameraClonePatch.kt) (`injectLocalizedAppNames()`), standalone builder [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py), and compiled release `.mpp` patch bundles to v1.0.8. |
| **v1.0.7** | • **Fixed Video Mode Exposure & Viewfinder Controls (Issue #25)**: Corrected viewfinder slider attachment in `ltg.i` and `nzr.e` so Video mode cleanly displays the single Exposure slider (and White Balance/Temp) without incorrectly forcing broken Dual EV Shadow controls, routing live slider drag events to Camera2 `CONTROL_AE_EXPOSURE_COMPENSATION`.<br>• **AV1 Video Hardware Encoding (Issue #36)**: Unlocked `camcorder.jellybean_setting` and `camcorder_jellybean_feature` to expose the 3-way format selector (AVC, HEVC, AV1) in Video settings on Tensor G3 (Pixel 8 series) and Tensor G4 (Pixel 9 series) with automatic fallback for older devices and seamless fallback to HEVC for 10-bit HDR recording.<br>• **In-App JPEG Quality & Spatial Noise Reduction Menus (Issue #25)**: Added user-facing settings under "Photo resolution" in `camera_preferences.xml` and `camera_gm3_preferences.xml` allowing selection of JPEG compression quality (100% Ultra, 98% High, 95% Stock) and Spatial Noise Reduction (Off, Minimal, Stock), dynamically hooked into Camera2 capture requests and native Gcam encoder.<br>• **In-App 100% Max Display Brightness Toggle**: Added user-facing toggle under "Display" in Camera Settings, enforcing 100% display backlight exclusively during active viewfinder sessions while keeping standard system brightness in Settings and gallery.<br>• **Fixed Film Grain Initialization (Issue #38)**: Injected `TomteInitHelper.initTomteGrain(J)` into `msr.a` (`Gcam.<init>`) and `ndf.a` (`FilmGrainJni.applyTomteImageFinalizer`) to load the native grain model (`.tflite.uncompressed`), resolving `GetTomteGrainModel: Tomte requested, but initialization failed`.<br>• **Enforced Tomte Grain Mode Tracking & Pre-warming**: Connected `sof.P` (`setGcamMode`) to `TomteInitHelper.setCurrentMode()` to keep grain enabled across PHOTO, PORTRAIT, and NIGHT modes without dropping to disabled state, and injected `forceF = true` into `mqs.a` (`mia`) to guarantee Tomte grain model descriptors are initialized at startup.<br>• **Comprehensive Patcher & Patch Synchronization**: Added missing `tcc.<init>` and `tcc.b()` hooks in `CameraLooksPatch.kt`, injected `camera_preferences.xml` into `PixelCameraClonePatch.kt`, generated standalone patches, and aligned bundle version metadata across `patches-list.json` and `patches-bundle.json` to `v1.0.7`. |
| **v1.0.6** | • **Fixed Dalvik Bytecode VerifyError on Launch**: Resolved register type conflict in `qwh.smali` by inserting the Shadows/Highlights pipeline synchronization hook at method entry.<br>• **Fixed Dark Viewfinder on Gallery Return**: Fixed session pause/close reset in `oak.smali` (`oak.e`) to reset `pco.f` (live Brightness) to neutral `0.5f` instead of `-1.0f`.<br>• **Fixed Auto-Exposure Convergence**: Eliminated negative twilight AE bias hijacking in `pzq.smali` and preserved clean initial sensor baseline calibration in `pzj.smali`.<br>• **1x Main Camera Focal Length Cycling**: Tapping the `1x` zoom button now cycles between 1.0x (24mm) → 1.2x (28mm) → 1.5x (35mm) → 1.0x.<br>• **Live Dual-EV & Pro Slider Response**: Unlocked real-time exposure and tone curve updates while dragging without snap-back to auto. |
| **v1.0.5** | • **Fixed Startup Crash on Pixel 9 Pro, 9 Pro XL & Pixel 8 Pro**: Resolved ART bytecode `VerifyError` in `knq` and `knk` by safely routing zoom stop references through `v11` and preserving primitive float register `v5` (`2.0f`) for `gei.o(FLabjo;)V`.<br>• **Preserved Stock Tensor G4 Capabilities**: Kept native `vku.g` and `vku.f` hardware capability flags on Pixel 9 series to prevent profile fallback.<br>• **64-bit Pointer Pair Alignment**: Fixed look ID scratch register in `mtt.K` (`ShotParams_tomte_type_set`) to `v15`, eliminating wide register pair collisions.<br>• **Viewfinder & Quick Access Hardening**: Removed legacy `EvCompView.onMeasure` bytecode hook causing Android 15 verification conflicts, and added null-safety guards across activity startup. |
| **v1.0.4** | • Unlocked all 13 Camera Looks (+ Flat, Buffalo, Dijon).<br>• Restored viewfinder tap-to-focus dual sliders (**Brightness & Shadow**) with full dynamic range (-4.0 to +4.0 stops & 15.3x linear shadow boost) and bidirectional sync with bottom sheet.<br>• Pixel 10 12MP Photo Saving fix (disables failing Flare Removal & Eclipse AE with binned RAW fallbacks).<br>• Creator Suite (Teleprompter, VU Meter, Social Framing). |
| **v1.0.3** | Initial public release (10 Camera Looks backport, Portrait Mode fix, 10x Quick Zoom, Pro manual controls). |

---

## 11. Reverse-Engineering & Architecture: Real-Time Viewfinder Look Preview (Non-Pixel 11 Devices)

### 11.1 Background & Root Cause Analysis
On the Google Pixel 11 (Tensor G6), Camera Looks are rendered in real-time in the live viewfinder using hardware ISP support (`REQUEST_CLUT_CONTROL_ENABLED`, `REQUEST_TOMTE_TYPE` in Camera2 `experimental2026` vendor tags). On older Pixels (Pixel 6, 7, 8, 9, 10) and non-Pixel devices:
1. `Class.forName("com.google.android.camera.experimental2026.ExperimentalKeys")` in [`tpm.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/tpm.smali) throws `ClassNotFoundException`.
2. The Camera HAL lacks the Tomte hardware CLUT engine, meaning Camera2 capture requests cannot apply color LUTs to the live preview stream at the sensor/ISP level.
3. Offline native rendering (`applyTomteImageFinalizer` in `ndf.smali` and `libgcastartup.so`) only executes during still image capture and post-processing, leaving the live viewfinder stream in default un-styled colors.

### 11.2 OpenGL ES Viewfinder Pipeline Reverse Engineering
Using REA and deep bytecode analysis of the viewfinder rendering path, the preview rendering flow was traced:
```
Camera2 HAL ──► HardwareBuffer ──► qmb.a(vlm, vlm) ──► wlo.d(v6, v7) [GLTextureCopier]
                                                              │
                                                              ▼
                                                        wlo.e(wkl, wlk, matrix)
                                                              │
                                                              ▼
                                            wlo.c(wlp, true) [Fetches Shader Program]
                                                              │
                                                              ▼
                                            GLSL Fragment Shader Compilation & Blit
```

- In [`wlo.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/wlo.smali#L157), method `c(Lwlp;Z)Lwlk;` compiles and returns the shader program for blitting the camera preview (`GL_TEXTURE_EXTERNAL_OES`):
  ```glsl
  #extension GL_OES_EGL_image_external : require
  precision mediump float;
  uniform samplerExternalOES uImgTex;
  varying vec2 texCoord;
  void main() {
    gl_FragColor = texture2D(uImgTex, texCoord);
  }
  ```
- Method `wlo.g(vertexShader, fragmentShader)` caches compiled shader programs in `this.c` (`HashMap<Pair<String, String>, wlk>`) using `Map.computeIfAbsent`.
- Programs are compiled exactly once on first use and retrieved in microseconds on all subsequent frames, achieving zero overhead at native 60 FPS.

### 11.3 Implementation: Dynamic Look Fragment Shader Injection
1. **Dynamic Shader Generator ([`TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali)):**
   - Added `public static getViewfinderFragmentShader()Ljava/lang/String;`.
   - Reads `TomteInitHelper.sSelectedLookId` (0 to 12) and `sCurrentModeOrdinal`.
   - Evaluates a `.packed-switch 0x1` to return high-fidelity photographic GLSL fragment shaders tailored for all 13 Camera Looks:
     - **ID 0: Original** (`qux`) $\rightarrow$ Standard unmodified camera passthrough.
     - **ID 1: Natural** (`qvb`) $\rightarrow$ Subtle contrast (1.06) & saturation (1.04) lifelike curve.
     - **ID 2: Shadows** (`qva`) $\rightarrow$ Deep moody shadows, gamma `pow(c, 1.18)`, cool shadow tint `c.b += (1.0 - l) * 0.04`.
     - **ID 3: Vanilla** (`qvf`) $\rightarrow$ Warm creamy highlights, golden glow `c.r += 0.07 * l`, `c.g += 0.03 * l`.
     - **ID 4: Editorial** (`qvc`) $\rightarrow$ Fashion high-contrast tone curve, punchy saturation (1.12), contrast (1.22).
     - **ID 5: Velvet** (`quy`) $\rightarrow$ Luxurious saturated matte finish, contrast (1.18), saturation (1.38).
     - **ID 6: Classic** (`quw`) $\rightarrow$ Vintage film aesthetic, lifted blacks (`c * 0.94 + 0.04`), warm shadows.
     - **ID 7: Dijon** (`qvi`) $\rightarrow$ Golden mustard 70s warmth, yellow shift in highlights, contrast (1.12).
     - **ID 8: Buffalo** (`qvg`) $\rightarrow$ Rugged bronze tint, textured contrast (1.25), saturation (1.15).
     - **ID 9: Flat** (`qvd`) $\rightarrow$ Cinematic log curve (`c * 0.78 + 0.11`), soft contrast (0.88), muted saturation (0.65).
     - **ID 10: Digi** (`qve`) $\rightarrow$ Y2K cyber aesthetic, punchy cool tones, highlight cyan boost `c.b += 0.05 * l`.
     - **ID 11: Black Tie** (`quz`) $\rightarrow$ Fine-art monochrome, high-contrast B&W S-curve `smoothstep(0.04, 0.96, m)`.
     - **ID 12: Minimal** (`qvh`) $\rightarrow$ Clean modern neutral, subdued saturation (0.65), soft contrast (0.95).
   - In non-photo modes (Video = 2, Panorama = 4, Long Exposure = 14, Action Pan = 15), automatically defaults to passthrough.

2. **Bytecode Hook in `wlo.c` ([`CameraLooksPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt)):**
   - Replaced hardcoded `samplerExternalOES` string assignment in `wlo.c` with:
     ```smali
     invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getViewfinderFragmentShader()Ljava/lang/String;
     move-result-object p1
     ```
   - Integrated into standalone patcher pipeline ([`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py)) via `patch_wlo_smali()`.
   - Reassembled and synchronized [`TomteInitHelper.dex`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/resources/TomteInitHelper.dex).

---

## 12. Root Cause Analysis & Fix: Pro Controls Manual ISO Slider

### 12.1 The Problem
When the user adjusted the manual ISO slider in the Pro Controls drawer without touching the Shutter Speed slider, the viewfinder brightness remained unchanged (the sensor sensitivity setting was completely ignored by the Camera2 HAL). The manual ISO only took effect after the user touched or dragged the Shutter Speed slider.

### 12.2 Deep-Dive Root Cause Analysis
Decompilation and reverse-engineering of the camera capture request pipeline uncovered 4 interconnected bugs:

1. **Logical OR in `psk.smali` (`CONTROL_AE_MODE` calculation):**
   - In [`psk.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/psk.smali#L331-L349), `CONTROL_AE_MODE` was computed via:
     ```smali
     invoke-static {v7}, Lusa;->g(Ljava/util/Collection;)Lurt;
     ```
     where collection `v7` contained both `[shutter.isAuto, iso.isAuto]`. `usa.g()` performs a boolean logical OR.
   - When ISO is manual (`iso.isAuto == false`) but Shutter is untouched (`shutter.isAuto == true`):
     $$\text{true} \lor \text{false} = \text{true}$$
   - This passed `Boolean.TRUE` to `qdy` (switch 1), resolving `CONTROL_AE_MODE` to `1` (`CONTROL_AE_MODE_ON`).
   - According to the Android Camera2 specification, when `CONTROL_AE_MODE == CONTROL_AE_MODE_ON`, `CaptureRequest.SENSOR_SENSITIVITY` (ISO) is **strictly ignored** by the HAL because the Auto-Exposure routine overrides it.

2. **Tensor HAL Ignores AE Priority Mode:**
   - In [`pti.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/pti.smali), Google Camera attempted to set `REQUEST_CONTROL_AE_PRIORITY_MODE = 2` (ISO Priority).
   - However, the Tensor Camera HAL either does not support ISO priority under `CONTROL_AE_MODE_ON` or rejects it because `CaptureRequest.SENSOR_EXPOSURE_TIME` was passed as `0L` (`qef.b` is 0 when shutter is auto).

3. **Dual Condition in `nku.smali` (`nku.o` HAL parameter override):**
   - In [`nku.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nku.smali#L1538-L1553), method `nku.o` checked if `nzu.f` (ISO) is present:
     ```smali
     iget-object v3, p2, Lnzu;->f:Lj$/util/Optional;
     invoke-virtual {v3}, Lj$/util/Optional;->isPresent()Z
     move-result v3
     if-eqz v3, :cond_2
     iget-object v3, p2, Lnzu;->g:Lj$/util/Optional;
     invoke-virtual {v3}, Lj$/util/Optional;->isPresent()Z
     move-result v3
     if-eqz v3, :cond_2
     ```
   - It only set `CONTROL_AE_MODE = 0` (`OFF`) if **both** ISO (`nzu.f`) and Shutter (`nzu.g`) were manually set. If Shutter was untouched (`nzu.g.isPresent() == false`), it skipped setting `CONTROL_AE_MODE = 0` and left it at `1` (`ON`).
   - Once the user touched Shutter Speed, `nzu.g.isPresent()` became `true`, causing `CONTROL_AE_MODE` to switch to `0` (`OFF`), which unlocked manual exposure control.

4. **Zero Exposure Time Validation Failure in `qdy.smali`:**
   - When `CONTROL_AE_MODE` is forced to `0` (`OFF`), the Camera2 HAL requires a valid, non-zero `CaptureRequest.SENSOR_EXPOSURE_TIME`.
   - When Shutter Speed is untouched (Auto), `qef.b` is `0L`. A `0L` exposure time causes HAL capture request rejection.

### 12.3 Solution & Implementation

```
┌────────────────────────────────────────────────────────────────────────┐
│                        Camera2 AE State Machine                        │
├──────────────────┬─────────────────┬─────────────────┬────────────────┤
│ ISO Mode         │ Shutter Mode    │ CONTROL_AE_MODE │ SENSOR_EXP_TIME│
├──────────────────┼─────────────────┼─────────────────┼────────────────┤
│ Auto (v8=true)   │ Auto (v5=true)  │ 1 (ON)          │ Auto (HAL)     │
│ Auto (v8=true)   │ Manual (v5=false│ 1 (ON / Pri)    │ Manual Shutter │
│ Manual (v8=false)│ Auto (v5=true)  │ 0 (OFF)         │ lastExposureNs │
│ Manual (v8=false)│ Manual (v5=false│ 0 (OFF)         │ Manual Shutter │
└──────────────────┴─────────────────┴─────────────────┴────────────────┘
```

1. **Real-time Preview Exposure Caching ([`TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali)):**
   - Added volatile field `public static volatile lastExposureTimeNs:J = 20000000L` (1/50s default).
   - Added `updateLastExposureTime(J)` to track non-zero exposure times from preview metadata frames.
   - Added `getLastExposureTime()J` fallback method.

2. **Preview Metadata Hook ([`qkw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/qkw.smali)):**
   - In `qkw.is(Lvli;)V`, hooked after `Lqlb;->b(J)V` to call:
     ```smali
     invoke-static {v6, v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->updateLastExposureTime(J)V
     ```

3. **Fallback Non-Zero Exposure Time ([`qdy.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/qdy.smali)):**
   - In `:pswitch_13`, if `qef.b <= 0L`, fallback to `TomteInitHelper.getLastExposureTime()` so `SENSOR_EXPOSURE_TIME` is always valid.

4. **Direct ISO Binding to AE Mode ([`psk.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/psk.smali)):**
   - Replaced `usa.g()` result in `CONTROL_AE_MODE` stream with `v8` (`iso.isAuto`).
   - If `iso.isAuto == false`, `CONTROL_AE_MODE` is directly mapped to `0` (`OFF`).

5. **Removed Secondary Shutter Requirement ([`nku.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nku.smali)):**
   - In `nku.o`, when `nzu.f` (ISO) is present, immediately set `vef.e = 0` (`CONTROL_AE_MODE_OFF`) without requiring `nzu.g` (shutter).

6. **Automated in Standalone & Morphe Pipelines:**
   - Standalone: [`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py) via `patch_pro_iso_and_shutter_exposure()`.
   - Morphe: Section 12 bytecode transformations in [`ProControlsPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/pro/ProControlsPatch.kt).

---

## 13. Non-Pro Model Picture Quality & Pro RAW Exclusivity Gating

### 13.1 The Problem & Requirement
Under **Camera Settings $\rightarrow$ Photo Resolution (`pref_category_resolution_camera`)**, custom image quality preferences were added:
1. **JPEG Quality** (`pref_camera_jpeg_quality_key`)
2. **Spatial Noise Reduction** (`pref_camera_noise_reduction_key`)
3. **RAW DNG Format** (`pref_camera_raw_compression_key`)
4. **Edge Sharpness & De-Ring** (`pref_camera_sharpness_key`)

On **non-Pro devices** (e.g. Pixel 6, 6a, 7, 7a, 8, 8a, etc.) or devices where RAW mode is not supported, the user requirement dictates:
- **Only show JPEG Quality** (`pref_camera_jpeg_quality_key`).
- **Hide the other 3 options** (Noise Reduction, RAW Compression, Sharpness). These advanced image-tuning and RAW DNG options must be strictly restricted to Pro models that support RAW photography.

### 13.2 Architectural Analysis & Root Cause of Initial False Suppression
In Google Camera 11.1, the settings fragment is managed by [`rfl.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/rfl.smali) and the preferences exclusion repository is managed by [`rex.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/rex.smali):
1. **Initial Over-Filtering Issue:**
   - In earlier iterations, secondary checks on internal Gcam RAW flags (`kqd.bC` / `camera.enable_raw_setting`) and search queries for `"pref_camera_raw_output_option_available_key"` were executed.
   - Because `camera.enable_raw_setting` defaults to false on certain Gcam configurations and `"pref_camera_raw_output_option_available_key"` is filtered or relocated, these checks evaluated to null/false, triggering accidental suppression even on Pro devices like the Pixel 8 Pro (`husky`).
2. **The Permanent Architecture: Pure Hardware Pro Model Gating:**
   - The device check is anchored directly to [`TomteInitHelper.isProDevice()`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali), which verifies `Build.MODEL` ("Pro") and `Build.DEVICE` against pro codenames (`husky`, `cheetah`, `raven`, `caiman`, `komodo`, `comet`).
   - If `TomteInitHelper.isProDevice()` is `true` (e.g. Pixel 8 Pro), the branch directly skips exclusion and removal, preserving all 4 options.
   - If `TomteInitHelper.isProDevice()` is `false` (e.g. Pixel 7, 7a, 8, etc.), the options are added to exclusions (`rex.f`) and removed via `rfl.aC()`, exposing solely **JPEG Quality**.

### 13.3 Dual-Layer Gating Implementation

```
┌────────────────────────────────────────────────────────┐
│             Device & Feature Gating Check              │
├────────────────────────────────────────────────────────┤
│             TomteInitHelper.isProDevice()              │
└───────────────────────────┬────────────────────────────┘
                            │
            ┌───────────────┴───────────────┐
            │                               │
    [isProDevice() == true]        [isProDevice() == false]
    (Pixel 8 Pro / husky, etc.)    (Pixel 6/7/8 non-pro, etc.)
            │                               │
            ▼                               ▼
    Retain all 4 options:           Add to Exclusions (rex.f)
    - JPEG Quality                  & direct removal (rfl.ar):
    - Spatial Noise Reduction       - Spatial Noise Reduction ──► HIDDEN
    - RAW DNG Format                - RAW DNG Format          ──► HIDDEN
    - Edge Sharpness                - Edge Sharpness          ──► HIDDEN
                                    - JPEG Quality            ──► VISIBLE
```

1. **`TomteInitHelper` Detection Logic ([`TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali)):**
   - Utilizes `TomteInitHelper.isProDevice()` inspecting `Build.MODEL` and `Build.DEVICE`.
   - Updated helper `filterProPreferences(Ljava/lang/Object;)V` to remove preferences strictly if `!isProDevice()`.

2. **Hook 31: Exclusion Layer ([`rex.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/rex.smali)):**
   - In `rex.a(Context)`:
     ```smali
     invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z
     move-result v1
     if-nez v1, :cond_keep_pro_extras
     iget-object v1, p0, Lrex;->f:Ljava/lang/Object;
     const-string v3, "pref_camera_noise_reduction_key"
     invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
     const-string v3, "pref_camera_raw_compression_key"
     invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
     const-string v3, "pref_camera_sharpness_key"
     invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
     :cond_keep_pro_extras
     ```
   - On Pro models (`v1 != 0`), jumps to `:cond_keep_pro_extras`.
   - `pref_camera_jpeg_quality_key` is never added to exclusions, remaining visible everywhere.

3. **Hook 32: UI Pruning ([`rfl.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/rfl.smali)):**
   - In `rfl.ar()`, right before invoking `aw()`:
     ```smali
     invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z
     move-result v0
     if-nez v0, :cond_skip_pro_removal
     const-string v0, "pref_camera_noise_reduction_key"
     invoke-direct {p0, v0}, Lrfl;->aC(Ljava/lang/String;)V
     const-string v0, "pref_camera_raw_compression_key"
     invoke-direct {p0, v0}, Lrfl;->aC(Ljava/lang/String;)V
     const-string v0, "pref_camera_sharpness_key"
     invoke-direct {p0, v0}, Lrfl;->aC(Ljava/lang/String;)V
     :cond_skip_pro_removal
     invoke-virtual {p0}, Lrfl;->aw()V
     ```
   - On Pro models (`v0 != 0`), jumps straight to `:cond_skip_pro_removal`, preserving all entries.

4. **Integration in Morphe & Standalone Build Pipelines:**
   - **Morphe Patches:** Implemented in [`CameraLooksPatch.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/main/kotlin/app/morphe/patches/pixelcamera/looks/CameraLooksPatch.kt) (Hook 31 & 32) and verified by [`PatcherExecutionTest.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/PatcherExecutionTest.kt).
   - **Standalone Builder:** Implemented in `patch_image_quality_preferences()` inside [`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py).
   - **Live Device Verification:** Verified via `uiautomator dump` on connected Pixel 8 Pro (`husky`), confirming `JPEG Quality`, `Spatial Noise Reduction`, `RAW DNG Format`, and `Edge Sharpness & De-Ring` are all live and rendered.


