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

    with open(manifest_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] AndroidManifest.xml successfully patched.")

    # 6. Lower minSdkVersion in apktool.yml so APK can install on Android 14, 15, and 16
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
    print("[*] Setting app label to 'PixelCamera'...")
    strings_path = os.path.join(APKTOOL_DIR, "res", "values", "strings.xml")
    with open(strings_path, "r", encoding="utf-8") as f:
        content = f.read()

    content = content.replace('<string name="app_name">Camera</string>',
                            '<string name="app_name">PixelCamera</string>')

    with open(strings_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] App label set to 'PixelCamera'.")

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
    print("    [+] vku.smali patched: l() returns true (sauce eligible). g() and f() preserved.")

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

    const/4 v0, 0x0

    return v0

    :cond_check_ark
    const-string v1, "camera.ark"

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

    const/4 v0, 0x0

    return v0

    :cond_check_ark_x
    const-string v1, "camera.ark"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_0

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_0
{chain_x}"""
            content = content[:x_start] + new_x + content[map_idx_x:]
            print("    [+] klm.smali: x(Lkps;) patched (lasagna disabled, creator flags enabled, ark pro controls enabled).")

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
    on_create_repl = ".method public final onCreate()V\n    .locals 20\n\n    sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;\n\n    move-object/from16 v0, p0"
    if on_create_target in content:
        content = content.replace(on_create_target, on_create_repl)

    with open(camera_app_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] CameraApp.smali patched successfully.")

def inject_tomte_init_helper():
    print("[*] Injecting TomteInitHelper...")
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

    with open(mtt_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] mtt.smali patched: getEffectiveLookId hooked for ShotParams and TomteMetadata.")


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
    print("[*] Patching Brightness and Shadows controllers (mzc, nrd, nrm, nrc)...")
    
    # 1. Update mzc.smali: Map all 4 exposure/brightness controllers (i, j, h, b) to nrd and nrm
    mzc_path = os.path.join(APKTOOL_DIR, "smali", "mzc.smali")
    if os.path.exists(mzc_path):
        with open(mzc_path, "r", encoding="utf-8") as f:
            content = f.read()

        # Save registers v16 and v17 for nrm and nrd
        if "check-cast v5, Lnrm;\n\n    move-object/from16 v16, v5" not in content:
            content = content.replace(
                "check-cast v5, Lnrm;",
                "check-cast v5, Lnrm;\n\n    move-object/from16 v16, v5"
            )
        if "check-cast v6, Lnrd;\n\n    move-object/from16 v17, v6" not in content:
            content = content.replace(
                "check-cast v6, Lnrd;",
                "check-cast v6, Lnrd;\n\n    move-object/from16 v17, v6"
            )

        # Replace the 4 Lnqo bindings in :pswitch_6 with dual-EV bindings
        mzc_target = """    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v5, Lnqq;->i:Lnqq;

    invoke-virtual {v2, v5}, Lnqo;->h(Lnqq;)V

    sget-object v5, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v5}, Lnqo;->g(Lnqp;)V

    const v6, 0x7f0802ec

    invoke-virtual {v2, v6}, Lnqo;->i(I)V

    invoke-virtual {v2, v11}, Lnqo;->f(I)V

    const v6, 0x7f0a00cf

    invoke-virtual {v2, v6}, Lnqo;->c(I)V

    invoke-virtual {v2, v9}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V

    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v6, Lnqq;->j:Lnqq;

    invoke-virtual {v2, v6}, Lnqo;->h(Lnqq;)V

    invoke-virtual {v2, v5}, Lnqo;->g(Lnqp;)V

    invoke-virtual {v2, v12}, Lnqo;->i(I)V

    invoke-virtual {v2, v3}, Lnqo;->f(I)V

    const v5, 0x7f0a01e5

    invoke-virtual {v2, v5}, Lnqo;->c(I)V

    invoke-virtual {v2, v8}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V

    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v13, Lnqq;->h:Lnqq;

    invoke-virtual {v2, v13}, Lnqo;->h(Lnqq;)V

    sget-object v13, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v13}, Lnqo;->g(Lnqp;)V

    invoke-virtual {v2, v12}, Lnqo;->i(I)V

    const v13, 0x7f130492

    invoke-virtual {v2, v13}, Lnqo;->f(I)V

    const v13, 0x7f0a01e5

    invoke-virtual {v2, v13}, Lnqo;->c(I)V

    invoke-virtual {v2, v8}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V

    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v13, Lnqq;->b:Lnqq;

    invoke-virtual {v2, v13}, Lnqo;->h(Lnqq;)V

    sget-object v13, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v13}, Lnqo;->g(Lnqp;)V

    const v13, 0x7f0802eb

    invoke-virtual {v2, v13}, Lnqo;->i(I)V

    invoke-virtual {v2, v11}, Lnqo;->f(I)V

    const v13, 0x7f0a00cf

    invoke-virtual {v2, v13}, Lnqo;->c(I)V

    invoke-virtual {v2, v9}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V"""

        mzc_replacement = """    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v5, Lnqq;->i:Lnqq;

    invoke-virtual {v2, v5}, Lnqo;->h(Lnqq;)V

    sget-object v5, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v5}, Lnqo;->g(Lnqp;)V

    const v6, 0x7f0802eb

    invoke-virtual {v2, v6}, Lnqo;->i(I)V

    invoke-virtual {v2, v11}, Lnqo;->f(I)V

    const v6, 0x7f0a04ae

    invoke-virtual {v2, v6}, Lnqo;->c(I)V

    move-object/from16 v5, v16

    invoke-virtual {v2, v5}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V

    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v6, Lnqq;->j:Lnqq;

    invoke-virtual {v2, v6}, Lnqo;->h(Lnqq;)V

    sget-object v5, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v5}, Lnqo;->g(Lnqp;)V

    invoke-virtual {v2, v12}, Lnqo;->i(I)V

    invoke-virtual {v2, v3}, Lnqo;->f(I)V

    const v5, 0x7f0a00d0

    invoke-virtual {v2, v5}, Lnqo;->c(I)V

    move-object/from16 v5, v17

    invoke-virtual {v2, v5}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V

    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v13, Lnqq;->h:Lnqq;

    invoke-virtual {v2, v13}, Lnqo;->h(Lnqq;)V

    sget-object v13, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v13}, Lnqo;->g(Lnqp;)V

    invoke-virtual {v2, v12}, Lnqo;->i(I)V

    const v13, 0x7f130492

    invoke-virtual {v2, v13}, Lnqo;->f(I)V

    const v13, 0x7f0a00d0

    invoke-virtual {v2, v13}, Lnqo;->c(I)V

    move-object/from16 v13, v17

    invoke-virtual {v2, v13}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V

    new-instance v2, Lnqo;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, v4}, Lnqo;->b(Z)V

    sget-object v13, Lnqq;->b:Lnqq;

    invoke-virtual {v2, v13}, Lnqo;->h(Lnqq;)V

    sget-object v13, Lnqp;->a:Lnqp;

    invoke-virtual {v2, v13}, Lnqo;->g(Lnqp;)V

    const v13, 0x7f0802eb

    invoke-virtual {v2, v13}, Lnqo;->i(I)V

    invoke-virtual {v2, v11}, Lnqo;->f(I)V

    const v13, 0x7f0a04ae

    invoke-virtual {v2, v13}, Lnqo;->c(I)V

    move-object/from16 v13, v16

    invoke-virtual {v2, v13}, Lnqo;->d(Lnqs;)V

    invoke-virtual {v2}, Lnqo;->a()Lnqr;

    move-result-object v2

    invoke-virtual {v15, v2}, Lyec;->h(Ljava/lang/Object;)V"""

        if mzc_target in content:
            content = content.replace(mzc_target, mzc_replacement)
            with open(mzc_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] mzc.smali: Mapped all 4 controllers to nrd and nrm.")
        elif "move-object/from16 v16, v5" in content and "0x7f0a00d0" in content:
            print("    [+] mzc.smali: already mapped.")
        else:
            print("    [!] Warning: mzc.smali binding target not found.")

    # 2. Allow idempotent binding in nrd.smali, nrm.smali, nrh.smali, nre.smali
    for smali_file, opcode in [("nrd.smali", 3), ("nrm.smali", 5)]:
        p = os.path.join(APKTOOL_DIR, "smali", smali_file)
        if os.path.exists(p):
            with open(p, "r", encoding="utf-8") as f:
                c = f.read()
            target_bind = ':cond_0\n    new-instance p0, Ljava/lang/IllegalStateException;\n\n    const-string p1, "Cannot bind multiple times."\n\n    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V\n\n    throw p0'
            repl_bind = f':cond_0\n    new-instance p1, Lnht;\n\n    const/4 v0, 0x{opcode}\n\n    invoke-direct {{p1, p0, v0}}, Lnht;-><init>(Ljava/lang/Object;I)V\n\n    return-object p1'
            if target_bind in c:
                c = c.replace(target_bind, repl_bind)
                with open(p, "w", encoding="utf-8") as f:
                    f.write(c)
                print(f"    [+] {smali_file}: Idempotent binding enabled.")

    for smali_file, opcode in [("nrh.smali", "0xa"), ("nre.smali", "0x9")]:
        p = os.path.join(APKTOOL_DIR, "smali", smali_file)
        if os.path.exists(p):
            with open(p, "r", encoding="utf-8") as f:
                c = f.read()
            target_bind = 'new-instance p0, Ljava/lang/IllegalStateException;\n\n    const-string p1, "Cannot bind multiple times."\n\n    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V\n\n    throw p0'
            repl_bind = f'new-instance p1, Lmmf;\n\n    const/16 v0, {opcode}\n\n    invoke-direct {{p1, p0, v0}}, Lmmf;-><init>(Ljava/lang/Object;I)V\n\n    return-object p1'
            if target_bind in c:
                c = c.replace(target_bind, repl_bind)
                with open(p, "w", encoding="utf-8") as f:
                    f.write(c)

    # 3. Patch nrd.smali: Upgrade to qhr, implement rst, h, e, k, n, o, p, q, s
    nrd_path = os.path.join(APKTOOL_DIR, "smali", "nrd.smali")
    if os.path.exists(nrd_path):
        with open(nrd_path, "r", encoding="utf-8") as f:
            c = f.read()

        # a) Super class
        c = c.replace(".super Lnqu;", ".super Lqhr;")
        c = c.replace("invoke-direct {p0}, Lnqu;-><init>()V", 'invoke-direct {p0}, Lqhr;-><init>()V\n\n    new-instance v0, Lufn;\n\n    const-string v1, ""\n\n    invoke-direct {v0, v1}, Lufn;-><init>(Ljava/lang/Object;)V\n\n    iput-object v0, p0, Lnrd;->x:Lufn;')

        # b) Fields
        if ".field private final t:Lppn;" in c:
            c = c.replace(".field private final t:Lppn;", ".field public final t:Lppn;")
        if ".field public final x:Lufn;" not in c:
            c = c.replace(".field private w:Z", ".field private w:Z\n\n.field public final x:Lufn;")
        # Clean any accidental literal \\n from previous replace
        c = c.replace(".field public final x:Lufn;\\n\\n.field public rst:Lsmq;", ".field public final x:Lufn;\n\n.field public rst:Lsmq;")
        c = c.replace(".field public final x:Lufn;\\n.field public rst:Lsmq;", ".field public final x:Lufn;\n\n.field public rst:Lsmq;")
        if ".field public rst:Lsmq;" not in c:
            c = c.replace(".field public final x:Lufn;", ".field public final x:Lufn;\n\n.field public rst:Lsmq;")

        # c) In i(): save smq to p0->rst
        target_smq = "invoke-direct {v5, v1, v6, v2}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V"
        repl_smq = target_smq + "\n\n    iput-object v5, v0, Lnrd;->rst:Lsmq;"
        c = c.replace(target_smq + "\\n\\n    iput-object v5, v0, Lnrd;->rst:Lsmq;", repl_smq)
        if target_smq in c and "iput-object v5, v0, Lnrd;->rst:Lsmq;" not in c:
            c = c.replace(target_smq, repl_smq, 1)

        # d) Replace e() with full reset method
        new_e_nrd = """.method public final e()V
    .locals 5

    iget-object v0, p0, Lnrd;->e:Lejf;

    if-eqz v0, :cond_rst_btn_d

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_rst_btn_d
    iget-object v0, p0, Lnrd;->x:Lufn;

    if-eqz v0, :cond_rst_x

    const-string v1, ""

    invoke-virtual {v0, v1}, Lufn;->a(Ljava/lang/Object;)V

    :cond_rst_x
    iget-object v0, p0, Lnqu;->a:Lsmy;

    if-eqz v0, :cond_skip_smy_d

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v0, v1}, Lsmy;->i(Lsmy;F)V

    const-string v1, ""

    invoke-virtual {v0, v1}, Lsmy;->f(Ljava/lang/String;)V

    :cond_skip_smy_d
    iget-object v0, p0, Lnrd;->g:Lugh;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrd;->t:Lppn;

    if-eqz v0, :cond_skip_ev_rst_d

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_skip_ev_rst_d

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrd;->f:Lugh;

    if-eqz v2, :cond_get_s_rst_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_s_rst_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_s_rst_done

    move v1, v2

    :cond_get_s_rst_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v1, v2

    const/high16 v2, 0x41400000    # 12.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    :cond_skip_ev_rst_d
    iget-object v0, p0, Lnrd;->t:Lppn;

    if-eqz v0, :cond_skip_ppn_rst_d

    invoke-virtual {v0}, Lppn;->f()V

    invoke-virtual {v0}, Lppn;->g()V

    :cond_skip_ppn_rst_d
    iget-object v0, p0, Lnrd;->n:Lnrf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnrf;->c(Z)V

    iget-object v0, p0, Lnrd;->k:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    iput-object v2, v1, Lnql;->b:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method"""
        m_e_start = c.find(".method public final e()V")
        if m_e_start != -1:
            m_e_end = c.find(".end method", m_e_start) + len(".end method")
            c = c[:m_e_start] + new_e_nrd + c[m_e_end:]

        # e) Add h() method
        new_h_nrd = """.method public final h()Lsmq;
    .locals 1

    iget-object v0, p0, Lnrd;->rst:Lsmq;

    return-object v0
