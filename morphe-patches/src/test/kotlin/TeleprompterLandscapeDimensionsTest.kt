package app.morphe.patches.pixelcamera.creator

import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

class TeleprompterLandscapeDimensionsTest {
    private val original = """
        <resources>
            <!-- Preserve portrait, tabletop and typography. -->
            <dimen name="biotite_presenter_container_height">212.0dip</dimen>
            <dimen name="biotite_presenter_container_height_landscape">336.0dip</dimen>
            <dimen name="biotite_presenter_container_height_tabletop">262.0dip</dimen>
            <dimen name="biotite_presenter_container_width_landscape">212.0dip</dimen>
            <dimen name="biotite_font_size_medium">24.0sp</dimen>
        </resources>
    """.trimIndent()

    @Test
    fun landscapeIsWideAndShortWithoutChangingOtherResources() {
        val expected = original
            .replace("height_landscape\">336.0dip", "height_landscape\">212.0dip")
            .replace("width_landscape\">212.0dip", "width_landscape\">336.0dip")
        assertEquals(expected, fixTeleprompterLandscapeDimensions(original))
        assertEquals(expected, fixTeleprompterLandscapeDimensions(expected))
    }

    @Test
    fun unsupportedResourcesFailInsteadOfSilentlySkippingTheFix() {
        assertThrows(IllegalStateException::class.java) {
            fixTeleprompterLandscapeDimensions(original.replace("height_landscape", "renamed_height"))
        }
        assertThrows(IllegalStateException::class.java) {
            fixTeleprompterLandscapeDimensions(original + "<dimen name=\"biotite_presenter_container_width_landscape\">212dp</dimen>")
        }
    }
}
