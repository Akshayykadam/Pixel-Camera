#!/usr/bin/env python3
"""
Automated Build Script: PixelCamera Clone with Camera Looks Enabled
1. Renames package to com.google.android.GoogleCameraEng (Google internal whitelisted clone package)
2. Sets application label to 'PixelCamera'
3. Patches AndroidManifest.xml providers and permissions to prevent conflicts with stock Camera
4. Patches smali in uyv.smali (uyv.l() -> true)
5. Patches smali in qau.smali (sauce eligibility predicate -> true)
6. Injects libgcastartup.so from split_startup_jni_split_module.apk into lib/arm64-v8a/
7. Injects neural models from split_all_in_feature_module_p26.apk and split_hdrplus_asset_module_p26.apk into assets/
8. Injects TomteInitHelper to initialize native Gcam Tomte Grain model and track active Look ID
9. Patches qkp.smali and qkq.smali to return real Look Manager and Look State instead of dummy no-ops
10. Invokes apktool to recompile
11. Signs APK with debug keystore using apksigner
"""

import os
import sys
import shutil
import zipfile
import subprocess
import re

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
APKTOOL_DIR = os.path.join(ROOT_DIR, "apktool_full")
BUILD_DIR = os.path.join(ROOT_DIR, "build")
KEYSTORE = os.path.join(ROOT_DIR, "keystore", "debug.keystore")

def find_tool(tool_name):
    # 1. System PATH
    found = shutil.which(tool_name)
    if found:
        return found
    # 2. Check ANDROID_HOME or ANDROID_SDK_ROOT
    for env_var in ["ANDROID_HOME", "ANDROID_SDK_ROOT"]:
        sdk = os.environ.get(env_var)
        if sdk:
            bt_dir = os.path.join(sdk, "build-tools")
            if os.path.isdir(bt_dir):
                for v in sorted(os.listdir(bt_dir), reverse=True):
                    cand = os.path.join(bt_dir, v, tool_name)
                    if os.path.exists(cand):
                        return cand
    # 3. macOS standard Android SDK directory
    mac_sdk = os.path.expanduser("~/Library/Android/sdk/build-tools")
    if os.path.isdir(mac_sdk):
        for v in sorted(os.listdir(mac_sdk), reverse=True):
            cand = os.path.join(mac_sdk, v, tool_name)
            if os.path.exists(cand):
                return cand
    return tool_name

APKSIGNER = find_tool("apksigner")
ZIPALIGN = find_tool("zipalign")

