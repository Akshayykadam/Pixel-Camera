package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val telephotoPortraitAndZoomPatch = bytecodePatch(
    name = "10x Viewfinder Quick Zoom",
    description = "Unlocks the discrete 10x quick zoom button across Photo and Night Sight modes on Pro and telephoto Pixel devices, and dynamic 1x focal length cycling (1.0x -> 1.2x -> 1.5x) on the main camera.",
    default = true
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // Replaces zoom controller classes with exact verified 11.1 implementations from standalone APK:
        // - knq: Pixel 8 Pro (husky) 10x Photo, Night Sight, and Video configuration (was kgy)
        // - knk: Pixel 7 Pro (cheetah) 10x configuration (was kgs)
        // - kmd: Dynamic zoom stops event listener (was kfl)
        // - kmo: Viewfinder zoom toggle button row manager (was kfw)
        // - guh: Zoom button click handler with dynamic 1x focal length cycling (1.0x -> 1.2x -> 1.5x -> 1.0x)
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "ZoomControllers.dex")
    }
}

