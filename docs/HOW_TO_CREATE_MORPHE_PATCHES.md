# Developer Guide: How to Create Morphe Patches (.mpp) from Scratch

## 1. Introduction: What is Morphe?

**Morphe Patcher** is a modern, modular bytecode transformation framework for Android APKs. Unlike traditional binary patching (which manually edits smali files and rebuilds with Apktool), Morphe defines patches as **type-safe, reusable Kotlin modules**.

These modules are compiled into `.mpp` (**Morphe Patch Package**) files and applied directly on an Android device via **Morphe Manager** (or via automated CLI/Gradle test runners).

### Anatomy of an `.mpp` Bundle
An `.mpp` bundle is a standard ZIP archive containing:
```text
my-patches-1.0.0.mpp
├── META-INF/
│   ├── MANIFEST.MF
│   └── *.kotlin_module
├── classes.dex                  <-- Compiled patch logic executed by Morphe Manager on Android
├── HelperClass.dex              <-- Optional companion DEX files injected into the target APK
├── patches-list.json            <-- Patch definitions, options, descriptions, and compatibility
├── patches-bundle.json          <-- Bundle metadata and version info
└── app/morphe/patches/...       <-- JVM class files of the patch modules
```

---

## 2. Prerequisites & Project Setup

### 2.1 Required Tools
1. **JDK 17 or JDK 21**
2. **Gradle 8.x**
3. **Apktool** (for target APK decompilation & analysis)
4. **JADX / JADX-GUI** (for decompiling APKs to readable Java/Kotlin during investigation)
5. **Android Device / Emulator** with Morphe Manager installed

### 2.2 Gradle Setup (`build.gradle.kts`)

Create a standard Gradle project with the Morphe patcher dependencies:

```kotlin
plugins {
    kotlin("jvm") version "2.0.20"
}

group = "com.example.patches"
version = "1.0.0"

repositories {
    mavenCentral()
    google()
    maven("https://jitpack.io")
}

dependencies {
    // Morphe Patcher Core API
    compileOnly("app.morphe:patcher:1.0.0")
    
    // Smali & Dexlib2 for bytecode manipulation
    compileOnly("com.android.tools.smali:smali-dexlib2:3.0.8")
    compileOnly("com.android.tools.smali:smali:3.0.8")

    // Testing
    testImplementation(kotlin("test"))
    testImplementation("app.morphe:patcher:1.0.0")
    testImplementation("com.android.tools.smali:smali-dexlib2:3.0.8")
    testImplementation("com.android.tools.smali:smali:3.0.8")
}

tasks.named<Jar>("jar") {
    archiveExtension.set("mpp")
}
```

---

## 3. Reverse Engineering & Finding Injection Targets

Before writing code, reverse engineer the target APK:

### 3.1 Decompile the Target APK
```bash
apktool d target.apk -o apktool_out --no-src
jadx-gui target.apk
```

### 3.2 Key Investigation Steps
1. **Locate Feature Flags / Settings:**
   Search for strings, SharedPreferences keys, or feature flag providers (e.g. `camera.quick_access`, `is_pro_enabled`).
2. **Find Obfuscated Targets:**
   Note the exact type signatures:
   - Class name: `Lcom/google/android/apps/camera/evcomp/EvCompView;` or obfuscated `Lltg;`
   - Method name: `i`, `j`, `b`
   - Parameter types: `(Llsx;)V`, `(ZZ)V`, `(Lrdg;)Ljava/lang/Object;`
3. **Trace the Control Flow:**
   Find early return branches (`return-void`, `return v0`) or conditional jumps (`if-eqz`, `if-nez`) that guard the behavior you want to modify.

---

## 4. Writing a Morphe Patch in Kotlin

Create your patch file under `src/main/kotlin/app/morphe/patches/<app>/<feature>/MyPatch.kt`.

### 4.1 Basic Patch Structure
```kotlin
package app.morphe.patches.mypatch

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions

val myPatch = bytecodePatch(
    name = "Unlock Feature X",
    description = "Enables Pro features and bypasses device restrictions."
) {
    // 1. Target Package & Supported Versions
    compatibleWith(
        "com.target.package" to setOf("1.0.0", "1.1.0")
    )

    // 2. Optional: Include companion DEX file to inject into APK
    extendWith("MyCompanionHelper.dex")

    // 3. Optional: Declare dependency on another patch
    // dependsOn(otherPatch)

    // 4. Execution Block
    execute {
        mutableClassDefByOrNull("Lcom/target/ObfuscatedClass;")?.let { clazz ->
            // Perform bytecode modifications here
        }
    }
}
```

