# Technical Research: Camera Looks Quick Access Shortcut on Older Pixel Phones

**Reference App**: Pixel Camera `11.0.073.972752740.32` (`com.google.android.GoogleCamera`, version code `69623294`).  
**Focus**: Camera Looks Quick Access shortcut & gesture mechanism across older Pixel devices.

---

## Executive Summary

Reverse-engineering Pixel Camera 11.0 reveals that the **Quick Access Controls** framework and the **Camera Looks Quick Access shortcut** (`nqq.TOMTE_SELECTION`, ID `26`) are **completely present** within the APK binaries (`classes.dex` and `classes2.dex`). They are not missing, not dynamic downloads, and not dependent on Pixel 11 hardware co-processors.

The feature is suppressed on older Pixel devices (Pixel 6 through Pixel 10) solely through a two-tiered software gating hierarchy:
1. **Customization Gate**: Feature flag `camera.quick_access_customization_enabled` (`kkh.b`) is initialized to `false` and only set to `true` on Pixel 11 (`uyv.g()`). When `false`, the Settings UI conceals the Left/Right shortcut configuration slots, and the viewfinder falls back to hardcoded exposure/brightness sliders.
2. **Looks Shortcut Gate**: Master predicate `qau.java` (Case 19) checks `camera.sauce_eligible` (`kjq.bm`) and `camera.sauce_enabled` (`kjq.bl`). On older devices, both evaluate to `false`. When `false`, `pie.java` excludes "Looks" from the candidate shortcuts list, `qkr.java` drops the shortcut controller, and `qkp.java` supplies a dummy no-op.

By toggling these flags (via an LSPosed runtime hook or a minimal bytecode patch), the complete Quick Access interface is exposed on older Pixel devices:
* The Settings subscreen displays **Left** and **Right** shortcut slots alongside an **Available** shortcuts panel.
* **Looks** appears as an assignable camera shortcut (with its Material theme palette icon).
* The user can assign Looks to either the Left or Right position.
* Tapping the camera viewfinder exposes the discrete tick slider on the chosen side, enabling immediate switching across all Camera Looks presets in real time.

---

## 1. Quick Access Settings Implementation

The Quick Access controls settings UI is built using Jetpack Compose and embedded into the Camera preferences hierarchy.

### A. Preference Hierarchy & Navigation
* **XML Declaration**: `res/xml/camera_gm3_preferences.xml`
  * Preference Category: `pref_category_fast_access` (`@string/fast_access`, ID `0x7f130282`)
  * Preference Item: `pref_quick_access_controls_key` (`@string/pref_quick_access_controls`, ID `0x7f13076c`), icon `@drawable/gs_instant_mix_vd_theme_24`.
* **Activity & Navigation**:
  * Root Activity: `com.google.android.apps.camera.settings.activity.CameraGm3SettingsActivity`
  * Preference Fragment: `qva.java` (extends `quu.java`).
  * Subscreen Mapping: In `qva.java` (line 31), `qsy.br.a` (`"pref_quick_access_controls_key"`) is mapped via dispatch table `ak` to `new kdn(10)` -> `new qvb()`.
  * Direct intent launch: Passing intent extra `pref_open_setting_page = "pref_quick_access_controls_key"` opens this subscreen directly.

### B. Compose UI Architecture (`qvb.java`, `quz.java`, `qvl.java`, `qvg.java`)
* **Fragment Host (`qvb.java`)**:
  Extends `qus.java`. Its `F()` method inflates a `ComposeView` loading composable:
  ```java
  composeView.b(new cfd(-1805814883, true, new quz(this, 2)));
  ```
* **State Bridge (`quz.java`, Case 2)**:
  Retrieves the Quick Access State Controller `pig` (implemented by `pie.java`) and extracts:
  1. `piiVar`: The active UI state flow containing slot assignments and available items.
  2. `zQ = ((klm) qusVar.b().a().k).q(kkh.b)`: Queries `camera.quick_access_customization_enabled`.
  Dispatches to composable `qvl.a(piiVar, zQ, adgiVar, adgnVar, bxbVar, 0)`.
* **UI Composable (`qvg.java` / `qvf.smali`)**:
  * **Top Switch**: Always renders `"quick_access_controls_switch"` (`@string/pref_quick_access_controls_toggle_title`), bound to `pii.c` and persisted in `qsy.br` (`pref_quick_access_controls_key`).
  * **Customization Container (`if (z3)`)**: `z3` is `zQ` (`kkh.b`).
    * When `z3 == false` (stock behavior on older Pixels): The conditional block terminates early. Only the top toggle is shown; all slot configuration is hidden.
    * When `z3 == true` (Pixel 11 or patched): Renders:
      1. Left Slots Container: `qvl.K(..., @string/pref_quick_access_controls_left_title, [pif.a, pif.b])`.
      2. Right Slots Container: `qvl.K(..., @string/pref_quick_access_controls_right_title, [pif.c, pif.d])`.
      3. Available Items Container: `qvl.J(...)` showing all unassigned candidate shortcuts for dragging or reordering.

