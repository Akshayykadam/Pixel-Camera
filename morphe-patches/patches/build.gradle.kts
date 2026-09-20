group = "app.morphe.patches.pixelcamera"
version = "1.0.1"

patches {
    about {
        name = "Pixel Camera Looks & Creator Patches"
        description = "Unlocks Camera Looks, Viewfinder Controls, 10x Zoom, and Creator Suite on Pixel 6-10"
        source = "https://github.com/akshayykadam/Patch-Pixel-Camera"
        author = "Akshay Kadam"
        contact = "na"
        website = "https://github.com/akshayykadam/Patch-Pixel-Camera"
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
}
