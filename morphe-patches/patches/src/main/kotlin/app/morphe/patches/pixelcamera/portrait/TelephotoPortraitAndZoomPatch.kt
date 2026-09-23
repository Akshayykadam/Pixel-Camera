package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22t
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val telephotoPortraitAndZoomPatch = bytecodePatch(
    name = "10x Viewfinder Quick Zoom",
    description = "Unlocks the discrete 10x quick zoom button on viewfinder across Photo and Night Sight modes on Pro and telephoto Pixel devices."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        fun patchDeviceZoomConfig(clazz: MutableClass?) {
            if (clazz == null) return
            try {
                val method = clazz.methods.firstOrNull { it.name == "<init>" } ?: return
                val impl = method.implementation ?: return

                var first = true
                var i = 0
                while (i < impl.instructions.size) {
                    val ins = impl.instructions[i]
                    if (ins.opcode == Opcode.INVOKE_STATIC) {
                        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.definingClass == "Lyeh;" && ref.name == "p") {
                            first = false
                        } else if (ref?.definingClass == "Lyeh;" && ref.name == "o" && ref.parameterTypes.size == 4) {
                            val ins35c = ins as? Instruction35c
                            if (ins35c != null && ins35c.registerCount == 4 &&
                                ins35c.registerC == 6 && ins35c.registerD == 7 &&
                                ins35c.registerE == 8 && ins35c.registerF == 9) {

                                if (first) {
                                    val photoSmali = """
                                        const/high16 v10, 0x41200000
                                        invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                                        move-result-object v10
                                        invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;
                                        move-result-object v11
                                        invoke-virtual {v3, v11}, Laaxk;->v(Ljava/lang/Iterable;)V
                                        invoke-static {v3}, Lejn;->l(Laaxk;)Labae;
                                    """.trimIndent()
                                    try {
                                        val newIns = photoSmali.toInstructions(method)
                                        repeat(7) { impl.removeInstruction(i) }
                                        for (newInstruction in newIns) {
                                            impl.addInstruction(i++, newInstruction)
                                        }
                                        first = false
                                        continue
                                    } catch (_: Throwable) {}
                                } else {
                                    val otherSmali = """
                                        invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;
                                    """.trimIndent()
                                    try {
                                        val newIns = otherSmali.toInstructions(method)
                                        impl.removeInstruction(i)
                                        for (newInstruction in newIns) {
                                            impl.addInstruction(i++, newInstruction)
                                        }
                                        continue
                                    } catch (_: Throwable) {}
                                }
                            }
                        }
                    }
                    i++
                }
            } catch (_: Throwable) {}
        }

        // ── 1. Configure 10x buttons across Pro device configuration classes ─────────
        // kgy: Pixel 8 Pro (husky)
        // kgx: Pixel 9 Pro (caiman/komodo)
        // khk: Pixel 10 Pro
        // kgs: Pixel 7 Pro / Pixel 9 Pro Fold
        for (clsName in listOf("Lkgy;", "Lkgx;", "Lkhk;", "Lkgs;")) {
            mutableClassDefByOrNull(clsName)?.let { clazz ->
                patchDeviceZoomConfig(clazz)
            }
        }

        // ── 2. Hook kfw.o(kdz)V → Inject 10x buttons into Q & P and slider stops ────────
        mutableClassDefByOrNull("Lkfw;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "o" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Lkdz;"
            }?.let { method ->
                val impl = method.implementation ?: return@let

                // Locate the common J call (Lkfw;->J) where BOTH Pro (khn.i) and non-Pro (khn.e) paths merge
                var buttonHookIndex = -1
                for (idx in 0 until impl.instructions.size) {
                    val ins = impl.instructions[idx]
                    if (ins.opcode == Opcode.INVOKE_STATIC_RANGE || ins.opcode == Opcode.INVOKE_STATIC) {
                        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.definingClass == "Lkfw;" && ref.name == "J") {
                            buttonHookIndex = idx
                            break
                        }
                    }
                }

                // Hook slider stops collection (khn.f)
                var sliderHookIndex = -1
                for (idx in 2 until impl.instructions.size) {
                    val ins = impl.instructions[idx]
                    if (ins.opcode == Opcode.INVOKE_INTERFACE) {
                        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                        if (ref?.name == "addAll" && ref.definingClass == "Ljava/util/List;") {
                            val prev2 = impl.instructions[idx - 2]
                            val prevRef = (prev2 as? ReferenceInstruction)?.reference as? FieldReference
                            if (prevRef?.definingClass == "Lkhn;" && prevRef.name == "f") {
                                sliderHookIndex = idx + 1
                                break
                            }
                        }
                    }
                }

                // Insert from higher index first to preserve offsets
                if (sliderHookIndex != -1) {
                    val hookSliderSmali = """
                        invoke-static {v4}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->hookSliderStops(Ljava/util/List;)V
                    """.trimIndent()
                    try {
                        val insList = hookSliderSmali.toInstructions(method)
                        var pos = sliderHookIndex
                        for (ins in insList) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }

                if (buttonHookIndex != -1) {
                    val hookButtonsSmali = """
                        invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->hookZoomButtons(Lkfw;)V
                    """.trimIndent()
                    try {
                        val insList = hookButtonsSmali.toInstructions(method)
                        var pos = buttonHookIndex
                        for (ins in insList) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 3. Hook kfl.a(...) → Ensure dynamic zoom stops include 10.0f ─────────────────
        mutableClassDefByOrNull("Lkfl;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "a" &&
                it.parameterTypes.size == 2 &&
                it.returnType == "Ljava/lang/Object;"
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val vCallIndex = impl.instructions.indexOfFirst { ins ->
                    if (ins.opcode == Opcode.INVOKE_VIRTUAL) {
                        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.name == "v" && ref.definingClass == "Laaxk;"
                    } else false
                }
                if (vCallIndex != -1) {
                    val hookKflSmali = """
                        invoke-static {v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->hookSliderStops(Ljava/util/List;)V
                    """.trimIndent()
                    try {
                        val insList = hookKflSmali.toInstructions(method)
                        var pos = vCallIndex
                        for (ins in insList) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }
    }
}
