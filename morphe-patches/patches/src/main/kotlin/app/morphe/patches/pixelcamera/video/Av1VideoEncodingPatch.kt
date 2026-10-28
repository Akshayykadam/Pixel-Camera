package app.morphe.patches.pixelcamera.video

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val av1VideoEncodingPatch = bytecodePatch(
    name = "AV1 Video Hardware Encoding",
    description = "Unlocks AV1 hardware video recording in Video settings on supported Tensor hardware (Pixel 8 and Pixel 9 series) with automatic fallback to standard formats on older devices and graceful fallback to HEVC for 10-bit HDR recording."
) {
    dependsOn(cameraLooksPatch)

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // Intercept camcorder AV1 flags (camcorder.jellybean_setting & camcorder_jellybean_feature) via TomteInitHelper
        mutableClassDefByOrNull("Lksf;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
        }
    }
}
