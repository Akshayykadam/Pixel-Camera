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
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // ── 1. Unlock Creator Suite feature getters in kid.smali ─────────────────────────
        mutableClassDefByOrNull("Lkow;")?.let { clazz ->
            for (m in listOf("b", "c", "d", "e", "f", "g", "h")) {
                PixelCameraPatchUtils.forceReturnTrue(clazz, m)
            }
        }

        // ── 2. Neutralize 'Save to a project' button in kqc.smali to prevent cloud crash ──
        mutableClassDefByOrNull("Lkxd;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnFalse(clazz, "q")
            PixelCameraPatchUtils.forceReturnFalse(clazz, "u")
            PixelCameraPatchUtils.forceReturnVoid(clazz, "l")
            PixelCameraPatchUtils.forceReturnVoid(clazz, "k")
        }
    }
}
