package app.morphe.patches.pixelcamera.quickaccess

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x

val quickAccessPatch = bytecodePatch(
    name = "Viewfinder Quick Access Controls",
    description = "Enables customizable Left/Right viewfinder quick-access shortcut slots, interactive Brightness & Shadow tick-slider, and Camera Looks quick-access items."
) {
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Hook nqj.G(nqp)Z → always return true ────────────────────────────────────
        // nqj.G(nqp) is the Quick Access item eligibility gate for the viewfinder:
        //   - nqp.a = DUAL_EXPOSURE  (Brightness + Shadow dual tick slider)
        //   - nqp.b = SINGLE_EXPOSURE (single EV knob)
        // Forcing true ensures Dual Exposure (Brightness & Shadow) and other items
        // are allowed in the viewfinder quick-access controls.
        mutableClassDefByOrNull("Lnqj;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "G" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Lnqp;" &&
                it.returnType == "Z"
            }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) impl.removeInstruction(0)
                    impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }

            // ── 2. Hook nqj.I(nqp)Z → always return true ────────────────────────────────
            // nqj.I(nqp) is the static gate for Looks-type QA items:
            //   - nqp.j = TOMTE_AURA      (Looks: Aura)
            //   - nqp.k = TOMTE_CAPS      (Looks: Caps)
            //   - nqp.l = TOMTE_CAPS_LIMA (Looks: Caps Lima)
            //   - nqp.m = TOMTE_EXTRA     (Looks: Extra)
            //   - nqp.n = TOMTE_SELECTION (Looks: Selection / carousel slot)
            // Forcing true ensures all Looks items are allowed as QA shortcuts.
            clazz.methods.firstOrNull {
                it.name == "I" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Lnqp;" &&
                it.returnType == "Z"
            }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) impl.removeInstruction(0)
                    impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }
        }

        // ── 3. Hook nqp.a()Z → always return true ───────────────────────────────────────
        // nqp.a() marks which item types are supported as exposure sliders on the device.
        // Returning true enables DUAL_EXPOSURE and SINGLE_EXPOSURE.
        mutableClassDefByOrNull("Lnqp;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "a" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "Z"
            }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) impl.removeInstruction(0)
                    impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }
        }

        // ── 4. Hook qhm.h(nqq)Z → always return true ────────────────────────────────────
        // qhm.h(nqq) determines whether a slider widget should be displayed upon tap:
        //   - nqq.h = BRIGHTNESS
        //   - nqq.b = SHADOWS
        //   - nqq.i = DUAL_EXPOSURE / EV
        //   - nqq.j = WHITE_BALANCE
        // Forcing true ensures the tick-slider UI is activated on viewfinder tap.
        mutableClassDefByOrNull("Lqhm;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "h" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Lnqq;" &&
                it.returnType == "Z"
            }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) impl.removeInstruction(0)
                    impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }
        }
    }
}
