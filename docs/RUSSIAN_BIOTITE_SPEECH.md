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

## Physical Pixel validation

Pixel 9 Pro XL, Android 17/API 37, camera 11.1.040.982810059.19.
The installed test APK uses the actual Kotlin-patched native classes and the
landscape resource fix. It retains the normal application manifest and does
not contain the diagnostic Activity or instrumentation classes.

- Android's public on-device recognizer downloaded the real `ru-RU` model.
  A 7.53-second, mono 16 kHz PCM16 Russian fixture produced incremental
  recognition and the complete expected first hypothesis. The test feeds a
  pipe; passing a file descriptor for external storage directly caused a
  Binder `DeadObjectException` on this device.
- Separately, instrumentation in the camera process used the camera's original
  Google-package verifier and queried the native SODA backend successfully:
  `currentLocale=ru_RU, matchedLocale=ru_RU, isSupported=true,
  state=STATE_DOWNLOADED`. No access-policy bypass was used.
- The camera editor accepted a Russian script without the unsupported-language
  warning. With Dynamic text scrolling set to On, a real video recording and
  speech played from the Mac into the Pixel microphone advanced the green
  highlighting and scrolled the Russian script. Recording was stopped after
  the check. A manual device check also confirmed speech following works.
- In landscape the HUD displays several Russian words per line instead of the
  original narrow column. Its 336 by 212 dp bounds were observed before the
  subsequent width adjustment.
- The original Cyrillic/ё/number normalization, six-word count, English gate
  and `ru_RU` locale checks passed on the physical device too.

The [physical-device report](../test_captures/russian-biotite/physical-pixel.txt)
contains fixture-only evidence. Camera-view screenshots and personal media
are not included in the repository.

On the debug-signed emulator the same native SODA query still returns
`PERMISSION_DENIED: Api access revoked.` The successful physical-device test
does not imply that Google's service supports every emulator or device.
The public SpeechRecognizer probe is diagnostic only, not a replacement
engine wired into the camera. A complete `.mpp` build remains unverified;
the focused Kotlin compilation, patch application and APK checks passed.

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

`tests/android/NativeRussianSpeechInstrumentation.java` runs the native checks
against a normally built camera APK. Register it as instrumentation targeting
`com.google.android.GoogleCameraEng` in a separate diagnostic APK signed with
the same key as the camera, then run
`adb shell am instrument -w pixel.camera.probe/.NativeSpeechInstrumentation`.
No diagnostic classes need to be injected into the camera APK.

For the public probe, put a nonempty mono 16 kHz PCM16 fixture named
`russian.pcm` in its external files directory and grant microphone access.
`PublicRussianAsrProbe` logs partial and segmented recognition. It rejects a
missing/empty fixture instead of reporting a meaningless audio test.
