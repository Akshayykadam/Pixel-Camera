package app.morphe.patches.pixelcamera

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x

object PixelCameraPatchUtils {

    /**
     * Replaces the entire body of the matching method with instructions compiled from smali.
     */
    fun replaceMethodBody(
        clazz: MutableClass?,
        methodName: String,
        returnType: String? = null,
        smaliBody: String
    ): Boolean {
        if (clazz == null) return false
        val method = clazz.methods.firstOrNull {
            it.name == methodName && (returnType == null || it.returnType == returnType)
        } ?: return false

        val impl = method.implementation ?: return false
        val newInstructions = smaliBody.trimIndent().toInstructions(method)
        clearTryBlocks(impl)
        while (impl.instructions.isNotEmpty()) {
            impl.removeInstruction(0)
        }
        for (ins in newInstructions) {
            impl.addInstruction(ins)
        }
        return true
    }

    /**
     * Forces a boolean method to always return true (const/4 v0, 0x1; return v0).
     */
    fun forceReturnTrue(clazz: MutableClass?, methodName: String): Boolean {
        if (clazz == null) return false
        val method = clazz.methods.firstOrNull {
            it.name == methodName && it.returnType == "Z"
        } ?: return false

        val impl = method.implementation ?: return false
        clearTryBlocks(impl)
        while (impl.instructions.isNotEmpty()) {
            impl.removeInstruction(0)
        }
        impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
        impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
        return true
    }

    /**
     * Forces a boolean method to always return false (const/4 v0, 0x0; return v0).
     */
    fun forceReturnFalse(clazz: MutableClass?, methodName: String): Boolean {
        if (clazz == null) return false
        val method = clazz.methods.firstOrNull {
            it.name == methodName && it.returnType == "Z"
        } ?: return false

        val impl = method.implementation ?: return false
        clearTryBlocks(impl)
        while (impl.instructions.isNotEmpty()) {
            impl.removeInstruction(0)
        }
        impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
        impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
        return true
    }

    /**
     * Forces a void method to immediately return void (return-void).
     */
    fun forceReturnVoid(clazz: MutableClass?, methodName: String): Boolean {
        if (clazz == null) return false
        val method = clazz.methods.firstOrNull {
            it.name == methodName && it.returnType == "V"
        } ?: return false

        val impl = method.implementation ?: return false
        clearTryBlocks(impl)
        while (impl.instructions.isNotEmpty()) {
            impl.removeInstruction(0)
        }
        impl.addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        return true
    }

    /**
     * Safely clears try-catch blocks from MutableMethodImplementation via reflection.
     * Note: impl.getTryBlocks() returns an unmodifiable list, so we must access the underlying field.
     */
    private fun clearTryBlocks(impl: com.android.tools.smali.dexlib2.builder.MutableMethodImplementation) {
        try {
            val field = com.android.tools.smali.dexlib2.builder.MutableMethodImplementation::class.java.getDeclaredField("tryBlocks")
            field.isAccessible = true
            (field.get(impl) as? MutableList<*>)?.clear()
        } catch (_: Throwable) {}
    }

    /**
     * Removes leading dragging suppression branch (if-eqz / if-nez) from live slider methods.
     */
    fun removeDraggingSuppression(method: MutableMethod?) {
        val impl = method?.implementation ?: return
        val first = impl.instructions.firstOrNull() ?: return
        if (first.opcode == Opcode.IF_EQZ || first.opcode == Opcode.IF_NEZ) {
            impl.removeInstruction(0)
            if (impl.instructions.firstOrNull()?.opcode == Opcode.RETURN_VOID) {
                impl.removeInstruction(0)
            }
        }
    }

    /**
     * Intercepts feature flags in klm by delegating q(kiz) and x(kiz) to TomteInitHelper.
     * Renames original methods to original_q and original_x, avoiding any branching bytecode modifications in klm.
     */
    fun hookKlmFlags(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_q" }) return
        val qMethod = clazz.methods.firstOrNull {
            it.name == "q" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkiz;" &&
            it.returnType == "Z"
        } ?: return

        val xMethod = clazz.methods.firstOrNull {
            it.name == "x" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkiz;" &&
            it.returnType == "Z"
        } ?: return

        val newQ = MutableMethod(qMethod)
        val newX = MutableMethod(xMethod)

        qMethod.name = "original_q"
        xMethod.name = "original_x"

        val smaliQ = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagQ(Lklm;Lkiz;)Z
            move-result v0
            return v0
        """.trimIndent()
        val qInstructions = smaliQ.toInstructions(newQ)
        val qImpl = newQ.implementation ?: return
        clearTryBlocks(qImpl)
        while (qImpl.instructions.isNotEmpty()) {
            qImpl.removeInstruction(0)
        }
        for (ins in qInstructions) {
            qImpl.addInstruction(ins)
        }

        val smaliX = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagX(Lklm;Lkiz;)Z
            move-result v0
            return v0
        """.trimIndent()
        val xInstructions = smaliX.toInstructions(newX)
        val xImpl = newX.implementation ?: return
        clearTryBlocks(xImpl)
        while (xImpl.instructions.isNotEmpty()) {
            xImpl.removeInstruction(0)
        }
        for (ins in xInstructions) {
            xImpl.addInstruction(ins)
        }

        clazz.methods.add(newQ)
        clazz.methods.add(newX)
    }

