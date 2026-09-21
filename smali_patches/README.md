# Pixel Camera Smali Patches Directory

This directory contains standalone, decompiled Smali bytecode reference implementations for all functional modifications made in the Pixel Camera backport for Google Pixel devices (Pixel 6 through Pixel 10).

---

## Patch Index & Module Overview

| Smali File | Original Class / Component | Purpose & Modifications |
| :--- | :--- | :--- |
| `TomteInitHelper.smali` | Custom Injected Helper | Coordinates Camera Looks state, initializations, and model bindings across capture modes. |
| `nrd.smali` | `nrd` (Brightness Controller) | Upgraded to `qhr`. Adds `rst:Lsmq` reset descriptor, `h()`, `e()` reset implementation, and unified Dual-EV compensation math in `s()`. |
| `nrm.smali` | `nrm` (Shadows Controller) | Upgraded to `qhr`. Adds `rst:Lsmq` reset descriptor, `h()`, `e()` reset implementation, and unified Dual-EV compensation math in `s()`. |
| `nrc.smali` | `nrc` (Bottom Sheet Dispatcher) | Dispatches Pro manual controls bottom-sheet slider events directly to `nrd` and `nrm` without dragging suppression. |
| `pfh.smali` | `pfh` (AE Dispatch Handler) | Bypasses `ppn.i()` abort check in `pswitch_8` so standard Camera2 `CONTROL_AE_EXPOSURE_COMPENSATION` is dispatched live to the camera HAL. |
| `klm.smali` | `klm` (Device Flags Interceptor) | Intercepts `q(Lkiz;)Z` and `x(Lkiz;)Z` for `camera.ark` (Pro Manual Controls: ISO, Shutter, Focus, Peaking) while disabling `camera.ark_lens_selector` on non-telephoto devices. |
| `qaa.smali` | `qaa` (ISO Controller) | Removes `if-nez p2` dragging suppression so ISO adjusts live on the viewfinder in real time. |
| `qbb.smali` | `qbb` (Shutter Speed Controller) | Removes `if-nez p3` dragging suppression so Shutter Speed adjusts live on the viewfinder in real time. |
| `nrn.smali` | `nrn` (Manual Focus Controller) | Removes `if-nez p2` dragging suppression so Focus distance adjusts live on the viewfinder in real time. |
| `mzc.smali` | `mzc` (Controller Binding Factory) | Binds all 4 exposure enum keys (`nqq.h`, `nqq.b`, `nqq.j`, `nqq.i`) to `nrd` and `nrm`. |
| `qhm.smali` | `qhm` (Quick Access Sliders) | Initialises viewfinder quick access list with `[nqq.h, nqq.b]` and bypasses capability verification. |
| `uyv.smali` | `uyv` (Device Eligibility Checker) | Forces `l()Z` to return `true` to enable Camera Looks (Sauce and Tomte) across non-Pixel 11 hardware. |
| `qkp.smali` | `qkp` (Looks Manager Provider) | Forces `b()Lqms;` to return the real Camera Looks manager unconditionally. |
| `qkq.smali` | `qkq` (Looks State Provider) | Forces `b()Lqmb;` to return the real Camera Looks state provider unconditionally. |
| `kid.smali` | `kid` (Creator Suite Feature Gate) | Returns `true` for all Creator Suite tools (Teleprompter, VU Meter, Grid Framing). |
| `kqc.smali` | `kqc` (Project Album Neutralizer) | Hides and neutralizes the broken 'Save to a project' button to prevent crashes on non-stock cloud storage. |

---

## Dual-EV Coordination Algorithm (`nrd.smali` & `nrm.smali`)

Both sliders query their partner's current value and compute a single unified hardware EV step:
$$b_{\text{offset}} = (\text{brightness} - 0.5) \times 24.0$$
$$s_{\text{offset}} = (\text{shadows} - 0.5) \times 12.0$$
$$\text{total\_ev} = \text{clamp}(\text{round}(b_{\text{offset}} + s_{\text{offset}}), -24, 24)$$

The resulting integer is dispatched directly to `CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION` (`osw.b`), which is fully supported by the Pixel 7 camera HAL without vendor key rejection.

---

## Build Integration

These smali files are automatically maintained, injected, and patched by the standalone build script [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py).