### C. State Persistence Keys (`qsy.java`)
All configuration is persisted to standard Android `SharedPreferences`:

| Preference Key | Field in `qsy.java` | Type | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| `pref_quick_access_controls_key` | `qsy.br` | `Boolean` | `false` | Master toggle: whether quick access sliders display on viewfinder tap |
| `pref_quick_access_slots_initialized` | `qsy.bH` | `Boolean` | `false` | First-run flag: triggers default slot population if false |
| `pref_quick_access_slot_left_1_id` | `qsy.bI` | `Integer` | `-1` | Control assigned to Left Slot 1 (`pif.a`) |
| `pref_quick_access_slot_left_2_id` | `qsy.bJ` | `Integer` | `-1` | Control assigned to Left Slot 2 (`pif.b`) |
| `pref_quick_access_slot_right_1_id` | `qsy.bK` | `Integer` | `-1` | Control assigned to Right Slot 1 (`pif.c`) |
| `pref_quick_access_slot_right_2_id` | `qsy.bL` | `Integer` | `-1` | Control assigned to Right Slot 2 (`pif.d`) |

---

## 2. Looks Shortcut Implementation & Registration

### A. Candidate Shortcuts Map (`pie.java`)
In `pie.java` (lines 22–34), all possible quick access shortcut types are statically declared:

```java
nqq nqqVar = nqq.c;   // WHITEBALANCE (ID 2)
nqq nqqVar2 = nqq.m;  // EXPOSURE (ID 12)
nqq nqqVar3 = nqq.i;  // BRIGHTNESS_BIAS (ID 8)
nqq nqqVar4 = nqq.j;  // EVC (ID 9)
nqq nqqVar5 = nqq.h;  // BRIGHTNESS (ID 7)
nqq nqqVar6 = nqq.b;  // SHADOWS (ID 1)
nqq nqqVar7 = nqq.e;  // FOCUS (ID 4)
nqq nqqVar8 = nqq.d;  // SHUTTER_SPEED (ID 3)
nqq nqqVar9 = nqq.f;  // DETAIL_NOISE (ID 5)
nqq nqqVar10 = nqq.A; // TOMTE_SELECTION (ID 26) -> Looks
```

The definition for `nqq.A` (`TOMTE_SELECTION`) is registered as:
```java
new adcd(nqqVar10, new pih(nqqVar10, 2131954049, 2131231445))
```
* String ID `2131954049` (`0x7f130981`): `R.string.styles` → `"Looks"`.
* Drawable ID `2131231445` (`0x7f0802d5`): `R.drawable.gs_colors_vd_theme_24` → Theme palette icon.

### B. Conditional Addition to Candidates
In `pie.java` constructor:
```java
Boolean bool = (Boolean) adht.h(optional);
boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
...
if (zBooleanValue) {
    Object obj10 = map.get(nqq.A);
    obj10.getClass();
    arrayList.add(obj10);
}
```
* `optional` is supplied by Dagger provider `pjd.java` (Case 1) ← `imi.go` ← `new inh(accb.c(new qau(this.p, 19)))`.
* `qau.java` Case 19 evaluates:
  ```java
  if (klmVar.q(kjq.bm) && klmVar.q(kjq.bl)) {
      z = true;
  }
  return Boolean.valueOf(z);
  ```
  Where `kjq.bm` is `camera.sauce_eligible` and `kjq.bl` is `camera.sauce_enabled`.
* **Result**: If `zBooleanValue` is `false`, `nqq.A` is never added to `arrayList`. The Looks option is absent from the candidate pool.

### C. Default Slot Assignment & User Customization
* **Initial Assignment**: When `pref_quick_access_slots_initialized` is `false`:
  ```java
  if (zBooleanValue) {
      linkedHashMap2.put(pif.b, a.get(nqq.A)); // Defaults Looks to LEFT_2
  }
  ```
  Looks is assigned by default to Left Slot 2 (`pif.b`).
* **Slot Reassignment (`pie.b(...)`)**:
  When the user drags "Looks" into any slot (`LEFT_1`, `LEFT_2`, `RIGHT_1`, or `RIGHT_2`), `pie.b(...)` updates the target slot in `linkedHashMap`, removes it from the source, and persists `nqq.A.B` (`26`) into the respective slot preference.

---

## 3. Camera Interface & Gesture Interaction Pipeline

The shortcut interaction does not merely launch the Camera Looks carousel; it connects a discrete multi-tick slider directly to the viewfinder.

