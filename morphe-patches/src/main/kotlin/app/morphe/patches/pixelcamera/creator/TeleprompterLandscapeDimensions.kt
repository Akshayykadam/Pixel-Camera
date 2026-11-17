package app.morphe.patches.pixelcamera.creator

/** The presenter is measured in the current view's coordinates, including landscape. */
internal fun fixTeleprompterLandscapeDimensions(xml: String): String {
    var result = xml
    for ((name, value) in mapOf(
        "biotite_presenter_container_width_landscape" to "336.0dip",
        "biotite_presenter_container_height_landscape" to "212.0dip"
    )) {
        val dimension = Regex("""(<dimen\s+name="$name"\s*>)[^<]+(</dimen>)""")
        check(dimension.findAll(result).count() == 1) {
            "Expected exactly one $name dimension in Pixel Camera resources"
        }
        result = dimension.replace(result) { "${it.groupValues[1]}$value${it.groupValues[2]}" }
    }
    return result
}
