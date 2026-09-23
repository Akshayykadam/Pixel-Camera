package app.morphe.patches.pixelcamera.creator

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val creatorSuitePatch = bytecodePatch(
    name = "Pixel Camera Creator Suite",
    description = "Enables Teleprompter HUD (Biotite), Live Audio VU Meter (Mica), and Social Framing Guides (Slate)."
) {
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Unlock Creator Suite feature getters in kid.smali ─────────────────────────
        mutableClassDefByOrNull("Lkid;")?.let { clazz ->
            for (m in listOf("b", "c", "d", "e", "f", "g", "h")) {
                PixelCameraPatchUtils.forceReturnTrue(clazz, m)
            }
        }

        // ── 2. Neutralize 'Save to a project' button in kqc.smali to prevent cloud crash ──
        mutableClassDefByOrNull("Lkqc;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnFalse(clazz, "q")
            PixelCameraPatchUtils.forceReturnFalse(clazz, "u")
            PixelCameraPatchUtils.forceReturnVoid(clazz, "l")
            PixelCameraPatchUtils.forceReturnVoid(clazz, "k")
        }
    }
}