---

## 5. Bytecode Manipulation Techniques

Here are the five most effective bytecode manipulation patterns:

### Technique 1: Complete Method Body Replacement
Best when you want to replace simple flag checks, getters, or small methods.

```kotlin
fun replaceMethodBody(clazz: MutableClass?, methodName: String, returnType: String, smaliBody: String): Boolean {
    if (clazz == null) return false
    val method = clazz.methods.firstOrNull { 
        it.name == methodName && it.returnType == returnType 
    } ?: return false

    val impl = method.implementation ?: return false
    val newInstructions = smaliBody.trimIndent().toInstructions(method)
    
    // Clear existing instructions & try-catch blocks
    clearTryBlocks(impl)
    while (impl.instructions.isNotEmpty()) {
        impl.removeInstruction(0)
    }
    
    // Insert new instructions
    for (ins in newInstructions) {
        impl.addInstruction(ins)
    }
    return true
}
```
**Example Usage:**
```kotlin
val smali = """
    const/4 v0, 0x1
    return v0
""".trimIndent()
replaceMethodBody(clazz, "isFeatureEnabled", "Z", smali)
```

---

### Technique 2: Targeted Instruction Scanning & Replacement
Best when you want to change an opcode without replacing the whole method (e.g., replacing an early exit `goto` with `nop`, or changing an enum reference).

```kotlin
val method = clazz.methods.firstOrNull { it.name == "initView" } ?: return@let
val impl = method.implementation ?: return@let

for (i in 0 until impl.instructions.size) {
    val ins = impl.instructions[i]
    
    // Replace an early exit goto with nop
    if (ins.opcode == Opcode.GOTO_16 || ins.opcode == Opcode.GOTO) {
        val nop = "nop".toInstructions(method).first()
        impl.replaceInstruction(i, nop)
        break
    }
}
```

---

### Technique 3: Method Hooking with Original Delegation
Best when you want to intercept parameters or return values while preserving the original method logic:

```kotlin
fun hookMethodWithDelegation(clazz: MutableClass) {
    val targetMethod = clazz.methods.firstOrNull { 
        it.name == "calculateValue" && it.returnType == "I" 
    } ?: return

    // 1. Duplicate method definition and rename original
    val newMethod = MutableMethod(targetMethod)
    val origName = "original_calculateValue"
    targetMethod.name = origName

    // 2. Write interceptor smali calling original when not intercepted
    val smali = """
        invoke-static {p0, p1}, Lcom/my/helper/CompanionHelper;->intercept(Ljava/lang/Object;I)Ljava/lang/Integer;
        move-result-object v0
        if-eqz v0, :cond_orig
        invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
        move-result v0
        return v0
        :cond_orig
        invoke-virtual {p0, p1}, ${clazz.type}->$origName(I)I
        move-result v0
        return v0
    """.trimIndent()

    val instructions = smali.toInstructions(newMethod)
    val impl = newMethod.implementation ?: return
    while (impl.instructions.isNotEmpty()) { impl.removeInstruction(0) }
    for (ins in instructions) { impl.addInstruction(ins) }

    clazz.methods.add(newMethod)
}
```

---

### Technique 4: Injecting Companion DEX Files (`extendWith`)
Writing complex logic in raw Smali is error-prone. Instead, write complex code in Java/Kotlin, compile it to a companion DEX file (`MyHelper.dex`), and package it inside your patch:

1. **Write Companion Logic in Smali or Java:**
```smali
# smali_patches/MyHelper.smali
.class public Lcom/my/helper/MyHelper;
.super Ljava/lang/Object;

.method public static shouldEnable(Ljava/lang/String;)Z
    .locals 1
    const/4 v0, 0x1
    return v0
.end method
```
2. **Assemble Smali to DEX:**
```kotlin
val options = com.android.tools.smali.smali.SmaliOptions()
options.outputDexFile = "src/main/resources/MyHelper.dex"
com.android.tools.smali.smali.Smali.assemble(options, listOf("path/to/MyHelper.smali"))
```
3. **Declare in Morphe Patch:**
```kotlin
val myPatch = bytecodePatch(...) {
    extendWith("MyHelper.dex")
    execute { ... }
}
```

