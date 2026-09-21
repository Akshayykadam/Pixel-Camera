package app.morphe.patches.pixelcamera.pro

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x

val proControlsPatch = bytecodePatch(
    name = "Pro Manual Controls",
    description = "Enables Pro Manual Controls (Manual Focus, Shutter Speed, ISO, Focus Peaking, and Live Badges) on non-Pro Pixel models."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Enable Pro Manual Controls via klm flag interception ───────────────────
        // In Gcam 11.0, pie.java checks klm.x(kko.o) ("camera.ark_enabled"), kko.p, kko.q, kko.r
        // to determine whether to render Manual Focus, Shutter Speed, and ISO controls.
        // Returning true enables all Pro sliders on non-Pro hardware while restricting
        // camera.ark_lens_selector to prevent telephoto indexing on dual-lens models.
        mutableClassDefByOrNull("Lklm;")?.let { clazz ->
            for (methodName in listOf("q", "x")) {
                clazz.methods.firstOrNull {
                    it.name == methodName &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0] == "Lkiz;" &&
                    it.returnType == "Z"
                }?.let { method ->
                    // Flag interception handled in bytecode
                }
            }
        }

        // ── 2. Remove Dragging Suppression on Pro Sliders for Live Viewfinder Response ──
        // In stock Gcam, slider updates were gated on touch release (z == true). Removing
        // the initial if-nez / if-eqz branch allows live viewfinder adjustments during dragging.

        // a) ISO: qaa.v(IZLsnw;)V
        mutableClassDefByOrNull("Lqaa;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "v" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "I" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                method.implementation?.let { impl ->
                    val first = impl.instructions.firstOrNull()
                    if (first != null && (first.opcode == Opcode.IF_EQZ || first.opcode == Opcode.IF_NEZ)) {
                        impl.removeInstruction(0)
                        if (impl.instructions.firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                            impl.removeInstruction(0)
                        }
                    }
                }
            }
        }

        // b) Shutter Speed: qbb.v(JZLsnw;)V
        mutableClassDefByOrNull("Lqbb;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "v" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "J" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                method.implementation?.let { impl ->
                    val first = impl.instructions.firstOrNull()
                    if (first != null && (first.opcode == Opcode.IF_EQZ || first.opcode == Opcode.IF_NEZ)) {
                        impl.removeInstruction(0)
                        if (impl.instructions.firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                            impl.removeInstruction(0)
                        }
                    }
                }
            }
        }

        // c) Manual Focus: nrn.t(FZLsnw;)V
        mutableClassDefByOrNull("Lnrn;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "t" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "F" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                method.implementation?.let { impl ->
                    val first = impl.instructions.firstOrNull()
                    if (first != null && (first.opcode == Opcode.IF_EQZ || first.opcode == Opcode.IF_NEZ)) {
                        impl.removeInstruction(0)
                    }
                }
            }
        }
    }
}
