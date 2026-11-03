package app.morphe.patches.pixelcamera.pro

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val proControlsPatch = bytecodePatch(
    name = "Pro Manual Controls",
    description = "Enables Pro Manual Controls (Manual Focus, Shutter Speed, ISO, Focus Peaking, and Live Badges) on non-Pro Pixel models.",
    default = true
) {
    extendWith("TomteInitHelper.dex")
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // ── 1. Remove Dragging Suppression on Pro Sliders for Live Viewfinder Response ──
        // a) ISO: qaa.v(IZLsnw;)V
        mutableClassDefByOrNull("Lqaa;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "v" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "I" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                PixelCameraPatchUtils.removeDraggingSuppression(method)
            }
        }

        // b) Shutter Speed: qbb.v(JZLsnw;)V
        mutableClassDefByOrNull("Lqbb;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "v" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "J" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                PixelCameraPatchUtils.removeDraggingSuppression(method)
            }
        }

        // c) Manual Focus: nrn.t(FZLsnw;)V
        mutableClassDefByOrNull("Lnrn;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "t" &&
                it.parameterTypes.size == 3 &&
                it.parameterTypes[0] == "F" &&
                it.parameterTypes[1] == "Z" &&
                it.parameterTypes[2] == "Lsnw;"
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val first = impl.instructions.firstOrNull() ?: return@let
                if (first.opcode == Opcode.IF_EQZ || first.opcode == Opcode.IF_NEZ) {
                    impl.removeInstruction(0)
                }
            }
        }

        // ── 3. Camera2 AE Compensation Dispatch unblocking (poo.smali / pfh.smali) ────
        mutableClassDefByOrNull("Lpoo;")?.let { clazz ->
            PixelCameraPatchUtils.unblockAeCompensationDispatch(clazz)
        }
        mutableClassDefByOrNull("Lpfh;")?.let { clazz ->
            PixelCameraPatchUtils.unblockAeCompensationDispatch(clazz)
        }

        // ── 4. Public access for ppn fields ───────────────────────────────────────────
        mutableClassDefByOrNull("Lppn;")?.let { clazz ->
            val visibilityMask = (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv()
            clazz.fields.forEach { field ->
                if (field.name == "f" || field.name == "u") {
                    field.accessFlags = (field.accessFlags and visibilityMask) or AccessFlags.PUBLIC.value
                }
            }
        }

        // ── 5. Manual White Balance / Temperature: Unblock provider to always supply taj.c ──
        // 11.1: von.G(Ladnq;Lksf;)Lyia;
        mutableClassDefByOrNull("Lvon;")?.let { clazz ->
            val smali = """
                check-cast p0, Litz;
                invoke-virtual {p0}, Litz;->b()Lyia;
                move-result-object p0
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "G", "Lyia;", smali)
        }

        // 11.0: wqz.J(Ladbv;Lklm;)Lxwg;
        mutableClassDefByOrNull("Lwqz;")?.let { clazz ->
            val smali = """
                check-cast p0, Ling;
                invoke-virtual {p0}, Ling;->b()Lxwg;
                move-result-object p0
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "J", "Lxwg;", smali)
        }

        // ── 6. ons.e()V: Enable 50MP CAPTURE_RESOLUTION toggle on Pro devices ────────
        mutableClassDefByOrNull("Lons;")?.let { clazz ->
            val smali = """
                iget-object p0, p0, Lons;->a:Looa;
                iget-object v0, p0, Looa;->R:Lnxh;
                invoke-virtual {v0}, Lnxh;->a()V
                iget-object p0, p0, Looa;->j:Lppk;
                invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z
                move-result v0
                sget-object v1, Lpph;->m:Lpph;
                invoke-interface {p0, v0, v1}, Lppk;->q(ZLpph;)V
                return-void
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "e", "V", smali)
        }

        // ── 7. moo.a()Ljava/lang/Object;: 12MP/50MP Resolution row gated by isProDevice() ─
        mutableClassDefByOrNull("Lmoo;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/lang/Object;" }?.let { method ->
                val impl = method.implementation ?: return@let
                val itzIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Litz;->b()Lyia;") == true
                }
                if (itzIdx != -1 && itzIdx + 1 < impl.instructions.size) {
                    val insertPos = itzIdx + 2
                    val smali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z
                        move-result v8
                    """.trimIndent()
                    val insList = smali.toInstructions(method)
                    var pos = insertPos
                    for (ins in insList) {
                        impl.addInstruction(pos++, ins)
                    }
                }
            }
        }

        // ── 8. rdb: Neutralize 12MP downsampling reset in C() and D() on Pro devices ────
        mutableClassDefByOrNull("Lrdb;")?.let { clazz ->
            val earlyReturnSmali = """
                invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z
                move-result v0
                if-eqz v0, :cond_non_pro
                return-void
                :cond_non_pro
            """.trimIndent()

            // C(Lusf;Lppk;)V
            clazz.methods.firstOrNull { it.name == "C" }?.let { method ->
                val impl = method.implementation ?: return@let
                val instructions = earlyReturnSmali.toInstructions(method)
                var pos = 0
                for (ins in instructions) {
                    impl.addInstruction(pos++, ins)
                }
            }

            // D(ZLusf;Lppk;Lnhz;Lyia;)V
            clazz.methods.firstOrNull { it.name == "D" }?.let { method ->
                val impl = method.implementation ?: return@let
                val instructions = earlyReturnSmali.toInstructions(method)
                var pos = 0
                for (ins in instructions) {
                    impl.addInstruction(pos++, ins)
                }
            }
        }

        // ── 9. poy.M(I)V and poy.r(I)V: Inject TomteProSettingsPanel in bottom sheet ───
        mutableClassDefByOrNull("Lpoy;")?.let { clazz ->
            val smali = """
                invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings(Ljava/lang/Object;)V
            """.trimIndent()
            for (methodName in listOf("M", "r")) {
                clazz.methods.firstOrNull { it.name == methodName && it.parameterTypes == listOf("I") }?.let { method ->
                    val impl = method.implementation ?: return@let
                    val instructions = smali.toInstructions(method)
                    var pos = 0
                    for (ins in instructions) {
                        impl.addInstruction(pos++, ins)
                    }
                }
            }
        }

        // ── 10. pji.run()V: Inject TomteProSettingsPanel after wire loop ───────────────
        mutableClassDefByOrNull("Lpji;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "run" && it.returnType == "V" }?.let { method ->
                val impl = method.implementation ?: return@let
                val poyXIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lpoy;->x(Lppo;)V") == true
                }
                if (poyXIdx != -1) {
                    val targetIdx = poyXIdx + 2
                    val smali = "invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings(Ljava/lang/Object;)V"
                    val insList = smali.toInstructions(method)
                    var pos = targetIdx
                    for (ins in insList) {
                        impl.addInstruction(pos++, ins)
                    }
                }
            }
        }

        // ── 11. AutobahnViewPager.onMeasure: Expand height to Math.max of child tabs ──
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;")?.let { clazz ->
            val smali = """
                const-string v0, "AutobahnViewPager#onMeasure"
                invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V
                const/4 v0, 0x0
                move v1, v0
                :goto_0
                invoke-virtual {p0}, Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;->getChildCount()I
                move-result v2
                if-ge v0, v2, :cond_1
                invoke-virtual {p0, v0}, Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;->getChildAt(I)Landroid/view/View;
                move-result-object v2
                invoke-virtual {v2, p1, p2}, Landroid/view/View;->measure(II)V
                invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I
                move-result v2
                invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I
                move-result v1
                add-int/lit8 v0, v0, 0x1
                goto :goto_0
                :cond_1
                const/high16 p2, 0x40000000
                invoke-static {v1, p2}, Landroid/view/View${'$'}MeasureSpec;->makeMeasureSpec(II)I
                move-result p2
                invoke-super {p0, p1, p2}, Lgje;->onMeasure(II)V
                invoke-static {}, Landroid/os/Trace;->endSection()V
                return-void
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "onMeasure", "V", smali)
        }

        // ── 12. Unblock Manual ISO Without Requiring Manual Shutter Speed ──────────────
        // a) Record latest metered exposure time in qkw.is(Lvli;)V
        mutableClassDefByOrNull("Lqkw;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "is" }?.let { method ->
                val impl = method.implementation ?: return@let
                val idx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lqlb;->b(J)V") == true
                }
                if (idx != -1) {
                    val smali = "invoke-static {v6, v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->updateLastExposureTime(J)V"
                    val insList = smali.toInstructions(method)
                    var pos = idx + 1
                    for (ins in insList) {
                        impl.addInstruction(pos++, ins)
                    }
                }
            }
        }

        // b) Fallback to last metered exposure time in qdy.apply(Object) when qef.b <= 0
        mutableClassDefByOrNull("Lqdy;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "apply" }?.let { method ->
                val impl = method.implementation ?: return@let
                val idx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lqef;->b:J") == true
                }
                if (idx != -1 && idx + 1 < impl.instructions.size) {
                    val smali = "invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sanitizeExposureTime(J)Ljava/lang/Long;"
                    val replacementIns = smali.toInstructions(method).firstOrNull()
                    if (replacementIns != null) {
                        impl.removeInstruction(idx + 1)
                        impl.addInstruction(idx + 1, replacementIns)
                    }
                }
            }
        }

        // c) Drive CONTROL_AE_MODE by iso.isAuto in psk.a()
        mutableClassDefByOrNull("Lpsk;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/lang/Object;" }?.let { method ->
                val impl = method.implementation ?: return@let
                val idx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lusa;->g(Ljava/util/Collection;)Lurt;") == true
                }
                if (idx != -1 && idx + 2 < impl.instructions.size) {
                    // idx + 2 is `invoke-static {v7}, Lurp;->a(Lurt;)Lurt;`
                    // Replace v7 with v8 so v7 becomes urp.a(v8) in place without shifting switch offsets
                    val smali = "invoke-static {v8}, Lurp;->a(Lurt;)Lurt;"
                    val replacementIns = smali.toInstructions(method).firstOrNull()
                    if (replacementIns != null) {
                        impl.removeInstruction(idx + 2)
                        impl.addInstruction(idx + 2, replacementIns)
                    }
                }
            }
        }

        // d) Force CONTROL_AE_MODE to OFF when ISO is manual in nku.o
        mutableClassDefByOrNull("Lnku;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "o" }?.let { method ->
                val impl = method.implementation ?: return@let
                val gIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lnzu;->g:Lj$/util/Optional;") == true
                }
                if (gIdx != -1) {
                    repeat(4) {
                        impl.removeInstruction(gIdx)
                    }
                }
            }
        }

        // ── 13. 50MP High Resolution Metadata Hooks (Google Photos SpecialTypeID) ──
        // a) Route capture session high-res shot flag through isHighResShot(omw) into pck->f(Z) in oms and oml
        listOf("Loms;", "Loml;").forEach { classDesc ->
            mutableClassDefByOrNull(classDesc)?.let { clazz ->
                clazz.methods.forEach { method ->
                    val impl = method.implementation ?: return@forEach
                    val pckIdx = impl.instructions.indexOfFirst { ins ->
                        (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lpck;->f(Z)V") == true
                    }
                    if (pckIdx != -1) {
                        val ins = impl.instructions.elementAt(pckIdx) as? com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
                        if (ins != null) {
                            val reg = ins.registerA
                            val smali = """
                                if-nez v$reg, :cond_skip_hi_res
                                invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isHighResShot(Lomw;)Z
                                move-result v$reg
                                :cond_skip_hi_res
                            """.trimIndent()
                            val newIns = smali.toInstructions(method)
                            var pos = pckIdx
                            for (ni in newIns) {
                                impl.addInstruction(pos++, ni)
                            }
                        }
                    }
                }
            }
        }

        // b) rae: getEffectiveSpecialType in a(rbq, ...) and getEffectiveSpecialTypeId in b(yia, ...)
        mutableClassDefByOrNull("Lrae;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.parameterTypes.size == 3 }?.let { method ->
                val impl = method.implementation ?: return@let
                val cIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lrbq;->c:Lmhb;") == true
                }
                if (cIdx != -1) {
                    val smali = """
                        iget v2, p0, Lrae;->a:I
                        iget v3, p0, Lrae;->b:I
                        invoke-static {v1, v2, v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveSpecialType(Lmhb;II)Lmhb;
                        move-result-object v1
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = cIdx + 1
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }

            clazz.methods.firstOrNull { it.name == "b" && it.parameterTypes.size == 5 }?.let { method ->
                val impl = method.implementation ?: return@let
                val smali = """
                    iget v0, p0, Lrae;->a:I
                    iget v2, p0, Lrae;->b:I
                    invoke-static {p4, v0, v2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveSpecialTypeId(Ljava/lang/String;II)Ljava/lang/String;
                    move-result-object p4
                """.trimIndent()
                val newIns = smali.toInstructions(method)
                var pos = 0
                for (ni in newIns) {
                    impl.addInstruction(pos++, ni)
                }
            }
        }

        // c) mww: getEffectiveSpecialType in method saving JPEG
        mutableClassDefByOrNull("Lmww;")?.let { clazz ->
            clazz.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                val cIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lrbq;->c:Lmhb;") == true
                }
                if (cIdx != -1) {
                    val smali = """
                        move-object/from16 v1, v16
                        iget v5, v1, Lrae;->a:I
                        iget v1, v1, Lrae;->b:I
                        invoke-static {v3, v5, v1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveSpecialType(Lmhb;II)Lmhb;
                        move-result-object v3
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = cIdx + 1
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }
        }

        // d) mtf: isHighResolutionFinisher for MediaProvider special_type_id
        mutableClassDefByOrNull("Lmtf;")?.let { clazz ->
            clazz.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                val mwpIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lmwp;->c()Z") == true
                }
                if (mwpIdx != -1 && mwpIdx + 1 < impl.instructions.size) {
                    val smali = """
                        invoke-static {v1, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isHighResolutionFinisher(ZLjava/lang/Object;)Z
                        move-result v1
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = mwpIdx + 2
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }
        }

        // e) ocw: injectSpecialTypeToXmp in a([BJLocv;)Ljava/io/InputStream;
        mutableClassDefByOrNull("Locw;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.parameterTypes.size == 3 }?.let { method ->
                val impl = method.implementation ?: return@let
                val getIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z") == true
                }
                if (getIdx != -1) {
                    val smali = """
                        invoke-static {p0, v6, v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->injectSpecialTypeToXmp([BLgyn;Ljava/util/concurrent/atomic/AtomicBoolean;)V
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = getIdx
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }
        }

        // f) qui: injectSpecialTypeToXmpDirect in G(Ltmy;Lgyn;Lgyn;Lwep;Ljava/io/OutputStream;)V
        mutableClassDefByOrNull("Lqui;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "G" && it.parameterTypes.size == 5 }?.let { method ->
                val impl = method.implementation ?: return@let
                val pIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lvoc;->p([BLjava/io/OutputStream;Lgyn;Lgyn;)V") == true
                }
                if (pIdx != -1) {
                    val smali = """
                        invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->injectSpecialTypeToXmpDirect([BLgyn;)V
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = pIdx
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }
        }

        // g) fp: getEffectiveSpecialTypeForJpegBytes
        mutableClassDefByOrNull("Lfp;")?.let { clazz ->
            clazz.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                val cIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lrbq;->c:Lmhb;") == true
                }
                if (cIdx != -1) {
                    val smali = """
                        invoke-static {v0, v1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveSpecialTypeForJpegBytes(Lmhb;Ljava/lang/Object;)Lmhb;
                        move-result-object v0
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = cIdx + 1
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }
        }

        // h) mgx: resolveSpecialTypeForMediaId in a(Landroid/net/Uri;[Ljava/lang/String;)Landroid/database/Cursor;
        mutableClassDefByOrNull("Lmgx;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.parameterTypes.size == 2 }?.let { method ->
                val impl = method.implementation ?: return@let
                val aIdx = impl.instructions.indexOfFirst { ins ->
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lmhi;->a(J)Lyia;") == true
                }
                if (aIdx != -1) {
                    val smali = """
                        invoke-static {p0, p1, p2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->resolveSpecialTypeForMediaId(Lyia;J)Lyia;
                        move-result-object p0
                    """.trimIndent()
                    val newIns = smali.toInstructions(method)
                    var pos = aIdx + 2
                    for (ni in newIns) {
                        impl.addInstruction(pos++, ni)
                    }
                }
            }
        }
    }
}
