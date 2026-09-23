package app.morphe.patches.pixelcamera.looks

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils

val cameraLooksPatch = bytecodePatch(
    name = "Camera Looks Backport",
    description = "Enables Google Pixel 11's 10 signature Camera Looks (Sauce & Tomte) on Pixel 6 through Pixel 10."
) {
    extendWith("TomteInitHelper.dex")

    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Hook uyv (device eligibility) ────────────────────────────────────────────
        mutableClassDefByOrNull("Luyv;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnTrue(clazz, "l")
            PixelCameraPatchUtils.forceReturnTrue(clazz, "g")
            PixelCameraPatchUtils.forceReturnTrue(clazz, "f")
        }

        // ── 1b. Hook isk.a(Lsql;)Z → always return true (unblocks Looks pipeline in Photo & Night Sight) ─
        mutableClassDefByOrNull("Lisk;")?.let { clazz ->
            PixelCameraPatchUtils.forceReturnTrue(clazz, "a")
        }

        // ── 2. Force Real Camera Looks Manager (qkp.smali) ──────────────────────────────
        mutableClassDefByOrNull("Lqkp;")?.let { clazz ->
            val smali = """
                iget-object v0, p0, Lqkp;->b:Laccg;
                invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lqms;
                return-object v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Lqms;", smali)
        }

        // ── 3. Force Real Camera Looks State Provider (qkq.smali) ───────────────────────
        mutableClassDefByOrNull("Lqkq;")?.let { clazz ->
            val smali = """
                iget-object v0, p0, Lqkq;->b:Laccg;
                invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lqmb;
                return-object v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Lqmb;", smali)
        }

        // ── 5. Notify TomteInitHelper on Look Selection (qmy.smali) ─────────────────────
        mutableClassDefByOrNull("Lqmy;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "b" &&
                it.parameterTypes.size == 1 &&
                it.parameterTypes[0] == "Lqlh;"
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqlh;)V
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

        // ── 6. Sauce EXIF Metadata Fallback (qkj.smali) ─────────────────────────────────
        mutableClassDefByOrNull("Lqkj;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "Z" }?.let { method ->
                val impl = method.implementation ?: return@let
                val hookSmali = """
                    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookOrFallback(Lqlh;)Lqlh;
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
        mutableClassDefByOrNull("Lmla;")?.let { clazz ->
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
        for (onboardingClass in listOf("Lisu;", "Lqlr;", "Lrmn;")) {
            mutableClassDefByOrNull(onboardingClass)?.let { clazz ->
                PixelCameraPatchUtils.forceReturnVoid(clazz, "a")
            }
        }

        // ── 9. Bypass split check in CameraApp.smali ───────────────────────────────────
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/app/CameraApp;")?.let { clazz ->
            val gASmali = """
                iget-object v0, p0, Lcom/google/android/apps/camera/app/CameraApp;->q:Linm;
                invoke-virtual {v0, p0}, Linm;->b(Landroid/content/Context;)V
                invoke-direct {p0}, Lcom/google/android/apps/camera/app/CameraApp;->i()Limi;
                move-result-object p0
                invoke-virtual {p0}, Limi;->gA()Ladvz;
                move-result-object p0
                invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "gA", "Ladvz;", gASmali)
        }

        // ── 10. Hook klm feature flags via TomteInitHelper (Lasagna, Ark, Creator, Looks) ─
        mutableClassDefByOrNull("Lklm;")?.let { clazz ->
            PixelCameraPatchUtils.hookKlmFlags(clazz)
            // Hook klm.a(Lkiy;)Lj$/util/Optional; for binned RAW dimension fallbacks (12MP photo saving fix)
            PixelCameraPatchUtils.hookKlmFlagA(clazz)
        }
    }
}
