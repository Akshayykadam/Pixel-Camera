# 🧩 Morphe Patches for Pixel Camera

Official Morphe Patch definitions to unlock Google Pixel 11 **Camera Looks**, **Viewfinder Quick Access Controls**, and **Creator Suite** on older Pixel devices (Pixel 6 through Pixel 10).

---

## 🎯 What is Morphe?

[Morphe](https://morphe.software) is an open-source Android app modification framework. Instead of downloading multi-gigabyte pre-compiled APKs from third parties, Morphe allows users to patch clean, official APKs **directly on their Android device or PC** using lightweight patch bundles (`.mpp`).

### Key Benefits:
- 🚀 **Tiny Download**: The patch package is only a few kilobytes (no 1.5 GB downloads).
- 🔒 **Zero Malware / Tampering Risk**: You download the official base APK directly from APKMirror and patch it on your own device.
- ⚖️ **100% Legal & Open Source**: Distributes only bytecode recipes, no proprietary Google binaries.

---

## 📦 Available Patches in this Package

| Patch | Type | Description |
| :--- | :--- | :--- |
| **Camera Looks Backport** | `BytecodePatch` | Unlocks 10 hardware-gated Camera Looks (Sauce/Tomte) across Tensor G1–G5. |
| **Viewfinder Quick Access** | `BytecodePatch` | Enables customizable Left/Right viewfinder quick-access slots and 10-tick slider. |
| **5x Telephoto Portrait & 10x Zoom** | `BytecodePatch` | Unlocks physical 5x optical telephoto portraits (`camera.gouda.mantis`) and exposes discrete 10x quick zoom button. |
| **Creator Suite** | `BytecodePatch` | Unlocks Teleprompter HUD (Biotite), Audio VU Meter (Mica), and Framing Guides (Slate). |
| **Pixel Camera Clone** | `RawResourcePatch` | Renames package to `com.google.android.GoogleCameraEng` for side-by-side install without root. |

---

## 📱 How to Use (For End Users)

### Option 1: On Your Android Phone (Morphe Manager — Recommended)

1. **Install Morphe Manager**: Download the latest release from [morphe.software](https://morphe.software) or GitHub.
2. **Add Patch Source**:
   * **1-Click**: Tap [Add to Morphe Manager](https://morphe.software/add-source?github=akshaykadam/Patch-Pixel-Camera) on your phone.
   * **Or Manually**: Open Morphe Manager → **Settings** → **Sources** → Add custom source: `akshaykadam/Patch-Pixel-Camera` (or import the downloaded `.mpp` file).
3. **Get the Base Camera APK**:
   * Download `Pixel Camera 11.0.073.972752740.32` (`.apkm` bundle) from APKMirror.
4. **Patch & Install**:
   * In Morphe Manager, select the downloaded APKM file.
   * Select your desired patches (e.g. **Camera Looks Backport**, **5x Telephoto Portrait & 10x Zoom**, and **Pixel Camera Clone**).
   * Tap **Patch**. Once compiled on-device, tap **Install**.

---

### Option 2: On Your PC / Mac (Morphe Desktop / CLI)

1. Download **Morphe Desktop** from [morphe.software](https://morphe.software).
2. Download the latest `pixelcamera-patches.mpp` from [Releases](https://github.com/akshaykadam/Patch-Pixel-Camera/releases).
3. Drop the `Pixel Camera 11.0.073` APKM into Morphe Desktop.
4. Select the patches and click **Start Patching**.
5. Transfer the generated `PixelCamera_signed.apk` to your phone or install via ADB:
   ```bash
   adb install -r PixelCamera_signed.apk
   ```

---

## 🛠️ How to Build the `.mpp` Package (For Developers)

### Prerequisites:
* Java JDK 17+
* GitHub Personal Access Token (PAT) with `read:packages` permission (for GitHub Packages registry)

### Build Commands:
```bash
cd morphe-patches

# Set your GitHub credentials
export GITHUB_ACTOR="your-username"
export GITHUB_TOKEN="your-github-pat"

# Build the Morphe Patch Package (.mpp)
./gradlew buildAndroid
```

The output patch package will be generated at:
```text
morphe-patches/build/libs/morphe-patches-pixelcamera-1.0.0.mpp
```

---

## ⚠️ Legal Disclaimer

* **No Proprietary Binaries**: This module provides bytecode patch source code only. It does not contain, distribute, or bundle proprietary Google binaries, APKs, or models.
* **Fair Use & Interoperability**: Conducted for non-commercial educational and software interoperability purposes (17 U.S.C. § 107).
* **Trademarks**: Pixel, Google Camera, Android, and Tensor are trademarks of Google LLC. This project is not affiliated with or endorsed by Google LLC.
* **As-Is Warranty**: Provided without warranties of any kind. Users assume full responsibility for modifying applications on their own devices.
