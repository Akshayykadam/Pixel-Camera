package app.morphe.patches.pixelcamera.photosaving

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val photoSavingFixPatch = bytecodePatch(
    name = "Pixel 10 Photo Saving Fix",
    description = "Resolves Pixel 10 & Pro 12MP photos not saving by disabling failing Flare Removal (ceftazidime) and Eclipse AE, mapping binned RAW stream dimensions, and guarding telephoto streams.",
    default = true
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // Hook feature flags (ceftazidime, lasagna, use_eclipse) and binned RAW dimension fallbacks

        // Hook klm feature flags and binned RAW dimension fallbacks
        mutableClassDefByOrNull("Lksf;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
        }

        // Patch Lvfa to synchronize CLOCK_BOOTTIME vs CLOCK_MONOTONIC and enforce >= 8.33ms tolerance
        mutableClassDefByOrNull("Lvfa;")?.let { clazz ->
            PixelCameraPatchUtils.patchVfaTimestampSync(clazz)
        }

        // Patch Lwst to pass 8.33ms tolerance (v14, v15) instead of 0 to Lvfa
        mutableClassDefByOrNull("Lwst;")?.let { clazz ->
            PixelCameraPatchUtils.patchWstTolerance(clazz)
        }
    }
}
