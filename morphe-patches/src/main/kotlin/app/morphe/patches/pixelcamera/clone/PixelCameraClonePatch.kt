package app.morphe.patches.pixelcamera.clone

import app.morphe.patcher.patch.rawResourcePatch
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import com.reandroid.arsc.chunk.xml.ResXmlAttribute
import com.reandroid.arsc.chunk.xml.ResXmlElement

val pixelCameraClonePatch = rawResourcePatch(
    name = "Pixel Camera Clone (Non-Root)",
    description = "Changes package identifier to com.google.android.GoogleCamera.morphe to allow side-by-side installation alongside stock Camera."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        val manifestFile = get("AndroidManifest.xml", false)
        if (manifestFile.exists()) {
            val manifest = AndroidManifestBlock.load(manifestFile)

            // 1. Set package name
            manifest.packageName = "com.google.android.GoogleCamera.morphe"

            // 2. Iterate all attributes and update package references
            val it: MutableIterator<ResXmlAttribute> = manifest.recursiveAttributes()
            while (it.hasNext()) {
                val attr = it.next()
                // Do not modify the root package attribute again
                if ("package" == attr.name && attr.parentElement == manifest.manifestElement) {
                    continue
                }
                val valStr = attr.valueAsString
                if (valStr != null) {
                    if (valStr.contains("com.google.android.GoogleCamera")) {
                        attr.setValueAsString(valStr.replace("com.google.android.GoogleCamera", "com.google.android.GoogleCamera.morphe"))
                    } else if (valStr == "com.google.android.apps.camera.specialtypes.SpecialTypesProvider") {
                        attr.setValueAsString("com.google.android.GoogleCamera.morphe.specialtypes.SpecialTypesProvider")
                    }
                }
            }

            // 3. Ensure SearchIndexablesProvider authority is uniquely suffixed
            for (provider in manifest.listApplicationElementsByTag("provider")) {
                val authAttr = provider.searchAttributeByName("authorities")
                if (authAttr != null && "com.google.android.GoogleCamera.morphe" == authAttr.valueAsString) {
                    authAttr.setValueAsString("com.google.android.GoogleCamera.morphe.search")
                }
            }

            // 4. Remove split attributes if present
            if (manifest.isSplit) {
                manifest.setSplit(null, false)
            }

            // 5. Remove Google Play split & stamp metadata
            manifest.removeElementsIf { element: ResXmlElement ->
                if ("meta-data" == element.name) {
                    val nameAttr = element.searchAttributeByName("name")
                    val nameVal = nameAttr?.valueAsString
                    nameVal != null && (
                        nameVal == "com.android.vending.splits" ||
                        nameVal == "com.android.vending.derived.apk.id" ||
                        nameVal == "com.android.stamp.source" ||
                        nameVal == "com.android.stamp.type"
                    )
                } else {
                    false
                }
            }

            manifest.refreshFull()
            manifest.writeBytes(manifestFile)
        }
    }
}

