package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val telephotoPortraitAndZoomPatch = bytecodePatch(
    name = "10x Viewfinder Quick Zoom",
    description = "Unlocks the discrete 10x quick zoom button on viewfinder across Photo and Night Sight modes on Pro and telephoto Pixel devices."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // Replaces zoom controller classes with exact verified implementations from standalone APK:
        // - kgy: Pixel 8 Pro (husky) 10x Photo, Night Sight, and Video configuration
        // - kgx: Pixel 9 Pro (caiman/komodo) 10x configuration
        // - khk: Pixel 10 Pro 10x configuration
        // - kgs: Pixel 7 Pro / Pixel 9 Pro Fold 10x configuration
        // - kfl: Dynamic zoom stops event listener
        // - kfw: Viewfinder zoom toggle button row manager (appends 10x to P and Q at :goto_a)
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "ZoomControllers.dex")
    }
}

