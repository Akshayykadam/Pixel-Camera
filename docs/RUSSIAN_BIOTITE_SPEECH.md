# Russian scripts in the speech-following teleprompter

The 11.1.040.982810059.19 Biotite pipeline rejects Russian before recognition:

- `kuw.a` allows only English script-language detection (`en`).
- `tjb.a` omits `ru-RU` from the SODA language-pack matching list.
- `ktp.a` enables word-based WPM counting only for English, so Russian falls
  back to counting letters/digits as words.

This patch appends Russian to those three collections. It retains every
existing language and keeps the collections immutable. It does not force the
current locale, fake downloaded models, disable model availability checks,
change recognition permissions, or send audio to a different service.

Both Morphe source trees and the standalone Python builder are covered. The
Morphe hook replaces the static-field store at its existing label location,
so branches targeting that store execute the hook. The helper uses its own
registers; the original initializer register count remains unchanged.

## Validation on the Mac's Android stand

Pixel 7 Pro AVD, Android API 37, ARM64. Both the standalone Smali patch and the
Kotlin patch were applied to the APK's original classes. The Kotlin helper was
compiled against Morphe v1.8.0's actual mutable-class sources and inline Smali
compiler, using Kotlin 2.2.10 and Smali 3.0.9. In this isolated check the inline
compiler's `Method.instructions` extension was expanded to
`Method.implementation!!.instructions`; no mock mutable classes were used.
The private Gradle plugin was not required for these focused checks. This is
not a complete `.mpp` build.

- Six Python regression tests passed.
- Three Kotlin/JUnit regression tests passed, including a branch into the
  language collection initializer and preservation of register/set types.
- Applying the Kotlin helper twice is idempotent for all three actual classes.
- APK assembly, signing and alignment succeeded.
- On Android, original classes reported `[en, ru]` for script and word-count
  languages and a real `ru_RU` Locale in the SODA list. English remained allowed.
- The original text matcher successfully processed
  `Ёлка, ещё один съёмочный день. 2026`, including Cyrillic, ё and Russian number
  expansion. Native normalization produced
  `Ёлка, ещё 1 съёмочный день. две тысячи двадцать шесть`; the word count was 6.

The [runtime log](../test_captures/russian-biotite/native-runtime.txt) contains
these observed values.

## Pending voice validation

**Russian audio recognition has not passed an end-to-end test.** Using the
camera's original Google-package verifier, the native SODA model query on the
debug-signed emulator build fails with `PERMISSION_DENIED: Api access revoked.`
The patch does not bypass that policy.

A separate probe of Android's public `createOnDeviceSpeechRecognizer` API
reports `ru-RU` as supported/downloadable, with no installed language packs.
The Russian download was requested; it has not completed in the observed test.
This public probe is diagnostic only and is not an alternative engine wired
into the camera by this patch.

A physical Pixel with a working native SODA backend and installed Russian
model is needed to validate actual microphone speech following before release.
The user-visible feature must not be described as fully verified yet.

## Reproduce

Run `python3 -m unittest discover -s tests -v`. Kotlin/JUnit tests are in both
Morphe source trees. `tests/android/PixelRussianSpeechTest.java` is a test-only
Activity injected into a debug copy of the APK. Compile it against Android's
`android.jar`, convert with D8, register its fully qualified class name in the
test manifest, and add its DEX as a new `classesN.dex`. Do not package test code,
debug manifest changes or keys into release artifacts.

Launch `com.google.android.GoogleCameraEng/pixel.camera.test.PixelRussianSpeechTest`
and inspect the `PixelRussianTest` log tag. The report is also written to the
app's external files directory as `russian-speech-test.txt`.
