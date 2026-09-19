
group = "app.morphe.patches.pixelcamera"
version = "1.0.0"

repositories {
    mavenCentral()
    google()
}

dependencies {
    // Morphe patcher framework & smali AST dependencies
    compileOnly("app.morphe:morphe-patcher:1.3.3-dev.1")
    compileOnly("com.android.tools.smali:smali-dexlib2:3.0.8")
}

kotlin {
    jvmToolchain(17)
}
