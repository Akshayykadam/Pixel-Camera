package app.morphe.patches.pixelcamera

import org.junit.Test
import kotlin.test.assertTrue
import app.morphe.patcher.util.smali.toInstructions

class SmokeTest {
    @Test
    fun testInspectPatchedDex() {
        val dexDir = java.io.File("build/tmp/test_patcher/patched_dex")
        if (!dexDir.exists() || dexDir.listFiles().isNullOrEmpty()) {
            println("Skipping testInspectPatchedDex: no patched dex in build/tmp/test_patcher/patched_dex")
            return
        }
        val foundZoom = mutableSetOf<String>()
        val foundPortrait = mutableSetOf<String>()
        val foundPhotoSaving = mutableSetOf<String>()
        for (dexFile in dexDir.listFiles()?.sortedBy { it.name } ?: emptyList()) {
            if (!dexFile.name.endsWith(".dex")) continue
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            for (c in dex.classes) {
                if (c.type in listOf("Lknq;", "Lknk;", "Lkmd;", "Lkmo;")) {
                    foundZoom.add(c.type)
                }
                if (c.type in listOf("Lqge;", "Lqfz;", "Lqfr;", "Lqgh;", "Lkov;", "Ljex;")) {
                    foundPortrait.add(c.type)
                }
                if (c.type == "Lqxg;") {
                    val initM = c.methods.firstOrNull { it.name == "<init>" }
                    println("Found Lqxg; in ${dexFile.name}, <init> instructions count = ${initM?.implementation?.instructions?.count()}")
                    for (ins in initM?.implementation?.instructions ?: emptyList()) {
                        val refStr = (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString() ?: ""
                        if (refStr.contains("Lqv") && refStr.contains("->a")) {
                            println("   qxg.<init> look ref: $refStr")
                        }
                    }
                }
            }
        }
        println("Inspected patched dex: found ${foundZoom.size} zoom, ${foundPortrait.size} portrait, ${foundPhotoSaving.size} photo saving classes")
    }

    @Test
    fun testFindEmptyOrInvalidMethods() {
        val dexFile = java.io.File("build/tmp/test_patcher/patched_dex/classes.dex")
        if (!dexFile.exists()) return
        val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
        println("=== Inspecting ${dex.classes.size} classes in classes.dex ===")
        for (c in dex.classes) {
            println("Class: ${c.type}")
            for (m in c.methods) {
                val impl = m.implementation
                val insCount = impl?.instructions?.count() ?: -1
                if (insCount <= 0 && (m.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.ABSTRACT.value) == 0 && (m.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.NATIVE.value) == 0) {
                    println("  !!! EMPTY METHOD: ${c.type}->${m.name}(${m.parameterTypes.joinToString()}) (count=$insCount)")
                }
            }
        }
    }

    @Test
    fun testInspectPpnMethodO() {
        val dexFile = java.io.File("build/tmp/test_patcher/patched_dex/classes.dex")
        if (!dexFile.exists()) {
            println("Skipping testInspectPpnMethodO: classes.dex not in test_patcher")
            return
        }
        val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
        val ppnClass = dex.classes.firstOrNull { it.type == "Lppn;" } ?: return
        val oMethod = ppnClass.methods.firstOrNull { it.name == "o" && it.parameterTypes.size == 3 } ?: return
        val impl = oMethod.implementation ?: return
        println("=== ppn.o(FFF)V instructions (${impl.instructions.count()}) ===")
    }

    @Test
    fun testInspectPzj() {
        val dexDir = java.io.File("build/tmp/test_patcher/patched_dex")
        if (!dexDir.exists()) {
            println("Skipping testInspectPzj: test_patcher does not exist")
            return
        }
        for (dexFile in dexDir.listFiles()?.sortedBy { it.name } ?: emptyList()) {
            if (!dexFile.name.endsWith(".dex")) continue
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            val pzjClass = dex.classes.firstOrNull { it.type == "Lpzj;" } ?: continue
            println("Found Lpzj; in ${dexFile.name}")
            val nMethod = pzjClass.methods.firstOrNull { it.name == "n" && it.parameterTypes.size == 3 }
            if (nMethod != null) {
                val impl = nMethod.implementation
                println("pzj.n(FFF)V instruction count: ${impl?.instructions?.count()}")
                var foundConst1 = false
                for (ins in impl?.instructions ?: emptyList()) {
                    if (ins.opcode == com.android.tools.smali.dexlib2.Opcode.CONST_HIGH16) {
                        println("   Found const/high16: $ins")
                        foundConst1 = true
                    }
                }
                assertTrue(foundConst1, "pzj.n(FFF)V must contain const/high16 0x3f800000 (1.0f)")
            }
            val iMethod = pzjClass.methods.firstOrNull { it.name == "i" && it.returnType == "Z" }
            if (iMethod != null) {
                println("pzj.i()Z instruction count: ${iMethod.implementation?.instructions?.count()}")
            }
            val gMethod = pzjClass.methods.firstOrNull { it.name == "g" && it.returnType == "V" }
            if (gMethod != null) {
                println("pzj.g()V instruction count: ${gMethod.implementation?.instructions?.count()}")
            }
        }
    }

    @Test
    fun testInspectPtmAndLts() {
        val dexDir = java.io.File("build/tmp/test_patcher/patched_dex")
        if (!dexDir.exists()) {
            println("Skipping testInspectPtmAndLts: test_patcher does not exist")
            return
        }
        var foundPtm = false
        var foundLts = false
        for (dexFile in dexDir.listFiles()?.sortedBy { it.name } ?: emptyList()) {
            if (!dexFile.name.endsWith(".dex")) continue
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            val ptmClass = dex.classes.firstOrNull { it.type == "Lptm;" }
            if (ptmClass != null) {
                foundPtm = true
                val initMethod = ptmClass.methods.firstOrNull { it.name == "<init>" }
                val impl = initMethod?.implementation
                var foundConst0ForG = false
                for (i in 0 until (impl?.instructions?.count() ?: 0)) {
                    val ins = impl?.instructions?.elementAt(i)
                    if (ins?.opcode == com.android.tools.smali.dexlib2.Opcode.IPUT_BOOLEAN) {
                        val ref = (ins as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
                        if (ref?.name == "g" && ref.definingClass == "Lptm;") {
                            val prevIns = impl.instructions.elementAt(i - 1)
                            println("ptm.<init> field g assigned after: $prevIns")
                            if (prevIns.opcode == com.android.tools.smali.dexlib2.Opcode.CONST_4) {
                                foundConst0ForG = true
                            }
                        }
                    }
                }
                assertTrue(foundConst0ForG, "ptm.<init> must set field g using const/4 0")
            }

            val ltsClass = dex.classes.firstOrNull { it.type == "Llts;" }
            if (ltsClass != null) {
                foundLts = true
                val nMethod = ltsClass.methods.firstOrNull { it.name == "n" && it.parameterTypes == listOf("F", "Llsz;") }
                val impl = nMethod?.implementation
                var foundRemInt = false
                for (ins in impl?.instructions ?: emptyList()) {
                    if (ins.opcode == com.android.tools.smali.dexlib2.Opcode.REM_INT_LIT8) {
                        println("lts.n found: $ins")
                        foundRemInt = true
                    }
                }
                assertTrue(foundRemInt, "lts.n must contain rem-int/lit8 to map twilight knobs to brightness & shadow")
            }
        }
        assertTrue(foundPtm, "Lptm; must be found in patched dex")
        assertTrue(foundLts, "Llts; must be found in patched dex")
    }

    @Test
    fun testInspectQxgInit() {
        val apkFile = java.io.File("../../extracted_apkm/base.apk")
        if (!apkFile.exists()) {
            println("Skipping testInspectQxgInit: base.apk not found")
            return
        }
        val zip = java.util.zip.ZipFile(apkFile)
        for (entry in zip.entries()) {
            if (!entry.name.endsWith(".dex")) continue
            val tempFile = java.io.File.createTempFile("dex_", ".dex")
            tempFile.deleteOnExit()
            zip.getInputStream(entry).use { input ->
                tempFile.outputStream().use { output -> input.copyTo(output) }
            }
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(tempFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            val qxgClass = dex.classes.firstOrNull { it.type == "Lqxg;" }
            if (qxgClass != null) {
                println("Found Lqxg; in ${entry.name}")
                val initMethod = qxgClass.methods.firstOrNull { it.name == "<init>" }
                if (initMethod != null) {
                    val impl = initMethod.implementation
                    if (initMethod != null) {
                        println("Original qxg.<init> count = ${initMethod.implementation?.instructions?.count()}")
                    }
                }
                break
            }
        }
        zip.close()
    }

    @Test
    fun testInspectWqzMethodJ() {
        val dexDir = java.io.File("build/tmp/test_patcher/patched_dex")
        if (!dexDir.exists()) {
            println("Skipping testInspectWqzMethodJ: test_patcher does not exist")
            return
        }
        for (dexFile in dexDir.listFiles()?.sortedBy { it.name } ?: emptyList()) {
            if (!dexFile.name.endsWith(".dex")) continue
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            val wqzClass = dex.classes.firstOrNull { it.type == "Lwqz;" }
            if (wqzClass != null) {
                println("Found Lwqz; in ${dexFile.name}")
                break
            }
        }
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
            java.io.File(rootDir, "apktool_full/smali_classes2/kov.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/qge.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/qfz.smali"),
            java.io.File(rootDir, "apktool_full/smali/qfr.smali"),
            java.io.File(rootDir, "apktool_full/smali/qgh.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/jex.smali")
        ).filter { it.exists() }

        if (portraitSmaliFiles.isNotEmpty()) {
            val optionsPortrait = com.android.tools.smali.smali.SmaliOptions()
            val portraitDexOut = java.io.File("src/main/resources/PortraitControllers.dex")
            optionsPortrait.outputDexFile = portraitDexOut.absolutePath
            val portraitSuccess = com.android.tools.smali.smali.Smali.assemble(optionsPortrait, portraitSmaliFiles.map { it.absolutePath })
            if (portraitSuccess) {
                println("Generated PortraitControllers.dex: ${portraitDexOut.length()} bytes")
                portraitDexOut.copyTo(java.io.File("../src/main/resources/PortraitControllers.dex"), overwrite = true)
            }
        }

        val zoomSmaliFiles = listOf(
            java.io.File(rootDir, "apktool_full/smali_classes2/knq.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/knk.smali"),
            java.io.File(rootDir, "apktool_full/smali_classes2/kmd.smali"),
            java.io.File(rootDir, "apktool_full/smali/kmo.smali")
        ).filter { it.exists() }

        if (zoomSmaliFiles.isNotEmpty()) {
            val optionsZoom = com.android.tools.smali.smali.SmaliOptions()
            val zoomDexOut = java.io.File("src/main/resources/ZoomControllers.dex")
            optionsZoom.outputDexFile = zoomDexOut.absolutePath
            val zoomSuccess = com.android.tools.smali.smali.Smali.assemble(optionsZoom, zoomSmaliFiles.map { it.absolutePath })
            if (zoomSuccess) {
                println("Generated ZoomControllers.dex: ${zoomDexOut.length()} bytes")
                zoomDexOut.copyTo(java.io.File("../src/main/resources/ZoomControllers.dex"), overwrite = true)
            }
        }
    }
}

