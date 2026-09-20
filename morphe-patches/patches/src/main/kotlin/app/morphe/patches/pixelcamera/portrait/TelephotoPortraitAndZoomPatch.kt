package app.morphe.patches.pixelcamera.portrait

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22b

val telephotoPortraitAndZoomPatch = bytecodePatch(
    name = "5x Telephoto Portrait & 10x Quick Zoom",
    description = "Enables 5x optical telephoto computational portrait mode (Mantis), 10x quick zoom button, and unlocks Pro Res Zoom (Centaur model download)."
) {
    compatibleWith(
        "com.google.android.GoogleCamera" to setOf("11.0.073.972752740.32"),
        "com.google.android.GoogleCamera.morphe" to setOf("11.0.073.972752740.32")
    )
    execute {
        mutableClassDefByOrNull("Luyv;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "f" && it.returnType == "Z" }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) {
                        impl.removeInstruction(0)
                    }
                    impl.addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }
        }

        mutableClassDefByOrNull("Lpvz;")?.let { clazz ->
            clazz.methods.firstOrNull { it.name == "e" && it.returnType == "Z" && it.parameterTypes.map { it.toString() } == listOf("Z") }?.let { method ->
                method.implementation?.let { impl ->
                    while (impl.instructions.isNotEmpty()) {
                        impl.removeInstruction(0)
                    }
                    // v0 = isFrontFacing (v1) ^ 1
                    // Rear camera (v1 == 0): returns 1 (true)
                    // Front camera (v1 == 1): returns 0 (false)
                    impl.addInstruction(BuilderInstruction22b(Opcode.XOR_INT_LIT8, 0, 1, 1))
                    impl.addInstruction(BuilderInstruction11x(Opcode.RETURN, 0))
                }
            }
        }
    }
}
