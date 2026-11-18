package app.morphe.patches.pixelcamera.creator

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Add Russian without changing model availability, locale selection or English support. */
internal fun enableRussianBiotite(clazz: MutableClass, localeEntries: Boolean = false, wordSet: Boolean = false) {
    val helperName = "pixelCameraRussianBiotite"
    val collection = if (wordSet) "Set" else "List"
    val signature = "Ljava/util/$collection;"
    if (clazz.methods.any { it.name == helperName }) return
    val initializer = clazz.methods.single { it.name == "<clinit>" }.implementation!!
    val stores = initializer.instructions.withIndex().filter { (_, instruction) ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SPUT_OBJECT && field != null && field.definingClass == clazz.type &&
            field.name == "a" && field.type == signature
    }
    check(stores.size == 1) { "Expected one language collection initializer in ${clazz.type}" }
    val store = stores.single()
    val register = (store.value as OneRegisterInstruction).registerA
    val implementation = MutableMethodImplementation(3)
    val helper = MutableMethod(ImmutableMethod(
        clazz.type, helperName, listOf(ImmutableMethodParameter(signature, null, null)),
        signature, 0xa, null, null, implementation
    ))
    val entry = if (localeEntries) """
        const-string v1, "ru-RU"
        invoke-static {v1}, Ljava/util/Locale;->forLanguageTag(Ljava/lang/String;)Ljava/util/Locale;
        move-result-object v1
    """ else """const-string v1, "ru" """
    val mutableCollection = if (wordSet) "LinkedHashSet" else "ArrayList"
    val body = """
        $entry
        invoke-interface {p0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :add_russian
        return-object p0
        :add_russian
        new-instance v0, Ljava/util/$mutableCollection;
        invoke-direct {v0, p0}, Ljava/util/$mutableCollection;-><init>(Ljava/util/Collection;)V
        invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
        invoke-static {v0}, Ljava/util/Collections;->unmodifiable$collection(Ljava/util/$collection;)Ljava/util/$collection;
        move-result-object v0
        return-object v0
    """.trimIndent()
    for (instruction in body.toInstructions(helper)) helper.implementation!!.addInstruction(instruction)
    clazz.methods.add(helper)
    val hook = """
        invoke-static {v$register}, ${clazz.type}->$helperName($signature)$signature
        move-result-object v$register
        sput-object v$register, ${clazz.type}->a:$signature
    """.trimIndent().toInstructions(clazz.methods.single { it.name == "<clinit>" })
    // Replace the store so a branch targeting it cannot skip the new hook.
    initializer.replaceInstruction(store.index, hook.first())
    for (offset in 1 until hook.size) initializer.addInstruction(store.index + offset, hook[offset])
}
