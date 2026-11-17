package app.morphe.patches.pixelcamera.video

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val hdr10BitVideoPatch = bytecodePatch(
    name = "4K 60 FPS 10-bit HDR & Log Video",
    description = "Unlocks 10-bit HDR (HLG10 / BT.2020) and Amethyst Log video recording at 4K resolution and 60 FPS across all supported Google Pixel devices (Pixel 8, 9, and 10 series). Unhides the 10-bit HDR toggle in Video Settings and overrides device capability gates.",
    default = true
) {
    dependsOn(cameraLooksPatch)

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // 1. Force top-tier hardware video capability gate Lvku;->f()Z to true
        mutableClassDefByOrNull("Lvku;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnTrue(clazz, "f")
        }

        // 2. Intercept camcorder 10-bit HDR flags (camcorder.glimmerix, camcorder.halifax, camcorder.amethyst, camcorder.amethyst_opt, camcorder.zenthoria) via TomteInitHelper
        mutableClassDefByOrNull("Lksf;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
        }
    }
}