.end method"""
        if ".method public final h()Lsmq;" in c:
            m_h_start = c.find(".method public final h()Lsmq;")
            m_h_end = c.find(".end method", m_h_start) + len(".end method")
            c = c[:m_h_start] + new_h_nrd + c[m_h_end:]
        else:
            c += "\n" + new_h_nrd + "\n"

        # f) Add k, n, o, p, q methods if missing
        for m_sig, m_code in [
            (".method public final k()F", """.method public final k()F
    .locals 1

    const/high16 v0, 0x3f000000    # 0.5f

    return v0
.end method"""),
            (".method public final n()Lufv;", """.method public final n()Lufv;
    .locals 1

    iget-object v0, p0, Lnrd;->x:Lufn;

    return-object v0
.end method"""),
            (".method public final o()Ljava/lang/Integer;", """.method public final o()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f1300f4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method"""),
            (".method public final p()Ljava/lang/Integer;", """.method public final p()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f1300fa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method"""),
            (".method public final q()Ljava/lang/Integer;", """.method public final q()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f1300f9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method""")
        ]:
            if m_sig in c:
                m_start = c.find(m_sig)
                m_end = c.find(".end method", m_start) + len(".end method")
                c = c[:m_start] + m_code + c[m_end:]
            else:
                c += "\n" + m_code + "\n"

        # g) Replace s(FZLsnw;)V
        new_s_nrd = """.method public final s(FZLsnw;)V
    .locals 8

    invoke-static {p1}, Lobf;->p(F)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnrd;->x:Lufn;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Lsmy;->f(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lnrd;->e:Lejf;

    if-eqz v0, :cond_skip_rst

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_rst_off

    const/4 v1, 0x1

    goto :goto_rst

    :cond_rst_off
    const/4 v1, 0x0

    :goto_rst
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_skip_rst
    iget-object v0, p0, Lnrd;->t:Lppn;

    if-eqz v0, :cond_ppn

    iget-object v1, v0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_ppn

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget-object v2, v0, Losw;->g:Lugh;

    invoke-interface {v2, v1}, Lugh;->a(Ljava/lang/Object;)V

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrd;->f:Lugh;

    if-eqz v2, :cond_get_s_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_s_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_s_done

    move v1, v2

    :cond_get_s_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v3, p1, v2

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float/2addr v3, v4

    sub-float v2, v1, v2

    const/high16 v4, 0x41400000    # 12.0f

    mul-float/2addr v2, v4

    add-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    const/16 v3, 0x18

    if-le v2, v3, :cond_clamp_high_b

    move v2, v3

    :cond_clamp_high_b
    const/16 v3, -0x18

    if-ge v2, v3, :cond_clamp_low_b

    move v2, v3

    :cond_clamp_low_b
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v2}, Lugh;->a(Ljava/lang/Object;)V

    :cond_ppn
    const/4 v0, 0x1

    iget-object v1, p0, Lnrd;->n:Lnrf;

    invoke-virtual {v1, v0}, Lnrf;->c(Z)V

    iget-object v1, p0, Lnrd;->h:Lugh;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v1, p0, Lnrd;->g:Lugh;

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lnrd;->f:Lugh;

    move-object v2, v1

    check-cast v2, Lufn;

    iget-object v3, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    :cond_3
    iget-object v1, p0, Lnrd;->k:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnql;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->b:Lj$/util/Optional;

    iget-object v0, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->e:Lj$/util/Optional;

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrd;->p:Lrpr;

    const/16 v1, 0x8

    float-to-double v2, p1

    invoke-virtual {v0, p3, v1, v2, v3}, Lrpr;->E(Lsnw;ID)V

    return-void
