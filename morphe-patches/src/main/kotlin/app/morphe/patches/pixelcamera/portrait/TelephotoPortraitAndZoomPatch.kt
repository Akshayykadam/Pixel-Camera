package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch

val telephotoPortraitAndZoomPatch = bytecodePatch(
    name = "10x Viewfinder Quick Zoom",
    description = "Unlocks the discrete 10x quick zoom button on viewfinder in Photo mode."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // Stock Portrait Mode preserved (5x portrait zoom removed).
        // 10x Quick Zoom button for Photo mode handled via viewfinder button row hook.
    }
}
