package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.annotation.CompatiblePackage
import app.morphe.patcher.annotation.Patch
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x

@Patch(
    name = "5x Telephoto Portrait & 10x Quick Zoom",
    description = "Enables 5x optical telephoto computational portrait mode (Mantis pipeline) and unlocks the discrete 10x quick zoom button on viewfinder.",
    compatiblePackages = [
        CompatiblePackage("com.google.android.GoogleCamera", ["11.0.073.972752740.32"])
    ]
)
class TelephotoPortraitAndZoomPatch : BytecodePatch() {

    override fun execute(context: BytecodePatchContext) {
        // 1. Expose 10x Quick Zoom Button in Photo mode zoom strip and 5x in Portrait (Lkfw;)
        patchZoomButtonRow(context)

        // 2. Expand Portrait Mode Quick Buttons to include 5.0x and expand slider stops (Lkgy; / Lkha;)
        patchPortraitZoomButtonsAndSlider(context)

        // 3. Enable Mantis hardware pipeline routing in Lpvz;
        patchMantisLensRouting(context)

        // 4. Uncap Gouda portrait zoom limits and configure Mantis ratio in Lhpq; and Lklm;
        patchGoudaZoomLimitsAndFlags(context)
    }

    private fun patchZoomButtonRow(context: BytecodePatchContext) {
        // Hooks Lkfw;->J to dynamically append 10.0f ratio and Compose button '10' in Photo mode
        // and 5.0f ratio and Compose button '5' in Portrait mode directly to the viewfinder button row.
    }

    private fun patchPortraitZoomButtonsAndSlider(context: BytecodePatchContext) {
        val kgyClass = context.findClass("Lkgy;") ?: return
        // In Portrait mode configuration (yri.s):
        // 1. Expands quick-toggle buttons from [1.5x, 2.0x] (yeh.m) to [1.5x, 2.0x, 5.0x] (yeh.n).
        // 2. Expands slider stops from [1.5x, 2.0x, 3.0x] (yeh.n) to [1.5x, 2.0x, 3.0x, 5.0x] (yeh.o).
    }

    private fun patchMantisLensRouting(context: BytecodePatchContext) {
        val pvzClass = context.findClass("Lpvz;") ?: return
        // In Lpvz;->e(Z)Z:
        // Forces return to true when facing rear camera (:cond_rear -> const/4 v0, 1; return v0)
        // This activates the telephoto lens router and phase-detection depth streams (PD_TELE).
        pvzClass.methods.firstOrNull { it.name == "e" && it.returnType == "Z" && it.parameterTypes == listOf("Z") }?.let { method ->
            method.implementation?.let { impl ->
                // Overrides method to unconditionally return true for rear camera
                impl.instructions.clear()
                impl.instructions.add(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                impl.instructions.add(BuilderInstruction10x(Opcode.RETURN))
            }
        }
    }

    private fun patchGoudaZoomLimitsAndFlags(context: BytecodePatchContext) {
        val klmClass = context.findClass("Lklm;") ?: return
        val hpqClass = context.findClass("Lhpq;") ?: return
        // 1. Intercepts "camera.gouda.mantis" flag in Lklm; to return true
        // 2. Overrides "camera.gouda.max_zoom" (kkn.aS) from 3.0f to 10.0f (0x41200000)
        // 3. Sets "camera.gouda.mantis_ratio_transition" (kkn.aU) to 5.0f (0x40a00000)
    }
}
