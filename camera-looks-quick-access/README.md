# Camera Looks Quick Access Shortcut Investigation

This repository contains the reverse-engineering analysis, compatibility assessment, and working patch implementations to unlock the **Camera Looks Quick Access shortcut** from Pixel Camera `11.0.073.972752740.32` on older Google Pixel smartphones (Pixel 6 through Pixel 10 Pro XL).

---

## Direct Answer to the Final Question

> **Question:** *Is the Pixel 11 Camera Looks Quick Access shortcut already implemented in the Camera app and merely software-gated on older Pixel phones, and can that shortcut be unlocked with a minimal patch?*

### **YES.**
1. **Fully Implemented in Java/Compose**: The Quick Access controls framework, slot assignment configuration UI, the Looks shortcut entry (`nqq.TOMTE_SELECTION`, ID `26`), the viewfinder ViewStub, the discrete 10-tick vertical slider (`qmn.java`), and the Looks preset switcher (`qmy.java`) are **100% complete and present** within the Dalvik bytecode of Pixel Camera `11.0.073.972752740.32`.
2. **Merely Software-Gated**: The shortcut is concealed from older Pixel devices exclusively through two software flags:
   * **`camera.quick_access_customization_enabled` (`kkh.b`)**: Initialized to `false`, only set to `true` on Pixel 11 (`uyv.g()`). When `false`, the Compose Settings UI suppresses the Left/Right customization slots.
   * **Master Predicate (`qau 19`)**: Supplier for `camera.sauce_eligible` (`kjq.bm`) & `camera.sauce_enabled` (`kjq.bl`). When `false`, `pie.java` strips "Looks" from the candidate shortcuts map.
3. **Zero Hardware Dependencies**: The entire Quick Access shortcut interface (tap gesture, vertical tick slider, haptics, slot reordering, preference persistence) executes entirely in Android user space without requiring Tensor G6 or Pixel 11 camera hardware.
4. **Unlocked with a Minimal Patch**: Overriding a single method—`klm.q(kiz)` or `uyv.g()`—instantly unlocks the complete feature on older Pixels. Tested and verified on physical hardware (**Pixel 8 Pro** / `husky` on Android 17).

---

## Directory Structure & Deliverables

```text
camera-looks-quick-access/
├── README.md               # Executive summary and final verdict (this file)
├── RESEARCH.md             # In-depth reverse-engineering technical documentation
└── COMPATIBILITY.md        # Generation-by-generation device compatibility matrix
```

> [!NOTE]
> The official bytecode patch implementation for Viewfinder Quick Access is located in [`morphe-patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt`](../morphe-patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt).


---

## Key Technical Findings

| Component | Technical Implementation | Gated Behavior | Unlocked Behavior |
| :--- | :--- | :--- | :--- |
| **Settings Subscreen** | `qvb.java` (Fragment) hosting `ComposeView` with `qvl.a()` | Only master switch shown; slots hidden | Displays **Left** (2 slots), **Right** (2 slots), and **Available** sections |
| **Looks Shortcut** | `pie.java` registering `nqq.A` (`TOMTE_SELECTION`, ID `26`) | Excluded from shortcut candidate map | Visible with name `"Looks"` (`0x7f130981`) and theme palette icon (`0x7f0802d5`) |
| **Persistence** | `qsy.java` storing integers in standard Android `SharedPreferences` | Defaulted to `-1` or fallback | Persists assigned IDs (`bI`, `bJ`, `bK`, `bL`) across app restarts and reboots |
| **Viewfinder Gesture** | `rsf.java` / `qhp.e()` -> ViewStub `id/quick_access_controls_stub` | Loads fixed exposure/brightness sliders | Inflates assigned custom shortcuts on Left and Right screen margins |
| **Looks Slider & Switcher** | `qmn.java` (discrete 10-tick slider) calling `qmy.c(qlhVar)` | Hidden / Inactive | Tapping or dragging cycles presets (Original, Minimal, Contrast, Warmth, etc.) |

---

## Physical Device Verification (Pixel 8 Pro / `husky`)

The patch was deployed to an unrooted Google Pixel 8 Pro (`husky`) running Android 17 preview with the target reference Camera APK (`com.google.android.GoogleCameraEng`, version code `69623294`).

### Test Results
1. **Settings Navigation**: Navigated to **Settings → Fast access → Quick access controls** (`CameraGm3SettingsActivity`).
2. **Customization Panel**: The UI populated with:
   * Master Toggle: **Turn on Quick access controls**
   * **Left**: White balance, **Looks**
   * **Right**: Brightness, Shadows
   * **Available**: Focus, Shutter speed, ISO
3. **Slot Assignment**: Assigned **Looks** to the Left shortcut position.
4. **Viewfinder Activation**: Tapped the camera viewfinder (`activity.main.CameraActivity`).
5. **Shortcut Rendering**: The vertical Looks shortcut icon (`gs_colors_vd_theme_24`) rendered cleanly on the left margin below the White Balance slider.
6. **Looks Drawer & Switching**: Tapping the Looks Quick Access shortcut opened the bottom manual controls drawer and carousel, immediately displaying the active preset (**Minimal**) and allowing real-time switching between all Looks.
7. **Cold Restart Persistence**: Force-stopped the process via `am force-stop` and relaunched; the Looks shortcut configuration, active Look selection, and viewfinder controls persisted without loss.

---

## Official Morphe Patch

The bytecode transformations required for Quick Access controls are encapsulated in:
* **Patch Source**: [`QuickAccessPatch.kt`](../morphe-patches/src/main/kotlin/app/morphe/patches/pixelcamera/quickaccess/QuickAccessPatch.kt)
* **Installation**: Apply via Morphe Manager (Android) or Morphe Desktop (PC) following the [root README](../README.md#-installation-guide).
