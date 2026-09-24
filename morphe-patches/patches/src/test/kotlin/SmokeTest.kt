package app.morphe.patches.pixelcamera

import org.junit.Test
import kotlin.test.assertTrue

class SmokeTest {
    @Test
    fun testInspectPatchedDex() {
        val dexDir = java.io.File("build/tmp/test_patcher/patched_dex")
        val foundZoom = mutableSetOf<String>()
        val foundPortrait = mutableSetOf<String>()
        val foundPhotoSaving = mutableSetOf<String>()
        for (dexFile in dexDir.listFiles()?.sortedBy { it.name } ?: emptyList()) {
            if (!dexFile.name.endsWith(".dex")) continue
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            for (c in dex.classes) {
                if (c.type in listOf("Lkfw;", "Lkgy;", "Lkgx;", "Lkhk;", "Lkgs;", "Lkfl;")) {
                    foundZoom.add(c.type)
                    println("${dexFile.name} defines zoom class ${c.type} with ${c.methods.count()} methods")
                }
                if (c.type in listOf("Lpwm;", "Lpwh;", "Lpvz;", "Lpwp;", "Lkic;", "Lnum;", "Lioy;", "Lhpq;")) {
                    foundPortrait.add(c.type)
                    println("${dexFile.name} defines portrait class ${c.type} with ${c.methods.count()} methods")
                }
                if (c.type in listOf("Lhpq;", "Lpsh;", "Lpsk;", "Lmjy;", "Ltba;", "Lmkm;", "Lejn;")) {
                    foundPhotoSaving.add(c.type)
                    println("${dexFile.name} defines photo saving class ${c.type} with ${c.methods.count()} methods")
                }
            }
        }
        println("Total zoom classes found in patched output: ${foundZoom.size} / 6")
        assertTrue(foundZoom.size == 6, "All 6 zoom classes should be present in patched output")
        println("Total portrait classes found in patched output: ${foundPortrait.size} / 8")
        assertTrue(foundPortrait.size == 8, "All 8 portrait classes should be present in patched output")
        println("Total photo saving classes found in patched output: ${foundPhotoSaving.size} / 7")
        assertTrue(foundPhotoSaving.size == 7, "All 7 photo saving classes should be present in patched output")
    }

    @Test
    fun testAssembleDexes() {
        val rootDir = java.io.File("../..")
        val tomteSmali = java.io.File(rootDir, "smali_patches/TomteInitHelper.smali")
        assertTrue(tomteSmali.exists(), "TomteInitHelper.smali must exist")

        val optionsTomte = com.android.tools.smali.smali.SmaliOptions()
        val tomteDexOut = java.io.File("src/main/resources/TomteInitHelper.dex")
        optionsTomte.outputDexFile = tomteDexOut.absolutePath
        val tomteSuccess = com.android.tools.smali.smali.Smali.assemble(optionsTomte, listOf(tomteSmali.absolutePath))
        assertTrue(tomteSuccess, "TomteInitHelper assembly must succeed")
        println("Generated TomteInitHelper.dex: ${tomteDexOut.length()} bytes")
        tomteDexOut.copyTo(java.io.File("../src/main/resources/TomteInitHelper.dex"), overwrite = true)

        val portraitSmaliFiles = listOf(
            java.io.File(rootDir, "apktool_full/smali_classes2/kic.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/pwm.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/pwh.smali"),
            java.io.File(rootDir, "apktool_full/smali/pvz.smali"),
            java.io.File(rootDir, "apktool_full/smali/pwp.smali"),
            java.io.File(rootDir, "apktool_full/smali/num.smali"),
            java.io.File(rootDir, "apktool_full/smali/ioy.smali"),
            java.io.File(rootDir, "apktool_full/smali/hpq.smali")
        )
        for (f in portraitSmaliFiles) {
            assertTrue(f.exists(), "Smali file ${f.name} must exist")
        }

        val optionsPortrait = com.android.tools.smali.smali.SmaliOptions()
        val portraitDexOut = java.io.File("src/main/resources/PortraitControllers.dex")
        optionsPortrait.outputDexFile = portraitDexOut.absolutePath
        val portraitSuccess = com.android.tools.smali.smali.Smali.assemble(optionsPortrait, portraitSmaliFiles.map { it.absolutePath })
        assertTrue(portraitSuccess, "PortraitControllers assembly must succeed")
        println("Generated PortraitControllers.dex: ${portraitDexOut.length()} bytes")
        portraitDexOut.copyTo(java.io.File("../src/main/resources/PortraitControllers.dex"), overwrite = true)
        portraitDexOut.copyTo(java.io.File(rootDir, "scratch/PortraitControllers.dex"), overwrite = true)

        val photoSavingSmaliFiles = listOf(
            java.io.File(rootDir, "apktool_full/smali/hpq.smali"),
            java.io.File(rootDir, "apktool_full/smali/psh.smali"),
            java.io.File(rootDir, "apktool_full/smali/psk.smali"),
            java.io.File(rootDir, "apktool_full/smali/mjy.smali"),
            java.io.File(rootDir, "apktool_full/smali/tba.smali"),
            java.io.File(rootDir, "apktool_full/smali/mkm.smali"),
            java.io.File(rootDir, "apktool_full/smali/ejn.smali")
        )
        for (f in photoSavingSmaliFiles) {
            assertTrue(f.exists(), "Smali file ${f.name} must exist")
        }

        val optionsPhotoSaving = com.android.tools.smali.smali.SmaliOptions()
        val photoSavingDexOut = java.io.File("src/main/resources/PhotoSavingControllers.dex")
        optionsPhotoSaving.outputDexFile = photoSavingDexOut.absolutePath
        val photoSavingSuccess = com.android.tools.smali.smali.Smali.assemble(optionsPhotoSaving, photoSavingSmaliFiles.map { it.absolutePath })
        assertTrue(photoSavingSuccess, "PhotoSavingControllers assembly must succeed")
        println("Generated PhotoSavingControllers.dex: ${photoSavingDexOut.length()} bytes")
        photoSavingDexOut.copyTo(java.io.File("../src/main/resources/PhotoSavingControllers.dex"), overwrite = true)
        photoSavingDexOut.copyTo(java.io.File(rootDir, "scratch/PhotoSavingControllers.dex"), overwrite = true)
    }
}

