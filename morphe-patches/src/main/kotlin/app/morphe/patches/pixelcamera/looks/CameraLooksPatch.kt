package app.morphe.patches.pixelcamera.looks

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

val cameraLooksPatch = bytecodePatch(
    name = "Camera Looks Backport",
    description = "Enables Google Pixel 11's 13 signature Camera Looks (Sauce & Tomte including Flat, Buffalo, Dijon) on Pixel 6 through Pixel 10, fixes Portrait Mode blur on all cameras, and resolves Pixel 10 photo saving.",
    default = true
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // ── 1. Hook uyv (device eligibility) ────────────────────────────────────────────
        mutableClassDefByOrNull("Lvku;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnTrue(clazz, "l")
        }

        // ── 1b. Hook isk.a(Ltbp;)Z → always return true (unblocks Looks pipeline in Photo & Night Sight) ─
        mutableClassDefByOrNull("Lizk;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnTrue(clazz, "a")
        }

        // ── 2. Force Real Camera Looks Manager (qkp.smali) ──────────────────────────────
        mutableClassDefByOrNull("Lqur;")?.let { clazz ->
            val smali = """
                iget-object v0, p0, Lqur;->b:Lacnw;
                invoke-interface {v0}, Lacnw;->a()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lqxb;
                return-object v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Lqxb;", smali)
        }

        // ── 3. Force Real Camera Looks State Provider (qkq.smali) ───────────────────────
        mutableClassDefByOrNull("Lqus;")?.let { clazz ->
            val smali = """
                iget-object v0, p0, Lqus;->b:Lacnw;
                invoke-interface {v0}, Lacnw;->a()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lqwj;
                return-object v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Lqwj;", smali)
        }

        // ── 4. Force Real Camera Looks UI Controls (qut.smali) ───────────────────────────
        mutableClassDefByOrNull("Lqut;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/lang/Object;" }?.let { method ->
                val impl = method.implementation ?: return@let
                val orElseIdx = impl.instructions.indexOfFirst {
                    (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("orElse") == true
                }
                if (orElseIdx != -1) {
                    val gotoIdx = impl.instructions.subList(orElseIdx, impl.instructions.size).indexOfFirst {
                        it.opcode == Opcode.GOTO || it.opcode == Opcode.GOTO_16 || it.opcode == Opcode.GOTO_32
                    }
                    if (gotoIdx != -1) {
                        val absGotoIdx = orElseIdx + gotoIdx
                        val startIdx = maxOf(0, orElseIdx - 1)
                        for (i in startIdx..absGotoIdx) {
                            impl.replaceInstruction(i, BuilderInstruction10x(Opcode.NOP))
                        }
                    }
                }
            }
        }

        // ── 5. Add 3 New Signature Looks (Flat, Buffalo, Dijon) & Notify Selection (qxg.smali) ──
        mutableClassDefByOrNull("Lqxg;")?.let { clazz ->
            // Unconditionally allow looks in all camera modes
            PixelCameraPatchUtils.forceReturnTrue(clazz, "j")
            PixelCameraPatchUtils.forceReturnTrue(clazz, "k")

            // 5a. Populate Flat (qvd), Buffalo (qvg), Dijon (qvi) in qxg.<init>
            clazz.methods.firstOrNull { it.name == "<init>" }?.let { method ->
                val impl = method.implementation ?: return@let
                val addQvaIdx = impl.instructions.indexOfFirst { ins ->
                    ins.opcode == com.android.tools.smali.dexlib2.Opcode.SGET_OBJECT &&
                    (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("Lqva;->a") == true
                }
                if (addQvaIdx != -1) {
                    val addLooksSmali = """
                        sget-object p4, Lqvd;->a:Lqvd;
                        invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                        sget-object p4, Lqvg;->a:Lqvg;
                        invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                        sget-object p4, Lqvi;->a:Lqvi;
                        invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                    """.trimIndent()
                    try {
                        val instructions = addLooksSmali.toInstructions(method)
                        var insertPos = addQvaIdx + 2
                        for (ins in instructions) {
                            impl.addInstruction(insertPos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }

            // 5b. Notify TomteInitHelper on Look Selection (b, c, g)
            for (methodName in listOf("b", "c", "g")) {
                clazz.methods.firstOrNull {
                    it.name == methodName &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0] == "Lqvj;"
                }?.let { method ->
                    val impl = method.implementation ?: return@let
                    val hookSmali = """
                        invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqvj;)V
                    """.trimIndent()
                    try {
                        val instructions = hookSmali.toInstructions(method)
                        var insertPos = 0
                        for (ins in instructions) {
                            impl.addInstruction(insertPos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 6. Sauce EXIF Metadata Fallback & Compose State Sync (rfx.smali) ──────────────
        mutableClassDefByOrNull("Lrfx;")?.let { clazz ->
            val smaliD = """
                invoke-interface {p0}, Lcbt;->fk()Ljava/lang/Object;
                move-result-object p0
                check-cast p0, Lqvj;
                invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqvj;)V
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "D", "Lqvj;", smaliD)

            // Fix method M throwing UnsupportedOperationException for Dijon, Buffalo, and Flat
            clazz.methods.firstOrNull { it.name == "M" }?.let { method ->
                val impl = method.implementation ?: return@let
                val uoeIdx = impl.instructions.indexOfFirst { ins ->
                    ins.opcode == Opcode.NEW_INSTANCE &&
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("UnsupportedOperationException") == true
                }
                if (uoeIdx != -1) {
                    val throwIdx = impl.instructions.subList(uoeIdx, impl.instructions.size).indexOfFirst {
                        it.opcode == Opcode.THROW
                    }
                    if (throwIdx != -1) {
                        val absThrowIdx = uoeIdx + throwIdx
                        for (i in uoeIdx..absThrowIdx) {
                            impl.replaceInstruction(i, BuilderInstruction10x(Opcode.NOP))
                        }
                    }
                }
            }
        }

        // ── 6b. Google Photos Sauce Metadata (qui.smali) ─────────────────────────────────
        mutableClassDefByOrNull("Lqui;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "e" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lpcl;" }?.let { method ->
                val impl = method.implementation ?: return@let
                val checkCastIdx = impl.instructions.indexOfFirst { ins ->
                    ins.opcode == Opcode.CHECK_CAST &&
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("Lqvj;") == true
                }
                if (checkCastIdx != -1) {
                    val oneReg = (impl.instructions[checkCastIdx] as? OneRegisterInstruction)?.registerA ?: 0
                    val hookSmali = """
                        invoke-static {v$oneReg}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookOrFallback(Lqvj;)Lqvj;
                        move-result-object v$oneReg
                    """.trimIndent()
                    try {
                        val instructions = hookSmali.toInstructions(method)
                        var insertPos = checkCastIdx + 1
                        for (ins in instructions) {
                            impl.addInstruction(insertPos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 7. Effective Look ID for Native Halide Processing (mla.smali) ────────────────
        mutableClassDefByOrNull("Lmtt;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "K" }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {v15}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I
                    move-result v15
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    val idx = impl.instructions.indexOfFirst {
                        it.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC &&
                        (it as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString()?.contains("ShotParams_tomte_type_set") == true
                    }
                    if (idx != -1) {
                        var pos = idx
                        for (ins in instructions) {
                            impl.addInstruction(pos++, ins)
                        }
                    }
                } catch (_: Throwable) {}

                // Hook applyShotParamsDenoiseAndSharpen right before RETURN_OBJECT
                try {
                    val retIdx = impl.instructions.indexOfLast {
                        it.opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT
                    }
                    if (retIdx != -1) {
                        val oneReg = (impl.instructions[retIdx] as? com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction)?.registerA ?: 9
                        val retHookSmali = """
                            invoke-static {v$oneReg}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->applyShotParamsDenoiseAndSharpen(Lcom/google/googlex/gcam/ShotParams;)V
                        """.trimIndent()
                        val retInstructions = retHookSmali.toInstructions(method)
                        var rPos = retIdx
                        for (rIns in retInstructions) {
                            impl.addInstruction(rPos++, rIns)
                        }
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 7b. Align SpecialTypesProvider Authority in ksa.smali for Cloned Package ──
        mutableClassDefByOrNull("Lksa;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "<clinit>" }?.let { method ->
                val impl = method.implementation ?: return@let
                for (i in 0 until impl.instructions.size) {
                    val ins = impl.instructions[i]
                    if (ins.opcode == com.android.tools.smali.dexlib2.Opcode.CONST_STRING) {
                        val refStr = (ins as? com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c)?.reference?.toString()
                        if (refStr == "com.google.android.apps.camera.specialtypes.SpecialTypesProvider") {
                            val newIns = "const-string v5, \"com.google.android.GoogleCamera.morphe.specialtypes.SpecialTypesProvider\"".toInstructions(method).first()
                            impl.replaceInstruction(i, newIns)
                        }
                    }
                }
            }
        }

        // ── 8. Bypass Sauce Onboarding & Tutorials (isu, qlr, rmn) ──────────────────────
        for (onboardingClass in listOf("Lizl;", "Lqvw;", "Lrxh;")) {
            mutableClassDefByOrNull(onboardingClass)?.let { clazz ->
                PixelCameraPatchUtils.forceReturnVoid(clazz, "a")
            }
        }

        // ── 9. Save static Application Context in CameraApp.smali ────────────────────
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/app/CameraApp;")?.let { clazz ->
            // Register Application Context in TomteInitHelper on onCreate()
            clazz.methods.firstOrNull { it.name == "onCreate" && it.parameterTypes.isEmpty() }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static/range {p0 .. p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setContext(Landroid/content/Context;)V
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var insertPos = 0
                    for (ins in instructions) {
                        impl.addInstruction(insertPos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 9b. Portrait controllers & look routing ──────────────────────────────────
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "PortraitControllers.dex")

        // ── 10. Hook klm feature flags via TomteInitHelper (Lasagna, Ark, Creator, Looks, Models) ─
        mutableClassDefByOrNull("Lksf;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            // Hook klm.a(Lkpr;)Lj$/util/Optional; for binned RAW dimension fallbacks (12MP photo saving fix)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
            // Hook klm.h(Lkps;)Ljava/lang/String; for pure-TFLite portrait models
            PixelCameraPatchUtils.hookKlmFlagH(clazz)
            // Hook klm.r(Lkps;)Lj$/util/Optional; for Boba Jelly ratios
            PixelCameraPatchUtils.hookKlmFlagR(clazz)
        }

        // ── 11. Hook Gallery Review Intent (hwb.w / hpq.cD) for Custom/Default Gallery ─
        mutableClassDefByOrNull("Lhwb;")?.let { clazz ->
            PixelCameraPatchUtils.hookGalleryReviewIntent(clazz)
        }
        mutableClassDefByOrNull("Lhpq;")?.let { clazz ->
            PixelCameraPatchUtils.hookGalleryReviewIntent(clazz)
        }

        // ── 12. Hook CameraActivity.onResume for Display Max Brightness ─────────────────
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/activity/main/CameraActivity;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "onResume" && it.parameterTypes.isEmpty() }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static/range {p0 .. p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->applyScreenBrightness(Landroid/app/Activity;)V
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var insertPos = 0
                    for (ins in instructions) {
                        impl.addInstruction(insertPos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 13. Hook tcc.f(F)V for Display Max Brightness ───────────────────
        mutableClassDefByOrNull("Ltcc;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "f" && it.parameterTypes == listOf("F") }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterBrightness(F)F
                    move-result p1
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var insertPos = 0
                    for (ins in instructions) {
                        impl.addInstruction(insertPos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 14. Hook rds.j to immediately update brightness when toggle changes ───────
        mutableClassDefByOrNull("Lrds;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "j" && it.parameterTypes == listOf("Ljava/lang/String;", "Z") }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {p1, p2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onSharedPrefChanged(Ljava/lang/String;Z)V
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var insertPos = 0
                    for (ins in instructions) {
                        impl.addInstruction(insertPos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 15. Hook CameraGm3SettingsActivity.onResume for Display Max Brightness ───
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/settings/activity/CameraGm3SettingsActivity;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "onResume" && it.parameterTypes.isEmpty() }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static/range {p0 .. p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->applyScreenBrightness(Landroid/app/Activity;)V
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var insertPos = 0
                    for (ins in instructions) {
                        impl.addInstruction(insertPos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 16. Hook msr / mjy for Gcam Tomte Grain model initialization and InitParams ─────
        (mutableClassDefByOrNull("Lmsr;") ?: mutableClassDefByOrNull("Lmjy;"))?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/lang/Object;" }?.let { method ->
                val impl = method.implementation ?: return@let

                // 16a. Hook finish_tomte_grain_enabled in InitParams
                val grainEnabledIdx = impl.instructions.indexOfFirst {
                    it.opcode == Opcode.INVOKE_STATIC &&
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("InitParams_finish_tomte_grain_enabled_set") == true
                }
                if (grainEnabledIdx != -1) {
                    if (grainEnabledIdx >= 2 && impl.instructions[grainEnabledIdx - 2].opcode == Opcode.IF_EQZ) {
                        impl.replaceInstruction(grainEnabledIdx - 2, BuilderInstruction10x(Opcode.NOP))
                    }
                    val hookSmali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isGrainEnabled()Z
                        move-result v12
                    """.trimIndent()
                    try {
                        val instructions = hookSmali.toInstructions(method)
                        var pos = grainEnabledIdx
                        for (ins in instructions) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }

                // 16b. Hook initTomteGrain on Gcam instantiation
                val gcamInitIdx = impl.instructions.indexOfFirst {
                    it.opcode == Opcode.INVOKE_DIRECT &&
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("Lcom/google/googlex/gcam/Gcam;-><init>(J)V") == true
                }
                if (gcamInitIdx != -1) {
                    val fiveReg = impl.instructions[gcamInitIdx] as? FiveRegisterInstruction
                    val reg = fiveReg?.registerD ?: 0
                    val regHigh = reg + 1
                    val hookSmali = """
                        invoke-static {v$reg, v$regHigh}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->initTomteGrain(J)V
                    """.trimIndent()
                    try {
                        val instructions = hookSmali.toInstructions(method)
                        var pos = gcamInitIdx + 1
                        for (ins in instructions) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }

                // 16c. Hook applyNativeTuning right before GcamModuleJNI.Gcam_Create
                val gcamCreateIdx = impl.instructions.indexOfFirst {
                    it.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("GcamModuleJNI;->Gcam_Create") == true
                }
                if (gcamCreateIdx != -1) {
                    val hookSmali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->applyNativeTuning()V
                    """.trimIndent()
                    try {
                        val instructions = hookSmali.toInstructions(method)
                        var pos = gcamCreateIdx
                        for (ins in instructions) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 17. Hook ndf / muh for TomteInitHelper.initTomteGrain before applyTomteImageFinalizer ──
        (mutableClassDefByOrNull("Lndf;") ?: mutableClassDefByOrNull("Lmuh;"))?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "a" &&
                it.parameterTypes.size == 2 &&
                it.parameterTypes[0].contains("InterleavedWriteViewU8") &&
                it.parameterTypes[1].contains("ShotMetadata")
            }?.let { method ->
                val impl = method.implementation ?: return@let

                // Hook processInterleavedImage at entry of method a for still photo look & warmth/vibrance grading
                val hookProcessSmali = """
                    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->processInterleavedImage(Lcom/google/googlex/gcam/InterleavedWriteViewU8;)V
                """.trimIndent()
                try {
                    val processIns = hookProcessSmali.toInstructions(method)
                    var p = 0
                    for (ins in processIns) {
                        impl.addInstruction(p++, ins)
                    }
                } catch (_: Throwable) {}

                val finalizerIdx = impl.instructions.indexOfFirst {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("applyTomteImageFinalizer") == true
                }
                if (finalizerIdx != -1) {
                    val gcamAIdx = impl.instructions.subList(0, finalizerIdx).indexOfLast {
                        (it as? ReferenceInstruction)?.reference?.toString()?.contains("Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J") == true
                    }
                    if (gcamAIdx != -1) {
                        val oneReg = (impl.instructions.getOrNull(gcamAIdx + 1) as? OneRegisterInstruction)?.registerA ?: 3
                        val oneRegHigh = oneReg + 1
                        val hookSmali = """
                            invoke-static {v$oneReg, v$oneRegHigh}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->initTomteGrain(J)V
                        """.trimIndent()
                        try {
                            val instructions = hookSmali.toInstructions(method)
                            var pos = gcamAIdx + 2
                            for (ins in instructions) {
                                impl.addInstruction(pos++, ins)
                            }
                        } catch (_: Throwable) {}
                    }
                }
            }
        }

        // ── 18. Hook sof.P(Ltbp;)V for Camera mode tracking in TomteInitHelper ────────
        mutableClassDefByOrNull("Lsof;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "P" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Ltbp;" &&
                it.returnType == "V"
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onModeChanged(Ljava/lang/Object;)V
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var pos = 0
                    for (ins in instructions) {
                        impl.addInstruction(pos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 19. Hook mqs / mia for TomteGrain unconditional startup initialization ─
        (mutableClassDefByOrNull("Lmqs;") ?: mutableClassDefByOrNull("Lmia;"))?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "a" &&
                (it.returnType == "Liuv;" || it.returnType == "Litv;")
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    const/4 v0, 0x1
                    iput-boolean v0, p0, ${clazz.type}->f:Z
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var pos = 0
                    for (ins in instructions) {
                        impl.addInstruction(pos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 20. Hook Lpbe; for In-App JPEG Quality & Spatial Noise Reduction ──
        mutableClassDefByOrNull("Lpbe;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/lang/Object;" }?.let { method ->
                val impl = method.implementation ?: return@let
                // 20a. CaptureRequest.JPEG_QUALITY hook
                val jpegIdx = impl.instructions.indexOfFirst {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("CaptureRequest;->JPEG_QUALITY") == true
                }
                if (jpegIdx != -1 && jpegIdx + 1 < impl.instructions.size) {
                    val hookSmali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getJpegQuality()I
                        move-result v0
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        impl.replaceInstruction(jpegIdx + 1, insList[0])
                        impl.addInstruction(jpegIdx + 2, insList[1])
                    } catch (_: Throwable) {}
                }

                // 20b. CaptureRequest.NOISE_REDUCTION_MODE hook
                val noiseIdx = impl.instructions.indexOfFirst {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("CaptureRequest;->NOISE_REDUCTION_MODE") == true
                }
                if (noiseIdx != -1 && noiseIdx + 1 < impl.instructions.size) {
                    val hookSmali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I
                        move-result v0
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        impl.replaceInstruction(noiseIdx + 1, insList[0])
                        impl.addInstruction(noiseIdx + 2, insList[1])
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 21. Hook JpgEncodeOptions for native Gcam JPEG quality override ──
        mutableClassDefByOrNull("Lcom/google/googlex/gcam/JpgEncodeOptions;")?.let { clazz ->
            // 21a. In <init>()V, invoke TomteInitHelper.getJpegQuality() and call b(I)
            clazz.methods.firstOrNull { it.name == "<init>" && it.parameterTypes.isEmpty() }?.let { method ->
                val impl = method.implementation ?: return@let
                val returnIdx = impl.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
                if (returnIdx != -1) {
                    val hookSmali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getJpegQuality()I
                        move-result v2
                        invoke-virtual {p0, v2}, Lcom/google/googlex/gcam/JpgEncodeOptions;->b(I)V
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        var pos = returnIdx
                        for (ins in insList) {
                            impl.addInstruction(pos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }

            // 21b. In b(I)V, force argument p1 to TomteInitHelper.getJpegQuality()
            clazz.methods.firstOrNull { it.name == "b" && it.parameterTypes == listOf("I") }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getJpegQuality()I
                    move-result p1
                """.trimIndent()
                try {
                    val insList = hookSmali.toInstructions(method)
                    var pos = 0
                    for (ins in insList) {
                        impl.addInstruction(pos++, ins)
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 22. Hook Laaei; for Gcam HDR+ NoiseModel tuning ──
        mutableClassDefByOrNull("Laaei;")?.let { clazz ->
            clazz.methods.firstOrNull { it.returnType == "Lcom/google/googlex/gcam/FrameMetadata;" }?.let { method ->
                val impl = method.implementation ?: return@let
                val cCallIndices = impl.instructions.mapIndexedNotNull { idx, ins ->
                    if ((ins as? ReferenceInstruction)?.reference?.toString() == "Lcom/google/googlex/gcam/FloatVector;->c(F)V") idx else null
                }
                for (idx in cCallIndices.reversed()) {
                    val ins = impl.instructions[idx] as? FiveRegisterInstruction
                    val reg = ins?.registerD ?: 4
                    val hookSmali = """
                        invoke-static {v$reg}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterNoiseScale(F)F
                        move-result v$reg
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        var pos = idx
                        for (hookIns in insList) {
                            impl.addInstruction(pos++, hookIns)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 23. Real-Time Viewfinder Look Preview via GL Fragment Shader Injection (wlo.smali) ──
        mutableClassDefByOrNull("Lwlo;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "c" && it.parameterTypes == listOf("Lwlp;", "Z") }?.let { method ->
                val impl = method.implementation ?: return@let
                val constStrIdx = impl.instructions.indexOfFirst { ins ->
                    ins.opcode == Opcode.CONST_STRING &&
                    (ins as? ReferenceInstruction)?.reference?.toString()?.contains("samplerExternalOES") == true
                }
                if (constStrIdx != -1) {
                    val hookSmali = """
                        invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getViewfinderFragmentShader()Ljava/lang/String;
                        move-result-object p1
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        impl.replaceInstruction(constStrIdx, insList[0])
                        impl.addInstruction(constStrIdx + 1, insList[1])
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 24. Live Viewfinder HardwareBuffer Grading Hook (SurfaceControlBufferFlinger.d) ──
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/viewfindereffects/bufferflinger/SurfaceControlBufferFlinger;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "d" }?.let { method ->
                val impl = method.implementation ?: return@let
                val monitorIdx = impl.instructions.indexOfFirst { it.opcode == Opcode.MONITOR_ENTER }
                if (monitorIdx != -1) {
                    val hookSmali = """
                        invoke-static/range {p1 .. p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->processHardwareBuffer(Landroid/hardware/HardwareBuffer;)V
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        impl.addInstruction(monitorIdx + 1, insList[0])
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 25. Ensure CPU Write Usage on Viewfinder ImageReader (vhw.smali) ──
        mutableClassDefByOrNull("Lvhw;")?.let { clazz ->
            clazz.methods.firstOrNull { it.parameterTypes == listOf("Lvlo;") }?.let { method ->
                val impl = method.implementation ?: return@let
                val setUsageIdx = impl.instructions.indexOfFirst {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("ImageReader\$Builder;->setUsage") == true
                }
                if (setUsageIdx != -1) {
                    val hookSmali = """
                        invoke-static {v2, v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPreviewBufferUsage(J)J
                        move-result-wide v2
                    """.trimIndent()
                    try {
                        val insList = hookSmali.toInstructions(method)
                        impl.addInstruction(setUsageIdx, insList[0])
                        impl.addInstruction(setUsageIdx + 1, insList[1])
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 26. Force VFE Pipeline Enablement (rvq.b) ──
        mutableClassDefByOrNull("Lrvq;")?.let { clazz ->
            val smali = """
                sget-object p0, Lyuq;->a:Lyuq;
                const/4 v0, 0x0
                invoke-static {p0, v0}, Lthd;->c(Ljava/util/Set;Z)Lthd;
                move-result-object p0
                invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Lthd;", smali)
        }

        // ── 27. Force VFE Presentation Creation (rva.m) ──
        mutableClassDefByOrNull("Lrva;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "m" && it.parameterTypes == listOf("Z", "Z") }?.let { method ->
                val impl = method.implementation ?: return@let
                val amIdx = impl.instructions.indexOfFirst {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("Lrva;->am:Lurt;") == true
                }
                if (amIdx != -1) {
                    val ifEqzIdx = impl.instructions.subList(amIdx, impl.instructions.size).indexOfFirst {
                        it.opcode == Opcode.IF_EQZ
                    }
                    if (ifEqzIdx != -1) {
                        val targetIdx = amIdx + ifEqzIdx
                        val forceOne = "const/4 v5, 0x1".toInstructions(method)
                        impl.addInstruction(targetIdx, forceOne[0])
                    }
                }
            }
        }

        // ── 28. Force Viewfinder Stream to ImageReader for VFE (ozw.b) ──
        mutableClassDefByOrNull("Lozw;")?.let { clazz ->
            val smaliB = """
                invoke-virtual {p0, p1}, Lozw;->a(Lusx;)Luwy;
                move-result-object p0
                invoke-static {}, Lvbg;->a()Lvbf;
                move-result-object p1
                sget-object v0, Lvbj;->a:Lvbj;
                iput-object v0, p1, Lvbf;->a:Lvbj;
                invoke-virtual {p1, p2}, Lvbf;->b(Lvgu;)V
                invoke-virtual {p1, p0}, Lvbf;->p(Luwy;)V
                const/16 p0, 0x22
                invoke-virtual {p1, p0}, Lvbf;->j(I)V
                const/4 p0, 0x7
                invoke-virtual {p1, p0}, Lvbf;->c(I)V
                const-wide/16 v0, 0x922
                invoke-virtual {p1, v0, v1}, Lvbf;->t(J)V
                invoke-virtual {p1}, Lvbf;->a()Lvbg;
                move-result-object p0
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Lvbg;", smaliB)
        }

        // ── 29. Hook qwh.smali to connect Tone & Color Fine-Tuning sliders to TomteInitHelper ──
        mutableClassDefByOrNull("Lqwh;")?.let { clazz ->
            // 29a. Hook qwh.l(IFZ)V for Tone fine tuning (Contrast, Shadows, Highlights)
            clazz.methods.firstOrNull { it.name == "l" && it.parameterTypes == listOf("I", "F", "Z") }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {p1, p2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->updateToneFineTuning(IF)V
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    var insertPos = 0
                    for (ins in instructions) {
                        impl.addInstruction(insertPos++, ins)
                    }
                } catch (_: Throwable) {}
            }

            // 29b. Hook qwh.j(IFZ)V for Color fine tuning (Vibrance, Tint)
            for (mName in listOf("j")) {
                clazz.methods.firstOrNull { it.name == mName && it.parameterTypes == listOf("I", "F", "Z") }?.let { method ->
                    val impl = method.implementation ?: return@let
                    val hookSmali = """
                        invoke-static {p1, p2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->updateColorFineTuning(IF)V
                    """.trimIndent()
                    try {
                        val instructions = hookSmali.toInstructions(method)
                        var insertPos = 0
                        for (ins in instructions) {
                            impl.addInstruction(insertPos++, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }

        // ── 30. Hook ListPreference.o(Ljava/lang/String;)V to restart camera on Noise/Sharpness change in Settings ──
        mutableClassDefByOrNull("Landroidx/preference/ListPreference;")?.let { clazz ->
            val smali = """
                iget-object v0, p0, Landroidx/preference/ListPreference;->i:Ljava/lang/String;
                if-eqz v0, :cond_initial_load
                invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
                move-result v0
                if-nez v0, :cond_done
                iput-object p1, p0, Landroidx/preference/ListPreference;->i:Ljava/lang/String;
                const/4 v0, 0x1
                iput-boolean v0, p0, Landroidx/preference/ListPreference;->E:Z
                invoke-virtual {p0, p1}, Landroidx/preference/Preference;->ab(Ljava/lang/String;)V
                invoke-virtual {p0}, Landroidx/preference/Preference;->d()V
                iget-object v0, p0, Landroidx/preference/Preference;->r:Ljava/lang/String;
                if-eqz v0, :cond_done
                const-string v1, "pref_camera_noise_reduction_key"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-nez v1, :cond_restart_tuning
                const-string v1, "pref_camera_sharpness_key"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :cond_done
                :cond_restart_tuning
                iget-object v0, p0, Landroidx/preference/Preference;->r:Ljava/lang/String;
                invoke-static {v0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setPrefEntry(Ljava/lang/String;Ljava/lang/String;)V
                invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->restartCameraForTuning()V
                :cond_done
                return-void
                :cond_initial_load
                iput-object p1, p0, Landroidx/preference/ListPreference;->i:Ljava/lang/String;
                const/4 v0, 0x1
                iput-boolean v0, p0, Landroidx/preference/ListPreference;->E:Z
                invoke-virtual {p0, p1}, Landroidx/preference/Preference;->ab(Ljava/lang/String;)V
                invoke-virtual {p0}, Landroidx/preference/Preference;->d()V
                return-void
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "o", "V", smali)
        }

        // ── 31. Hook Lrfl; to directly filter out Pro preferences in GM3 settings ──
        mutableClassDefByOrNull("Lrfl;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "ar" }?.let { method ->
                val impl = method.implementation ?: return@let
                val awIdx = impl.instructions.indexOfFirst {
                    (it as? ReferenceInstruction)?.reference?.toString()?.contains("Lrfl;->aw()V") == true
                }
                if (awIdx != -1) {
                    val hookSmali = "invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterProPreferences(Ljava/lang/Object;)V"
                    try {
                        val ins = hookSmali.toInstructions(method).firstOrNull()
                        if (ins != null) {
                            impl.addInstruction(awIdx, ins)
                        }
                    } catch (_: Throwable) {}
                }
            }
        }
    }
}



