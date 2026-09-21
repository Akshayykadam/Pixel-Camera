package app.morphe.patches.pixelcamera.pro

import app.morphe.patcher.patch.bytecodePatch

val proControlsPatch = bytecodePatch(
    name = "Pro Manual Controls",
    description = "Enables Pro Manual Controls (Manual Focus, Shutter Speed, ISO, Focus Peaking, and Live Badges) on non-Pro Pixel models."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
    }
}
