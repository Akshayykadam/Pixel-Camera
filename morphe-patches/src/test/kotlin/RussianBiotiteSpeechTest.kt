package app.morphe.patches.pixelcamera.creator

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test

class RussianBiotiteSpeechTest {
    private fun fixture(owner: String, collection: String = "List"): MutableClass {
        val method = MutableMethod(ImmutableMethod(owner, "<clinit>", emptyList(), "V", 0x10008,
            null, null, MutableMethodImplementation(1)))
        val body = """
            const/4 v0, 0x0
            goto :ready
            const/4 v0, 0x0
            :ready
            sput-object v0, $owner->a:Ljava/util/$collection;
            return-void
        """.trimIndent()
        for (instruction in body.toInstructions(method)) method.implementation!!.addInstruction(instruction)
        return MutableClass(ImmutableClassDef(owner, 0x11, "Ljava/lang/Object;", null,
            null, null, emptyList(), listOf(method)))
    }

    @Test
    fun modelInitializerBranchesMustExecuteTheRussianHook() {
        val clazz = fixture("Ltjb;")
        enableRussianBiotite(clazz, localeEntries = true)
        val instructions = clazz.methods.single { it.name == "<clinit>" }.implementation!!.instructions
        val branch = instructions.first { it.opcode == Opcode.GOTO } as BuilderOffsetInstruction
        val target = branch.target.location.instruction!!
        assertEquals(Opcode.INVOKE_STATIC, target.opcode)
        assertTrue((target as ReferenceInstruction).reference.toString().contains("pixelCameraRussianBiotite"))
        val methodCount = clazz.methods.size
        enableRussianBiotite(clazz, localeEntries = true)
        assertEquals(methodCount, clazz.methods.size)
    }

    @Test
    fun russianWordCountingUsesASetAndKeepsTheOriginalConstructorRegisterCount() {
        val clazz = fixture("Lktp;", "Set")
        enableRussianBiotite(clazz, wordSet = true)
        assertEquals(1, clazz.methods.single { it.name == "<clinit>" }.implementation!!.registerCount)
        val helper = clazz.methods.single { it.name == "pixelCameraRussianBiotite" }
        assertEquals("Ljava/util/Set;", helper.returnType)
        assertEquals(3, helper.implementation!!.registerCount)
        assertTrue(helper.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference?.toString()?.contains("unmodifiableSet") == true
        })
    }

    @Test
    fun changedBytecodeFailsInsteadOfSkippingTheGate() {
        val clazz = fixture("Lkuw;", "Set")
        assertThrows(IllegalStateException::class.java) { enableRussianBiotite(clazz) }
    }
}
