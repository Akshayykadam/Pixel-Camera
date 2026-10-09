package app.morphe.patches.pixelcamera.quickaccess

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

val quickAccessPatch = bytecodePatch(
    name = "Viewfinder Quick Access Controls",
    description = "Enables customizable Left/Right viewfinder quick-access shortcut slots, interactive Brightness & Shadow tick-slider with tap-focus guards, smooth shadow curve, and Camera Looks quick-access items."
) {
    extendWith("TomteInitHelper.dex")
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.1.040.982810059.19")
    )
    execute {
        // ── 1. Hook nzr.G(nzx)Z → allow DUAL_EXPOSURE / SINGLE_EXPOSURE, preserve Pro controls & Looks ──
        mutableClassDefByOrNull("Lnzr;")?.let { clazz ->
            val smaliG = """
                sget-object v0, Lnzx;->a:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->b:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->c:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->j:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->k:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->l:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->m:Lnzx;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnzx;->n:Lnzx;
                if-ne p1, v0, :cond_check_orig
                :cond_ret_true
                const/4 v0, 0x1
                return v0
                :cond_check_orig
                iget-object v0, p0, Lnzr;->k:Loba;
                invoke-virtual {v0, p1}, Loba;->n(Lnzx;)Z
                move-result v0
                return v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "G", "Z", smaliG)
        }

        // ── 2. Hook nzx.a()Z → true for Pro controls, Dual Exposure & Single Exposure ────
        mutableClassDefByOrNull("Lnzx;")?.let { clazz ->
            val smaliA = """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "a", "Z", smaliA)
        }

        // ── 3. Initial EV state in ldj.a() → default to DUAL_INDEPENDENT ─────────────
        mutableClassDefByOrNull("Lldj;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "a" && it.returnType == "Ljava/lang/Object;" }?.let { method ->
                val impl = method.implementation ?: return@let
                for (i in 0 until impl.instructions.size) {
                    val ins = impl.instructions[i]
                    if (ins.opcode == Opcode.SGET_OBJECT) {
                        val ref = (ins as? Instruction21c)?.reference as? FieldReference
                        if (ref?.definingClass == "Llsx;" && ref.name == "a") {
                            val newIns = "sget-object v0, Llsx;->c:Llsx;".toInstructions(method).first()
                            impl.replaceInstruction(i, newIns)
                            break
                        }
                    }
                }
            }
        }

        // ── 3b. Support dual exposure in nzr.e(lsx) ───────────────────────────────────
        mutableClassDefByOrNull("Lnzr;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "e" && it.parameterTypes == listOf("Llsx;") }?.let { method ->
                val smaliE = """
                    sget-object v0, Llsx;->a:Llsx;
                    invoke-virtual {p1, v0}, Llsx;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    const/4 p1, 0x1
                    sget-object v1, Lnzx;->b:Lnzx;
                    invoke-virtual {p0, v1, v0}, Lnzr;->v(Lnzx;Z)V
                    sget-object v1, Lnzx;->a:Lnzx;
                    invoke-virtual {p0, v1, p1}, Lnzr;->v(Lnzx;Z)V
                    return-void
                """.trimIndent()
                PixelCameraPatchUtils.replaceMethodBody(clazz, "e", "V", smaliE)
            }
        }

        // ── 4. Add osw.b()Z: Check if brightness or shadow sliders have active adjustments ──
        // Returns true if osw.c (brightness) or osw.d (shadow) hold a value >= 0.0f
        mutableClassDefByOrNull("Losw;")?.let { clazz ->
            if (clazz.methods.none { it.name == "b" && it.returnType == "Z" }) {
                val smaliB = """
                    iget-object v0, p0, Losw;->c:Lugh;
                    if-eqz v0, :cond_check_d
                    instance-of v1, v0, Lufn;
                    if-eqz v1, :cond_check_d
                    check-cast v0, Lufn;
                    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;
                    if-eqz v0, :cond_check_d
                    instance-of v1, v0, Ljava/lang/Float;
                    if-eqz v1, :cond_check_d
                    check-cast v0, Ljava/lang/Float;
                    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
                    move-result v0
                    const/4 v1, 0x0
                    cmpl-float v0, v0, v1
                    if-ltz v0, :cond_check_d
                    const/4 v0, 0x1
                    return v0
                    :cond_check_d
                    iget-object v0, p0, Losw;->d:Lugh;
                    if-eqz v0, :cond_ret_false
                    instance-of v1, v0, Lufn;
                    if-eqz v1, :cond_ret_false
                    check-cast v0, Lufn;
                    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;
                    if-eqz v0, :cond_ret_false
                    instance-of v1, v0, Ljava/lang/Float;
                    if-eqz v1, :cond_ret_false
                    check-cast v0, Ljava/lang/Float;
                    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
                    move-result v0
                    const/4 v1, 0x0
                    cmpl-float v0, v0, v1
                    if-ltz v0, :cond_ret_false
                    const/4 v0, 0x1
                    return v0
                    :cond_ret_false
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
                PixelCameraPatchUtils.addMethod(clazz, "b", "Z", listOf(), smaliB, 3)
            }
        }

        // ── 5. Guard tap-focus resets in pkb, pkn, pkw, pkc ──
        // When brightness/shadow sliders are active (osw.b()Z == true),
        // skip the ppn.f()/ppn.g()/osw.a() calls that would reset the AE pipeline.
        // This preserves slider adjustments across tap-to-focus events.
        PixelCameraPatchUtils.guardTapFocusResets(
            mutableClassDefByOrNull("Lpkb;"),
            mutableClassDefByOrNull("Lpss;"),
            mutableClassDefByOrNull("Lpkw;"),
            mutableClassDefByOrNull("Lpkc;")
        )

        // ── 6. Linearize shadow slider curve and activate DualEvCtrl in Lpzj; (11.1) and Lppn; (11.0) ──
        // Stock shadow curve uses an exponential ramp (r = ln(24)/ln(EV_range))
        // which concentrates perceptible change at the extremes.
        // Setting r = 1.0f provides uniform response across the slider range.
        mutableClassDefByOrNull("Lpzj;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "n" && it.parameterTypes.size == 3 &&
                it.parameterTypes.all { p -> p == "F" } &&
                it.returnType == "V"
            }?.let { method ->
                PixelCameraPatchUtils.linearizeShadowCurve(method)
            }
            PixelCameraPatchUtils.forceReturnTrue(clazz, "i")
            // Ensure pzj.g() unconditionally sets this.u to true by nopping the twilight bypass goto
            clazz.methods.firstOrNull { it.name == "g" && it.parameterTypes.isEmpty() && it.returnType == "V" }?.let { method ->
                val impl = method.implementation ?: return@let
                for (i in 0 until minOf(15, impl.instructions.size)) {
                    val ins = impl.instructions[i]
                    if (ins.opcode == Opcode.GOTO || ins.opcode == Opcode.GOTO_16) {
                        val nop = "nop".toInstructions(method).first()
                        impl.replaceInstruction(i, nop)
                        break
                    }
                }
            }
        }
        mutableClassDefByOrNull("Lppn;")?.let { clazz ->
            clazz.methods.firstOrNull {
                it.name == "o" && it.parameterTypes.size == 3 &&
                it.parameterTypes.all { p -> p == "F" } &&
                it.returnType == "V"
            }?.let { method ->
                PixelCameraPatchUtils.linearizeShadowCurve(method)
            }
            PixelCameraPatchUtils.forceReturnTrue(clazz, "i")
        }

        // ── 6b. Hook Lptm;-><init> → Force this.g = false so DualEvCtrl connects to Camera2 HAL in pin.smali ──
        mutableClassDefByOrNull("Lptm;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "<init>" }?.let { method ->
                val impl = method.implementation ?: return@let
                for (i in 0 until impl.instructions.size) {
                    val ins = impl.instructions[i]
                    if (ins.opcode == Opcode.IPUT_BOOLEAN) {
                        val ref = (ins as? Instruction22c)?.reference as? FieldReference
                        if (ref?.name == "g" && ref.definingClass == "Lptm;") {
                            val const0 = "const/4 p1, 0x0".toInstructions(method).first()
                            impl.replaceInstruction(i - 1, const0)
                            break
                        }
                    }
                }
            }
        }

        // ── 6c. Hook Llts;->n(FLlsz;)V → Route viewfinder dual sliders (lsz.c/lsz.d) to Brightness & Shadow observables ──
        mutableClassDefByOrNull("Llts;")?.let { clazz ->
            val smaliN = """
                const/high16 v0, 0x3f800000    # 1.0f
                cmpl-float v0, p1, v0
                if-gtz v0, :cond_b
                const/4 v0, 0x0
                cmpg-float v0, p1, v0
                if-gez v0, :cond_0
                goto/16 :goto_1
                :cond_0
                iget-object v0, p0, Llts;->e:Lusf;
                invoke-interface {v0}, Lusf;->d()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Llsx;
                sget-object v1, Llsx;->a:Llsx;
                if-ne v0, v1, :cond_3
                invoke-direct {p0}, Llts;->i()Z
                move-result p2
                if-eqz p2, :cond_2
                iget-object p2, p0, Llts;->a:Lcom/google/android/apps/camera/evcomp/EvCompView;
                invoke-virtual {p2, p1}, Lcom/google/android/apps/camera/evcomp/EvCompView;->i(F)V
                iget-boolean p2, p0, Llts;->s:Z
                if-eqz p2, :cond_1
                iget-object p2, p0, Llts;->g:Lusf;
                move-object v0, p2
                check-cast v0, Lurl;
                iget-object v0, v0, Lurl;->c:Ljava/lang/Object;
                check-cast v0, Ljava/lang/Float;
                invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
                move-result v0
                cmpl-float v0, p1, v0
                if-eqz v0, :cond_b
                invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                move-result-object p1
                invoke-interface {p2, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p0, p0, Llts;->i:Lusf;
                invoke-interface {p0}, Lusf;->d()Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lnzt;
                invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object p1
                iput-object p1, p2, Lnzt;->d:Lj$/util/Optional;
                invoke-interface {p0, p2}, Lusf;->a(Ljava/lang/Object;)V
                return-void
                :cond_1
                iget-object p2, p0, Llts;->v:Lusf;
                move-object v0, p2
                check-cast v0, Lurl;
                iget-object v0, v0, Lurl;->c:Ljava/lang/Object;
                check-cast v0, Ljava/lang/Float;
                invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
                move-result v0
                cmpl-float v0, p1, v0
                if-eqz v0, :cond_b
                invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                move-result-object p1
                invoke-interface {p2, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p0, p0, Llts;->i:Lusf;
                invoke-interface {p0}, Lusf;->d()Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lnzt;
                invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object p1
                iput-object p1, p2, Lnzt;->b:Lj$/util/Optional;
                invoke-interface {p0, p2}, Lusf;->a(Ljava/lang/Object;)V
                return-void
                :cond_2
                iget p2, p0, Llts;->k:I
                int-to-float p2, p2
                mul-float/2addr p2, p1
                invoke-static {p2}, Ljava/lang/Math;->round(F)I
                move-result p2
                iget v0, p0, Llts;->j:I
                add-int/2addr p2, v0
                iget v1, p0, Llts;->k:I
                int-to-float v1, v1
                mul-float/2addr v1, p1
                int-to-float p1, v0
                iget v0, p0, Llts;->l:F
                add-float/2addr v1, p1
                mul-float/2addr v1, v0
                iget-object p1, p0, Llts;->a:Lcom/google/android/apps/camera/evcomp/EvCompView;
                invoke-virtual {p1, v1}, Lcom/google/android/apps/camera/evcomp/EvCompView;->i(F)V
                iget-object p1, p0, Llts;->u:Lusf;
                move-object v0, p1
                check-cast v0, Lurl;
                iget-object v0, v0, Lurl;->c:Ljava/lang/Object;
                check-cast v0, Ljava/lang/Integer;
                invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
                move-result v0
                if-eq p2, v0, :cond_b
                invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object p2
                invoke-interface {p1, p2}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p0, p0, Llts;->i:Lusf;
                invoke-interface {p0}, Lusf;->d()Ljava/lang/Object;
                move-result-object p1
                check-cast p1, Lnzt;
                invoke-static {p2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object p2
                iput-object p2, p1, Lnzt;->i:Lj$/util/Optional;
                invoke-interface {p0, p1}, Lusf;->a(Ljava/lang/Object;)V
                return-void
                :cond_3
                invoke-virtual {p2}, Llsz;->ordinal()I
                move-result v0
                rem-int/lit8 v0, v0, 0x2
                const/high16 v1, -0x40800000    # -1.0f
                if-eqz v0, :cond_7
                const/4 v2, 0x1
                if-ne v0, v2, :cond_8
                goto :cond_6
                :cond_6
                iget-object v0, p0, Llts;->a:Lcom/google/android/apps/camera/evcomp/EvCompView;
                invoke-virtual {v0, p1}, Lcom/google/android/apps/camera/evcomp/EvCompView;->g(F)V
                iget-object v0, p0, Llts;->w:Lusf;
                move-object v2, v0
                check-cast v2, Lurl;
                iget-object v2, v2, Lurl;->c:Ljava/lang/Object;
                check-cast v2, Ljava/lang/Float;
                invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F
                move-result v2
                cmpl-float v2, p1, v2
                if-eqz v2, :cond_b
                invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                move-result-object p1
                invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object v0, p0, Llts;->f:Lusf;
                invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p1, p0, Llts;->v:Lusf;
                move-object v0, p1
                check-cast v0, Lurl;
                iget-object v0, v0, Lurl;->c:Ljava/lang/Object;
                check-cast v0, Ljava/lang/Float;
                invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
                move-result v0
                cmpl-float v0, v0, v1
                if-nez v0, :cond_8
                iget v0, p0, Llts;->q:F
                invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                move-result-object v0
                invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p1, p0, Llts;->g:Lusf;
                invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V
                goto :goto_0
                :cond_7
                iget-object v0, p0, Llts;->a:Lcom/google/android/apps/camera/evcomp/EvCompView;
                invoke-virtual {v0, p1}, Lcom/google/android/apps/camera/evcomp/EvCompView;->i(F)V
                iget-object v0, p0, Llts;->v:Lusf;
                move-object v2, v0
                check-cast v2, Lurl;
                iget-object v2, v2, Lurl;->c:Ljava/lang/Object;
                check-cast v2, Ljava/lang/Float;
                invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F
                move-result v2
                cmpl-float v2, p1, v2
                if-eqz v2, :cond_b
                invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                move-result-object p1
                invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object v0, p0, Llts;->g:Lusf;
                invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p1, p0, Llts;->w:Lusf;
                move-object v0, p1
                check-cast v0, Lurl;
                iget-object v0, v0, Lurl;->c:Ljava/lang/Object;
                check-cast v0, Ljava/lang/Float;
                invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F
                move-result v0
                cmpl-float v0, v0, v1
                if-nez v0, :cond_8
                iget v0, p0, Llts;->q:F
                invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
                move-result-object v0
                invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V
                iget-object p1, p0, Llts;->f:Lusf;
                invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V
                :cond_8
                :goto_0
                iget-boolean p1, p0, Llts;->s:Z
                if-eqz p1, :cond_a
                sget-object p1, Llsz;->c:Llsz;
                if-ne p2, p1, :cond_9
                iget-object p1, p0, Llts;->i:Lusf;
                invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lnzt;
                iget-object p0, p0, Llts;->g:Lusf;
                check-cast p0, Lurl;
                iget-object p0, p0, Lurl;->c:Ljava/lang/Object;
                check-cast p0, Ljava/lang/Float;
                invoke-static {p0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object p0
                iput-object p0, p2, Lnzt;->d:Lj$/util/Optional;
                invoke-interface {p1, p2}, Lusf;->a(Ljava/lang/Object;)V
                return-void
                :cond_9
                sget-object p1, Llsz;->d:Llsz;
                if-ne p2, p1, :cond_b
                iget-object p1, p0, Llts;->i:Lusf;
                invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lnzt;
                iget-object p0, p0, Llts;->f:Lusf;
                check-cast p0, Lurl;
                iget-object p0, p0, Lurl;->c:Ljava/lang/Object;
                check-cast p0, Ljava/lang/Float;
                invoke-static {p0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object p0
                iput-object p0, p2, Lnzt;->c:Lj$/util/Optional;
                invoke-interface {p1, p2}, Lusf;->a(Ljava/lang/Object;)V
                return-void
                :cond_a
                iget-object p1, p0, Llts;->i:Lusf;
                invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lnzt;
                iget-object v0, p0, Llts;->w:Lusf;
                check-cast v0, Lurl;
                iget-object v0, v0, Lurl;->c:Ljava/lang/Object;
                check-cast v0, Ljava/lang/Float;
                invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object v0
                iput-object v0, p2, Lnzt;->e:Lj$/util/Optional;
                invoke-interface {p1, p2}, Lusf;->a(Ljava/lang/Object;)V
                invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;
                move-result-object p2
                check-cast p2, Lnzt;
                iget-object p0, p0, Llts;->v:Lusf;
                check-cast p0, Lurl;
                iget-object p0, p0, Lurl;->c:Ljava/lang/Object;
                check-cast p0, Ljava/lang/Float;
                invoke-static {p0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;
                move-result-object p0
                iput-object p0, p2, Lnzt;->b:Lj$/util/Optional;
                invoke-interface {p1, p2}, Lusf;->a(Ljava/lang/Object;)V
                :cond_b
                :goto_1
                return-void
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "n", "V", smaliN)
        }

        // ── 7. Hook rdo.b(rdg) → Intercept quick access preferences via TomteInitHelper ──
        mutableClassDefByOrNull("Lrdo;")?.let { clazz ->
            val smaliB = """
                invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->interceptPref(Lrdo;Lrdg;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :cond_0
                return-object v0
                :cond_0
                invoke-virtual {p0, p1}, Lrdo;->c(Lrdg;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :cond_1
                return-object v0
                :cond_1
                iget-object p1, p1, Lrdg;->b:Lrdf;
                iget-object p0, p0, Lrdo;->f:Lksf;
                invoke-interface {p1, p0}, Lrdf;->a(Lksf;)Ljava/lang/Object;
                move-result-object p0
                return-object p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "b", "Ljava/lang/Object;", smaliB)
        }

        // ── 8. Hook ltg.i(lsx) → Force dual exposure (lsx.c) and ensure brightness & shadow knobs are attached & interactive ──
        mutableClassDefByOrNull("Lltg;")?.let { clazz ->
            val smaliI = """
                sget-object p1, Llsx;->c:Llsx;
                iget-object v0, p0, Lltg;->o:Lusf;
                invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V
                iget-object v0, p0, Lltg;->m:Lcom/google/android/apps/camera/evcomp/EvCompView;
                iget-object v1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->b:Lusf;
                invoke-interface {v1, p1}, Lusf;->a(Ljava/lang/Object;)V
                invoke-virtual {v0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->m()V
                invoke-virtual {v0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->k()V
                invoke-virtual {v0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->l()V
                iget-object v1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->a:Ljava/util/ArrayList;
                invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z
                move-result v4
                const/4 v3, 0x0
                if-nez v4, :cond_4
                invoke-interface {v1}, Ljava/util/List;->size()I
                move-result v4
                move v5, v3
                :goto_0
                if-ge v5, v4, :cond_3
                invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v6
                check-cast v6, Llsy;
                iget-object v7, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->e:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                invoke-virtual {v7, v6}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->indexOfChild(Landroid/view/View;)I
                move-result v7
                const/4 v8, -0x1
                if-eq v7, v8, :cond_1
                iget-object v7, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->e:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                invoke-virtual {v7, v6}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->removeView(Landroid/view/View;)V
                goto :goto_1
                :cond_1
                iget-object v7, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->f:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                invoke-virtual {v7, v6}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->indexOfChild(Landroid/view/View;)I
                move-result v7
                if-eq v7, v8, :cond_2
                iget-object v7, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->f:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                invoke-virtual {v7, v6}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->removeView(Landroid/view/View;)V
                :cond_2
                :goto_1
                add-int/lit8 v5, v5, 0x1
                goto :goto_0
                :cond_3
                invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V
                :cond_4
                invoke-virtual {v0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->j()V
                iget-object p1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->e:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                iget-object v2, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->g:Llsy;
                invoke-virtual {p1, v2}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->addView(Landroid/view/View;)V
                iget-object p1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->f:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                iget-object v2, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->h:Llsy;
                invoke-virtual {p1, v2}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->addView(Landroid/view/View;)V
                iget-object p1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->g:Llsy;
                invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                iget-object p1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->h:Llsy;
                invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                iget-object p1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->e:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                invoke-virtual {p1, v3}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->setVisibility(I)V
                iget-object p1, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->f:Lcom/google/android/apps/camera/evcomp/EvCompSlider;
                invoke-virtual {p1, v3}, Lcom/google/android/apps/camera/evcomp/EvCompSlider;->setVisibility(I)V
                invoke-interface {v1}, Ljava/util/List;->size()I
                move-result p1
                move v2, v3
                :goto_3
                if-ge v2, p1, :cond_7
                invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v4
                check-cast v4, Llsy;
                iget v5, v4, Llsy;->d:F
                invoke-virtual {v0, v4, v5}, Lcom/google/android/apps/camera/evcomp/EvCompView;->d(Llsy;F)V
                add-int/lit8 v2, v2, 0x1
                goto :goto_3
                :cond_7
                invoke-virtual {v0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->invalidate()V
                invoke-virtual {v0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->requestLayout()V
                iget-object p1, p0, Lltg;->l:Llts;
                new-array v0, v3, [Ljava/lang/Object;
                if-eqz p1, :cond_9
                invoke-virtual {p1}, Llto;->c()V
                invoke-virtual {p1}, Llts;->h()V
                iget-object v0, p0, Lltg;->m:Lcom/google/android/apps/camera/evcomp/EvCompView;
                iget-object v0, v0, Lcom/google/android/apps/camera/evcomp/EvCompView;->a:Ljava/util/ArrayList;
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :goto_5
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :cond_8
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Llsy;
                new-instance v2, Lltd;
                invoke-direct {v2, p0, p1}, Lltd;-><init>(Lltg;Llts;)V
                invoke-virtual {v1, v2}, Llsy;->setOnTouchListener(Landroid/view/View${'$'}OnTouchListener;)V
                goto :goto_5
                :cond_8
                return-void
                :cond_9
                new-instance p0, Lyje;
                const-string p1, "expected a non-null reference"
                invoke-static {p1, v0}, Lxum;->G(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
                move-result-object p1
                invoke-direct {p0, p1}, Lyje;-><init>(Ljava/lang/String;)V
                throw p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "i", "V", smaliI)
        }

        // ── 9. Hook ltg.j(ZZ) → Tap-to-focus always enters :cond_0 (never dropped) ──
        mutableClassDefByOrNull("Lltg;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "j" && it.parameterTypes == listOf("Z", "Z") }?.let { method ->
                val impl = method.implementation ?: return@let
                for (i in 0 until minOf(15, impl.instructions.size)) {
                    val ins = impl.instructions[i]
                    if (ins.opcode == Opcode.GOTO_16 || ins.opcode == Opcode.GOTO) {
                        val nop = "nop".toInstructions(method).first()
                        impl.replaceInstruction(i, nop)
                        break
                    }
                }
            }
        }

        // ── 10. Hook EvCompView.onMeasure(II) → Always measure and layout sliders ──
        mutableClassDefByOrNull("Lcom/google/android/apps/camera/evcomp/EvCompView;")?.let { clazz ->
            val smaliOnMeasure = """
                invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V
                invoke-virtual {p0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->m()V
                invoke-virtual {p0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->k()V
                invoke-virtual {p0}, Lcom/google/android/apps/camera/evcomp/EvCompView;->l()V
                return-void
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "onMeasure", "V", smaliOnMeasure)
        }
    }
}
