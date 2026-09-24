package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val portraitModeFixPatch = bytecodePatch(
    name = "Permanent Portrait Mode Fix",
    description = "Fixes front camera total blur and rear camera flat/bokeh-less portraits by routing portrait processing to Google's pure-TFLite monocular depth pipeline across all cameras."
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32")
    )
    execute {
        // Replaces portrait processing and device configuration classes with verified pure-TFLite implementations:
        // - pwm: Routes all portrait captures unconditionally to znc.e (kMonocular)
        // - pwh: Loads monocular depth model (kkn.u / midasnet) unconditionally on all cameras
        // - pvz: Forces Gouda EdgeTPU flags (n, o, p, q, r) to false
        // - pwp: Hardened PortraitSegmenterManager (synchronous init in a(), 1c33 fallback in b(), CPU/GPU retry)
        // - kic: EdgeTPU PD models nulled, gouda TPU flags disabled, lasagna use_darwinn disabled
        // - num: Telephoto portrait sensor NPE guard
        // - ioy: Catshark bypass for portrait capture looks
        // - hpq: Camera feature config and binned RAW dimensions
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "PortraitControllers.dex")

        // Hook klm feature flags and model routing via TomteInitHelper
        mutableClassDefByOrNull("Lklm;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
            PixelCameraPatchUtils.hookKlmFlagH(clazz)
            PixelCameraPatchUtils.hookKlmFlagR(clazz)
        }
    }
}
