package app.morphe.patches.pixelcamera.quickaccess

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.PixelCameraPatchUtils
import app.morphe.patches.pixelcamera.looks.cameraLooksPatch

val quickAccessPatch = bytecodePatch(
    name = "Viewfinder Quick Access Controls",
    description = "Enables customizable Left/Right viewfinder quick-access shortcut slots, interactive Brightness & Shadow tick-slider, and Camera Looks quick-access items."
) {
    dependsOn(cameraLooksPatch)
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCameraEng" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        // ── 1. Hook nqj.G(nqp)Z → allow DUAL_EXPOSURE / SINGLE_EXPOSURE, preserve Pro controls ──
        mutableClassDefByOrNull("Lnqj;")?.let { clazz ->
            val smaliG = """
                sget-object v0, Lnqp;->a:Lnqp;
                if-eq p1, v0, :cond_ret_true
                sget-object v0, Lnqp;->b:Lnqp;
                if-ne p1, v0, :cond_check_orig
                :cond_ret_true
                const/4 v0, 0x1
                return v0
                :cond_check_orig
                iget-object v0, p0, Lnqj;->k:Lnrs;
                invoke-virtual {v0, p1}, Lnrs;->l(Lnqp;)Z
                move-result v0
                return v0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "G", "Z", smaliG)
        }

        // ── 2. Hook nqp.a()Z → true for Pro controls, Dual Exposure & Single Exposure ────
        mutableClassDefByOrNull("Lnqp;")?.let { clazz ->
            val smaliA = """
                sget-object v0, Lnqp;->d:Lnqp;
                invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :cond_1
                sget-object v0, Lnqp;->e:Lnqp;
                invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :cond_1
                sget-object v0, Lnqp;->a:Lnqp;
                invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :cond_1
                sget-object v0, Lnqp;->b:Lnqp;
                invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z
                move-result p0
                if-eqz p0, :cond_0
                goto :goto_0
                :cond_0
                const/4 p0, 0x0
                return p0
                :cond_1
                :goto_0
                const/4 p0, 0x1
                return p0
            """.trimIndent()
            PixelCameraPatchUtils.replaceMethodBody(clazz, "a", "Z", smaliA)
        }

        // ── 3. Replace quick-access controllers & dispatchers with verified implementations ──
        // Replaces:
        // - nrd: Brightness slider controller (extends qhr, Dual-EV hardware compensation, reset smq)
        // - nrm: Shadows slider controller (extends qhr, Dual-EV hardware compensation, reset smq)
        // - mzc: Binds nqq.h/b to nrd/nrm (and nqq.j/i to nrd/nrm)
        // - qhm: Configures default quick-access to [nqq.h, nqq.b], bypasses eligibility checks
        // - nrc: Dispatches :pswitch_8 to nrd.s(...) and :pswitch_3 to nrm.s(...)
        PixelCameraPatchUtils.replaceClassesFromDexResource(this, "QuickAccessControllers.dex")
    }
}
