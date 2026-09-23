# Pixel Camera Smali Patches Directory (Patch 1.0.2)

This directory contains standalone, decompiled Smali bytecode reference implementations for all functional modifications made in the Pixel Camera backport for Google Pixel devices (Pixel 6 through Pixel 10).

---

## Patch Index & Module Overview

| Category | Smali Files | Purpose & Modifications |
| :--- | :--- | :--- |
| **Injected Classes** | `TomteInitHelper.smali`, `LasagnaModelLoader.smali`, `TomtePreviewRenderer.smali` | Custom helpers for Tomte look state management, active Look ID tracking, fallback EXIF metadata generation, lasagna loader bypass, and preview rendering. |
| **10x Quick Zoom** | `kgy.smali`, `kgx.smali`, `khk.smali`, `kgs.smali`, `kfl.smali`, `kfw.smali`, `hpq.smali` | Dedicated 10x quick zoom presets for Pixel 8 Pro, 9 Pro, 10 Pro, 9 Pro Fold; dynamic button generation in `kfl`; mode row toggle in `kfw`; zoom ceiling override in `hpq`. |
| **Camera Looks Pipeline & EXIF** | `qmy.smali`, `qkj.smali`, `ioy.smali`, `mla.smali`, `sdo.smali`, `CameraApp.smali` | Sauce EXIF metadata fallback via `TomteInitHelper.getLastSelectedLook()`; `onLookObjectSelected` callbacks; catshark bypass in `ioy` for all photo modes; mode change retention in `sdo`. |
| **Camera Looks Native Engine & Guards** | `mia.smali`, `muh.smali`, `mjy.smali`, `mwg.smali`, `kic.smali`, `aaog.smali`, `pzs.smali`, `qau.smali`, `uyv.smali`, `qkp.smali`, `qkq.smali` | Native Tomte model initialization; CPU inference enforcement in `mwg` to avoid OpenCL crashes; TPU crash nulling; overlay and eligibility bypasses. |
| **Stream Stability Guards** | `psk.smali`, `psh.smali`, `num.smali`, `tba.smali` | Guard telephoto streams, RAW binned stream depth, and Centaur/Boba Jelly. |
| **Sauce Onboarding & Tutorials** | `isu.smali`, `qlr.smali`, `rmn.smali` | Disables onboarding popups and tutorial overlays that interrupt Camera Looks usage. |
| **Pro Controls (Live Sliders & EV)** | `nrd.smali`, `nrm.smali`, `nrc.smali`, `pfh.smali`, `ppn.smali`, `mzc.smali`, `qaa.smali`, `qbb.smali`, `nrn.smali`, `klm.smali`, `nrh.smali`, `nre.smali` | Full Dual-EV coordination in `nrd`/`nrm`; live dragging in `qaa` (ISO), `qbb` (Shutter), `nrn` (Focus); event listener delegation in `nrc`; Camera2 direct AE dispatch in `pfh`; flag interception in `klm`. |
| **Quick Access Shortcuts** | `qhm.smali`, `nqj.smali`, `nqp.smali` | Initializes viewfinder shortcuts with `[nqq.h, nqq.b]` and bypasses capability verification. |
| **Creator Suite** | `kid.smali`, `kqc.smali` | Unlocks Teleprompter HUD (Biotite), Audio VU Meter (Mica), Framing Guides (Slate); neutralizes 'Save to a project' crash. |
| **Non-Root Clone** | `klh.smali` | Updates `SpecialTypesProvider` authority to match cloned package name. |

---

## Dual-EV Coordination Algorithm (`nrd.smali` & `nrm.smali`)

Both sliders query their partner's current value and compute a single unified hardware EV step:
$$b_{\text{offset}} = (\text{brightness} - 0.5) \times 24.0$$
$$s_{\text{offset}} = (\text{shadows} - 0.5) \times 12.0$$
$$\text{total\_ev} = \text{clamp}(\text{round}(b_{\text{offset}} + s_{\text{offset}}), -24, 24)$$

The resulting integer is dispatched directly to `CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION` (`osw.b`), which is fully supported by the Pixel 7/8/9/10 camera HAL without vendor key rejection.

---

## Build Integration

These smali files are automatically maintained, injected, and patched by the standalone build script [`build_and_patch_pixelcamera.py`](../build_and_patch_pixelcamera.py).
