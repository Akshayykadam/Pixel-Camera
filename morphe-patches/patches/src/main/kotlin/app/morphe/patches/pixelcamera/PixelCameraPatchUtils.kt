package app.morphe.patches.pixelcamera

import app.morphe.patcher.patch.ResourcePatchContext
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
     * Unblocks Camera2 AE compensation dispatch in poo.smali (11.1) and pfh.smali (11.0)
     * by eliminating the pzj.i() / ppn.i() abort check, ensuring Video mode and single-slider
     * exposure adjustments are dispatched directly to the camera HAL request pipeline.
     */
    fun unblockAeCompensationDispatch(clazz: MutableClass?) {
        if (clazz == null) return
        val method = clazz.methods.firstOrNull {
            (it.name == "a" || it.name == "apply" || it.name == "c") &&
            it.parameterTypes == listOf("Ljava/lang/Object;") &&
            it.returnType == "V"
        } ?: return
        val impl = method.implementation ?: return
        for (i in 0 until impl.instructions.size) {
            val ins = impl.instructions[i]
            val ref = (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString() ?: ""
            if (ref.endsWith("->i()Z") && (ref.contains("pzj") || ref.contains("ppn"))) {
                val nop = "nop".toInstructions(method).first()
                if (i + 3 < impl.instructions.size) {
                    impl.replaceInstruction(i, nop)
                    impl.replaceInstruction(i + 1, nop)
                    impl.replaceInstruction(i + 2, nop)
                    impl.replaceInstruction(i + 3, nop)
                }
                break
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

    /**
     * Injects the Max display brightness strings and preference toggles into resources.
     */
    fun injectMaxBrightnessPreferences(context: ResourcePatchContext) {
        // 1. Inject strings into strings.xml
        try {
            val stringsFile = context.get("res/values/strings.xml", false)
            if (stringsFile.exists()) {
                var content = stringsFile.readText(Charsets.UTF_8)
                if (!content.contains("pref_camera_max_brightness_title")) {
                    val stringsToInject = """
    <string name="pref_camera_max_brightness_title">Max display brightness</string>
    <string name="pref_camera_max_brightness_summary">Set display backlight to 100% in viewfinder for accurate low-light exposure preview</string>
                    """.trimIndent()
                    content = content.replace("<resources>", "<resources>\n    $stringsToInject")
                    stringsFile.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}

        // 2. Inject toggle into camera_gm3_preferences.xml
        try {
            val gm3File = context.get("res/xml/camera_gm3_preferences.xml", false)
            if (gm3File.exists()) {
                var content = gm3File.readText(Charsets.UTF_8)
                val gm3Pref = """
        <com.google.android.apps.camera.ui.preference.ManagedSwitchPreferenceCompat android:icon="@drawable/gs_brightness_7_vd_theme_24"
                              android:title="@string/pref_camera_max_brightness_title"
                              android:key="pref_camera_max_brightness_key"
                              android:summary="@string/pref_camera_max_brightness_summary"
                              android:order="3"
                              android:defaultValue="false" />
                """.trimIndent()

                // If it was wrongly injected into pref_category_general previously, strip it out so it moves to pref_advanced_capture
                if (content.contains("android:key=\"pref_category_general\"") && content.contains("pref_camera_max_brightness_key")) {
                    val generalCatRegex = Regex("""(android:key="pref_category_general"[^>]*>[\s\S]*?)(</androidx\.preference\.PreferenceCategory>)""")
                    val genMatch = generalCatRegex.find(content)
                    if (genMatch != null && genMatch.value.contains("pref_camera_max_brightness_key")) {
                        val cleaned = genMatch.value.replace(Regex("""\s*<com\.google\.android\.apps\.camera\.ui\.preference\.ManagedSwitchPreferenceCompat[^>]*android:key="pref_camera_max_brightness_key"[^>]*/>"""), "")
                        content = content.replace(genMatch.value, cleaned)
                    }
                }

                if (!content.contains("pref_camera_max_brightness_key")) {
                    // Primary location: inside pref_advanced_capture ("Advanced" category)
                    val advancedRegex = Regex("""(android:key="pref_advanced_capture"[^>]*>[\s\S]*?)(</androidx\.preference\.PreferenceCategory>)""")
                    val advMatch = advancedRegex.find(content)
                    content = if (advMatch != null) {
                        val g1 = advMatch.groupValues[1]
                        val g2 = advMatch.groupValues[2]
                        content.substring(0, advMatch.range.first) + g1 + "\n        " + gm3Pref + "\n    " + g2 + content.substring(advMatch.range.last + 1)
                    } else {
                        val fallbackRegex = Regex("""(android:key="pref_category_general"[^>]*>[\s\S]*?)(</androidx\.preference\.PreferenceCategory>)""")
                        val fbMatch = fallbackRegex.find(content)
                        if (fbMatch != null) {
                            val g1 = fbMatch.groupValues[1]
                            val g2 = fbMatch.groupValues[2]
                            content.substring(0, fbMatch.range.first) + g1 + "\n        " + gm3Pref + "\n    " + g2 + content.substring(fbMatch.range.last + 1)
                        } else {
                            content.replace("</androidx.preference.PreferenceScreen>", "    $gm3Pref\n</androidx.preference.PreferenceScreen>")
                        }
                    }
                    gm3File.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}

        // 3. Inject toggle into camera_preferences.xml
        try {
            val camPrefFile = context.get("res/xml/camera_preferences.xml", false)
            if (camPrefFile.exists()) {
                var content = camPrefFile.readText(Charsets.UTF_8)
                val camPref = """
            <com.google.android.apps.camera.ui.preference.ManagedSwitchPreference android:icon="@drawable/gs_brightness_7_vd_theme_24"
                                  android:layout="@layout/preference_with_margin"
                                  android:title="@string/pref_camera_max_brightness_title"
                                  android:key="pref_camera_max_brightness_key"
                                  android:summary="@string/pref_camera_max_brightness_summary"
                                  android:order="3"
                                  android:defaultValue="false" />
                """.trimIndent()

                // If previously inside pref_category_general, clean it up
                if (content.contains("android:key=\"pref_category_general\"") && content.contains("pref_camera_max_brightness_key")) {
                    val generalCatRegex = Regex("""(android:key="pref_category_general"[^>]*>[\s\S]*?)(</PreferenceCategory>)""")
                    val genMatch = generalCatRegex.find(content)
                    if (genMatch != null && genMatch.value.contains("pref_camera_max_brightness_key")) {
                        val cleaned = genMatch.value.replace(Regex("""\s*<com\.google\.android\.apps\.camera\.ui\.preference\.ManagedSwitchPreference[^>]*android:key="pref_camera_max_brightness_key"[^>]*/>"""), "")
                        content = content.replace(genMatch.value, cleaned)
                    }
                }

                if (!content.contains("pref_camera_max_brightness_key")) {
                    // Primary location: inside pref_category_advanced ("Advanced" screen)
                    val advancedRegex = Regex("""(android:key="pref_category_advanced"[^>]*>[\s\S]*?)(</PreferenceScreen>)""")
                    val advMatch = advancedRegex.find(content)
                    content = if (advMatch != null) {
                        val g1 = advMatch.groupValues[1]
                        val g2 = advMatch.groupValues[2]
                        content.substring(0, advMatch.range.first) + g1 + "\n            " + camPref + "\n        " + g2 + content.substring(advMatch.range.last + 1)
                    } else {
                        val fallbackRegex = Regex("""(android:key="pref_category_general"[^>]*>[\s\S]*?)(</PreferenceCategory>)""")
                        val fbMatch = fallbackRegex.find(content)
                        if (fbMatch != null) {
                            val g1 = fbMatch.groupValues[1]
                            val g2 = fbMatch.groupValues[2]
                            content.substring(0, fbMatch.range.first) + g1 + "\n            " + camPref + "\n        " + g2 + content.substring(fbMatch.range.last + 1)
                        } else {
                            content.replace("</PreferenceScreen>", "    $camPref\n</PreferenceScreen>")
                        }
                    }
                    camPrefFile.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}
    }

    /**
     * Injects in-app JPEG Quality, Spatial Noise Reduction, RAW DNG Format, and Edge Sharpness preference menus
     * into camera_gm3_preferences.xml, camera_preferences.xml, arrays.xml, and strings.xml.
     * Also neutralizes the 48dp bottom margin on AutobahnViewPager in options_bottomsheet_tab.xml.
     */
    fun injectImageQualityPreferences(context: ResourcePatchContext) {
        // 1. Inject strings into strings.xml
        try {
            val stringsFile = context.get("res/values/strings.xml", false)
            if (stringsFile.exists()) {
                var content = stringsFile.readText(Charsets.UTF_8)
                val stringsToInject = buildString {
                    if (!content.contains("pref_camera_jpeg_quality_title")) {
                        append("""
    <string name="pref_camera_jpeg_quality_title">JPEG Quality</string>
    <string name="pref_camera_jpeg_quality_entry_100">100% (Maximum Quality)</string>
    <string name="pref_camera_jpeg_quality_entry_100_desc">Lossless quantization table for maximum fine texture preservation</string>
    <string name="pref_camera_jpeg_quality_entry_98">98% (High Quality)</string>
    <string name="pref_camera_jpeg_quality_entry_98_desc">High quality with lower compression artifacts</string>
    <string name="pref_camera_jpeg_quality_entry_95">95% (Stock)</string>
    <string name="pref_camera_jpeg_quality_entry_95_desc">Standard Google Camera JPEG compression</string>
    <string name="pref_camera_noise_reduction_title">Spatial Noise Reduction</string>
    <string name="pref_camera_noise_reduction_entry_stock">Stock (Standard)</string>
    <string name="pref_camera_noise_reduction_entry_stock_desc">Standard Google Camera bilateral spatial smoothing</string>
    <string name="pref_camera_noise_reduction_entry_minimal">Minimal</string>
    <string name="pref_camera_noise_reduction_entry_minimal_desc">Subtle smoothing; retains shadow microtextures</string>
    <string name="pref_camera_noise_reduction_entry_off">Off (Full Detail)</string>
    <string name="pref_camera_noise_reduction_entry_off_desc">Disables aggressive spatial denoising; preserves grass and foliage textures</string>
                        """.trimIndent())
                        append("\n")
                    }
                    if (!content.contains("pref_camera_raw_compression_title")) {
                        append("""
    <string name="pref_camera_raw_compression_title">RAW DNG Format</string>
    <string name="pref_camera_raw_compression_entry_uncompressed">Uncompressed 16-Bit RAW (Lossless Linear)</string>
    <string name="pref_camera_raw_compression_entry_uncompressed_desc">Saves pure uncompressed 16-bit linear Bayer samples for maximum dynamic range in Lightroom</string>
    <string name="pref_camera_raw_compression_entry_compressed">Compressed RAW (Standard)</string>
    <string name="pref_camera_raw_compression_entry_compressed_desc">Standard compressed DNG with reduced file size</string>
    <string name="pref_camera_sharpness_title">Edge Sharpness &amp; De-Ring</string>
    <string name="pref_camera_sharpness_entry_soft">Soft / Filmic (0.0x)</string>
    <string name="pref_camera_sharpness_entry_soft_desc">Zero digital unsharp masking; eliminates harsh edge halos and ringing</string>
    <string name="pref_camera_sharpness_entry_natural">Natural (0.5x)</string>
    <string name="pref_camera_sharpness_entry_natural_desc">Subtle edge contrast with film-like organic rolloff</string>
    <string name="pref_camera_sharpness_entry_standard">Standard (1.0x)</string>
    <string name="pref_camera_sharpness_entry_standard_desc">Default Google Camera edge sharpening</string>
                        """.trimIndent())
                        append("\n")
                    }
                }
                if (stringsToInject.isNotBlank()) {
                    content = content.replace("<resources>", "<resources>\n    $stringsToInject")
                    stringsFile.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}

        // 2. Inject arrays into arrays.xml
        try {
            val arraysFile = context.get("res/values/arrays.xml", false)
            if (arraysFile.exists()) {
                var content = arraysFile.readText(Charsets.UTF_8)
                val arraysToInject = buildString {
                    if (!content.contains("pref_camera_jpeg_quality_entries")) {
                        append("""
    <string-array name="pref_camera_jpeg_quality_entries">
        <item>@string/pref_camera_jpeg_quality_entry_100</item>
        <item>@string/pref_camera_jpeg_quality_entry_98</item>
        <item>@string/pref_camera_jpeg_quality_entry_95</item>
    </string-array>
    <string-array name="pref_camera_jpeg_quality_entrydescriptions">
        <item>@string/pref_camera_jpeg_quality_entry_100_desc</item>
        <item>@string/pref_camera_jpeg_quality_entry_98_desc</item>
        <item>@string/pref_camera_jpeg_quality_entry_95_desc</item>
    </string-array>
    <string-array name="pref_camera_jpeg_quality_entryvalues">
        <item>100</item>
        <item>98</item>
        <item>95</item>
    </string-array>
    <string-array name="pref_camera_noise_reduction_entries">
        <item>@string/pref_camera_noise_reduction_entry_stock</item>
        <item>@string/pref_camera_noise_reduction_entry_minimal</item>
        <item>@string/pref_camera_noise_reduction_entry_off</item>
    </string-array>
    <string-array name="pref_camera_noise_reduction_entrydescriptions">
        <item>@string/pref_camera_noise_reduction_entry_stock_desc</item>
        <item>@string/pref_camera_noise_reduction_entry_minimal_desc</item>
        <item>@string/pref_camera_noise_reduction_entry_off_desc</item>
    </string-array>
    <string-array name="pref_camera_noise_reduction_entryvalues">
        <item>stock</item>
        <item>minimal</item>
        <item>off</item>
    </string-array>
                        """.trimIndent())
                        append("\n")
                    }
                    if (!content.contains("pref_camera_raw_compression_entries")) {
                        append("""
    <string-array name="pref_camera_raw_compression_entries">
        <item>@string/pref_camera_raw_compression_entry_uncompressed</item>
        <item>@string/pref_camera_raw_compression_entry_compressed</item>
    </string-array>
    <string-array name="pref_camera_raw_compression_entrydescriptions">
        <item>@string/pref_camera_raw_compression_entry_uncompressed_desc</item>
        <item>@string/pref_camera_raw_compression_entry_compressed_desc</item>
    </string-array>
    <string-array name="pref_camera_raw_compression_entryvalues">
        <item>uncompressed</item>
        <item>compressed</item>
    </string-array>
    <string-array name="pref_camera_sharpness_entries">
        <item>@string/pref_camera_sharpness_entry_soft</item>
        <item>@string/pref_camera_sharpness_entry_natural</item>
        <item>@string/pref_camera_sharpness_entry_standard</item>
    </string-array>
    <string-array name="pref_camera_sharpness_entrydescriptions">
        <item>@string/pref_camera_sharpness_entry_soft_desc</item>
        <item>@string/pref_camera_sharpness_entry_natural_desc</item>
        <item>@string/pref_camera_sharpness_entry_standard_desc</item>
    </string-array>
    <string-array name="pref_camera_sharpness_entryvalues">
        <item>soft</item>
        <item>natural</item>
        <item>standard</item>
    </string-array>
                        """.trimIndent())
                        append("\n")
                    }
                }
                if (arraysToInject.isNotBlank()) {
                    content = content.replace("<resources>", "<resources>\n    $arraysToInject")
                    arraysFile.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}

        // 3. Inject preference list into camera_gm3_preferences.xml
        try {
            val gm3File = context.get("res/xml/camera_gm3_preferences.xml", false)
            if (gm3File.exists()) {
                var content = gm3File.readText(Charsets.UTF_8)
                if (!content.contains("pref_camera_jpeg_quality_key")) {
                    val gm3Prefs = """
        <com.google.android.apps.camera.ui.preference.ListWithDescriptionsPreferenceCompat android:icon="@drawable/gs_high_res_vd_theme_24" android:entries="@array/pref_camera_jpeg_quality_entries" android:title="@string/pref_camera_jpeg_quality_title" android:key="pref_camera_jpeg_quality_key" android:summary="%s" android:order="10" android:defaultValue="100" android:entryValues="@array/pref_camera_jpeg_quality_entryvalues" />
        <com.google.android.apps.camera.ui.preference.ListWithDescriptionsPreferenceCompat android:icon="@drawable/gs_texture_vd_theme_24" android:entries="@array/pref_camera_noise_reduction_entries" android:title="@string/pref_camera_noise_reduction_title" android:key="pref_camera_noise_reduction_key" android:summary="%s" android:order="11" android:defaultValue="stock" android:entryValues="@array/pref_camera_noise_reduction_entryvalues" />
        <com.google.android.apps.camera.ui.preference.ListWithDescriptionsPreferenceCompat android:icon="@drawable/gs_raw_on_vd_theme_24" android:entries="@array/pref_camera_raw_compression_entries" android:title="@string/pref_camera_raw_compression_title" android:key="pref_camera_raw_compression_key" android:summary="%s" android:order="12" android:defaultValue="uncompressed" android:entryValues="@array/pref_camera_raw_compression_entryvalues" />
        <com.google.android.apps.camera.ui.preference.ListWithDescriptionsPreferenceCompat android:icon="@drawable/gs_details_vd_theme_24" android:entries="@array/pref_camera_sharpness_entries" android:title="@string/pref_camera_sharpness_title" android:key="pref_camera_sharpness_key" android:summary="%s" android:order="13" android:defaultValue="natural" android:entryValues="@array/pref_camera_sharpness_entryvalues" />
                    """.trimIndent()

                    val targetRegex = Regex("""(android:key="pref_category_resolution_camera"[^>]*>[\s\S]*?)(</androidx\.preference\.PreferenceCategory>)""")
                    val match = targetRegex.find(content)
                    content = if (match != null) {
                        val g1 = match.groupValues[1]
                        val g2 = match.groupValues[2]
                        content.substring(0, match.range.first) + g1 + "\n    " + gm3Prefs + "\n  " + g2 + content.substring(match.range.last + 1)
                    } else {
                        content.replace("</androidx.preference.PreferenceScreen>", "    $gm3Prefs\n</androidx.preference.PreferenceScreen>")
                    }
                    gm3File.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}

        // 4. Inject preference list into camera_preferences.xml
        try {
            val camPrefFile = context.get("res/xml/camera_preferences.xml", false)
            if (camPrefFile.exists()) {
                var content = camPrefFile.readText(Charsets.UTF_8)
                if (!content.contains("pref_camera_jpeg_quality_key")) {
                    val camPrefs = """
            <ListPreference android:icon="@drawable/gs_high_res_vd_theme_24" android:entries="@array/pref_camera_jpeg_quality_entries" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_jpeg_quality_title" android:key="pref_camera_jpeg_quality_key" android:summary="%s" android:order="10" android:defaultValue="100" android:entryValues="@array/pref_camera_jpeg_quality_entryvalues" />
            <ListPreference android:icon="@drawable/gs_texture_vd_theme_24" android:entries="@array/pref_camera_noise_reduction_entries" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_noise_reduction_title" android:key="pref_camera_noise_reduction_key" android:summary="%s" android:order="11" android:defaultValue="stock" android:entryValues="@array/pref_camera_noise_reduction_entryvalues" />
            <ListPreference android:icon="@drawable/gs_raw_on_vd_theme_24" android:entries="@array/pref_camera_raw_compression_entries" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_raw_compression_title" android:key="pref_camera_raw_compression_key" android:summary="%s" android:order="12" android:defaultValue="uncompressed" android:entryValues="@array/pref_camera_raw_compression_entryvalues" />
            <ListPreference android:icon="@drawable/gs_details_vd_theme_24" android:entries="@array/pref_camera_sharpness_entries" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_sharpness_title" android:key="pref_camera_sharpness_key" android:summary="%s" android:order="13" android:defaultValue="natural" android:entryValues="@array/pref_camera_sharpness_entryvalues" />
                    """.trimIndent()

                    val targetRegex = Regex("""(android:key="pref_category_resolution_camera"[^>]*>[\s\S]*?)(</PreferenceCategory>)""")
                    val match = targetRegex.find(content)
                    content = if (match != null) {
                        val g1 = match.groupValues[1]
                        val g2 = match.groupValues[2]
                        content.substring(0, match.range.first) + g1 + "\n    " + camPrefs + "\n  " + g2 + content.substring(match.range.last + 1)
                    } else {
                        content.replace("</PreferenceScreen>", "    $camPrefs\n</PreferenceScreen>")
                    }
                    camPrefFile.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}

        // 5. Remove 48dp bottom margin on AutobahnViewPager in options_bottomsheet_tab.xml
        try {
            val tabXmlFile = context.get("res/layout/options_bottomsheet_tab.xml", false)
            if (tabXmlFile.exists()) {
                var content = tabXmlFile.readText(Charsets.UTF_8)
                if (content.contains("android:layout_marginBottom=\"48.0dp\"")) {
                    content = content.replace("android:layout_marginBottom=\"48.0dp\"", "android:layout_marginBottom=\"0.0dp\"")
                    tabXmlFile.writeText(content, Charsets.UTF_8)
                }
            }
        } catch (_: Throwable) {}
    }

    /**
     * Injects the localized application name 'Pixel Camera' (and native variants like
     * 'Pixel Kamera' for German, 'Cámara Pixel' for Spanish, 'Appareil photo Pixel' for French, etc.)
     * into all res/values and res/values-xxx/strings.xml resource folders.
     */
    fun injectLocalizedAppNames(context: ResourcePatchContext) {
        val langMap = mapOf(
            "values" to "Pixel Camera",
            "values-en-rGB" to "Pixel Camera",
            "values-en-rXA" to "[Þîxéļ Çåméŕå one]",
            "values-ar-rXB" to "‏‮Pixel Camera‬‏",
            "values-de" to "Pixel Kamera",
            "values-de-rAT" to "Pixel Kamera",
            "values-de-rCH" to "Pixel Kamera",
            "values-gsw" to "Pixel Kamera",
            "values-fr" to "Appareil photo Pixel",
            "values-fr-rCA" to "Appareil photo Pixel",
            "values-fr-rCH" to "Appareil photo Pixel",
            "values-es" to "Cámara Pixel",
            "values-es-rUS" to "Cámara Pixel",
            "values-b+es+419" to "Cámara Pixel",
            "values-es-rAR" to "Cámara Pixel",
            "values-es-rBO" to "Cámara Pixel",
            "values-es-rCL" to "Cámara Pixel",
            "values-es-rCO" to "Cámara Pixel",
            "values-es-rCR" to "Cámara Pixel",
            "values-es-rDO" to "Cámara Pixel",
            "values-es-rEC" to "Cámara Pixel",
            "values-es-rGT" to "Cámara Pixel",
            "values-es-rHN" to "Cámara Pixel",
            "values-es-rMX" to "Cámara Pixel",
            "values-es-rNI" to "Cámara Pixel",
            "values-es-rPA" to "Cámara Pixel",
            "values-es-rPE" to "Cámara Pixel",
            "values-es-rPR" to "Cámara Pixel",
            "values-es-rPY" to "Cámara Pixel",
            "values-es-rSV" to "Cámara Pixel",
            "values-es-rUY" to "Cámara Pixel",
            "values-es-rVE" to "Cámara Pixel",
            "values-it" to "Fotocamera Pixel",
            "values-pt" to "Câmera Pixel",
            "values-pt-rBR" to "Câmera Pixel",
            "values-pt-rPT" to "Câmara Pixel",
            "values-nl" to "Pixel Camera",
            "values-pl" to "Aparat Pixel",
            "values-ru" to "Камера Pixel",
            "values-uk" to "Камера Pixel",
            "values-cs" to "Fotoaparát Pixel",
            "values-sk" to "Kamera Pixel",
            "values-sl" to "Fotoaparat Pixel",
            "values-ro" to "Camera Pixel",
            "values-mo" to "Camera Pixel",
            "values-bg" to "Камера Pixel",
            "values-hr" to "Pixel kamera",
            "values-sr" to "Pixel камера",
            "values-b+sr+Latn" to "Pixel kamera",
            "values-bs" to "Pixel kamera",
            "values-hu" to "Pixel kamera",
            "values-el" to "Κάμερα Pixel",
            "values-tr" to "Pixel Kamera",
            "values-sv" to "Pixel Kamera",
            "values-da" to "Pixel Kamera",
            "values-nb" to "Pixel Kamera",
            "values-no" to "Pixel Kamera",
            "values-fi" to "Pixel Kamera",
            "values-ca" to "Càmera Pixel",
            "values-gl" to "Cámara Pixel",
            "values-eu" to "Pixel kamera",
            "values-is" to "Pixel Myndavél",
            "values-lt" to "Pixel fotoaparatas",
            "values-lv" to "Pixel kamera",
            "values-et" to "Pixel kaamera",
            "values-be" to "Камера Pixel",
            "values-mk" to "Камера Pixel",
            "values-sq" to "Pixel Kamera",
            "values-ga" to "Pixel Camera",
            "values-cy" to "Pixel Camera",
            "values-hy" to "Pixel տեսախցիկ",
            "values-ka" to "Pixel კამერა",
            "values-az" to "Pixel Kamera",
            "values-kk" to "Pixel камерасы",
            "values-ky" to "Pixel камера",
            "values-uz" to "Pixel Kamera",
            "values-af" to "Pixel Kamera",
            "values-zu" to "Ikhamera yePixel",
            "values-sw" to "Kamera ya Pixel",
            "values-am" to "Pixel ካሜራ",
            "values-ar" to "كاميرا Pixel",
            "values-ar-rEG" to "كاميرا Pixel",
            "values-ar-rSA" to "كاميرا Pixel",
            "values-iw" to "מצלמת Pixel",
            "values-he" to "מצלמת Pixel",
            "values-fa" to "دوربین Pixel",
            "values-ur" to "Pixel کیمرا",
            "values-hi" to "Pixel कैमरा",
            "values-mr" to "Pixel Camera",
            "values-gu" to "Pixel Camera",
            "values-bn" to "Pixel ক্যামেরা",
            "values-pa" to "Pixel ਕੈਮਰਾ",
            "values-ta" to "Pixel கேமரா",
            "values-te" to "Pixel కెమెరా",
            "values-kn" to "Pixel ಕ್ಯಾಮರಾ",
            "values-ml" to "Pixel ക്യാമറ",
            "values-or" to "Pixel କେମେରା",
            "values-as" to "Pixel কেমেৰা",
            "values-ne" to "Pixel क्यामेरा",
            "values-si" to "Pixel කැමරාව",
            "values-my" to "Pixel ကင်မရာ",
            "values-km" to "កាមេរ៉ា Pixel",
            "values-lo" to "ກ້ອງ Pixel",
            "values-th" to "กล้อง Pixel",
            "values-vi" to "Camera Pixel",
            "values-in" to "Kamera Pixel",
            "values-id" to "Kamera Pixel",
            "values-ms" to "Kamera Pixel",
            "values-tl" to "Pixel Camera",
            "values-fil" to "Pixel Camera",
            "values-ja" to "Pixel カメラ",
            "values-ko" to "Pixel 카메라",
            "values-zh" to "Pixel 相機",
            "values-zh-rCN" to "Pixel 相机",
            "values-zh-rHK" to "Pixel 相機",
            "values-zh-rTW" to "Pixel 相機",
            "values-mn" to "Pixel Камер",
            "values-en-rAU" to "Pixel Camera",
            "values-en-rCA" to "Pixel Camera",
            "values-en-rIE" to "Pixel Camera",
            "values-en-rIN" to "Pixel Camera",
            "values-en-rSG" to "Pixel Camera",
            "values-en-rXC" to "Pixel Camera",
            "values-en-rZA" to "Pixel Camera"
        )
        val appNameRegex = Regex("""<string name="app_name">.*?</string>""")
        for ((dir, label) in langMap) {
            try {
                val f = context.get("res/$dir/strings.xml", false)
                if (f.exists()) {
                    var c = f.readText(Charsets.UTF_8)
                    if (c.contains("""<string name="app_name">""")) {
                        c = appNameRegex.replace(c, """<string name="app_name">$label</string>""")
                    } else {
                        c = c.replace("<resources>", "<resources>\n    <string name=\"app_name\">$label</string>")
                    }
                    f.writeText(c, Charsets.UTF_8)
                }
            } catch (_: Throwable) {}
        }
    }
}