.end method"""
        if ".method public final s(FZLsnw;)V" in c:
            m_s_start = c.find(".method public final s(FZLsnw;)V")
            m_s_end = c.find(".end method", m_s_start) + len(".end method")
            c = c[:m_s_start] + new_s_nrd + c[m_s_end:]
        else:
            c += "\n" + new_s_nrd + "\n"

        with open(nrd_path, "w", encoding="utf-8") as f:
            f.write(c)
        print("    [+] nrd.smali: Fully patched with rst field, h(), e(), and dual-EV s().")

    # 4. Patch nrm.smali: Upgrade to qhr, implement rst, h, e, k, n, o, p, q, s
    nrm_path = os.path.join(APKTOOL_DIR, "smali", "nrm.smali")
    if os.path.exists(nrm_path):
        with open(nrm_path, "r", encoding="utf-8") as f:
            c = f.read()

        # a) Super class
        c = c.replace(".super Lnqu;", ".super Lqhr;")
        c = c.replace("invoke-direct {p0}, Lnqu;-><init>()V", 'invoke-direct {p0}, Lqhr;-><init>()V\n\n    new-instance v0, Lufn;\n\n    const-string v1, ""\n\n    invoke-direct {v0, v1}, Lufn;-><init>(Ljava/lang/Object;)V\n\n    iput-object v0, p0, Lnrm;->z:Lufn;')

        # b) Fields
        if ".field private final v:Lppn;" in c:
            c = c.replace(".field private final v:Lppn;", ".field public final v:Lppn;")
        if ".field public final z:Lufn;" not in c:
            c = c.replace(".field private y:Luep;", ".field private y:Luep;\n\n.field public final z:Lufn;")
        # Clean any accidental literal \\n from previous replace
        c = c.replace(".field public final z:Lufn;\\n\\n.field public rst:Lsmq;", ".field public final z:Lufn;\n\n.field public rst:Lsmq;")
        c = c.replace(".field public final z:Lufn;\\n.field public rst:Lsmq;", ".field public final z:Lufn;\n\n.field public rst:Lsmq;")
        if ".field public rst:Lsmq;" not in c:
            c = c.replace(".field public final z:Lufn;", ".field public final z:Lufn;\n\n.field public rst:Lsmq;")

        # c) In i(): save smq to p0->rst
        target_smq = "invoke-direct {v5, v1, v6, v2}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V"
        repl_smq = target_smq + "\n\n    iput-object v5, v0, Lnrm;->rst:Lsmq;"
        c = c.replace(target_smq + "\\n\\n    iput-object v5, v0, Lnrm;->rst:Lsmq;", repl_smq)
        if target_smq in c and "iput-object v5, v0, Lnrm;->rst:Lsmq;" not in c:
            c = c.replace(target_smq, repl_smq, 1)

        # d) Replace e() with full reset method
        new_e_nrm = """.method public final e()V
    .locals 5

    iget-object v0, p0, Lnrm;->g:Lejf;

    if-eqz v0, :cond_rst_btn_m

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_rst_btn_m
    iget-object v0, p0, Lnrm;->z:Lufn;

    if-eqz v0, :cond_rst_z

    const-string v1, ""

    invoke-virtual {v0, v1}, Lufn;->a(Ljava/lang/Object;)V

    :cond_rst_z
    iget-object v0, p0, Lnqu;->a:Lsmy;

    if-eqz v0, :cond_skip_smy_m

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v0, v1}, Lsmy;->i(Lsmy;F)V

    const-string v1, ""

    invoke-virtual {v0, v1}, Lsmy;->f(Ljava/lang/String;)V

    :cond_skip_smy_m
    iget-object v0, p0, Lnrm;->i:Lugh;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->v:Lppn;

    if-eqz v0, :cond_skip_ev_rst_m

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_skip_ev_rst_m

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrm;->j:Lugh;

    if-eqz v2, :cond_get_b_rst_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_b_rst_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_b_rst_done

    move v1, v2

    :cond_get_b_rst_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v1, v2

    const/high16 v2, 0x41c00000    # 24.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    :cond_skip_ev_rst_m
    iget-object v0, p0, Lnrm;->v:Lppn;

    if-eqz v0, :cond_skip_ppn_rst_m

    invoke-virtual {v0}, Lppn;->f()V

    :cond_skip_ppn_rst_m
    iget-object v0, p0, Lnrm;->r:Lnrf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnrf;->c(Z)V

    iget-object v0, p0, Lnrm;->h:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    iput-object v2, v1, Lnql;->e:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method"""
        m_e_start = c.find(".method public final e()V")
        if m_e_start != -1:
            m_e_end = c.find(".end method", m_e_start) + len(".end method")
            c = c[:m_e_start] + new_e_nrm + c[m_e_end:]

        # e) Add h() method
        new_h_nrm = """.method public final h()Lsmq;
    .locals 1

    iget-object v0, p0, Lnrm;->rst:Lsmq;

    return-object v0
