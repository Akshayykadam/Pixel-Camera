package app.morphe.patches.pixelcamera

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patches.pixelcamera.brightness.maxBrightnessPatch
import app.morphe.patches.pixelcamera.clone.pixelCameraClonePatch
import app.morphe.patches.pixelcamera.creator.creatorSuitePatch
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch
import app.morphe.patches.pixelcamera.photosaving.photoSavingFixPatch
import app.morphe.patches.pixelcamera.portrait.portraitModeFixPatch
import app.morphe.patches.pixelcamera.portrait.telephotoPortraitAndZoomPatch
import app.morphe.patches.pixelcamera.pro.proControlsPatch
import app.morphe.patches.pixelcamera.quality.proImageQualityPatch
import app.morphe.patches.pixelcamera.quickaccess.quickAccessPatch
import app.morphe.patches.pixelcamera.video.av1VideoEncodingPatch
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import org.junit.Test
import java.io.File
import kotlin.test.assertTrue

class PatcherExecutionTest {
    @Test
    fun testPatcherRun() = runBlocking {
        val baseApk = File("../../extracted_apkm/base.apk")
        if (!baseApk.exists()) {
            println("base.apk not found at ${baseApk.absolutePath}")
            return@runBlocking
        }
        val tmpDir = File("build/tmp/test_patcher")
        tmpDir.mkdirs()
        val allPatches = listOf(
            cameraLooksPatch,
            quickAccessPatch,
            telephotoPortraitAndZoomPatch,
            portraitModeFixPatch,
            photoSavingFixPatch,
            proControlsPatch,
            creatorSuitePatch,
            av1VideoEncodingPatch,
            maxBrightnessPatch,
            proImageQualityPatch,
            pixelCameraClonePatch
        )
        for (p in allPatches) {
            val patchName = p.name ?: "unnamed"
            println("--- Testing patch: $patchName ---")
            val pDir = File(tmpDir, "patch_${patchName.replace(" ", "_")}")
            pDir.mkdirs()
            val pConfig = PatcherConfig(apkFile = baseApk, temporaryFilesPath = pDir)
            val pPatcher = Patcher(pConfig)
            pPatcher += setOf(p)
            try {
                pPatcher.invoke().collect { res ->
                    println("  Finished $patchName: $res")
                }
            } catch (e: Throwable) {
                println("  ERROR in $patchName: ${e.message}")
                e.printStackTrace()
            }
        }
        val config = PatcherConfig(
            apkFile = baseApk,
            temporaryFilesPath = tmpDir
        )
        val fullPatcher = Patcher(config)
        fullPatcher += allPatches.toSet()
        fullPatcher.invoke().collect { result ->
            println("Patch result: $result")
        }
        val result = fullPatcher.get()
        val outDexDir = File("build/tmp/test_patcher/patched_dex")
        outDexDir.mkdirs()
        for (dex in result.dexFiles) {
            val dexFile = File(outDexDir, dex.name)
            dex.stream.use { input ->
                dexFile.outputStream().use { output ->
                    input.copyTo(output)
                }
            }
            println("Wrote ${dex.name} (${dexFile.length()} bytes)")
        }
        println("Done writing dex files!")

        val gm3Xml = File(tmpDir, "apk/resources/package_1/res/xml/camera_gm3_preferences.xml")
        if (gm3Xml.exists()) {
            val content = gm3Xml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_key"), "camera_gm3_preferences.xml should contain pref_camera_max_brightness_key")
            assertTrue(content.contains("pref_camera_jpeg_quality_key"), "camera_gm3_preferences.xml should contain pref_camera_jpeg_quality_key")
            assertTrue(content.contains("pref_camera_noise_reduction_key"), "camera_gm3_preferences.xml should contain pref_camera_noise_reduction_key")
            assertTrue(content.contains("pref_camera_raw_compression_key"), "camera_gm3_preferences.xml should contain pref_camera_raw_compression_key")
            assertTrue(content.contains("pref_camera_sharpness_key"), "camera_gm3_preferences.xml should contain pref_camera_sharpness_key")
            println("Verified: camera_gm3_preferences.xml contains brightness, jpeg quality, noise reduction, raw compression, and sharpness keys")
        }
        val camXml = File(tmpDir, "apk/resources/package_1/res/xml/camera_preferences.xml")
        if (camXml.exists()) {
            val content = camXml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_key"), "camera_preferences.xml should contain pref_camera_max_brightness_key")
            assertTrue(content.contains("pref_camera_jpeg_quality_key"), "camera_preferences.xml should contain pref_camera_jpeg_quality_key")
            assertTrue(content.contains("pref_camera_noise_reduction_key"), "camera_preferences.xml should contain pref_camera_noise_reduction_key")
            assertTrue(content.contains("pref_camera_raw_compression_key"), "camera_preferences.xml should contain pref_camera_raw_compression_key")
            assertTrue(content.contains("pref_camera_sharpness_key"), "camera_preferences.xml should contain pref_camera_sharpness_key")
            println("Verified: camera_preferences.xml contains brightness, jpeg quality, noise reduction, raw compression, and sharpness keys")
        }
        val stringsXml = File(tmpDir, "apk/resources/package_1/res/values/strings.xml")
        if (stringsXml.exists()) {
            val content = stringsXml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_title"), "strings.xml should contain pref_camera_max_brightness_title")
            assertTrue(content.contains("pref_camera_jpeg_quality_title"), "strings.xml should contain pref_camera_jpeg_quality_title")
            assertTrue(content.contains("pref_camera_noise_reduction_title"), "strings.xml should contain pref_camera_noise_reduction_title")
            assertTrue(content.contains("pref_camera_raw_compression_title"), "strings.xml should contain pref_camera_raw_compression_title")
            assertTrue(content.contains("pref_camera_sharpness_title"), "strings.xml should contain pref_camera_sharpness_title")
            println("Verified: strings.xml contains brightness, jpeg quality, noise reduction, raw compression, and sharpness titles")
        }
        val tabXml = File(tmpDir, "apk/resources/package_1/res/layout/options_bottomsheet_tab.xml")
        if (tabXml.exists()) {
            val content = tabXml.readText()
            assertTrue(content.contains("layout_marginBottom=\"0.0dp\""), "options_bottomsheet_tab.xml should have 0.0dp bottom margin")
            println("Verified: options_bottomsheet_tab.xml has 0.0dp bottom margin")
        }

        // Verify DEX hooks in patched classes
        var foundOnsHook = false
        var foundRdbHook = false
        var foundPoyHook = false
        var foundAutobahnHook = false
        for (dexFile in outDexDir.listFiles()?.filter { it.name.endsWith(".dex") } ?: emptyList()) {
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            for (c in dex.classes) {
                if (c.type == "Lons;") {
                    val eMethod = c.methods.firstOrNull { it.name == "e" }
                    val instructions = eMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (instructions.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("isProDevice") == true }) {
                        foundOnsHook = true
                    }
                }
                if (c.type == "Lrdb;") {
                    val cMethod = c.methods.firstOrNull { it.name == "C" }
                    val instructions = cMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (instructions.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("isProDevice") == true }) {
                        foundRdbHook = true
                    }
                }
                if (c.type == "Lpoy;") {
                    val mMethod = c.methods.firstOrNull { it.name == "M" }
                    val instructions = mMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (instructions.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("TomteProSettingsPanel") == true }) {
                        foundPoyHook = true
                    }
                }
                if (c.type == "Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;") {
                    val mMethod = c.methods.firstOrNull { it.name == "onMeasure" }
                    val instructions = mMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (instructions.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Math;->max") == true }) {
                        foundAutobahnHook = true
                    }
                }
            }
        }
        assertTrue(foundOnsHook, "ons.e must be hooked with isProDevice()")
        assertTrue(foundRdbHook, "rdb.C must be hooked with isProDevice()")
        assertTrue(foundPoyHook, "poy.M must be hooked with TomteProSettingsPanel")
        assertTrue(foundAutobahnHook, "AutobahnViewPager.onMeasure must be hooked with Math.max")
        println("Verified DEX bytecode hooks: ons.e=$foundOnsHook, rdb.C=$foundRdbHook, poy.M=$foundPoyHook, AutobahnViewPager.onMeasure=$foundAutobahnHook")
    }
}

