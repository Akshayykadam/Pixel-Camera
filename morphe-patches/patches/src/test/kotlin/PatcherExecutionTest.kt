package app.morphe.patches.pixelcamera

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patches.pixelcamera.clone.pixelCameraClonePatch
import app.morphe.patches.pixelcamera.creator.creatorSuitePatch
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch
import app.morphe.patches.pixelcamera.photosaving.photoSavingFixPatch
import app.morphe.patches.pixelcamera.portrait.portraitModeFixPatch
import app.morphe.patches.pixelcamera.portrait.telephotoPortraitAndZoomPatch
import app.morphe.patches.pixelcamera.pro.proControlsPatch
import app.morphe.patches.pixelcamera.quickaccess.quickAccessPatch
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
    }
}

