package app.morphe.patches.pixelcamera.looks

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x

val cameraLooksPatch = bytecodePatch(
    name = "Camera Looks Backport",
    description = "Enables Google Pixel 11's 10 signature Camera Looks (Sauce & Tomte) on Pixel 6 through Pixel 10."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Hook uyv.l()Z → always return true (sauce-eligible flag) ─────────────────
        // uyv.l()Z is the master device-eligibility check for Camera Looks (Sauce & Tomte).
        // Returning true enables Camera Looks across all supported Pixel generations cleanly
        // without causing native initialization errors or missing CameraCharacteristics crashes.
        mutableClassDefByOrNull("Luyv;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "l" && it.returnType == "Z" }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) impl.removeInstruction(0)
                    impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }
        }
    }
}
