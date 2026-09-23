package app.morphe.patches.pixelcamera

import org.junit.Test
import kotlin.test.assertTrue

class SmokeTest {
    @Test
    fun testInspectPatchedDex() {
        val dexDir = java.io.File("build/tmp/test_patcher/patched_dex")
        val found = mutableSetOf<String>()
        for (dexFile in dexDir.listFiles()?.sortedBy { it.name } ?: emptyList()) {
            if (!dexFile.name.endsWith(".dex")) continue
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexFile(dexFile, com.android.tools.smali.dexlib2.Opcodes.getDefault())
            for (c in dex.classes) {
                if (c.type in listOf("Lkfw;", "Lkgy;", "Lkgx;", "Lkhk;", "Lkgs;", "Lkfl;")) {
                    found.add(c.type)
                    println("${dexFile.name} defines ${c.type} with ${c.methods.count()} methods")
                }
            }
        }
        println("Total zoom classes found in patched output: ${found.size} / 6")
        assertTrue(found.size == 6, "All 6 zoom classes should be present in patched output")
    }
}

