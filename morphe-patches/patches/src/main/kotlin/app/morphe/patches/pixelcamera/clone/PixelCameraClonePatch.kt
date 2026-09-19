package app.morphe.patches.pixelcamera.clone

import app.morphe.patcher.annotation.CompatiblePackage
import app.morphe.patcher.annotation.Patch
import app.morphe.patcher.patch.RawResourcePatch
import app.morphe.patcher.patch.RawResourcePatchContext

@Patch(
    name = "Pixel Camera Clone (Non-Root)",
    description = "Changes package identifier to com.google.android.GoogleCameraEng to allow side-by-side installation alongside stock Camera.",
    compatiblePackages = [
        CompatiblePackage("com.google.android.GoogleCamera", ["11.0.073.972752740.32"])
    ]
)
class PixelCameraClonePatch : RawResourcePatch() {

    override fun execute(context: RawResourcePatchContext) {
        patchManifest(context)
        patchStrings(context)
    }

    private fun patchManifest(context: RawResourcePatchContext) {
        val manifestFile = context.files["AndroidManifest.xml"] ?: return
        var content = manifestFile.readText()

        // 1. Package name
        content = content.replace(
            "package=\"com.google.android.GoogleCamera\"",
            "package=\"com.google.android.GoogleCameraEng\""
        )

        // 2. Dynamic receiver permission
        content = content.replace(
            "android:name=\"com.google.android.GoogleCamera.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION\"",
            "android:name=\"com.google.android.GoogleCameraEng.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION\""
        )

        // 3. Scheme launch host
        content = content.replace(
            "android:host=\"com.google.android.GoogleCamera\"",
            "android:host=\"com.google.android.GoogleCameraEng\""
        )

        // 4. Content Provider authorities
        val providerAuthorities = listOf(
            "DebugContentProvider",
            "DbDebugDumper",
            "MetricsProvider",
            "fileprovider",
            "mlkitinitprovider"
        )
        for (provider in providerAuthorities) {
            content = content.replace(
                "android:authorities=\"com.google.android.GoogleCamera.$provider\"",
                "android:authorities=\"com.google.android.GoogleCameraEng.$provider\""
            )
        }

        content = content.replace(
            "android:authorities=\"com.google.android.apps.camera.specialtypes.SpecialTypesProvider\"",
            "android:authorities=\"com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider\""
        )
        content = content.replace(
            "android:authorities=\"com.google.android.GoogleCamera\"",
            "android:authorities=\"com.google.android.GoogleCameraEng.search\""
        )

        // 5. Remove split attributes to convert to standalone monolithic APK
        content = content.replace("android:requiredSplitTypes=\"\"", "")
        content = content.replace("android:splitTypes=\"\"", "")
        content = content.replace(Regex("<meta-data android:name=\"com\\.android\\.vending\\.splits\"[^>]*/>"), "")
        content = content.replace(Regex("<meta-data android:name=\"com\\.android\\.vending\\.derived\\.apk\\.id\"[^>]*/>"), "")
        content = content.replace(Regex("<meta-data android:name=\"com\\.android\\.stamp\\.source\"[^>]*/>"), "")
        content = content.replace(Regex("<meta-data android:name=\"com\\.android\\.stamp\\.type\"[^>]*/>"), "")

        manifestFile.writeText(content)
    }

    private fun patchStrings(context: RawResourcePatchContext) {
        val stringsFile = context.files["res/values/strings.xml"] ?: return
        var content = stringsFile.readText()
        content = content.replace(
            "<string name=\"app_name\">Camera</string>",
            "<string name=\"app_name\">PixelCamera</string>"
        )
        stringsFile.writeText(content)
    }
}
