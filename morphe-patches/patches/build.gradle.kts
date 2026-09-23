group = "app.morphe.patches.pixelcamera"
version = "1.0.2"

patches {
    about {
        name = "Pixel Camera Looks & Creator Patches"
        description = "Unlocks Camera Looks, Viewfinder Controls, 10x Zoom, and Creator Suite on Pixel 6-10"
        source = "https://github.com/akshayykadam/Pixel-Camera"
        author = "Akshay Kadam"
        contact = "na"
        website = "https://github.com/akshayykadam/Pixel-Camera"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    compileOnly(libs.morphe.patcher)
    compileOnly(libs.smali)
    compileOnly("com.github.REAndroid:arsclib:a28c6fb2a7")
    patchListGeneratorClasspath(libs.gson)

    testImplementation(kotlin("test"))
    testImplementation(libs.morphe.patcher)
    testImplementation(libs.smali)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.8.1")
}
