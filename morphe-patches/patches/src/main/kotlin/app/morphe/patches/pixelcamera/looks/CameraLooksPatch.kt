package app.morphe.patches.pixelcamera.looks

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val cameraLooksPatch = bytecodePatch(
    name = "Camera Looks Backport",
    description = "Enables Google Pixel 11's 13 signature Camera Looks (Sauce & Tomte including Flat, Buffalo, Dijon) on Pixel 6 through Pixel 10, fixes Portrait Mode blur on all cameras, and resolves Pixel 10 photo saving."
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // ── 1. Hook uyv (device eligibility) ────────────────────────────────────────────
        mutableClassDefByOrNull("Lvku;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnTrue(clazz, "l")
            PixelCameraPatchUtils.forceReturnTrue(clazz, "g")
            PixelCameraPatchUtils.forceReturnTrue(clazz, "f")
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

        // ── 5. Add 3 New Signature Looks (Flat, Buffalo, Dijon) & Notify Selection (qxg.smali) ──
        mutableClassDefByOrNull("Lqxg;")?.let { clazz ->
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

        // ── 6. Sauce EXIF Metadata Fallback (qkj.smali) ─────────────────────────────────
        mutableClassDefByOrNull("Lrfx;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "Z" }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookOrFallback(Lqvj;)Lqvj;
                    move-result-object v0
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    val idx = impl.instructions.indexOfFirst {
                        it.opcode == com.android.tools.smali.dexlib2.Opcode.CHECK_CAST
                    }
                    if (idx != -1) {
                        var pos = idx + 1
                        for (ins in instructions) {
                            impl.addInstruction(pos++, ins)
                        }
                    }
                } catch (_: Throwable) {}
            }
        }

        // ── 7. Effective Look ID for Native Halide Processing (mla.smali) ────────────────
        mutableClassDefByOrNull("Lmtt;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "K" }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I
                    move-result v7
                """.trimIndent()
                try {
                    val instructions = hookSmali.toInstructions(method)
                    val idx = impl.instructions.indexOfFirst {
                        it.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC &&
                        it.toString().contains("ShotParams_tomte_type_set")
                    }
                    if (idx != -1) {
                        var pos = idx
                        for (ins in instructions) {
                            impl.addInstruction(pos++, ins)
                        }
                    }
                } catch (_: Throwable) {}
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
    }
}
