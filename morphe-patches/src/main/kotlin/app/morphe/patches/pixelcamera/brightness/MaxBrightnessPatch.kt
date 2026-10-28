package app.morphe.patches.pixelcamera.brightness

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val maxBrightnessPatch = resourcePatch(
    name = "Max Display Brightness",
    description = "Enforces 100% display backlight exclusively on viewfinder activities while preserving default system brightness in Settings, with an in-app toggle in Camera Settings.",
    default = true
) {
    dependsOn(cameraLooksPatch)

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )

    execute {
        PixelCameraPatchUtils.injectMaxBrightnessPreferences(this)
    }
}