### A. Interaction Flow Diagram

```text
┌─────────────────────────────────────────────────────────────────┐
│ User Taps Viewfinder (Focus/Exposure Tap)                       │
└────────────────────────────────┬────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│ Touch Listener: rsf.java / rsh.java                             │
│ - Checks pref_quick_access_controls_key == true                 │
│ - Dispatches to rodVar.f (qhm.g(2500ms))                        │
└────────────────────────────────┬────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│ Quick Access Manager: qhm.java                                  │
│ - Inflates id/quick_access_controls_stub (QuickAccessControls)   │
│ - Checks if (this.C.q(kkh.b) && sqlVar.f())                     │
│   ├── If TRUE: Reads slot prefs (bI, bJ, bK, bL)                │
│   │   └── Resolves ID 26 -> nqq.TOMTE_SELECTION                 │
│   └── Builds yehVarM (Left controls) & yehVarM2 (Right controls)│
└────────────────────────────────┬────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│ Manual Control Registry: qkr.java                               │
│ - Instantiates nqr for nqq.TOMTE_SELECTION                      │
│ - Links to slider controller qmn.java                           │
└────────────────────────────────┬────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│ Slider Controller: qmn.java                                     │
│ - smv.B() creates discrete ticks for 10 Look presets            │
│ - User drags or taps slider -> qmn.s(f, true, ...)              │
│ - Resolves Look: qlhVar = (qlh) listR.get(i)                    │
│ - Calls ((qkp) this.d).a().c(qlhVar) -> qmy.c(qlhVar)           │
│ - Displays Look name HUD: this.f.a(LookName)                    │
└────────────────────────────────┬────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────┐
│ State Manager: qmy.java                                         │
│ - Updates active Look state flow                                │
│ - Writes to rex.x for capture dispatch & EXIF metadata          │
└─────────────────────────────────────────────────────────────────┘
```

### B. Viewfinder Controller (`qhm.java`)
In `qhm.java` lines 278–298:
```java
if (this.z == null) {
    this.z = ((ViewStub) this.D.d(2131362860)).inflate(); // quick_access_controls_stub
}
sql sqlVar = (sql) this.b.d();
if (this.C.q(kkh.b) && sqlVar.f()) {
    listC2 = aaax.C(new nqq[]{j(qtoVar), j(qtoVar2)}); // Left slots: bI, bJ
    listC = aaax.C(new nqq[]{j(qtoVar3), j(qtoVar4)});  // Right slots: bK, bL
} else {
    listC = ughVar.d() == ljz.a ? o : n; // Fallback hardcoded exposure/brightness
    listC2 = list;
}
yeh yehVarM = m(listC2, true);   // Build Left UI models
yeh yehVarM2 = m(listC, false);  // Build Right UI models
```
* If `kkh.b` is `true`, `qhm` loads the configured slot IDs from preferences.
* When ID `26` is found on either Left or Right, it fetches `nqr` for `nqq.TOMTE_SELECTION` from `qkr.java`.

### C. The Looks Slider Controller (`qmn.java`)
`qmn.java` extends `qhr` (slider control):
1. **Discrete Preset Ticks (`B()`)**:
   ```java
   int iG = adhc.g(r().size() + 1, 1);
   return new smv(iG, aaax.bK(adhc.n(0, iG)), this.e.getDimension(2131167601), ...);
   ```
   Generates a discrete tick for each of the 10 Look presets:
   `Original (0)`, `Natural (1)`, `Shadows (2)`, `Vanilla (3)`, `Editorial (4)`, `Velvet (5)`, `Classic (6)`, `Digi (7)`, `Black Tie (8)`, `Minimal (9)`.
2. **Gesture Interaction & Look Selection (`s(...)`)**:
   When the user slides or taps a tick:
   ```java
   int size = listR.size();
   int i = adhc.i(adia.s(f * size), 0, size);
   if (i == size) {
       qlhVar = ((qnq) ((qkp) this.d).a().a().c()).b; // default look
       string = this.e.getString(2131953713);
   } else {
       qlhVar = (qlh) listR.get(i);
       string = this.e.getString(qkj.O(qlhVar)); // localized name: "Velvet", etc.
   }
   ((qkp) this.d).a().c(qlhVar);
   this.f.a(string);
   ```
   * It maps the slider touch position directly to the corresponding Look preset.
   * Invokes `qmy.c(qlhVar)` to update the active camera look immediately.
   * Sets the HUD indicator string to the localized name of the selected look.

---

## 4. Gating Mechanisms Summary