    /**
     * Intercepts klm.a(Lkiy;)Lj$/util/Optional; to provide binned RAW dimension
     * fallbacks for Pixel 9 Pro / Pixel 10 Pro 12MP photo saving.
     * Renames original to original_a and injects delegation to TomteInitHelper.interceptFlagA.
     */
    fun hookKlmFlagA(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_a" }) return
        val aMethod = clazz.methods.firstOrNull {
            it.name == "a" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkiy;" &&
            it.returnType == "Lj$/util/Optional;"
        } ?: return

        val newA = MutableMethod(aMethod)

        aMethod.name = "original_a"

        val smaliA = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagA(Lklm;Lkiy;)Lj$/util/Optional;
            move-result-object v0
            return-object v0
        """.trimIndent()
        val aInstructions = smaliA.toInstructions(newA)
        val aImpl = newA.implementation ?: return
        clearTryBlocks(aImpl)
        while (aImpl.instructions.isNotEmpty()) {
            aImpl.removeInstruction(0)
        }
        for (ins in aInstructions) {
            aImpl.addInstruction(ins)
        }

        clazz.methods.add(newA)
    }

    /**
     * Intercepts klm.h(Lkiz;)Ljava/lang/String; to route portrait segmenter, monocular, and matting
     * models to verified pure-TFLite models (midasnet, portrait_matting_mask, 1c33c30c...).
     * Renames original to original_h and injects delegation to TomteInitHelper.interceptFlagH.
     */
    fun hookKlmFlagH(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_h" }) return
        val hMethod = clazz.methods.firstOrNull {
            it.name == "h" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkiz;" &&
            it.returnType == "Ljava/lang/String;"
        } ?: return

        val newH = MutableMethod(hMethod)
        hMethod.name = "original_h"

        val smaliH = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagH(Lklm;Lkiz;)Ljava/lang/String;
            move-result-object v0
            return-object v0
        """.trimIndent()
        val hInstructions = smaliH.toInstructions(newH)
        val hImpl = newH.implementation ?: return
        clearTryBlocks(hImpl)
        while (hImpl.instructions.isNotEmpty()) {
            hImpl.removeInstruction(0)
        }
        for (ins in hInstructions) {
            hImpl.addInstruction(ins)
        }

        clazz.methods.add(newH)
    }

    /**
     * Intercepts klm.r(Lkiz;)Lj$/util/Optional; to provide Boba Jelly thresholds (0.0f, 1.0f).
     * Renames original to original_r and injects delegation to TomteInitHelper.interceptFlagR.
     */
    fun hookKlmFlagR(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_r" }) return
        val rMethod = clazz.methods.firstOrNull {
            it.name == "r" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkiz;" &&
            it.returnType == "Lj$/util/Optional;"
        } ?: return

        val newR = MutableMethod(rMethod)
        rMethod.name = "original_r"

        val smaliR = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagR(Lklm;Lkiz;)Lj$/util/Optional;
            move-result-object v0
            return-object v0
        """.trimIndent()
        val rInstructions = smaliR.toInstructions(newR)
        val rImpl = newR.implementation ?: return
        clearTryBlocks(rImpl)
        while (rImpl.instructions.isNotEmpty()) {
            rImpl.removeInstruction(0)
        }
        for (ins in rInstructions) {
            rImpl.addInstruction(ins)
        }

        clazz.methods.add(newR)
    }

    /**
     * Replaces class definitions in the active BytecodePatchContext with classes from a DEX resource.
     */
    fun replaceClassesFromDexResource(context: Any, resourceName: String) {
        val stream = PixelCameraPatchUtils::class.java.classLoader.getResourceAsStream(resourceName)
            ?: throw IllegalStateException("Resource not found: $resourceName")
        val bufferedStream = java.io.BufferedInputStream(stream)
        val dexFile = com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile.fromInputStream(
            com.android.tools.smali.dexlib2.Opcodes.getDefault(),
            bufferedStream
        )
        val patchClassesField = context.javaClass.getDeclaredField("patchClasses").apply { isAccessible = true }
        val patchClasses = patchClassesField.get(context)
        val classMapField = patchClasses.javaClass.getDeclaredField("classMap").apply { isAccessible = true }
        @Suppress("UNCHECKED_CAST")
        val classMap = classMapField.get(patchClasses) as MutableMap<String, Any>

        for (classDef in dexFile.classes) {
            val mutableClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(classDef)
            val wrapper = classMap[classDef.type]
            if (wrapper != null) {
                val setClassDefMethod = wrapper.javaClass.getMethod("setClassDef", com.android.tools.smali.dexlib2.iface.ClassDef::class.java)
                setClassDefMethod.invoke(wrapper, mutableClass)
            } else {
                val addClassMethod = patchClasses.javaClass.getDeclaredMethod("addClass\$morphe_patcher", com.android.tools.smali.dexlib2.iface.ClassDef::class.java)
                addClassMethod.isAccessible = true
                addClassMethod.invoke(patchClasses, mutableClass)
            }
        }
    }
}
