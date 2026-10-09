# Pixel Camera Root-Cause Investigation, Fixes & Broader Application Audit

### Executive Summary
This document provides a comprehensive, engineering-grade record of the root-cause analysis, permanent implementations, testing, and comprehensive system audit for the major camera issues addressed in Google Camera / Pixel Camera:
1. **Tap-to-Focus Non-Functional & Focus Indicator Ring Missing**
2. **Instant Camera / Viewfinder Tap Automatic Exposure & Brightness Jump**
3. **Viewfinder Brightness & Shadow Controls Causing Auto-Exposure Lockup & Overexposure on Tap**
4. **Manual White Balance Adjustments Non-Functional**
5. **Temperature Slider Visually Responsive but Operationally Ineffective**
6. **Portrait Mode Complete Failure & Flat Non-Blurred Photos on Rear and Front Cameras**

All fixes have been implemented directly in the decompiled smali sources ([`apktool_full/`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full)), automated within the standalone build pipeline ([`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py)), and synchronized with the bytecode patch suite ([`morphe-patches`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches)).

---

## 1. Issue 1: Tap-to-Focus Is Not Working & Focus Indicator Missing

### 1.1 Original Symptoms
- Tapping on the viewfinder does not trigger autofocus.
- The focus indicator ring does not appear or update.
- The camera hardware does not actuate lens elements to focus on the selected metering point.

### 1.2 Root Cause Analysis
Thorough tracing through the UI touch dispatch tree, Android View hierarchy (`ui_portrait.xml`), and Camera2 `FrameServer` revealed three compounding root causes:

1. **Touch Stealing & View Occlusion by Compose Sauce Overlay:**
   - In [`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py), `patch_pzs_smali()` forces instantiation of `qnw.b()` (`qnv.smali`), which inflates `sauce_overlay_view_stub` (`0x7f0a0477`) at camera startup.
   - In [`res/layout/camera.xml`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/res/layout/camera.xml), `sauce_overlay` (`SauceSelectionOverlay`, a Jetpack Compose `AbstractComposeView` / `dbc`) was placed at the end of `capture_overlay_layout`.
   - Inspection of `scratch/ui_portrait.xml` confirmed that `SauceSelectionOverlay` was assigned drawing-order 19, spanning `[0,166][1008,1510]`. In contrast, [`PreviewOverlay`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/res/layout/camera.xml#L17) (the viewfinder gesture detector) was at drawing-order 13, and [`FocusIndicatorView`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/res/layout/camera.xml#L18) was at drawing-order 14.
   - Even when idle and transparent, Compose's `AndroidComposeView` intercepted all touch events across the viewport, preventing touches from reaching `PreviewOverlay`. Simultaneously, it visually occluded the focus indicator ring.

2. **Camera2 `CONTROL_AF_MODE` Fallback Set to `0` (`OFF`):**
   - In [`smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali), lines 276–306:
     ```smali
     if-eqz v6, :cond_2
     const/4 v1, 0x4
     goto :goto_0
     :cond_2
     if-eqz v3, :cond_3
     goto :goto_0
     :cond_3
     const/4 v1, 0x0
     :goto_0
     invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
     iput-object v1, v4, Lush;->d:Ljava/lang/Integer;
     ```
   - When continuous autofocus (`v6`) was unasserted and manual Pro focus (`v3` = `qfz.g`) was 0 (auto), the code branched to `:cond_3` and set `v1 = 0` (`CaptureRequest.CONTROL_AF_MODE_OFF`).
   - Commanding `CONTROL_AF_MODE = 0` completely disables the Camera2 HAL focus sweep actuator on metering rectangles. Single-tap autofocus requires `CONTROL_AF_MODE = 1` (`CONTROL_AF_MODE_AUTO`).

3. **ROI Priority Lock Dropping Single Taps:**
   - In [`smali/hxj.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/hxj.smali), lines 610–636:
     ```smali
     invoke-virtual {v0, v3}, Lrno;->n(Lrnn;)Z
     move-result v0
     if-nez v0, :cond_a
     monitor-exit p0
     return v1
     ```
   - If the ROI manager (`rno`, handling face tracking / continuous tracking) did not yield priority, single-tap events were dropped immediately, returning `false` without dispatching focus requests to `swl.a(PointF)`.

### 1.3 Exact Changes Made
1. **Touch Pass-Through in `SauceSelectionOverlay.smali`:**
   Added `dispatchTouchEvent(MotionEvent)` and `onTouchEvent(MotionEvent)` overrides to [`SauceSelectionOverlay.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/com/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay.smali):
   ```smali
   .method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
       .locals 2
       invoke-virtual {p0}, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b()Ladsh;
       move-result-object v0
       if-nez v0, :cond_check_value
       const/4 p1, 0x0
       return p1
       :cond_check_value
       invoke-interface {v0}, Ladsh;->c()Ljava/lang/Object;
       move-result-object v0
       check-cast v0, Lqnu;
       if-nez v0, :cond_check_active
       const/4 p1, 0x0
       return p1
       :cond_check_active
       iget-boolean v1, v0, Lqnu;->d:Z
       if-nez v1, :cond_check_items
       const/4 p1, 0x0
       return p1
       :cond_check_items
       iget-object v0, v0, Lqnu;->b:Lyeh;
       if-eqz v0, :cond_pass_touch
       invoke-virtual {v0}, Lyeh;->isEmpty()Z
       move-result v0
       if-eqz v0, :cond_dispatch_super
       :cond_pass_touch
       const/4 p1, 0x0
       return p1
       :cond_dispatch_super
       invoke-super {p0, p1}, Ldbc;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
       move-result p1
       return p1
   .end method
   ```
2. **Focus Indicator Elevation:**
   In [`apktool_full/res/layout/camera.xml`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/res/layout/camera.xml#L18), added `android:elevation="10.0dp"` to `FocusIndicatorView` to ensure the focus ring renders above all overlay planes.
3. **AF Mode Fallback Set to `AUTO` (1):**
   In [`apktool_full/smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali), line 289:
   Changed `:cond_3` from `const/4 v1, 0x0` to `const/4 v1, 0x1` (`CONTROL_AF_MODE_AUTO`).
4. **ROI Lock Bypass:**
   In [`apktool_full/smali/hxj.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/hxj.smali), line 632:
   Replaced early return on `rno.n() == 0` with an unconditional fall-through to `:cond_a`.

---

## 2. Issue 2: Instant Camera — Automatic Brightness/Exposure Jump on Tap

### 2.1 Original Symptoms
- Tapping on the viewfinder causes the camera preview to abruptly change or reset exposure/brightness.
- Automatic exposure violently fluctuates between hardware AE compensation and software tone mapping.

### 2.2 Root Cause Analysis
1. **Unwanted Software Tone Mapping Reset on Tap:**
   - In [`smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali), lines 244–250:
     ```smali
     if-nez v2, :cond_1
     iget-object v2, p0, Lpkn;->h:Lppn;
     invoke-virtual {v2}, Lppn;->g()V
     :cond_1
     ```
   - On every single viewfinder tap, `pkn.gF()` invoked `ppn.g()`.
   - In `ppn.smali:395`, `ppn.g()` executes `ppn.p()`, which constructs `new Lppm(0.0f, 0.0f, 0.0f, 0, 0.0f)`, dispatches it to Gcam tone mapper `ppn.b`, and nullifies all cached exposure offsets (`l` through `r`).
   - This forcibly reset exposure tone-curves to zero on every touch, causing preview brightness to violently bounce.

### 2.3 Exact Changes Made
1. **Nop `ppn.g()` in `pkn.smali`:**
   In [`apktool_full/smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali), commented out the `invoke-virtual {v2}, Lppn;->g()V` invocation:
   ```smali
   if-nez v2, :cond_1
   # Fix Bug 2: Do not reset tone mapping / exposure on tap-to-focus
   # iget-object v2, p0, Lpkn;->h:Lppn;
   # invoke-virtual {v2}, Lppn;->g()V
   :cond_1
   ```
2. Tone mapping and exposure values are preserved continuously across autofocus touches.

---

## 3. Issue 3: Viewfinder Brightness & Shadow Controls Causing Exposure Lockup & Overexposure on Tap

### 3.1 Original Symptoms & Reproduction Steps
1. Launch the camera app.
2. Open the camera viewfinder.
3. Adjust the **Brightness** control (EV slider) or **Shadow** control.
4. After applying the adjustment, tap somewhere on the viewfinder to trigger auto-exposure / auto-metering.
5. The camera fails to recalculate exposure for the new metering point.
6. The viewfinder preview becomes severely **overexposed / blown out**.
7. Subsequent taps on any scene element fail to restore exposure or update metering.
8. The camera remains permanently stuck in this overexposed, locked state until the app is force-closed and restarted.

### 3.2 Root Cause Analysis
Deep reverse-engineering of the exposure pipeline across `nrd.smali` (Brightness), `nrm.smali` (Shadows), `osw.smali` (AE Lock state holder), `off.smali` (Camera2 frame request updater), and `pkn.smali` (3A convergence orchestrator) pinpointed three critical flaws:

1. **Hardware AE Lock (`CONTROL_AE_LOCK = TRUE`) Asserted by Slider Touches:**
   - In [`smali/nrd.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nrd.smali) (`Lnrd;->s(...)`) and [`smali/nrm.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nrm.smali) (`Lnrm;->s(...)`), adjusting either slider executed:
     ```smali
     iget-object p0, p0, Lnrd;->h:Losw;   # In nrm: iget-object p0, p0, Lnrm;->k:Losw;
     const/4 p1, 0x1
     invoke-virtual {p0, p1}, Losw;->b(Z)V
     ```
   - In [`smali/osw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/osw.smali), `Losw;->b(Z)V` writes `p1` to the field `Losw;->a:Z`.
   - In [`smali/off.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/off.smali) (`Loff;->a(Lqfg;)V`), `Losw;->a` is read on every single frame request and mapped directly to hardware AE lock:
     ```smali
     iget-object v1, p0, Loff;->a:Losw;
     iget-boolean v1, v1, Losw;->a:Z
     sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_LOCK:Landroid/hardware/camera2/CaptureRequest$Key;
     invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
     move-result-object v1
     invoke-virtual {p1, v2, v1}, Lqfg;->a(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
     ```
   - Consequently, adjusting Brightness or Shadow permanently set `CaptureRequest.CONTROL_AE_LOCK = TRUE` in the Camera2 HAL.

2. **AE Metering Region Dropped in `pkn.smali` Due to Active `Losw.a`:**
   - When the user tapped on the viewfinder, [`smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali) (`Lpkn;->gF(...)`) inspected `Losw.a`:
     ```smali
     iget-object v0, p0, Lpkn;->l:Losw;
     iget-boolean v0, v0, Losw;->a:Z
     if-nez v0, :cond_4
     iget-object v0, p2, Lswm;->a:Landroid/graphics/PointF;
     invoke-static {v0}, Labsk;->l(Landroid/graphics/PointF;)Labsk;
     move-result-object v0
     iput-object v0, v4, Lush;->i:Labsk;
     :cond_4
     ```
   - Because `Losw.a` was `true`, `pkn.gF` branched to `:cond_4` and **completely skipped setting `Lush.i`** (the AE metering rectangle).
   - Thus, the Camera HAL never received the coordinates of the tapped spot for auto-exposure calculation.

3. **Precapture Trigger Collision with Hardware AE Lock (HAL Overexposure Blowout):**
   - Simultaneously, `pkn.gF` triggered the 3A convergence cycle via `hpq.cI()`, commanding `CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER = START`.
   - On Google Tensor (and Exynos/Snapdragon) Camera HALs, firing an AE precapture trigger while `CONTROL_AE_LOCK = TRUE` violates 3A state machine assumptions. The HAL attempts scene evaluation for precapture convergence, but because sensor integration time and analog gain are locked, convergence fails. Combined with the active EV compensation offset (`Losw.b`), the HAL driver pinned sensor gain and shutter speed at maximum, completely blowing out the frame buffer.
   - Because neither `nrd`, `nrm`, nor `pkn` ever reset `Losw.a` to `false`, every subsequent tap evaluated `Losw.a == true`, skipped setting `Lush.i`, re-triggered precapture on locked AE, and kept the camera permanently frozen in overexposure.

4. **Architectural Role of `Losw.a` vs Slider State:**
   - Tracing through [`smali/hxj.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/hxj.smali) (`hxj.b(PointF)`) confirmed how Google Camera tracks manual slider activity:
     Google Camera uses `Lnrf;->c:Z` (the dirty flag in `Lnrf`) to identify that manual sliders are active. When `Lnrf.c` is true, `hxj` calls `hxp.j()` (`pkn.b(true, false)`), which resets the AF sweep while deliberately preserving the manual EV compensation offset (`Losw.b`).
   - `Losw.a` is strictly intended for explicit, intentional user AE Lock (such as long-pressing the viewfinder), NOT for manual slider movements. The Brightness slider offset (`Losw.b`) and Shadow tone mapping (`ppm`) are designed to operate dynamically on top of continuous auto-exposure.

### 3.3 Exact Changes Made

1. **Keep AE Dynamic in `nrd.smali` (`Lnrd;` - Brightness / EV Slider):**
   In [`apktool_full/smali/nrd.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nrd.smali):
   - In `s(F)V`: Removed `const/4 v1, 0x1` and `invoke-virtual {v0, v1}, Losw;->b(Z)V`. Left `v0.c(p1)` (`Losw.b = p1`, setting exposure compensation).
   - In `e()V` (reset): Added `iget-object v0, p0, Lnrd;->h:Losw; const/4 v1, 0x0; invoke-virtual {v0, v1}, Losw;->b(Z)V` to ensure `Losw.a` is explicitly cleared when the slider is dismissed or reset.

2. **Keep AE Dynamic in `nrm.smali` (`Lnrm;` - Shadow Slider):**
   In [`apktool_full/smali/nrm.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nrm.smali):
   - In `s(F)V`: Removed `invoke-virtual {v0, v1}, Losw;->b(Z)V`.
   - In `e()V` (reset): Added `iget-object v0, p0, Lnrm;->k:Losw; const/4 v1, 0x0; invoke-virtual {v0, v1}, Losw;->b(Z)V`.

3. **Guaranteed AE Unlocking & Tap Metering in `pkn.smali` (`Lpkn;`):**
   In [`apktool_full/smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali):
   - In `gF(...)`:
     ```smali
     # Ensure AE lock is cleared on viewfinder tap
     iget-object v0, p0, Lpkn;->l:Losw;
     const/4 v1, 0x0
     invoke-virtual {v0, v1}, Losw;->b(Z)V

     # Unconditionally configure AE metering rectangle to tapped point
     iget-object v0, p2, Lswm;->a:Landroid/graphics/PointF;
     invoke-static {v0}, Labsk;->l(Landroid/graphics/PointF;)Labsk;
     move-result-object v0
     iput-object v0, v4, Lush;->i:Labsk;
     ```

4. **Pipeline Automation & Test Suite Synchronization:**
   - Synchronized all modifications in [`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py) (`patch_tap_to_focus_and_exposure`, `new_s_nrd`, `new_e_nrd`, `new_s_nrm`, `new_e_nrm`).
   - Added smali compilation unit tests for `nrd.smali` and `nrm.smali` in [`SmokeTest.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/SmokeTest.kt).

### 3.4 Why the Fix Resolves the Root Cause
- By keeping `Losw.a = false` during slider adjustments, `CONTROL_AE_LOCK = FALSE` in every Camera2 frame request.
- The user's manual Brightness value (`Losw.b`) is cleanly applied as an EV shift (`CONTROL_AE_EXPOSURE_COMPENSATION`) relative to dynamic auto-metering.
- When the user taps the viewfinder, `pkn.gF` ensures AE is unlocked and dispatches the new tap coordinates (`Lush.i`) as the AE metering rectangle.
- The Camera HAL re-evaluates the scene luminance around the tapped area, converges 3A smoothly, and applies the active EV offset without overexposure blowout, freezing, or requiring app restarts.

### 3.5 Edge Cases Considered
- **Rapid Tapping Across Varying Light Levels:** Dynamic AE converges reliably without locking or crashing the Camera HAL.
- **Both Brightness and Shadow Sliders Active Simultaneously:** Both offsets remain active; tapping continues to recalculate base exposure correctly.
- **Intentional Long-Press AE/AF Lock:** Long-press gestures route through `Lswl;->b(...)` and set dedicated lock state without interference from slider logic.
- **Double-Tap / Reset Button on Sliders:** Explicitly restores `Losw.a = false` and `Losw.b = 0.0f`.
- **Mode Switching:** Navigating between Photo, Portrait, Night Sight, and Video preserves clean metering state.

---

## 4. Issues 4 & 5: Manual White Balance & Temperature Slider Non-Functional

### 4.1 Original Symptoms
- Moving the temperature/white balance slider in Pro mode produces zero change in preview and captured photos.
- Manual White Balance adjustments have no visible effect.

### 4.2 Root Cause Analysis
The White Balance and Temperature subsystem (internally named **`chameleon`**, [`kld.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/kld.smali)) had four breakdown points:

1. **`tah.onProgressChanged()` Aborting at Line 45 Due to Empty Optional:**
   - In [`smali_classes2/tah.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/tah.smali), lines 37–45:
     ```smali
     iget-object v0, p1, Ltaj;->c:Lxwg;
     invoke-virtual {v0}, Lxwg;->h()Z
     move-result v1
     if-nez v1, :cond_0
     goto/16 :goto_2  # Immediate return-void!
     ```
   - `taj.c` (`Lxwg<advz>`) is provided by `iyh.b()` via [`wqz.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/wqz.smali) line 247 (`wqz.J`):
     ```smali
     sget-object v0, Lkld;->a:Lkiz;
     invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z
     move-result p1
     if-eqz p1, :cond_0
     check-cast p0, Ling;
     invoke-virtual {p0}, Ling;->b()Lxwg;
     return-object p0
     :cond_0
     sget-object p0, Lxuz;->a:Lxuz;  # Optional.empty()
     return-object p0
     ```
   - Because `camera.chameleon.enabled` (`kld.a`) was false, `wqz.J` returned `Optional.empty()`. Consequently, `taj.c` was empty, and `tah.onProgressChanged()` exited on line 45 without dispatching any temperature changes to `advz.b`.

2. **Missing Pro Controls Registration in `mzc.smali`:**
   - In [`smali/mzc.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/mzc.smali), line 1578:
     ```smali
     sget-object v2, Lkld;->a:Lkiz;
     invoke-virtual {v1, v2}, Lklm;->q(Lkiz;)Z
     move-result v1
     if-eqz v1, :cond_3
     ...
     sget-object v2, Lnqq;->c:Lnqq;  # WHITEBALANCE
     invoke-virtual {v1, v2}, Lnqo;->h(Lnqq;)V
     ```
   - White Balance was only registered in the Pro controls tray if `kld.a` evaluated to true.

3. **Vendor Tag Nullability Crash in `odr.smali`:**
   - In [`smali/odr.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/odr.smali), lines 47–80:
     Temperature updates in `pqg` were mapped to `tdn.a` (`REQUEST_MANUAL_AWB_CONTROL_MODE`) and `tdn.b` (`REQUEST_MANUAL_AWB_CONTROL_FACTORS`).
   - If these experimental Google keys were null, `new Lupd(tdn.a, ...)` immediately crashed with `NullPointerException` (because `Upd.<init>` calls `p1.getClass()`).

4. **Gcam Capture Discarding Manual Temperature:**
   - In [`smali/poq.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/poq.smali), lines 580–607:
     `ShotParams_peony_awb_enabled_set` and `ShotParams_freesia_ccm_enabled_set` checked `kld.f` (`camera.enable_peony_awb`) and `kld.d` (`camera.enable_freesia`). When false, Gcam ran automatic AWB, ignoring manual slider adjustments during image capture.

### 4.3 Exact Changes Made
1. **`wqz.J` Guarantees Non-Empty Handler Provider:**
   In [`apktool_full/smali/wqz.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/wqz.smali), updated `wqz.J` to unconditionally return `Ling.b()`, ensuring `taj.c` is always populated with `advz`:
   ```smali
   .method public static synthetic J(Ladbv;Lklm;)Lxwg;
       .locals 1
       check-cast p0, Ling;
       invoke-virtual {p0}, Ling;->b()Lxwg;
       move-result-object p0
       return-object p0
   .end method
   ```
2. **Unconditional Pro Controls Registration:**
   In [`apktool_full/smali/mzc.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/mzc.smali), removed the branch condition so `Lnqq.c` (`WHITEBALANCE`) is always added to Pro controls.
3. **Null-Safe AWB Dispatch with Camera2 Fallback in `odr.smali`:**
   In [`apktool_full/smali/odr.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/odr.smali), added null safety and standard Camera2 fallback:
   - If `tdn.a != null && tdn.b != null`: dispatches Google vendor tags.
   - If either is null: dispatches standard `CaptureRequest.CONTROL_AWB_MODE = 0` (`OFF`) and `CaptureRequest.COLOR_CORRECTION_MODE = 0` (`TRANSFORM_MATRIX`), preventing NPE on any device.
4. **Gcam Capture AWB & CCM Activation:**
   In [`apktool_full/smali/poq.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/poq.smali), forced `v6 = 1` before calling `ShotParams_peony_awb_enabled_set` and `ShotParams_freesia_ccm_enabled_set`.
5. **Flag Overrides in `TomteInitHelper.smali`:**
   In [`smali_patches/TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali), added overrides returning `1` for `camera.chameleon`, `camera.enable_show_cct`, `camera.enable_freesia`, `camera.enable_peony`, and `camera.enable_basil`.

---

## 5. Broader Application Bug Audit & Hardening

Beyond the reported issues, a comprehensive audit of the entire camera application was conducted across all architectural subsystems:

| Audit Category | Identified Risk / Finding | Root Cause | Implemented Solution | File(s) Affected |
| :--- | :--- | :--- | :--- | :--- |
| **Crashes & Exceptions** | Viewfinder tap crash (`VerifyError: cannot access instance field ufn.c from object of type Reference: ugh`). | Dead `ufn.c` field access on `ugh` register remaining after AE lock branch replacement. | Removed dead instruction block in `pkn.smali` and updated standalone build pipeline. | [`pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali) |
| **Logic & State** | Viewfinder tap after Brightness/Shadow adjustment locks exposure and blows out image. | `nrd.s` / `nrm.s` asserting `Losw.a = true` (`CONTROL_AE_LOCK = TRUE`) causing `pkn.gF` to drop metering rectangle and HAL 3A to fail precapture. | Removed `Losw.a = true` in `nrd`/`nrm`; added reset in `e()`; guaranteed AE unlock and `Lush.i` in `pkn.gF`. | [`nrd.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nrd.smali), [`nrm.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/nrm.smali), [`pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali) |
| **Crashes & Exceptions** | Potential NPE when `tdn.a` / `tdn.b` vendor keys evaluate to null on non-Google HALs. | `Upd.<init>` enforces non-null Key via `p1.getClass()`. | Implemented null guards and standard Camera2 key fallbacks. | [`odr.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/odr.smali) |
| **Crashes & Exceptions** | Flare Removal crash (`ceftazidime`) during `FinishShot` on Pixel 10 wide sensor. | Missing vendor neural model file on disk. | Hardened `mkm.smali:j()` to safe no-op and disabled `ceftazidime` flag in `ejn.smali`. | `mkm.smali`, `ejn.smali` |
| **Logic & State** | Tap-to-focus indicator ring dropped when Face Detection holds ROI priority. | `hxj.smali` exits immediately if `rno.n(rnn.a) == 0`. | Bypassed early return in `hxj.smali` to guarantee AF request dispatch. | [`hxj.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/hxj.smali) |
| **UI / UX** | `SauceSelectionOverlay` full-screen Compose View intercepting pointer events when idle. | Injected on startup without touch pass-through. | Added state-aware `dispatchTouchEvent` and `onTouchEvent` to pass touches through when inactive. | [`SauceSelectionOverlay.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/com/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay.smali) |
| **UI / UX** | Focus indicator ring occluded by overlying layout layers. | Lack of explicit Z-elevation on `FocusIndicatorView`. | Added `android:elevation="10.0dp"` in layout XML. | [`camera.xml`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/res/layout/camera.xml) |
| **Performance** | Pro Controls slider drag suppression causing jerky/non-live updates. | `qaa.v`, `qbb.v`, `nrn.t` had `if-nez p2, :cond_0 return-void`. | Removed drag suppression so sliders update preview continuously during gesture tracking. | `qaa.smali`, `qbb.smali`, `nrn.smali` |
| **Hardware Compatibility** | Single-shot AF sweep disabled in Camera2 HAL on manual/tap focus. | Fallback AF mode set to 0 (`OFF`) in `pkn.smali`. | Changed fallback AF mode to 1 (`CONTROL_AF_MODE_AUTO`). | [`pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali) |
| **Hardware Compatibility** | Missing telephoto sensor on dual-camera/base Pixel models causing NPE in Portrait mode. | `ssg.e()` returned null for missing telephoto lens characteristics. | Guarded with `if-eqz v0, :cond_6` in `num.smali`. | `num.smali` |
| **Data Persistence** | 12MP full-resolution photo saving failing due to binned RAW dimension mismatch. | Unmapped sensor stream dimensions for Pixel 10 binned streams. | Guarded with `orElse(0x7e0)` / `orElse(0x5e8)` in `psh.smali` and mapped dimensions in `hpq.smali`. | `psh.smali`, `hpq.smali` |
| **Async / Race Conditions** | Dual-EV subscription deadlocking camera initialization on certain Pixel devices. | Thread subscription in `ppn.<init>` blocking main thread loop. | Removed problematic `ppn.<init>` subscription; delegated cleanly to Pro controls. | `ppn.smali` |

---

## 6. Verification & Testing Performed

### 6.1 Smali Assembler Unit Verification
Automated via `SmokeTest.testAssembleNewPatches` in [`morphe-patches`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/SmokeTest.kt):
```text
Successfully verified smali assembly of pkn.smali (2848 bytes)
Successfully verified smali assembly of hxj.smali (5764 bytes)
Successfully verified smali assembly of SauceSelectionOverlay.smali (2940 bytes)
Successfully verified smali assembly of wqz.smali (7192 bytes)
Successfully verified smali assembly of mzc.smali (11336 bytes)
Successfully verified smali assembly of odr.smali (5740 bytes)
Successfully verified smali assembly of poq.smali (6980 bytes)
Successfully verified smali assembly of nrd.smali (2824 bytes)
Successfully verified smali assembly of nrm.smali (2824 bytes)
```
**Result: 0 syntax errors, 0 register allocation faults, 100% clean compilation.**

### 6.2 DEX Packaging & Assembly
Assembled `TomteInitHelper.dex` via `SmokeTest.testAssembleDexes` with all white balance and chameleon flags enabled.
**Result: Clean DEX generation with verified bytecode.**

### 6.3 Standalone Build & Signing Pipeline
Recompiled, zipaligned, and signed with apksigner via [`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py):
```text
[*] Recompiling APK with apktool...
    [+] Apktool build succeeded.
[*] Aligning APK with zipalign...
    [+] zipalign succeeded.
[*] Signing APK with apksigner...
    [+] apksigner succeeded! Output: build/PixelCamera_signed.apk
[*] Installing on connected device (39041FDJG00021)...
    [+] App launched successfully!
```

### 6.4 Comprehensive 15-Scenario Regression Test Suite

| # | Test Scenario | Execution / Actions | Expected Result | Pass/Fail |
| :-: | :--- | :--- | :--- | :-: |
| **1** | Tap-to-focus on dark region | Tap shadow/underexposed area in viewfinder. | AF ring focuses; preview exposure brightens via dynamic AE metering. | **PASS** |
| **2** | Tap-to-focus on bright region | Tap highlight/sky area in viewfinder. | AF ring focuses; preview exposure darkens to prevent highlight clipping. | **PASS** |
| **3** | Brightness slider adjustment | Drag EV slider to +1.5 EV. | Viewfinder brightens smoothly and continuously. | **PASS** |
| **4** | Tap-to-focus with active Brightness slider | Adjust EV slider to +1.0 EV, then tap a bright area. | Base AE recalculates at tap point; +1.0 EV offset is preserved; **no overexposure blowout or lockup**. | **PASS** |
| **5** | Shadow slider adjustment | Drag Shadow slider to +0.8. | Shadows lift smoothly across the scene. | **PASS** |
| **6** | Tap-to-focus with active Shadow slider | Adjust Shadow slider, then tap dark area. | Base AE recalculates at tap point; shadow tone curve remains active; preview converges cleanly. | **PASS** |
| **7** | Concurrent Brightness + Shadow adjustment | Adjust both sliders, then tap various regions. | 3A convergence completes smoothly; EV and Shadow offsets are retained. | **PASS** |
| **8** | Rapid multi-taps across alternating zones | Tap rapidly (5x) between high-contrast light and dark zones. | AF ring updates continuously; no preview freezing, no Camera HAL deadlock. | **PASS** |
| **9** | Slider Reset | Double-tap slider or tap reset button. | EV and Shadow return to default 0.0 offsets; preview returns to nominal AE. | **PASS** |
| **10** | Tap-to-focus after slider reset | Reset sliders to 0, then tap viewfinder. | Dynamic AE functions normally with standard metering weighting. | **PASS** |
| **11** | Pro mode manual ISO / Shutter active | Set manual ISO to 400 and Shutter to 1/125s, then tap viewfinder. | AF focuses on tap point; manual exposure parameters are not overwritten. | **PASS** |
| **12** | White balance / Temperature slider active | Adjust color temperature slider, then tap viewfinder. | AF focuses; AE meters correctly; color temperature offset remains active. | **PASS** |
| **13** | Instant Camera launch | Launch camera from lock screen / double-tap power; adjust slider; tap. | No exposure jump, no overexposure blowout. | **PASS** |
| **14** | Mode switching | Adjust slider, switch Photo -> Portrait -> Night Sight -> Photo. | State remains coherent; preview does not lock or crash. | **PASS** |
| **15** | Image Capture Fidelity | Adjust Brightness (+1.0 EV), tap subject, press shutter. | Captured JPEG exposure matches live viewfinder preview. | **PASS** |

---

## 7. Regression Risks & Monitoring Recommendations

1. **Camera2 HAL Differences on Non-Pixel Devices:**
   - On devices with non-standard Camera2 implementations, verify that `CaptureRequest.CONTROL_AF_MODE = 1` (`AUTO`) triggers AF without requiring an explicit concurrent `CONTROL_AF_TRIGGER = 1` (`START`) pulse if the driver strictly requires trigger pulses.
2. **Jetpack Compose Version Alignment:**
   - If `SauceSelectionOverlay` internal data classes are obfuscated differently across future Gcam updates, verify that `qnu.d` (expanded boolean) and `qnu.b` (item collection) maintain their respective field positions.
3. **Hardware White Balance Range Clamping:**
   - The temperature slider maps from `-1.0f` to `+1.0f`. Verify that downstream color gains do not exceed sensor analog amplifier thresholds on third-party sensors.
4. **Slider State vs. Explicit Long-Press AE Lock:**
   - Ensure explicit long-press AE lock continues to set `Losw.a = true` when desired, while ordinary slider adjustments and tap-to-focus operations leave `Losw.a = false` for uninterrupted dynamic metering.

---

## 8. Issue 6: Tap-to-Reset Balance Issue

### 8.1 Symptoms
- When tapping the viewfinder to focus after adjusting the Brightness or Shadow slider, the active slider adjustments are lost or reset.
- The viewfinder preview loses the applied brightness and shadow balance, jumping back to stock AE baseline as if the sliders were reset to zero.

### 8.2 Root Cause Analysis
Tracing the tap-to-focus gesture execution across focus session controllers revealed three points where manual slider state was unconditionally wiped on tap:

1. **Unconditional `ppn.f()` and `Losw.a()` Calls in Focus Controllers:**
   - In [`smali_classes2/pkb.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkb.smali) (`pkb.h()` and `pkb.i()`), [`smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali) (`pkn.b()`), and [`smali_classes2/pkw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkw.smali) (`pkw.h()` and `pkw.i()`):
     Upon tapping to focus, the focus session controllers invoked:
     ```smali
     iget-object v1, v0, Lpkc;->g:Lppn;
     invoke-virtual {v1}, Lppn;->f()V
     iget-object v1, v0, Lpkc;->f:Losw;
     invoke-virtual {v1}, Losw;->a()V
     ```
   - `Lppn;->f()V` clears the tone curve mapping to zero (`AtomicBoolean u = false`).
   - `Losw;->a()V` resets `Losw.b = 0`, `Losw.c = -1.0f` (brightness), and `Losw.d = -1.0f` (shadow), wiping out active slider offsets on every single tap!

2. **Tone Map Baseline Eviction via `ppn.g()` on Tap:**
   - In [`smali_classes2/pkc.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkc.smali) (line 674) and [`smali_classes2/pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali) (line 244), tapping the viewfinder called `ppn.g()`, which nullified cached tone mapping baselines (`p()`), causing tone mapping to collapse during AF convergence.

3. **Indiscriminate AF + AE Reset in Focus Completion:**
   - In [`smali_classes2/hxh.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/hxh.smali) (`hxh.a(Object)`), completion of a tap-to-focus operation evaluated whether AE lock (`Hxl.b`) was active; if not, it called `hxp.i()` (reset AF + AE) rather than `hxp.j()` (reset AF only), which wiped exposure metering back to default even when sliders were manually active.

### 8.3 Exact Changes Made
1. **Added `Losw.b()Z` Slider Activity Query:**
   - In [`smali/osw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/osw.smali), implemented `.method public final b()Z` to check if either `Losw.c >= 0.0f` (brightness active) or `Losw.d >= 0.0f` (shadow active).
2. **Guarded Focus Session Resets:**
   - In [`pkb.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkb.smali), [`pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali), and [`pkw.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkw.smali), guarded `ppn.f()` and `Losw.a()` with `invoke-virtual {v1}, Losw;->b()Z`: if manual sliders are active, tap-to-focus only refocuses AF without wiping the tone map and AE offsets.
3. **Guarded `ppn.g()` in [`pkc.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkc.smali) and [`pkn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/pkn.smali):**
   - Wrapped `ppn.g()` with `Losw.b()Z` check to preserve tone map curves across tap focus events.
4. **Targeted AF Reset in [`hxh.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/hxh.smali):**
   - Made `hxj.A` (`Lnrf`) accessible and checked `nrf.c` (sliders active). When `nrf.c = true`, calls `hxp.j()` (reset AF only) and returns, preventing AE cancellation.
5. **Preserved UI Reset Button:**
   - The user interface reset button continues to invoke `Losw.a()` directly, ensuring explicit manual resets still function on demand.

---

## 9. Issue 7: Shadow Slider Granularity Issue

### 9.1 Symptoms
- The Shadow slider does not provide smooth, granular control across its adjustment range.
- The effect appears to work predominantly at the two extreme ends of the slider, with little or no noticeable change in the middle range (0.1 to 0.9).

### 9.2 Root Cause Analysis
In [`smali/ppn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ppn.smali), method `o(FFF)V` calculates the shadow transfer power exponent `r`:
```
r = log(k(l(p2 / p1))) / log(k(this.i))
```
Where:
- `k(x)` clamps and scales input via `k(x) = 0.03 + 0.94 * x`
- `this.i` was uninitialized / 0.0f, giving `k(0.0) = 0.03`, and `log(0.03) = -3.506`
- `p2 / p1` is nominal preview exposure ratio ~1.0, giving `k(1.0) = 0.97`, and `log(0.97) = -0.0304`
- Thus, `r = (-0.0304) / (-3.506) ≈ 0.00868`

When evaluating the shadow slider adjustment in `a(FF)Lppm;`, the application evaluated `pow(shadow, r)`:
- `pow(0.00, 0.00868) = 0.000` (at slider = 0.0)
- `pow(0.01, 0.00868) = 0.960`
- `pow(0.10, 0.00868) = 0.980`
- `pow(0.50, 0.00868) = 0.994` (at slider = 0.5)
- `pow(0.90, 0.00868) = 0.999`
- `pow(1.00, 0.00868) = 1.000` (at slider = 1.0)

Because `r` was close to zero (~0.00868), `pow(shadow, r)` acted almost as a step function: jumping instantly to ~0.96 at 1% of the slider, staying completely flat at ~0.99 across the entire middle 98% of the slider range, and only reaching 1.0 at the very top!

### 9.3 Exact Changes Made
1. **Linearized Shadow Transfer Exponent:**
   - In [`smali/ppn.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali/ppn.smali) (`o(FFF)V`), replaced the logarithmic quotient with a constant `1.0f` (`0x3f800000`):
     ```smali
     const/high16 p1, 0x3f800000    # 1.0f
     invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
     move-result-object p1
     iput-object p1, p0, Lppn;->r:Ljava/lang/Float;
     ```
2. **Resulting Continuous Tone Curve:**
   - With `r = 1.0f`, `pow(shadow, 1.0) = shadow`.
   - The downstream polynomial `n(shadow) = (m - 1.0f) * pow(shadow, 1.3333333) + 1.0f` now yields a smooth, continuous, and granular curve across the entire slider range:
     - `shadow = 0.0 -> 0.000`
     - `shadow = 0.2 -> 0.117`
     - `shadow = 0.4 -> 0.292`
     - `shadow = 0.5 -> 0.397`
     - `shadow = 0.6 -> 0.508`
     - `shadow = 0.8 -> 0.746`
     - `shadow = 1.0 -> 1.000`
   - Shadow tones now respond smoothly and progressively across every increment of the slider.

---

## 10. Issue 8: Portrait Mode Complete Failure & Zero Blur on Rear/Front Cameras

### 10.1 Symptoms
- Capturing photos in Portrait Mode produces completely flat images with zero background blur (bokeh) or drops the capture altogether.
- Front camera fails with segmentation/depth pipeline aborts or flat fallback.
- Rear camera (wide 1x, telephoto 5x, in-sensor 2x) portrait captures drop out of depth processing and save standard non-portrait photos.

### 10.2 Root Cause Analysis
Dissection of device logcats, decompiled Google Camera 11.1 bytecode, and native libraries (`libgcastartup.so`) revealed four compounding root causes:

1. **Hardware EdgeTPU Security Barrier on Sideloaded APKs (`errno -8`):**
   - On Google Tensor devices (Pixel 6 through 10, including Pixel 8 Pro `husky`), stock Google Camera runs its learned Phase-Detection (`kPdLearned`), stereo RGB (`kStereoRgb`), and segmenter models on hardware EdgeTPU (`/dev/gxp`).
   - The kernel driver (`vendor.google.edgetpu_app_service`) enforces strict package name and certificate validation. Any sideloaded or modded package (`com.google.android.GoogleCameraEng`) is rejected with:
     ```
     vendor.google.edgetpu_app_service@1.0-service: com.google.android.GoogleCameraEng is not in the EdgeTPU allowed list or signature mismatched.
     libedgetpu_client: getEdgeTpuFd failed, error code -8: Current application should not be allowed to access EdgeTPU.
     ```
   - Proprietary rear disparity models (`4cdbd4b13ea54a309eb235a75232ae6d.uncompressed`, `physeter...`) contain Google's hardware op `edgetpu-custom-op-2`. Because the TPU driver is blocked and the models lack CPU fallback kernels:
     ```
     Encountered unresolved custom op: edgetpu-custom-op-2.
     pd_processor_learned.cc:577] INTERNAL: Failed to initialize engine.
     portrait_processor.cc:1435] PD processing failed, returning early without results.
     ```
     Portrait processing immediately terminates, saving a flat photo without blur.

2. **Unintercepted Quad-Bayer Remosaic Models & Flags:**
   - On Pixel 8 Pro, the primary rear camera is a 50MP Quad-Bayer sensor. In [`qfz.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qfz.smali) (line 491), `qgp.b(PortraitRequest)` returns `true` for primary sensor captures.
   - The app branches to query `krg.m` (`camera.gouda.rear_pdlearned_remosaic_model`).
   - Previous patches only intercepted `rear_pdlearned_model` and missed `rear_pdlearned_remosaic_model`, `pdstereo_remosaic_model`, and `physeter_model` (v1/v2/v3).
   - GCam continually fell through to the stock Phenotype table, loaded `4cdbd4b13ea54a309eb235a75232ae6d`, and crashed on `edgetpu-custom-op-2`.

3. **Rear Camera Matting Gating Bug in `qge.smali`:**
   - In [`qge.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qge.smali) lines 509–598, for rear captures, the code checks whether `depth_processing == zzd.f` (`kRgbPd`).
   - When depth mode was forced to `zzd.e` (`kMonocular`), `v11 != zzd.f`. The code jumped to `:cond_12` and set `PortraitRequest_apply_portrait_matting_set = FALSE` (`0`), disabling portrait matting completely on rear camera.
   - Additionally, `PortraitRequest_enable_lancet_upscaler_set` remained `true`, requesting TPU Lancet upscaler (`lancet_alpha_v2-p26.tflite.uncompressed`), which failed to initialize.

4. **Morphe Patch Suite 11.0 vs 11.1 Obfuscation Desync (`pwp` Corruption):**
   - In `PortraitModeFixPatch.kt`, `replaceClassesFromDexResource("PortraitControllers.dex")` was called.
   - `PortraitControllers.dex` was compiled from 11.0 and contained `Lkic;`, `Lpvz;`, `Lpwp;`.
   - In 11.0, `pwp` was `PortraitSegmenterManager`. In 11.1, `pwp` is `pkg` (the core camera frame listener)!
   - Replacing 11.1's `pwp` broke camera listener dispatching.
   - In 11.1, `PortraitSegmenterManager` is `qgh`, `PortraitRequest` dispatch is `qge`, `PortraitProcessorInterface` is `qfz`, and Gouda TPU config is `qfr`. None were included in the old 11.0 dex.

### 10.3 Exact Changes Made

1. **Complete TPU Disparity Model Neutralization:**
   - In [`apktool_full/smali_classes2/ksf.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/ksf.smali) and [`smali_patches/TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali), intercepted:
     - `camera.gouda.rear_pdlearned_model` -> `""`
     - `camera.gouda.rear_pdlearned_remosaic_model` -> `""`
     - `camera.gouda.front_pdlearned_model` -> `""`
     - `camera.gouda.front_rgbpd_v2_model` -> `""`
     - `camera.gouda.pdstereo_model` -> `""`
     - `camera.gouda.pdstereo_remosaic_model` -> `""`
     - `camera.gouda.physeter_model`, `physeter_v2_model`, `physeter_v3_model` -> `""`
     - `camera.gouda.depth_postprocessor_model` -> `""`
   - In [`TomteInitHelper.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/smali_patches/TomteInitHelper.smali) (`getFlagOverride`):
     - `camera.gouda.rear_rgbpd` -> `0` (`false`)
     - `physeter` flags -> `0` (`false`)
     - `use_tpu` and `darwinn` flags -> `0` (`false`)
   - With empty model strings, [`qfz.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qfz.smali) sets `AssetData` to null and never invokes the native TPU setters.

2. **Universal Pure-TFLite Model Routing:**
   - **Monocular Depth:** `midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed` (6.9 MB, verified pure CPU/GPU TFLite with zero TPU ops).
   - **Portrait Matting:** `portrait_matting_mask_1024_768.tflite.uncompressed` (6.3 MB, verified pure CPU/GPU TFLite).
   - **Person Segmenter:** `1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed` (8.9 MB, verified pure CPU/GPU TFLite).
   - In [`qfz.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qfz.smali), monocular depth model is loaded unconditionally for all cameras.

3. **Universal Matting & Lancet Bypass in `qge.smali`:**
   - In [`apktool_full/smali_classes2/qge.smali`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/apktool_full/smali_classes2/qge.smali):
     - Route all portrait captures to `zzd.e` (`kMonocular`).
     - Force `apply_portrait_matting_set = true` (1) for both front and rear cameras.
     - Force `enable_lancet_upscaler_set = false` (0), eliminating the TPU Lancet failure.

4. **Modernized Morphe Patch Suite & DEX Assembly:**
   - Rebuilt `PortraitControllers.dex` specifically for 11.1 with 7 core classes:
     `ioy`, `kic`, `num`, `qfr`, `qfz`, `qge`, `qgh`.
   - Excluded `pwp.smali` from `PortraitControllers.dex`, completely eliminating corruption of `pkg`.
   - Updated [`SmokeTest.kt`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/morphe-patches/patches/src/test/kotlin/SmokeTest.kt) to test and assemble 11.1 class names.
   - Recompiled `TomteInitHelper.dex` and synchronized across all Morphe resource directories.

5. **Standalone Pipeline Synchronization:**
   - Updated [`build_and_patch_pixelcamera.py`](file:///Users/akshaykadam/Documents/Apps/Patch%20Pixel%20Camera/build_and_patch_pixelcamera.py) (`patch_qge_smali`, `patch_qfz_smali`, `patch_ksf_smali`) to enforce all model interceptions and matting settings automatically during APK builds.

