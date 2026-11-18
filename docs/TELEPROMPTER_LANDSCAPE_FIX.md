# Teleprompter landscape layout

Pixel Camera `11.1.040.982810059.19` gives the Biotite presenter a fixed
**212dp width and 336dp height** in landscape. Its Compose presenter (`fue.bu`)
uses these dimensions directly. After the script's 16dp side margins, normal
24sp text wraps into a narrow column, often one or two words per line.

The patch changes the landscape dimensions to **404dp wide × 212dp high**.
This is about 20% wider than the initial 336dp correction, allowing longer
phrases per line while keeping the compact 212dp height.
It is attached to the Creator Suite patch as a resource dependency, and also
runs in the standalone Python build. Both Kotlin source trees are updated.
The portrait and tabletop dimensions, font sizes and scrolling code are unchanged.
Missing or duplicate resource names fail the patch rather than silently skipping it.

## Android verification

### Initial 336dp correction

Verified on a separate Pixel 7 Pro AVD on macOS, Android API 37, ARM64,
1080×2400 at 420dpi. The published v1.1.3 APK was used as the input.
The test invokes **the APK's original Compose presenter, script renderer and
controls**, through a debug-only PreviewActivity harness; it does not recreate
the HUD with a different widget.

| Scene | Result |
| --- | --- |
| Original landscape | Presenter bounds `[42,21][599,903]`: 557px wide × 882px high; narrow text column |
| Patched landscape | Presenter bounds `[42,21][924,578]`: 882px wide × 557px high; multiword phrases |
| Patched reverse landscape | Same corrected width and height; controls visible |
| Patched portrait | Normal wide portrait presenter; controls visible |

[Before](../test_captures/teleprompter-landscape/before-landscape.png) ·
[After](../test_captures/teleprompter-landscape/after-landscape.png) ·
[Reverse landscape](../test_captures/teleprompter-landscape/after-reverse-landscape.png) ·
[Portrait](../test_captures/teleprompter-landscape/after-portrait.png)

### Physical Pixel and 404dp width

A Pixel 9 Pro XL running Android 17/API 37 was tested with the corrected HUD
and the separate Russian speech patch. The initial 336dp HUD measured
1008 by 636 pixels at density 3. Russian text used multiword lines and
Dynamic text scrolling followed speech during an actual video recording.

The follow-up changes the width to 404dp (1212px at density 3), about 20%
wider than 336dp. On the physical Pixel, the final HUD measured
`[294,36][1506,672]`: **1212 by 636 pixels**, exactly **404 by 212dp**.
Settings and collapse controls remained visible. The final APK retains the normal
application manifest and does not contain test Activities or instrumentation.

### Limits

The emulator's camera HAL still crashes the unmodified camera activity with
`No HDR+ compatible raw format supported for camera 10. Format:37`.
The isolated original HUD runs successfully; actual recording and Russian
speech following were checked separately on the physical Pixel.

The standard `./gradlew test --no-daemon` cannot resolve the private
`app.morphe.patches:1.3.4` plugin in this environment without registry access.
The two Kotlin resource regression tests were compiled and run separately with
Kotlin 2.2.10 and JUnit 4.13.2 (both passed). The four standalone Python regression
tests passed, as did APKTool resource rebuilding, APK signature/alignment checks
and `git diff --check`. No compiled Morphe bundle is included in this change.

## Reproduce

Run `python3 -m unittest discover -s tests -v` for standalone patch tests.
The Kotlin tests are in both source trees under `src/test/kotlin`.

For camera-independent Android verification, see
[`tests/android/README.md`](../tests/android/README.md). The preview harness is
test-only and must never be included in release APKs.
