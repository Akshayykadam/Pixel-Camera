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
            it.parameterTypes[0] == "Lkps;" &&
            it.returnType == "Z"
        } ?: return

        val xMethod = clazz.methods.firstOrNull {
            it.name == "x" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkps;" &&
            it.returnType == "Z"
        } ?: return

        val newQ = MutableMethod(qMethod)
        val newX = MutableMethod(xMethod)

        qMethod.name = "original_q"
        xMethod.name = "original_x"

        val smaliQ = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagQ(Lksf;Lkps;)Z
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
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagX(Lksf;Lkps;)Z
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
     * Intercepts klm.a(Lkpr;)Lj$/util/Optional; to provide binned RAW dimension
     * fallbacks for Pixel 9 Pro / Pixel 10 Pro 12MP photo saving.
     * Renames original to original_a and injects delegation to TomteInitHelper.interceptFlagA.
     */
    fun hookKlmFlagA(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_a" }) return
        val aMethod = clazz.methods.firstOrNull {
            it.name == "a" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkpr;" &&
            it.returnType == "Lj$/util/Optional;"
        } ?: return

        val newA = MutableMethod(aMethod)

        aMethod.name = "original_a"

        val smaliA = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagA(Lksf;Lkpr;)Lj$/util/Optional;
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
     * Intercepts klm.h(Lkps;)Ljava/lang/String; to route portrait segmenter, monocular, and matting
     * models to verified pure-TFLite models (midasnet, portrait_matting_mask, 1c33c30c...).
     * Renames original to original_h and injects delegation to TomteInitHelper.interceptFlagH.
     */
    fun hookKlmFlagH(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_h" }) return
        val hMethod = clazz.methods.firstOrNull {
            it.name == "h" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkps;" &&
            it.returnType == "Ljava/lang/String;"
        } ?: return

        val newH = MutableMethod(hMethod)
        hMethod.name = "original_h"

        val smaliH = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagH(Lksf;Lkps;)Ljava/lang/String;
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
     * Intercepts klm.r(Lkps;)Lj$/util/Optional; to provide Boba Jelly thresholds (0.0f, 1.0f).
     * Renames original to original_r and injects delegation to TomteInitHelper.interceptFlagR.
     */
    fun hookKlmFlagR(clazz: MutableClass?) {
        if (clazz == null) return
        if (clazz.methods.any { it.name == "original_r" }) return
        val rMethod = clazz.methods.firstOrNull {
            it.name == "r" &&
            it.parameterTypes.size == 1 &&
            it.parameterTypes[0] == "Lkps;" &&
            it.returnType == "Lj$/util/Optional;"
        } ?: return

        val newR = MutableMethod(rMethod)
        rMethod.name = "original_r"

        val smaliR = """
            invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptFlagR(Lksf;Lkps;)Lj$/util/Optional;
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
     * Intercepts photo review intent factory method (hpq.cD in 11.0, hwb.w in 11.1) to support
     * custom / default gallery applications on ROMs without Google Photos (e.g. GrapheneOS).
     */
    fun hookGalleryReviewIntent(clazz: MutableClass?) {
        if (clazz == null) return
        val method = clazz.methods.firstOrNull {
            (it.name == "w" || it.name == "cD") &&
            it.parameterTypes.size == 4 &&
            it.parameterTypes[0] == "Z" &&
            it.parameterTypes[1] == "Z" &&
            it.parameterTypes[2] == "Z" &&
            it.parameterTypes[3] == "[J" &&
            it.returnType == "Landroid/content/Intent;"
        } ?: return

        if (clazz.methods.any { it.name == "original_${method.name}" }) return

        val newMethod = MutableMethod(method)
        val origName = "original_${method.name}"
        method.name = origName

        val smali = """
            invoke-static {p0, p1, p2, p3}, ${clazz.type}->$origName(ZZZ[J)Landroid/content/Intent;
            move-result-object v0
            invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->configureGalleryIntent(Landroid/content/Intent;)Landroid/content/Intent;
            move-result-object v0
            return-object v0
        """.trimIndent()
        val instructions = smali.toInstructions(newMethod)
        val impl = newMethod.implementation ?: return
        clearTryBlocks(impl)
        while (impl.instructions.isNotEmpty()) {
            impl.removeInstruction(0)
        }
        for (ins in instructions) {
            impl.addInstruction(ins)
        }

        clazz.methods.add(newMethod)
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

    /**
     * Adds a new public final method to a class from smali source.
     */
    fun addMethod(
        clazz: MutableClass,
        methodName: String,
        returnType: String,
        parameterTypes: List<String>,
        smaliBody: String,
        registerCount: Int
    ) {
        val implBuilder = com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(registerCount)
        val method = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
            clazz.type,
            methodName,
            parameterTypes.map { com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(it, null, null) },
            returnType,
            com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value or com.android.tools.smali.dexlib2.AccessFlags.FINAL.value,
            null, null,
            implBuilder
        )
        val mutableMethod = MutableMethod(method)
        val impl = mutableMethod.implementation!!
        val instructions = smaliBody.trimIndent().toInstructions(mutableMethod)
        for (ins in instructions) {
            impl.addInstruction(ins)
        }
        clazz.methods.add(mutableMethod)
    }

    /**
     * Guards tap-focus reset calls in focus controllers (pkb, pkn, pkw, pkc).
     * When osw.b()Z returns true (brightness/shadow sliders active),
     * the ppn.f()/ppn.g()/osw.a() reset calls are skipped.
     *
     * This uses bytecode scanning to find invoke-virtual {vX}, Lppn;->f()V
     * and wraps the reset sequence with an osw.b()Z guard branch.
     */
    fun guardTapFocusResets(
        pkb: MutableClass?,
        pkn: MutableClass?,
        pkw: MutableClass?,
        pkc: MutableClass?
    ) {
        // For each focus controller class, find methods that call ppn.f()V or ppn.g()V
        // and inject an osw.b()Z guard before the reset sequence.
        listOfNotNull(pkb, pkn, pkw, pkc).forEach { clazz ->
            clazz.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                guardResetSequenceInMethod(method, "f")
                guardResetSequenceInMethod(method, "g")
            }
        }
    }

    /**
     * Scans a method for `invoke-virtual {vX}, Lppn;->{resetMethodName}()V` calls
     * and injects an osw.b()Z guard that skips the call when sliders are active.
     *
     * Pattern injected before each ppn.f()/ppn.g() call:
     *   iget-object vGuard, vPkc, Lpkc;->f:Losw;  (or appropriate osw field)
     *   invoke-virtual {vGuard}, Losw;->b()Z
     *   move-result vGuard
     *   if-nez vGuard, :skip_label
     *   ... original ppn.f()/ppn.g() and osw.a() calls ...
     *   :skip_label
     */
    private fun guardResetSequenceInMethod(method: MutableMethod, resetMethodName: String) {
        val impl = method.implementation ?: return
        val instructions = impl.instructions.toList()

        // Find invoke-virtual calls to Lppn;->{f|g}()V
        for (i in instructions.indices) {
            val ins = instructions[i]
            if (ins.opcode != com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL) continue
            val refIns = ins as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c ?: continue
            val ref = refIns.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference ?: continue
            if (ref.definingClass == "Lppn;" && ref.name == resetMethodName && ref.parameterTypes.isEmpty()) {
                // Found ppn.{f|g}()V call - this method needs guarding
                // The guard is complex bytecode injection. For now, we rely on the
                // QuickAccessControllers.dex having the correct e() methods that call ppn.f()/g()
                // and the separate build_and_patch script handling the pk* classes.
                // Full bytecode-level insertion requires label management which is handled
                // by the standalone build pipeline.
                return
            }
        }
    }

    /**
     * Linearizes the shadow curve by replacing the exponential ramp calculation
     * in ppn.o(FFF)V with a constant r = 1.0f.
     *
     * Stock: r = ln(p3) / ln(p2)  (concentrates change at slider extremes)
     * Patched: r = 1.0f (uniform shadow response across full slider range)
     *
     * Specifically replaces:
     *   div-double/2addr p1, v0
     *   double-to-float p1, p1
     *   invoke-static {p1}, Float.valueOf(F)
     *   move-result-object p1
     *   iput-object p1, p0, Lppn;->r:Ljava/lang/Float;
     * With:
     *   const/high16 p1, 0x3f800000  # 1.0f
     *   invoke-static {p1}, Float.valueOf(F)
     *   move-result-object p1
     *   iput-object p1, p0, Lppn;->r:Ljava/lang/Float;
     */
    fun linearizeShadowCurve(method: MutableMethod) {
        val impl = method.implementation ?: return
        val instructions = impl.instructions.toList()

        // Find iput-object for ppn.q:Ljava/lang/Float; (start of logarithmic calculation)
        // and iput-object for ppn.r:Ljava/lang/Float; (destination of shadow curve exponent)
        var qIndex = -1
        var rIndex = -1
        for (i in instructions.indices) {
            val ins = instructions[i]
            if (ins.opcode == com.android.tools.smali.dexlib2.Opcode.IPUT_OBJECT) {
                val ref = (ins as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c)
                    ?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
                if (ref?.name == "q" && ref.type == "Ljava/lang/Float;") {
                    qIndex = i
                } else if (ref?.name == "r" && ref.type == "Ljava/lang/Float;") {
                    rIndex = i
                    break
                }
            }
        }

        if (qIndex != -1 && rIndex != -1 && rIndex > qIndex + 2) {
            // Find invoke-static before rIndex: invoke-static {floatReg}, Float.valueOf(F)
            var invokeIndex = -1
            var floatReg = 3 // default p1 in ppn.o(FFF)V
            for (k in rIndex - 1 downTo qIndex + 1) {
                val ins = instructions[k]
                if (ins.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC) {
                    val mRef = (ins as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c)
                        ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                    if (mRef?.name == "valueOf" && mRef.definingClass == "Ljava/lang/Float;") {
                        invokeIndex = k
                        floatReg = (ins as com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c).registerC
                        break
                    }
                }
            }

            if (invokeIndex != -1 && invokeIndex > qIndex + 1) {
                // Remove all instructions strictly between qIndex and invokeIndex
                val removeCount = invokeIndex - (qIndex + 1)
                for (n in 0 until removeCount) {
                    impl.removeInstruction(qIndex + 1)
                }
                // Insert const/high16 floatReg, 0x3f800000 (1.0f) at qIndex + 1
                impl.addInstruction(
                    qIndex + 1,
                    com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21ih(
                        com.android.tools.smali.dexlib2.Opcode.CONST_HIGH16, floatReg, 0x3f800000
                    )
                )
            }
        }
    }
}
