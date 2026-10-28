package app.morphe.patches.pixelcamera.quality

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val proImageQualityPatch = resourcePatch(
    name = "Pro Image Quality & Denoise Tuning",
    description = "Adds in-app Camera Settings menus for JPEG Quality (100% Maximum Quality, 98% High Quality, 95% Stock) and Spatial Noise Reduction (Stock, Minimal, Off to preserve micro-textures).",
    default = true
) {
    dependsOn(cameraLooksPatch)

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )

    execute {
        PixelCameraPatchUtils.injectImageQualityPreferences(this)
    }
}
