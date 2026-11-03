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

        // Align SpecialTypesProvider authority in klh.smali and ksa.smali
        try {
            for (dir in listOf("smali", "smali_classes2", "smali_classes3", "smali_classes4")) {
                for (smaliName in listOf("klh.smali", "ksa.smali")) {
                    val file = get("$dir/$smaliName", false)
                    if (file.exists()) {
                        var c = file.readText(Charsets.UTF_8)
                        c = c.replace(
                            "com.google.android.apps.camera.specialtypes.SpecialTypesProvider",
                            "$targetPkg.specialtypes.SpecialTypesProvider"
                        ).replace(
                            "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider",
                            "$targetPkg.specialtypes.SpecialTypesProvider"
                        )
                        file.writeText(c, Charsets.UTF_8)
                    }
                }
            }
        } catch (_: Throwable) {}

        // Bypass CameraContentProvider & kso caller signature verification to unblock in-flight review
        try {
            for (dir in listOf("smali", "smali_classes2", "smali_classes3", "smali_classes4")) {
                val ccpFile = get("$dir/com/google/android/apps/camera/contentprovider/CameraContentProvider.smali", false)
                if (ccpFile.exists()) {
                    var c = ccpFile.readText(Charsets.UTF_8)
                    val targetA = ".method protected final a()V\n    .locals 1\n\n    iget-object v0, p0, Lcom/google/android/apps/camera/contentprovider/CameraContentProvider;->b:Lkso;"
                    if (targetA in c) {
                        val idx = c.indexOf(targetA)
                        val endIdx = c.indexOf(".end method", idx)
                        if (endIdx != -1) {
                            c = c.substring(0, idx) + ".method protected final a()V\n    .locals 0\n\n    return-void\n.end method" + c.substring(endIdx + ".end method".length)
                            ccpFile.writeText(c, Charsets.UTF_8)
                        }
                    }
                }
                val ksoFile = get("$dir/kso.smali", false)
                if (ksoFile.exists()) {
                    var c = ksoFile.readText(Charsets.UTF_8)
                    val targetKso = ".method public final a(Ljava/lang/String;)Z\n    .locals 7"
                    if (targetKso in c) {
                        val idx = c.indexOf(targetKso)
                        val endIdx = c.indexOf(".end method", idx)
                        if (endIdx != -1) {
                            c = c.substring(0, idx) + ".method public final a(Ljava/lang/String;)Z\n    .locals 1\n\n    const/4 v0, 0x1\n\n    return v0\n.end method" + c.substring(endIdx + ".end method".length)
                            ksoFile.writeText(c, Charsets.UTF_8)
                        }
                    }
                }
                val lysFile = get("$dir/lys.smali", false)
                if (lysFile.exists()) {
                    var c = lysFile.readText(Charsets.UTF_8)
                    val targetLysE = ".method public final e(Landroid/content/Intent;Landroid/view/View;Landroid/graphics/Bitmap;)Z\n    .locals 5\n\n    iget-object v0, p0, Llys;->o:Landroid/content/Context;"
                    val replLysE = ".method public final e(Landroid/content/Intent;Landroid/view/View;Landroid/graphics/Bitmap;)Z\n    .locals 5\n\n    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->prepareReviewIntent(Landroid/content/Intent;)Landroid/content/Intent;\n\n    move-result-object p1\n\n    iget-object v0, p0, Llys;->o:Landroid/content/Context;"
                    if (targetLysE in c) {
                        c = c.replace(targetLysE, replLysE)
                        lysFile.writeText(c, Charsets.UTF_8)
                    }
                }
            }
        } catch (_: Throwable) {}

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

            for (dir in listOf("smali", "smali_classes2", "smali_classes3", "smali_classes4")) {
                val caFile = get("$dir/com/google/android/apps/camera/activity/main/CameraActivity.smali", false)
                if (caFile.exists()) {
                    var c = caFile.readText(Charsets.UTF_8)
                    val targetOnCreate = ".method protected onCreate(Landroid/os/Bundle;)V\n    .locals 14\n\n    invoke-super {p0}, Lifi;->s()V"
                    val replOnCreate = ".method protected onCreate(Landroid/os/Bundle;)V\n    .locals 14\n\n    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->enforceImmersiveFullscreen(Landroid/app/Activity;)V\n\n    invoke-super {p0}, Lifi;->s()V"
                    if (targetOnCreate in c) {
                        c = c.replace(targetOnCreate, replOnCreate)
                    }

                    val targetContent = "    check-cast p1, Landroid/app/Activity;\n\n    const v2, 0x7f0d001d\n\n    invoke-virtual {p1, v2}, Landroid/app/Activity;->setContentView(I)V"
                    val replContent = "    check-cast p1, Landroid/app/Activity;\n\n    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->enforceImmersiveFullscreen(Landroid/app/Activity;)V\n\n    const v2, 0x7f0d001d\n\n    invoke-virtual {p1, v2}, Landroid/app/Activity;->setContentView(I)V"
                    if (targetContent in c) {
                        c = c.replace(targetContent, replContent)
                    }

                    val targetResume = ".method protected final onResume()V\n    .locals 3\n\n    iget-object v0, p0, Lcom/google/android/apps/camera/activity/main/CameraActivity;->C:Lrpt;"
                    val replResume = ".method protected final onResume()V\n    .locals 3\n\n    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->enforceImmersiveFullscreen(Landroid/app/Activity;)V\n\n    iget-object v0, p0, Lcom/google/android/apps/camera/activity/main/CameraActivity;->C:Lrpt;"
                    if (targetResume in c) {
                        c = c.replace(targetResume, replResume)
                    }
                    caFile.writeText(c, Charsets.UTF_8)
                }

                val nwwFile = get("$dir/nww.smali", false)
                if (nwwFile.exists()) {
                    var c = nwwFile.readText(Charsets.UTF_8)
                    val targetAttached = ".method public final onAttachedToWindow()V\n    .locals 1\n\n    iget-object v0, p0, Lnww;->z:Lnwe;"
                    val replAttached = ".method public final onAttachedToWindow()V\n    .locals 1\n\n    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->enforceImmersiveFullscreen(Landroid/app/Activity;)V\n\n    iget-object v0, p0, Lnww;->z:Lnwe;"
                    if (targetAttached in c) {
                        c = c.replace(targetAttached, replAttached)
                    }

                    val targetFocus = ".method public final onWindowFocusChanged(Z)V\n    .locals 1\n\n    iget-object v0, p0, Lnww;->z:Lnwe;"
                    val replFocus = ".method public final onWindowFocusChanged(Z)V\n    .locals 1\n\n    if-eqz p1, :cond_focus\n\n    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->enforceImmersiveFullscreen(Landroid/app/Activity;)V\n\n    :cond_focus\n    iget-object v0, p0, Lnww;->z:Lnwe;"
                    if (targetFocus in c) {
                        c = c.replace(targetFocus, replFocus)
                    }
                    nwwFile.writeText(c, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}
    }
}