.end method"""
        if ".method public final h()Lsmq;" in c:
            m_h_start = c.find(".method public final h()Lsmq;")
            m_h_end = c.find(".end method", m_h_start) + len(".end method")
            c = c[:m_h_start] + new_h_nrm + c[m_h_end:]
        else:
            c += "\n" + new_h_nrm + "\n"

        # f) Add k, n, o, p, q methods if missing
        for m_sig, m_code in [
            (".method public final k()F", """.method public final k()F
    .locals 1

    const/high16 v0, 0x3f000000    # 0.5f

    return v0
.end method"""),
            (".method public final n()Lufv;", """.method public final n()Lufv;
    .locals 1

    iget-object v0, p0, Lnrm;->z:Lufn;

    return-object v0
.end method"""),
            (".method public final o()Ljava/lang/Integer;", """.method public final o()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f130894

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method"""),
            (".method public final p()Ljava/lang/Integer;", """.method public final p()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f130897

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method"""),
            (".method public final q()Ljava/lang/Integer;", """.method public final q()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f130896

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method""")
        ]:
            if m_sig in c:
                m_start = c.find(m_sig)
                m_end = c.find(".end method", m_start) + len(".end method")
                c = c[:m_start] + m_code + c[m_end:]
            else:
                c += "\n" + m_code + "\n"

        # g) Replace s(FZLsnw;)V
        new_s_nrm = """.method public final s(FZLsnw;)V
    .locals 8

    invoke-static {p1}, Lobf;->p(F)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnrm;->z:Lufn;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Lsmy;->f(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lnrm;->g:Lejf;

    if-eqz v0, :cond_skip_rst

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_rst_off

    const/4 v1, 0x1

    goto :goto_rst

    :cond_rst_off
    const/4 v1, 0x0

    :goto_rst
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_skip_rst
    iget-object v0, p0, Lnrm;->v:Lppn;

    if-eqz v0, :cond_ppn

    iget-object v1, v0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_ppn

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget-object v2, v0, Losw;->d:Lugh;

    invoke-interface {v2, v1}, Lugh;->a(Ljava/lang/Object;)V

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrm;->j:Lugh;

    if-eqz v2, :cond_get_b_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_b_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_b_done

    move v1, v2

    :cond_get_b_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v3, v1, v2

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float/2addr v3, v4

    sub-float v2, p1, v2

    const/high16 v4, 0x41400000    # 12.0f

    mul-float/2addr v2, v4

    add-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    const/16 v3, 0x18

    if-le v2, v3, :cond_clamp_high_s

    move v2, v3

    :cond_clamp_high_s
    const/16 v3, -0x18

    if-ge v2, v3, :cond_clamp_low_s

    move v2, v3

    :cond_clamp_low_s
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v2}, Lugh;->a(Ljava/lang/Object;)V

    :cond_ppn
    const/4 v0, 0x1

    iget-object v1, p0, Lnrm;->r:Lnrf;

    invoke-virtual {v1, v0}, Lnrf;->c(Z)V

    iget-object v1, p0, Lnrm;->k:Lugh;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v1, p0, Lnrm;->i:Lugh;

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lnrm;->j:Lugh;

    move-object v2, v1

    check-cast v2, Lufn;

    iget-object v3, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    :cond_3
    iget-object v1, p0, Lnrm;->h:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnql;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->e:Lj$/util/Optional;

    iget-object v0, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->b:Lj$/util/Optional;

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->t:Lrpr;

    const/4 v1, 0x3

    float-to-double v2, p1

    invoke-virtual {v0, p3, v1, v2, v3}, Lrpr;->E(Lsnw;ID)V

    return-void
