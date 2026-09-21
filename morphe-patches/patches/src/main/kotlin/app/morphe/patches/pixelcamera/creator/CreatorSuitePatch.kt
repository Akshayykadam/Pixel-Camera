package app.morphe.patches.pixelcamera.creator

import app.morphe.patcher.patch.bytecodePatch

val creatorSuitePatch = bytecodePatch(
    name = "Pixel Camera Creator Suite",
    description = "Enables Teleprompter HUD (Biotite), Live Audio VU Meter (Mica), and Social Framing Guides (Slate)."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
    }
}