| Gate | Class / Identifier | Condition in Unpatched Code | Effect on Older Pixels |
| :--- | :--- | :--- | :--- |
| **Gate 1: Device Whitelist** | `uyv.l()` & `uyv.g()` | Evaluates `false` for Pixel 1–10 (blacklisted). `true` only for Pixel 11 (`Y, Z, aa, ab`). | Device classified as non-Pixel 11. |
| **Gate 2: Customization Flag** | `kkh.b` (`camera.quick_access_customization_enabled`) | Initialized to `false` in `klm.<init>`. Set to `true` in `hpq.bb()` only if `uyv.g()` is `true`. | Left/Right slot customization UI is hidden; viewfinder ignores custom slot preferences. |
| **Gate 3: Haptic Sliders Flag** | `kkh.c` (`camera.quick_access_tick_sliders_enabled`) | Initialized to `false`. Set to `true` in `hpq.bb()`. | Discrete tick haptic feedback disabled. |
| **Gate 4: Looks Eligibility Flag** | `kjq.bm` (`camera.sauce_eligible`) | Set to `uyv.l()`. Evaluates to `false` on Pixel 1–10. | Flags device as ineligible for Camera Looks. |
| **Gate 5: Looks Master Predicate** | `qau.java` (Case 19) | `klm.q(kjq.bm) && klm.q(kjq.bl)` returns `Boolean.FALSE`. | Dagger emits `Boolean.FALSE` for all dependent Looks controllers. |
| **Gate 6: Quick Access Candidates** | `pie.java` (Lines 93–97) | `if (zBooleanValue)` evaluates `false`. | `nqq.A` ("Looks") is excluded from candidate shortcuts. |
| **Gate 7: Viewfinder Controller** | `qkr.java` (Lines 61–67) | Checks `qau 19`. Returns empty list if `false`. | `nqq.TOMTE_SELECTION` is not registered in viewfinder manual controls. |
| **Gate 8: Look Manager Binding** | `qkp.java` (Lines 22–28) | Checks `qau 19`. Returns dummy stub `qmr` if `false`. | Shortcut cannot dispatch Look changes to `qmy`. |
| **Gate 9: Dual EV Slider Contract** | `qhm.m()` / `mzc.java` | `qhrVar instanceof qhr`. Unpatched older devices default to legacy `nrd`/`nrm`. | Brightness and Shadows slots fail `instanceof qhr` and are dropped from viewfinder. |

---

## 5. Dual-Side Quick Access Architecture & Resolution

On older Pixel devices, assigning **Brightness** and **Shadows** to either slot position caused them to be suppressed on the viewfinder, even while other controls (White Balance, Looks, Focus, Shutter Speed, ISO) worked properly.

### Architectural Root Cause:
1. **The `qhr` Base Class Contract**:
   `qhm.java` iterates over configured shortcut slot items and enforces:
   ```java
   qhr qhrVar = nqrVar.e;
   qhr qhrVar2 = qhrVar instanceof qhr ? qhrVar : null;
   if (qhrVar2 != null) { ... }
   ```
2. **Legacy Tap-to-Focus vs Modern Sliders**:
   * On older devices with `camera.enable_twilight` disabled, `mzc.java` registers `nqq.BRIGHTNESS` with `nrd` and `nqq.SHADOWS` with `nrm`.
   * Neither `nrd` nor `nrm` extends `qhr` (they are legacy Pixel 4-era tap-to-focus widgets without vertical slider protocols).
   * Modern devices use `nrh` (`EVC`, `qhr`-compliant) and `nre` (`BRIGHTNESS_BIAS`, `qhr`-compliant).
3. **Capability Gating**:
   In standard Photo mode (`ljz.a`), `nqj.e(ljz)` calls `v(nqp.a, false)`, deactivating Dual EV and causing `nqj.G(nqp.a)` to return `false`.

### The Fix:
* In `mzc.smali`: Remap `nqq.BRIGHTNESS` (`nqq.h`) to `nrh` and `nqq.SHADOWS` (`nqq.b`) to `nre`.
* In `qhm.smali`: Bypass `nqj.G(nqp)` check for slotted items (`goto :cond_2`).
* In LSPosed / feature config: Enable `camera.enable_twilight` and hook `nqj.G(nqp)` to return `true`.

---

## 6. Conclusion & Verification Result

1. **Is the feature present?** YES. The entire pipeline (`QuickAccessControls`, `qhm`, `qmn`, `pie`, `qmy`) is compiled into Pixel Camera 11.0.
2. **Is it hardware dependent?** NO. The shortcut, dual-side vertical sliders, and gesture handling are 100% Android UI and framework logic.
3. **Can it be enabled with a minimal patch?** YES. Overriding `camera.quick_access_customization_enabled` (`kkh.b`), `camera.sauce_eligible`, and remapping `mzc` Brightness/Shadows controllers fully unlocks all dual-side shortcuts on older Pixel phones.
