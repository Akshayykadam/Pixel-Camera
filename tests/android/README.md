# Camera-independent Biotite verification

This **test-only** preview adapter calls the original `fue.bu` presenter,
`fue.by` script renderer and `fue.bv` controls from Pixel Camera
`11.1.040.982810059.19`. Its class names and resource IDs are version-specific.
It avoids initializing the camera HAL, which is incompatible with the Android
emulator. This is an isolated HUD test, not an end-to-end recording test.

1. Decode a copy of the published v1.1.3 standalone APK with APKTool (resources
   only is sufficient). For the patched case, apply
   `patch_teleprompter_landscape_dimensions()` from the standalone build script
   to that decoded directory. Set `android:debuggable="true"` in the **test
   copy's** application manifest; PreviewActivity requires it.
2. Compile `PixelTeleprompterPreview.java` and `bya.java` with `javac -source 8
   -target 8`, using Android's `android.jar` on the classpath. Package only
   `PixelTeleprompterPreview.class` and `PixelTeleprompterPreview$Callback.class`
   in a JAR. **Do not package `bya.class`**: the real Composer is in the APK.
   Run Android SDK `d8 --min-api 30` on that JAR.
3. Rebuild the manifest/resources with APKTool. Keep the original APK's DEX,
   native libraries and assets. Put the rebuilt `AndroidManifest.xml`,
   `resources.arsc` and the adapter as `classes5.dex` into the test APK.
   Store `resources.arsc` uncompressed, run `zipalign -P 16 4`, then sign the
   test APK with a local debug key. Install only on a disposable AVD.
4. Launch each scene, force-stopping between cases:

   ```sh
   adb shell am force-stop com.google.android.GoogleCameraEng
   adb shell am start \
     -n com.google.android.GoogleCameraEng/androidx.compose.ui.tooling.PreviewActivity \
     --es composable PixelTeleprompterPreview.landscape
   ```

   Other scenes are `reverseLandscape`, `portrait` and `tabletop`. The adapter
   requests the corresponding Android window orientation as well as passing
   the matching original camera orientation enum to the presenter.
5. Capture `screencap` and `uiautomator dump` after the scene settles. Compare
   the bounds of the `Teleprompter script` node, line wrapping and visibility
   of the settings/collapse controls. See the verification report in
   `docs/TELEPROMPTER_LANDSCAPE_FIX.md` for observed results.

No adapter, debug manifest, APK, Google bytecode, signing key or credential
belongs in a release artifact. The committed files contain only the adapter's
source and screenshots of its own sample script.
