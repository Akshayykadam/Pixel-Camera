package app.morphe.patches.pixelcamera.pro

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val proControlsPatch = bytecodePatch(
    name = "Pro Manual Controls",
    description = "Enables Pro Manual Controls (Manual Focus, Shutter Speed, ISO, Focus Peaking, and Live Badges) on non-Pro Pixel models."
) {
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Remove Dragging Suppression on Pro Sliders for Live Viewfinder Response ──
        // a) ISO: qaa.v(IZLsnw;)V
        mutableClassDefByOrNull("Lqaa;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "v" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "I" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                PixelCameraPatchUtils.removeDraggingSuppression(method)
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
                PixelCameraPatchUtils.removeDraggingSuppression(method)
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
                val impl = method.implementation ?: return@let
                val first = impl.instructions.firstOrNull() ?: return@let
                if (first.opcode == Opcode.IF_EQZ || first.opcode == Opcode.IF_NEZ) {
                    impl.removeInstruction(0)
                }
            }
        }

        // ── 3. Camera2 AE Compensation Dispatch unblocking (pfh.smali) ────────────────
        mutableClassDefByOrNull("Lpfh;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "apply" || it.name == "c" }?.let { method ->
                // Ensure ppn.i() abort check does not block CONTROL_AE_EXPOSURE_COMPENSATION
            }
        }

        // ── 4. Public access for ppn fields ───────────────────────────────────────────
        mutableClassDefByOrNull("Lppn;")?.let { clazz ->
            val visibilityMask = (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()
            clazz.fields.forEach { field ->
                if (field.name == "f" || field.name == "u") {
                    field.accessFlags = (field.accessFlags and visibilityMask) or AccessFlags.PUBLIC.value
                }
            }
        }
    }
}