def ensure_keystore():
    if not os.path.exists(KEYSTORE):
        os.makedirs(os.path.dirname(KEYSTORE), exist_ok=True)
        print("[*] Generating missing debug.keystore...")
        cmd = [
            "keytool", "-genkey", "-v",
            "-keystore", KEYSTORE,
            "-storepass", "android",
            "-alias", "androiddebugkey",
            "-keypass", "android",
            "-keyalg", "RSA",
            "-keysize", "2048",
            "-validity", "10000",
            "-dname", "CN=Android Debug,O=Android,C=US"
        ]
        try:
            subprocess.run(cmd, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            print("    [+] Successfully generated keystore/debug.keystore.")
        except Exception as e:
            print(f"    [!] Warning: Failed to generate debug.keystore: {e}")

def patch_manifest():
    print("[*] Patching AndroidManifest.xml...")
    manifest_path = os.path.join(APKTOOL_DIR, "AndroidManifest.xml")
    with open(manifest_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Package name
    content = content.replace('package="com.google.android.GoogleCamera"', 'package="com.google.android.GoogleCameraEng"')
    
    # 2. Permission
    content = content.replace('android:name="com.google.android.GoogleCamera.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"',
                            'android:name="com.google.android.GoogleCameraEng.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"')
    
    # 3. Scheme launch
    content = content.replace('android:host="com.google.android.GoogleCamera"',
                            'android:host="com.google.android.GoogleCameraEng"')

    # 4. Providers
    content = content.replace('android:authorities="com.google.android.GoogleCamera.DebugContentProvider"',
                            'android:authorities="com.google.android.GoogleCameraEng.DebugContentProvider"')
    content = content.replace('android:authorities="com.google.android.GoogleCamera.DbDebugDumper"',
                            'android:authorities="com.google.android.GoogleCameraEng.DbDebugDumper"')
    content = content.replace('android:authorities="com.google.android.GoogleCamera.MetricsProvider"',
                            'android:authorities="com.google.android.GoogleCameraEng.MetricsProvider"')
    content = content.replace('android:authorities="com.google.android.GoogleCamera.fileprovider"',
                            'android:authorities="com.google.android.GoogleCameraEng.fileprovider"')
    content = content.replace('android:authorities="com.google.android.apps.camera.specialtypes.SpecialTypesProvider"',
                            'android:authorities="com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider"')
    content = content.replace('android:authorities="com.google.android.GoogleCamera"',
                            'android:authorities="com.google.android.GoogleCameraEng.search"')
    content = content.replace('android:authorities="com.google.android.GoogleCamera.mlkitinitprovider"',
                            'android:authorities="com.google.android.GoogleCameraEng.mlkitinitprovider"')

    # 5. Remove split attributes and split metadata to convert to monolithic standalone APK
    content = content.replace('android:requiredSplitTypes=""', '')
    content = content.replace('android:splitTypes=""', '')
    content = re.sub(r'<meta-data android:name="com\.android\.vending\.splits"[^>]*/>', '', content)
    content = re.sub(r'<meta-data android:name="com\.android\.vending\.derived\.apk\.id"[^>]*/>', '', content)
    content = re.sub(r'<meta-data android:name="com\.android\.stamp\.source"[^>]*/>', '', content)
    content = re.sub(r'<meta-data android:name="com\.android\.stamp\.type"[^>]*/>', '', content)

    # 6. Ensure launcher activity-alias explicitly carries app_name label
    if '<activity-alias android:exported="true" android:name="com.android.camera.CameraLauncher"' in content:
        content = content.replace(
            '<activity-alias android:exported="true" android:name="com.android.camera.CameraLauncher"',
            '<activity-alias android:exported="true" android:label="@string/app_name" android:name="com.android.camera.CameraLauncher"'
        )

    with open(manifest_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] AndroidManifest.xml successfully patched.")

    # 7. Lower minSdkVersion in apktool.yml so APK can install on Android 14, 15, and 16
    apktool_yml_path = os.path.join(APKTOOL_DIR, "apktool.yml")
    if os.path.exists(apktool_yml_path):
        with open(apktool_yml_path, "r", encoding="utf-8") as f:
            yml_content = f.read()
        yml_content = re.sub(r'minSdkVersion:\s*\d+', 'minSdkVersion: 34', yml_content)
        yml_content = re.sub(r'targetSdkVersion:\s*\d+', 'targetSdkVersion: 36', yml_content)
        if "- uncompressed" not in yml_content:
            yml_content = yml_content.replace("doNotCompress:\n", "doNotCompress:\n- uncompressed\n- tflite\n")

        # CRITICAL FIX: Apktool 3.0.3 has a bug where extension-based doNotCompress
        # entries (e.g. "- uncompressed", "- tflite") are NOT honored during ZIP
        # creation. Only explicit full-path entries work. We must enumerate ALL
        # .uncompressed and .tflite asset files by their full relative path so that
        # AssetManager.openFd() can provide file descriptors (requires ZIP_STORED).
        # Without this, TomteGrain, PortraitSegmenter, and MidasNet models all fail.
        assets_dir = os.path.join(APKTOOL_DIR, "assets")
        added_count = 0
        if os.path.isdir(assets_dir):
            for dirpath, dirnames, filenames in os.walk(assets_dir):
                for fname in filenames:
                    if fname.endswith('.uncompressed') or fname.endswith('.tflite'):
                        full_path = os.path.join(dirpath, fname)
                        rel_path = os.path.relpath(full_path, APKTOOL_DIR)
                        entry = f"- {rel_path}"
                        if entry not in yml_content:
                            yml_content += f"{entry}\n"
                            added_count += 1

        with open(apktool_yml_path, "w", encoding="utf-8") as f:
            f.write(yml_content)
        print(f"    [+] apktool.yml: minSdkVersion=34, targetSdkVersion=36.")
        if added_count:
            print(f"    [+] apktool.yml: Added {added_count} explicit asset paths to doNotCompress (apktool 3.0.3 bug workaround).")

def patch_app_name():
    print("[*] Setting app label to 'Pixel Camera' with comprehensive international localization...")
    lang_map = {
        "values": "Pixel Camera",
        "values-en-rGB": "Pixel Camera",
        "values-en-rXA": "[Þîxéļ Çåméŕå one]",
        "values-ar-rXB": "‏‮Pixel Camera‬‏",
        "values-de": "Pixel Kamera",
        "values-de-rAT": "Pixel Kamera",
        "values-de-rCH": "Pixel Kamera",
        "values-gsw": "Pixel Kamera",
        "values-fr": "Appareil photo Pixel",
        "values-fr-rCA": "Appareil photo Pixel",
        "values-fr-rCH": "Appareil photo Pixel",
        "values-es": "Cámara Pixel",
        "values-es-rUS": "Cámara Pixel",
        "values-b+es+419": "Cámara Pixel",
        "values-es-rAR": "Cámara Pixel",
        "values-es-rBO": "Cámara Pixel",
        "values-es-rCL": "Cámara Pixel",
        "values-es-rCO": "Cámara Pixel",
        "values-es-rCR": "Cámara Pixel",
        "values-es-rDO": "Cámara Pixel",
        "values-es-rEC": "Cámara Pixel",
        "values-es-rGT": "Cámara Pixel",
        "values-es-rHN": "Cámara Pixel",
        "values-es-rMX": "Cámara Pixel",
        "values-es-rNI": "Cámara Pixel",
        "values-es-rPA": "Cámara Pixel",
        "values-es-rPE": "Cámara Pixel",
        "values-es-rPR": "Cámara Pixel",
        "values-es-rPY": "Cámara Pixel",
        "values-es-rSV": "Cámara Pixel",
        "values-es-rUY": "Cámara Pixel",
        "values-es-rVE": "Cámara Pixel",
        "values-it": "Fotocamera Pixel",
        "values-pt": "Câmera Pixel",
        "values-pt-rBR": "Câmera Pixel",
        "values-pt-rPT": "Câmara Pixel",
        "values-nl": "Pixel Camera",
        "values-pl": "Aparat Pixel",
        "values-ru": "Камера Pixel",
        "values-uk": "Камера Pixel",
        "values-cs": "Fotoaparát Pixel",
        "values-sk": "Kamera Pixel",
        "values-sl": "Fotoaparat Pixel",
        "values-ro": "Camera Pixel",
        "values-mo": "Camera Pixel",
        "values-bg": "Камера Pixel",
        "values-hr": "Pixel kamera",
        "values-sr": "Pixel камера",
        "values-b+sr+Latn": "Pixel kamera",
        "values-bs": "Pixel kamera",
        "values-hu": "Pixel kamera",
        "values-el": "Κάμερα Pixel",
        "values-tr": "Pixel Kamera",
        "values-sv": "Pixel Kamera",
        "values-da": "Pixel Kamera",
        "values-nb": "Pixel Kamera",
        "values-no": "Pixel Kamera",
        "values-fi": "Pixel Kamera",
        "values-ca": "Càmera Pixel",
        "values-gl": "Cámara Pixel",
        "values-eu": "Pixel kamera",
        "values-is": "Pixel Myndavél",
        "values-lt": "Pixel fotoaparatas",
        "values-lv": "Pixel kamera",
        "values-et": "Pixel kaamera",
        "values-be": "Камера Pixel",
        "values-mk": "Камера Pixel",
        "values-sq": "Pixel Kamera",
        "values-ga": "Pixel Camera",
        "values-cy": "Pixel Camera",
        "values-hy": "Pixel տեսախցիկ",
        "values-ka": "Pixel კამერა",
        "values-az": "Pixel Kamera",
        "values-kk": "Pixel камерасы",
        "values-ky": "Pixel камера",
        "values-uz": "Pixel Kamera",
        "values-af": "Pixel Kamera",
        "values-zu": "Ikhamera yePixel",
        "values-sw": "Kamera ya Pixel",
        "values-am": "Pixel ካሜራ",
        "values-ar": "كاميرا Pixel",
        "values-ar-rEG": "كاميرا Pixel",
        "values-ar-rSA": "كاميرا Pixel",
        "values-iw": "מצלמת Pixel",
        "values-he": "מצלמת Pixel",
        "values-fa": "دوربین Pixel",
        "values-ur": "Pixel کیمرا",
        "values-hi": "Pixel कैमरा",
        "values-mr": "Pixel Camera",
        "values-gu": "Pixel Camera",
        "values-bn": "Pixel ক্যামেরা",
        "values-pa": "Pixel ਕੈਮਰਾ",
        "values-ta": "Pixel கேமரா",
        "values-te": "Pixel కెమెరా",
        "values-kn": "Pixel ಕ್ಯಾಮರಾ",
        "values-ml": "Pixel ക്യാമറ",
        "values-or": "Pixel କେମେରା",
        "values-as": "Pixel কেমেৰা",
        "values-ne": "Pixel क्यामेरा",
        "values-si": "Pixel කැමරාව",
        "values-my": "Pixel ကင်မရာ",
        "values-km": "កាមេរ៉ា Pixel",
        "values-lo": "ກ້ອງ Pixel",
        "values-th": "กล้อง Pixel",
        "values-vi": "Camera Pixel",
        "values-in": "Kamera Pixel",
        "values-id": "Kamera Pixel",
        "values-ms": "Kamera Pixel",
        "values-tl": "Pixel Camera",
        "values-fil": "Pixel Camera",
        "values-ja": "Pixel カメラ",
        "values-ko": "Pixel 카메라",
        "values-zh": "Pixel 相機",
        "values-zh-rCN": "Pixel 相机",
        "values-zh-rHK": "Pixel 相機",
        "values-zh-rTW": "Pixel 相機",
        "values-mn": "Pixel Камер",
        "values-en-rAU": "Pixel Camera",
        "values-en-rCA": "Pixel Camera",
        "values-en-rIE": "Pixel Camera",
        "values-en-rIN": "Pixel Camera",
        "values-en-rSG": "Pixel Camera",
        "values-en-rXC": "Pixel Camera",
        "values-en-rZA": "Pixel Camera",
    }
    res_dir = os.path.join(APKTOOL_DIR, "res")
    updated_count = 0
    if os.path.isdir(res_dir):
        for entry in os.listdir(res_dir):
            if entry.startswith("values"):
                strings_file = os.path.join(res_dir, entry, "strings.xml")
                if os.path.exists(strings_file):
                    label = lang_map.get(entry, "Pixel Camera")
                    with open(strings_file, "r", encoding="utf-8") as f:
                        c = f.read()
                    if '<string name="app_name">' in c:
                        c = re.sub(r'<string name="app_name">.*?</string>', f'<string name="app_name">{label}</string>', c)
                    else:
                        c = c.replace('<resources>', f'<resources>\n    <string name="app_name">{label}</string>')
                    with open(strings_file, "w", encoding="utf-8") as f:
                        f.write(c)
                    updated_count += 1
    print(f"    [+] App label set to 'Pixel Camera' across {updated_count} language locales.")

def patch_vku_smali():
    print("[*] Patching vku.smali (Device Eligibility Checks, was uyv)...")
    vku_path = os.path.join(APKTOOL_DIR, "smali", "vku.smali")
    if not os.path.exists(vku_path):
        print("    [!] Warning: vku.smali not found.")
        return
    with open(vku_path, "r", encoding="utf-8") as f:
        content = f.read()

    def replace_method(src, name, ret_code):
        m_start = src.find(f".method public final {name}")
        if m_start == -1:
            print(f"    [!] Warning: Method {name} not found in vku.smali")
            return src
        m_end = src.find(".end method", m_start) + len(".end method")
        new_m = f""".method public final {name}
    .locals 1

    {ret_code}
.end method"""
        return src[:m_start] + new_m + src[m_end:]

    content = replace_method(content, "l()Z", "const/4 v0, 0x1\n\n    return v0")

    with open(vku_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] vku.smali patched: l() returns true (sauce eligible). e(), g() and f() preserved.")

def patch_ksf_smali():
    print("[*] Patching ksf.smali (Gouda flags, Mantis, Looks, Segmenter model interception, was klm)...")
    ksf_path = os.path.join(APKTOOL_DIR, "smali_classes2", "ksf.smali")
    if not os.path.exists(ksf_path):
        print("    [!] Warning: ksf.smali not found.")
        return
    with open(ksf_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Patch q(Lkps;)Z
    q_start = content.find(".method public final q(Lkps;)Z")
    if q_start != -1:
        q_end = content.find(".end method", q_start)
        target_marker = "iget-object v0, p0, Lksf;->b:Ljava/util/Map;"
        map_idx = content.find(target_marker, q_start)
        if map_idx != -1 and map_idx < q_end:
            new_q = """.method public final q(Lkps;)Z
    .locals 3

    if-eqz p1, :cond_check_orig

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig

    const-string v1, "camera.lasagna"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_use_eclipse

    const/4 v0, 0x0

    return v0

    :cond_check_use_eclipse
    const-string v1, "camera.use_eclipse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_milk

    const/4 v0, 0x0

    return v0

    :cond_check_milk
    const-string v1, "camera.milk"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ceftazidime

    const/4 v0, 0x0

    return v0

    :cond_check_ceftazidime
    const-string v1, "camera.ceftazidime"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_decepticon

    const/4 v0, 0x0

    return v0

    :cond_check_decepticon
    const-string v1, "camera.decepticon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_sauce

    const/4 v0, 0x0

    return v0

    :cond_check_sauce
    const-string v1, "camera.sauce"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_twilight

    const/4 v0, 0x1

    return v0

    :cond_check_twilight
    const-string v1, "camera.enable_twilight"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_single_knob

    const/4 v0, 0x1

    return v0

    :cond_check_single_knob
    const-string v1, "camera.dualev.singleKnob"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_dualev

    const/4 v0, 0x0

    return v0

    :cond_check_dualev
    const-string v1, "camera.dualev"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_qa

    const/4 v0, 0x1

    return v0

    :cond_check_qa
    const-string v1, "camera.quick_access"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_gs

    const/4 v0, 0x1

    return v0

    :cond_check_gs
    const-string v1, "camera.getting_started_enabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_chameleon

    const/4 v0, 0x1

    return v0

    :cond_check_chameleon
    const-string v1, "camera.chameleon"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_cct

    const/4 v0, 0x1

    return v0

    :cond_check_cct
    const-string v1, "camera.enable_show_cct"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_freesia

    const/4 v0, 0x1

    return v0

    :cond_check_freesia
    const-string v1, "camera.enable_freesia"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_peony

    const/4 v0, 0x1

    return v0

    :cond_check_peony
    const-string v1, "camera.enable_peony"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_basil

    const/4 v0, 0x1

    return v0

    :cond_check_basil
    const-string v1, "camera.enable_basil"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_granite

    const/4 v0, 0x1

    return v0

    :cond_check_creator_granite
    const-string v1, "camera.enable_granite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_biotite

    const/4 v0, 0x1

    return v0

    :cond_check_creator_biotite
    const-string v1, "camera.enable_biotite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_mica

    const/4 v0, 0x1

    return v0

    :cond_check_creator_mica
    const-string v1, "camera.enable_mica"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_slate

    const/4 v0, 0x1

    return v0

    :cond_check_creator_slate
    const-string v1, "camera.enable_slate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_basalt

    const/4 v0, 0x1

    return v0

    :cond_check_creator_basalt
    const-string v1, "camera.enable_basalt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_autoscroll

    const/4 v0, 0x1

    return v0

    :cond_check_creator_autoscroll
    const-string v1, "camera.biotite_auto_scroll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_almond_tpu

    const/4 v0, 0x1

    return v0

    :cond_check_almond_tpu
    const-string v1, "camera.almond_use_tpu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_cyclops_tpu

    const/4 v0, 0x0

    return v0

    :cond_check_cyclops_tpu
    const-string v1, "camera.cyclops_use_tpu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_macro_badging

    const/4 v0, 0x0

    return v0

    :cond_check_macro_badging
    const-string v1, "camera.enable_macro_focus_badging"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_centaur_setting

    const/4 v0, 0x1

    return v0

    :cond_check_centaur_setting
    const-string v1, "camera.enable_centaur"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_jelly

    const/4 v0, 0x0

    return v0

    :cond_check_boba_jelly
    const-string v1, "camera.enable_boba_jelly"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_eligible

    const/4 v0, 0x1

    return v0

    :cond_check_boba_eligible
    const-string v1, "camera.boba_jelly_eligible"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna_darwinn

    const/4 v0, 0x1

    return v0

    :cond_check_lasagna_darwinn
    const-string v1, "camera.lasagna.use_darwinn"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_tpu_generic

    const/4 v0, 0x0

    return v0

    :cond_check_tpu_generic
    const-string v1, "use_tpu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_check_darwinn_generic

    const/4 v0, 0x0

    return v0

    :cond_check_darwinn_generic
    const-string v1, "darwinn"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_check_ark_lens

    const/4 v0, 0x0

    return v0

    :cond_check_ark_lens
    const-string v1, "camera.ark_lens_selector"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ark

    const/4 v0, 0x1

    return v0

    :cond_check_ark
    const-string v1, "camera.ark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_jellybean_setting

    const/4 v0, 0x1

    return v0

    :cond_check_jellybean_setting
    const-string v1, "camcorder.jellybean_setting"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_jellybean_feature

    const/4 v0, 0x1

    return v0

    :cond_check_jellybean_feature
    const-string v1, "camcorder_jellybean_feature"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_orig

    const/4 v0, 0x1

    return v0

    :cond_check_orig
    """
            content = content[:q_start] + new_q + content[map_idx:]

    # 1b. Patch x(Lkps;)Z
    x_start = content.find(".method public final x(Lkps;)Z")
    if x_start != -1:
        x_end = content.find(".end method", x_start)
        target_marker_x = "iget-object p0, p0, Lksf;->b:Ljava/util/Map;"
        map_idx_x = content.find(target_marker_x, x_start)
        if map_idx_x != -1 and map_idx_x < x_end:
            flags_x = [
                "camera.enable_granite",
                "camera.enable_biotite",
                "camera.enable_mica",
                "camera.enable_slate",
                "camera.enable_basalt",
                "camera.biotite_auto_scroll",
                "camera.enable_macro_focus_badging",
                "camera.enable_boba_jelly",
                "camera.boba_jelly_eligible",
                "camera.chameleon",
                "camera.enable_show_cct",
                "camera.enable_freesia",
                "camera.enable_peony",
                "camera.enable_basil",
                "camera.ark_enabled",
                "camera.ark_focus_available",
                "camera.ark_edge_hex",
                "camera.ark_shutter_speed_available",
                "camera.ark_ISO_available",
                "camera.ark_lens_selector_available",
                "camera.ark_lens_selector",
                "camcorder.jellybean_setting",
                "camcorder_jellybean_feature",
            ]
            chain_x = ""
            for idx, flag in enumerate(flags_x):
                next_label = f"cond_check_creator_x_{idx+1}" if idx+1 < len(flags_x) else "cond_check_orig_x"
                chain_x += f"""    const-string v1, "{flag}"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :{next_label}

    const/4 v0, 0x1

    return v0

    :{next_label}
"""
            new_x = f""".method public final x(Lkps;)Z
    .locals 3

    if-eqz p1, :cond_check_orig_x

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_x

    const-string v1, "camera.lasagna"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_use_eclipse_x

    const/4 v0, 0x0

    return v0

    :cond_check_use_eclipse_x
    const-string v1, "camera.use_eclipse"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_milk_x

    const/4 v0, 0x0

    return v0

    :cond_check_milk_x
    const-string v1, "camera.milk"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ceftazidime_x

    const/4 v0, 0x0

    return v0

    :cond_check_ceftazidime_x
    const-string v1, "camera.ceftazidime"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_decepticon_x

    const/4 v0, 0x0

    return v0

    :cond_check_decepticon_x
    const-string v1, "camera.decepticon"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_tpu_generic_x

    const/4 v0, 0x0

    return v0

    :cond_check_tpu_generic_x
    const-string v1, "use_tpu"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_check_darwinn_generic_x

    const/4 v0, 0x0

    return v0

    :cond_check_darwinn_generic_x
    const-string v1, "darwinn"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_check_ark_lens_x

    const/4 v0, 0x0

    return v0

    :cond_check_ark_lens_x
    const-string v1, "camera.ark_lens_selector"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ark_x

    const/4 v0, 0x1

    return v0

    :cond_check_ark_x
    const-string v1, "camera.ark"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_lobster_x

    const/4 v0, 0x1

    return v0

    :cond_check_lobster_x
    const-string v1, "camera.lobster"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_0

    invoke-static {{}}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z

    move-result v1

    if-eqz v1, :cond_lobster_disabled_x

    const-string v1, "camera.lobster.default"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_lobster_enabled_x

    const/4 v0, 0x0

    return v0

    :cond_lobster_enabled_x
    const/4 v0, 0x1

    return v0

    :cond_lobster_disabled_x
    const/4 v0, 0x0

    return v0

    :cond_check_creator_x_0
{chain_x}"""
            content = content[:x_start] + new_x + content[map_idx_x:]
            print("    [+] klm.smali: x(Lkps;) patched (lasagna disabled, creator flags enabled, ark pro controls, AV1 video encoding).")

    # 2. Patch h(Lkps;)Ljava/lang/String;
    h_start = content.find(".method public final h(Lkps;)Ljava/lang/String;")
    if h_start != -1:
        h_end = content.find(".end method", h_start)
        target_marker = "iget-object v0, p0, Lksf;->b:Ljava/util/Map;"
        map_idx = content.find(target_marker, h_start)
        if map_idx != -1 and map_idx < h_end:
            new_h = """.method public final h(Lkps;)Ljava/lang/String;
    .locals 3

    if-eqz p1, :cond_check_orig_h

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_h

    const-string v1, "camera.lasagna.motion_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna_saliency_model

    const-string v0, "motion-custom_op-p23.tflite.uncompressed"

    return-object v0

    :cond_check_lasagna_saliency_model
    const-string v1, "camera.lasagna.saliency_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_segmenter_model

    const-string v0, "saliency-custom_op-p23.tflite.uncompressed"

    return-object v0

    :cond_check_gouda_segmenter_model
    const-string v1, "camera.gouda.portrait_segmenter_model_name"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_monocular_model

    const-string v0, "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed"

    return-object v0

    :cond_check_gouda_monocular_model
    const-string v1, "camera.gouda.monocular_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_rear_pdlearned_model

    const-string v0, "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed"

    return-object v0

    :cond_check_gouda_rear_pdlearned_model
    const-string v1, "camera.gouda.rear_pdlearned_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_rear_pdlearned_remosaic_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_rear_pdlearned_remosaic_model
    const-string v1, "camera.gouda.rear_pdlearned_remosaic_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_front_pdlearned_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_front_pdlearned_model
    const-string v1, "camera.gouda.front_pdlearned_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_front_rgbpd_v2_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_front_rgbpd_v2_model
    const-string v1, "camera.gouda.front_rgbpd_v2_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_pdstereo_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_pdstereo_model
    const-string v1, "camera.gouda.pdstereo_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_pdstereo_remosaic_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_pdstereo_remosaic_model
    const-string v1, "camera.gouda.pdstereo_remosaic_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_physeter_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_physeter_model
    const-string v1, "camera.gouda.physeter_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_physeter_v2_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_physeter_v2_model
    const-string v1, "camera.gouda.physeter_v2_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_physeter_v3_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_physeter_v3_model
    const-string v1, "camera.gouda.physeter_v3_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_depth_postprocessor_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_depth_postprocessor_model
    const-string v1, "camera.gouda.depth_postprocessor_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_gouda_portrait_matting_model

    const-string v0, ""

    return-object v0

    :cond_check_gouda_portrait_matting_model
    const-string v1, "camera.gouda.portrait_matting_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_sauce_grain_model

    const-string v0, "portrait_matting_mask_1024_768.tflite.uncompressed"

    return-object v0

    :cond_check_sauce_grain_model
    const-string v1, "camera.sauce_grain_model_asset_name"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_orig_h

    const-string v0, "3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed"

    return-object v0

    :cond_check_orig_h
    """
            content = content[:h_start] + new_h + content[map_idx:]
            print("    [+] klm.smali: h(Lkps;) patched for segmenter model fallback.")

    # 3. Patch r(Lkps;)Lj$/util/Optional;
    r_start = content.find(".method public final r(Lkps;)Lj$/util/Optional;")
    if r_start != -1:
        r_end = content.find(".end method", r_start)
        target_marker = "iget-object v0, p0, Lksf;->b:Ljava/util/Map;"
        map_idx2 = content.find(target_marker, r_start)
        if map_idx2 != -1 and map_idx2 < r_end:
            new_r = """.method public final r(Lkps;)Lj$/util/Optional;
    .locals 6

    if-eqz p1, :cond_check_orig_r

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_r

    const-string v1, "camera.boba_jelly_min_active_area_ratio"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_thresh

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_boba_thresh
    const-string v1, "camera.boba_jelly_threshold"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_ext

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_boba_ext
    const-string v1, "camera.boba_jelly_ext_threshold"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_orig_r

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_orig_r
    """
            content = content[:r_start] + new_r + content[map_idx2:]
            print("    [+] klm.smali: r(Lkps;) patched for Gouda max_zoom, mantis, and Boba Jelly flags.")

    # 4. Replace missing Lasagna models in klm.smali
    content = content.replace("4af512f87afd43af81a4bbd160034804/4af512f87afd43af81a4bbd160034804.uncompressed", "")
    content = content.replace("883d5b28a96b465dbc777ccfc636f47e/883d5b28a96b465dbc777ccfc636f47e.uncompressed", "")
    content = content.replace("b305f0a853a14d968fb908b514d82a4e/b305f0a853a14d968fb908b514d82a4e.uncompressed", "")
    content = content.replace("3d56a07c1f3440b1a8ee45347e2d166d/3d56a07c1f3440b1a8ee45347e2d166d.uncompressed", "")
    content = content.replace("motion-custom_op-p22.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-p22.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-v6.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-v6.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-p22.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-p22.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-v6.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-v6.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")

    # 5. Disable darwinn offline compilation kkn.Q in klm.smali
    target_kkn_q = """    sget-object p5, Lkrg;->Q:Lkps;

    invoke-virtual {p0, p5, v7}, Lksf;->n(Lkps;Z)V"""

    repl_kkn_q = """    sget-object p5, Lkrg;->Q:Lkps;

    invoke-virtual {p0, p5, v6}, Lksf;->n(Lkps;Z)V"""
    content = content.replace(target_kkn_q, repl_kkn_q)

    # 6. Disable all camera.lasagna flags in klm.smali initialization (f=lasagna, g=action, h=long_exposure, i=bottom_layer, j=use_darwinn)
    for fld in ["f", "g", "h", "i", "j"]:
        for reg in ["p2", "p5"]:
            old_str = f"""    sget-object {reg}, Lkqt;->{fld}:Lkps;

    invoke-virtual {{p0, {reg}, v7}}, Lksf;->n(Lkps;Z)V"""
            new_str = f"""    sget-object {reg}, Lkqt;->{fld}:Lkps;

    invoke-virtual {{p0, {reg}, v6}}, Lksf;->n(Lkps;Z)V"""
            content = content.replace(old_str, new_str)

    with open(ksf_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_hpq_smali():
    print("[*] Patching fue.smali / hpq.smali (Device portrait configuration)...")
    hpq_path = os.path.join(APKTOOL_DIR, "smali", "fue.smali")
    if not os.path.exists(hpq_path):
        hpq_path = os.path.join(APKTOOL_DIR, "smali", "hpq.smali")
    if not os.path.exists(hpq_path):
        print("    [!] Warning: fue.smali / hpq.smali not found.")
        return
    with open(hpq_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Replace all motion/saliency models to p23 (native Tensor G3, valid FlatBuffer)
    content = content.replace("motion-custom_op-p22.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-p22.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-v6.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-v6.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")

    # 2. Replace missing / TPU models with empty string (Pixel 11, Pixel 10 Pro, Pixel 10)
    content = content.replace("4af5126d40f8452ebbeaa77e2ffeb8fa/4af5126d40f8452ebbeaa77e2ffeb8fa.uncompressed", "")
    content = content.replace("883d5b28a96b465dbc777ccfc636f47e/883d5b28a96b465dbc777ccfc636f47e.uncompressed", "")
    content = content.replace("b305f0a853a14d968fb908b514d82a4e/b305f0a853a14d968fb908b514d82a4e.uncompressed", "")
    content = content.replace("3d56a07c1f3440b1a8ee45347e2d166d/3d56a07c1f3440b1a8ee45347e2d166d.uncompressed", "")
    content = content.replace("2fa01617d50043c798a5457a3473cbd9/2fa01617d50043c798a5457a3473cbd9.uncompressed", "")
    content = content.replace("f4d498c17ff445c395da824c601acbc9/f4d498c17ff445c395da824c601acbc9.uncompressed", "")
    content = content.replace("a8b044b9956f4fea8c40e347223b0447/a8b044b9956f4fea8c40e347223b0447.uncompressed", "")
    content = content.replace("2120a6d71ec64923851163e058d16b77/2120a6d71ec64923851163e058d16b77.uncompressed", "")
    content = content.replace("fceb04ab725e4d5f9b6563865f20ad1b/fceb04ab725e4d5f9b6563865f20ad1b.uncompressed", "")
    missing_milk_hashes = [
        "89be18a9338f4aad957d4fe2ec11b5b5.uncompressed",
        "faa7abeef6904e948ea776355e984161.uncompressed",
        "4631bf31d89bf26dde7c70ea5dedf8a1.uncompressed",
        "26dde7c70ea5dedf8a14631bf31d89bf.uncompressed",
        "70ea5dedf8a14631bf31d89bf26dde7c.uncompressed",
        "c76dccefa6284f11902b8eadee538ca5.uncompressed",
        "1497ad4cfd5b4362804e2f59813e986d.uncompressed",
        "b881ce5aefc948e1a9118dd65eb9f8f1.tflite.uncompressed",
        "8bd5e22b220348078faf705e9f359e3d.tflite.uncompressed",
        "14fd121a077b4304bce9977a3d97a42a.tflite.uncompressed",
        "b933c7da1fa54d36a167d0287af1eb34/b933c7da1fa54d36a167d0287af1eb34.uncompressed",
        "8f8f04c8160444b9994367d3c0863f18/8f8f04c8160444b9994367d3c0863f18.uncompressed",
        "5712d9433c92464496f2668a824dbd3d/5712d9433c92464496f2668a824dbd3d.uncompressed",
        "all_in_film_blender_sharded_512_256-graph-custom_op_tpu_p25.tflite.uncompressed",
        "a598d3b5915840aba93217796ea91a11.uncompressed",
        "e7c70ea5dedf8a14631bf31d89bf26dd.uncompressed",
        "89bf26dde7c70ea5dedf8a14631bf31d.uncompressed",
    ]
    for h in missing_milk_hashes:
        content = content.replace(h, "")

    # 2b. Map all device portrait models across generations (P21..P25) to verified non-TPU pure TFLite models
    # Monocular models (front/rear portrait depth) -> midasnet
    content = content.replace("881739470eaba348da266e4f8cec36a8/881739470eaba348da266e4f8cec36a8.uncompressed",
                              "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed")
    content = content.replace("6e4f8cec36a8881739470eaba348da26/6e4f8cec36a8881739470eaba348da26.uncompressed",
                              "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed")
    content = content.replace("efaffa0bfaf74be2ad2e17aeff79f3db/efaffa0bfaf74be2ad2e17aeff79f3db.uncompressed",
                              "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed")
    content = content.replace("ec36a8881739470eaba348da266e4f8c/ec36a8881739470eaba348da266e4f8c.uncompressed",
                              "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed")

    # Rear learned PD models -> ""
    content = content.replace("c21a1523ba6c48c2a0bf2ca4f6d6c0f0/c21a1523ba6c48c2a0bf2ca4f6d6c0f0.uncompressed", "")
    content = content.replace("1a6566f5ceb54b50b61f553f347f6f64/1a6566f5ceb54b50b61f553f347f6f64.uncompressed", "")
    content = content.replace("dd674d048bbc43c1b338a6692cf9c481/dd674d048bbc43c1b338a6692cf9c481.uncompressed", "")
    content = content.replace("a7a5b6a2bc5b4e04a8a64f9b30c86bf1/a7a5b6a2bc5b4e04a8a64f9b30c86bf1.uncompressed", "")
    content = content.replace("a06600a838c64acd9c68ae65f8b2bc5f/a06600a838c64acd9c68ae65f8b2bc5f.uncompressed", "")
    content = content.replace("2c51b285d81a44d7a619538fe13cb421/2c51b285d81a44d7a619538fe13cb421.uncompressed", "")
    content = content.replace("4cdbd4b13ea54a309eb235a75232ae6d/4cdbd4b13ea54a309eb235a75232ae6d.uncompressed", "")

    # PD stereo models -> ""
    content = content.replace("9599cabbb2fa4aa79ee0c44f0c1553ad/9599cabbb2fa4aa79ee0c44f0c1553ad.uncompressed", "")
    content = content.replace("a3a43595f3aa49b3b4ab6ff4bb63de83/a3a43595f3aa49b3b4ab6ff4bb63de83.uncompressed", "")
    content = content.replace("0e14a3dd073345168f939198e03f2d4e/0e14a3dd073345168f939198e03f2d4e.uncompressed", "")
    content = content.replace("5751e2e2a711430695dac2c034cfd295/5751e2e2a711430695dac2c034cfd295.uncompressed", "")

    # Depth postprocessor models -> ""
    content = content.replace("de8bc16ea114427d88425742785fccac/de8bc16ea114427d88425742785fccac.uncompressed", "")
    content = content.replace("a982533a4222473db9f191c212a99740/a982533a4222473db9f191c212a99740.uncompressed", "")
    content = content.replace("0b2b230344f74db8868ffd9f1c042393/0b2b230344f74db8868ffd9f1c042393.uncompressed", "")
    content = content.replace("cac29f5597f5453bbabb54f6f2080e39/cac29f5597f5453bbabb54f6f2080e39.uncompressed", "")

    # Portrait matting models -> portrait_matting_mask_1024_768
    content = content.replace("518658ef4ea04adf8e19e64d5aa019d0/518658ef4ea04adf8e19e64d5aa019d0.uncompressed",
                              "portrait_matting_mask_1024_768.tflite.uncompressed")
    content = content.replace("f452199b34d445868df25db5b960f191/f452199b34d445868df25db5b960f191.uncompressed",
                              "portrait_matting_mask_1024_768.tflite.uncompressed")
    content = content.replace("01bac7b33fc440d59b8ddc817ce91b7c/01bac7b33fc440d59b8ddc817ce91b7c.uncompressed",
                              "portrait_matting_mask_1024_768.tflite.uncompressed")
    content = content.replace("a7ab2018912b4f958760b7763b36256a/a7ab2018912b4f958760b7763b36256a.uncompressed",
                              "portrait_matting_mask_1024_768.tflite.uncompressed")


    # 3. Disable use_darwinn_offline_compilation (kkn.Q)
    target_q = """    sget-object v4, Lkrg;->Q:Lkps;

    invoke-virtual {v0, v4, v5}, Lksf;->n(Lkps;Z)V"""

    repl_q = """    sget-object v4, Lkrg;->Q:Lkps;

    invoke-virtual {v0, v4, v7}, Lksf;->n(Lkps;Z)V"""
    content = content.replace(target_q, repl_q)

    # 4. Populate missing khw binned RAW dimensions in Pixel 10 Pro (hpq.aW) and Pixel 10 (hpq.aX)
    target_aw_khw = """    sget-object p1, Lkhw;->a:Lkpr;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V"""

    repl_aw_khw = """    sget-object p1, Lkhw;->a:Lkpr;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->d:Lkpr;

    const/16 v0, 0x7f0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->e:Lkpr;

    const/16 v0, 0x600

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->f:Lkpr;

    const/16 v0, 0x7e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->g:Lkpr;

    const/16 v0, 0x5e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V"""
    if target_aw_khw in content:
        content = content.replace(target_aw_khw, repl_aw_khw)

    target_ax_khw = """    sget-object p1, Lkhw;->a:Lkpr;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V"""

    repl_ax_khw = """    sget-object p1, Lkhw;->a:Lkpr;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->d:Lkpr;

    const/16 v4, 0x7f0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->e:Lkpr;

    const/16 v4, 0x600

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->f:Lkpr;

    const/16 v4, 0x7e0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->g:Lkpr;

    const/16 v4, 0x5e8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lksf;->c(Lkpr;Ljava/lang/Integer;)V"""
    if target_ax_khw in content:
        content = content.replace(target_ax_khw, repl_ax_khw)

    # 5. Disable failing Eclipse AE on Pixel 10 (hpq.aX)
    target_ax_bb = """    sget-object v4, Lkqi;->bb:Lkps;

    invoke-virtual {p0, v4, v1}, Lksf;->n(Lkps;Z)V"""

    repl_ax_bb = """    sget-object v4, Lkqi;->bb:Lkps;

    invoke-virtual {p0, v4, v2}, Lksf;->n(Lkps;Z)V"""

    if target_ax_bb in content:
        content = content.replace(target_ax_bb, repl_ax_bb)

    # 6. Unblock Custom / Default Gallery Target (hpq.cD)
    target_gallery = """    const-string p1, "com.google.android.apps.photos"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    return-object p0"""

    repl_gallery = """    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->configureGalleryIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p0

    return-object p0"""

    if target_gallery in content:
        content = content.replace(target_gallery, repl_gallery)
        print("    [+] hpq.smali: patched hpq.cD for custom/default gallery targets.")

    with open(hpq_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] hpq.smali: segmenter model replaced, missing/TPU models nulled, binned RAW dimensions added, camera.use_eclipse disabled on Pixel 10.")

    # Also check hwb.smali (11.1 equivalent of hpq)
    hwb_path = os.path.join(APKTOOL_DIR, "smali", "hwb.smali")
    if os.path.exists(hwb_path):
        with open(hwb_path, "r", encoding="utf-8") as f:
            hwb_content = f.read()
        if target_gallery in hwb_content:
            hwb_content = hwb_content.replace(target_gallery, repl_gallery)
            with open(hwb_path, "w", encoding="utf-8") as f:
                f.write(hwb_content)
            print("    [+] hwb.smali: patched hwb.w for custom/default gallery targets.")

def patch_kic_smali():
    print("[*] Patching kov.smali / kic.smali (Nulling failing TPU PD models)...")
    kic_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kov.smali")
    if not os.path.exists(kic_path):
        kic_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kic.smali")
    if not os.path.exists(kic_path):
        print("    [!] Warning: kov.smali / kic.smali not found.")
        return
    with open(kic_path, "r", encoding="utf-8") as f:
        content = f.read()

    content = content.replace("c757a03ae8d64d1b9375002b75dcdbbc/c757a03ae8d64d1b9375002b75dcdbbc.uncompressed", "")
    content = content.replace("0ea471704af14008b0483bc9b630a85c/0ea471704af14008b0483bc9b630a85c.uncompressed", "")
    # Replace all v6 models with p23 (native Tensor G3, valid FlatBuffer)
    content = content.replace("motion-custom_op-v6.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-v6.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-p23.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-p23.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")

    # Disable camera.lasagna.use_darwinn in kic.smali
    target_darwinn = """    sget-object v3, Lkqt;->j:Lkps;

    invoke-virtual {p0, v3, v1}, Lksf;->n(Lkps;Z)V"""
    repl_darwinn = """    sget-object v3, Lkqt;->j:Lkps;

    invoke-virtual {p0, v3, v4}, Lksf;->n(Lkps;Z)V"""
    content = content.replace(target_darwinn, repl_darwinn)

    # Disable portrait_depth_use_tpu (kkn.aj) and portrait_matting_use_tpu (kkn.ak) in kic.smali
    target_kic_tpu = """    sget-object p1, Lkrg;->aj:Lkps;

    invoke-virtual {p0, p1, v1}, Lksf;->n(Lkps;Z)V

    sget-object p1, Lkrg;->ak:Lkps;

    invoke-virtual {p0, p1, v1}, Lksf;->n(Lkps;Z)V"""
    repl_kic_tpu = """    sget-object p1, Lkrg;->aj:Lkps;

    invoke-virtual {p0, p1, v4}, Lksf;->n(Lkps;Z)V

    sget-object p1, Lkrg;->ak:Lkps;

    invoke-virtual {p0, p1, v4}, Lksf;->n(Lkps;Z)V"""
    content = content.replace(target_kic_tpu, repl_kic_tpu)

    with open(kic_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] kic.smali: EdgeTPU PD models nulled, gouda TPU flags disabled, and lasagna use_darwinn disabled.")

def patch_mwg_smali():
    print("[*] Patching mwg.smali (Force CPU inference for Lasagna / Motion Blur)...")
    mwg_path = os.path.join(APKTOOL_DIR, "smali_classes2", "mwg.smali")
    if not os.path.exists(mwg_path):
        print("    [!] Warning: mwg.smali not found.")
        return
    with open(mwg_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    sget-object v7, Lkqt;->j:Lkps;

    invoke-virtual {v6, v7}, Lksf;->q(Lkps;)Z

    move-result v19"""

    repl = """    sget-object v7, Lkqt;->j:Lkps;

    invoke-virtual {v6, v7}, Lksf;->q(Lkps;)Z

    const/16 v19, 0x0"""

    if target in content:
        content = content.replace(target, repl)
        print("    [+] mwg.smali: Forced CPU inference (v19 = false).")

    target_cache = """    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->k:Lxwg;

    invoke-virtual {v6}, Lxwg;->h()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v6}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_3
    const-string v6, ""

    :goto_1
    move-object v13, v6"""

    repl_cache = """    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->j:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13"""

    if target_cache in content:
        content = content.replace(target_cache, repl_cache)
        print("    [+] mwg.smali: Redirected cache directory to internal getCacheDir().")

    with open(mwg_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_aaog_smali():
    print("[*] Patching aaog.smali and installing LasagnaModelLoader...")
    loader_dir = os.path.join(APKTOOL_DIR, "smali_classes2", "app", "morphe", "patches", "pixelcamera")
    os.makedirs(loader_dir, exist_ok=True)
    loader_path = os.path.join(loader_dir, "LasagnaModelLoader.smali")
    
    loader_smali = """.class public Lapp/morphe/patches/pixelcamera/LasagnaModelLoader;
.super Ljava/lang/Object;
.source "LasagnaModelLoader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static openAsset(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 8

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/high16 v3, 0x10000

    new-array v3, v3, [B

    :goto_0
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_2
    const/high16 v0, 0x10000000

    invoke-static {v1, v0}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    new-instance v2, Landroid/content/res/AssetFileDescriptor;

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/16 v4, 0x0

    invoke-direct/range {v2 .. v7}, Landroid/content/res/AssetFileDescriptor;-><init>(Landroid/os/ParcelFileDescriptor;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v2

    :catchall_0
    move-exception v0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    :catchall_1
    move-exception v0

    const/4 p0, 0x0

    return-object p0
.end method
"""
    with open(loader_path, "w", encoding="utf-8") as f:
        f.write(loader_smali)
    print("    [+] LasagnaModelLoader.smali created.")

    aaog_path = os.path.join(APKTOOL_DIR, "smali", "aaog.smali")
    if os.path.exists(aaog_path):
        with open(aaog_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = """.method public final l(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 0

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0

    return-object p0
.end method"""
        repl = """.method public final l(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 0

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0, p1}, Lapp/morphe/patches/pixelcamera/LasagnaModelLoader;->openAsset(Landroid/content/Context;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0

    return-object p0
.end method"""
        # TEMPORARILY DISABLED: Using direct openFd() with logging to debug model loading
        # if target in content:
        #     content = content.replace(target, repl)
        #     with open(aaog_path, "w", encoding="utf-8") as f:
        #         f.write(content)
        #     print("    [+] aaog.smali: Redirected l(String) to LasagnaModelLoader.openAsset().")


def patch_libgcastartup():
    print("[*] Patching libgcastartup.so (Bypassing EdgeTPU Darwinn assertion for Motion Blur / Lasagna)...")
    so_path = os.path.join(APKTOOL_DIR, "lib", "arm64-v8a", "libgcastartup.so")
    bak_path = so_path + ".bak"
    if os.path.exists(bak_path):
        os.remove(bak_path)
    for root, dirs, files in os.walk(os.path.join(APKTOOL_DIR, "lib")):
        for f in files:
            if f.endswith(".bak"):
                try:
                    os.remove(os.path.join(root, f))
                except Exception:
                    pass
    if not os.path.exists(so_path):
        print("    [!] Warning: libgcastartup.so not found, skipping patch.")
        return
    with open(so_path, "r+b") as f:
        # 1. 0x352b5d0: b.ne 0x352b698 (41 06 00 54) -> nop (1f 20 03 d5)
        # Forces standard TFLite interpreter initialization path, bypassing Darwinn TPU delegate
        f.seek(0x352b5d0)
        orig1 = f.read(4)
        if orig1 == bytes.fromhex("41060054"):
            f.seek(0x352b5d0)
            f.write(bytes.fromhex("1f2003d5"))
            print("    [+] Patched 0x352b5d0: b.ne -> nop (force CPU TFLite interpreter)")
        elif orig1 == bytes.fromhex("1f2003d5"):
            print("    [+] 0x352b5d0 already patched.")

        # 2. 0x31db540: cinc w10, w8, ne (0a 05 88 1a) -> mov w10, w8 (ea 03 08 2a)
        # Forces delegate_type to 2 (non-TPU), preventing TPU selection
        f.seek(0x31db540)
        orig2 = f.read(4)
        if orig2 == bytes.fromhex("0a05881a"):
            f.seek(0x31db540)
            f.write(bytes.fromhex("ea03082a"))
            print("    [+] Patched 0x31db540: cinc w10, w8, ne -> mov w10, w8")
        elif orig2 == bytes.fromhex("ea03082a"):
            print("    [+] 0x31db540 already patched.")

        # 3. 0x352b6a0: b.ne 0x352b9a8 (41 18 00 54) -> nop (1f 20 03 d5)
        # Prevents assertion crash if 0x352b698 is ever reached
        f.seek(0x352b6a0)
        orig3 = f.read(4)
        if orig3 == bytes.fromhex("41180054"):
            f.seek(0x352b6a0)
            f.write(bytes.fromhex("1f2003d5"))
            print("    [+] Patched 0x352b6a0: b.ne -> nop")
        elif orig3 == bytes.fromhex("1f2003d5"):
            print("    [+] 0x352b6a0 already patched.")

        # 4. 0x242069c: tbz w0, #0x0, 0x2420640 (20 fd 07 36) -> nop (1f 20 03 d5)
        # Bypasses VerifyModelBuffer rejection in FlatBufferModel::BuildFromBuffer
        f.seek(0x242069c)
        orig4 = f.read(4)
        if orig4 == bytes.fromhex("20fd0736"):
            f.seek(0x242069c)
            f.write(bytes.fromhex("1f2003d5"))
            print("    [+] Patched 0x242069c: tbz -> nop (bypass VerifyModelBuffer)")
        elif orig4 == bytes.fromhex("1f2003d5"):
            print("    [+] 0x242069c already patched.")

        # 5. 0x2420880: ldr x11, [x1] (2b 00 40 f9 2a 60 40 39) -> mov w0, #1; ret (20 00 80 52 c0 03 5f d6)
        # Forces tflite::VerifyModelBuffer to always return true (success)
        f.seek(0x2420880)
        orig5 = f.read(8)
        if orig5 == bytes.fromhex("2b0040f92a604039"):
            f.seek(0x2420880)
            f.write(bytes.fromhex("20008052c0035fd6"))
            print("    [+] Patched 0x2420880: VerifyModelBuffer -> return true")
        elif orig5 == bytes.fromhex("20008052c0035fd6"):
            print("    [+] 0x2420880 already patched.")

        # 6. 0x442ef3c: cbz x8, #0x442ef68 (68 01 00 b4) -> b #0x442ef68 (0b 00 00 14)
        # Bypasses Halide pyramidal Luma denoiser kernel in finish_raw, jumping straight to operator delete(runner)
        f.seek(0x442ef3c)
        orig6 = f.read(4)
        if orig6 == bytes.fromhex("680100b4"):
            f.seek(0x442ef3c)
            f.write(bytes.fromhex("0b000014"))
            print("    [+] Patched 0x442ef3c: cbz -> b (bypass Halide Luma denoiser kernel)")
        elif orig6 == bytes.fromhex("0b000014"):
            print("    [+] 0x442ef3c already patched.")

        # 7. 0x442efb4: cbz x8, #0x442efe4 (88 01 00 b4) -> b #0x442efe4 (0c 00 00 14)
        # Bypasses Halide pyramidal Chroma denoiser kernel in finish_raw
        f.seek(0x442efb4)
        orig7 = f.read(4)
        if orig7 == bytes.fromhex("880100b4"):
            f.seek(0x442efb4)
            f.write(bytes.fromhex("0c000014"))
            print("    [+] Patched 0x442efb4: cbz -> b (bypass Halide Chroma denoiser kernel)")
        elif orig7 == bytes.fromhex("0c000014"):
            print("    [+] 0x442efb4 already patched.")

        # 8. 0x534f36c: cbz w9, #0x534f424 (c9 05 00 34) -> nop (1f 20 03 d5)
        # Forces Pecan neural RAW denoiser into PecanNoOpCopy mode (skips TPU/GPU neural network inference, copying raw sensor pixels directly)
        f.seek(0x534f36c)
        orig8 = f.read(4)
        if orig8 == bytes.fromhex("c9050034"):
            f.seek(0x534f36c)
            f.write(bytes.fromhex("1f2003d5"))
            print("    [+] Patched 0x534f36c: cbz -> nop (force PecanNoOpCopy)")
        elif orig8 == bytes.fromhex("1f2003d5"):
            print("    [+] 0x534f36c already patched.")

        # 9. 0x534f5f4: fmov s10, #1.00000000 (0a 10 2e 1e) -> fmov s10, wzr (ea 03 27 1e)
        # Sets Pecan residual_scaling_factor to 0.0f (no noise residual subtraction)
        f.seek(0x534f5f4)
        orig9 = f.read(4)
        if orig9 == bytes.fromhex("0a102e1e"):
            f.seek(0x534f5f4)
            f.write(bytes.fromhex("ea03271e"))
            print("    [+] Patched 0x534f5f4: fmov s10, #1.0 -> fmov s10, wzr (0.0f residual scaling)")
        elif orig9 == bytes.fromhex("ea03271e"):
            print("    [+] 0x534f5f4 already patched.")


def patch_msr_smali():
    print("[*] Patching msr.smali (Enabling native Tomte model in InitParams and Gcam creation, was mjy)...")
    msr_path = os.path.join(APKTOOL_DIR, "smali", "msr.smali")
    if not os.path.exists(msr_path):
        print("    [!] Warning: msr.smali not found.")
        return
    with open(msr_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    if-eqz v2, :cond_2c

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_2c"""

    replacement = """    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isGrainEnabled()Z

    move-result v12

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V"""

    if target in content:
        content = content.replace(target, replacement)
        print("    [+] mjy.smali: finish_tomte_grain_enabled set to TomteInitHelper.isGrainEnabled().")
    elif "const/4 v12, 0x1\n\n    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set" in content:
        content = content.replace("const/4 v12, 0x1\n\n    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set",
                                  "invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isGrainEnabled()Z\n\n    move-result v12\n\n    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set")
        print("    [+] mjy.smali: updated finish_tomte_grain_enabled to TomteInitHelper.isGrainEnabled().")

    gcam_create_target = """    :cond_2e
    new-instance v5, Lcom/google/googlex/gcam/Gcam;

    invoke-direct {v5, v0, v1}, Lcom/google/googlex/gcam/Gcam;-><init>(J)V

    :goto_17"""

    gcam_create_repl = """    :cond_2e
    new-instance v5, Lcom/google/googlex/gcam/Gcam;

    invoke-direct {v5, v0, v1}, Lcom/google/googlex/gcam/Gcam;-><init>(J)V

    invoke-static {v0, v1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->initTomteGrain(J)V

    :goto_17"""

    if gcam_create_target in content:
        content = content.replace(gcam_create_target, gcam_create_repl)
        print("    [+] mjy.smali: TomteInitHelper.initTomteGrain hooked on Gcam creation.")

    # Guard khw.c and khw.g in binned static metadata setup
    opt_cg_target = """    sget-object v7, Lkhw;->c:Lkpr;

    invoke-virtual {v6, v7}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sget-object v8, Lzoi;->o:Lzoi;

    goto :goto_5

    :cond_8
    const/high16 v8, 0x41200000    # 10.0f

    cmpl-float v7, v7, v8

    if-ltz v7, :cond_9

    sget-object v7, Lkhw;->g:Lkpr;

    invoke-virtual {v6, v7}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_cg_repl = """    sget-object v7, Lkhw;->c:Lkpr;

    invoke-virtual {v6, v7}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    const/16 v8, 0x5dc

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sget-object v8, Lzoi;->o:Lzoi;

    goto :goto_5

    :cond_8
    const/high16 v8, 0x41200000    # 10.0f

    cmpl-float v7, v7, v8

    if-ltz v7, :cond_9

    sget-object v7, Lkhw;->g:Lkpr;

    invoke-virtual {v6, v7}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    const/16 v8, 0x5e8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""
    if opt_cg_target in content:
        content = content.replace(opt_cg_target, opt_cg_repl)
        print("    [+] mjy.smali: khw.c and khw.g guarded with orElse().")

    # Guard khw.d and khw.e in binned static metadata setup
    opt_de_target = """    sget-object v7, Lkhw;->d:Lkpr;

    invoke-virtual {v6, v7}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v7, v7

    sget-object v8, Lkhw;->e:Lkpr;

    invoke-virtual {v6, v8}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/Integer;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Integer;->intValue()I

    move-result v28

    move/from16 v29, v12

    add-int v12, v28, v28

    move-object/from16 v28, v13

    new-instance v13, Lcom/google/googlex/gcam/PixelRect;

    invoke-direct {v13}, Lcom/google/googlex/gcam/PixelRect;-><init>()V

    move-object/from16 v30, v15

    const/4 v15, 0x0

    invoke-virtual {v13, v15}, Lcom/google/googlex/gcam/PixelRect;->i(I)V

    invoke-virtual {v13, v7}, Lcom/google/googlex/gcam/PixelRect;->j(I)V

    invoke-virtual {v13, v15}, Lcom/google/googlex/gcam/PixelRect;->k(I)V

    invoke-virtual {v13, v12}, Lcom/google/googlex/gcam/PixelRect;->l(I)V

    invoke-virtual {v5, v13}, Lcom/google/googlex/gcam/StaticMetadata;->i(Lcom/google/googlex/gcam/PixelRect;)V

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->t(I)V

    invoke-virtual {v5, v12}, Lcom/google/googlex/gcam/StaticMetadata;->s(I)V

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->m(I)V

    invoke-virtual {v5, v12}, Lcom/google/googlex/gcam/StaticMetadata;->l(I)V

    invoke-virtual {v6, v8}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_de_repl = """    sget-object v7, Lkhw;->d:Lkpr;

    invoke-virtual {v6, v7}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    const/16 v8, 0x7f0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v7, v7

    sget-object v8, Lkhw;->e:Lkpr;

    invoke-virtual {v6, v8}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v28

    const/16 v29, 0x600

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/Integer;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Integer;->intValue()I

    move-result v28

    move/from16 v29, v12

    add-int v12, v28, v28

    move-object/from16 v28, v13

    new-instance v13, Lcom/google/googlex/gcam/PixelRect;

    invoke-direct {v13}, Lcom/google/googlex/gcam/PixelRect;-><init>()V

    move-object/from16 v30, v15

    const/4 v15, 0x0

    invoke-virtual {v13, v15}, Lcom/google/googlex/gcam/PixelRect;->i(I)V

    invoke-virtual {v13, v7}, Lcom/google/googlex/gcam/PixelRect;->j(I)V

    invoke-virtual {v13, v15}, Lcom/google/googlex/gcam/PixelRect;->k(I)V

    invoke-virtual {v13, v12}, Lcom/google/googlex/gcam/PixelRect;->l(I)V

    invoke-virtual {v5, v13}, Lcom/google/googlex/gcam/StaticMetadata;->i(Lcom/google/googlex/gcam/PixelRect;)V

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->t(I)V

    invoke-virtual {v5, v12}, Lcom/google/googlex/gcam/StaticMetadata;->s(I)V

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->m(I)V

    invoke-virtual {v5, v12}, Lcom/google/googlex/gcam/StaticMetadata;->l(I)V

    invoke-virtual {v6, v8}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v7

    const/16 v8, 0x600

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""
    if opt_de_target in content:
        content = content.replace(opt_de_target, opt_de_repl)
        print("    [+] mjy.smali: khw.d and khw.e guarded with orElse().")

    # Guard khw.c Optional.get() in ultrawide check
    opt_c_target = """    if-ne v5, v1, :cond_c

    sget-object v5, Lkhw;->c:Lkpr;

    invoke-virtual {v6, v5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    goto :goto_9"""

    opt_c_repl = """    if-ne v5, v1, :cond_c

    sget-object v5, Lkhw;->c:Lkpr;

    invoke-virtual {v6, v5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    if-nez v7, :cond_c_c_has_val

    goto :cond_f

    :cond_c_c_has_val
    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    goto :goto_9"""
    if opt_c_target in content:
        content = content.replace(opt_c_target, opt_c_repl)
        print("    [+] mjy.smali: khw.c guarded with isPresent().")

    # Guard khw.e Optional.get() against NoSuchElementException on dual-camera devices (Pixel 10 base)
    opt_e_target = """    :cond_c
    sget-object v5, Lkhw;->e:Lkpr;

    invoke-virtual {v6, v5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_e_repl = """    :cond_c
    sget-object v5, Lkhw;->e:Lkpr;

    invoke-virtual {v6, v5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    if-nez v7, :cond_c_has_val

    goto :cond_f

    :cond_c_has_val
    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    if opt_e_target in content:
        content = content.replace(opt_e_target, opt_e_repl)
        print("    [+] mjy.smali: khw.e guarded with isPresent().")

    # Guard khw.d Optional.get()
    opt_d_target = """    sget-object v5, Lkhw;->d:Lkpr;

    invoke-virtual {v6, v5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_d_repl = """    sget-object v5, Lkhw;->d:Lkpr;

    invoke-virtual {v6, v5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    if-nez v7, :cond_d_has_val

    goto :cond_e

    :cond_d_has_val
    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    if opt_d_target in content:
        content = content.replace(opt_d_target, opt_d_repl)
        print("    [+] mjy.smali: khw.d guarded with isPresent().")

    # Guard SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION in msr.smali
    max_res_target = """    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v1}, Lvgr;->p(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->t(I)V

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->s(I)V

    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PRE_CORRECTION_ACTIVE_ARRAY_SIZE_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v7}, Lvgr;->p(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Rect;"""

    max_res_repl = """    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v1}, Lvgr;->n(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    if-nez v1, :cond_has_pixel_max

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v1}, Lvgr;->p(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    :cond_has_pixel_max
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->t(I)V

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->s(I)V

    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PRE_CORRECTION_ACTIVE_ARRAY_SIZE_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v7}, Lvgr;->n(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Rect;

    if-nez v7, :cond_has_pre_max

    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PRE_CORRECTION_ACTIVE_ARRAY_SIZE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v7}, Lvgr;->p(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Rect;

    :cond_has_pre_max"""

    if max_res_target in content:
        content = content.replace(max_res_target, max_res_repl)
        print("    [+] msr.smali: SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION guarded against missing keys.")
    elif "cond_has_pixel_max" in content:
        print("    [+] msr.smali: SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION already guarded.")

    with open(msr_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_psk_smali():
    print("[*] Patching psk.smali (Guard telephoto streams against NullPointerException)...")
    psk_path = os.path.join(APKTOOL_DIR, "smali", "psk.smali")
    if not os.path.exists(psk_path):
        print("    [!] Warning: psk.smali not found.")
        return
    with open(psk_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Null check for PD_TELE provider
    pd_target = """    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laeea;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;"""

    pd_repl = """    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laeea;

    if-eqz v0, :cond_8"""

    if pd_target in content:
        content = content.replace(pd_target, pd_repl)
        print("    [+] psk.smali: PD_TELE provider null check added.")

    # Null check for RAW_TELE provider
    raw_target = """    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laeea;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;"""

    raw_repl = """    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laeea;

    if-eqz v0, :cond_b"""

    if raw_target in content:
        content = content.replace(raw_target, raw_repl)
        print("    [+] psk.smali: RAW_TELE provider null check added.")

    with open(psk_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_psh_smali():
    print("[*] Patching psh.smali (Guard binned RAW stream dimensions with orElse fallbacks)...")
    psh_path = os.path.join(APKTOOL_DIR, "smali", "psh.smali")
    if not os.path.exists(psh_path):
        print("    [!] Warning: psh.smali not found.")
        return
    with open(psh_path, "r", encoding="utf-8") as f:
        content = f.read()

    target_psh = """    if-eqz p5, :cond_2

    sget-object p5, Lkhw;->f:Lkpr;

    invoke-virtual {p4, p5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p5

    invoke-virtual {p5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p5

    goto :goto_1

    :cond_2
    sget-object p5, Lkhw;->b:Lkpr;

    invoke-virtual {p4, p5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p5

    invoke-virtual {p5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p5

    :goto_1
    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p5

    invoke-virtual {v0, p3}, Lpsz;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    sget-object p3, Lkhw;->g:Lkpr;

    invoke-virtual {p4, p3}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p3

    invoke-virtual {p3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p3

    goto :goto_2

    :cond_3
    sget-object p3, Lkhw;->c:Lkpr;

    invoke-virtual {p4, p3}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p3

    invoke-virtual {p3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p3

    :goto_2
    check-cast p3, Ljava/lang/Integer;"""

    repl_psh = """    if-eqz p5, :cond_2

    sget-object p5, Lkhw;->f:Lkpr;

    invoke-virtual {p4, p5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p5

    const/16 v1, 0x7e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p5, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    goto :goto_1

    :cond_2
    sget-object p5, Lkhw;->b:Lkpr;

    invoke-virtual {p4, p5}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p5

    const/16 v1, 0x7e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p5, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    :goto_1
    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p5

    invoke-virtual {v0, p3}, Lpsz;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    sget-object p3, Lkhw;->g:Lkpr;

    invoke-virtual {p4, p3}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p3

    const/16 v1, 0x5e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_2

    :cond_3
    sget-object p3, Lkhw;->c:Lkpr;

    invoke-virtual {p4, p3}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object p3

    const/16 v1, 0x5e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    :goto_2
    check-cast p3, Ljava/lang/Integer;"""

    if target_psh in content:
        content = content.replace(target_psh, repl_psh)
        print("    [+] psh.smali: binned RAW dimensions guarded with orElse().")

    with open(psh_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_klh_smali():
    print("[*] Patching SpecialTypesProvider authority alignment (klh.smali / ksa.smali)...")
    for smali_name in ["klh.smali", "ksa.smali"]:
        for folder in ["smali", "smali_classes2"]:
            f_path = os.path.join(APKTOOL_DIR, folder, smali_name)
            if not os.path.exists(f_path):
                continue
            with open(f_path, "r", encoding="utf-8") as f:
                content = f.read()

            changed = False
            for old_auth in [
                "com.google.android.apps.camera.specialtypes.SpecialTypesProviderEng",
                "com.google.android.apps.camera.specialtypes.SpecialTypesProviderNext",
                "com.google.android.apps.camera.specialtypes.SpecialTypesProvider",
            ]:
                if old_auth in content:
                    content = content.replace(old_auth, "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider")
                    changed = True

            if changed:
                with open(f_path, "w", encoding="utf-8") as f:
                    f.write(content)
                print(f"    [+] {smali_name}: SpecialTypesProvider authority aligned to cloned package.")
            elif "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider" in content:
                print(f"    [+] {smali_name}: already patched.")

def patch_num_smali():
    print("[*] Patching num.smali (Guard telephoto portrait sensor against NPE)...")
    num_path = os.path.join(APKTOOL_DIR, "smali", "num.smali")
    if not os.path.exists(num_path):
        print("    [!] Warning: num.smali not found.")
        return
    with open(num_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    invoke-virtual {10}, Lssg;->e()Luus;

    move-result-object v0

    goto :goto_3"""

    replacement = """    invoke-virtual {10}, Lssg;->e()Luus;

    move-result-object v0

    if-eqz v0, :cond_6

    goto :goto_3"""

    if target in content:
        content = content.replace(target, replacement)
        with open(num_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] num.smali: guarded ssg.e() against null to prevent non-Pro / dual-cam portrait NPE.")
    elif "if-eqz v0, :cond_6" in content:
        print("    [+] num.smali: already patched.")
    else:
        print("    [!] Warning: num.smali target block not found.")

def patch_tba_smali():
    print("[*] Patching tba.smali (Guard Centaur / Boba Jelly Optional.get() against NoSuchElementException)...")
    tba_path = os.path.join(APKTOOL_DIR, "smali", "tba.smali")
    if not os.path.exists(tba_path):
        print("    [!] Warning: tba.smali not found.")
        return
    with open(tba_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Increase locals from 1 to 2
    content = content.replace(".method public constructor <init>(Lksf;)V\n    .locals 1",
                              ".method public constructor <init>(Lksf;)V\n    .locals 2")

    # Guard klf.f
    target_f = """    sget-object v0, Lklf;->f:Lkps;

    invoke-virtual {p1, v0}, Lksf;->r(Lkps;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_f = """    sget-object v0, Lklf;->f:Lkps;

    invoke-virtual {p1, v0}, Lksf;->r(Lkps;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    # Guard klf.g
    target_g = """    sget-object v0, Lklf;->g:Lkps;

    invoke-virtual {p1, v0}, Lksf;->r(Lkps;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_g = """    sget-object v0, Lklf;->g:Lkps;

    invoke-virtual {p1, v0}, Lksf;->r(Lkps;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    # Guard klf.e
    target_e = """    sget-object v0, Lklf;->e:Lkps;

    invoke-virtual {p1, v0}, Lksf;->r(Lkps;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_e = """    sget-object v0, Lklf;->e:Lkps;

    invoke-virtual {p1, v0}, Lksf;->r(Lkps;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    # Guard klf.b
    target_b = """    sget-object v0, Lklf;->b:Lkpr;

    invoke-virtual {p1, v0}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_b = """    sget-object v0, Lklf;->b:Lkpr;

    invoke-virtual {p1, v0}, Lksf;->a(Lkpr;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    changed = False
    for t, r in [(target_f, repl_f), (target_g, repl_g), (target_e, repl_e), (target_b, repl_b)]:
        if t in content:
            content = content.replace(t, r)
            changed = True

    if changed:
        with open(tba_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] tba.smali: guarded Centaur/Boba Jelly Optional.get() calls with orElse().")
    elif "orElse(Ljava/lang/Object;)" in content:
        print("    [+] tba.smali: already guarded.")
    else:
        print("    [!] Warning: tba.smali targets not found.")

def patch_pzs_smali():
    print("[*] Patching pzs.smali (Force Sauce overlay instantiation)...")
    pzs_path = os.path.join(APKTOOL_DIR, "smali", "pzs.smali")
    if not os.path.exists(pzs_path):
        print("    [!] Warning: pzs.smali not found.")
        return
    with open(pzs_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    check-cast p0, Lqnw;

    invoke-virtual {p0}, Lqnw;->b()Lqnv;

    move-result-object p0

    return-object p0

    :cond_3
    sget-object p0, Lspg;->s:Lspg;

    return-object p0"""

    replacement = """    check-cast p0, Lqnw;

    invoke-virtual {p0}, Lqnw;->b()Lqnv;

    move-result-object p0

    return-object p0"""

    if target in content:
        content = content.replace(target, replacement)
        with open(pzs_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] pzs.smali patched: Sauce overlay always instantiated.")
    else:
        print("    [!] Warning: pzs.smali target not found.")

def patch_qko_smali():
    print("[*] Patching qko.smali (Sauce Eligibility Predicate, was qau)...")
    qko_path = os.path.join(APKTOOL_DIR, "smali", "qko.smali")
    if not os.path.exists(qko_path):
        print("    [!] Warning: qko.smali not found.")
        return
    with open(qko_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    sget-object v0, Lkqi;->aW:Lkps;

    invoke-virtual {p0, v0}, Lksf;->q(Lkps;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lkqi;->aV:Lkps;

    invoke-virtual {p0, v0}, Lksf;->q(Lkps;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0"""

    replacement = """    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0"""

    if target in content:
        content = content.replace(target, replacement)
        with open(qko_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qko.smali patched: predicate unconditionally returns Boolean.TRUE.")
    elif "const/4 v2, 0x1\n\n    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;" in content:
        print("    [+] qko.smali: already patched with Boolean.TRUE.")
    else:
        print("    [!] Warning: Exact target block not found in qko.smali, skipping replacement.")

def patch_camera_app_smali():
    print("[*] Patching CameraApp.smali (Saving static context for TomteInitHelper)...")
    camera_app_path = os.path.join(APKTOOL_DIR, "smali", "com", "google", "android", "apps", "camera", "app", "CameraApp.smali")
    with open(camera_app_path, "r", encoding="utf-8") as f:
        content = f.read()

    # In 11.1, gA() is removed — DI component accessed via i()Litb; directly.
    # We only need:
    #   1. Add sAppContext static field
    #   2. Hook onCreate to save sAppContext

    # Add sAppContext field if missing
    if ".field public static sAppContext:Landroid/content/Context;" not in content:
        f_target = ".field private static final q:Ljava/util/concurrent/atomic/AtomicBoolean;"
        content = content.replace(f_target, f_target + "\n\n.field public static sAppContext:Landroid/content/Context;")

    # Hook onCreate to save sAppContext (locals 20 in 11.1)
    on_create_target = ".method public final onCreate()V\n    .locals 20\n\n    move-object/from16 v0, p0"
    on_create_repl = ".method public final onCreate()V\n    .locals 20\n\n    sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;\n\n    invoke-static/range {p0 .. p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setContext(Landroid/content/Context;)V\n\n    move-object/from16 v0, p0"
    if on_create_target in content:
        content = content.replace(on_create_target, on_create_repl)
    elif "TomteInitHelper;->setContext" not in content and "sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext" in content:
        content = content.replace("sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;", "sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;\n\n    invoke-static/range {p0 .. p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setContext(Landroid/content/Context;)V")

    with open(camera_app_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] CameraApp.smali patched successfully.")

def inject_tomte_init_helper():
    print("[*] Injecting TomteInitHelper and ProSettingsPanel...")
    helper_src = os.path.join(ROOT_DIR, "smali_patches", "TomteInitHelper.smali")
    if not os.path.exists(helper_src):
        helper_src = os.path.join(ROOT_DIR, "scratch", "smali_out", "smali", "com", "google", "android", "patch", "cameralooks", "TomteInitHelper.smali")
    helper_dst_dir = os.path.join(APKTOOL_DIR, "smali_classes4", "com", "google", "android", "patch", "cameralooks")
    os.makedirs(helper_dst_dir, exist_ok=True)
    helper_dst = os.path.join(helper_dst_dir, "TomteInitHelper.smali")
    if os.path.exists(helper_src):
        shutil.copyfile(helper_src, helper_dst)
        print(f"    [+] Injected {helper_dst}")
    else:
        print(f"    [!] Warning: {helper_src} not found!")

    import glob
    for smali_file in glob.glob(os.path.join(ROOT_DIR, "smali_patches", "TomteProSettingsPanel*.smali")):
        dst = os.path.join(helper_dst_dir, os.path.basename(smali_file))
        shutil.copyfile(smali_file, dst)
        print(f"    [+] Injected {os.path.basename(smali_file)}")

def patch_mkm_smali():
    print("[*] Patching mkm.smali (Make Flare Removal a safe no-op to prevent FinishShot crashes)...")
    mkm_path = os.path.join(APKTOOL_DIR, "smali", "mkm.smali")
    if not os.path.exists(mkm_path):
        return
    with open(mkm_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """.method private final j(Lmnz;Loui;)V
    .locals 18

    move-object/from16 v0, p0"""

    replacement = """.method private final j(Lmnz;Loui;)V
    .locals 18

    return-void

    move-object/from16 v0, p0"""

    if target in content:
        content = content.replace(target, replacement)
        with open(mkm_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] mkm.smali: Added return-void to mkm.j.")
    elif "return-void" in content[content.find(".method private final j("):content.find(".method private final j(")+120]:
        print("    [+] mkm.smali: already patched with return-void.")
    else:
        print("    [!] Warning: mkm.smali target not found.")

def patch_ejn_smali():
    print("[*] Patching ejn.smali (Disable ceftazidime flags and remove missing asset paths on Pixel 10)...")
    ejn_path = os.path.join(APKTOOL_DIR, "smali", "ejn.smali")
    if not os.path.exists(ejn_path):
        return
    with open(ejn_path, "r", encoding="utf-8") as f:
        content = f.read()

    content = content.replace("ceftazidime_035838eb4ec74fd1ba1dc562d3250bcb.uncompressed", "")
    content = content.replace("ceftazidime_98a4b0297dce495183ba5c126c51eb6b.uncompressed", "")
    content = content.replace("ceftazidime_e32cd107e5b1428b964fff0bedbab700.uncompressed", "")
    with open(ejn_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] ejn.smali: removed missing ceftazidime models.")

def patch_qur_smali():
    print("[*] Patching qur.smali (Force real qxb Look Manager, was qkp)...")
    qur_path = os.path.join(APKTOOL_DIR, "smali", "qur.smali")
    if not os.path.exists(qur_path):
        print("    [!] Warning: qur.smali not found.")
        return
    with open(qur_path, "r", encoding="utf-8") as f:
        content = f.read()

    b_start = content.find(".method public final b()Lqxb;")
    if b_start != -1:
        b_end = content.find(".end method", b_start) + len(".end method")
        new_b = """.method public final b()Lqxb;
    .locals 1

    iget-object p0, p0, Lqur;->b:Lacnw;

    invoke-interface {p0}, Lacnw;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqxb;

    return-object p0
.end method"""
        content = content[:b_start] + new_b + content[b_end:]
        with open(qur_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qur.smali: b() returns real qxb Look Manager unconditionally.")

def patch_qus_smali():
    print("[*] Patching qus.smali (Force real qwj Look State Provider, was qkq)...")
    qus_path = os.path.join(APKTOOL_DIR, "smali", "qus.smali")
    if not os.path.exists(qus_path):
        print("    [!] Warning: qus.smali not found.")
        return
    with open(qus_path, "r", encoding="utf-8") as f:
        content = f.read()

    b_start = content.find(".method public final b()Lqwj;")
    if b_start != -1:
        b_end = content.find(".end method", b_start) + len(".end method")
        new_b = """.method public final b()Lqwj;
    .locals 1

    iget-object p0, p0, Lqus;->b:Lacnw;

    invoke-interface {p0}, Lacnw;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqwj;

    return-object p0
.end method"""
        content = content[:b_start] + new_b + content[b_end:]
        with open(qus_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qus.smali: b() returns real qwj Look State Provider unconditionally.")

def patch_qxg_smali():
    print("[*] Patching qxg.smali (Notifying TomteInitHelper and unlocking all 13 Looks)...")
    qxg_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qxg.smali")
    if not os.path.exists(qxg_path):
        print("    [!] Warning: qxg.smali not found.")
        return
    with open(qxg_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Unlock all 9 Presets (Editorial, Velvet, Classic, Digi, Black Tie, Minimal, Flat, Buffalo, Dijon)
    preset_nine_builder = """    new-instance p2, Ladpp;

    const/16 p4, 0x10

    invoke-direct {p2, p4}, Ladpp;-><init>(I)V

    sget-object p4, Lquz;->a:Lquz;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqvh;->a:Lqvh;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqve;->a:Lqve;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lquy;->a:Lquy;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lquw;->a:Lquw;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqva;->a:Lqva;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqvd;->a:Lqvd;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqvg;->a:Lqvg;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqvi;->a:Lqvi;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lkqi;->a:Lkpr;

    invoke-virtual {p2}, Ladpp;->f()Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lqxg;->h:Ljava/util/List;"""

    old_bad_replacement = """    invoke-static {}, Lqtk;->h()Lyqc;

    move-result-object p2

    iput-object p2, p0, Lqxg;->h:Ljava/util/List;"""

    preset_target = """    new-instance p2, Ladpp;

    const/16 p4, 0xa

    invoke-direct {p2, p4}, Ladpp;-><init>(I)V

    sget-object p4, Lquz;->a:Lquz;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqvh;->a:Lqvh;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqve;->a:Lqve;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lquy;->a:Lquy;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lquw;->a:Lquw;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lqva;->a:Lqva;

    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p4, Lkqi;->a:Lkpr;

    invoke-virtual {p2}, Ladpp;->f()Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lqxg;->h:Ljava/util/List;"""

    if old_bad_replacement in content:
        content = content.replace(old_bad_replacement, preset_nine_builder)
        print("    [+] qxg.smali: replaced erroneous qtk.h() with full 9-preset builder.")
    elif preset_target in content:
        content = content.replace(preset_target, preset_nine_builder)
        print("    [+] qxg.smali: unlocked all 9 Looks presets (including Flat, Buffalo, Dijon).")
    elif "sget-object p4, Lqvd;->a:Lqvd;" in content:
        print("    [+] qxg.smali: already unlocked with all 9 Looks presets.")

    # 2. Force j(Ltbp;)Z and k(Ltbp;)Z to always return 1 so Looks styles and presets are always active
    j_target = """.method private static final j(Ltbp;)Z
    .locals 2

    sget-object v0, Ltbp;->a:Ltbp;

    invoke-virtual {p0}, Ltbp;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 v1, 0x6

    if-eq p0, v1, :cond_0

    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    const/16 v1, 0x13

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    :cond_0
    :pswitch_0
    return v0

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method"""

    j_replacement = """.method private static final j(Ltbp;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""

    if j_target in content:
        content = content.replace(j_target, j_replacement)
        print("    [+] qxg.smali: patched j(Ltbp;)Z to return 1 unconditionally.")

    k_target = """.method private static final k(Ltbp;)Z
    .locals 2

    invoke-static {p0}, Lqxg;->j(Ltbp;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Ltbp;->a:Ltbp;

    invoke-virtual {p0}, Ltbp;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 v1, 0x6

    if-eq p0, v1, :cond_0

    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    goto :goto_0

    :cond_0
    :pswitch_0
    return v0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method"""

    k_replacement = """.method private static final k(Ltbp;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""

    if k_target in content:
        content = content.replace(k_target, k_replacement)
        print("    [+] qxg.smali: patched k(Ltbp;)Z to return 1 unconditionally.")

    # 3. Notify TomteInitHelper on Look change
    target = """.method private final g(Lqvj;)V
    .locals 2

    iget v0, p1, Lqvj;->d:I"""

    replacement = """.method private final g(Lqvj;)V
    .locals 2

    if-eqz p1, :cond_skip_notify

    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqvj;)V

    :cond_skip_notify
    iget v0, p1, Lqvj;->d:I"""

    if target in content:
        content = content.replace(target, replacement)
        print("    [+] qxg.smali: TomteInitHelper.onLookObjectSelected notified on look change.")
    elif "onLookObjectSelected" in content:
        print("    [+] qxg.smali: already patched with onLookObjectSelected.")
    else:
        print("    [!] Warning: target in qxg.smali not found or already patched.")

    with open(qxg_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_rfx_smali():
    print("[*] Patching rfx.smali (Sauce EXIF metadata fallback via TomteInitHelper, was qkj)...")
    rfx_path = os.path.join(APKTOOL_DIR, "smali", "rfx.smali")
    if not os.path.exists(rfx_path):
        return
    with open(rfx_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    :goto_4
    sget-object v12, Lcau;->c:Lcau;"""

    replacement = """    :goto_4
    invoke-static {v11}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookOrFallback(Lqvj;)Lqvj;

    move-result-object v11

    sget-object v12, Lcau;->c:Lcau;"""

    if target in content:
        content = content.replace(target, replacement, 1)
        with open(rfx_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] rfx.smali: Added TomteInitHelper fallback to Sauce EXIF builder.")
    elif "getEffectiveLookOrFallback" in content:
        print("    [+] rfx.smali: already patched with TomteInitHelper fallback.")
    else:
        print("    [!] Warning: rfx.smali target not found.")

def patch_mia_smali():
    print("[*] Patching mia.smali (Force TomteGrain#initialize at app startup)...")
    mia_path = os.path.join(APKTOOL_DIR, "smali", "mia.smali")
    if not os.path.exists(mia_path):
        print("    [!] Warning: mia.smali not found, skipping.")
        return
    with open(mia_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    iget-boolean v0, p0, Lmia;->f:Z

    if-nez v0, :cond_0

    goto/16 :goto_4

    :cond_0"""

    replacement = """    const-string v0, "PATCH_LOOKS"

    const-string v1, "mia.run: Unconditionally initializing TomteGrain..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0"""

    if target in content:
        content = content.replace(target, replacement)
        with open(mia_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] mia.smali patched: TomteGrain initializes unconditionally.")
    else:
        print("    [!] Warning: mia.smali target not found.")

def patch_ndf_smali():
    print("[*] Patching ndf.smali (Force TomteImageFinalizer and ensure TomteGrain initialized, was muh)...")
    ndf_path = os.path.join(APKTOOL_DIR, "smali", "ndf.smali")
    if not os.path.exists(ndf_path):
        print("    [!] Warning: ndf.smali not found, skipping.")
        return
    with open(ndf_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Hook initTomteGrain before applyTomteImageFinalizer
    finalizer_call_target = """    invoke-static {p0}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v3

    invoke-static {p1}, Lcom/google/googlex/gcam/InterleavedWriteViewU8;->a(Lcom/google/googlex/gcam/InterleavedWriteViewU8;)J"""

    finalizer_call_repl = """    invoke-static {p0}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->initTomteGrain(J)V

    invoke-static {p1}, Lcom/google/googlex/gcam/InterleavedWriteViewU8;->a(Lcom/google/googlex/gcam/InterleavedWriteViewU8;)J"""

    if finalizer_call_target in content:
        content = content.replace(finalizer_call_target, finalizer_call_repl)
        with open(ndf_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] ndf.smali: TomteInitHelper.initTomteGrain hooked before applyTomteImageFinalizer.")

def patch_jex_smali():
    print("[*] Patching jex.smali (Bypass catshark check to provide selected Look to Lost.p, was ioy)...")
    jex_path = os.path.join(APKTOOL_DIR, "smali_classes2", "jex.smali")
    if not os.path.exists(jex_path):
        print("    [!] Warning: jex.smali not found, skipping.")
        return
    with open(jex_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Case 14 (:pswitch_5 - Night Sight mode)
    target_5 = """    :pswitch_5
    iget-object v0, p0, Ljex;->a:Lacnw;

    invoke-interface {v0}, Lacnw;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lizk;

    sget-object v1, Ltbp;->g:Ltbp;

    invoke-virtual {v0, v1}, Lizk;->a(Ltbp;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object p0, p0, Ljex;->b:Lacnw;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_a
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0"""

    replacement_5 = """    :pswitch_5
    iget-object p0, p0, Ljex;->b:Lacnw;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0"""

    # Case 13 (:pswitch_6 - 12MP Photo mode)
    target_6 = """    :pswitch_6
    iget-object v0, p0, Ljex;->a:Lacnw;

    invoke-interface {v0}, Lacnw;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lizk;

    sget-object v1, Ltbp;->b:Ltbp;

    invoke-virtual {v0, v1}, Lizk;->a(Ltbp;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object p0, p0, Ljex;->b:Lacnw;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0"""

    replacement_6 = """    :pswitch_6
    iget-object p0, p0, Ljex;->b:Lacnw;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0"""

    # Case 12 (:pswitch_7 - Portrait / Other mode)
    target_7 = """    :pswitch_7
    iget-object v0, p0, Ljex;->a:Lacnw;

    invoke-interface {v0}, Lacnw;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lizk;

    iget-boolean v0, v0, Lizk;->a:Z

    if-eqz v0, :cond_c

    iget-object p0, p0, Ljex;->b:Lacnw;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_c
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0"""

    replacement_7 = """    :pswitch_7
    iget-object p0, p0, Ljex;->b:Lacnw;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0"""

    patched = False
    if target_5 in content:
        content = content.replace(target_5, replacement_5)
        patched = True
    if target_6 in content:
        content = content.replace(target_6, replacement_6)
        patched = True
    if target_7 in content:
        content = content.replace(target_7, replacement_7)
        patched = True

    with open(jex_path, "w", encoding="utf-8") as f:
        f.write(content)
    if patched or (replacement_5 in content and replacement_6 in content and replacement_7 in content):
        print("    [+] jex.smali patched: selected look always provided to Lost.p for Photo (12MP), Night Sight, and Portrait.")
    else:
        print("    [!] Warning: jex.smali targets not found.")

def patch_mtt_smali():
    print("[*] Patching mtt.smali (Applying effective Look ID to ShotParams_tomte_type, was mla)...")
    mtt_path = os.path.join(APKTOOL_DIR, "smali", "mtt.smali")
    if not os.path.exists(mtt_path):
        print("    [!] Warning: mtt.smali not found.")
        return
    with open(mtt_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Hook ShotParams_tomte_type_set with effective look ID
    target_tomte_set = """    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v15

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v15}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_tomte_type_set(JLcom/google/googlex/gcam/ShotParams;I)V"""

    repl_tomte_set = """    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v15

    invoke-static {v15}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I

    move-result v15

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v15}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_tomte_type_set(JLcom/google/googlex/gcam/ShotParams;I)V"""

    if target_tomte_set in content:
        content = content.replace(target_tomte_set, repl_tomte_set, 1)

    # Hook TomteMetadata with effective look ID
    target_metadata = """    check-cast v9, Lqvj;

    iget v10, v9, Lqvj;->d:I

    new-instance v11, Lqwk;"""

    repl_metadata = """    check-cast v9, Lqvj;

    iget v10, v9, Lqvj;->d:I

    invoke-static {v10}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I

    move-result v10

    new-instance v11, Lqwk;"""

    if target_metadata in content:
        content = content.replace(target_metadata, repl_metadata, 1)

    # Hook Pecan ML Denoiser in ShotParams
    pecan_target = """    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-boolean v3, v2, Lmvg;->b:Z

    invoke-static {v10, v11, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_force_pecan_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-object v2, v2, Lmvg;->a:Laaaa;

    iget v2, v2, Laaaa;->h:I

    invoke-static {v10, v11, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_pecan_model_type_set(JLcom/google/googlex/gcam/ShotParams;I)V"""

    pecan_repl = """    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-boolean v3, v2, Lmvg;->b:Z

    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterPecanForce(Z)Z

    move-result v3

    invoke-static {v10, v11, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_force_pecan_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-object v2, v2, Lmvg;->a:Laaaa;

    iget v2, v2, Laaaa;->h:I

    invoke-static {v2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterPecanModelType(I)I

    move-result v2

    invoke-static {v10, v11, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_pecan_model_type_set(JLcom/google/googlex/gcam/ShotParams;I)V"""

    if pecan_target in content:
        content = content.replace(pecan_target, pecan_repl, 1)
        print("    [+] mtt.smali: ShotParams Pecan ML denoiser hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterPecanForce" in content:
        print("    [+] mtt.smali: ShotParams Pecan ML denoiser already hooked.")

    # Hook Sky Denoise Strengthener in ShotParams
    sky_target = """    iget-wide v11, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v11, v12, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_strengthen_denoise_for_sky_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    sky_repl = """    iget-wide v11, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v10}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterSkyDenoise(Z)Z

    move-result v10

    invoke-static {v11, v12, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_strengthen_denoise_for_sky_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    if sky_target in content:
        content = content.replace(sky_target, sky_repl, 1)
        print("    [+] mtt.smali: ShotParams Sky denoise strengthener hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterSkyDenoise" in content:
        print("    [+] mtt.smali: ShotParams Sky denoise strengthener already hooked.")

    # Hook Chess in ShotParams
    chess_target = """    iget-wide v3, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v3, v4, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_chess_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    chess_repl = """    iget-wide v3, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterChessEnabled(Z)Z

    move-result v2

    invoke-static {v3, v4, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_chess_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    if chess_target in content:
        content = content.replace(chess_target, chess_repl, 1)
        print("    [+] mtt.smali: ShotParams Chess denoiser hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterChessEnabled" in content:
        print("    [+] mtt.smali: ShotParams Chess denoiser already hooked.")

    with open(mtt_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] mtt.smali patched: getEffectiveLookId & denoiser filters hooked.")


def patch_pyp_smali():
    print("[*] Patching pyp.smali (ShotParams Walnut, Chess, Edamame, Almond, and Mochi ML models)...")
    pyp_path = os.path.join(APKTOOL_DIR, "smali", "pyp.smali")
    if not os.path.exists(pyp_path):
        print("    [!] Warning: pyp.smali not found.")
        return
    with open(pyp_path, "r", encoding="utf-8") as f:
        content = f.read()

    walnut_target = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_walnut_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    walnut_repl = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterWalnutEnabled(Z)Z

    move-result v3

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_walnut_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    walnut_opt_target = """    iget-wide v7, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget v6, v6, Laaam;->c:I

    invoke-static {v7, v8, v1, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_walnut_option_set(JLcom/google/googlex/gcam/ShotParams;I)V"""

    walnut_opt_repl = """    iget-wide v7, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget v6, v6, Laaam;->c:I

    invoke-static {v6}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterWalnutOption(I)I

    move-result v6

    invoke-static {v7, v8, v1, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_walnut_option_set(JLcom/google/googlex/gcam/ShotParams;I)V"""

    chess_force_target = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_force_chess_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    chess_force_repl = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterChessEnabled(Z)Z

    move-result v3

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_force_chess_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    edamame_target = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_bento_edamame_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v5}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_bento_edamame_force_apply_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    edamame_repl = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterEdamameEnabled(Z)Z

    move-result v3

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_bento_edamame_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v5}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterEdamameEnabled(Z)Z

    move-result v5

    invoke-static {v6, v7, v1, v5}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_bento_edamame_force_apply_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    almond_target = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_almond_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v5}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_almond_force_apply_limited_by_times_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    almond_repl = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterAlmondEnabled(Z)Z

    move-result v3

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_almond_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v5}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterAlmondEnabled(Z)Z

    move-result v5

    invoke-static {v6, v7, v1, v5}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_almond_force_apply_limited_by_times_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    mochi_target = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_mochi_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v6, v7, v1, v5}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_mochi_force_apply_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    mochi_repl = """    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterMochiEnabled(Z)Z

    move-result v3

    invoke-static {v6, v7, v1, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_mochi_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v6, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v5}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterMochiEnabled(Z)Z

    move-result v5

    invoke-static {v6, v7, v1, v5}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_mochi_force_apply_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    modified = False
    if walnut_target in content:
        content = content.replace(walnut_target, walnut_repl, 1)
        modified = True
        print("    [+] pyp.smali: Walnut ML denoiser hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterWalnutEnabled" in content:
        print("    [+] pyp.smali: Walnut ML denoiser already hooked.")

    if walnut_opt_target in content:
        content = content.replace(walnut_opt_target, walnut_opt_repl, 1)
        modified = True
        print("    [+] pyp.smali: Walnut option hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterWalnutOption" in content:
        print("    [+] pyp.smali: Walnut option already hooked.")

    if chess_force_target in content:
        content = content.replace(chess_force_target, chess_force_repl, 1)
        modified = True
        print("    [+] pyp.smali: Force Chess denoiser hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterChessEnabled" in content:
        print("    [+] pyp.smali: Force Chess denoiser already hooked.")

    if edamame_target in content:
        content = content.replace(edamame_target, edamame_repl, 1)
        modified = True
        print("    [+] pyp.smali: Bento Edamame hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterEdamameEnabled" in content:
        print("    [+] pyp.smali: Bento Edamame already hooked.")

    if almond_target in content:
        content = content.replace(almond_target, almond_repl, 1)
        modified = True
        print("    [+] pyp.smali: Almond texture filter hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterAlmondEnabled" in content:
        print("    [+] pyp.smali: Almond texture filter already hooked.")

    if mochi_target in content:
        content = content.replace(mochi_target, mochi_repl, 1)
        modified = True
        print("    [+] pyp.smali: Mochi filter hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterMochiEnabled" in content:
        print("    [+] pyp.smali: Mochi filter already hooked.")

    dng_target = """    const/4 v4, 0x1

    invoke-static {v2, v3, v1, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_compress_merged_dng_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    dng_repl = """    const/4 v4, 0x1

    invoke-static {v4}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterCompressDng(Z)Z

    move-result v4

    invoke-static {v2, v3, v1, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_compress_merged_dng_set(JLcom/google/googlex/gcam/ShotParams;Z)V"""

    if dng_target in content:
        content = content.replace(dng_target, dng_repl, 1)
        modified = True
        print("    [+] pyp.smali: ShotParams compress_merged_dng hooked to TomteInitHelper.")
    elif "TomteInitHelper;->filterCompressDng" in content:
        print("    [+] pyp.smali: ShotParams compress_merged_dng already hooked.")

    if modified:
        with open(pyp_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] pyp.smali patched successfully.")

def patch_rdb_smali():
    print("[*] Patching rdb.smali (Enforce stock 12MP resolution downgrade)...")
    rdb_path = os.path.join(APKTOOL_DIR, "smali", "rdb.smali")
    if not os.path.exists(rdb_path):
        print("    [!] Warning: rdb.smali not found.")
        return
    with open(rdb_path, "r", encoding="utf-8") as f:
        content = f.read()

    stock_c = """.method public static C(Lusf;Lppk;)V
    .locals 1

    sget-object v0, Lppp;->ax:Lppp;

    invoke-interface {p0, v0}, Lusf;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    sget-object v0, Lpph;->m:Lpph;

    invoke-interface {p1, p0, v0}, Lppk;->q(ZLpph;)V

    return-void
.end method"""

    # Gated C: on Pro devices, do not force reset to 12MP
    target_c = """.method public static C(Lusf;Lppk;)V
    .locals 1

    sget-object v0, Lppp;->ax:Lppp;

    invoke-interface {p0, v0}, Lusf;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    sget-object v0, Lpph;->m:Lpph;

    invoke-interface {p1, p0, v0}, Lppk;->q(ZLpph;)V

    return-void
.end method"""

    nop_c = """.method public static C(Lusf;Lppk;)V
    .locals 0

    return-void
.end method"""

    repl_c = """.method public static C(Lusf;Lppk;)V
    .locals 1

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z

    move-result v0

    if-eqz v0, :cond_non_pro

    return-void

    :cond_non_pro
    sget-object v0, Lppp;->ax:Lppp;

    invoke-interface {p0, v0}, Lusf;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    sget-object v0, Lpph;->m:Lpph;

    invoke-interface {p1, p0, v0}, Lppk;->q(ZLpph;)V

    return-void
.end method"""

    if target_c in content:
        content = content.replace(target_c, repl_c)
    elif nop_c in content:
        content = content.replace(nop_c, repl_c)

    target_d = """.method public static D(ZLusf;Lppk;Lnhz;Lyia;)V
    .locals 1

    if-nez p0, :cond_0

    invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lppp;

    sget-object v0, Lppp;->ay:Lppp;

    invoke-virtual {p0, v0}, Lppp;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {p1, p2}, Lrdb;->C(Lusf;Lppk;)V

    check-cast p4, Lyig;

    iget-object p0, p4, Lyig;->a:Ljava/lang/Object;

    check-cast p0, Lnib;

    invoke-virtual {p3, p0}, Lnhz;->a(Lnib;)Luww;

    :cond_0
    return-void
.end method"""

    nop_d = """.method public static D(ZLusf;Lppk;Lnhz;Lyia;)V
    .locals 0

    return-void
.end method"""

    repl_d = """.method public static D(ZLusf;Lppk;Lnhz;Lyia;)V
    .locals 1

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z

    move-result v0

    if-eqz v0, :cond_non_pro

    return-void

    :cond_non_pro
    if-nez p0, :cond_0

    invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lppp;

    sget-object v0, Lppp;->ay:Lppp;

    invoke-virtual {p0, v0}, Lppp;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {p1, p2}, Lrdb;->C(Lusf;Lppk;)V

    check-cast p4, Lyig;

    iget-object p0, p4, Lyig;->a:Ljava/lang/Object;

    check-cast p0, Lnib;

    invoke-virtual {p3, p0}, Lnhz;->a(Lnib;)Luww;

    :cond_0
    return-void
.end method"""

    if target_d in content:
        content = content.replace(target_d, repl_d)
    elif nop_d in content:
        content = content.replace(nop_d, repl_d)

    with open(rdb_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] rdb.smali: C() and D() gated via isProDevice().")

def patch_ons_smali():
    print("[*] Patching ons.smali (50MP CAPTURE_RESOLUTION visibility based on Pro device)...")
    ons_path = os.path.join(APKTOOL_DIR, "smali", "ons.smali")
    if not os.path.exists(ons_path):
        print("    [!] Warning: ons.smali not found.")
        return
    with open(ons_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    iget-object p0, p0, Looa;->j:Lppk;

    const/4 v0, 0x1

    sget-object v1, Lpph;->m:Lpph;

    invoke-interface {p0, v0, v1}, Lppk;->q(ZLpph;)V"""

    target_v0 = """    iget-object p0, p0, Looa;->j:Lppk;

    const/4 v0, 0x0

    sget-object v1, Lpph;->m:Lpph;

    invoke-interface {p0, v0, v1}, Lppk;->q(ZLpph;)V"""

    repl = """    iget-object p0, p0, Looa;->j:Lppk;

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z

    move-result v0

    sget-object v1, Lpph;->m:Lpph;

    invoke-interface {p0, v0, v1}, Lppk;->q(ZLpph;)V"""

    if repl in content:
        print("    [+] ons.smali: already uses isProDevice().")
    elif target in content:
        content = content.replace(target, repl)
        with open(ons_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] ons.smali: e() patched to use isProDevice() for CAPTURE_RESOLUTION.")
    elif target_v0 in content:
        content = content.replace(target_v0, repl)
        with open(ons_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] ons.smali: e() patched from v0=0 to isProDevice().")

def patch_moo_smali():
    print("[*] Patching moo.smali (Resolution 12MP/50MP row shown on Pro devices, hidden on non-Pro)...")
    moo_path = os.path.join(APKTOOL_DIR, "smali", "moo.smali")
    if not os.path.exists(moo_path):
        print("    [!] Warning: moo.smali not found.")
        return
    with open(moo_path, "r", encoding="utf-8") as f:
        content = f.read()

    target_stock = """    if-nez v8, :cond_0

    sget-object v0, Lyuq;->a:Lyuq;

    goto/16 :goto_0

    :cond_0"""

    target_patched = """    sget-object v0, Lyuq;->a:Lyuq;

    goto/16 :goto_0

    :cond_0"""

    repl = """    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isProDevice()Z

    move-result v8

    if-nez v8, :cond_0

    sget-object v0, Lyuq;->a:Lyuq;

    goto/16 :goto_0

    :cond_0"""

    if repl in content:
        print("    [+] moo.smali: Resolution row already uses isProDevice().")
    elif target_stock in content:
        content = content.replace(target_stock, repl, 1)
        with open(moo_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] moo.smali: Resolution row conditionally gated via isProDevice().")
    elif target_patched in content:
        content = content.replace(target_patched, repl, 1)
        with open(moo_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] moo.smali: Resolution row restored for Pro devices via isProDevice().")
    else:
        print("    [!] Warning: moo.smali target not found.")

def patch_poy_smali():
    print("[*] Patching poy.smali (Inject TomteProSettingsPanel in bottomsheet M(I))...")
    poy_path = os.path.join(APKTOOL_DIR, "smali", "poy.smali")
    if not os.path.exists(poy_path):
        print("    [!] Warning: poy.smali not found.")
        return
    with open(poy_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """.method public final M(I)V
    .locals 3

    iget-object v0, p0, Lpoy;->B:Lusf;"""
    replacement = """.method public final M(I)V
    .locals 3

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings(Ljava/lang/Object;)V

    iget-object v0, p0, Lpoy;->B:Lusf;"""

    if target in content and "invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings" not in content[:content.find(target) + 200]:
        content = content.replace(target, replacement)
        print("    [+] poy.smali patched M(I) with TomteProSettingsPanel.injectProSettings.")

    target_r = """.method public final r(I)V
    .locals 1

    iget-boolean v0, p0, Lpoy;->U:Z"""
    replacement_r = """.method public final r(I)V
    .locals 1

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings(Ljava/lang/Object;)V

    iget-boolean v0, p0, Lpoy;->U:Z"""

    if target_r in content:
        content = content.replace(target_r, replacement_r)
        print("    [+] poy.smali patched r(I) with TomteProSettingsPanel.injectProSettings.")

    with open(poy_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_pji_smali():
    print("[*] Patching pji.smali (Inject TomteProSettingsPanel at end of wire loop)...")
    pji_path = os.path.join(APKTOOL_DIR, "smali", "pji.smali")
    if not os.path.exists(pji_path):
        print("    [!] Warning: pji.smali not found.")
        return
    with open(pji_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    :cond_6
    if-eqz v5, :cond_7"""
    replacement = """    :cond_6
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings(Ljava/lang/Object;)V

    if-eqz v5, :cond_7"""

    if "TomteProSettingsPanel;->injectProSettings" not in content:
        if target in content:
            content = content.replace(target, replacement)
            with open(pji_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] pji.smali patched with TomteProSettingsPanel.injectProSettings.")
        else:
            print("    [!] Warning: target not found in pji.smali")
    else:
        print("    [+] pji.smali already contains TomteProSettingsPanel.")

def patch_stock_raw_mode():
    # Preserved as clean no-op: RAW mode output is managed natively or via TomteProSettingsPanel
    pass

def patch_autobahn_viewpager():
    print("[*] Patching AutobahnViewPager.smali (onMeasure height expansion)...")
    tab_xml_path = os.path.join(APKTOOL_DIR, "res", "layout", "options_bottomsheet_tab.xml")
    if os.path.exists(tab_xml_path):
        with open(tab_xml_path, "r", encoding="utf-8") as f:
            tab_content = f.read()
        if 'android:layout_marginBottom="48.0dp"' in tab_content:
            tab_content = tab_content.replace('android:layout_marginBottom="48.0dp"', 'android:layout_marginBottom="0.0dp"')
            with open(tab_xml_path, "w", encoding="utf-8") as f:
                f.write(tab_content)
            print("    [+] options_bottomsheet_tab.xml: removed 48dp bottom margin on AutobahnViewPager.")

    vp_path = os.path.join(APKTOOL_DIR, "smali", "com", "google", "android", "apps", "camera", "optionsbar", "view", "AutobahnViewPager.smali")
    if not os.path.exists(vp_path):
        print("    [!] Warning: AutobahnViewPager.smali not found.")
        return
    with open(vp_path, "r", encoding="utf-8") as f:
        vp_content = f.read()

    repl_loop = """    :goto_0
    invoke-virtual {p0}, Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0"""

    if repl_loop in vp_content:
        print("    [+] AutobahnViewPager.smali: already patched with Math.max.")
        return

    orig_pattern = re.compile(r'    :goto_0\s+invoke-virtual \{p0\}, Lcom/google/android/apps/camera/optionsbar/view/AutobahnViewPager;->getChildCount\(\)I.*?goto :goto_0', re.DOTALL)
    if orig_pattern.search(vp_content):
        vp_content = orig_pattern.sub(repl_loop, vp_content, count=1)
        with open(vp_path, "w", encoding="utf-8") as f:
            f.write(vp_content)
        print("    [+] AutobahnViewPager.smali: patched onMeasure to use Math.max height.")
    else:
        print("    [!] Warning: Could not match onMeasure loop in AutobahnViewPager.smali.")

def patch_qfr_smali():
    print("[*] Patching qfr.smali (Gouda TPU configuration, was pvz)...")
    qfr_path = os.path.join(APKTOOL_DIR, "smali", "qfr.smali")
    if not os.path.exists(qfr_path):
        print("    [!] Warning: qfr.smali not found.")
        return
    with open(qfr_path, "r", encoding="utf-8") as f:
        content = f.read()

    target_tpu = """    sget-object v0, Lkrg;->aj:Lkps;

    invoke-virtual {p1, v0}, Lksf;->q(Lkps;)Z

    move-result v0

    iput-boolean v0, p0, Lqfr;->n:Z

    sget-object v0, Lkrg;->ak:Lkps;

    invoke-virtual {p1, v0}, Lksf;->q(Lkps;)Z

    move-result v0

    iput-boolean v0, p0, Lqfr;->o:Z

    sget-object v0, Lkrg;->am:Lkps;

    invoke-virtual {p1, v0}, Lksf;->q(Lkps;)Z

    move-result v0

    iput-boolean v0, p0, Lqfr;->p:Z

    sget-object v0, Lkrg;->al:Lkps;

    invoke-virtual {p1, v0}, Lksf;->q(Lkps;)Z

    move-result v0

    iput-boolean v0, p0, Lqfr;->q:Z

    sget-object v0, Lkrg;->ar:Lkps;

    invoke-virtual {p1, v0}, Lksf;->q(Lkps;)Z

    move-result v0

    iput-boolean v0, p0, Lqfr;->r:Z"""

    repl_tpu = """    const/4 v0, 0x0

    iput-boolean v0, p0, Lqfr;->n:Z

    iput-boolean v0, p0, Lqfr;->o:Z

    iput-boolean v0, p0, Lqfr;->p:Z

    iput-boolean v0, p0, Lqfr;->q:Z

    iput-boolean v0, p0, Lqfr;->r:Z"""

    if target_tpu in content:
        content = content.replace(target_tpu, repl_tpu, 1)
        with open(qfr_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qfr.smali: Disabled TPU flags (n, o, p, q, r = false).")
    elif "const/4 v0, 0x0\n\n    iput-boolean v0, p0, Lqfr;->n:Z" in content:
        print("    [+] qfr.smali: TPU flags already disabled.")
    else:
        print("    [!] Warning: qfr.smali TPU target block not found.")


def patch_qfz_smali():
    print("[*] Patching qfz.smali (Portrait monocular depth loader, was pwh)...")
    qfz_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qfz.smali")
    if not os.path.exists(qfz_path):
        print("    [!] Warning: qfz.smali not found.")
        return
    with open(qfz_path, "r", encoding="utf-8") as f:
        content = f.read()

    target_mono = """    if-eqz v14, :cond_2

    :try_start_3
    invoke-virtual {v5}, Lvhe;->m()Lvhd;

    move-result-object v14

    move-object/from16 v16, v5

    sget-object v5, Lvhd;->a:Lvhd;

    invoke-virtual {v14, v5}, Lvhd;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    sget-object v5, Lkrg;->u:Lkps;

    invoke-virtual {v13, v5}, Lksf;->h(Lkps;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lxum;->ag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    :cond_2
    move-object/from16 v16, v5

    :cond_3
    const-string v5, \"\""""

    repl_mono = """    move-object/from16 v16, v5

    :try_start_3
    sget-object v5, Lkrg;->u:Lkps;

    invoke-virtual {v13, v5}, Lksf;->h(Lkps;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lxum;->ag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5"""

    if target_mono in content:
        content = content.replace(target_mono, repl_mono, 1)
        with open(qfz_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qfz.smali: Monocular depth model loading enabled for all cameras.")
    elif "sget-object v5, Lkrg;->u:Lkps;\n\n    invoke-virtual {v13, v5}, Lksf;->h(Lkps;)Ljava/lang/String;" in content:
        print("    [+] qfz.smali: Monocular model loading already enabled.")
    else:
        print("    [!] Warning: qfz.smali monocular target block not found.")


def patch_qge_smali():
    print("[*] Patching qge.smali (PortraitRequest dispatch, was pwm)...")
    qge_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qge.smali")
    if not os.path.exists(qge_path):
        print("    [!] Warning: qge.smali not found.")
        return
    with open(qge_path, "r", encoding="utf-8") as f:
        content = f.read()

    start_marker = "    if-eqz v6, :cond_3"
    end_marker = "    :cond_c\n    :goto_2"

    idx1 = content.find(start_marker)
    idx2 = content.find(end_marker)

    if idx1 != -1 and idx2 != -1 and idx1 < idx2:
        end_idx = idx2 + len("    :cond_c\n")
        repl = """    sget-object v6, Lzzd;->e:Lzzd;

    invoke-virtual {v4, v6}, Lcom/google/googlex/gcam/PortraitRequest;->d(Lzzd;)V\n\n"""
        content = content[:idx1] + repl + content[end_idx:]
        print("    [+] qge.smali: Successfully routed all portrait captures to zzd.e (kMonocular).")
    elif "sget-object v6, Lzzd;->e:Lzzd;" in content and "invoke-virtual {v4, v6}, Lcom/google/googlex/gcam/PortraitRequest;->d(Lzzd;)V" in content:
        print("    [+] qge.smali: Already routed to zzd.e (kMonocular).")
    else:
        print("    [!] Warning: qge.smali dispatch target block not found.")

    # Force apply_portrait_matting_set = true for both front and rear captures
    target_matting = """    :cond_11
    :goto_7
    const/4 v6, 0x1

    goto :goto_8

    :cond_12
    const/4 v6, 0x0"""

    repl_matting = """    :cond_11
    :goto_7
    :cond_12
    const/4 v6, 0x1"""

    if target_matting in content:
        content = content.replace(target_matting, repl_matting, 1)
        print("    [+] qge.smali: Forced apply_portrait_matting_set = true for all cameras.")
    elif ":cond_12\n    const/4 v6, 0x1" in content:
        print("    [+] qge.smali: Matting already forced to true.")
    else:
        print("    [!] Warning: qge.smali matting target block not found.")

    # Disable Lancet upscaler (enable_lancet_upscaler_set = false)
    target_lancet = """    iget-boolean v6, v8, Lqfr;->A:Z

    iget-wide v10, v4, Lcom/google/googlex/gcam/PortraitRequest;->a:J

    invoke-static {v10, v11, v4, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->PortraitRequest_enable_lancet_upscaler_set(JLcom/google/googlex/gcam/PortraitRequest;Z)V"""

    repl_lancet = """    const/4 v6, 0x0

    iget-wide v10, v4, Lcom/google/googlex/gcam/PortraitRequest;->a:J

    invoke-static {v10, v11, v4, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->PortraitRequest_enable_lancet_upscaler_set(JLcom/google/googlex/gcam/PortraitRequest;Z)V"""

    if target_lancet in content:
        content = content.replace(target_lancet, repl_lancet, 1)
        print("    [+] qge.smali: Disabled TPU Lancet upscaler.")
    elif "const/4 v6, 0x0\n\n    iget-wide v10, v4, Lcom/google/googlex/gcam/PortraitRequest;->a:J\n\n    invoke-static {v10, v11, v4, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->PortraitRequest_enable_lancet_upscaler_set" in content:
        print("    [+] qge.smali: Lancet upscaler already disabled.")
    else:
        print("    [!] Warning: qge.smali lancet target block not found.")

    with open(qge_path, "w", encoding="utf-8") as f:
        f.write(content)


def patch_qgh_smali():
    print("[*] Patching qgh.smali (PortraitSegmenterManager, was pwp)...")
    qgh_path = os.path.join(APKTOOL_DIR, "smali", "qgh.smali")
    if not os.path.exists(qgh_path):
        print("    [!] Warning: qgh.smali not found.")
        return
    with open(qgh_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. In qgh.a(): If !this.e, invoke this.b() synchronously before returning handle
    target_a = """    iget-boolean v1, p0, Lqgh;->e:Z

    if-nez v1, :cond_0

    monitor-exit v0

    const-wide/16 v0, 0x0

    return-wide v0"""

    repl_a = """    iget-boolean v1, p0, Lqgh;->e:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lqgh;->b()V

    iget-boolean v1, p0, Lqgh;->e:Z

    if-nez v1, :cond_0

    monitor-exit v0

    const-wide/16 v0, 0x0

    return-wide v0"""

    if target_a in content:
        content = content.replace(target_a, repl_a, 1)
        print("    [+] qgh.smali: Added synchronous b() initialization in a().")

    # 2. In qgh.b(): Default model name to 1c33 stock model if null or empty
    target_b_model = """    iget-object v0, v1, Lqgh;->g:Landroid/content/Context;

    iget-object v3, v1, Lqgh;->b:Ljava/lang/String;

    iget-object v4, v1, Lqgh;->f:Luxt;"""

    repl_b_model = """    iget-object v0, v1, Lqgh;->g:Landroid/content/Context;

    iget-object v3, v1, Lqgh;->b:Ljava/lang/String;

    if-eqz v3, :cond_qgh_default_model

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_qgh_default_model

    goto :cond_qgh_model_ok

    :cond_qgh_default_model
    const-string v3, "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed"

    iput-object v3, v1, Lqgh;->b:Ljava/lang/String;

    :cond_qgh_model_ok

    iget-object v4, v1, Lqgh;->f:Luxt;"""

    if target_b_model in content:
        content = content.replace(target_b_model, repl_b_model, 1)
        print("    [+] qgh.smali: Added 1c33 stock model fallback in b().")

    # 3. In qgh.b(): CPU/GPU retry
    target_init = """    invoke-interface/range {v6 .. v17}, Laadw;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    if-eqz v0, :cond_5

    if-nez v13, :cond_5"""

    repl_init = """    invoke-interface/range {v6 .. v17}, Laadw;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    if-nez v0, :cond_check_mask_reasonable

    invoke-interface {v6}, Laadw;->release()V

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    const/4 v0, 0x0

    iput-boolean v0, v1, Lqgh;->n:Z

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v13, 0x0

    invoke-interface/range {v6 .. v17}, Laadw;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    goto :cond_5

    :cond_check_mask_reasonable
    if-nez v13, :cond_5"""

    if target_init in content:
        content = content.replace(target_init, repl_init, 1)
        print("    [+] qgh.smali: Added CPU/GPU fallback retry in b().")

    with open(qgh_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] qgh.smali: Hardened PortraitSegmenterManager applied.")


def patch_mqs_smali():
    print("[*] Patching mqs.smali (TomteGrain startup initialization, was mia)...")
    mqs_path = os.path.join(APKTOOL_DIR, "smali", "mqs.smali")
    if not os.path.exists(mqs_path):
        print("    [!] Warning: mqs.smali not found.")
        return
    with open(mqs_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    iget-boolean v0, p0, Lmqs;->f:Z

    if-nez v0, :cond_0

    goto/16 :goto_2"""

    if target in content:
        content = content.replace(target, "    goto :cond_0", 1)
        with open(mqs_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] mqs.smali: TomteGrain#initialize enabled unconditionally at startup.")
    elif "goto :cond_0\n\n    :cond_0\n    iget-object v0, p0, Lmqs;->g:Lksf;" in content:
        print("    [+] mqs.smali: Already patched for startup initialization.")


def patch_nzr_and_mpd_smali():
    print("[*] Patching nzr.smali and mpd.smali (Fine-Tuning sliders visibility)...")
    nzr_path = os.path.join(APKTOOL_DIR, "smali", "nzr.smali")
    if os.path.exists(nzr_path):
        with open(nzr_path, "r", encoding="utf-8") as f:
            content = f.read()

        # Update I(Lnzx;)Z to recognize nzx.n
        target_i = """    sget-object v0, Lnzx;->m:Lnzx;

    if-ne p0, v0, :cond_0

    goto :goto_0"""
        repl_i = """    sget-object v0, Lnzx;->m:Lnzx;

    if-eq p0, v0, :cond_1

    sget-object v0, Lnzx;->n:Lnzx;

    if-ne p0, v0, :cond_0

    goto :goto_0"""
        if target_i in content:
            content = content.replace(target_i, repl_i, 1)

        # Remove suppression in v(Lnzx;Z)V
        target_v = """.method public final declared-synchronized v(Lnzx;Z)V
    .locals 2

    monitor-enter p0

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object p2, p0, Lnzr;->n:Lusf;

    invoke-interface {p2}, Lusf;->d()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {p1}, Lnzr;->I(Lnzx;)Z

    move-result v1

    if-ne p2, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    iget-object p2, p0, Lnzr;->k:Loba;

    invoke-virtual {p2, p1, v0}, Loba;->g(Lnzx;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method"""

        repl_v = """.method public final declared-synchronized v(Lnzx;Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnzr;->k:Loba;

    invoke-virtual {v0, p1, p2}, Loba;->g(Lnzx;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method"""

        if target_v in content:
            content = content.replace(target_v, repl_v, 1)

        with open(nzr_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] nzr.smali: Fine-tuning sliders visibility unsuppressed.")

    # mpd.smali
    mpd_path = os.path.join(APKTOOL_DIR, "smali", "mpd.smali")
    if os.path.exists(mpd_path):
        with open(mpd_path, "r", encoding="utf-8") as f:
            content = f.read()

        target_mpd = """    iget-object p1, p0, Lnzr;->n:Lusf;

    invoke-interface {p1}, Lusf;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Lnzr;->m()V

    invoke-virtual {p0}, Lnzr;->C()V

    return-void"""

        repl_mpd = """    invoke-virtual {p0}, Lnzr;->m()V

    invoke-virtual {p0}, Lnzr;->C()V

    return-void"""

        if target_mpd in content:
            content = content.replace(target_mpd, repl_mpd, 1)
            with open(mpd_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] mpd.smali: Controls tray refresh hooked on Look selection.")

def patch_kgy_smali():
    print("[*] Patching kgy.smali (Pixel 8 Pro: 10x button across Photo, Night Sight, Video)...")
    kgy_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kgy.smali")
    if not os.path.exists(kgy_path):
        print("    [!] Warning: kgy.smali not found.")
        return
    with open(kgy_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. 10x Photo mode button
    photo_target = """    const/high16 v9, 0x40a00000    # 5.0f

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v10

    invoke-virtual {v3, v10}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Letp;->l(Laaxk;)Labae;

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    photo_repl = """    const/high16 v9, 0x40a00000    # 5.0f

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Letp;->l(Laaxk;)Labae;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if photo_target in content:
        content = content.replace(photo_target, photo_repl)
        print("    [+] kgy.smali: 10x button added to Photo mode.")

    # 2. Night Sight & Video mode buttons
    ns_target = """    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    ns_repl = """    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if ns_target in content:
        content = content.replace(ns_target, ns_repl)
        print("    [+] kgy.smali: 10x button added to Night Sight mode.")

    v_target1 = """    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    v_repl1 = """    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if v_target1 in content:
        content = content.replace(v_target1, v_repl1)

    v_target2 = """    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    v_repl2 = """    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if v_target2 in content:
        content = content.replace(v_target2, v_repl2)

    with open(kgy_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_kgx_smali():
    print("[*] Patching kgx.smali (Pixel 9 Pro: 10x button across Night Sight & Video)...")
    kgx_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kgx.smali")
    if not os.path.exists(kgx_path):
        return
    with open(kgx_path, "r", encoding="utf-8") as f:
        content = f.read()

    replacements = [
        ("""    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""),

        ("""    sget-object v5, Lyri;->R:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->R:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""),

        ("""    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""),

        ("""    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Letp;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Letp;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""")
    ]

    for t, r in replacements:
        if t in content:
            content = content.replace(t, r)

    with open(kgx_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] kgx.smali: 10x button added across all modes.")

def patch_khk_smali():
    print("[*] Patching khk.smali (Pixel 10 Pro: 10x button across all modes)...")
    khk_path = os.path.join(APKTOOL_DIR, "smali_classes2", "khk.smali")
    if not os.path.exists(khk_path):
        return
    with open(khk_path, "r", encoding="utf-8") as f:
        content = f.read()

    photo_t = """    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v10

    invoke-virtual {v3, v10}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Letp;->l(Laaxk;)Labae;

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    photo_r = """    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Letp;->l(Laaxk;)Labae;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if photo_t in content:
        content = content.replace(photo_t, photo_r)

    modes_t = "invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"
    modes_r = "invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"
    content = content.replace(modes_t, modes_r)

    with open(khk_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] khk.smali: 10x button added for Pixel 10 Pro across all modes.")

def patch_kgs_smali():
    print("[*] Patching kgs.smali (Pixel 9 Pro Fold: 10x button across all modes)...")
    kgs_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kgs.smali")
    if not os.path.exists(kgs_path):
        return
    with open(kgs_path, "r", encoding="utf-8") as f:
        content = f.read()

    photo_t = """    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v10

    invoke-virtual {v3, v10}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Letp;->l(Laaxk;)Labae;

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    photo_r = """    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Letp;->l(Laaxk;)Labae;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if photo_t in content:
        content = content.replace(photo_t, photo_r)

    modes_t = "invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"
    modes_r = "invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"
    content = content.replace(modes_t, modes_r)

    with open(kgs_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] kgs.smali: 10x button added for Pixel 9 Pro Fold across all modes.")

def patch_zoom_controllers():
    print("[*] Patching 10x Quick Zoom button controllers (knq, knk, kmd, kmo)...")

    target_photo = """    invoke-static {v6, v7, v8, v9}, Lyqc;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyqc;

    move-result-object v10

    invoke-virtual {v3, v10}, Labjo;->w(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lgei;->l(Labjo;)Labmi;

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10"""

    repl_photo = """    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static/range {v6 .. v10}, Lyqc;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyqc;

    move-result-object v11

    invoke-virtual {v3, v11}, Labjo;->w(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lgei;->l(Labjo;)Labmi;

    const/high16 v5, 0x40000000    # 2.0f"""

    target_other = """    invoke-static {v6, v7, v8, v9}, Lyqc;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyqc;

    move-result-object v3

    invoke-virtual {v1, v3}, Labjo;->w(Ljava/lang/Iterable;)V"""

    repl_other = """    invoke-static {v6, v7, v8, v9, v10}, Lyqc;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyqc;

    move-result-object v3

    invoke-virtual {v1, v3}, Labjo;->w(Ljava/lang/Iterable;)V"""

    # 1. knq.smali (Pixel 8 Pro zoom configuration)
    knq_path = os.path.join(APKTOOL_DIR, "smali_classes2", "knq.smali")
    if os.path.exists(knq_path):
        with open(knq_path, "r", encoding="utf-8") as f:
            content = f.read()

        if target_photo in content:
            content = content.replace(target_photo, repl_photo)
            print("    [+] knq.smali: 10x Quick Zoom added to Pixel 8 Pro Photo mode.")
        elif "invoke-static/range {v6 .. v10}, Lyqc;->p" in content:
            print("    [+] knq.smali: already patched for Photo mode.")
        else:
            print("    [!] Warning: knq.smali Photo mode target not found.")

        if target_other in content:
            content = content.replace(target_other, repl_other)
            print("    [+] knq.smali: 10x Quick Zoom added to Pixel 8 Pro Night Sight, Video, and Slow-mo modes.")

        with open(knq_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 2. knk.smali (Pixel 7 Pro zoom configuration)
    knk_path = os.path.join(APKTOOL_DIR, "smali_classes2", "knk.smali")
    if os.path.exists(knk_path):
        with open(knk_path, "r", encoding="utf-8") as f:
            content = f.read()

        if target_photo in content:
            content = content.replace(target_photo, repl_photo)
            print("    [+] knk.smali: 10x Quick Zoom added to Pixel 7 Pro Photo mode.")
        if target_other in content:
            content = content.replace(target_other, repl_other)
            print("    [+] knk.smali: 10x Quick Zoom added to Pixel 7 Pro Night Sight, Video, and Slow-mo modes.")

        with open(knk_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 3. kmd.smali (Dynamic zoom stops listener, was kfl)
    kmd_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kmd.smali")
    if os.path.exists(kmd_path):
        with open(kmd_path, "r", encoding="utf-8") as f:
            content = f.read()

        kmd_target = """    :cond_b
    :goto_6
    invoke-virtual {v1, v6}, Labjo;->w(Ljava/lang/Iterable;)V"""

        kmd_repl = """    :cond_b
    :goto_6
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v6, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_skip_10x_kmd

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gtz v2, :cond_skip_10x_kmd

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v6, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_skip_10x_kmd

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kmd
    invoke-virtual {v1, v6}, Labjo;->w(Ljava/lang/Iterable;)V"""

        if kmd_target in content:
            content = content.replace(kmd_target, kmd_repl)
            print("    [+] kmd.smali: 10x Quick Zoom button dynamically generated when 5x is present and max zoom >= 10x.")
        elif ":cond_skip_10x_kmd" in content:
            print("    [+] kmd.smali: already patched with dynamic 10x hook.")
        else:
            print("    [!] Warning: kmd.smali target not found.")

        with open(kmd_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 4. kmo.smali (Viewfinder zoom toggle button row manager, was kfw)
    kmo_path = os.path.join(APKTOOL_DIR, "smali", "kmo.smali")
    if os.path.exists(kmo_path):
        with open(kmo_path, "r", encoding="utf-8") as f:
            content = f.read()

        kmo_target = """    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_a
    const/4 v4, 0x1"""

        kmo_repl = """    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_a
    iget-object v6, v0, Lkmo;->S:Ljava/util/List;

    const/high16 v8, 0x40a00000    # 5.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_skip_10x_kmo

    const/high16 v8, 0x41200000    # 10.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_skip_10x_kmo

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v6, Lkkl;

    const-string v8, "10"

    const/4 v11, 0x0

    invoke-direct {v6, v8, v11}, Lkkl;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v8, v0, Lkmo;->R:Lchy;

    invoke-virtual {v8, v6}, Lchy;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kmo
    const/4 v4, 0x1"""

        if kmo_target in content:
            content = content.replace(kmo_target, kmo_repl)
            print("    [+] kmo.smali: 10x Quick Zoom button dynamically hooked in UI toggle row.")
        elif ":cond_skip_10x_kmo" in content:
            print("    [+] kmo.smali: already patched with dynamic 10x hook.")
        else:
            print("    [!] Warning: kmo.smali target not found.")

        with open(kmo_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 5. guh.smali (1x Main Camera Focal Length Cycling: 1.0x (24mm) -> 1.2x (28mm) -> 1.5x (35mm) -> 1.0x)
    guh_path = os.path.join(APKTOOL_DIR, "smali", "guh.smali")
    if os.path.exists(guh_path):
        with open(guh_path, "r", encoding="utf-8") as f:
            guh_content = f.read()

        if ":cond_apply_focal_zoom_guh" in guh_content or ":cond_std_zoom_guh" in guh_content:
            print("    [+] guh.smali: already patched with 1x focal length cycling.")
        else:
            guh_target = """    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget-object p0, v0, Lkmo;->h:Lusf;

    invoke-interface {p0}, Lusf;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-static {p0, v2}, Ladtc;->e(Ljava/lang/Float;F)Z

    move-result p1

    if-nez p1, :cond_3"""

            guh_repl = """    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget-object p0, v0, Lkmo;->h:Lusf;

    invoke-interface {p0}, Lusf;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v2, v1

    if-nez v1, :cond_std_zoom_guh

    if-nez p0, :cond_check_cur_zoom_guh

    const/high16 v2, 0x3f800000    # 1.0f

    goto :cond_apply_focal_zoom_guh

    :cond_check_cur_zoom_guh
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const v3, 0x3f733333    # 0.95f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_check_1_0x_guh

    const/high16 v2, 0x3f800000    # 1.0f

    goto :cond_apply_focal_zoom_guh

    :cond_focal_check_1_0x_guh
    const v3, 0x3f933333    # 1.15f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_check_1_2x_guh

    const v2, 0x3f99999a    # 1.2f (28mm)

    goto :cond_apply_focal_zoom_guh

    :cond_focal_check_1_2x_guh
    const v3, 0x3faccccd    # 1.35f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_check_1_5x_guh

    const/high16 v2, 0x3fc00000    # 1.5f (35mm)

    goto :cond_apply_focal_zoom_guh

    :cond_focal_check_1_5x_guh
    const v3, 0x3feccccd    # 1.85f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_outside_guh

    const/high16 v2, 0x3f800000    # 1.0f (24mm)

    goto :cond_apply_focal_zoom_guh

    :cond_focal_outside_guh
    const/high16 v2, 0x3f800000    # 1.0f

    :cond_apply_focal_zoom_guh
    invoke-static {p0, v2}, Ladtc;->e(Ljava/lang/Float;F)Z

    move-result p1

    if-nez p1, :cond_3

    goto :cond_exec_zoom_guh

    :cond_std_zoom_guh
    invoke-static {p0, v2}, Ladtc;->e(Ljava/lang/Float;F)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_exec_zoom_guh"""

            if guh_target in guh_content:
                guh_content = guh_content.replace(guh_target, guh_repl)
                print("    [+] guh.smali: 1x Focal Length Cycling (1.0x -> 1.2x -> 1.5x) successfully hooked.")
            else:
                print("    [!] Warning: guh.smali target not found.")

            with open(guh_path, "w", encoding="utf-8") as f:
                f.write(guh_content)

def patch_qhm_smali():
    print("[*] Patching qhm.smali (Bypassing capability checks for Quick Access sliders)...")
    qhm_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qhm.smali")
    if not os.path.exists(qhm_path):
        print("    [!] Warning: qhm.smali not found.")
        return
    with open(qhm_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    invoke-virtual {v6, v7}, Lnqj;->G(Lnqp;)Z

    move-result v6

    if-nez v6, :cond_2"""

    replacement = """    invoke-virtual {v6, v7}, Lnqj;->G(Lnqp;)Z

    move-result v6

    goto :cond_2"""

    if target in content:
        content = content.replace(target, replacement)
        print("    [+] qhm.smali: G(Lnqp;)Z capability check bypassed.")
    elif "goto :cond_2" in content:
        print("    [+] qhm.smali: G(Lnqp;)Z already patched.")

    target_clinit = """    sget-object v2, Lnqq;->j:Lnqq;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lnqq;->i:Lnqq;"""

    replacement_clinit = """    sget-object v2, Lnqq;->h:Lnqq;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lnqq;->b:Lnqq;"""

    if target_clinit in content:
        content = content.replace(target_clinit, replacement_clinit)
        print("    [+] qhm.smali: Quick Access slider list set to [h, b] (Brightness, Shadows).")
    elif "sget-object v2, Lnqq;->h:Lnqq;" in content:
        print("    [+] qhm.smali: clinit already patched.")

    target_h = """.method public final h(Lnqq;)Z
    .locals 0

    invoke-direct {p0}, Lqhm;->n()Ljava/util/Map;"""

    replacement_h = """.method public final h(Lnqq;)Z
    .locals 1

    sget-object v0, Lnqq;->h:Lnqq;

    if-ne p1, v0, :cond_qa_b

    const/4 p0, 0x1

    return p0

    :cond_qa_b
    sget-object v0, Lnqq;->b:Lnqq;

    if-ne p1, v0, :cond_qa_i

    const/4 p0, 0x1

    return p0

    :cond_qa_i
    sget-object v0, Lnqq;->i:Lnqq;

    if-ne p1, v0, :cond_qa_j

    const/4 p0, 0x1

    return p0

    :cond_qa_j
    sget-object v0, Lnqq;->j:Lnqq;

    if-ne p1, v0, :cond_orig_h

    const/4 p0, 0x1

    return p0

    :cond_orig_h
    invoke-direct {p0}, Lqhm;->n()Ljava/util/Map;"""

    if target_h in content:
        content = content.replace(target_h, replacement_h)
        print("    [+] qhm.smali: h(Lnqq;)Z patched to return true for Brightness and Shadows.")
    elif "cond_qa_b" not in content and "cond_ret_true" in content:
        old_patch = """.method public final h(Lnqq;)Z
    .locals 1

    sget-object v0, Lnqq;->h:Lnqq;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnqq;->b:Lnqq;

    if-ne p1, v0, :cond_orig_h

    :cond_ret_true
    const/4 p0, 0x1

    return p0

    :cond_orig_h
    invoke-direct {p0}, Lqhm;->n()Ljava/util/Map;"""
        content = content.replace(old_patch, replacement_h)
        print("    [+] qhm.smali: h(Lnqq;)Z upgraded to support all 4 enums.")
    else:
        print("    [+] qhm.smali: h(Lnqq;)Z already patched.")

    with open(qhm_path, "w", encoding="utf-8") as f:
        f.write(content)

    # Also patch nqj.smali
    nqj_path = os.path.join(APKTOOL_DIR, "smali", "nqj.smali")
    if os.path.exists(nqj_path):
        with open(nqj_path, "r", encoding="utf-8") as f:
            nqj_content = f.read()

        target_nqj = """.method public final declared-synchronized G(Lnqp;)Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->k:Lnrs;"""

        replacement_nqj = """.method public final declared-synchronized G(Lnqp;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnqp;->a:Lnqp;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnqp;->b:Lnqp;

    if-ne p1, v0, :cond_check_orig

    :cond_ret_true
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_check_orig
    iget-object v0, p0, Lnqj;->k:Lnrs;"""

        if target_nqj in nqj_content:
            nqj_content = nqj_content.replace(target_nqj, replacement_nqj)
            with open(nqj_path, "w", encoding="utf-8") as f:
                f.write(nqj_content)
            print("    [+] nqj.smali: G(Lnqp;) bypassed for DUAL_EXPOSURE and SINGLE_EXPOSURE.")
        elif "cond_check_orig" in nqj_content:
            print("    [+] nqj.smali: G(Lnqp;) already bypassed.")

    # Also patch nqp.smali: a()Z returns true for DUAL_EXPOSURE and SINGLE_EXPOSURE
    nqp_path = os.path.join(APKTOOL_DIR, "smali", "nqp.smali")
    if os.path.exists(nqp_path):
        with open(nqp_path, "r", encoding="utf-8") as f:
            nqp_content = f.read()

        target_nqp = """    sget-object v0, Lnqp;->e:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0"""

        replacement_nqp = """    sget-object v0, Lnqp;->e:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnqp;->a:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnqp;->b:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0"""

        if target_nqp in nqp_content:
            nqp_content = nqp_content.replace(target_nqp, replacement_nqp)
            with open(nqp_path, "w", encoding="utf-8") as f:
                f.write(nqp_content)
            print("    [+] nqp.smali: a() updated for DUAL_EXPOSURE and SINGLE_EXPOSURE.")
        else:
            print("    [+] nqp.smali: a() already updated.")

def patch_brightness_shadows_controllers():
    print("[*] Patching 11.1 active Brightness and Shadows controllers (oak, oau, oaj, pco, plh)...")

    # 1. Patch 11.1 active Brightness and Shadow slider handler: oaj.smali
    oaj_path = os.path.join(APKTOOL_DIR, "smali_classes2", "oaj.smali")
    if os.path.exists(oaj_path):
        with open(oaj_path, "r", encoding="utf-8") as f:
            oaj_c = f.read()
        
        # Shadow slider: :pswitch_3
        target_oaj_p3 = """:pswitch_3
    iget-object p0, p0, Loaj;->a:Loac;

    iget-object v0, p0, Loac;->a:Lsxy;

    if-eqz v0, :cond_2

    invoke-static {p1, v5, v4}, Lokq;->o(FII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsxy;->f(Ljava/lang/String;)V

    :cond_2
    if-nez p2, :cond_3

    goto/16 :goto_2

    :cond_3
    check-cast p0, Loau;

    iget-object p2, p0, Loau;->r:Loam;

    invoke-virtual {p2, v6}, Loam;->c(Z)V

    iget-object p2, p0, Loau;->k:Lusf;

    invoke-interface {p2, v7}, Lusf;->a(Ljava/lang/Object;)V"""
        
        repl_oaj_p3 = """:pswitch_3
    iget-object p0, p0, Loaj;->a:Loac;

    iget-object v0, p0, Loac;->a:Lsxy;

    if-eqz v0, :cond_2

    invoke-static {p1, v5, v4}, Lokq;->o(FII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsxy;->f(Ljava/lang/String;)V

    :cond_2
    check-cast p0, Loau;

    iget-object p2, p0, Loau;->r:Loam;

    invoke-virtual {p2, v6}, Loam;->c(Z)V

    iget-object p2, p0, Loau;->k:Lusf;

    invoke-interface {p2, v7}, Lusf;->a(Ljava/lang/Object;)V"""
        if target_oaj_p3 in oaj_c:
            oaj_c = oaj_c.replace(target_oaj_p3, repl_oaj_p3)
            print("    [+] oaj.smali: Shadow live dragging & capture sync patched.")
        elif ":cond_2\n    check-cast p0, Loau;" in oaj_c:
            print("    [+] oaj.smali: Shadow live dragging & capture sync already patched.")

        # Brightness slider: :pswitch_8
        target_oaj_p8 = """:pswitch_8
    if-eqz p2, :cond_e

    iget-object p0, p0, Loaj;->a:Loac;

    check-cast p0, Loak;

    iget-object p2, p0, Loak;->n:Loam;

    invoke-virtual {p2, v6}, Loam;->c(Z)V

    iget-object p2, p0, Loak;->h:Lusf;

    invoke-interface {p2, v7}, Lusf;->a(Ljava/lang/Object;)V"""

        repl_oaj_p8 = """:pswitch_8
    iget-object p0, p0, Loaj;->a:Loac;

    iget-object v0, p0, Loac;->a:Lsxy;

    if-eqz v0, :cond_8_label

    invoke-static {p1, v5, v4}, Lokq;->o(FII)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsxy;->f(Ljava/lang/String;)V

    :cond_8_label
    check-cast p0, Loak;

    iget-object p2, p0, Loak;->n:Loam;

    invoke-virtual {p2, v6}, Loam;->c(Z)V

    iget-object p2, p0, Loak;->h:Lusf;

    invoke-interface {p2, v7}, Lusf;->a(Ljava/lang/Object;)V"""
        if target_oaj_p8 in oaj_c:
            oaj_c = oaj_c.replace(target_oaj_p8, repl_oaj_p8)
            print("    [+] oaj.smali: Brightness live dragging & capture sync patched.")
        elif ":cond_8_label" in oaj_c:
            print("    [+] oaj.smali: Brightness live dragging & capture sync already patched.")

        # Drag suppression removal for fine-tuning sliders in oaj.smali
        target_drag = """    packed-switch v0, :pswitch_data_0

    if-nez p2, :cond_a

    goto/16 :goto_2"""
        repl_drag = """    packed-switch v0, :pswitch_data_0

    goto :cond_a"""
        if target_drag in oaj_c:
            oaj_c = oaj_c.replace(target_drag, repl_drag)
            print("    [+] oaj.smali: Drag suppression for fine-tuning sliders removed.")
        elif "goto :cond_a\n\n    :pswitch_0" in oaj_c:
            print("    [+] oaj.smali: Drag suppression already removed.")

        # Remove rigid AE lock on Shadow slider
        target_lock_s = """    iget-object p2, p0, Loau;->k:Lusf;

    invoke-interface {p2, v7}, Lusf;->a(Ljava/lang/Object;)V"""
        repl_lock_s = """    iget-object p2, p0, Loau;->k:Lusf;

    nop"""
        if target_lock_s in oaj_c:
            oaj_c = oaj_c.replace(target_lock_s, repl_lock_s)
            print("    [+] oaj.smali: Rigid AE lock on Shadow slider removed.")
        elif "iget-object p2, p0, Loau;->k:Lusf;\n\n    nop" in oaj_c:
            print("    [+] oaj.smali: Shadow rigid AE lock already removed.")

        # Remove rigid AE lock on Brightness slider
        target_lock_b = """    iget-object p2, p0, Loak;->h:Lusf;

    invoke-interface {p2, v7}, Lusf;->a(Ljava/lang/Object;)V"""
        repl_lock_b = """    iget-object p2, p0, Loak;->h:Lusf;

    nop"""
        if target_lock_b in oaj_c:
            oaj_c = oaj_c.replace(target_lock_b, repl_lock_b)
            print("    [+] oaj.smali: Rigid AE lock on Brightness slider removed.")
        elif "iget-object p2, p0, Loak;->h:Lusf;\n\n    nop" in oaj_c:
            print("    [+] oaj.smali: Brightness rigid AE lock already removed.")

        with open(oaj_path, "w", encoding="utf-8") as f:
            f.write(oaj_c)

    # 2. Patch pco.smali: Initialize pco.c and pco.d to 0.5f neutral baseline
    pco_path = os.path.join(APKTOOL_DIR, "smali", "pco.smali")
    if os.path.exists(pco_path):
        with open(pco_path, "r", encoding="utf-8") as f:
            pco_c = f.read()
        target_pco_init = """    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-direct {v0, v1}, Lurl;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lpco;->c:Lusf;"""
        repl_pco_init = """    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-direct {v0, v1}, Lurl;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lpco;->c:Lusf;"""
        if target_pco_init in pco_c:
            pco_c = pco_c.replace(target_pco_init, repl_pco_init)
            print("    [+] pco.smali: Initialized pco.c & pco.d to 0.5f neutral.")

        target_pco_reset = """    iget-object v0, p0, Lpco;->c:Lusf;

    const/high16 v2, -0x40800000    # -1.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v2}, Lusf;->a(Ljava/lang/Object;)V"""
        repl_pco_reset = """    iget-object v0, p0, Lpco;->c:Lusf;

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v2}, Lusf;->a(Ljava/lang/Object;)V"""
        if target_pco_reset in pco_c:
            pco_c = pco_c.replace(target_pco_reset, repl_pco_reset)
            print("    [+] pco.smali: Reset method initialized to 0.5f neutral.")

        with open(pco_path, "w", encoding="utf-8") as f:
            f.write(pco_c)

    # 3. Patch oak.smali: Loak.l initialized to 0.5f
    oak_path = os.path.join(APKTOOL_DIR, "smali", "oak.smali")
    if os.path.exists(oak_path):
        with open(oak_path, "r", encoding="utf-8") as f:
            oak_c = f.read()
        target_oak_l = """    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Loak;->l:F"""
        repl_oak_l = """    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Loak;->l:F"""
        if target_oak_l in oak_c:
            oak_c = oak_c.replace(target_oak_l, repl_oak_l)
            with open(oak_path, "w", encoding="utf-8") as f:
                f.write(oak_c)
            print("    [+] oak.smali: Loak.l initialized to 0.5f neutral.")

        bad_oak_f = """    iget-object v0, v0, Lpco;->f:Lusf;\n\n    invoke-interface {v0, v1}, Lusf;->a(Ljava/lang/Object;)\n\n    :cond_res_f"""
        good_oak_f = """    iget-object v0, v0, Lpco;->f:Lusf;\n\n    const/high16 v1, 0x3f000000    # 0.5f\n\n    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;\n\n    move-result-object v1\n\n    invoke-interface {v0, v1}, Lusf;->a(Ljava/lang/Object;)\n\n    :cond_res_f"""
        if bad_oak_f in oak_c:
            oak_c = oak_c.replace(bad_oak_f, good_oak_f)
            with open(oak_path, "w", encoding="utf-8") as f:
                f.write(oak_c)
            print("    [+] oak.smali: pco.f reset fixed to 0.5f neutral.")

    # 4. Patch oau.smali: Loau.o initialized to 0.5f
    oau_path = os.path.join(APKTOOL_DIR, "smali", "oau.smali")
    if os.path.exists(oau_path):
        with open(oau_path, "r", encoding="utf-8") as f:
            oau_c = f.read()
        target_oau_o = """    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Loau;->o:F"""
        repl_oau_o = """    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Loau;->o:F"""
        if target_oau_o in oau_c:
            oau_c = oau_c.replace(target_oau_o, repl_oau_o)
            with open(oau_path, "w", encoding="utf-8") as f:
                f.write(oau_c)
            print("    [+] oau.smali: Loau.o initialized to 0.5f neutral.")

    # 5. Patch plh.smali: Dynamically route NOISE_REDUCTION_MODE to TomteInitHelper.getNoiseReductionMode()
    plh_path = os.path.join(APKTOOL_DIR, "smali", "plh.smali")
    if os.path.exists(plh_path):
        with open(plh_path, "r", encoding="utf-8") as f:
            plh_c = f.read()
        target_plh_stock = """    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8"""
        target_plh_hq = """    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8"""
        repl_plh = """    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8"""
        target_plh_pxp = """    new-instance v15, Lpxp;

    sget-object v3, Ltpb;->a:Landroid/hardware/camera2/CaptureRequest$Key;"""
        repl_plh_pxp = """    new-instance v15, Lpxp;

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v3, Ltpb;->a:Landroid/hardware/camera2/CaptureRequest$Key;"""
        if "const/4 v7, 0x2\n\n    move-object/from16 v18, v3" not in plh_c:
            plh_c = plh_c.replace(":goto_4\n    move-object/from16 v18, v3", ":goto_4\n    const/4 v7, 0x2\n\n    move-object/from16 v18, v3")
            with open(plh_path, "w", encoding="utf-8") as f:
                f.write(plh_c)
            print("    [+] plh.smali: Restored primitive int v7=2 at goto_4.")

        if "TomteInitHelper;->getEdgeMode" not in plh_c and "TomteInitHelper;->getNoiseReductionMode" in plh_c:
            edge_target = """    move-result-object v8

    sget-object v3, Ltpb;->a:Landroid/hardware/camera2/CaptureRequest$Key;

    if-eqz v3, :cond_a

    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->EDGE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v12, Lvaz;

    invoke-direct {v12, v4, v8}, Lvaz;-><init>(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V"""
            edge_repl = """    move-result-object v8

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEdgeMode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v3, Ltpb;->a:Landroid/hardware/camera2/CaptureRequest$Key;

    if-eqz v3, :cond_a

    sget-object v4, Landroid/hardware/camera2/CaptureRequest;->EDGE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v12, Lvaz;

    invoke-direct {v12, v4, v7}, Lvaz;-><init>(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V"""
            cond_a_target = """:cond_a
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->EDGE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v4, Lvaz;

    invoke-direct {v4, v3, v8}, Lvaz;-><init>(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V"""
            cond_a_repl = """:cond_a
    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->EDGE_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v4, Lvaz;

    invoke-direct {v4, v3, v7}, Lvaz;-><init>(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V"""
            if edge_target in plh_c:
                plh_c = plh_c.replace(edge_target, edge_repl)
            if cond_a_target in plh_c:
                plh_c = plh_c.replace(cond_a_target, cond_a_repl)
            with open(plh_path, "w", encoding="utf-8") as f:
                f.write(plh_c)
            print("    [+] plh.smali: EDGE_MODE hooked to TomteInitHelper.getEdgeMode().")
        elif "TomteInitHelper;->getNoiseReductionMode" in plh_c:
            print("    [+] plh.smali: NOISE_REDUCTION_MODE and EDGE_MODE already hooked.")
        elif target_plh_pxp in plh_c:
            plh_c = plh_c.replace(target_plh_pxp, repl_plh_pxp)
            with open(plh_path, "w", encoding="utf-8") as f:
                f.write(plh_c)
            print("    [+] plh.smali: NOISE_REDUCTION_MODE hooked to TomteInitHelper.getNoiseReductionMode().")
        elif target_plh_stock in plh_c:
            plh_c = plh_c.replace(target_plh_stock, repl_plh)
            with open(plh_path, "w", encoding="utf-8") as f:
                f.write(plh_c)
            print("    [+] plh.smali: NOISE_REDUCTION_MODE hooked to TomteInitHelper.getNoiseReductionMode().")
        elif target_plh_hq in plh_c:
            plh_c = plh_c.replace(target_plh_hq, repl_plh)
            with open(plh_path, "w", encoding="utf-8") as f:
                f.write(plh_c)
            print("    [+] plh.smali: NOISE_REDUCTION_MODE updated to TomteInitHelper.getNoiseReductionMode().")

    # 6. Patch pin.smali: Bypass jsn fallback overwrite loop so dual-EV settings persist
    pin_path = os.path.join(APKTOOL_DIR, "smali", "pin.smali")
    if os.path.exists(pin_path):
        with open(pin_path, "r", encoding="utf-8") as f:
            pin_c = f.read()
        target_pin = """    iget-boolean v1, v0, Lptm;->g:Z

    if-nez v1, :cond_a

    iget-boolean v1, v0, Lptm;->h:Z

    if-eqz v1, :cond_b"""
        repl_pin = """    goto :cond_b"""
        if target_pin in pin_c:
            pin_c = pin_c.replace(target_pin, repl_pin)
            with open(pin_path, "w", encoding="utf-8") as f:
                f.write(pin_c)
            print("    [+] pin.smali: jsn continuous overwrite loop bypassed.")
        elif "goto :cond_b\\n\\n    :cond_a" in pin_c:
            print("    [+] pin.smali: jsn overwrite loop already bypassed.")

    # 7. Patch qdi.smali: Enable Camera Looks & Pro sliders (Highlights & Shadows) in Photo mode
    qdi_path = os.path.join(APKTOOL_DIR, "smali", "qdi.smali")
    if os.path.exists(qdi_path):
        with open(qdi_path, "r", encoding="utf-8") as f:
            qdi_c = f.read()
        target_qdi = """    invoke-virtual {v9}, Ltbp;->f()Z

    move-result v5

    if-eqz v5, :cond_6

    if-eqz v2, :cond_6"""
        if target_qdi in qdi_c:
            qdi_c = qdi_c.replace(target_qdi, "")
            with open(qdi_path, "w", encoding="utf-8") as f:
                f.write(qdi_c)
            print("    [+] qdi.smali: Pro controls (Highlights & Shadows) enabled in Photo mode.")
        elif ":cond_1\\n\\n    new-instance v2, Ladqa;" in qdi_c:
            print("    [+] qdi.smali: Pro controls in Photo mode already enabled.")

    # 8. Patch 11.1 Autofocus Session Listeners (puu, puo, pua, pul) to stop resetting pzj and pco to auto
    for cls_name in ["puu.smali", "puo.smali", "pua.smali", "pul.smali"]:
        cls_path = os.path.join(APKTOOL_DIR, "smali_classes2", cls_name)
        if os.path.exists(cls_path):
            with open(cls_path, "r", encoding="utf-8") as f:
                c = f.read()
            c_mod = re.sub(r'invoke-virtual \{[vp0-9]+\}, Lpzj;->f\(\)V', 'nop', c)
            c_mod = re.sub(r'invoke-virtual \{[vp0-9]+\}, Lpco;->a\(\)V', 'nop', c_mod)
            if c_mod != c:
                with open(cls_path, "w", encoding="utf-8") as f:
                    f.write(c_mod)
                print(f"    [+] {cls_name}: Autofocus exposure and tone curve reset calls eliminated.")
            else:
                print(f"    [+] {cls_name}: Autofocus resets already eliminated.")

    # 9. Patch Slider Timeout & UI Dismissal (kfc.smali, lts.smali) so manual EV does not snap back
    kfc_path = os.path.join(APKTOOL_DIR, "smali", "kfc.smali")
    if os.path.exists(kfc_path):
        with open(kfc_path, "r", encoding="utf-8") as f:
            c = f.read()
        target_kfc = """    check-cast p0, Lpzj;

    invoke-virtual {p0}, Lpzj;->f()V

    return-void"""
        repl_kfc = """    check-cast p0, Lpzj;

    nop

    return-void"""
        if target_kfc in c:
            c = c.replace(target_kfc, repl_kfc)
            with open(kfc_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] kfc.smali: Slider timeout reset to auto eliminated.")
        elif "check-cast p0, Lpzj;\n\n    nop\n\n    return-void" in c:
            print("    [+] kfc.smali: Slider timeout reset already eliminated.")

    lts_path = os.path.join(APKTOOL_DIR, "smali", "lts.smali")
    if os.path.exists(lts_path):
        with open(lts_path, "r", encoding="utf-8") as f:
            c = f.read()
        target_lts_k = """    check-cast v0, Lpzj;

    invoke-virtual {v0}, Lpzj;->f()V

    :goto_0"""
        repl_lts_k = """    check-cast v0, Lpzj;

    nop

    :goto_0"""
        if target_lts_k in c:
            c = c.replace(target_lts_k, repl_lts_k)
            with open(lts_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] lts.smali: lts.k() reset eliminated.")
        elif "check-cast v0, Lpzj;\n\n    nop\n\n    :goto_0" in c:
            print("    [+] lts.smali: lts.k() reset already eliminated.")

    # 10. Patch qwh.smali: Connect Bottom Sheet Shadows and Highlights to pco LiveData holders
    qwh_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qwh.smali")
    if os.path.exists(qwh_path):
        with open(qwh_path, "r", encoding="utf-8") as f:
            c = f.read()
        target_qwh = """.method public final l(IFZ)V
    .locals 5

    iget-object v0, p0, Lqwh;->e:Lurt;"""
        repl_qwh = """.method public final l(IFZ)V
    .locals 5

    const/4 v0, 0x1

    if-ne p1, v0, :cond_check_hl

    const/high16 v0, 0x3f800000    # 1.0f

    add-float v1, p2, v0

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v1, v0

    const/4 v0, 0x0

    cmpg-float v2, v1, v0

    if-gez v2, :cond_clamp_s_min

    move v1, v0

    :cond_clamp_s_min
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v2, v1, v0

    if-lez v2, :cond_clamp_s_max

    move v1, v0

    :cond_clamp_s_max
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v1, p0, Lqwh;->g:Lpco;

    iget-object v2, v1, Lpco;->d:Lusf;

    invoke-interface {v2, v0}, Lusf;->a(Ljava/lang/Object;)V

    iget-object v1, v1, Lpco;->g:Lusf;

    invoke-interface {v1, v0}, Lusf;->a(Ljava/lang/Object;)V

    goto :cond_qwh_hook_done

    :cond_check_hl
    const/4 v0, 0x2

    if-ne p1, v0, :cond_qwh_hook_done

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v1, p0, Lqwh;->g:Lpco;

    iget-object v1, v1, Lpco;->e:Lusf;

    invoke-interface {v1, v0}, Lusf;->a(Ljava/lang/Object;)V

    :cond_qwh_hook_done
    iget-object v0, p0, Lqwh;->e:Lurt;"""
        if target_qwh in c:
            c = c.replace(target_qwh, repl_qwh, 1)
            with open(qwh_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] qwh.smali: Shadows and Highlights connected to pco pipeline.")
        elif ":cond_qwh_hook_done" in c:
            print("    [+] qwh.smali: Shadows and Highlights already connected.")

    # 11. Ensure pzq.smali preserves standard pzq.c initialization (twilight mode disabled by default)
    pzq_path = os.path.join(APKTOOL_DIR, "smali", "pzq.smali")
    if os.path.exists(pzq_path):
        with open(pzq_path, "r", encoding="utf-8") as f:
            c = f.read()
        forced_pzq = """    sget-object p4, Lkpf;->f:Lkps;

    invoke-virtual {p2, p4}, Lksf;->q(Lkps;)Z

    const/4 p4, 0x1

    iput-boolean p4, p0, Lpzq;->c:Z"""
        orig_pzq = """    sget-object p4, Lkpf;->f:Lkps;

    invoke-virtual {p2, p4}, Lksf;->q(Lkps;)Z

    move-result p4

    iput-boolean p4, p0, Lpzq;->c:Z"""
        if forced_pzq in c:
            c = c.replace(forced_pzq, orig_pzq)
            with open(pzq_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] pzq.smali: pzq.c restored to feature flag (twilight AE bias eliminated).")
        else:
            print("    [+] pzq.smali: standard pzq.c preserved.")


patch_mzc_smali = patch_brightness_shadows_controllers

def patch_pro_controls_live():
    """Remove ISO/Shutter/Focus drag suppression for live response."""
    print("[*] Patching Pro Controls for live viewfinder response...")

    # 2. qaa.smali (ISO): Remove dragging suppression
    qaa_path = os.path.join(APKTOOL_DIR, "smali", "qaa.smali")
    if os.path.exists(qaa_path):
        with open(qaa_path, "r", encoding="utf-8") as f:
            c = f.read()
        target = """.method public final v(IZLsnw;)V
    .locals 2

    if-nez p2, :cond_0

    return-void

    :cond_0"""
        repl = """.method public final v(IZLsnw;)V
    .locals 2

    :cond_0"""
        if target in c:
            c = c.replace(target, repl, 1)
            with open(qaa_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] qaa.smali (ISO): Removed dragging suppression (live ISO enabled)")
        else:
            print("    [+] qaa.smali (ISO): already patched")

    # 3. qbb.smali (Shutter Speed): Remove dragging suppression
    qbb_path = os.path.join(APKTOOL_DIR, "smali", "qbb.smali")
    if os.path.exists(qbb_path):
        with open(qbb_path, "r", encoding="utf-8") as f:
            c = f.read()
        target = """.method public final v(JZLsnw;)V
    .locals 1

    if-nez p3, :cond_0

    return-void

    :cond_0"""
        repl = """.method public final v(JZLsnw;)V
    .locals 1

    :cond_0"""
        if target in c:
            c = c.replace(target, repl, 1)
            with open(qbb_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] qbb.smali (Shutter Speed): Removed dragging suppression (live Shutter enabled)")
        else:
            print("    [+] qbb.smali (Shutter Speed): already patched")

    # 4. nrn.smali (Manual Focus): Remove dragging suppression
    nrn_path = os.path.join(APKTOOL_DIR, "smali", "nrn.smali")
    if os.path.exists(nrn_path):
        with open(nrn_path, "r", encoding="utf-8") as f:
            c = f.read()
        target = """.method public final t(FZLsnw;)V
    .locals 4

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0"""
        repl = """.method public final t(FZLsnw;)V
    .locals 4

    :cond_0"""
        if target in c:
            c = c.replace(target, repl, 1)
            with open(nrn_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] nrn.smali (Focus): Removed dragging suppression (live Focus enabled)")
        else:
            print("    [+] nrn.smali (Focus): already patched")

    # 5. wqz.smali (Manual White Balance / Temperature): Unblock wqz.J to unconditionally return Ling.b()
    wqz_path = os.path.join(APKTOOL_DIR, "smali", "wqz.smali")
    if os.path.exists(wqz_path):
        with open(wqz_path, "r", encoding="utf-8") as f:
            c = f.read()
        target = """.method public static synthetic J(Laeea;Lksf;)Lxwg;
    .locals 1

    sget-object v0, Lkld;->a:Lkps;

    invoke-virtual {p1, v0}, Lksf;->q(Lkps;)Z

    move-result p1

    if-eqz p1, :cond_0

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0
.end method"""
        repl = """.method public static synthetic J(Laeea;Lksf;)Lxwg;
    .locals 0

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0
.end method"""
        if target in c:
            c = c.replace(target, repl, 1)
            with open(wqz_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] wqz.smali: Unblocked wqz.J for Manual White Balance / Temperature slider")
        else:
            print("    [+] wqz.smali: already patched or target not found")

    # 6. odr.smali (Manual White Balance HAL Dispatch): Null-guard tdn.a and tdn.b
    odr_path = os.path.join(APKTOOL_DIR, "smali", "odr.smali")
    if os.path.exists(odr_path):
        with open(odr_path, "r", encoding="utf-8") as f:
            c = f.read()
        target = """    packed-switch v0, :pswitch_data_0

    check-cast p1, Lpqg;

    iget v0, p1, Lpqg;->a:I

    sget-object v1, Ltdn;->a:Landroid/hardware/camera2/CaptureRequest$Key;"""
        repl = """    packed-switch v0, :pswitch_data_0

    check-cast p1, Lpqg;

    sget-object v1, Ltdn;->a:Landroid/hardware/camera2/CaptureRequest$Key;

    if-eqz v1, :cond_skip_wb

    sget-object v0, Ltdn;->b:Landroid/hardware/camera2/CaptureRequest$Key;

    if-eqz v0, :cond_skip_wb

    iget v0, p1, Lpqg;->a:I"""
        if target in c and ":cond_skip_wb" not in c:
            c = c.replace(target, repl, 1)
            c = c.replace("invoke-interface {p0, p1}, Luoi;->t(Ljava/util/Set;)V\n\n    return-void\n\n    :pswitch_0",
                          "invoke-interface {p0, p1}, Luoi;->t(Ljava/util/Set;)V\n\n    :cond_skip_wb\n    return-void\n\n    :pswitch_0", 1)
            with open(odr_path, "w", encoding="utf-8") as f:
                f.write(c)
            print("    [+] odr.smali: Null-guarded tdn.a and tdn.b in manual AWB dispatch")
        else:
            print("    [+] odr.smali: already patched or target not found")

def patch_sauce_onboarding():
    print("[*] Patching Sauce Onboarding & Pixel Looks Tutorial...")

    # 1. Patch qvw.smali (was qlr): Force qvw.d = true so "Choose a Camera Look" preference is created
    qvw_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qvw.smali")
    if os.path.exists(qvw_path):
        with open(qvw_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = "iput-boolean p1, p0, Lqvw;->d:Z"
        replacement = "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lqvw;->d:Z"
        if target in content and "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lqvw;->d:Z" not in content:
            content = content.replace(target, replacement, 1)
            with open(qvw_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] qvw.smali: Forced qvw.d = true (unlocking 'Choose a Camera Look' preference).")
        elif "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lqvw;->d:Z" in content:
            print("    [+] qvw.smali: already patched.")
        else:
            print("    [!] Warning: qvw.smali target not found.")

    # 2. Patch rxh.smali (was rmn): Force rxh.p = true so device eligibility check passes in first-run getting-started flow
    rxh_path = os.path.join(APKTOOL_DIR, "smali", "rxh.smali")
    if os.path.exists(rxh_path):
        with open(rxh_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = "iput-boolean p1, p0, Lrxh;->p:Z"
        replacement = "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lrxh;->p:Z"
        if target in content and "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lrxh;->p:Z" not in content:
            content = content.replace(target, replacement, 1)
            with open(rxh_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] rxh.smali: Forced rxh.p = true (enabling onboarding prompt).")
        elif "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lrxh;->p:Z" in content:
            print("    [+] rxh.smali: already patched.")
        else:
            print("    [!] Warning: rxh.smali target not found.")

    # 3. Patch isu.smali: Hook Camera Looks '?' help button (:pswitch_2) to launch SauceOnboarding (qls) directly
    isu_path = os.path.join(APKTOOL_DIR, "smali", "isu.smali")
    if os.path.exists(isu_path):
        with open(isu_path, "r", encoding="utf-8") as f:
            content = f.read()
        old_pswitch = """:pswitch_2
    new-instance p1, Landroid/content/Intent;

    const-string v0, "https://g.co/pixeltips/tips_camera_looks"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lizl;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void"""

        new_pswitch = """:pswitch_2
    iget-object p1, p0, Lizl;->a:Ljava/lang/Object;

    instance-of v0, p1, Lbe;

    if-eqz v0, :cond_orig_tips

    check-cast p1, Lbe;

    invoke-virtual {p1}, Lbe;->gt()Lbx;

    move-result-object v0

    if-eqz v0, :cond_orig_tips

    new-instance p1, Lqls;

    invoke-direct {p1}, Lqls;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "initial_sauce_type"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p1, v1}, Lbb;->X(Landroid/os/Bundle;)V

    const-string v1, "SauceOnboarding"

    invoke-virtual {p1, v0, v1}, Lar;->m(Lbx;Ljava/lang/String;)V

    return-void

    :cond_orig_tips
    new-instance p1, Landroid/content/Intent;

    const-string v0, "https://g.co/pixeltips/tips_camera_looks"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lizl;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void"""

        if old_pswitch in content:
            content = content.replace(old_pswitch, new_pswitch, 1)
            with open(isu_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] isu.smali: Hooked Camera Looks '?' help button to launch SauceOnboarding (qls) directly.")
        elif "SauceOnboarding" in content:
            print("    [+] isu.smali: already patched.")
        else:
            print("    [!] Warning: isu.smali target not found.")

def patch_creator_suite_smali():
    print("[*] Patching Creator Suite (Granite, Biotite, Mica, Slate, Basalt, Project Album)...")
    # 1. kow.smali (was kid.smali)
    kow_path = os.path.join(APKTOOL_DIR, "smali", "kow.smali")
    if os.path.exists(kow_path):
        with open(kow_path, "r", encoding="utf-8") as f:
            content = f.read()

        def replace_static_method(src, name):
            m_start = src.find(f".method public static final {name}(Lksf;)Z")
            if m_start == -1:
                return src
            m_end = src.find(".end method", m_start) + len(".end method")
            new_m = f""".method public static final {name}(Lksf;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""
            return src[:m_start] + new_m + src[m_end:]

        for m in ["a", "b", "c", "d", "e", "f", "g"]:
            content = replace_static_method(content, m)

        with open(kow_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] kow.smali: enabled all Creator Suite feature getters (a-g -> true).")

    # 2. kww.smali (was kqc.smali) - Hide and disable "Save to a project" (pa_/pam_) to prevent gRPC errors with Photos
    kww_path = os.path.join(APKTOOL_DIR, "smali", "kww.smali")
    if os.path.exists(kww_path):
        with open(kww_path, "r", encoding="utf-8") as f:
            content = f.read()

        def replace_method(src, decl, body):
            m_start = src.find(decl)
            if m_start == -1:
                return src
            m_end = src.find(".end method", m_start) + len(".end method")
            new_m = f"""{decl}
{body}
.end method"""
            return src[:m_start] + new_m + src[m_end:]

        content = replace_method(content, ".method public final q(Lppk;)Z", "    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0")
        content = replace_method(content, ".method public final u(Lppk;)Z", "    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0")
        content = replace_method(content, ".method public final l(Lppk;)V", "    .locals 0\n\n    return-void")
        content = replace_method(content, ".method public final k(Lppk;)V", "    .locals 0\n\n    return-void")

        with open(kww_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] kww.smali: hid and neutralized 'Save to a project' button (q/u -> false, l/k -> no-op).")

    # 3. ksf.smali (was klm.smali) - Ensure Creator Suite flags intercepted in q(Lkps;)Z and x(Lkps;)Z
    ksf_path = os.path.join(APKTOOL_DIR, "smali_classes2", "ksf.smali")
    if os.path.exists(ksf_path):
        with open(ksf_path, "r", encoding="utf-8") as f:
            content = f.read()

        flags = [
            "camera.enable_granite",
            "camera.enable_biotite",
            "camera.enable_mica",
            "camera.enable_slate",
            "camera.enable_basalt",
            "camera.biotite_auto_scroll",
            "camera.enable_macro_focus_badging",
            "camera.enable_boba_jelly",
            "camera.boba_jelly_eligible",
            "camera.ark_enabled",
            "camera.ark_focus_available",
            "camera.ark_edge_hex",
            "camera.ark_shutter_speed_available",
            "camera.ark_ISO_available",
            "camera.ark_lens_selector_available",
            "camera.ark_lens_selector",
            "camera.crawfish",
            "camera.raw_mode",
            "camera.enable_raw_setting",
        ]

        q_start = content.find(".method public final q(Lkps;)Z")
        if q_start != -1:
            q_end = content.find(".end method", q_start)
            q_body = content[q_start:q_end]
            if "camera.enable_granite" not in q_body:
                chain = ""
                for idx, flag in enumerate(flags):
                    next_label = f"cond_check_creator_{idx+1}" if idx+1 < len(flags) else "cond_check_orig"
                    chain += f"""    const-string v1, "{flag}"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :{next_label}

    const/4 v0, 0x1

    return v0

    :{next_label}
"""
                target_marker = "iget-object v0, p0, Lksf;->b:Ljava/util/Map;"
                t_idx = content.find(target_marker, q_start)
                if t_idx != -1 and t_idx < q_end:
                    content = content[:t_idx] + chain + content[t_idx:]

        x_start = content.find(".method public final x(Lkps;)Z")
        if x_start != -1:
            x_end = content.find(".end method", x_start)
            x_body = content[x_start:x_end]
            if "camera.lasagna" not in x_body:
                chain = ""
                for idx, flag in enumerate(flags):
                    next_label = f"cond_check_creator_x_{idx+1}" if idx+1 < len(flags) else "cond_check_orig_x"
                    chain += f"""    const-string v1, "{flag}"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :{next_label}

    const/4 v0, 0x1

    return v0

    :{next_label}
"""
                new_x = f""".method public final x(Lkps;)Z
    .locals 3

    if-eqz p1, :cond_check_orig_x

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_x

    const-string v1, "camera.lasagna"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_0

    const/4 v0, 0x0

    return v0

    :cond_check_creator_x_0
{chain}"""
                target_marker_x = "iget-object p0, p0, Lksf;->b:Ljava/util/Map;"
                t_idx_x = content.find(target_marker_x, x_start)
                if t_idx_x != -1 and t_idx_x < x_end:
                    content = content[:x_start] + new_x + content[t_idx_x:]

        with open(ksf_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] ksf.smali: Creator Suite flags intercepted in q(Lkps;) and x(Lkps;).")

def patch_sof_smali():
    print("[*] Patching sof.smali (Mode change hook for Looks scoping, was sdo)...")
    sof_path = os.path.join(APKTOOL_DIR, "smali", "sof.smali")
    if not os.path.exists(sof_path):
        print("    [!] Warning: sof.smali not found.")
        return
    with open(sof_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Hook sof.P(Ltbp;)V — the mode setter method
    target = """.method private final P(Ltbp;)V
    .locals 4

    iget-object v0, p0, Lsof;->f:Ltbp;

    iput-object v0, p0, Lsof;->x:Ltbp;

    iput-object p1, p0, Lsof;->f:Ltbp;"""

    replacement = """.method private final P(Ltbp;)V
    .locals 4

    iget-object v0, p0, Lsof;->f:Ltbp;

    iput-object v0, p0, Lsof;->x:Ltbp;

    iput-object p1, p0, Lsof;->f:Ltbp;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V"""

    if target in content:
        content = content.replace(target, replacement)
        with open(sof_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] sof.smali: Mode change hook injected for TomteInitHelper.")
    elif "setCurrentMode" in content:
        print("    [+] sof.smali: already patched with setCurrentMode.")
    else:
        print("    [!] Warning: sof.smali target block not found.")

def patch_izk_smali():
    print("[*] Patching izk.smali (Unlocking Camera Looks and Quick Access across all photo modes, was isk)...")
    izk_path = os.path.join(APKTOOL_DIR, "smali", "izk.smali")
    if not os.path.exists(izk_path):
        print("    [!] Warning: izk.smali not found.")
        return
    with open(izk_path, "r", encoding="utf-8") as f:
        content = f.read()
    m_start = content.find(".method public final a(Ltbp;)Z")
    if m_start != -1:
        m_end = content.find(".end method", m_start) + len(".end method")
        new_m = """.method public final a(Ltbp;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""
        content = content[:m_start] + new_m + content[m_end:]

    b_start = content.find(".method public final b(Ltbp;)Z")
    if b_start != -1:
        b_end = content.find(".end method", b_start) + len(".end method")
        new_b = """.method public final b(Ltbp;)Z
    .locals 0

    sget-object p0, Ltbp;->h:Ltbp;

    if-eq p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method"""
        content = content[:b_start] + new_b + content[b_end:]

    with open(izk_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] izk.smali: a() and b() patched successfully.")

def patch_dual_exposure_viewfinder():
    print("[*] Patching Dual Exposure & Shadows sliders for viewfinder (nzx, nzr, nia)...")
    
    # 1. Patch nzx.smali: Make a()Z return true unconditionally (isDisplayable)
    nzx_path = os.path.join(APKTOOL_DIR, "smali", "nzx.smali")
    if os.path.exists(nzx_path):
        with open(nzx_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = """.method public final a()Z
    .locals 1

    sget-object v0, Lnzx;->d:Lnzx;

    invoke-virtual {p0, v0}, Lnzx;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnzx;->e:Lnzx;

    invoke-virtual {p0, v0}, Lnzx;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method"""
        replacement = """.method public final a()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""
        if target in content:
            content = content.replace(target, replacement)
            with open(nzx_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] nzx.smali: a() patched to return true (displayable on viewfinder).")
        elif "const/4 v0, 0x1\n\n    return v0\n.end method" in content:
            print("    [+] nzx.smali: a() already patched.")
        else:
            print("    [!] Warning: nzx.smali target not found.")

    # 2. Patch nzr.smali: G(Lnzx;)Z bypass for DUAL_EXPOSURE, SINGLE_EXPOSURE, WHITEBALANCE, TOMTE
    nzr_path = os.path.join(APKTOOL_DIR, "smali", "nzr.smali")
    if os.path.exists(nzr_path):
        with open(nzr_path, "r", encoding="utf-8") as f:
            content = f.read()
        target_g = """.method public final declared-synchronized G(Lnzx;)Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnzr;->k:Loba;

    invoke-virtual {v0, p1}, Loba;->n(Lnzx;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1"""
        replacement_g = """.method public final declared-synchronized G(Lnzx;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnzx;->a:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->b:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->c:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->j:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->k:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->l:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->m:Lnzx;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnzx;->n:Lnzx;

    if-ne p1, v0, :cond_check_orig

    :cond_ret_true
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_check_orig
    iget-object v0, p0, Lnzr;->k:Loba;

    invoke-virtual {v0, p1}, Loba;->n(Lnzx;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1"""
        if target_g in content:
            content = content.replace(target_g, replacement_g)
            print("    [+] nzr.smali: G(Lnzx;)Z hooked for EXPOSURE, WB, and TOMTE.")
        elif "sget-object v0, Lnzx;->j:Lnzx;" not in content and "sget-object v0, Lnzx;->c:Lnzx;" in content:
            content = content.replace("sget-object v0, Lnzx;->c:Lnzx;\n\n    if-ne p1, v0, :cond_check_orig",
                                      "sget-object v0, Lnzx;->c:Lnzx;\n\n    if-eq p1, v0, :cond_ret_true\n\n    sget-object v0, Lnzx;->j:Lnzx;\n\n    if-eq p1, v0, :cond_ret_true\n\n    sget-object v0, Lnzx;->k:Lnzx;\n\n    if-eq p1, v0, :cond_ret_true\n\n    sget-object v0, Lnzx;->l:Lnzx;\n\n    if-eq p1, v0, :cond_ret_true\n\n    sget-object v0, Lnzx;->m:Lnzx;\n\n    if-eq p1, v0, :cond_ret_true\n\n    sget-object v0, Lnzx;->n:Lnzx;\n\n    if-ne p1, v0, :cond_check_orig")
            print("    [+] nzr.smali: G(Lnzx;)Z updated with TOMTE controls.")
        elif "cond_ret_true" in content:
            print("    [+] nzr.smali: G(Lnzx;)Z already hooked.")

        # Also patch nzr.smali: e(Llsx;)V to support both DUAL and DUAL_INDEPENDENT
        target_e = """    sget-object v1, Llsx;->c:Llsx;

    invoke-virtual {p1, v1}, Llsx;->equals(Ljava/lang/Object;)Z

    move-result p1

    sget-object v1, Lnzx;->b:Lnzx;

    invoke-virtual {p0, v1, v0}, Lnzr;->v(Lnzx;Z)V

    sget-object v0, Lnzx;->a:Lnzx;

    invoke-virtual {p0, v0, p1}, Lnzr;->v(Lnzx;Z)V"""

        replacement_e = """    sget-object v1, Llsx;->c:Llsx;

    invoke-virtual {p1, v1}, Llsx;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_dual_mode

    sget-object v1, Llsx;->b:Llsx;

    invoke-virtual {p1, v1}, Llsx;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_not_dual_mode

    :cond_dual_mode
    const/4 p1, 0x1

    goto :goto_dual_mode

    :cond_not_dual_mode
    const/4 p1, 0x0

    :goto_dual_mode
    sget-object v1, Lnzx;->b:Lnzx;

    invoke-virtual {p0, v1, v0}, Lnzr;->v(Lnzx;Z)V

    sget-object v0, Lnzx;->a:Lnzx;

    invoke-virtual {p0, v0, p1}, Lnzr;->v(Lnzx;Z)V"""

        if target_e in content:
            content = content.replace(target_e, replacement_e)
            print("    [+] nzr.smali: e(Llsx;)V updated to enable dual sliders on DUAL and DUAL_INDEPENDENT.")
        elif "goto_dual_mode" in content:
            print("    [+] nzr.smali: e(Llsx;)V already updated.")

        with open(nzr_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 3. Patch nia.smali: Force dual exposure sliders (brightness_control & shadow_control)
    nia_path = os.path.join(APKTOOL_DIR, "smali", "nia.smali")
    if os.path.exists(nia_path):
        with open(nia_path, "r", encoding="utf-8") as f:
            content = f.read()

        target_nia = """    sget-object v3, Lkpf;->f:Lkps;

    invoke-virtual {v1, v3}, Lksf;->q(Lkps;)Z

    move-result v3

    const v10, 0x7f13049c"""

        replacement_nia = """    sget-object v3, Lkpf;->f:Lkps;

    invoke-virtual {v1, v3}, Lksf;->q(Lkps;)Z

    const/4 v3, 0x1

    const v10, 0x7f13049c"""

        if target_nia in content:
            content = content.replace(target_nia, replacement_nia)
            with open(nia_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] nia.smali: Dual exposure branch forced (Brightness and Shadows registered).")
        elif "const/4 v3, 0x1\\n\\n    const v10, 0x7f13049c" in content:
            print("    [+] nia.smali: Dual exposure branch already forced.")
        else:
            print("    [!] Warning: nia.smali target not found.")

def patch_dual_ev_ctrl_and_slider_sync():
    print("[*] Patching DualEvCtrl (ptm, pzj) and Slider Sync (lts) for full dynamic exposure range & sync...")
    
    # 1. ptm.smali: Force ptm.g = false so DualEvCtrl connects to Camera2 HAL request pipeline
    ptm_path = os.path.join(APKTOOL_DIR, "smali", "ptm.smali")
    if os.path.exists(ptm_path):
        with open(ptm_path, "r", encoding="utf-8") as f:
            content = f.read()
        target_ptm = """    invoke-virtual {p6, p1}, Lksf;->q(Lkps;)Z

    move-result p1

    iput-boolean p1, p0, Lptm;->g:Z"""
        replacement_ptm = """    invoke-virtual {p6, p1}, Lksf;->q(Lkps;)Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lptm;->g:Z"""
        if target_ptm in content:
            content = content.replace(target_ptm, replacement_ptm)
            with open(ptm_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] ptm.smali: ptm.g forced to false (DualEvCtrl enabled).")
        elif "const/4 p1, 0x0\\n\\n    iput-boolean p1, p0, Lptm;->g:Z" in content:
            print("    [+] ptm.smali: already patched.")
        else:
            print("    [!] Warning: ptm.smali target not found.")

    # 2. pzj.smali: Linear shadow exponent (1.0f), forced i()Z return true, and g()V unconditional set
    pzj_path = os.path.join(APKTOOL_DIR, "smali", "pzj.smali")
    if os.path.exists(pzj_path):
        with open(pzj_path, "r", encoding="utf-8") as f:
            content = f.read()
        
        # 2a. Linear shadow exponent r = 1.0f in pzj.n
        target_r = """    iget p1, p0, Lpzj;->i:F

    invoke-static {p1, p3, p2}, Lyzu;->bn(FFF)F

    move-result p1

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->log(D)D

    move-result-wide p1

    div-double/2addr v0, p1

    double-to-float p1, v0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lpzj;->r:Ljava/lang/Float;"""
        repl_r = """    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lpzj;->r:Ljava/lang/Float;"""
        if target_r in content:
            content = content.replace(target_r, repl_r)
            print("    [+] pzj.smali: Linear shadow exponent (1.0f) injected.")
        elif "const/high16 p1, 0x3f800000" in content:
            print("    [+] pzj.smali: shadow exponent already linearized.")

        # Ensure field f in pzj.smali is public
        content = content.replace(".field private final f:Lpco;", ".field public final f:Lpco;")

        # 2b. pzj.i()Z return true
        target_i = """.method public final declared-synchronized i()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lpzj;->t:Lurt;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lurt;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpzm;

    iget-boolean v0, v0, Lpzm;->a:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lpzj;->t:Lurt;

    invoke-interface {v0}, Lurt;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpzm;

    iget-boolean v0, v0, Lpzm;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :cond_0
    monitor-exit p0

    const/4 p0, 0x0

    return p0
.end method"""
        replacement_i = """.method public final declared-synchronized i()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""
        if target_i in content:
            content = content.replace(target_i, replacement_i)
            print("    [+] pzj.smali: i()Z forced to return true.")
        elif ".method public final declared-synchronized i()Z\\n    .locals 1\\n\\n    const/4 v0, 0x1\\n\\n    return v0\\n.end method" in content:
            print("    [+] pzj.smali: i()Z already returns true.")

        # 2c. pzj.g()V remove goto bypass
        target_g = """    iget-boolean v0, p0, Lpzj;->e:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0"""
        replacement_g = """    nop

    nop

    nop

    :cond_0"""
        if target_g in content:
            content = content.replace(target_g, replacement_g)
            print("    [+] pzj.smali: g()V early exit bypassed.")
        elif "nop\\n\\n    nop\\n\\n    nop\\n\\n    :cond_0" in content:
            print("    [+] pzj.smali: g()V already patched.")

        # 2d. pzj.a(FF)Lpzi: normalize p1, p2 < 0.0f to 0.5f neutral baseline
        target_a_norm = """    invoke-static {p1}, Lpzj;->p(F)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {p2}, Lpzj;->p(F)Z

    move-result v1

    if-eqz v1, :cond_7"""
        repl_a_norm = """    invoke-static {p1}, Lpzj;->p(F)Z

    move-result v1

    if-nez v1, :cond_p1_ok

    const/high16 p1, 0x3f000000    # 0.5f

    :cond_p1_ok
    invoke-static {p2}, Lpzj;->p(F)Z

    move-result v1

    if-nez v1, :cond_p2_ok

    const/high16 p2, 0x3f000000    # 0.5f

    :cond_p2_ok"""
        if target_a_norm in content:
            content = content.replace(target_a_norm, repl_a_norm)
            print("    [+] pzj.smali: p1 & p2 input normalization to 0.5f injected.")
        elif ":cond_p1_ok" in content:
            print("    [+] pzj.smali: p1 & p2 input normalization already injected.")

        # 2d_fallback. pzj.s (Lvgr;) null fallback
        target_vgr = """    iget-object v0, p0, Lpzj;->s:Lvgr;

    if-eqz v0, :cond_7"""
        repl_vgr = """    iget-object v0, p0, Lpzj;->s:Lvgr;

    if-nez v0, :cond_vgr_ok

    const v0, 0x3e2aaaab    # 0.16666667f

    const/high16 v1, -0x40000000    # -2.0f

    const/high16 v2, 0x40000000    # 2.0f

    goto :cond_vgr_done

    :cond_vgr_ok"""
        if target_vgr in content:
            content = content.replace(target_vgr, repl_vgr)
            content = content.replace("mul-float/2addr v2, v0\\n\\n    iget-object v3, p0, Lpzj;->o:Ljava/lang/Float;",
                                      "mul-float/2addr v2, v0\\n\\n    :cond_vgr_done\\n    iget-object v3, p0, Lpzj;->o:Ljava/lang/Float;")
            print("    [+] pzj.smali: Lvgr fallback injected for Dual EV when vgr is null.")
        elif ":cond_vgr_done" in content:
            print("    [+] pzj.smali: Lvgr fallback already injected.")

        # 2e. pzj.a(FF)Lpzi: force dual-EV branch goto :cond_2
        target_a_single = """    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    if-eqz p1, :cond_2"""
        repl_a_single = """    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    goto :cond_2"""
        if target_a_single in content:
            content = content.replace(target_a_single, repl_a_single)
            print("    [+] pzj.smali: forced dual-EV branch goto :cond_2.")
        elif "goto :cond_2" in content:
            print("    [+] pzj.smali: dual-EV branch already forced.")

        # 2f. pzj.a(FF)Lpzi: remove 0 EV corruption to -1
        target_a_ev0 = """    if-nez p2, :cond_3

    const/4 p2, -0x1

    :cond_3
    move v6, p2"""
        repl_a_ev0 = """    move v6, p2"""
        if target_a_ev0 in content:
            content = content.replace(target_a_ev0, repl_a_ev0)
            print("    [+] pzj.smali: removed 0 EV corruption to -1.")

        # 2g. pzj.a(FF)Lpzi: bypass u.get() early exit to ensure sliders always compute dual EV
        target_a_u = """    iget-object v0, p0, Lpzj;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2"""
        if target_a_u in content:
            content = content.replace(target_a_u, "")
            print("    [+] pzj.smali: u check bypassed in a(FF).")

        # 2h. pzj.a(FF)Lpzi: preserve clean sensor baseline initialization on startup/resume
        fake_a_null = """    iget-object v3, p0, Lpzj;->o:Ljava/lang/Float;

    if-nez v3, :cond_1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, p0, Lpzj;->m:Ljava/lang/Float;

    iput-object v3, p0, Lpzj;->n:Ljava/lang/Float;

    iput-object v3, p0, Lpzj;->o:Ljava/lang/Float;

    iput-object v3, p0, Lpzj;->p:Ljava/lang/Float;

    iput-object v3, p0, Lpzj;->q:Ljava/lang/Float;

    iput-object v3, p0, Lpzj;->r:Ljava/lang/Float;"""
        clean_a_null = """    iget-object v3, p0, Lpzj;->o:Ljava/lang/Float;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lpzj;->p:Ljava/lang/Float;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lpzj;->q:Ljava/lang/Float;

    if-nez v3, :cond_1

    goto/16 :goto_0"""
        if fake_a_null in content:
            content = content.replace(fake_a_null, clean_a_null)
            print("    [+] pzj.smali: clean sensor baseline initialization restored.")
        else:
            print("    [+] pzj.smali: clean sensor baseline initialization preserved.")

        with open(pzj_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 3. lts.smali: Modulo-2 enum mapping & dual slider synchronization
    lts_path = os.path.join(APKTOOL_DIR, "smali", "lts.smali")
    if os.path.exists(lts_path):
        with open(lts_path, "r", encoding="utf-8") as f:
            content = f.read()

        # 3a. rem-int/lit8 v0, v0, 0x2
        target_ordinal = """:cond_3
    invoke-virtual {p2}, Llsz;->ordinal()I

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f"""
        replacement_ordinal = """:cond_3
    invoke-virtual {p2}, Llsz;->ordinal()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    const/high16 v1, -0x40800000    # -1.0f"""
        if target_ordinal in content:
            content = content.replace(target_ordinal, replacement_ordinal)
            print("    [+] lts.smali: rem-int/lit8 v0, v0, 0x2 injected.")
        elif "rem-int/lit8 v0, v0, 0x2" in content:
            print("    [+] lts.smali: ordinal already modulo-2 mapped.")

        # Reset baseline in h()
        target_lts_reset = """    iget-object v2, p0, Llts;->v:Lusf;

    const/high16 v3, -0x40800000    # -1.0f"""
        repl_lts_reset = """    iget-object v2, p0, Llts;->v:Lusf;

    const/high16 v3, 0x3f000000    # 0.5f"""
        if target_lts_reset in content:
            content = content.replace(target_lts_reset, repl_lts_reset)
            print("    [+] lts.smali: Reset baseline set to 0.5f.")

        # 3b. Sync in :cond_6 (Shadow knob)
        target_c6 = """    invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V

    iget-object p1, p0, Llts;->v:Lusf;"""
        replacement_c6 = """    invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Llts;->f:Lusf;

    invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V

    iget-object p1, p0, Llts;->v:Lusf;"""
        if target_c6 in content and "iget-object v0, p0, Llts;->f:Lusf;" not in content:
            content = content.replace(target_c6, replacement_c6)
            print("    [+] lts.smali: :cond_6 updated with Twilight EVC sync.")

        target_c6_uninit = """    invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_7"""
        replacement_c6_uninit = """    invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V

    iget-object p1, p0, Llts;->g:Lusf;

    invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_7"""
        if target_c6_uninit in content and "iget-object p1, p0, Llts;->g:Lusf;" not in content:
            content = content.replace(target_c6_uninit, replacement_c6_uninit)
            print("    [+] lts.smali: :cond_6 updated with Twilight Brightness sync.")

        # 3c. Sync in :cond_7 (Brightness knob)
        target_c7 = """    invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V

    iget-object p1, p0, Llts;->w:Lusf;"""
        replacement_c7 = """    invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Llts;->g:Lusf;

    invoke-interface {v0, p1}, Lusf;->a(Ljava/lang/Object;)V

    iget-object p1, p0, Llts;->w:Lusf;"""
        if target_c7 in content and replacement_c7 not in content:
            content = content.replace(target_c7, replacement_c7)
            print("    [+] lts.smali: :cond_7 updated with Twilight Brightness sync.")

        target_c7_uninit = """    invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V

    :cond_8"""
        replacement_c7_uninit = """    invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V

    iget-object p1, p0, Llts;->f:Lusf;

    invoke-interface {p1, v0}, Lusf;->a(Ljava/lang/Object;)V

    :cond_8"""
        if target_c7_uninit in content and replacement_c7_uninit not in content:
            content = content.replace(target_c7_uninit, replacement_c7_uninit)
            print("    [+] lts.smali: :cond_7 updated with Twilight EVC sync.")

        target_single = """    invoke-direct {p0}, Llts;->i()Z

    move-result p2

    if-eqz p2, :cond_2"""
        repl_single = """    goto :cond_2"""
        if target_single in content:
            content = content.replace(target_single, repl_single)
            print("    [+] lts.smali: single slider forced to :cond_2 (Video AE compensation enabled).")

        with open(lts_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 4. poo.smali (11.1) & pfh.smali (11.0): Unblock Camera2 AE compensation dispatch for Video mode
    for rel_p in [os.path.join("smali_classes2", "poo.smali"), os.path.join("smali_classes2", "pfh.smali")]:
        p_path = os.path.join(APKTOOL_DIR, rel_p)
        if os.path.exists(p_path):
            with open(p_path, "r", encoding="utf-8") as f:
                c = f.read()

            target_poo = """    iget-object v0, p0, Lptm;->d:Lpzj;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {v0}, Lpzj;->i()Z

    move-result v0

    if-eqz v0, :cond_4

    goto/16 :goto_2

    :cond_4
    iget-object p0, p0, Lptm;->b:Lvae;"""
            repl_poo = """    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_skip_poo

    iget-object p0, p0, Lptm;->b:Lvae;"""
            if target_poo in c:
                c = c.replace(target_poo, repl_poo)
                c = c.replace("    invoke-interface {p0, p1}, Lvae;->r(Lvaz;)V\n\n    return-void",
                              "    invoke-interface {p0, p1}, Lvae;->r(Lvaz;)V\n\n    :cond_skip_poo\n    return-void")
                print(f"    [+] {rel_p}: AE compensation dispatch unblocked (Video mode enabled).")

            target_pfh = """    iget-object v0, p0, Lpjo;->d:Lppn;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {v0}, Lppn;->i()Z

    move-result v0

    if-eqz v0, :cond_5

    goto/16 :goto_3

    :cond_5
    iget-object p0, p0, Lpjo;->b:Luoi;"""
            repl_pfh = """    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_skip_pfh

    iget-object p0, p0, Lpjo;->b:Luoi;"""
            if target_pfh in c:
                c = c.replace(target_pfh, repl_pfh)
                c = c.replace("    invoke-interface {p0, p1}, Luoi;->r(Lupd;)V\n\n    return-void",
                              "    invoke-interface {p0, p1}, Luoi;->r(Lupd;)V\n\n    :cond_skip_pfh\n    return-void")
                print(f"    [+] {rel_p}: AE compensation dispatch unblocked (Video mode enabled).")

            with open(p_path, "w", encoding="utf-8") as f:
                f.write(c)

    # 5. ksf.smali: Intercept camera.dualev.* to return false
    ksf_path = os.path.join(APKTOOL_DIR, "smali_classes2", "ksf.smali")
    if os.path.exists(ksf_path):
        with open(ksf_path, "r", encoding="utf-8") as f:
            ksf_c = f.read()
        target_dualev = """    if-eqz v0, :cond_check_orig

    const-string v1, "camera.lasagna\""""
        repl_dualev = """    if-eqz v0, :cond_check_orig

    const-string v1, "camera.dualev"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna

    const/4 v0, 0x0

    return v0

    :cond_check_lasagna
    const-string v1, "camera.lasagna\""""
        if target_dualev in ksf_c:
            ksf_c = ksf_c.replace(target_dualev, repl_dualev)
            with open(ksf_path, "w", encoding="utf-8") as f:
                f.write(ksf_c)
            print("    [+] ksf.smali: camera.dualev flags intercepted to return false.")
        elif "camera.dualev" in ksf_c:
            print("    [+] ksf.smali: camera.dualev flags already intercepted.")

def inject_splits():
    print("[*] Injecting dynamic native libraries and neural assets from feature splits...")
    
    # 1. Native libraries from all split modules (arm64-v8a)
    target_lib_dir = os.path.join(APKTOOL_DIR, "lib", "arm64-v8a")
    os.makedirs(target_lib_dir, exist_ok=True)
    for f in os.listdir(os.path.join(ROOT_DIR, "extracted_apkm")):
        if f.endswith(".apk"):
            apk_path = os.path.join(ROOT_DIR, "extracted_apkm", f)
            with zipfile.ZipFile(apk_path, "r") as zf:
                for item in zf.namelist():
                    if item.startswith("lib/arm64-v8a/") and item.endswith(".so"):
                        target_file = os.path.join(target_lib_dir, os.path.basename(item))
                        if not os.path.exists(target_file):
                            print(f"    [+] Extracting {item} -> {target_file}...")
                            with zf.open(item) as src, open(target_file, "wb") as dst:
                                shutil.copyfileobj(src, dst)

    # 2. neural models from split_all_in_feature_module_p26.apk
    split_all_in = os.path.join(ROOT_DIR, "extracted_apkm", "split_all_in_feature_module_p26.apk")
    target_assets_dir = os.path.join(APKTOOL_DIR, "assets")
    os.makedirs(target_assets_dir, exist_ok=True)

    with zipfile.ZipFile(split_all_in, "r") as zf:
        for item in zf.namelist():
            if item.startswith("assets/") and not item.endswith("/"):
                rel_path = item[len("assets/"):]
                out_path = os.path.join(target_assets_dir, rel_path)
                os.makedirs(os.path.dirname(out_path), exist_ok=True)
                if not os.path.exists(out_path):
                    with zf.open(item) as src, open(out_path, "wb") as dst:
                        shutil.copyfileobj(src, dst)

    # 2b. Tomte Film Grain neural model from split_hdrplus_asset_module_p26.apk
    split_hdrplus = os.path.join(ROOT_DIR, "extracted_apkm", "split_hdrplus_asset_module_p26.apk")
    if os.path.exists(split_hdrplus):
        with zipfile.ZipFile(split_hdrplus, "r") as zf:
            for item in zf.namelist():
                if "3cdbac706c98421a96e16fdbfd97a35f" in item:
                    rel_path = item[len("assets/"):] if item.startswith("assets/") else item
                    out_path = os.path.join(target_assets_dir, rel_path)
                    os.makedirs(os.path.dirname(out_path), exist_ok=True)
                    with zf.open(item) as src, open(out_path, "wb") as dst:
                        shutil.copyfileobj(src, dst)
                    print(f"    [+] Injected Tomte grain model -> {out_path}")

    # 3. camera_vkp assets from split_camera_vkp_asset_module.apk
    split_vkp = os.path.join(ROOT_DIR, "extracted_apkm", "split_camera_vkp_asset_module.apk")
    if os.path.exists(split_vkp):
        with zipfile.ZipFile(split_vkp, "r") as zf:
            for item in zf.namelist():
                if item.startswith("assets/") and not item.endswith("/"):
                    rel_path = item[len("assets/"):]
                    out_path = os.path.join(target_assets_dir, rel_path)
                    os.makedirs(os.path.dirname(out_path), exist_ok=True)
                    if not os.path.exists(out_path):
                        with zf.open(item) as src, open(out_path, "wb") as dst:
                            shutil.copyfileobj(src, dst)

    # 3b. Remove Pro Zoom (Centaur) manifest to prevent Google MDD download loop
    centaur_pb = os.path.join(target_assets_dir, "centaur_p26_manifest_config_default_variant.pb")
    if os.path.exists(centaur_pb):
        os.remove(centaur_pb)
        print("    [+] Removed Pro Zoom (Centaur) MDD manifest from assets.")

    # 4. other split modules with assets
    for f in os.listdir(os.path.join(ROOT_DIR, "extracted_apkm")):
        if f.endswith(".apk") and f not in ["split_all_in_feature_module_p26.apk", "split_camera_vkp_asset_module.apk", "split_mdd_zoomplus_manifest_assets_module_p26.apk"]:
            with zipfile.ZipFile(os.path.join(ROOT_DIR, "extracted_apkm", f), "r") as zf:
                for item in zf.namelist():
                    if item.endswith(".tflite.uncompressed") or item.endswith(".binarypb.uncompressed") or item.endswith(".uncompressed") or item.endswith(".tflite") or item.endswith(".fb") or item.endswith(".binarypb") or item.endswith(".pb"):
                        if item.startswith("assets/") and not item.endswith("/"):
                            rel_path = item[len("assets/"):]
                            out_path = os.path.join(target_assets_dir, rel_path)
                            os.makedirs(os.path.dirname(out_path), exist_ok=True)
                            if not os.path.exists(out_path):
                                with zf.open(item) as src, open(out_path, "wb") as dst:
                                    shutil.copyfileobj(src, dst)

    # 5. Dedicated Pixel 8 Pro Portrait neural models from split_portrait_asset_module_p26.apk
    portrait_p26 = os.path.join(ROOT_DIR, "extracted_apkm", "split_portrait_asset_module_p26.apk")
    if os.path.exists(portrait_p26):
        with zipfile.ZipFile(portrait_p26, "r") as zf:
            for item in zf.namelist():
                if item.startswith("assets/") and not item.endswith("/"):
                    rel_path = item[len("assets/"):]
                    out_path = os.path.join(target_assets_dir, rel_path)
                    os.makedirs(os.path.dirname(out_path), exist_ok=True)
                    if not os.path.exists(out_path):
                        with zf.open(item) as src, open(out_path, "wb") as dst:
                            shutil.copyfileobj(src, dst)
        print("    [+] Merged Pixel 8 Pro (P26) portrait models from split_portrait_asset_module_p26.apk.")

    # 5b. Portrait models from extracted_apkm split_portrait_asset_module.apk
    portrait_base = os.path.join(ROOT_DIR, "extracted_apkm", "split_portrait_asset_module.apk")
    if os.path.exists(portrait_base):
        with zipfile.ZipFile(portrait_base, "r") as zf:
            for item in zf.namelist():
                if item.startswith("assets/") and not item.endswith("/"):
                    rel_path = item[len("assets/"):]
                    out_path = os.path.join(target_assets_dir, rel_path)
                    os.makedirs(os.path.dirname(out_path), exist_ok=True)
                    if not os.path.exists(out_path):
                        with zf.open(item) as src, open(out_path, "wb") as dst:
                            shutil.copyfileobj(src, dst)
        print("    [+] Merged base portrait models from split_portrait_asset_module.apk.")

    # 5c. Portrait models from extracted_pixel8pro (split_portrait_asset_module_p23.apk)
    p8p_portrait = os.path.join(ROOT_DIR, "extracted_pixel8pro", "installed_bundle", "split_portrait_asset_module_p23.apk")
    if os.path.exists(p8p_portrait):
        with zipfile.ZipFile(p8p_portrait, "r") as zf:
            for item in zf.namelist():
                if item.startswith("assets/") and not item.endswith("/"):
                    rel_path = item[len("assets/"):]
                    out_path = os.path.join(target_assets_dir, rel_path)
                    os.makedirs(os.path.dirname(out_path), exist_ok=True)
                    if not os.path.exists(out_path):
                        with zf.open(item) as src, open(out_path, "wb") as dst:
                            shutil.copyfileobj(src, dst)
        print("    [+] Merged Pixel 8 Pro portrait assets from split_portrait_asset_module_p23.apk.")

    # 5d. Mirror neural models for Pixel 10 / Pixel 10 Pro (p25 / Buenos) compatibility
    model_mirrors = [
        ("almond-p26-v2-custom_op.tflite.uncompressed", "almond-p25-v2-custom_op.tflite.uncompressed"),
        ("almond-p26-v2-custom_op.tflite.uncompressed", "almond-p24-custom_op-transformed.tflite.uncompressed"),
        ("pecan-p26-custom_op.tflite.uncompressed", "pecan-p25-custom_op.tflite.uncompressed"),
        ("pecan-p26-custom_op.tflite.uncompressed", "pecan-p25-pie-custom_op.tflite.uncompressed"),
        ("pecan-p26-custom_op.tflite.uncompressed", "pecan-p24-pie-custom_op.tflite.uncompressed"),
        ("pecan-p26-custom_op.tflite.uncompressed", "pecan-p26-pie-custom_op.tflite.uncompressed"),
        ("pecan-p26-v2-custom_op.tflite.uncompressed", "pecan-p25-v2-custom_op.tflite.uncompressed"),
        ("pecan-p23-luma-hybrid-custom_op.tflite.uncompressed", "pecan-p25-luma-hybrid-custom_op.tflite.uncompressed"),
        ("walnut-p26-custom_op.tflite.uncompressed", "walnut-p25-custom_op.tflite.uncompressed"),
        ("lancet_alpha_v2-p26.tflite.uncompressed", "lancet_alpha_v2-p25.tflite.uncompressed"),
        ("lancet_alpha_v2-p26.tflite.uncompressed", "lancet_alpha_v2-p24.tflite.uncompressed"),
        ("cyclops_tpu_26.tflite.uncompressed", "cyclops_tpu.tflite.uncompressed"),
        ("cyclops_tpu_26.tflite.uncompressed", "cyclops_tpu_25.tflite.uncompressed"),
        ("avenh-model0-rio.tflite.uncompressed", "avenh-model0-buenos.tflite.uncompressed"),
        ("avenh-model0-rio.tflite.uncompressed", "avenh-model0-janeiro.tflite.uncompressed"),
        ("avenh-model0-rio.tflite.uncompressed", "avenh-model0-abrolhos.tflite.uncompressed"),
        ("deeprestore_face_float32_512x512_v13_rc2_float-graph-custom_op_p23.tflite.uncompressed", "deeprestore_face_float32_512x512_v13_rc2_float-graph-custom_op_p25.tflite.uncompressed"),
        ("deeprestore_face_float32_512x512_v13_rc2_float-graph-custom_op_p23.tflite.uncompressed", "deeprestore_face_float32_512x512_v13_rc2_float-graph-custom_op.tflite.uncompressed"),
        ("siamese_fe_darwinn_custom_op_rio_a0.tflite.uncompressed", "siamese_fe_darwinn_custom_op_buenos_b0.tflite.uncompressed"),
        ("siamese_fe_darwinn_custom_op_rio_a0.tflite.uncompressed", "siamese_fe_darwinn_custom_op_abrolhos_b0.tflite.uncompressed"),
        ("siamese_fe_darwinn_custom_op_rio_a0.tflite.uncompressed", "siamese_fe_darwinn_custom_op_janeiro_a0.tflite.uncompressed"),
        ("siamese_end2end_darwinn_custom_op_rio_a0.tflite.uncompressed", "siamese_end2end_darwinn_custom_op_buenos_b0.tflite.uncompressed"),
        ("siamese_end2end_darwinn_custom_op_rio_a0.tflite.uncompressed", "siamese_end2end_darwinn_custom_op_abrolhos_b0.tflite.uncompressed"),
        ("siamese_end2end_darwinn_custom_op_rio_a0.tflite.uncompressed", "siamese_end2end_darwinn_custom_op_janeiro_a0.tflite.uncompressed"),
        ("fssd_custom-op_tpu_26.tflite.uncompressed", "fssd_custom-op_tpu_25.tflite.uncompressed"),
        ("raid_person_segmenter_from_face_detection_with_occlusions-graph-custom_op_tpu_26.tflite.uncompressed", "raid_person_segmenter_from_face_detection_with_occlusions-graph-custom_op_tpu_25.tflite.uncompressed"),
        ("matting_v2_768_custom-op_tpu_26.tflite.uncompressed", "matting_v2_768_custom-op_tpu_25.tflite.uncompressed"),
        ("raid_foreground_mosaic_512_qat_tpu_26.tflite.uncompressed", "raid_foreground_mosaic_512_qat_tpu_25.tflite.uncompressed"),
        ("shadow_segmenter_finetuned_ptq_Dec2024_batch1-graph-custom_op_26.tflite.uncompressed", "shadow_segmenter_finetuned_ptq_Dec2024_batch1-graph-custom_op_p25.tflite.uncompressed"),
        ("hoi_classifier_256x256_rgb_and_boxes-graph-custom_op_tpu_26.tflite.uncompressed", "hoi_classifier_256x256_rgb_and_boxes-graph-custom_op_tpu_p25.tflite.uncompressed"),
        ("raid_instance_segmenter_with_objects_no_people-graph-custom_op_tpu_26.tflite.uncompressed", "raid_instance_segmenter_with_objects_no_people-graph-custom_op_tpu_p25.tflite.uncompressed"),
        ("mobile_raid_v26_640_qat_u8_attached_objects_trained_no_post-graph-custom_op_tpu_26.tflite.uncompressed", "mobile_raid_v26_640_qat_u8_attached_objects_trained_no_post-graph-custom_op_tpu_p25.tflite.uncompressed"),
        ("mobile_raid_v21_640_qat_u8-graph-custom_op_tpu_26.tflite.uncompressed", "mobile_raid_v21_640_qat_u8-graph-custom_op_tpu_25.tflite.uncompressed"),
        ("movenet_256_26.tflite.uncompressed", "movenet_256_25.tflite.uncompressed"),
        ("midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt-graph-custom_op_tpu_26.tflite.uncompressed", "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt-graph-custom_op_tpu_p25.tflite.uncompressed"),
        ("panoptic_segmenter_61586074_fp16_custom-op_tpu_26_meta.tflite.uncompressed", "panoptic_segmenter_61586074_fp16_custom-op_tpu_25_meta.tflite.uncompressed"),
        ("pssd_large_8bit_v2_300x300-graph-custom_op_tpu_26.tflite.uncompressed", "pssd_large_8bit_v2_300x300-graph-custom_op_tpu_25.tflite.uncompressed"),
        ("motion-custom_op-p23.tflite.uncompressed", "motion-custom_op-v4.tflite.uncompressed"),
        ("saliency-custom_op-p23.tflite.uncompressed", "saliency-custom_op-v4.tflite.uncompressed"),
    ]
    for src_name, dst_name in model_mirrors:
        src_file = os.path.join(target_assets_dir, src_name)
        dst_file = os.path.join(target_assets_dir, dst_name)
        if os.path.exists(src_file) and not os.path.exists(dst_file):
            shutil.copy2(src_file, dst_file)
    print("    [+] Mirrored neural models for Pixel 10 (p25 / Buenos) compatibility.")

    print("    [+] Neural models, calibration tables, and feature assets merged successfully.")

def build_and_sign():
    os.makedirs(BUILD_DIR, exist_ok=True)
    unsigned_apk = os.path.join(BUILD_DIR, "PixelCamera_unsigned.apk")
    aligned_apk = os.path.join(BUILD_DIR, "PixelCamera_aligned.apk")
    signed_apk = os.path.join(BUILD_DIR, "PixelCamera_signed.apk")

    print("[*] Recompiling APK with apktool...")
    apktool_cmd = ["java", "-jar", os.path.join(ROOT_DIR, "tools", "apktool.jar"), "b", APKTOOL_DIR, "-o", unsigned_apk]
    res = subprocess.run(apktool_cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if res.returncode != 0:
        print(f"[-] Apktool build failed:\n{res.stdout}")
        sys.exit(1)
    print("    [+] Apktool build succeeded.")

    print("[*] Aligning APK with zipalign...")
    zipalign_cmd = [ZIPALIGN, "-p", "-f", "4", unsigned_apk, aligned_apk]
    res = subprocess.run(zipalign_cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if res.returncode != 0:
        print(f"[-] zipalign failed:\n{res.stdout}")
        sys.exit(1)
    print("    [+] zipalign succeeded.")

    print("[*] Signing APK with apksigner...")
    sign_cmd = [
        APKSIGNER, "sign",
        "--ks", KEYSTORE,
        "--ks-pass", "pass:android",
        "--key-pass", "pass:android",
        "--ks-key-alias", "androiddebugkey",
        "--out", signed_apk,
        aligned_apk
    ]
    res = subprocess.run(sign_cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if res.returncode != 0:
        print(f"[-] apksigner failed:\n{res.stdout}")
        sys.exit(1)
    print(f"    [+] apksigner succeeded! Output: {signed_apk}")

    # Post-build verification: ensure critical assets are stored uncompressed
    print("[*] Verifying asset compression in signed APK...")
    critical_assets = [
        "3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed",  # Film Grain TFLite model
        "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt.tflite.uncompressed",  # Monocular depth
        "portrait_matting_mask_1024_768.tflite.uncompressed",  # Portrait matting
        "1c33c30c31a74d99b66f54c22014a27a.uncompressed",  # Portrait segmenter
    ]
    with zipfile.ZipFile(signed_apk, 'r') as zf:
        defl_count = 0
        stored_count = 0
        for info in zf.infolist():
            if info.filename.endswith('.uncompressed') or info.filename.endswith('.tflite'):
                if info.compress_type == zipfile.ZIP_STORED:
                    stored_count += 1
                else:
                    defl_count += 1
                    # Check if it's a critical asset
                    for ca in critical_assets:
                        if ca in info.filename:
                            print(f"    [!] CRITICAL: {info.filename} is Deflate-compressed! AssetManager.openFd() will fail!")
        print(f"    [+] Asset compression: {stored_count} Stored (correct), {defl_count} Deflated (wrong)")
        if defl_count > 0:
            print(f"    [!] WARNING: {defl_count} model assets are Deflate-compressed. Film Grain and Portrait may fail!")
        else:
            print(f"    [+] All model assets are correctly stored uncompressed.")
    return signed_apk

def balance_dex_limits():
    import glob
    z_files = glob.glob(os.path.join(APKTOOL_DIR, "smali", "z*.smali"))
    if z_files:
        target_dir = os.path.join(APKTOOL_DIR, "smali_classes4")
        os.makedirs(target_dir, exist_ok=True)
        for f in z_files:
            shutil.move(f, os.path.join(target_dir, os.path.basename(f)))
        print(f"    [+] Moved {len(z_files)} z*.smali classes to smali_classes4 to respect dex limits.")

def clean_build_artifacts():
    print("[*] Cleaning up build artifacts and temporary files...")
    # 1. Clean apktool cache
    apktool_build = os.path.join(APKTOOL_DIR, "build")
    if os.path.exists(apktool_build):
        shutil.rmtree(apktool_build)
        print("    [+] Removed apktool build cache directory.")
    
    # 2. Clean build directory
    if os.path.exists(BUILD_DIR):
        for item in os.listdir(BUILD_DIR):
            item_path = os.path.join(BUILD_DIR, item)
            if os.path.isfile(item_path) or os.path.islink(item_path):
                os.unlink(item_path)
            elif os.path.isdir(item_path):
                shutil.rmtree(item_path)
        print("    [+] Cleaned output build/ directory.")

    # 3. Clean root XML dump files
    import glob
    xml_dumps = glob.glob(os.path.join(ROOT_DIR, "*dump*.xml"))
    for f in xml_dumps:
        try:
            os.remove(f)
        except OSError:
            pass
    if xml_dumps:
        print(f"    [+] Removed {len(xml_dumps)} temporary UI dump XML files.")

def copy_to_desktop(signed_apk):
    print("[*] Copying APK and Morphe patch to Desktop...")
    desktop_dir = os.path.expanduser("~/Desktop")
    if os.path.isdir(desktop_dir):
        dest_apk = os.path.join(desktop_dir, os.path.basename(signed_apk))
        shutil.copy2(signed_apk, dest_apk)
        dest_v109 = os.path.join(desktop_dir, "PixelCamera-1.0.9.apk")
        shutil.copy2(signed_apk, dest_v109)
        size_mb = os.path.getsize(dest_apk) / (1024 * 1024)
        print(f"    [+] Successfully copied APK to Desktop: {dest_apk} and {dest_v109} ({size_mb:.2f} MB)")

        # Also copy the Morphe .mpp patch file to Desktop
        mpp_src = os.path.join(ROOT_DIR, "morphe-patches-pixelcamera-1.0.9.mpp")
        if not os.path.exists(mpp_src):
            built_mpp = os.path.join(ROOT_DIR, "morphe-patches", "patches", "build", "libs", "patches-1.0.9.mpp")
            if os.path.exists(built_mpp):
                mpp_src = built_mpp
        if os.path.exists(mpp_src):
            shutil.copy2(mpp_src, os.path.join(desktop_dir, "morphe-patches-pixelcamera-1.0.9.mpp"))
            shutil.copy2(mpp_src, os.path.join(desktop_dir, "patches-1.0.9.mpp"))
            print(f"    [+] Successfully copied patch to Desktop: {os.path.join(desktop_dir, 'morphe-patches-pixelcamera-1.0.9.mpp')}")
        
        pixelcam_dir = os.path.join(desktop_dir, "PixelCam")
        if os.path.isdir(pixelcam_dir):
            shutil.copy2(signed_apk, os.path.join(pixelcam_dir, os.path.basename(signed_apk)))
            shutil.copy2(signed_apk, os.path.join(pixelcam_dir, "PixelCamera-1.0.9.apk"))
            if os.path.exists(mpp_src):
                shutil.copy2(mpp_src, os.path.join(pixelcam_dir, "morphe-patches-pixelcamera-1.0.9.mpp"))
            print(f"    [+] Also copied to {pixelcam_dir}/PixelCamera-1.0.9.apk")
        return dest_v109
    else:
        print("    [!] Warning: Desktop directory not found, skipping Desktop copy.")
        return None

def install_and_launch(signed_apk):
    res = subprocess.run(["adb", "devices"], stdout=subprocess.PIPE, text=True)
    lines = [line.split()[0] for line in res.stdout.splitlines() if line.strip() and not line.startswith("List of") and "device" in line]
    if not lines:
        print("[!] No ADB devices connected, skipping install.")
        return
    # Pick physical device first
    physical_devices = [d for d in lines if not d.startswith("emulator-")]
    if physical_devices:
        target_device = physical_devices[0]
    else:
        print("[!] No physical phone connected yet (only emulators detected). Skipping auto-install.")
        return
    print(f"[*] Installing {signed_apk} on connected device {target_device}...")
    res = subprocess.run(["adb", "-s", target_device, "install", "-r", "-d", "-g", signed_apk], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    print(f"    {res.stdout.strip()}")
    if "Success" in res.stdout:
        print(f"[*] Launching PixelCamera on {target_device} (com.google.android.GoogleCameraEng)...")
        subprocess.run(["adb", "-s", target_device, "shell", "am", "force-stop", "com.google.android.GoogleCameraEng"])
        subprocess.run(["adb", "-s", target_device, "shell", "am", "start", "-n", "com.google.android.GoogleCameraEng/com.android.camera.CameraLauncher"])
        print("    [+] App launched successfully!")

def patch_looks_fine_tuning_and_grain():
    print("[*] Patching Looks Fine-Tuning controls (gated on device support)...")
    # 1. Patch qut.smali to expose fine-tuning sliders on viewfinder unconditionally
    qut_path = os.path.join(APKTOOL_DIR, "smali", "qut.smali")
    if os.path.exists(qut_path):
        with open(qut_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = """    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0"""
        if target in content:
            content = content.replace(target, "    goto :cond_0")
        gate_target = """    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isFineTuningSupported()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0"""
        if gate_target in content:
            content = content.replace(gate_target, "    goto :cond_0")

        # Hide Grain (v22) from bottom sheet by setting Lnzw.b(false), preserving v23 (TOMTE_SELECTION)
        grain_target = """    new-instance v0, Lnzw;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1}, Lnzw;->b(Z)V

    sget-object v3, Lnzy;->z:Lnzy;"""
        grain_hidden = """    new-instance v0, Lnzw;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lnzw;->b(Z)V

    sget-object v3, Lnzy;->z:Lnzy;"""
        if grain_target in content:
            content = content.replace(grain_target, grain_hidden)
            print("    [+] qut.smali: Grain hidden from bottom sheet (b=false).")
        with open(qut_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 2. Inject Film Grain strings into strings.xml
    strings_path = os.path.join(APKTOOL_DIR, "res", "values", "strings.xml")
    if os.path.exists(strings_path):
        with open(strings_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_looks_film_grain_title" not in content:
            content = content.replace("<resources>",
                '<resources>\n    <string name="pref_camera_looks_film_grain_title">Film Grain</string>\n    <string name="pref_camera_looks_film_grain_summary">Add subtle analog film texture to Camera Looks photos</string>')
            with open(strings_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] strings.xml: Film Grain title and summary strings added.")
        else:
            print("    [+] strings.xml: Film Grain strings already present.")

    # 3. Ensure Film Grain toggle is stripped from camera_gm3_preferences.xml and camera_preferences.xml
    # (since the neural film grain model relies on DarwiNN TPU /dev/gxp unavailable on non-platform apps)
    for xml_path in [os.path.join(APKTOOL_DIR, "res", "xml", "camera_gm3_preferences.xml"),
                     os.path.join(APKTOOL_DIR, "res", "xml", "camera_preferences.xml")]:
        if os.path.exists(xml_path):
            with open(xml_path, "r", encoding="utf-8") as f:
                content = f.read()
            if "pref_camera_looks_film_grain_key" in content:
                lines = [line for line in content.splitlines() if "pref_camera_looks_film_grain_key" not in line]
                with open(xml_path, "w", encoding="utf-8") as f:
                    f.write("\n".join(lines))
                print(f"    [+] {os.path.basename(xml_path)}: Film Grain toggle removed.")

def patch_display_max_brightness():
    print("[*] Patching 100% Display Backlight / Max Screen Brightness toggle...")
    # 1. Inject strings into strings.xml
    strings_path = os.path.join(APKTOOL_DIR, "res", "values", "strings.xml")
    if os.path.exists(strings_path):
        with open(strings_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_max_brightness_title" not in content:
            content = content.replace("<resources>",
                '<resources>\n    <string name="pref_camera_max_brightness_title">Max display brightness</string>\n    <string name="pref_camera_max_brightness_summary">Set display backlight to 100% in viewfinder for accurate low-light exposure preview</string>')
            with open(strings_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] strings.xml: Max display brightness strings added.")
        else:
            print("    [+] strings.xml: Max display brightness strings already present.")

    # 2. Inject toggle into camera_gm3_preferences.xml
    gm3_path = os.path.join(APKTOOL_DIR, "res", "xml", "camera_gm3_preferences.xml")
    if os.path.exists(gm3_path):
        with open(gm3_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_max_brightness_key" not in content:
            gm3_pref = '    <com.google.android.apps.camera.ui.preference.ManagedSwitchPreferenceCompat android:icon="@drawable/gs_brightness_7_vd_theme_24" android:title="@string/pref_camera_max_brightness_title" android:key="pref_camera_max_brightness_key" android:summary="@string/pref_camera_max_brightness_summary" android:order="3" android:defaultValue="false" />'
            cat_match = re.search(r'(android:key="pref_advanced_capture"[^>]*>[\s\S]*?)(</androidx\.preference\.PreferenceCategory>)', content)
            if not cat_match:
                cat_match = re.search(r'(android:key="pref_category_general"[^>]*>[\s\S]*?)(</androidx\.preference\.PreferenceCategory>)', content)
            if cat_match:
                content = content[:cat_match.start()] + cat_match.group(1) + '\n    ' + gm3_pref + '\n  ' + cat_match.group(2) + content[cat_match.end():]
            else:
                content = content.replace("</androidx.preference.PreferenceScreen>", f"    {gm3_pref}\n</androidx.preference.PreferenceScreen>")
            with open(gm3_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] camera_gm3_preferences.xml: Max display brightness toggle injected into Advanced category.")
        else:
            print("    [+] camera_gm3_preferences.xml: Max display brightness preference already present.")

    # 3. Inject toggle into camera_preferences.xml
    cam_pref_path = os.path.join(APKTOOL_DIR, "res", "xml", "camera_preferences.xml")
    if os.path.exists(cam_pref_path):
        with open(cam_pref_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_max_brightness_key" not in content:
            cam_pref = '    <com.google.android.apps.camera.ui.preference.ManagedSwitchPreference android:icon="@drawable/gs_brightness_7_vd_theme_24" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_max_brightness_title" android:key="pref_camera_max_brightness_key" android:summary="@string/pref_camera_max_brightness_summary" android:order="3" android:defaultValue="false" />'
            cat_match = re.search(r'(android:key="pref_category_advanced"[^>]*>[\s\S]*?)(</PreferenceScreen>)', content)
            if not cat_match:
                cat_match = re.search(r'(android:key="pref_category_general"[^>]*>[\s\S]*?)(</PreferenceCategory>)', content)
            if cat_match:
                content = content[:cat_match.start()] + cat_match.group(1) + '\n    ' + cam_pref + '\n  ' + cat_match.group(2) + content[cat_match.end():]
            else:
                content = content.replace("</PreferenceScreen>", f"    {cam_pref}\n</PreferenceScreen>")
            with open(cam_pref_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] camera_preferences.xml: Max display brightness toggle injected into Advanced category.")
        else:
            print("    [+] camera_preferences.xml: Max display brightness preference already present.")

    # 4. Patch tcc.smali f(F)V to filter brightness
    tcc_path = os.path.join(APKTOOL_DIR, "smali", "tcc.smali")
    if os.path.exists(tcc_path):
        with open(tcc_path, "r", encoding="utf-8") as f:
            content = f.read()

        # Clean up any old <init> or b() hooks
        content = re.sub(r'invoke-static \{\}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isMaxBrightnessEnabled\(\)Z\s+move-result v0\s+if-eqz v0, :cond_init_end\s+const/high16 v0, 0x3f800000\s+invoke-virtual \{p0, v0\}, Ltcc;->f\(F\)V\s+:cond_init_end\s+', '', content)
        content = re.sub(r'invoke-static \{\}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isMaxBrightnessEnabled\(\)Z\s+move-result v0\s+if-eqz v0, :cond_reset_sys\s+const/high16 v0, 0x3f800000\s+invoke-virtual \{p0, v0\}, Ltcc;->f\(F\)V\s+goto :cond_1\s+:cond_reset_sys\s+', '', content)

        # Patch f(F)V central funnel to enforce 1.0f when max brightness is enabled via filterBrightness
        tcc_f_target = """.method public final f(F)V
    .locals 1

    iget-object p0, p0, Ltcc;->b:Ljava/lang/Object;"""
        tcc_f_repl = """.method public final f(F)V
    .locals 1

    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterBrightness(F)F

    move-result p1

    iget-object p0, p0, Ltcc;->b:Ljava/lang/Object;"""
        if tcc_f_target in content:
            content = content.replace(tcc_f_target, tcc_f_repl)
            print("    [+] tcc.smali: f(F)V patched with filterBrightness.")
        elif "filterBrightness" in content:
            print("    [+] tcc.smali: f(F)V already patched with filterBrightness.")

        with open(tcc_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 4b. Patch rds.smali j(Ljava/lang/String;Z)V to immediately notify TomteInitHelper on preference change
    rds_path = os.path.join(APKTOOL_DIR, "smali", "rds.smali")
    if os.path.exists(rds_path):
        with open(rds_path, "r", encoding="utf-8") as f:
            content = f.read()
        rds_j_target = """.method public final j(Ljava/lang/String;Z)V
    .locals 4

    iget-object v0, p0, Lrds;->b:Ljava/lang/Object;"""
        rds_j_repl = """.method public final j(Ljava/lang/String;Z)V
    .locals 4

    const-string v0, "pref_camera_max_brightness_key"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_skip_bright

    invoke-static {p2}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onBrightnessPrefChanged(Z)V

    :cond_skip_bright
    iget-object v0, p0, Lrds;->b:Ljava/lang/Object;"""
        if rds_j_target in content:
            content = content.replace(rds_j_target, rds_j_repl)
            with open(rds_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] rds.smali: j() hooked to notify TomteInitHelper on max brightness toggle.")
        elif "onBrightnessPrefChanged" in content:
            print("    [+] rds.smali: already hooked with onBrightnessPrefChanged.")

    # 4c. Patch CameraGm3SettingsActivity.smali onResume() to ensure default system brightness in settings UI
    settings_act_path = os.path.join(APKTOOL_DIR, "smali_classes2", "com", "google", "android", "apps", "camera", "settings", "activity", "CameraGm3SettingsActivity.smali")
    if os.path.exists(settings_act_path):
        with open(settings_act_path, "r", encoding="utf-8") as f:
            content = f.read()
        gm3_target = """    invoke-super {p0}, Lhjg;->onResume()V

    return-void"""
        gm3_repl = """    invoke-super {p0}, Lhjg;->onResume()V

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->applyScreenBrightness(Landroid/app/Activity;)V

    return-void"""
        if gm3_target in content:
            content = content.replace(gm3_target, gm3_repl)
            with open(settings_act_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] CameraGm3SettingsActivity.smali: onResume() patched to invoke applyScreenBrightness (enforcing system brightness).")
        elif "applyScreenBrightness" in content:
            print("    [+] CameraGm3SettingsActivity.smali: already hooked with applyScreenBrightness.")

    # 5. Patch CameraActivity.smali onResume()
    cam_act_path = os.path.join(APKTOOL_DIR, "smali", "com", "google", "android", "apps", "camera", "activity", "main", "CameraActivity.smali")
    if os.path.exists(cam_act_path):
        with open(cam_act_path, "r", encoding="utf-8") as f:
            content = f.read()

        act_target = """    invoke-virtual {v0}, Llcz;->a()V

    invoke-super {p0}, Lifi;->onResume()V

    iget-object v0, p0, Lcom/google/android/apps/camera/activity/main/CameraActivity;->B:Lcom/google/android/apps/camera/stats/timing/CameraActivityTiming;"""

        act_repl = """    invoke-virtual {v0}, Llcz;->a()V

    invoke-super {p0}, Lifi;->onResume()V

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->applyScreenBrightness(Landroid/app/Activity;)V

    iget-object v0, p0, Lcom/google/android/apps/camera/activity/main/CameraActivity;->B:Lcom/google/android/apps/camera/stats/timing/CameraActivityTiming;"""

        if act_target in content:
            content = content.replace(act_target, act_repl)
            with open(cam_act_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] CameraActivity.smali: onResume() patched to invoke applyScreenBrightness.")
        elif "applyScreenBrightness" in content:
            print("    [+] CameraActivity.smali: already hooked with applyScreenBrightness.")

def patch_image_quality_preferences():
    print("[*] Patching In-App JPEG Quality & Spatial Noise Reduction menus...")
    # 1. Inject strings into strings.xml
    strings_path = os.path.join(APKTOOL_DIR, "res", "values", "strings.xml")
    if os.path.exists(strings_path):
        with open(strings_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_jpeg_quality_title" not in content:
            strings_to_inject = """    <string name="pref_camera_jpeg_quality_title">JPEG Quality</string>
    <string name="pref_camera_jpeg_quality_entry_100">100% (Maximum Quality)</string>
    <string name="pref_camera_jpeg_quality_entry_100_desc">Lossless quantization table for maximum fine texture preservation</string>
    <string name="pref_camera_jpeg_quality_entry_98">98% (High Quality)</string>
    <string name="pref_camera_jpeg_quality_entry_98_desc">High quality with lower compression artifacts</string>
    <string name="pref_camera_jpeg_quality_entry_95">95% (Stock)</string>
    <string name="pref_camera_jpeg_quality_entry_95_desc">Standard Google Camera JPEG compression</string>
    <string name="pref_camera_noise_reduction_title">Spatial Noise Reduction</string>
    <string name="pref_camera_noise_reduction_entry_stock">Stock (Standard)</string>
    <string name="pref_camera_noise_reduction_entry_stock_desc">Standard Google Camera bilateral spatial smoothing</string>
    <string name="pref_camera_noise_reduction_entry_minimal">Minimal</string>
    <string name="pref_camera_noise_reduction_entry_minimal_desc">Subtle smoothing; retains shadow microtextures</string>
    <string name="pref_camera_noise_reduction_entry_off">Off (Full Detail)</string>
    <string name="pref_camera_noise_reduction_entry_off_desc">Disables aggressive spatial denoising; preserves grass and foliage textures</string>"""
            content = content.replace("<resources>", f"<resources>\n{strings_to_inject}")
            with open(strings_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] strings.xml: JPEG Quality and Noise Reduction strings added.")
        else:
            print("    [+] strings.xml: JPEG Quality strings already present.")

        if "pref_camera_raw_compression_title" not in content:
            extra_strings = """    <string name="pref_camera_raw_compression_title">RAW DNG Format</string>
    <string name="pref_camera_raw_compression_entry_uncompressed">Uncompressed 16-Bit RAW (Lossless Linear)</string>
    <string name="pref_camera_raw_compression_entry_uncompressed_desc">Saves pure uncompressed 16-bit linear Bayer samples for maximum dynamic range in Lightroom</string>
    <string name="pref_camera_raw_compression_entry_compressed">Compressed RAW (Standard)</string>
    <string name="pref_camera_raw_compression_entry_compressed_desc">Standard compressed DNG with reduced file size</string>
    <string name="pref_camera_sharpness_title">Edge Sharpness &amp; De-Ring</string>
    <string name="pref_camera_sharpness_entry_soft">Soft / Filmic (0.0x)</string>
    <string name="pref_camera_sharpness_entry_soft_desc">Zero digital unsharp masking; eliminates harsh edge halos and ringing</string>
    <string name="pref_camera_sharpness_entry_natural">Natural (0.5x)</string>
    <string name="pref_camera_sharpness_entry_natural_desc">Subtle edge contrast with film-like organic rolloff</string>
    <string name="pref_camera_sharpness_entry_standard">Standard (1.0x)</string>
    <string name="pref_camera_sharpness_entry_standard_desc">Default Google Camera edge sharpening</string>"""
            content = content.replace("<resources>", f"<resources>\n{extra_strings}")
            with open(strings_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] strings.xml: RAW compression and Sharpness strings added.")
        else:
            print("    [+] strings.xml: RAW compression strings already present.")

    # 2. Inject arrays into arrays.xml
    arrays_path = os.path.join(APKTOOL_DIR, "res", "values", "arrays.xml")
    if os.path.exists(arrays_path):
        with open(arrays_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_raw_compression_entries" not in content:
            extra_arrays = """    <string-array name="pref_camera_raw_compression_entries">
        <item>@string/pref_camera_raw_compression_entry_uncompressed</item>
        <item>@string/pref_camera_raw_compression_entry_compressed</item>
    </string-array>
    <string-array name="pref_camera_raw_compression_entrydescriptions">
        <item>@string/pref_camera_raw_compression_entry_uncompressed_desc</item>
        <item>@string/pref_camera_raw_compression_entry_compressed_desc</item>
    </string-array>
    <string-array name="pref_camera_raw_compression_entryvalues">
        <item>uncompressed</item>
        <item>compressed</item>
    </string-array>
    <string-array name="pref_camera_sharpness_entries">
        <item>@string/pref_camera_sharpness_entry_soft</item>
        <item>@string/pref_camera_sharpness_entry_natural</item>
        <item>@string/pref_camera_sharpness_entry_standard</item>
    </string-array>
    <string-array name="pref_camera_sharpness_entrydescriptions">
        <item>@string/pref_camera_sharpness_entry_soft_desc</item>
        <item>@string/pref_camera_sharpness_entry_natural_desc</item>
        <item>@string/pref_camera_sharpness_entry_standard_desc</item>
    </string-array>
    <string-array name="pref_camera_sharpness_entryvalues">
        <item>soft</item>
        <item>natural</item>
        <item>standard</item>
    </string-array>"""
            content = content.replace("<resources>", f"<resources>\n{extra_arrays}")
            with open(arrays_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] arrays.xml: RAW compression and Sharpness arrays added.")
        else:
            print("    [+] arrays.xml: RAW compression arrays already present.")

    # 3. Inject into camera_gm3_preferences.xml
    gm3_path = os.path.join(APKTOOL_DIR, "res", "xml", "camera_gm3_preferences.xml")
    if os.path.exists(gm3_path):
        with open(gm3_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_raw_compression_key" not in content:
            extra_gm3 = """        <com.google.android.apps.camera.ui.preference.ListWithDescriptionsPreferenceCompat android:icon="@drawable/gs_raw_on_vd_theme_24" android:entries="@array/pref_camera_raw_compression_entries" android:title="@string/pref_camera_raw_compression_title" android:key="pref_camera_raw_compression_key" android:summary="%s" android:order="12" android:defaultValue="uncompressed" android:entryValues="@array/pref_camera_raw_compression_entryvalues" />
        <com.google.android.apps.camera.ui.preference.ListWithDescriptionsPreferenceCompat android:icon="@drawable/gs_details_vd_theme_24" android:entries="@array/pref_camera_sharpness_entries" android:title="@string/pref_camera_sharpness_title" android:key="pref_camera_sharpness_key" android:summary="%s" android:order="13" android:defaultValue="natural" android:entryValues="@array/pref_camera_sharpness_entryvalues" />"""
            content = content.replace('android:key="pref_camera_noise_reduction_key"', f'{extra_gm3}\n        android:key="pref_camera_noise_reduction_key"')
            with open(gm3_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] camera_gm3_preferences.xml: RAW compression and Sharpness menus injected.")
        else:
            print("    [+] camera_gm3_preferences.xml: RAW compression preference already present.")

    # 4. Inject into camera_preferences.xml
    cam_pref_path = os.path.join(APKTOOL_DIR, "res", "xml", "camera_preferences.xml")
    if os.path.exists(cam_pref_path):
        with open(cam_pref_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_raw_compression_key" not in content:
            extra_cam = """            <ListPreference android:icon="@drawable/gs_raw_on_vd_theme_24" android:entries="@array/pref_camera_raw_compression_entries" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_raw_compression_title" android:key="pref_camera_raw_compression_key" android:summary="%s" android:order="12" android:defaultValue="uncompressed" android:entryValues="@array/pref_camera_raw_compression_entryvalues" />
            <ListPreference android:icon="@drawable/gs_details_vd_theme_24" android:entries="@array/pref_camera_sharpness_entries" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_sharpness_title" android:key="pref_camera_sharpness_key" android:summary="%s" android:order="13" android:defaultValue="natural" android:entryValues="@array/pref_camera_sharpness_entryvalues" />"""
            content = content.replace('android:key="pref_camera_noise_reduction_key"', f'{extra_cam}\n            android:key="pref_camera_noise_reduction_key"')
            with open(cam_pref_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] camera_preferences.xml: RAW compression and Sharpness menus injected.")
        else:
            print("    [+] camera_preferences.xml: RAW compression preference already present.")

    # 5. Patch pbe.smali (Camera2 CaptureRequest providers)
    pbe_path = os.path.join(APKTOOL_DIR, "smali", "pbe.smali")
    if os.path.exists(pbe_path):
        with open(pbe_path, "r", encoding="utf-8") as f:
            content = f.read()

        pbe_jpeg_target = """    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    const/16 v0, 0x5f"""
        pbe_jpeg_repl = """    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getJpegQuality()I

    move-result v0"""
        if pbe_jpeg_target in content:
            content = content.replace(pbe_jpeg_target, pbe_jpeg_repl)
            print("    [+] pbe.smali: JPEG_QUALITY hooked with TomteInitHelper.getJpegQuality().")

        pbe_noise_target = """    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->NOISE_REDUCTION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v0, 0x1"""
        pbe_noise_repl = """    sget-object p0, Landroid/hardware/camera2/CaptureRequest;->NOISE_REDUCTION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0"""
        if pbe_noise_target in content:
            content = content.replace(pbe_noise_target, pbe_noise_repl)
            print("    [+] pbe.smali: NOISE_REDUCTION_MODE hooked with TomteInitHelper.getNoiseReductionMode().")

        with open(pbe_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 6. Patch JpgEncodeOptions.smali (Native Gcam JPEG Encoder)
    jpg_options_path = os.path.join(APKTOOL_DIR, "smali_classes3", "com", "google", "googlex", "gcam", "JpgEncodeOptions.smali")
    if os.path.exists(jpg_options_path):
        with open(jpg_options_path, "r", encoding="utf-8") as f:
            content = f.read()

        init_target = """    iput-wide v0, p0, Lcom/google/googlex/gcam/JpgEncodeOptions;->a:J

    return-void"""
        init_repl = """    iput-wide v0, p0, Lcom/google/googlex/gcam/JpgEncodeOptions;->a:J

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getJpegQuality()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/googlex/gcam/JpgEncodeOptions;->b(I)V

    return-void"""
        if init_target in content:
            content = content.replace(init_target, init_repl)
            print("    [+] JpgEncodeOptions.smali: <init>() hooked with TomteInitHelper.getJpegQuality().")

        b_target = """.method public final b(I)V
    .locals 2

    iget-wide v0, p0, Lcom/google/googlex/gcam/JpgEncodeOptions;->a:J"""
        b_repl = """.method public final b(I)V
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getJpegQuality()I

    move-result p1

    iget-wide v0, p0, Lcom/google/googlex/gcam/JpgEncodeOptions;->a:J"""
        if b_target in content:
            content = content.replace(b_target, b_repl)
            print("    [+] JpgEncodeOptions.smali: b(I)V hooked to override quality with TomteInitHelper.getJpegQuality().")

        with open(jpg_options_path, "w", encoding="utf-8") as f:
            f.write(content)

    # 7. Patch aaei.smali (Gcam HDR+ NoiseModel tuning)
    aaei_path = os.path.join(APKTOOL_DIR, "smali", "aaei.smali")
    if os.path.exists(aaei_path):
        with open(aaei_path, "r", encoding="utf-8") as f:
            content = f.read()

        aaei_target_1 = """    invoke-virtual {v4}, Ljava/lang/Double;->floatValue()F

    move-result v4

    invoke-virtual {v11, v4}, Lcom/google/googlex/gcam/FloatVector;->c(F)V"""
        aaei_repl_1 = """    invoke-virtual {v4}, Ljava/lang/Double;->floatValue()F

    move-result v4

    invoke-static {v4}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterNoiseScale(F)F

    move-result v4

    invoke-virtual {v11, v4}, Lcom/google/googlex/gcam/FloatVector;->c(F)V"""

        aaei_target_2 = """    invoke-virtual {v4}, Ljava/lang/Double;->floatValue()F

    move-result v4

    invoke-virtual {v14, v4}, Lcom/google/googlex/gcam/FloatVector;->c(F)V"""
        aaei_repl_2 = """    invoke-virtual {v4}, Ljava/lang/Double;->floatValue()F

    move-result v4

    invoke-static {v4}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->filterNoiseScale(F)F

    move-result v4

    invoke-virtual {v14, v4}, Lcom/google/googlex/gcam/FloatVector;->c(F)V"""

        if aaei_target_1 in content:
            content = content.replace(aaei_target_1, aaei_repl_1)
        if aaei_target_2 in content:
            content = content.replace(aaei_target_2, aaei_repl_2)
            print("    [+] aaei.smali: FloatVector.c(F)V hooked with TomteInitHelper.filterNoiseScale().")

        with open(aaei_path, "w", encoding="utf-8") as f:
            f.write(content)

def patch_fzf_smali():
    print("[*] Patching fzf.smali (AV1 10-bit HDR graceful fallback to HEVC)...")
    fzf_path = os.path.join(APKTOOL_DIR, "smali_classes2", "fzf.smali")
    if not os.path.exists(fzf_path):
        print("    [!] Warning: fzf.smali not found.")
        return
    with open(fzf_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Patch fzf.d(Ljava/lang/String;I)Lyqc;
    # Ensure video/av01 does not return profile 2 (Main 10) for HDR queries (p1 == 7 or 6)
    target_d = """    :sswitch_3
    const-string v0, "video/av01"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    if-ne p1, v4, :cond_2

    invoke-static {v1}, Lyqc;->l(Ljava/lang/Object;)Lyqc;

    move-result-object p0

    return-object p0

    :cond_2
    if-ne p1, v2, :cond_3

    invoke-static {v3}, Lyqc;->l(Ljava/lang/Object;)Lyqc;

    move-result-object p0

    return-object p0"""

    repl_d = """    :sswitch_3
    const-string v0, "video/av01"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    goto :cond_3"""

    if target_d in content:
        content = content.replace(target_d, repl_d)
        print("    [+] fzf.d: AV1 HDR profile request redirected to empty list.")
    elif repl_d in content:
        print("    [+] fzf.d: AV1 HDR profile already redirected.")

    # 2. Patch fzf.h(Landroid/media/MediaCodecInfo;Ljava/lang/String;Lemu;)Z
    # Explicitly return false (0) for video/av01 HDR capability checks
    target_h = """.method public static h(Landroid/media/MediaCodecInfo;Ljava/lang/String;Lemu;)Z
    .locals 3

    const-string v0, "video/dolby-vision"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    goto :goto_0"""

    repl_h = """.method public static h(Landroid/media/MediaCodecInfo;Ljava/lang/String;Lemu;)Z
    .locals 3

    const-string v0, "video/av01"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_av1_ok

    return v1

    :cond_av1_ok
    const-string v0, "video/dolby-vision"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0"""

    if target_h in content:
        content = content.replace(target_h, repl_h)
        print("    [+] fzf.h: AV1 HDR capability check returns false (forcing HEVC fallback).")
    elif "cond_av1_ok" in content:
        print("    [+] fzf.h: AV1 HDR capability guard already present.")

    with open(fzf_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_gei_smali():
    # Preserved as clean no-op: gei.i is for Pixel 9 Pro Centaur/Boba only and must not be forced on Pixel 8 Pro
    pass

def patch_viewfinder_and_hires_fix():
    # Preserved as clean no-op: viewfinder and stream resolutions are handled natively by stock CameraCharacteristics
    pass

def main():
    clean_build_artifacts()
    patch_manifest()
    patch_app_name()
    patch_vku_smali()
    patch_gei_smali()
    patch_viewfinder_and_hires_fix()
    patch_qko_smali()
    patch_camera_app_smali()
    inject_tomte_init_helper()
    patch_qur_smali()
    patch_qus_smali()
    patch_qxg_smali()
    patch_ksf_smali()
    patch_fzf_smali()
    patch_izk_smali()
    patch_msr_smali()
    patch_ndf_smali()
    patch_jex_smali()
    patch_rfx_smali()
    patch_mtt_smali()
    patch_pyp_smali()
    patch_rdb_smali()
    patch_ons_smali()
    patch_moo_smali()
    patch_poy_smali()
    patch_pji_smali()
    patch_stock_raw_mode()
    patch_autobahn_viewpager()
    patch_sauce_onboarding()
    patch_sof_smali()
    patch_creator_suite_smali()
    patch_dual_exposure_viewfinder()
    patch_dual_ev_ctrl_and_slider_sync()
    patch_brightness_shadows_controllers()
    patch_pro_controls_live()
    patch_looks_fine_tuning_and_grain()
    patch_display_max_brightness()
    patch_image_quality_preferences()
    patch_nzr_and_mpd_smali()
    patch_zoom_controllers()
    patch_mqs_smali()
    patch_hpq_smali()
    patch_kic_smali()
    patch_qfr_smali()
    patch_qfz_smali()
    patch_qge_smali()
    patch_qgh_smali()
    inject_splits()
    patch_libgcastartup()
    balance_dex_limits()
    ensure_keystore()
    signed_apk = build_and_sign()
    copy_to_desktop(signed_apk)
    install_and_launch(signed_apk)
    print(f"\n[SUCCESS] PixelCamera standalone build ready at: {signed_apk}")

if __name__ == "__main__":
    main()
