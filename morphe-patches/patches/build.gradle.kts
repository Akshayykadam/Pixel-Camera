group = "app.morphe.patches.pixelcamera"
version = "1.0.0"

patches {
    about {
        name = "Pixel Camera Looks & Creator Patches"
        description = "Unlocks Camera Looks, Viewfinder Controls, 5x Portrait & 10x Zoom, and Creator Suite on Pixel 6-10"
        source = "https://github.com/akshaykadam/Patch-Pixel-Camera"
        author = "Akshay Kadam"
        contact = "na"
        website = "https://github.com/akshaykadam/Patch-Pixel-Camera"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    compileOnly(libs.morphe.patcher)
    compileOnly(libs.smali)
    patchListGeneratorClasspath(libs.gson)
}
