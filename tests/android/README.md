# Russian speech diagnostics

`PixelRussianSpeechTest.java` runs inside a debug-only camera APK. It checks the
original script-language list, SODA locale list, Russian text normalization,
word counting and native SODA model access. Its reflection names match only
Pixel Camera 11.1.040.982810059.19. See `docs/RUSSIAN_BIOTITE_SPEECH.md`.

`PublicRussianAsrProbe.java` is a separate diagnostic Activity in package
`pixel.camera.probe`. It checks the public on-device SpeechRecognizer, requests
the ru-RU model and, when installed, tries to recognize a local 16kHz mono
PCM16 file named `russian.pcm` in the probe app's external files directory.
It requires Android 33+, RECORD_AUDIO and a manifest query for
`android.speech.RecognitionService`. This probe does not use the cloud speech
factory and is not part of the production patch.

Only test sources are included. No Google bytecode, model files, signing keys
or compiled camera APKs are committed.
