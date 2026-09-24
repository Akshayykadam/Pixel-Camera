package app.morphe.patches.pixelcamera.photosaving

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val photoSavingFixPatch = bytecodePatch(
    name = "Pixel 10 Photo Saving Fix",
    description = "Resolves Pixel 10 & Pro 12MP photos not saving by disabling failing Flare Removal (ceftazidime) and Eclipse AE, mapping binned RAW stream dimensions, and guarding telephoto streams."
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32")
    )
    execute {
        // Replaces photo saving and device sensor stream classes with verified implementations:
        // - mkm: Disables missing Flare Removal model crash (ceftazidime) during FinishShot on Wide lens
        // - ejn: Disables ceftazidime and classifier flags and cleans missing asset strings on Pixel 10/Pro
        // - hpq: Device portrait model mappings, binned RAW dimensions in aW/aX, disables failing Eclipse AE (kjq.bb = false)
        // - psh: Guard binned RAW stream dimensions with orElse(0x7e0) and orElse(0x5e8) fallbacks
        // - psk: Guard telephoto streams (PD_TELE, RAW_TELE) against NullPointerException
        // - mjy: Guard khw.d and khw.e with isPresent()
        // - tba: Guard Centaur / Boba Jelly Optional.get() against NoSuchElementException
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "PhotoSavingControllers.dex")

        // Hook klm feature flags and binned RAW dimension fallbacks
        mutableClassDefByOrNull("Lklm;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
        }
    }
}
