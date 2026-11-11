package app.morphe.patches.pixelcamera.video

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val videoLensSwitchingPatch = bytecodePatch(
    name = "Seamless Video Lens Switching & Zoom Smoothing",
    description = "Eliminates video lens switching stutter and sluggish digital zoom crawl when transitioning between 0.5x, 1x, and 5x sensors. Enables Google's 1 Euro filter, spring dynamics, low-latency fast-out-slow-in zoom curve preset, standby sensor pre-warming, and multi-camera surface sharing in 4K and 60 FPS recording.",
    default = true
) {
    dependsOn(cameraLooksPatch)

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // Intercept video lens switching, zoom curve preset, duration, and 1 Euro filter flags via TomteInitHelper
        mutableClassDefByOrNull("Lksf;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
            PixelCameraPatchUtils.hookKlmFlagR(clazz)
        }
    }
}
