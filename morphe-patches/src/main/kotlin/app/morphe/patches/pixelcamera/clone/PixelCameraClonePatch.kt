package app.morphe.patches.pixelcamera.clone

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

val pixelCameraClonePatch = resourcePatch(
    name = "Pixel Camera Clone (Non-Root)",
    description = "Changes package identifier to com.google.android.GoogleCamera.morphe to allow side-by-side installation alongside stock Camera.",
    default = true
) {
    val packageNameOption = stringOption(
        key = "packageName",
        default = "com.google.android.GoogleCamera.morphe",
        values = mapOf("com.google.android.GoogleCamera.morphe" to "com.google.android.GoogleCamera.morphe"),
        title = "Package name",
        description = "Package name to use for the cloned app.",
        required = true
    )

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )

    execute {
        val targetPkg = packageNameOption.value ?: "com.google.android.GoogleCamera.morphe"

        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            root.setAttribute("package", targetPkg)

            // 1. Dynamic receiver and permissions
            for (tag in listOf("permission", "uses-permission")) {
                val list = doc.getElementsByTagName(tag)
                for (i in 0 until list.length) {
                    val elem = list.item(i) as? Element ?: continue
                    val name = elem.getAttribute("android:name")
                    if (name.isNotEmpty() && (name.startsWith("com.google.android.GoogleCamera") || name.startsWith("com.google.android.GoogleCameraEng"))) {
                        elem.setAttribute(
                            "android:name",
                            name.replace("com.google.android.GoogleCameraEng", targetPkg)
                                .replace("com.google.android.GoogleCamera", targetPkg)
                        )
                    }
                }
            }

            // 2. Scheme launch host
            val dataList = doc.getElementsByTagName("data")
            for (i in 0 until dataList.length) {
                val elem = dataList.item(i) as? Element ?: continue
                val host = elem.getAttribute("android:host")
                if (host == "com.google.android.GoogleCamera" || host == "com.google.android.GoogleCameraEng") {
                    elem.setAttribute("android:host", targetPkg)
                }
            }

            // 3. Content Provider authorities
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val elem = providers.item(i) as? Element ?: continue
                val auth = elem.getAttribute("android:authorities")
                if (auth.isNotEmpty()) {
                    if (auth == "com.google.android.GoogleCamera" || auth == "com.google.android.GoogleCameraEng" || auth == targetPkg) {
                        elem.setAttribute("android:authorities", "$targetPkg.search")
                    } else if (auth.startsWith("com.google.android.GoogleCamera.")) {
                        elem.setAttribute("android:authorities", auth.replace("com.google.android.GoogleCamera.", "$targetPkg."))
                    } else if (auth.startsWith("com.google.android.GoogleCameraEng.")) {
                        elem.setAttribute("android:authorities", auth.replace("com.google.android.GoogleCameraEng.", "$targetPkg."))
                    } else if (auth == "com.google.android.apps.camera.specialtypes.SpecialTypesProvider") {
                        elem.setAttribute("android:authorities", "$targetPkg.specialtypes.SpecialTypesProvider")
                    }
                    if (auth.contains("SpecialTypesProvider")) {
                        elem.setAttribute("android:grantUriPermissions", "true")
                    }
                }
            }

            // 4. Remove Google Play split & stamp metadata to convert to standalone monolithic APK
            val metaDataList = doc.getElementsByTagName("meta-data")
            val toRemove = mutableListOf<Element>()
            for (i in 0 until metaDataList.length) {
                val elem = metaDataList.item(i) as? Element ?: continue
                val name = elem.getAttribute("android:name")
                if (name in setOf(
                    "com.android.vending.splits",
                    "com.android.vending.derived.apk.id",
                    "com.android.stamp.source",
                    "com.android.stamp.type"
                )) {
                    toRemove.add(elem)
                }
            }
            for (elem in toRemove) {
                elem.parentNode?.removeChild(elem)
            }

            // 5. Remove split attributes from root if present
            root.removeAttribute("android:requiredSplitTypes")
            root.removeAttribute("android:splitTypes")
            root.removeAttribute("android:isSplitRequired")

            // 6. Ensure launcher activity-alias explicitly carries app_name label
            val aliases = doc.getElementsByTagName("activity-alias")
            for (i in 0 until aliases.length) {
                val elem = aliases.item(i) as? Element ?: continue
                if (elem.getAttribute("android:name") == "com.android.camera.CameraLauncher") {
                    elem.setAttribute("android:label", "@string/app_name")
                }
            }
        }

        // 6. Update app name with comprehensive international localization
        try {
            app.morphe.patches.pixelcamera.PixelCameraPatchUtils.injectLocalizedAppNames(this)
        } catch (_: Throwable) {}

        // 7. Inject Max display brightness strings and preference toggles into resources
        app.morphe.patches.pixelcamera.PixelCameraPatchUtils.injectMaxBrightnessPreferences(this)
        app.morphe.patches.pixelcamera.PixelCameraPatchUtils.injectImageQualityPreferences(this)

        // 8. Enforce immediate immersive full-screen window insets on CameraActivity
        try {
            for (resDir in listOf("res/values", "res/values-v27", "res/values-v28")) {
                val stylesFile = get("$resDir/styles.xml", false)
                if (stylesFile.exists()) {
                    var s = stylesFile.readText(Charsets.UTF_8)
                    val targetTheme = "<style name=\"Theme.Camera\" parent=\"@style/Theme.GoogleMaterial3.Dark.NoActionBar\">"
                    if (targetTheme in s && !s.contains("android:windowLayoutInDisplayCutoutMode")) {
                        val cutoutItem = "        <item name=\"android:windowLayoutInDisplayCutoutMode\">@integer/m3c_window_layout_in_display_cutout_mode</item>\n        <item name=\"android:windowTranslucentStatus\">false</item>\n"
                        s = s.replace(targetTheme, "$targetTheme\n$cutoutItem")
                        stylesFile.writeText(s, Charsets.UTF_8)
                    }
                }
            }
        } catch (_: Throwable) {}
    }
}
