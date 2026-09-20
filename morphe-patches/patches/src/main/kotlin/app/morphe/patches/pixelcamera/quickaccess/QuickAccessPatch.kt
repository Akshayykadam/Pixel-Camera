package app.morphe.patches.pixelcamera.quickaccess

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val quickAccessPatch = bytecodePatch(
    name = "Viewfinder Quick Access Controls",
    description = "Enables customizable Left/Right viewfinder quick-access shortcut slots and interactive tick-slider."
) {
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
    }
}
