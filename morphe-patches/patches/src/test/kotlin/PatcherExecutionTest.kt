package app.morphe.patches.pixelcamera

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patches.pixelcamera.creator.creatorSuitePatch
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch
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
        val config = PatcherConfig(
            apkFile = baseApk,
            temporaryFilesPath = tmpDir
        )
        val patcher = Patcher(config)
        patcher += setOf(cameraLooksPatch, quickAccessPatch, telephotoPortraitAndZoomPatch, proControlsPatch, creatorSuitePatch)
        patcher.invoke().collect { result ->
            println("Patch result: $result")
        }
        val result = patcher.get()
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

