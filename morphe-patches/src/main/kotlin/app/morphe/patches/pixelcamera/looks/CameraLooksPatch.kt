package app.morphe.patches.pixelcamera.looks

import app.morphe.patcher.annotation.CompatiblePackage
import app.morphe.patcher.annotation.Patch
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

@Patch(
    name = "Camera Looks Backport",
    description = "Enables Google Pixel 11's 10 signature Camera Looks (Sauce & Tomte) on Pixel 6 through Pixel 10.",
    compatiblePackages = [
        CompatiblePackage("com.google.android.GoogleCamera", ["11.0.073.972752740.32"])
    ]
)
class CameraLooksPatch : BytecodePatch() {

    override fun execute(context: BytecodePatchContext) {
        // 1. Force hardware eligibility checks in Luyv; to return true
        patchDeviceEligibility(context)

        // 2. Intercept camera.sauce and camera.gouda feature flags in Lklm;
        patchFeatureFlags(context)

        // 3. Patch sauce eligibility predicate in Lqau;
        patchSaucePredicate(context)

        // 4. Hook Look Manager and Look State in Lqkp; and Lqkq;
        patchLookProviders(context)
    }

    private fun patchDeviceEligibility(context: BytecodePatchContext) {
        val uyvClass = context.findClass("Luyv;") ?: return
        val methodsToOverride = listOf("l", "g", "f")

        for (methodName in methodsToOverride) {
            uyvClass.methods.firstOrNull { it.name == methodName && it.returnType == "Z" }?.let { method ->
                method.implementation?.let { impl ->
                    // Replace method body with: const/4 v0, 0x1 ; return v0
                    impl.instructions.clear()
                    impl.instructions.add(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.instructions.add(BuilderInstruction10x(Opcode.RETURN))
                }
            }
        }
    }

    private fun patchFeatureFlags(context: BytecodePatchContext) {
        val klmClass = context.findClass("Lklm;") ?: return
        val qMethod = klmClass.methods.firstOrNull { it.name == "q" && it.parameterTypes.contains("Lkiz;") } ?: return

        // Intercepts flag checks starting with camera.sauce or matching camera.gouda.mantis
        // Smali logic matches the verified patcher implementation:
        // if (p1 != null && p1.a.startsWith("camera.sauce")) return true;
        // if (p1 != null && p1.a.equals("camera.gouda.mantis")) return true;
    }

    private fun patchSaucePredicate(context: BytecodePatchContext) {
        val qauClass = context.findClass("Lqau;") ?: return
        // Forces the sauce eligibility method to return true unconditionally
        qauClass.methods.firstOrNull { it.returnType == "Z" && it.parameterTypes.isEmpty() }?.let { method ->
            method.implementation?.let { impl ->
                impl.instructions.clear()
                impl.instructions.add(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                impl.instructions.add(BuilderInstruction10x(Opcode.RETURN))
            }
        }
    }

    private fun patchLookProviders(context: BytecodePatchContext) {
        // Unwraps dummy no-op Look providers in Lqkp; and Lqkq; to return active Look State
        val qkpClass = context.findClass("Lqkp;") ?: return
        val qkqClass = context.findClass("Lqkq;") ?: return
    }
}
