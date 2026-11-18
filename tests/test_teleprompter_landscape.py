"""Regression tests for the standalone Creator Suite resource patch."""
import importlib.util
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("pixel_build", ROOT / "build_and_patch_pixelcamera.py")
build = importlib.util.module_from_spec(spec)
spec.loader.exec_module(build)

ORIGINAL = '''<resources>
    <dimen name="biotite_presenter_container_height">212.0dip</dimen>
    <dimen name="biotite_presenter_container_height_landscape">336.0dip</dimen>
    <dimen name="biotite_presenter_container_height_tabletop">262.0dip</dimen>
    <dimen name="biotite_presenter_container_width_landscape">212.0dip</dimen>
    <dimen name="biotite_font_size_medium">24.0sp</dimen>
</resources>'''
EXPECTED = ORIGINAL.replace('height_landscape">336.0dip', 'height_landscape">212.0dip').replace('width_landscape">212.0dip', 'width_landscape">404.0dip')

class LandscapeDimensionsTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.old_dir = build.APKTOOL_DIR
        self.addCleanup(setattr, build, "APKTOOL_DIR", self.old_dir)
        build.APKTOOL_DIR = self.tmp.name
        self.path = Path(self.tmp.name) / "res/values/dimens.xml"
        self.path.parent.mkdir(parents=True)
        self.path.write_text(ORIGINAL)

    def test_only_landscape_axes_change_and_repeat_is_safe(self):
        build.patch_teleprompter_landscape_dimensions()
        self.assertEqual(EXPECTED, self.path.read_text())
        build.patch_teleprompter_landscape_dimensions()
        self.assertEqual(EXPECTED, self.path.read_text())

    def test_missing_dimension_fails_without_writing_partial_patch(self):
        content = ORIGINAL.replace('biotite_presenter_container_height_landscape', 'renamed_height')
        self.path.write_text(content)
        with self.assertRaises(ValueError):
            build.patch_teleprompter_landscape_dimensions()
        self.assertEqual(content, self.path.read_text())

    def test_duplicate_dimension_fails(self):
        self.path.write_text(ORIGINAL.replace('</resources>', '<dimen name="biotite_presenter_container_width_landscape">212dp</dimen></resources>'))
        with self.assertRaises(ValueError):
            build.patch_teleprompter_landscape_dimensions()

    def test_both_morphe_source_trees_match(self):
        for name in ("CreatorSuitePatch.kt", "TeleprompterLandscapeDimensions.kt"):
            relative = Path("main/kotlin/app/morphe/patches/pixelcamera/creator") / name
            self.assertEqual((ROOT / "morphe-patches/src" / relative).read_text(), (ROOT / "morphe-patches/patches/src" / relative).read_text())

if __name__ == '__main__':
    unittest.main()
