# Pixel Camera Smali Unified Patches

This directory contains standalone standard Unified Diffs (`.patch` / `.diff`) capturing all modifications made to Google Pixel Camera (`11.0.073.972752740.32`).

These patches allow exact git-style tracking and reproducible application onto any clean decompiled APK directory using standard Unix utilities (`patch` or `git apply`).

---

## Patch Catalog

| Patch File | Affected Target | Description & Changes |
| :--- | :--- | :--- |
| [`all_smali_changes.patch`](all_smali_changes.patch) | All 16 Classes | Single cumulative patch applying all modifications in one step. |
| [`nrd_brightness.patch`](nrd_brightness.patch) | `smali/nrd.smali` | Brightness controller: extends `qhr`, implements `rst:Lsmq`, `h()`, reset method `e()`, and unified Dual-EV hardware calculation in `s()`. |
| [`nrm_shadows.patch`](nrm_shadows.patch) | `smali/nrm.smali` | Shadows controller: extends `qhr`, implements `rst:Lsmq`, `h()`, reset method `e()`, and unified Dual-EV hardware calculation in `s()`. |
| [`nrc_dispatcher.patch`](nrc_dispatcher.patch) | `smali_classes2/nrc.smali` | Pro bottom sheet event listener: delegates `:pswitch_8` and `:pswitch_3` directly to `nrd` and `nrm`. |
| [`pfh_ae_compensation.patch`](pfh_ae_compensation.patch) | `smali_classes2/pfh.smali` | Camera2 direct AE dispatch: bypasses `ppn.i()` abort in `:pswitch_8` so exposure index changes are dispatched via `uoi.r()`. |
| [`klm_feature_flags.patch`](klm_feature_flags.patch) | `smali_classes2/klm.smali` | Feature flag interceptor: enables `camera.ark` (Pro controls: Focus, Shutter, ISO, Peaking) while disabling `camera.ark_lens_selector`. Also overrides Mantis, Gouda max zoom, and Creator flags. |
| [`qaa_iso.patch`](qaa_iso.patch) | `smali/qaa.smali` | Live ISO: removes dragging suppression in `v(IZLsnw;)V`. |
| [`qbb_shutter.patch`](qbb_shutter.patch) | `smali/qbb.smali` | Live Shutter Speed: removes dragging suppression in `v(JZLsnw;)V`. |
| [`nrn_focus.patch`](nrn_focus.patch) | `smali/nrn.smali` | Live Manual Focus: removes dragging suppression in `t(FZLsnw;)V`. |
| [`mzc_controllers.patch`](mzc_controllers.patch) | `smali/mzc.smali` | UI Binding: binds exposure control enum keys (`nqq.h`, `nqq.b`, `nqq.j`, `nqq.i`) to `nrd` and `nrm`. |
| [`qhm_quick_access.patch`](qhm_quick_access.patch) | `smali_classes2/qhm.smali` | Quick Access: initializes shortcut items with `[nqq.h, nqq.b]` and bypasses capability verification. |
| [`uyv_eligibility.patch`](uyv_eligibility.patch) | `smali/uyv.smali` | Device Eligibility: forces `l()Z` to return `true` to enable Camera Looks across older Pixels. |
| [`qkp_look_manager.patch`](qkp_look_manager.patch) | `smali/qkp.smali` | Real Look Manager provider: returns real `qms` manager unconditionally. |
| [`qkq_look_provider.patch`](qkq_look_provider.patch) | `smali/qkq.smali` | Real Look State provider: returns real `qmb` provider unconditionally. |
| [`kid_creator_suite.patch`](kid_creator_suite.patch) | `smali/kid.smali` | Creator Suite: unlocks Teleprompter, VU Meter, and Grid Framing. |
| [`kqc_project_album.patch`](kqc_project_album.patch) | `smali/kqc.smali` | Project Album: neutralizes 'Save to a project' button to prevent crashes. |
| [`ppn_field_access.patch`](ppn_field_access.patch) | `smali/ppn.smali` | Changes field access of `f:Losw` and `u:AtomicBoolean` to public. |

---

## How to Apply

To apply all modifications to a decompiled `apktool` directory:

```bash
# Decompile clean base APK with apktool
apktool d base.apk -o apktool_out

# Apply all unified diffs
cd apktool_out
patch -p1 < /path/to/Patch-Pixel-Camera/patches/all_smali_changes.patch

# Or apply individual patches as needed:
patch -p1 < /path/to/Patch-Pixel-Camera/patches/nrd_brightness.patch
patch -p1 < /path/to/Patch-Pixel-Camera/patches/nrm_shadows.patch
```
