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
            assertTrue(content.contains("pref_video_sharpness_key"), "camera_gm3_preferences.xml should contain pref_video_sharpness_key")
            assertTrue(content.contains("pref_video_noise_reduction_key"), "camera_gm3_preferences.xml should contain pref_video_noise_reduction_key")
            println("Verified: camera_gm3_preferences.xml contains brightness, jpeg quality, noise reduction, raw compression, sharpness, and video ISP keys")
        }
        val camXml = File(tmpDir, "apk/resources/package_1/res/xml/camera_preferences.xml")
        if (camXml.exists()) {
            val content = camXml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_key"), "camera_preferences.xml should contain pref_camera_max_brightness_key")
            assertTrue(content.contains("pref_camera_jpeg_quality_key"), "camera_preferences.xml should contain pref_camera_jpeg_quality_key")
            assertTrue(content.contains("pref_camera_noise_reduction_key"), "camera_preferences.xml should contain pref_camera_noise_reduction_key")
            assertTrue(content.contains("pref_camera_raw_compression_key"), "camera_preferences.xml should contain pref_camera_raw_compression_key")
            assertTrue(content.contains("pref_camera_sharpness_key"), "camera_preferences.xml should contain pref_camera_sharpness_key")
            assertTrue(content.contains("pref_video_sharpness_key"), "camera_preferences.xml should contain pref_video_sharpness_key")
            assertTrue(content.contains("pref_video_noise_reduction_key"), "camera_preferences.xml should contain pref_video_noise_reduction_key")
            println("Verified: camera_preferences.xml contains brightness, jpeg quality, noise reduction, raw compression, sharpness, and video ISP keys")
        }
        val stringsXml = File(tmpDir, "apk/resources/package_1/res/values/strings.xml")
        if (stringsXml.exists()) {
            val content = stringsXml.readText()
            assertTrue(content.contains("pref_camera_max_brightness_title"), "strings.xml should contain pref_camera_max_brightness_title")
            assertTrue(content.contains("pref_camera_jpeg_quality_title"), "strings.xml should contain pref_camera_jpeg_quality_title")
            assertTrue(content.contains("pref_camera_noise_reduction_title"), "strings.xml should contain pref_camera_noise_reduction_title")
            assertTrue(content.contains("pref_camera_raw_compression_title"), "strings.xml should contain pref_camera_raw_compression_title")
            assertTrue(content.contains("pref_camera_sharpness_title"), "strings.xml should contain pref_camera_sharpness_title")
            assertTrue(content.contains("pref_video_sharpness_title"), "strings.xml should contain pref_video_sharpness_title")
            assertTrue(content.contains("pref_video_noise_reduction_title"), "strings.xml should contain pref_video_noise_reduction_title")
            println("Verified: strings.xml contains brightness, jpeg quality, noise reduction, raw compression, sharpness, and video ISP titles")
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
        var foundRexHook = false
        var foundRflHook = false
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
                if (c.type == "Lrfl;") {
                    val arMethod = c.methods.firstOrNull { it.name == "ar" }
                    val instructions = arMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (instructions.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("filterProPreferences") == true }) {
                        foundRflHook = true
                    }
                }
            }
        }
        assertTrue(foundOnsHook, "ons.e must be hooked with isProDevice()")
        assertTrue(foundRdbHook, "rdb.C must be hooked with isProDevice()")
        assertTrue(foundPoyHook, "poy.M must be hooked with TomteProSettingsPanel")
        assertTrue(foundAutobahnHook, "AutobahnViewPager.onMeasure must be hooked with Math.max")
        assertTrue(foundRflHook, "rfl.ar must be hooked with pro preferences direct removal")

        // Verify rfx.M GOTO_16 jump to prevent ART VerifyError
        var foundRfxMGoto = false
        for (dexFile in outDexDir.listFiles()?.filter { it.name.endsWith(".dex") } ?: emptyList()) {
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            val rfx = dex.classes.firstOrNull { it.type == "Lrfx;" } ?: continue
            val m = rfx.methods.firstOrNull { it.name == "M" } ?: continue
            val insList = m.implementation?.instructions?.toList() ?: emptyList()
            for (i in insList.indices) {
                if (insList[i].opcode == com.android.tools.smali.dexlib2.Opcode.GOTO_16 && i > 350) {
                    foundRfxMGoto = true
                }
            }
        }
        assertTrue(foundRfxMGoto, "rfx.M must have GOTO_16 jump to prevent Android ART VerifyError")

        // Verify mtf.b does not contain duplicate MOVE_RESULT (prevent ART VerifyError)
        for (dexFile in outDexDir.listFiles()?.filter { it.name.endsWith(".dex") } ?: emptyList()) {
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            val mtf = dex.classes.firstOrNull { it.type == "Lmtf;" } ?: continue
            val b = mtf.methods.firstOrNull { it.name == "b" } ?: continue
            val insList = b.implementation?.instructions?.toList() ?: emptyList()
            for (i in 0 until insList.size - 1) {
                if (insList[i].opcode.name.contains("MOVE_RESULT") && insList[i + 1].opcode.name.contains("MOVE_RESULT")) {
                    error("mtf.b contains consecutive MOVE_RESULT at $i and ${i + 1}")
                }
            }
        }

        // Verify 50MP High Resolution session flag and SpecialTypesProvider hooks
        var foundOmsHiRes = false
        var foundOmlHiRes = false
        var foundCcpBypass = false
        var foundMgsGuard = false
        var foundKsoBypass = false
        var foundKsaClonedAuth = false
        for (dexFile in outDexDir.listFiles()?.filter { it.name.endsWith(".dex") } ?: emptyList()) {
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            for (c in dex.classes) {
                if (c.type == "Loms;") {
                    for (m in c.methods) {
                        val insList = m.implementation?.instructions?.toList() ?: emptyList()
                        if (insList.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("isHighResShot") == true }) {
                            foundOmsHiRes = true
                        }
                    }
                }
                if (c.type == "Loml;") {
                    for (m in c.methods) {
                        val insList = m.implementation?.instructions?.toList() ?: emptyList()
                        if (insList.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("isHighResShot") == true }) {
                            foundOmlHiRes = true
                        }
                    }
                }
                if (c.type == "Lcom/google/android/apps/camera/contentprovider/CameraContentProvider;") {
                    val aMethod = c.methods.firstOrNull { it.name == "a" }
                    val insList = aMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (insList.size == 1 && insList[0].opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_VOID) {
                        foundCcpBypass = true
                    }
                }
                if (c.type == "Lmgs;") {
                    val aMethod = c.methods.firstOrNull { it.name == "a" && it.parameterTypes.size == 2 }
                    val insList = aMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (insList.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("ensureProjection") == true }) {
                        foundMgsGuard = true
                    }
                }
                if (c.type == "Lkso;") {
                    val aMethod = c.methods.firstOrNull { it.name == "a" }
                    val insList = aMethod?.implementation?.instructions?.toList() ?: emptyList()
                    if (insList.any { it.opcode == com.android.tools.smali.dexlib2.Opcode.CONST_4 } && insList.any { it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN }) {
                        foundKsoBypass = true
                    }
                }
                if (c.type == "Lksa;") {
                    val clinit = c.methods.firstOrNull { it.name == "<clinit>" }
                    val insList = clinit?.implementation?.instructions?.toList() ?: emptyList()
                    if (insList.any { (it as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c)?.reference?.toString()?.contains("com.google.android.GoogleCamera.morphe.specialtypes.SpecialTypesProvider") == true }) {
                        foundKsaClonedAuth = true
                    }
                }
            }
        }
        assertTrue(foundOmsHiRes, "oms must be hooked with isHighResShot(omw)")
        assertTrue(foundOmlHiRes, "oml must be hooked with isHighResShot(omw)")
        assertTrue(foundCcpBypass, "CameraContentProvider.a must return void to unblock Google Photos queries")
        assertTrue(foundMgsGuard, "mgs.a must guard null projection")
        assertTrue(foundKsoBypass, "kso.a must return true to bypass caller signature verification")
        assertTrue(foundKsaClonedAuth, "ksa.<clinit> must align SpecialTypesProvider authority to cloned package")

        println("Verified DEX bytecode hooks: ons.e=$foundOnsHook, rdb.C=$foundRdbHook, poy.M=$foundPoyHook, AutobahnViewPager.onMeasure=$foundAutobahnHook, rfl.ar=$foundRflHook, rfx.M=$foundRfxMGoto, oms.hi_res=$foundOmsHiRes, oml.hi_res=$foundOmlHiRes, ccp.bypass=$foundCcpBypass, mgs.guard=$foundMgsGuard, kso.bypass=$foundKsoBypass, ksa.auth=$foundKsaClonedAuth")
    }
}