---

## 6. Automated Testing Against Base APK

Always write an automated JUnit test to verify your patch executes cleanly on the actual APK:

```kotlin
// src/test/kotlin/PatcherExecutionTest.kt
package com.example.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import kotlinx.coroutines.runBlocking
import org.junit.Test
import java.io.File

class PatcherExecutionTest {
    @Test
    fun testPatchExecution() = runBlocking {
        val baseApk = File("test_apk/base.apk")
        val tmpDir = File("build/tmp/test_patcher").apply { mkdirs() }
        
        val config = PatcherConfig(
            apkFile = baseApk,
            temporaryFilesPath = tmpDir
        )
        
        val patcher = Patcher(config)
        patcher += setOf(myPatch)
        
        patcher.invoke().collect { progress ->
            println("Progress: $progress")
        }
        
        val result = patcher.get()
        println("Patching successful! Result contains ${result.dexFiles.size} dex files.")
    }
}
```

Run test via Gradle:
```bash
./gradlew test --tests "PatcherExecutionTest.testPatchExecution"
```

---

## 7. Building & Distributing the `.mpp` Bundle

### 7.1 Assemble the Bundle
```bash
./gradlew :patches:assemble
```
The output `.mpp` is located at:
```text
patches/build/libs/patches-1.0.0.mpp
```

### 7.2 Applying via Morphe Manager APK
1. Push or copy `patches-1.0.0.mpp` to your Android phone (`/sdcard/Download/`).
2. Open **Morphe Manager** on your device.
3. Go to **Sources** $\rightarrow$ **Local patch bundle** $\rightarrow$ select your `.mpp`.
4. Select the target app, toggle your patch ON, and tap **Patch**.
5. Once compiled, tap **Install**.

---

## 8. Common Gotchas & Pro-Tips

### ⚠️ 1. Kotlin Raw String Template Interpolation (`$`)
In Kotlin raw multiline strings (`"""..."""`), inner classes written with `$` (like `View$OnTouchListener`) are treated as string template variables:
```kotlin
// ❌ WRONG (causes Kotlin compiler error: "Unresolved reference 'OnTouchListener'")
"invoke-virtual {v1, v2}, Llsy;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V"

// ❌ WRONG (raw string does not recognize backslash escapes)
"invoke-virtual {v1, v2}, Llsy;->setOnTouchListener(Landroid/view/View\$OnTouchListener;)V"

//  CORRECT (use string interpolation for the literal dollar sign)
"invoke-virtual {v1, v2}, Llsy;->setOnTouchListener(Landroid/view/View${'$'}OnTouchListener;)V"
```

### ⚠️ 2. Dalvik Branch Instruction Logic
- `if-eqz v0, :label` $\rightarrow$ Branches when `v0 == 0` (FALSE / NULL).
- `if-nez v0, :label` $\rightarrow$ Branches when `v0 != 0` (TRUE / NON-NULL).
Be extremely careful not to invert conditions when bypassing feature guards.

### ⚠️ 3. Clearing `tryBlocks` via Reflection
When replacing method instructions with `replaceMethodBody`, `MutableMethodImplementation.getTryBlocks()` returns an unmodifiable list. If try-catch blocks reference instructions you removed, dexlib2 will crash during assembly. Always safely clear the underlying try-catch block list using reflection before removing instructions:

```kotlin
private fun clearTryBlocks(impl: MutableMethodImplementation) {
    try {
        val field = impl.javaClass.getDeclaredField("tryBlocks")
        field.isAccessible = true
        val list = field.get(impl) as? MutableList<*>
        list?.clear()
    } catch (_: Throwable) {}
}
```

### ⚠️ 4. Extension DEX Merging
If multiple patches use `extendWith("Helper.dex")`, Morphe will automatically de-duplicate identical classes during APK packaging. Ensure companion class names are uniquely namespaced to avoid collision with other modders or system classes.
