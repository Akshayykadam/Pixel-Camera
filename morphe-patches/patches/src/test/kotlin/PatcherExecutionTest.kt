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
            println("Verified: camera_gm3_preferences.xml contains brightness, jpeg quality, and noise reduction keys")
        }
        val camXml = File(tmpDir, "apk/resources/package_1/res/xml/camera_preferences.xml")
        if (camXml.exists()) {
            val content = camXml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_key"), "camera_preferences.xml should contain pref_camera_max_brightness_key")
            assertTrue(content.contains("pref_camera_jpeg_quality_key"), "camera_preferences.xml should contain pref_camera_jpeg_quality_key")
            assertTrue(content.contains("pref_camera_noise_reduction_key"), "camera_preferences.xml should contain pref_camera_noise_reduction_key")
            println("Verified: camera_preferences.xml contains brightness, jpeg quality, and noise reduction keys")
        }
        val stringsXml = File(tmpDir, "apk/resources/package_1/res/values/strings.xml")
        if (stringsXml.exists()) {
            val content = stringsXml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_title"), "strings.xml should contain pref_camera_max_brightness_title")
            assertTrue(content.contains("pref_camera_jpeg_quality_title"), "strings.xml should contain pref_camera_jpeg_quality_title")
            assertTrue(content.contains("pref_camera_noise_reduction_title"), "strings.xml should contain pref_camera_noise_reduction_title")
            println("Verified: strings.xml contains brightness, jpeg quality, and noise reduction titles")
        }
    }
}