.end method"""
        if ".method public final s(FZLsnw;)V" in c:
            m_s_start = c.find(".method public final s(FZLsnw;)V")
            m_s_end = c.find(".end method", m_s_start) + len(".end method")
            c = c[:m_s_start] + new_s_nrm + c[m_s_end:]
        else:
            c += "\n" + new_s_nrm + "\n"

        with open(nrm_path, "w", encoding="utf-8") as f:
            f.write(c)
        print("    [+] nrm.smali: Fully patched with rst field, h(), e(), and dual-EV s().")

    # 5. Patch smali_classes2/nrc.smali: Delegate pswitch_8 and pswitch_3 directly to nrd and nrm
    nrc_path = os.path.join(APKTOOL_DIR, "smali_classes2", "nrc.smali")
    if os.path.exists(nrc_path):
        with open(nrc_path, "r", encoding="utf-8") as f:
            nrc_content = f.read()

        pswitch_3_body = """    :pswitch_3
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnrm;

    invoke-virtual {p0, p1, p2, p3}, Lnrm;->s(FZLsnw;)V

    return-void"""

        pswitch_8_body = """    :pswitch_8
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnrd;

    invoke-virtual {p0, p1, p2, p3}, Lnrd;->s(FZLsnw;)V

    return-void"""

        start_p3 = nrc_content.find("    :pswitch_3\n")
        end_p3 = nrc_content.find("    :pswitch_4\n", start_p3)
        if start_p3 != -1 and end_p3 != -1:
            nrc_content = nrc_content[:start_p3] + pswitch_3_body + "\n\n" + nrc_content[end_p3:]

        start_p8 = nrc_content.find("    :pswitch_8\n")
        end_p8 = nrc_content.find("    :cond_8\n", start_p8)
        if start_p8 != -1 and end_p8 != -1:
            nrc_content = nrc_content[:start_p8] + pswitch_8_body + "\n\n" + nrc_content[end_p8:]

        with open(nrc_path, "w", encoding="utf-8") as f:
            f.write(nrc_content)
        print("    [+] nrc.smali: Delegated Brightness and Shadows directly to nrd and nrm.")

    # 6. Patch ppn.smali: Ensure f and u fields are public
    ppn_path = os.path.join(APKTOOL_DIR, "smali", "ppn.smali")
    if os.path.exists(ppn_path):
        with open(ppn_path, "r", encoding="utf-8") as f:
            ppn_c = f.read()
        ppn_c = ppn_c.replace(".field private final f:Losw;", ".field public final f:Losw;")
        ppn_c = ppn_c.replace(".field private final u:Ljava/util/concurrent/atomic/AtomicBoolean;", ".field public final u:Ljava/util/concurrent/atomic/AtomicBoolean;")
        with open(ppn_path, "w", encoding="utf-8") as f:
            f.write(ppn_c)
        print("    [+] ppn.smali: Verified f and u accessibility.")

    # 7. Patch pfh.smali: Ensure osw.b exposure compensation updates are always applied via uoi.r()
    pfh_path = os.path.join(APKTOOL_DIR, "smali_classes2", "pfh.smali")
    if os.path.exists(pfh_path):
        with open(pfh_path, "r", encoding="utf-8") as f:
            pfh_c = f.read()
        old_p8 = """:pswitch_8
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpjo;

    iget-object v0, p0, Lpjo;->d:Lppn;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {v0}, Lppn;->i()Z

    move-result v0

    if-eqz v0, :cond_5

    goto/16 :goto_3

    :cond_5
    iget-object p0, p0, Lpjo;->b:Luoi;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lpjo;->a(I)Lupd;

    move-result-object p1

    invoke-interface {p0, p1}, Luoi;->r(Lupd;)V

    return-void"""

        new_p8 = """:pswitch_8
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpjo;

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_skip_pfh

    iget-object p0, p0, Lpjo;->b:Luoi;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lpjo;->a(I)Lupd;

    move-result-object p1

    invoke-interface {p0, p1}, Luoi;->r(Lupd;)V

    :cond_skip_pfh
    return-void"""
        if old_p8 in pfh_c:
            pfh_c = pfh_c.replace(old_p8, new_p8, 1)
            with open(pfh_path, "w", encoding="utf-8") as f:
                f.write(pfh_c)
            print("    [+] pfh.smali: Unblocked direct AE compensation pipeline (pswitch_8).")

    # 8. Patch osw.smali: Add b()Z to check if brightness or shadow adjustments are active
    osw_path = os.path.join(APKTOOL_DIR, "smali", "osw.smali")
    if os.path.exists(osw_path):
        with open(osw_path, "r", encoding="utf-8") as f:
            osw_c = f.read()
        if ".method public final b()Z" not in osw_c:
            b_method = """.method public final b()Z
    .locals 3

    iget-object v0, p0, Losw;->c:Lugh;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object p0, p0, Losw;->d:Lugh;

    check-cast p0, Lufn;

    iget-object p0, p0, Lufn;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    cmpl-float p0, p0, v1

    if-ltz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method"""
            osw_c = osw_c.rstrip() + "\n\n" + b_method + "\n"
            with open(osw_path, "w", encoding="utf-8") as f:
                f.write(osw_c)
            print("    [+] osw.smali: Added b()Z query for active manual slider adjustments.")

    # 9. Patch ppn.smali: Linearize shadow curve exponent r = 1.0f in o(FFF)V
    if os.path.exists(ppn_path):
        with open(ppn_path, "r", encoding="utf-8") as f:
            ppn_c = f.read()
        target_r = "const/high16 p1, 0x3f800000    # 1.0f\n\n    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;\n\n    move-result-object p1\n\n    iput-object p1, p0, Lppn;->r:Ljava/lang/Float;"
        if target_r not in ppn_c:
            full_old = "div-float/2addr p2, p1\n\n    invoke-direct {p0, p2}, Lppn;->l(F)F\n\n    move-result p1\n\n    invoke-static {p1}, Lppn;->k(F)F\n\n    move-result p1\n\n    float-to-double p1, p1\n\n    invoke-static {p1, p2}, Ljava/lang/Math;->log(D)D\n\n    move-result-wide p1\n\n    iget p3, p0, Lppn;->i:F\n\n    invoke-static {p3}, Lppn;->k(F)F\n\n    move-result p3\n\n    float-to-double v0, p3\n\n    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D\n\n    move-result-wide v0\n\n    div-double/2addr p1, v0\n\n    double-to-float p1, p1\n\n    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;\n\n    move-result-object p1\n\n    iput-object p1, p0, Lppn;->r:Ljava/lang/Float;"
            if full_old in ppn_c:
                ppn_c = ppn_c.replace(full_old, target_r, 1)
            else:
                old_div = "div-double/2addr p1, v0\n\n    double-to-float p1, p1\n\n    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;\n\n    move-result-object p1\n\n    iput-object p1, p0, Lppn;->r:Ljava/lang/Float;"
                if old_div in ppn_c:
                    ppn_c = ppn_c.replace(old_div, target_r, 1)
            with open(ppn_path, "w", encoding="utf-8") as f:
                f.write(ppn_c)
        print("    [+] ppn.smali: Linearized shadow transfer curve exponent r = 1.0f.")

    # 10. Patch pkb.smali: Guard Losw.a() and ppn.f() on tap reset
    pkb_path = os.path.join(APKTOOL_DIR, "smali_classes2", "pkb.smali")
    if os.path.exists(pkb_path):
        with open(pkb_path, "r", encoding="utf-8") as f:
            pkb_c = f.read()
        if "cond_skip_rst_pkb_h" not in pkb_c:
            old_pkb_h = "invoke-virtual {2, v1}, Lpix;->p(Ltqz;)V\n\n    iget-object v1, v0, Lpkc;->g:Lppn;\n\n    invoke-virtual {v1}, Lppn;->f()V\n\n    iget-object v1, v0, Lpkc;->f:Losw;\n\n    invoke-virtual {v1}, Losw;->a()V\n\n    iget-object v1, p0, Lpkb;->b:Lzfr;"
            new_pkb_h = "invoke-virtual {2, v1}, Lpix;->p(Ltqz;)V\n\n    iget-object v1, v0, Lpkc;->f:Losw;\n\n    invoke-virtual {v1}, Losw;->b()Z\n\n    move-result v1\n\n    if-nez v1, :cond_skip_rst_pkb_h\n\n    iget-object v1, v0, Lpkc;->g:Lppn;\n\n    invoke-virtual {v1}, Lppn;->f()V\n\n    iget-object v1, v0, Lpkc;->f:Losw;\n\n    invoke-virtual {v1}, Losw;->a()V\n\n    :cond_skip_rst_pkb_h\n\n    iget-object v1, p0, Lpkb;->b:Lzfr;"
            if old_pkb_h in pkb_c:
                pkb_c = pkb_c.replace(old_pkb_h, new_pkb_h, 1)
        if "cond_skip_rst_pkb_i" not in pkb_c:
            old_pkb_i = ":cond_1\n    iget-object v0, p0, Lpkb;->i:Lpkc;\n\n    iget-object v1, v0, Lpkc;->g:Lppn;\n\n    invoke-virtual {v1}, Lppn;->f()V\n\n    iget-object v1, v0, Lpkc;->f:Losw;\n\n    invoke-virtual {v1}, Losw;->a()V\n\n    iget-object v1, p0, Lpkb;->g:Lpjp;"
            new_pkb_i = ":cond_1\n    iget-object v0, p0, Lpkb;->i:Lpkc;\n\n    iget-object v1, v0, Lpkc;->f:Losw;\n\n    invoke-virtual {v1}, Losw;->b()Z\n\n    move-result v1\n\n    if-nez v1, :cond_skip_rst_pkb_i\n\n    iget-object v1, v0, Lpkc;->g:Lppn;\n\n    invoke-virtual {v1}, Lppn;->f()V\n\n    iget-object v1, v0, Lpkc;->f:Losw;\n\n    invoke-virtual {v1}, Losw;->a()V\n\n    :cond_skip_rst_pkb_i\n\n    iget-object v1, p0, Lpkb;->g:Lpjp;"
            if old_pkb_i in pkb_c:
                pkb_c = pkb_c.replace(old_pkb_i, new_pkb_i, 1)
        with open(pkb_path, "w", encoding="utf-8") as f:
            f.write(pkb_c)
        print("    [+] pkb.smali: Guarded tap resets to preserve active brightness/shadow sliders.")

    # 11. Patch pkn.smali: Guard resets on tap
    pkn_path = os.path.join(APKTOOL_DIR, "smali_classes2", "pkn.smali")
    if os.path.exists(pkn_path):
        with open(pkn_path, "r", encoding="utf-8") as f:
            pkn_c = f.read()
        if "Losw;->b()Z" not in pkn_c:
            old_pkn_b = "if-eqz p2, :cond_1\n\n    iget-object v0, p0, Lpss;->h:Lppn;\n\n    invoke-virtual {v0}, Lppn;->f()V\n\n    iget-object v0, p0, Lpss;->a:Losw;\n\n    invoke-virtual {v0}, Losw;->a()V\n\n    :cond_1"
            new_pkn_b = "if-eqz p2, :cond_1\n\n    iget-object v0, p0, Lpss;->a:Losw;\n\n    invoke-virtual {v0}, Losw;->b()Z\n\n    move-result v0\n\n    if-nez v0, :cond_1\n\n    iget-object v0, p0, Lpss;->h:Lppn;\n\n    invoke-virtual {v0}, Lppn;->f()V\n\n    iget-object v0, p0, Lpss;->a:Losw;\n\n    invoke-virtual {v0}, Losw;->a()V\n\n    :cond_1"
            if old_pkn_b in pkn_c:
                pkn_c = pkn_c.replace(old_pkn_b, new_pkn_b, 1)
            old_pkn_g = "if-nez v2, :cond_1\n\n    iget-object v2, p0, Lpss;->h:Lppn;\n\n    invoke-virtual {v2}, Lppn;->g()V\n\n    :cond_1"
            new_pkn_g = "if-nez v2, :cond_1\n\n    iget-object v2, p0, Lpss;->a:Losw;\n\n    invoke-virtual {v2}, Losw;->b()Z\n\n    move-result v2\n\n    if-nez v2, :cond_1\n\n    iget-object v2, p0, Lpss;->h:Lppn;\n\n    invoke-virtual {v2}, Lppn;->g()V\n\n    :cond_1"
            if old_pkn_g in pkn_c:
                pkn_c = pkn_c.replace(old_pkn_g, new_pkn_g, 1)
            with open(pkn_path, "w", encoding="utf-8") as f:
                f.write(pkn_c)
        print("    [+] pkn.smali: Guarded tap resets to preserve active brightness/shadow sliders.")

    # 12. Patch pkw.smali: Guard resets on tap
    pkw_path = os.path.join(APKTOOL_DIR, "smali_classes2", "pkw.smali")
    if os.path.exists(pkw_path):
        with open(pkw_path, "r", encoding="utf-8") as f:
            pkw_c = f.read()
        if "cond_skip_rst_pkw_h" not in pkw_c:
            old_pkw_h = "iget-object p0, p0, Lpkw;->d:Lpkx;\n\n    iget-object v0, p0, Lpkx;->m:Lppn;\n\n    invoke-virtual {v0}, Lppn;->f()V\n\n    iget-object v0, p0, Lpkx;->d:Losw;\n\n    invoke-virtual {v0}, Losw;->a()V"
            new_pkw_h = "iget-object p0, p0, Lpkw;->d:Lpkx;\n\n    iget-object v0, p0, Lpkx;->d:Losw;\n\n    invoke-virtual {v0}, Losw;->b()Z\n\n    move-result v0\n\n    if-nez v0, :cond_skip_rst_pkw_h\n\n    iget-object v0, p0, Lpkx;->m:Lppn;\n\n    invoke-virtual {v0}, Lppn;->f()V\n\n    iget-object v0, p0, Lpkx;->d:Losw;\n\n    invoke-virtual {v0}, Losw;->a()V\n\n    :cond_skip_rst_pkw_h"
            if old_pkw_h in pkw_c:
                pkw_c = pkw_c.replace(old_pkw_h, new_pkw_h, 1)
        if "cond_skip_rst_pkw_i" not in pkw_c:
            old_pkw_i = "invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V\n\n    iget-object p0, v0, Lpkx;->m:Lppn;\n\n    invoke-virtual {p0}, Lppn;->f()V\n\n    invoke-virtual {v0}, Lpkx;->c()V\n\n    iget-object p0, v0, Lpkx;->d:Losw;\n\n    invoke-virtual {v0}, Losw;->a()V"
            new_pkw_i = "invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V\n\n    iget-object p0, v0, Lpkx;->d:Losw;\n\n    invoke-virtual {p0}, Losw;->b()Z\n\n    move-result p0\n\n    if-nez p0, :cond_skip_rst_pkw_i\n\n    iget-object p0, v0, Lpkx;->m:Lppn;\n\n    invoke-virtual {p0}, Lppn;->f()V\n\n    invoke-virtual {v0}, Lpkx;->c()V\n\n    iget-object p0, v0, Lpkx;->d:Losw;\n\n    invoke-virtual {v0}, Losw;->a()V\n\n    :cond_skip_rst_pkw_i"
            if old_pkw_i in pkw_c:
                pkw_c = pkw_c.replace(old_pkw_i, new_pkw_i, 1)
        with open(pkw_path, "w", encoding="utf-8") as f:
            f.write(pkw_c)
        print("    [+] pkw.smali: Guarded tap resets to preserve active brightness/shadow sliders.")

    # 13. Patch pkc.smali: Guard ppn.g() on tap
    pkc_path = os.path.join(APKTOOL_DIR, "smali_classes2", "pkc.smali")
    if os.path.exists(pkc_path):
        with open(pkc_path, "r", encoding="utf-8") as f:
            pkc_c = f.read()
        if "Losw;->b()Z" not in pkc_c:
            old_pkc_g = "if-nez v2, :cond_6\n\n    :try_start_9\n    iget-object v2, p0, Lpkc;->g:Lppn;\n\n    invoke-virtual {v2}, Lppn;->g()V"
            new_pkc_g = "if-nez v2, :cond_6\n\n    :try_start_9\n    iget-object v2, p0, Lpkc;->f:Losw;\n\n    invoke-virtual {v2}, Losw;->b()Z\n\n    move-result v2\n\n    if-nez v2, :cond_6\n\n    iget-object v2, p0, Lpkc;->g:Lppn;\n\n    invoke-virtual {v2}, Lppn;->g()V"
            if old_pkc_g in pkc_c:
                pkc_c = pkc_c.replace(old_pkc_g, new_pkc_g, 1)
                with open(pkc_path, "w", encoding="utf-8") as f:
                    f.write(pkc_c)
        print("    [+] pkc.smali: Guarded ppn.g() on tap.")

    # 14. Patch hxj.smali & hxh.smali: Guard AF/AE reset in hxh
    hxj_path = os.path.join(APKTOOL_DIR, "smali", "hxj.smali")
    if os.path.exists(hxj_path):
        with open(hxj_path, "r", encoding="utf-8") as f:
            hxj_c = f.read()
        hxj_c = hxj_c.replace(".field private final A:Lnrf;", ".field public final A:Lnrf;")
        with open(hxj_path, "w", encoding="utf-8") as f:
            f.write(hxj_c)

    hxh_path = os.path.join(APKTOOL_DIR, "smali_classes2", "hxh.smali")
    if os.path.exists(hxh_path):
        with open(hxh_path, "r", encoding="utf-8") as f:
            hxh_c = f.read()
        old_hxh = ":cond_e\n    check-cast p0, Ligp;\n\n    iget-object p0, p0, Ligp;->g:Lhxp;\n\n    invoke-interface {p0}, Lhxp;->i()V"
        new_hxh = ":cond_e\n    check-cast p0, Ligp;\n\n    iget-object p1, p0, Ligp;->A:Lnrf;\n\n    iget-boolean p1, p1, Lnrf;->c:Z\n\n    if-eqz p1, :cond_hxh_reset\n\n    iget-object p0, p0, Ligp;->g:Lhxp;\n\n    invoke-interface {p0}, Lhxp;->j()V\n\n    return-void\n\n    :cond_hxh_reset\n    iget-object p0, p0, Ligp;->g:Lhxp;\n\n    invoke-interface {p0}, Lhxp;->i()V"
        if old_hxh in hxh_c:
            hxh_c = hxh_c.replace(old_hxh, new_hxh, 1)
            with open(hxh_path, "w", encoding="utf-8") as f:
                f.write(hxh_c)
            print("    [+] hxh.smali: Guarded focus completion reset.")


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
        
        # 2a. Linear shadow curve in pzj.n
        target_pow = """    if-eqz p1, :cond_2

    float-to-double p1, v1

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p1

    double-to-float p1, p1

    div-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v6"""
        replacement_pow = """    if-eqz p1, :cond_2

    const/high16 p1, 0x3f800000    # 1.0f

    div-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v6"""
        if target_pow in content:
            content = content.replace(target_pow, replacement_pow)
            print("    [+] pzj.smali: Linear shadow response (1.0f) injected.")
        elif "const/high16 p1, 0x3f800000" in content:
            print("    [+] pzj.smali: shadow curve already linearized.")

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

        with open(lts_path, "w", encoding="utf-8") as f:
            f.write(content)

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
    print("[*] Copying APK to Desktop...")
    desktop_dir = os.path.expanduser("~/Desktop")
    if os.path.isdir(desktop_dir):
        dest_apk = os.path.join(desktop_dir, os.path.basename(signed_apk))
        shutil.copy2(signed_apk, dest_apk)
        dest_v104 = os.path.join(desktop_dir, "PixelCamera-1.0.4.apk")
        shutil.copy2(signed_apk, dest_v104)
        size_mb = os.path.getsize(dest_apk) / (1024 * 1024)
        print(f"    [+] Successfully copied APK to Desktop: {dest_apk} and {dest_v104} ({size_mb:.2f} MB)")
        
        pixelcam_dir = os.path.join(desktop_dir, "PixelCam")
        if os.path.isdir(pixelcam_dir):
            shutil.copy2(signed_apk, os.path.join(pixelcam_dir, os.path.basename(signed_apk)))
            shutil.copy2(signed_apk, os.path.join(pixelcam_dir, "PixelCamera_signed2.apk"))
            shutil.copy2(signed_apk, os.path.join(pixelcam_dir, "PixelCamera-1.0.4.apk"))
            print(f"    [+] Also copied to {pixelcam_dir}/PixelCamera-1.0.4.apk")
        return dest_v104
    else:
        print("    [!] Warning: Desktop directory not found, skipping Desktop copy.")
        return None

def install_and_launch(signed_apk):
    res = subprocess.run(["adb", "devices"], stdout=subprocess.PIPE, text=True)
    lines = [line.strip() for line in res.stdout.splitlines() if line.strip() and not line.startswith("List of")]
    if not lines:
        print("[!] No ADB devices connected, skipping install.")
        return
    print(f"[*] Installing {signed_apk} on connected device...")
    res = subprocess.run(["adb", "install", "-r", "-d", signed_apk], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    print(f"    {res.stdout.strip()}")
    if "Success" in res.stdout:
        print("[*] Launching PixelCamera (com.google.android.GoogleCameraEng)...")
        subprocess.run(["adb", "shell", "am", "force-stop", "com.google.android.GoogleCameraEng"])
        subprocess.run(["adb", "shell", "am", "start", "-n", "com.google.android.GoogleCameraEng/com.android.camera.CameraLauncher"])
        print("    [+] App launched successfully!")

def patch_looks_fine_tuning_and_grain():
    print("[*] Patching Looks Fine-Tuning controls and Film Grain settings...")
    # 1. Patch qut.smali to expose all 10 Tomte fine-tuning sliders unconditionally
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
            with open(qut_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] qut.smali: bypassed flag check, all 10 Tomte fine-tuning sliders enabled.")
        elif "goto :cond_0" in content:
            print("    [+] qut.smali: already patched to goto :cond_0.")

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

    # 3. Inject Film Grain toggle into camera_gm3_preferences.xml
    gm3_path = os.path.join(APKTOOL_DIR, "res", "xml", "camera_gm3_preferences.xml")
    if os.path.exists(gm3_path):
        with open(gm3_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_looks_film_grain_key" not in content:
            target_gm3 = '<com.google.android.apps.camera.ui.preference.ManagedSwitchPreferenceCompat android:icon="@drawable/gs_colors_vd_theme_24" android:title="@string/pref_sauce_stickiness_title" android:key="pref_sauce_stickiness_key" android:summary="@string/pref_sauce_stickiness_summary" android:order="0" android:defaultValue="false" />'
            replacement_gm3 = target_gm3 + '\n        <com.google.android.apps.camera.ui.preference.ManagedSwitchPreferenceCompat android:icon="@drawable/gs_grain_vd_theme_24" android:title="@string/pref_camera_looks_film_grain_title" android:key="pref_camera_looks_film_grain_key" android:summary="@string/pref_camera_looks_film_grain_summary" android:order="1" android:defaultValue="true" />'
            if target_gm3 in content:
                content = content.replace(target_gm3, replacement_gm3)
                with open(gm3_path, "w", encoding="utf-8") as f:
                    f.write(content)
                print("    [+] camera_gm3_preferences.xml: Film Grain toggle preference injected.")
        else:
            print("    [+] camera_gm3_preferences.xml: Film Grain preference already present.")

    # 4. Inject Film Grain toggle into camera_preferences.xml
    cam_pref_path = os.path.join(APKTOOL_DIR, "res", "xml", "camera_preferences.xml")
    if os.path.exists(cam_pref_path):
        with open(cam_pref_path, "r", encoding="utf-8") as f:
            content = f.read()
        if "pref_camera_looks_film_grain_key" not in content:
            target_cam = '<com.google.android.apps.camera.ui.preference.ManagedSwitchPreference android:icon="@drawable/gs_water_lux_vd_theme_24" android:layout="@layout/preference_with_margin" android:title="" android:key="pref_camera_acineta_enabled_key" android:summary="" android:defaultValue="false" />'
            replacement_cam = target_cam + '\n            <com.google.android.apps.camera.ui.preference.ManagedSwitchPreference android:icon="@drawable/gs_grain_vd_theme_24" android:layout="@layout/preference_with_margin" android:title="@string/pref_camera_looks_film_grain_title" android:key="pref_camera_looks_film_grain_key" android:summary="@string/pref_camera_looks_film_grain_summary" android:defaultValue="true" />'
            if target_cam in content:
                content = content.replace(target_cam, replacement_cam)
                with open(cam_pref_path, "w", encoding="utf-8") as f:
                    f.write(content)
                print("    [+] camera_preferences.xml: Film Grain toggle preference injected.")
        else:
            print("    [+] camera_preferences.xml: Film Grain preference already present.")

def main():
    clean_build_artifacts()
    patch_manifest()
    patch_app_name()
    patch_vku_smali()
    patch_qko_smali()
    patch_camera_app_smali()
    inject_tomte_init_helper()
    patch_qur_smali()
    patch_qus_smali()
    patch_qxg_smali()
    patch_ksf_smali()
    patch_izk_smali()
    patch_msr_smali()
    patch_ndf_smali()
    patch_jex_smali()
    patch_rfx_smali()
    patch_mtt_smali()
    patch_sauce_onboarding()
    patch_sof_smali()
    patch_creator_suite_smali()
    patch_dual_exposure_viewfinder()
    patch_dual_ev_ctrl_and_slider_sync()
    patch_looks_fine_tuning_and_grain()
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
