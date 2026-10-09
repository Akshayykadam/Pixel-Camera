package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val portraitModeFixPatch = bytecodePatch(
    name = "Permanent Portrait Mode Fix",
    description = "Fixes front camera total blur and rear camera flat/bokeh-less portraits by routing portrait processing to Google's pure-TFLite monocular depth pipeline across all cameras."
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // Replaces portrait processing and device configuration classes with verified pure-TFLite implementations:
        // - qge: Routes all portrait captures unconditionally to zzd.e (kMonocular), enables matting, disables lancet upscaler
        // - qfz: Loads monocular depth model (midasnet) unconditionally on all cameras
        // - qfr: Forces Gouda EdgeTPU flags (n, o, p, q, r) to false
        // - qgh: Hardened PortraitSegmenterManager (synchronous init in a(), 1c33 fallback in b(), CPU/GPU retry)
        // - kov: EdgeTPU PD models nulled, gouda TPU flags disabled (was kic in 11.0)
        // - jex: Catshark bypass for portrait capture looks (was ioy in 11.0)
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "PortraitControllers.dex")

        // Hook klm feature flags and model routing via TomteInitHelper
        mutableClassDefByOrNull("Lksf;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
            PixelCameraPatchUtils.hookKlmFlagH(clazz)
            PixelCameraPatchUtils.hookKlmFlagR(clazz)
        }
    }
}
