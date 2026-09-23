# Pixel Camera Smali Unified Patches (Patch 1.0.2)

This directory contains standalone standard Unified Diffs (`.patch` / `.diff`) capturing all modifications made to Google Pixel Camera (`11.0.073.972752740.32`).

These patches allow exact git-style tracking and reproducible application onto any clean decompiled APK directory using standard Unix utilities (`patch` or `git apply`).

---

## Patch Catalog

| Patch File | Affected Target | Description & Changes |
| :--- | :--- | :--- |
| [`all_smali_changes.patch`](all_smali_changes.patch) | All 58 Classes | Single cumulative patch applying all modifications in one step. |
| [`zoom_10x_buttons.patch`](zoom_10x_buttons.patch) | `kgy`, `kgx`, `khk`, `kgs`, `kfl`, `kfw`, `hpq` | Discrete 10x Quick Zoom button on viewfinder across Pixel 8 Pro, 9 Pro, 10 Pro, 9 Pro Fold, and dynamic hook in Photo / Night Sight modes. |
| [`looks_exif_callbacks.patch`](looks_exif_callbacks.patch) | `qkj`, `qmy`, `TomteInitHelper` | Sauce EXIF metadata fallback (`TomteInitHelper.getLastSelectedLook()`) and `TomteInitHelper.onLookObjectSelected` callbacks. |
| [`looks_pipeline.patch`](looks_pipeline.patch) | `ioy`, `mla`, `sdo`, `CameraApp` | Looks processing pipeline hooks: catshark bypass in `ioy`, effective look ID application in `mla`, look persistence in `sdo`, and `TomteInitHelper` initialization in `CameraApp`. |
| [`looks_native_engine.patch`](looks_native_engine.patch) | `mia`, `muh`, `mjy`, `mwg`, `kic`, `aaog`, `LasagnaModelLoader`, `pzs`, `qau` | Native Tomte engine initialization, CPU inference fallback in `mwg`, TPU model crash guards, and Sauce overlay forced installation. |
| [`stream_crash_guards.patch`](stream_crash_guards.patch) | `psk`, `psh`, `num`, `tba` | Stream crash guards: telephoto, binned RAW, and Centaur streams. |
| [`sauce_onboarding.patch`](sauce_onboarding.patch) | `isu`, `qlr`, `rmn` | Bypasses onboarding and tutorial dialogs for Camera Looks. |
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
| [`uyv_eligibility.patch`](uyv_eligibility.patch) | `smali/uyv.smali` | Device Eligibility: forces `l()Z` to return `true` to enable Camera Looks across older Pixels. |
| [`qkp_look_manager.patch`](qkp_look_manager.patch) | `smali/qkp.smali` | Real Look Manager provider: returns real `qms` manager unconditionally. |
| [`qkq_look_provider.patch`](qkq_look_provider.patch) | `smali/qkq.smali` | Real Look State provider: returns real `qmb` provider unconditionally. |
| [`kid_creator_suite.patch`](kid_creator_suite.patch) | `smali/kid.smali` | Creator Suite: unlocks Teleprompter, VU Meter, and Grid Framing. |
| [`kqc_project_album.patch`](kqc_project_album.patch) | `smali/kqc.smali` | Project Album: neutralizes 'Save to a project' button to prevent crashes. |
| [`ppn_field_access.patch`](ppn_field_access.patch) | `smali/ppn.smali` | Changes field access of `f:Losw` and `u:AtomicBoolean` to public. |
| [`clone_authority.patch`](clone_authority.patch) | `smali/klh.smali` | SpecialTypesProvider authority synchronization for clone package. |

---

## How to Apply

To apply all modifications to a clean decompiled `apktool` directory:

```bash
# Decompile clean base APK with apktool
apktool d base.apk -o apktool_out

# Apply all unified diffs in one command
cd apktool_out
patch -p1 < /path/to/Patch-Pixel-Camera/patches/all_smali_changes.patch
```
