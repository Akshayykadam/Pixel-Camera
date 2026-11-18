"""Native bytecode patch safeguards; no fake recognition/model state."""
import importlib.util
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("pixel_build", ROOT / "build_and_patch_pixelcamera.py")
build = importlib.util.module_from_spec(spec)
spec.loader.exec_module(build)

def fixture(name, collection="List", register="v0"):
    return f'''.class public final L{name};
.super Ljava/lang/Object;
.method static constructor <clinit>()V
    .locals 1
    :collection_ready
    sput-object {register}, L{name};->a:Ljava/util/{collection};
    return-void
.end method
'''

class RussianBiotiteTest(unittest.TestCase):
    def test_script_gate_adds_russian_and_retains_original_languages(self):
        result = build.russian_biotite_smali(fixture("kuw"), "kuw")
        self.assertIn('const-string v1, "ru"', result)
        self.assertIn('ArrayList;-><init>(Ljava/util/Collection;)V', result)
        self.assertIn('Collection;->contains(Ljava/lang/Object;)Z', result)
        self.assertEqual(result, build.russian_biotite_smali(result, "kuw"))

    def test_soda_adds_full_locale_after_branch_label(self):
        result = build.russian_biotite_smali(fixture("tjb", register="v1"), "tjb", True)
        self.assertIn('const-string v1, "ru-RU"', result)
        self.assertIn('Locale;->forLanguageTag', result)
        self.assertLess(result.index(':collection_ready'), result.index('invoke-static {v1}'))
        self.assertLess(result.index('invoke-static {v1}'), result.index('sput-object v1'))
        # Only the initializer and new helper change; backend model checks are untouched.
        self.assertNotIn('CheckModelAvailability', result)
        self.assertNotIn('Ltjn;-><init>', result)

    def test_word_count_preserves_set_type(self):
        result = build.russian_biotite_smali(fixture("ktp", "Set"), "ktp", word_set=True)
        self.assertIn('LinkedHashSet;-><init>', result)
        self.assertIn('Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;', result)
        self.assertNotIn('unmodifiableList', result)

    def test_changed_or_duplicate_field_fails(self):
        with self.assertRaises(ValueError):
            build.russian_biotite_smali(fixture("kuw").replace('->a:', '->renamed:'), "kuw")
        duplicate = fixture("kuw").replace('    return-void', '    sput-object v0, Lkuw;->a:Ljava/util/List;\n    return-void')
        with self.assertRaises(ValueError):
            build.russian_biotite_smali(duplicate, "kuw")

    def test_standalone_batch_is_atomic_when_a_target_is_missing(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root/'smali').mkdir()
            original = fixture("kuw")
            path = root/'smali/kuw.smali'
            path.write_text(original)
            old_dir = build.APKTOOL_DIR
            build.APKTOOL_DIR = directory
            try:
                with self.assertRaises(ValueError):
                    build.patch_russian_biotite_speech()
                self.assertEqual(original, path.read_text())
            finally:
                build.APKTOOL_DIR = old_dir

    def test_both_morphe_source_trees_match(self):
        for name in ("CreatorSuitePatch.kt", "RussianBiotiteSpeech.kt"):
            path = Path('main/kotlin/app/morphe/patches/pixelcamera/creator') / name
            self.assertEqual((ROOT/'morphe-patches/src'/path).read_text(), (ROOT/'morphe-patches/patches/src'/path).read_text())

if __name__ == '__main__':
    unittest.main()
