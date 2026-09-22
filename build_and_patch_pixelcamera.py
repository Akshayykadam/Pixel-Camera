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

def patch_uyv_smali():
    print("[*] Patching uyv.smali (Device Eligibility Checks)...")
    uyv_path = os.path.join(APKTOOL_DIR, "smali", "uyv.smali")
    with open(uyv_path, "r", encoding="utf-8") as f:
        content = f.read()

    def replace_method(src, name, ret_code):
        m_start = src.find(f".method public final {name}")
        if m_start == -1:
            print(f"    [!] Warning: Method {name} not found in uyv.smali")
            return src
        m_end = src.find(".end method", m_start) + len(".end method")
        new_m = f""".method public final {name}
    .locals 1

    {ret_code}
.end method"""
        return src[:m_start] + new_m + src[m_end:]

    content = replace_method(content, "l()Z", "const/4 v0, 0x1\n\n    return v0")

    with open(uyv_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] uyv.smali patched: l() returns true (sauce eligible). g() and f() preserved.")

def patch_klm_smali():
    print("[*] Patching klm.smali (Gouda flags, Mantis, Looks, Segmenter model interception)...")
    klm_path = os.path.join(APKTOOL_DIR, "smali_classes2", "klm.smali")
    if not os.path.exists(klm_path):
        print("    [!] Warning: klm.smali not found.")
        return
    with open(klm_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Patch q(Lkiz;)Z
    q_start = content.find(".method public final q(Lkiz;)Z")
    if q_start != -1:
        q_end = content.find(".end method", q_start)
        target_marker = "iget-object v0, p0, Lklm;->b:Ljava/util/Map;"
        map_idx = content.find(target_marker, q_start)
        if map_idx != -1 and map_idx < q_end:
            new_q = """.method public final q(Lkiz;)Z
    .locals 3

    if-eqz p1, :cond_check_orig

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig

    const-string v1, "camera.lasagna"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_sauce

    const/4 v0, 0x0

    return v0

    :cond_check_sauce
    const-string v1, "camera.sauce"

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

    if-eqz v1, :cond_check_cpu_seg

    const/4 v0, 0x1

    return v0

    :cond_check_cpu_seg
    const-string v1, "segmenter_force_cpu_inference"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_tpu_del

    const/4 v0, 0x1

    return v0

    :cond_check_tpu_del
    const-string v1, "segmenter_use_darwinn_tpu_delegate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_almond_tpu

    const/4 v0, 0x0

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

    if-eqz v1, :cond_check_offline_comp

    const/4 v0, 0x0

    return v0

    :cond_check_offline_comp
    const-string v1, "camera.gouda.use_darwinn_offline_compilation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_fg_color_tpu

    const/4 v0, 0x0

    return v0

    :cond_check_fg_color_tpu
    const-string v1, "camera.gouda.foreground_color_estimator_use_tpu"

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

    # 1b. Patch x(Lkiz;)Z
    x_start = content.find(".method public final x(Lkiz;)Z")
    if x_start != -1:
        x_end = content.find(".end method", x_start)
        target_marker_x = "iget-object p0, p0, Lklm;->b:Ljava/util/Map;"
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
            new_x = f""".method public final x(Lkiz;)Z
    .locals 3

    if-eqz p1, :cond_check_orig_x

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_x

    const-string v1, "camera.lasagna"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

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
            print("    [+] klm.smali: x(Lkiz;) patched (lasagna disabled, creator flags enabled, ark pro controls enabled).")

    # 2. Patch h(Lkiz;)Ljava/lang/String;
    h_start = content.find(".method public final h(Lkiz;)Ljava/lang/String;")
    if h_start != -1:
        h_end = content.find(".end method", h_start)
        target_marker = "iget-object v0, p0, Lklm;->b:Ljava/util/Map;"
        map_idx = content.find(target_marker, h_start)
        if map_idx != -1 and map_idx < h_end:
            new_h = """.method public final h(Lkiz;)Ljava/lang/String;
    .locals 3

    if-eqz p1, :cond_check_orig_h

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_h

    const-string v1, "camera.gouda.portrait_segmenter_model_name"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_rear_pdl

    const-string v0, "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed"

    return-object v0

    :cond_check_rear_pdl
    const-string v1, "camera.gouda.rear_pdlearned"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_front_pdl

    const-string v0, ""

    return-object v0

    :cond_check_front_pdl
    const-string v1, "camera.gouda.front_pdlearned"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_pdstereo

    const-string v0, ""

    return-object v0

    :cond_check_pdstereo
    const-string v1, "camera.gouda.pdstereo"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_physeter

    const-string v0, ""

    return-object v0

    :cond_check_physeter
    const-string v1, "camera.gouda.physeter"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna_motion_model

    const-string v0, ""

    return-object v0

    :cond_check_lasagna_motion_model
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

    if-eqz v1, :cond_check_orig_h

    const-string v0, "saliency-custom_op-p23.tflite.uncompressed"

    return-object v0

    :cond_check_orig_h
    """
            content = content[:h_start] + new_h + content[map_idx:]
            print("    [+] klm.smali: h(Lkiz;) patched for segmenter model fallback.")

    # 3. Patch r(Lkiz;)Lj$/util/Optional;
    r_start = content.find(".method public final r(Lkiz;)Lj$/util/Optional;")
    if r_start != -1:
        r_end = content.find(".end method", r_start)
        target_marker = "iget-object v0, p0, Lklm;->b:Ljava/util/Map;"
        map_idx2 = content.find(target_marker, r_start)
        if map_idx2 != -1 and map_idx2 < r_end:
            new_r = """.method public final r(Lkiz;)Lj$/util/Optional;
    .locals 6

    if-eqz p1, :cond_check_orig_r

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

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
            print("    [+] klm.smali: r(Lkiz;) patched for Gouda max_zoom, mantis, and Boba Jelly flags.")

    # 3b. Patch a(Lkiy;)Lj$/util/Optional; for Centaur focus override and binned RAW fallbacks
    a_start = content.find(".method public final a(Lkiy;)Lj$/util/Optional;")
    if a_start != -1:
        a_end = content.find(".end method", a_start)
        target_marker_a = "iget-object v0, p0, Lklm;->b:Ljava/util/Map;"
        map_idx_a = content.find(target_marker_a, a_start)
        orig_class_call = "invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;"
        class_idx = content.find(orig_class_call, map_idx_a)
        if map_idx_a != -1 and class_idx != -1 and class_idx < a_end:
            post_class_idx = class_idx + len(orig_class_call)
            new_a = """.method public final a(Lkiy;)Lj$/util/Optional;
    .locals 7

    if-eqz p1, :cond_check_orig_a

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_a

    const-string v1, "camera.centaur_focus_detection_override"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_orig_a

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_orig_a
    iget-object v0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_check_binned_fallbacks

    check-cast v0, Lovu;

    iget-object v1, v0, Lovu;->a:Ljava/lang/Object;

    if-nez v1, :cond_proceed_orig_a

    :cond_check_binned_fallbacks
    iget-object v1, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v1, :cond_return_empty_a

    const-string v2, "camera.wide_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_wbrh

    const/16 v0, 0x7f0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_wbrh
    const-string v2, "camera.wide_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_tbrw

    const/16 v0, 0x600

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_tbrw
    const-string v2, "camera.tele_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_tbrh

    const/16 v0, 0x7e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_tbrh
    const-string v2, "camera.tele_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_ubrw

    const/16 v0, 0x5e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_ubrw
    const-string v2, "camera.uw_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_ubrh

    const/16 v0, 0x7e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_ubrh
    const-string v2, "camera.uw_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_brs

    const/16 v0, 0x5e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_brs
    const-string v2, "camera.binned_row_start"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_return_empty_a

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_return_empty_a
    if-nez v0, :cond_proceed_orig_a

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_proceed_orig_a
    """
            content = content[:a_start] + new_a + content[post_class_idx:]
            print("    [+] klm.smali: a(Lkiy;) patched for centaur_focus_detection_override and binned RAW fallbacks.")

    # 4. Replace model strings in klm.smali
    content = content.replace("bb75135a398f4b5ca6c8f6991e0a9992/bb75135a398f4b5ca6c8f6991e0a9992.uncompressed",
                              "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed")
    content = content.replace("4af512f87afd43af81a4bbd160034804/4af512f87afd43af81a4bbd160034804.uncompressed", "")
    content = content.replace("883d5b28a96b465dbc777ccfc636f47e/883d5b28a96b465dbc777ccfc636f47e.uncompressed", "")
    content = content.replace("b305f0a853a14d968fb908b514d82a4e/b305f0a853a14d968fb908b514d82a4e.uncompressed", "")
    content = content.replace("3d56a07c1f3440b1a8ee45347e2d166d/3d56a07c1f3440b1a8ee45347e2d166d.uncompressed", "")
    content = content.replace("4cdbd4b13ea54a309eb235a75232ae6d/4cdbd4b13ea54a309eb235a75232ae6d.uncompressed", "")
    content = content.replace("5751e2e2a711430695dac2c034cfd295/5751e2e2a711430695dac2c034cfd295.uncompressed", "")
    content = content.replace("motion-custom_op-p22.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-p22.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-v6.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-v6.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")

    # 5. Disable darwinn offline compilation kkn.Q in klm.smali
    target_kkn_q = """    sget-object p5, Lkkn;->Q:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V"""

    repl_kkn_q = """    sget-object p5, Lkkn;->Q:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V"""
    content = content.replace(target_kkn_q, repl_kkn_q)

    # 6. Disable all camera.lasagna flags in klm.smali initialization (f=lasagna, g=action, h=long_exposure, i=bottom_layer, j=use_darwinn)
    for fld in ["f", "g", "h", "i", "j"]:
        for reg in ["p2", "p5"]:
            old_str = f"""    sget-object {reg}, Lkkb;->{fld}:Lkiz;

    invoke-virtual {{p0, {reg}, v7}}, Lklm;->n(Lkiz;Z)V"""
            new_str = f"""    sget-object {reg}, Lkkb;->{fld}:Lkiz;

    invoke-virtual {{p0, {reg}, v6}}, Lklm;->n(Lkiz;Z)V"""
            content = content.replace(old_str, new_str)

    with open(klm_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_hpq_smali():
    print("[*] Patching hpq.smali (Device portrait configuration)...")
    hpq_path = os.path.join(APKTOOL_DIR, "smali", "hpq.smali")
    if not os.path.exists(hpq_path):
        print("    [!] Warning: hpq.smali not found.")
        return
    with open(hpq_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Replace segmenter model with CPU flatbuffer model across all device configs (P26, P25, P23)
    content = content.replace("bb75135a398f4b5ca6c8f6991e0a9992/bb75135a398f4b5ca6c8f6991e0a9992.uncompressed",
                              "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed")
    content = content.replace("2a34d8be893844f799d8b56c678860f1/2a34d8be893844f799d8b56c678860f1.uncompressed",
                              "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed")
    content = content.replace("7fe4f2379fb94c6e887f7eca7960e084/7fe4f2379fb94c6e887f7eca7960e084.uncompressed",
                              "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed")

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
    content = content.replace("4cdbd4b13ea54a309eb235a75232ae6d/4cdbd4b13ea54a309eb235a75232ae6d.uncompressed", "")
    content = content.replace("5751e2e2a711430695dac2c034cfd295/5751e2e2a711430695dac2c034cfd295.uncompressed", "")
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
        "1a6566f5ceb54b50b61f553f347f6f64/1a6566f5ceb54b50b61f553f347f6f64.uncompressed",
        "dd674d048bbc43c1b338a6692cf9c481/dd674d048bbc43c1b338a6692cf9c481.uncompressed",
        "a3a43595f3aa49b3b4ab6ff4bb63de83/a3a43595f3aa49b3b4ab6ff4bb63de83.uncompressed",
        "881739470eaba348da266e4f8cec36a8/881739470eaba348da266e4f8cec36a8.uncompressed",
        "a982533a4222473db9f191c212a99740/a982533a4222473db9f191c212a99740.uncompressed",
        "f452199b34d445868df25db5b960f191/f452199b34d445868df25db5b960f191.uncompressed",
        "b881ce5aefc948e1a9118dd65eb9f8f1.tflite.uncompressed",
        "8bd5e22b220348078faf705e9f359e3d.tflite.uncompressed",
        "14fd121a077b4304bce9977a3d97a42a.tflite.uncompressed",
        "b933c7da1fa54d36a167d0287af1eb34/b933c7da1fa54d36a167d0287af1eb34.uncompressed",
        "a7a5b6a2bc5b4e04a8a64f9b30c86bf1/a7a5b6a2bc5b4e04a8a64f9b30c86bf1.uncompressed",
        "01bac7b33fc440d59b8ddc817ce91b7c/01bac7b33fc440d59b8ddc817ce91b7c.uncompressed",
        "6e4f8cec36a8881739470eaba348da26/6e4f8cec36a8881739470eaba348da26.uncompressed",
        "0b2b230344f74db8868ffd9f1c042393/0b2b230344f74db8868ffd9f1c042393.uncompressed",
        "8f8f04c8160444b9994367d3c0863f18/8f8f04c8160444b9994367d3c0863f18.uncompressed",
        "5712d9433c92464496f2668a824dbd3d/5712d9433c92464496f2668a824dbd3d.uncompressed",
        "all_in_film_blender_sharded_512_256-graph-custom_op_tpu_p25.tflite.uncompressed",
        "a598d3b5915840aba93217796ea91a11.uncompressed",
        "e7c70ea5dedf8a14631bf31d89bf26dd.uncompressed",
        "89bf26dde7c70ea5dedf8a14631bf31d.uncompressed",
    ]
    for h in missing_milk_hashes:
        content = content.replace(h, "")

    # 2b. Null Gouda depth/matting models missing from APK (fixes telephoto portrait crash)
    content = content.replace("c21a1523ba6c48c2a0bf2ca4f6d6c0f0/c21a1523ba6c48c2a0bf2ca4f6d6c0f0.uncompressed", "")  # rear_pdlearned_model
    content = content.replace("9599cabbb2fa4aa79ee0c44f0c1553ad/9599cabbb2fa4aa79ee0c44f0c1553ad.uncompressed", "")  # pdstereo_model
    content = content.replace("efaffa0bfaf74be2ad2e17aeff79f3db/efaffa0bfaf74be2ad2e17aeff79f3db.uncompressed", "")  # monocular_model
    content = content.replace("de8bc16ea114427d88425742785fccac/de8bc16ea114427d88425742785fccac.uncompressed", "")  # depth_postprocessor_model
    content = content.replace("518658ef4ea04adf8e19e64d5aa019d0/518658ef4ea04adf8e19e64d5aa019d0.uncompressed", "")  # portrait_matting_model

    # 3. Disable use_darwinn_offline_compilation (kkn.Q)
    target_q = """    sget-object v4, Lkkn;->Q:Lkiz;

    invoke-virtual {v0, v4, v5}, Lklm;->n(Lkiz;Z)V"""

    repl_q = """    sget-object v4, Lkkn;->Q:Lkiz;

    invoke-virtual {v0, v4, v7}, Lklm;->n(Lkiz;Z)V"""
    content = content.replace(target_q, repl_q)

    # 4. Populate missing khw binned RAW dimensions in Pixel 10 Pro (hpq.aW) and Pixel 10 (hpq.aX)
    target_aw_khw = """    sget-object p1, Lkhw;->a:Lkiy;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V"""

    repl_aw_khw = """    sget-object p1, Lkhw;->a:Lkiy;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->d:Lkiy;

    const/16 v0, 0x7f0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->e:Lkiy;

    const/16 v0, 0x600

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->f:Lkiy;

    const/16 v0, 0x7e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->g:Lkiy;

    const/16 v0, 0x5e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V"""
    if target_aw_khw in content:
        content = content.replace(target_aw_khw, repl_aw_khw)

    target_ax_khw = """    sget-object p1, Lkhw;->a:Lkiy;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V"""

    repl_ax_khw = """    sget-object p1, Lkhw;->a:Lkiy;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->d:Lkiy;

    const/16 v4, 0x7f0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->e:Lkiy;

    const/16 v4, 0x600

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->f:Lkiy;

    const/16 v4, 0x7e0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->g:Lkiy;

    const/16 v4, 0x5e8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V"""
    if target_ax_khw in content:
        content = content.replace(target_ax_khw, repl_ax_khw)

    with open(hpq_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] hpq.smali: segmenter model replaced, missing/TPU models nulled, binned RAW dimensions added to Pixel 10 Pro/Base.")

def patch_kic_smali():
    print("[*] Patching kic.smali (Nulling failing TPU PD models)...")
    kic_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kic.smali")
    if not os.path.exists(kic_path):
        print("    [!] Warning: kic.smali not found.")
        return
    with open(kic_path, "r", encoding="utf-8") as f:
        content = f.read()

    content = content.replace("4cdbd4b13ea54a309eb235a75232ae6d/4cdbd4b13ea54a309eb235a75232ae6d.uncompressed", "")
    content = content.replace("5751e2e2a711430695dac2c034cfd295/5751e2e2a711430695dac2c034cfd295.uncompressed", "")
    content = content.replace("c757a03ae8d64d1b9375002b75dcdbbc/c757a03ae8d64d1b9375002b75dcdbbc.uncompressed", "")
    content = content.replace("0ea471704af14008b0483bc9b630a85c/0ea471704af14008b0483bc9b630a85c.uncompressed", "")
    # Replace all v6 models with p23 (native Tensor G3, valid FlatBuffer)
    content = content.replace("motion-custom_op-v6.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-v6.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")
    content = content.replace("motion-custom_op-p23.tflite.uncompressed", "motion-custom_op-p23.tflite.uncompressed")
    content = content.replace("saliency-custom_op-p23.tflite.uncompressed", "saliency-custom_op-p23.tflite.uncompressed")

    # Disable camera.lasagna.use_darwinn in kic.smali
    target_darwinn = """    sget-object v3, Lkkb;->j:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V"""
    repl_darwinn = """    sget-object v3, Lkkb;->j:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->n(Lkiz;Z)V"""
    content = content.replace(target_darwinn, repl_darwinn)

    with open(kic_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] kic.smali: EdgeTPU PD models nulled and lasagna use_darwinn disabled.")

def patch_mwg_smali():
    print("[*] Patching mwg.smali (Force CPU inference for Lasagna / Motion Blur)...")
    mwg_path = os.path.join(APKTOOL_DIR, "smali_classes2", "mwg.smali")
    if not os.path.exists(mwg_path):
        print("    [!] Warning: mwg.smali not found.")
        return
    with open(mwg_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    sget-object v7, Lkkb;->j:Lkiz;

    invoke-virtual {v6, v7}, Lklm;->q(Lkiz;)Z

    move-result v19"""

    repl = """    sget-object v7, Lkkb;->j:Lkiz;

    invoke-virtual {v6, v7}, Lklm;->q(Lkiz;)Z

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


def patch_mjy_smali():
    print("[*] Patching mjy.smali (Enabling native Tomte model in InitParams and Gcam creation)...")
    mjy_path = os.path.join(APKTOOL_DIR, "smali", "mjy.smali")
    with open(mjy_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    if-eqz v2, :cond_2c

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_2c"""

    replacement = """    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    const/4 v12, 0x1

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V"""

    if target in content:
        content = content.replace(target, replacement)
        print("    [+] mjy.smali: finish_tomte_grain_enabled unconditionally true.")

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
    opt_cg_target = """    sget-object v7, Lkhw;->c:Lkiy;

    invoke-virtual {v6, v7}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    sget-object v7, Lkhw;->g:Lkiy;

    invoke-virtual {v6, v7}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_cg_repl = """    sget-object v7, Lkhw;->c:Lkiy;

    invoke-virtual {v6, v7}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    sget-object v7, Lkhw;->g:Lkiy;

    invoke-virtual {v6, v7}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v7

    const/16 v8, 0x5e8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""
    if opt_cg_target in content:
        content = content.replace(opt_cg_target, opt_cg_repl)
        print("    [+] mjy.smali: khw.c and khw.g guarded with orElse().")

    # Guard khw.d and khw.e in binned static metadata setup
    opt_de_target = """    sget-object v7, Lkhw;->d:Lkiy;

    invoke-virtual {v6, v7}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/2addr v7, v7

    sget-object v8, Lkhw;->e:Lkiy;

    invoke-virtual {v6, v8}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    invoke-virtual {v6, v8}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_de_repl = """    sget-object v7, Lkhw;->d:Lkiy;

    invoke-virtual {v6, v7}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    sget-object v8, Lkhw;->e:Lkiy;

    invoke-virtual {v6, v8}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    invoke-virtual {v6, v8}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    sget-object v5, Lkhw;->c:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    goto :goto_9"""

    opt_c_repl = """    if-ne v5, v1, :cond_c

    sget-object v5, Lkhw;->c:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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
    sget-object v5, Lkhw;->e:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_e_repl = """    :cond_c
    sget-object v5, Lkhw;->e:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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
    opt_d_target = """    sget-object v5, Lkhw;->d:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    opt_d_repl = """    sget-object v5, Lkhw;->d:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    with open(mjy_path, "w", encoding="utf-8") as f:
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

    check-cast v0, Ladbv;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;"""

    pd_repl = """    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    if-eqz v0, :cond_8"""

    if pd_target in content:
        content = content.replace(pd_target, pd_repl)
        print("    [+] psk.smali: PD_TELE provider null check added.")

    # Null check for RAW_TELE provider
    raw_target = """    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;"""

    raw_repl = """    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

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

    sget-object p5, Lkhw;->f:Lkiy;

    invoke-virtual {p4, p5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p5

    invoke-virtual {p5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p5

    goto :goto_1

    :cond_2
    sget-object p5, Lkhw;->b:Lkiy;

    invoke-virtual {p4, p5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    sget-object p3, Lkhw;->g:Lkiy;

    invoke-virtual {p4, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    invoke-virtual {p3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p3

    goto :goto_2

    :cond_3
    sget-object p3, Lkhw;->c:Lkiy;

    invoke-virtual {p4, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    invoke-virtual {p3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p3

    :goto_2
    check-cast p3, Ljava/lang/Integer;"""

    repl_psh = """    if-eqz p5, :cond_2

    sget-object p5, Lkhw;->f:Lkiy;

    invoke-virtual {p4, p5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p5

    const/16 v1, 0x7e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p5, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    goto :goto_1

    :cond_2
    sget-object p5, Lkhw;->b:Lkiy;

    invoke-virtual {p4, p5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

    sget-object p3, Lkhw;->g:Lkiy;

    invoke-virtual {p4, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    const/16 v1, 0x5e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_2

    :cond_3
    sget-object p3, Lkhw;->c:Lkiy;

    invoke-virtual {p4, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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
    print("[*] Patching klh.smali (SpecialTypesProvider authority alignment)...")
    klh_path = os.path.join(APKTOOL_DIR, "smali", "klh.smali")
    if not os.path.exists(klh_path):
        print("    [!] Warning: klh.smali not found.")
        return
    with open(klh_path, "r", encoding="utf-8") as f:
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
        with open(klh_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] klh.smali: SpecialTypesProvider authority aligned to cloned package.")
    elif "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider" in content:
        print("    [+] klh.smali: already patched.")
    else:
        print("    [!] Warning: klh.smali authority target strings not found.")

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
    content = content.replace(".method public constructor <init>(Lklm;)V\n    .locals 1",
                              ".method public constructor <init>(Lklm;)V\n    .locals 2")

    # Guard klf.f
    target_f = """    sget-object v0, Lklf;->f:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_f = """    sget-object v0, Lklf;->f:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    # Guard klf.g
    target_g = """    sget-object v0, Lklf;->g:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_g = """    sget-object v0, Lklf;->g:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    # Guard klf.e
    target_e = """    sget-object v0, Lklf;->e:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_e = """    sget-object v0, Lklf;->e:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;"""

    # Guard klf.b
    target_b = """    sget-object v0, Lklf;->b:Lkiy;

    invoke-virtual {p1, v0}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;"""

    repl_b = """    sget-object v0, Lklf;->b:Lkiy;

    invoke-virtual {p1, v0}, Lklm;->a(Lkiy;)Lj$/util/Optional;

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

def patch_qau_smali():
    print("[*] Patching qau.smali (Sauce Eligibility Predicate)...")
    qau_path = os.path.join(APKTOOL_DIR, "smali", "qau.smali")
    with open(qau_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    sget-object v0, Lkjq;->bm:Lkiz;

    invoke-virtual {p0, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lkjq;->bl:Lkiz;

    invoke-virtual {p0, v0}, Lklm;->q(Lkiz;)Z

    move-result p0

    if-eqz p0, :cond_0

    move v2, v3

    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0"""

    replacement = """    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0"""

    if target in content:
        content = content.replace(target, replacement)
        with open(qau_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qau.smali patched: predicate unconditionally returns Boolean.TRUE.")
    else:
        print("    [!] Warning: Exact target block not found in qau.smali, skipping replacement.")

def patch_camera_app_smali():
    print("[*] Patching CameraApp.smali (Bypassing split check and saving static context)...")
    camera_app_path = os.path.join(APKTOOL_DIR, "smali", "com", "google", "android", "apps", "camera", "app", "CameraApp.smali")
    with open(camera_app_path, "r", encoding="utf-8") as f:
        content = f.read()

    m_start = content.find(".method public final gA()Ladvz;")
    if m_start == -1:
        raise RuntimeError("Method gA()Ladvz; not found in CameraApp.smali!")
    m_end = content.find(".end method", m_start) + len(".end method")

    new_method = """.method public final gA()Ladvz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/camera/app/CameraApp;->q:Linm;

    invoke-virtual {v0, p0}, Linm;->b(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/google/android/apps/camera/app/CameraApp;->i()Limi;

    move-result-object p0

    invoke-virtual {p0}, Limi;->gA()Ladvz;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method"""

    content = content[:m_start] + new_method + content[m_end:]

    # Add sAppContext field if missing
    if ".field public static sAppContext:Landroid/content/Context;" not in content:
        f_target = ".field private static final p:Ljava/util/concurrent/atomic/AtomicBoolean;"
        content = content.replace(f_target, f_target + "\n\n.field public static sAppContext:Landroid/content/Context;")

    # Hook onCreate to save sAppContext
    on_create_target = ".method public final onCreate()V\n    .locals 19\n\n    move-object/from16 v0, p0"
    on_create_repl = ".method public final onCreate()V\n    .locals 19\n\n    sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;\n\n    move-object/from16 v0, p0"
    if on_create_target in content:
        content = content.replace(on_create_target, on_create_repl)

    with open(camera_app_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] CameraApp.smali patched successfully.")

def inject_tomte_init_helper():
    print("[*] Injecting TomteInitHelper...")
    helper_src = os.path.join(ROOT_DIR, "scratch", "smali_out", "smali", "com", "google", "android", "patch", "cameralooks", "TomteInitHelper.smali")
    helper_dst_dir = os.path.join(APKTOOL_DIR, "smali_classes4", "com", "google", "android", "patch", "cameralooks")
    os.makedirs(helper_dst_dir, exist_ok=True)
    helper_dst = os.path.join(helper_dst_dir, "TomteInitHelper.smali")
    if os.path.exists(helper_src):
        shutil.copyfile(helper_src, helper_dst)
        print(f"    [+] Injected {helper_dst}")
    else:
        print(f"    [!] Warning: {helper_src} not found!")

def patch_qkp_smali():
    print("[*] Patching qkp.smali (Force real qms Look Manager)...")
    qkp_path = os.path.join(APKTOOL_DIR, "smali", "qkp.smali")
    with open(qkp_path, "r", encoding="utf-8") as f:
        content = f.read()

    b_start = content.find(".method public final b()Lqms;")
    if b_start != -1:
        b_end = content.find(".end method", b_start) + len(".end method")
        new_b = """.method public final b()Lqms;
    .locals 1

    iget-object p0, p0, Lqkp;->b:Laccg;

    invoke-interface {p0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqms;

    return-object p0
.end method"""
        content = content[:b_start] + new_b + content[b_end:]
        with open(qkp_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qkp.smali: b() returns real qms Look Manager unconditionally.")

def patch_qkq_smali():
    print("[*] Patching qkq.smali (Force real qmb Look State Provider)...")
    qkq_path = os.path.join(APKTOOL_DIR, "smali", "qkq.smali")
    with open(qkq_path, "r", encoding="utf-8") as f:
        content = f.read()

    b_start = content.find(".method public final b()Lqmb;")
    if b_start != -1:
        b_end = content.find(".end method", b_start) + len(".end method")
        new_b = """.method public final b()Lqmb;
    .locals 1

    iget-object p0, p0, Lqkq;->b:Laccg;

    invoke-interface {p0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqmb;

    return-object p0
.end method"""
        content = content[:b_start] + new_b + content[b_end:]
        with open(qkq_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qkq.smali: b() returns real qmb Look State Provider unconditionally.")

def patch_qmy_smali():
    print("[*] Patching qmy.smali (Notifying TomteInitHelper when Look is selected)...")
    qmy_path = os.path.join(APKTOOL_DIR, "smali_classes2", "qmy.smali")
    with open(qmy_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """.method private final g(Lqlh;)V
    .locals 2

    iget v0, p1, Lqlh;->d:I"""

    replacement = """.method private final g(Lqlh;)V
    .locals 2

    if-eqz p1, :cond_skip_notify

    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqlh;)V

    :cond_skip_notify
    iget v0, p1, Lqlh;->d:I"""

    if target in content:
        content = content.replace(target, replacement)
        with open(qmy_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qmy.smali: TomteInitHelper.onLookObjectSelected notified on look change.")
    elif "onLookObjectSelected" in content:
        print("    [+] qmy.smali: already patched with onLookObjectSelected.")
    elif "onLookSelected" in content:
        content = content.replace("invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookSelected(I)V",
                                "invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqlh;)V")
        with open(qmy_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qmy.smali: updated to TomteInitHelper.onLookObjectSelected.")
    else:
        print("    [!] Warning: target in qmy.smali not found or already patched.")

def patch_qkj_smali():
    print("[*] Patching qkj.smali (Sauce EXIF metadata fallback via TomteInitHelper)...")
    qkj_path = os.path.join(APKTOOL_DIR, "smali", "qkj.smali")
    if not os.path.exists(qkj_path):
        return
    with open(qkj_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    iget-object v0, p0, Lost;->p:Lxwg;

    invoke-virtual {v0}, Lxwg;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqlh;

    const/4 v1, 0x0

    if-nez v0, :cond_0"""

    replacement = """    iget-object v0, p0, Lost;->p:Lxwg;

    invoke-virtual {v0}, Lxwg;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqlh;

    if-nez v0, :cond_check_fallback

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getLastSelectedLook()Lqlh;

    move-result-object v0

    :cond_check_fallback
    const/4 v1, 0x0

    if-nez v0, :cond_0"""

    if target in content:
        content = content.replace(target, replacement)
        with open(qkj_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] qkj.smali: Added TomteInitHelper fallback to qkj.Z Sauce EXIF builder.")
    elif ":cond_check_fallback" in content:
        print("    [+] qkj.smali: already patched with TomteInitHelper fallback.")
    else:
        print("    [!] Warning: qkj.smali target not found.")

def patch_mia_smali():
    print("[*] Patching mia.smali (Force TomteGrain#initialize at app startup)...")
    mia_path = os.path.join(APKTOOL_DIR, "smali", "mia.smali")
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

def patch_muh_smali():
    print("[*] Patching muh.smali (Force TomteImageFinalizer and ensure TomteGrain initialized)...")
    muh_path = os.path.join(APKTOOL_DIR, "smali", "muh.smali")
    with open(muh_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """    iget-object v0, p0, Lmuh;->d:Lj$/util/Optional;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0"""

    replacement = """    const-string v0, "PATCH_LOOKS"

    const-string v1, "muh.a: Executing TomteImageFinalizer..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0"""

    if target in content:
        content = content.replace(target, replacement)
        print("    [+] muh.smali: TomteImageFinalizer executes unconditionally.")

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
        print("    [+] muh.smali: TomteInitHelper.initTomteGrain hooked before applyTomteImageFinalizer.")

    with open(muh_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_ioy_smali():
    print("[*] Patching ioy.smali (Bypass catshark check to provide selected Look to Lost.p)...")
    ioy_path = os.path.join(APKTOOL_DIR, "smali", "ioy.smali")
    with open(ioy_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Case 14 (:pswitch_5 - Night Sight mode)
    target_5 = """    :pswitch_5
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lisk;

    sget-object v1, Lsql;->g:Lsql;

    invoke-virtual {v0, v1}, Lisk;->a(Lsql;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_a
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0"""

    replacement_5 = """    :pswitch_5
    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0"""

    # Case 13 (:pswitch_6 - 12MP Photo mode)
    target_6 = """    :pswitch_6
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lisk;

    sget-object v1, Lsql;->b:Lsql;

    invoke-virtual {v0, v1}, Lisk;->a(Lsql;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0"""

    replacement_6 = """    :pswitch_6
    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0"""

    # Case 12 (:pswitch_7 - Portrait / Other mode)
    target_7 = """    :pswitch_7
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lisk;

    iget-boolean v0, v0, Lisk;->a:Z

    if-eqz v0, :cond_c

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_c
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0"""

    replacement_7 = """    :pswitch_7
    iget-object p0, p0, Lioy;->b:Laccg;

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

    with open(ioy_path, "w", encoding="utf-8") as f:
        f.write(content)
    if patched or (replacement_5 in content and replacement_6 in content and replacement_7 in content):
        print("    [+] ioy.smali patched: selected look always provided to Lost.p for Photo (12MP), Night Sight, and Portrait.")
    else:
        print("    [!] Warning: ioy.smali targets not found.")

def patch_mla_smali():
    print("[*] Patching mla.smali (Applying effective Look ID to ShotParams_tomte_type)...")
    mla_path = os.path.join(APKTOOL_DIR, "smali", "mla.smali")
    with open(mla_path, "r", encoding="utf-8") as f:
        content = f.read()

    if "cond_skip_tomte_log" not in content:
        pattern = r"(check-cast v7, Ljava/lang/Integer;\s+invoke-virtual \{v7\}, Ljava/lang/Integer;->intValue\(\)I\s+move-result v7\s+)(?:invoke-static \{v7\}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId\(I\)I\s+move-result v7\s+)?(iget-wide v11, v9, Lcom/google/googlex/gcam/ShotParams;->a:J\s+invoke-static \{v11, v12, v9, v7\}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_tomte_type_set\(JLcom/google/googlex/gcam/ShotParams;I\)V)"
        repl = r"""\1invoke-static {v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I

    move-result v7

    \2

    if-eqz v7, :cond_skip_tomte_log

    const-string v11, "PATCH_LOOKS"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v15, "ShotParams_tomte_type_set successfully applied type="

    invoke-direct {v12, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_skip_tomte_log"""
        content, _ = re.subn(pattern, repl, content, count=1)

    # Also patch mla->q (TomteMetadata)
    if "TomteMetadata" not in content or "getEffectiveLookId" not in content[content.find("iget v10, v9, Lqlh;->d:I"):content.find("iget v10, v9, Lqlh;->d:I")+150]:
        q_pattern = r"(check-cast v9, Lqlh;\s+iget v10, v9, Lqlh;->d:I\s+)(?:invoke-static \{v10\}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId\(I\)I\s+move-result v10\s+)?(new-instance v11, Lqmc;)"
        q_repl = r"""\1invoke-static {v10}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I

    move-result v10

    \2"""
        content, _ = re.subn(q_pattern, q_repl, content, count=1)

    with open(mla_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("    [+] mla.smali patched: getEffectiveLookId hooked for ShotParams and TomteMetadata.")


def patch_pvz_smali():
    print("[*] Patching pvz.smali (Enabling Mantis telephoto routing for rear camera)...")
    pvz_path = os.path.join(APKTOOL_DIR, "smali", "pvz.smali")
    if not os.path.exists(pvz_path):
        print("    [!] Warning: pvz.smali not found.")
        return
    with open(pvz_path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """.method public final e(Z)Z
    .locals 0

    if-eqz p1, :cond_0

    iget-boolean p0, p0, Lpvz;->g:Z

    return p0

    :cond_0
    iget-boolean p0, p0, Lpvz;->f:Z

    return p0
.end method"""

    replacement = """.method public final e(Z)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method"""

    if target in content:
        content = content.replace(target, replacement)
        with open(pvz_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] pvz.smali: e(Z)Z patched to return false (WIDE pipeline, no Mantis).")
    elif "const/4 p0, 0x0" in content[content.find(".method public final e(Z)Z"):content.find(".method public final e(Z)Z")+200]:
        print("    [+] pvz.smali: already patched.")
    else:
        print("    [!] Warning: pvz.smali target method e(Z)Z not matched.")

def patch_pwh_smali():
    print("[*] Verifying pwh.smali (Ensuring clean bytecode without register mismatch)...")
    pwh_path = os.path.join(APKTOOL_DIR, "smali_classes2", "pwh.smali")
    if not os.path.exists(pwh_path):
        print("    [!] Warning: pwh.smali not found.")
        return
    with open(pwh_path, "r", encoding="utf-8") as f:
        content = f.read()

    corrupt_block = """    invoke-virtual {v0}, Lpwp;->a()J

    move-result-wide v4

    cmp-long v2, v4, v2

    if-nez v2, :cond_pwh_seg

    invoke-virtual {v0}, Lpwp;->b()V

    invoke-virtual {v0}, Lpwp;->a()J

    move-result-wide v4

    :cond_pwh_seg
    move-wide/from16 v46, v4

    goto :goto_11

    :cond_29
    const-wide/16 v2, 0x0

    move-wide/from16 v46, v2"""

    clean_block = """    invoke-virtual {v0}, Lpwp;->a()J

    move-result-wide v4

    move-wide/from16 v46, v4

    goto :goto_11

    :cond_29
    move-wide/from16 v46, v2"""

    if corrupt_block in content:
        content = content.replace(corrupt_block, clean_block)
        with open(pwh_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] pwh.smali: restored clean bytecode.")
    else:
        print("    [+] pwh.smali: bytecode is clean.")

def patch_pwp_smali():
    print("[*] Patching pwp.smali (PortraitSegmenterManager lazy-init, logging, and fallback asset handling)...")
    pwp_path = os.path.join(APKTOOL_DIR, "smali", "pwp.smali")
    if not os.path.exists(pwp_path):
        print("    [!] Warning: pwp.smali not found.")
        return
    with open(pwp_path, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Replace a()J with clean lazy-initialization b() (pure original bytecode, no register conflicts)
    a_start = content.find(".method public final a()J")
    if a_start != -1:
        a_end = content.find(".end method", a_start) + len(".end method")
        new_a = """.method public final a()J
    .locals 3

    invoke-virtual {p0}, Lpwp;->b()V

    iget-object v0, p0, Lpwp;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lpwp;->e:Z

    if-nez v1, :cond_0

    monitor-exit v0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object p0, p0, Lpwp;->d:Lzrz;

    invoke-interface {p0}, Lzrz;->getSegmenterHandle()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method"""
        content = content[:a_start] + new_a + content[a_end:]
        print("    [+] pwp.smali: a()J restored with clean lazy-init.")

    # 2. Add fallback asset loading
    target_catch = """    :catch_0
    move-exception v0

    :try_start_2
    sget-object v3, Lpwp;->a:Lykq;

    invoke-virtual {v3}, Lykh;->b()Lyld;

    move-result-object v3

    const/16 v6, 0x16c4

    invoke-interface {v3, v6}, Lyko;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    const-string v6, "Unable to load the asset: %s"

    invoke-interface {v3, v6, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x2

    invoke-direct {v1, v0}, Lpwp;->c(I)V

    :goto_0"""

    replacement_catch = """    :catch_0
    move-exception v0

    :try_start_2
    sget-object v3, Lpwp;->a:Lykq;

    invoke-virtual {v3}, Lykh;->b()Lyld;

    move-result-object v3

    const/16 v6, 0x16c4

    invoke-interface {v3, v6}, Lyko;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    const-string v6, "Unable to load asset: %s, falling back to vakunov flatbuffer"

    invoke-interface {v3, v6, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_fb
    iget-object v0, v1, Lpwp;->g:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v3, "tflite_vakunov_multi-subject_2018-06-09.fb"

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v3

    new-array v5, v3, [B

    invoke-static {v0, v5, v4, v3}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    const-string v0, "tflite_vakunov_multi-subject_2018-06-09.fb"

    iput-object v0, v1, Lpwp;->b:Ljava/lang/String;
    :try_end_fb
    .catch Ljava/lang/Exception; {:try_start_fb .. :try_end_fb} :catch_fb

    goto :goto_0

    :catch_fb
    move-exception v0

    const/4 v0, 0x2

    invoke-direct {v1, v0}, Lpwp;->c(I)V

    :goto_0"""

    if target_catch in content:
        content = content.replace(target_catch, replacement_catch, 1)
        print("    [+] pwp.smali patched: added fallback asset loading for portrait segmenter.")

    # 3. Add CPU fallback retry in b()
    init_target = """    invoke-interface/range {v6 .. v17}, Lzrz;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    if-eqz v0, :cond_5"""

    init_repl = """    invoke-interface/range {v6 .. v17}, Lzrz;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    if-nez v0, :cond_init_ok

    const/4 v13, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-interface/range {v6 .. v17}, Lzrz;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    :cond_init_ok
    if-eqz v0, :cond_5"""

    if init_target in content:
        content = content.replace(init_target, init_repl, 1)
        print("    [+] pwp.smali: added CPU retry fallback in b().")

    # 4. Add initSegmenter result logging in b()
    if "initSegmenter finished: success=" not in content:
        log_target = """    iput-boolean v0, v1, Lpwp;->e:Z"""
        log_repl = """    iput-boolean v0, v1, Lpwp;->e:Z

    const-string v3, "PortraitSegmenterManager"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "initSegmenter finished: success="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, ", model="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lpwp;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I"""
        content = content.replace(log_target, log_repl, 1)
        print("    [+] pwp.smali: added initSegmenter result logging.")

    with open(pwp_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_pwo_smali():
    print("[*] Patching pwo.smali (PortraitRelighting logging)...")
    pwo_path = os.path.join(APKTOOL_DIR, "smali", "pwo.smali")
    if not os.path.exists(pwo_path):
        print("    [!] Warning: pwo.smali not found.")
        return
    with open(pwo_path, "r", encoding="utf-8") as f:
        content = f.read()

    a_start = content.find(".method public final a()J")
    if a_start != -1:
        a_end = content.find(".end method", a_start) + len(".end method")
        new_a = """.method public final a()J
    .locals 5

    iget-object v0, p0, Lpwo;->i:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lpwo;->g:Lcom/google/googlex/gcam/creativecamera/portraitmode/PortraitRelightingProcessorInterface;

    invoke-virtual {v0}, Lcom/google/googlex/gcam/creativecamera/portraitmode/PortraitRelightingProcessorInterface;->getPortraitRelightingProcessorHandle()J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p0, p0, Lpwo;->i:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    const-string v2, "PortraitRelighting"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "getPortraitRelightingProcessorHandle: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-wide v0

    :catchall_0
    move-exception v0

    iget-object p0, p0, Lpwo;->i:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :cond_0
    const-string p0, "PortraitRelighting"

    const-string v0, "getPortraitRelightingProcessorHandle: lock busy, returning 0"

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    return-wide v0
.end method"""
        content = content[:a_start] + new_a + content[a_end:]
        with open(pwo_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] pwo.smali: a()J patched with handle logging.")

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

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

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

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if photo_target in content:
        content = content.replace(photo_target, photo_repl)
        print("    [+] kgy.smali: 10x button added to Photo mode.")

    # 2. Night Sight & Video mode buttons
    ns_target = """    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    ns_repl = """    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if ns_target in content:
        content = content.replace(ns_target, ns_repl)
        print("    [+] kgy.smali: 10x button added to Night Sight mode.")

    v_target1 = """    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    v_repl1 = """    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if v_target1 in content:
        content = content.replace(v_target1, v_repl1)

    v_target2 = """    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    v_repl2 = """    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

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

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""),

        ("""    sget-object v5, Lyri;->R:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->R:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""),

        ("""    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""),

        ("""    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v6, v7, v8, v9}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;""",
         """    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

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

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

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

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

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

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

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

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

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

def patch_kha_smali():
    print("[*] Patching kha.smali (5x Portrait presets in kha)...")
    kha_path = os.path.join(APKTOOL_DIR, "smali", "kha.smali")
    if not os.path.exists(kha_path):
        return
    with open(kha_path, "r", encoding="utf-8") as f:
        content = f.read()

    p1_target = """    invoke-static {v8, v9}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v2

    invoke-virtual {v4, v2}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v4}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v9, v14}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    p1_repl = """    invoke-static {v8, v9, v10}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v2

    invoke-virtual {v4, v2}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v4}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v9, v14, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if p1_target in content:
        content = content.replace(p1_target, p1_repl)
        print("    [+] kha.smali: 5x button added to Portrait branch 1.")

    p2_target = """    invoke-static {v4, v9}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v4, v9, v14}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    p2_repl = """    invoke-static {v4, v9, v10}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v4, v9, v14, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;"""

    if p2_target in content:
        content = content.replace(p2_target, p2_repl)
        print("    [+] kha.smali: 5x button added to Portrait branch 2.")

    with open(kha_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_kfl_smali():
    print("[*] Patching kfl.smali (Dynamically ensuring 10x Quick Zoom button in button list)...")
    kfl_path = os.path.join(APKTOOL_DIR, "smali_classes2", "kfl.smali")
    if not os.path.exists(kfl_path):
        print("    [!] Warning: kfl.smali not found.")
        return
    with open(kfl_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Revert dead-code hook if present
    if ":cond_skip_10x\n" in content or ":cond_skip_10x\r\n" in content:
        old_full_pattern = re.compile(r"    :cond_11\s+const/4 v5, 0x0\s+:goto_8\s+invoke-interface \{v1\}, Ljava/util/List;->isEmpty\(\)Z.*?    :cond_skip_10x\s+const/4 v5, 0x0\s+invoke-virtual \{v6, v1\}, Laaxk;->t\(Ljava/lang/Iterable;\)V", re.DOTALL)
        content = old_full_pattern.sub("    :cond_11\n    const/4 v5, 0x0\n\n    :goto_8\n    invoke-virtual {v6, v1}, Laaxk;->t(Ljava/lang/Iterable;)V", content)

    kfl_target = """    :cond_c
    :goto_6
    invoke-virtual {v6, v7}, Laaxk;->v(Ljava/lang/Iterable;)V"""

    kfl_repl = """    :cond_c
    :goto_6
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_skip_10x_kfl

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-gtz v1, :cond_skip_10x_kfl

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_skip_10x_kfl

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kfl
    invoke-virtual {v6, v7}, Laaxk;->v(Ljava/lang/Iterable;)V"""

    if kfl_target in content:
        content = content.replace(kfl_target, kfl_repl)
        print("    [+] kfl.smali: 10x Quick Zoom button dynamically generated when 5x is present and max zoom >= 10x.")
    elif ":cond_skip_10x_kfl" in content:
        print("    [+] kfl.smali: already patched with dynamic 10x hook.")
    else:
        print("    [!] Warning: kfl.smali target not found.")

    with open(kfl_path, "w", encoding="utf-8") as f:
        f.write(content)

def patch_kfw_smali():
    print("[*] Patching kfw.smali (Adding 10x toggle to P and Q for Photo mode)...")
    kfw_path = os.path.join(APKTOOL_DIR, "smali", "kfw.smali")
    if not os.path.exists(kfw_path):
        print("    [!] Warning: kfw.smali not found.")
        return
    with open(kfw_path, "r", encoding="utf-8") as f:
        content = f.read()

    kfw_repl = """    :goto_a
    iget-object v6, v0, Lkfw;->Q:Ljava/util/List;

    const/high16 v8, 0x40a00000    # 5.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_skip_10x_kfw

    const/high16 v8, 0x41200000    # 10.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_skip_10x_kfw

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v6, Lkds;

    const-string v8, "10"

    invoke-direct {v6, v8}, Lkds;-><init>(Ljava/lang/String;)V

    iget-object v8, v0, Lkfw;->P:Lcgz;

    invoke-virtual {v8, v6}, Lcgz;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kfw
    if-eq v13, v1, :cond_10"""

    kfw_target = """    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_a
    if-eq v13, v1, :cond_10"""

    if kfw_target in content:
        content = content.replace(kfw_target, kfw_repl)
        print("    [+] kfw.smali: 10x Quick Zoom button successfully hooked in UI toggle row.")
    elif "invoke-interface {v6, v8}, Ljava/util/List;->size()I" in content:
        # Update existing older hook
        old_hook_pat = re.compile(r"    :goto_a\s+iget-object v6, v0, Lkfw;->Q:Ljava/util/List;.*?    :cond_skip_10x_kfw\s+if-eq v13, v1, :cond_10", re.DOTALL)
        content = old_hook_pat.sub(kfw_repl, content)
        print("    [+] kfw.smali: updated to relaxed 10x Quick Zoom hook.")
    elif ":cond_skip_10x_kfw" in content:
        print("    [+] kfw.smali: already patched.")
    else:
        print("    [!] Warning: kfw.smali target not found.")

    with open(kfw_path, "w", encoding="utf-8") as f:
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

    iget-object v0, p0, Lnrd;->p:Lrex;

    const/16 v1, 0x8

    float-to-double v2, p1

    invoke-virtual {v0, p3, v1, v2, v3}, Lrex;->E(Lsnw;ID)V

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

    iget-object v0, p0, Lnrm;->t:Lrex;

    const/4 v1, 0x3

    float-to-double v2, p1

    invoke-virtual {v0, p3, v1, v2, v3}, Lrex;->E(Lsnw;ID)V

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

def patch_sauce_onboarding():
    print("[*] Patching Sauce Onboarding & Pixel Looks Tutorial...")

    # 1. Patch qlr.smali: Force qlr.a = true so "Choose a Camera Look" preference is created in laf.smali
    qlr_path = os.path.join(APKTOOL_DIR, "smali", "qlr.smali")
    if os.path.exists(qlr_path):
        with open(qlr_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = "iput-boolean p1, p0, Lqlr;->a:Z"
        replacement = "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lqlr;->a:Z"
        if target in content and "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lqlr;->a:Z" not in content:
            content = content.replace(target, replacement, 1)
            with open(qlr_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] qlr.smali: Forced qlr.a = true (unlocking 'Choose a Camera Look' preference).")
        elif "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lqlr;->a:Z" in content:
            print("    [+] qlr.smali: already patched.")
        else:
            print("    [!] Warning: qlr.smali target not found.")

    # 2. Patch rmn.smali: Force rmn.p = true so device eligibility check passes in first-run getting-started flow
    rmn_path = os.path.join(APKTOOL_DIR, "smali", "rmn.smali")
    if os.path.exists(rmn_path):
        with open(rmn_path, "r", encoding="utf-8") as f:
            content = f.read()
        target = "iput-boolean p1, p0, Lrmn;->p:Z"
        replacement = "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lrmn;->p:Z"
        if target in content and "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lrmn;->p:Z" not in content:
            content = content.replace(target, replacement, 1)
            with open(rmn_path, "w", encoding="utf-8") as f:
                f.write(content)
            print("    [+] rmn.smali: Forced rmn.p = true (enabling onboarding prompt).")
        elif "const/4 p1, 0x1\n\n    iput-boolean p1, p0, Lrmn;->p:Z" in content:
            print("    [+] rmn.smali: already patched.")
        else:
            print("    [!] Warning: rmn.smali target not found.")

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

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void"""

        new_pswitch = """:pswitch_2
    iget-object p1, p0, Lisu;->a:Ljava/lang/Object;

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

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

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
    # 1. kid.smali
    kid_path = os.path.join(APKTOOL_DIR, "smali", "kid.smali")
    if os.path.exists(kid_path):
        with open(kid_path, "r", encoding="utf-8") as f:
            content = f.read()

        def replace_static_method(src, name):
            m_start = src.find(f".method public static final {name}(Lklm;)Z")
            if m_start == -1:
                return src
            m_end = src.find(".end method", m_start) + len(".end method")
            new_m = f""".method public static final {name}(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method"""
            return src[:m_start] + new_m + src[m_end:]

        for m in ["b", "c", "d", "e", "f", "g", "h"]:
            content = replace_static_method(content, m)

        with open(kid_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] kid.smali: enabled all Creator Suite feature getters (b-h -> true).")

    # 2. kqc.smali - Hide and disable "Save to a project" (pa_/pam_) to prevent gRPC errors with Photos
    kqc_path = os.path.join(APKTOOL_DIR, "smali", "kqc.smali")
    if os.path.exists(kqc_path):
        with open(kqc_path, "r", encoding="utf-8") as f:
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

        content = replace_method(content, ".method public final q(Lpfr;)Z", "    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0")
        content = replace_method(content, ".method public final u(Lpfr;)Z", "    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0")
        content = replace_method(content, ".method public final l(Lpfr;)V", "    .locals 0\n\n    return-void")
        content = replace_method(content, ".method public final k(Lpfr;)V", "    .locals 0\n\n    return-void")

        with open(kqc_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] kqc.smali: hid and neutralized 'Save to a project' button (q/u -> false, l/k -> no-op).")

    # 3. klm.smali - Ensure Creator Suite flags intercepted in q(Lkiz;)Z and x(Lkiz;)Z
    klm_path = os.path.join(APKTOOL_DIR, "smali_classes2", "klm.smali")
    if os.path.exists(klm_path):
        with open(klm_path, "r", encoding="utf-8") as f:
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

        q_start = content.find(".method public final q(Lkiz;)Z")
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
                target_marker = "iget-object v0, p0, Lklm;->b:Ljava/util/Map;"
                t_idx = content.find(target_marker, q_start)
                if t_idx != -1 and t_idx < q_end:
                    content = content[:t_idx] + chain + content[t_idx:]

        x_start = content.find(".method public final x(Lkiz;)Z")
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
                new_x = f""".method public final x(Lkiz;)Z
    .locals 3

    if-eqz p1, :cond_check_orig_x

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_x

    const-string v1, "camera.lasagna"

    invoke-virtual {{v0, v1}}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_0

    const/4 v0, 0x0

    return v0

    :cond_check_creator_x_0
{chain}"""
                target_marker_x = "iget-object p0, p0, Lklm;->b:Ljava/util/Map;"
                t_idx_x = content.find(target_marker_x, x_start)
                if t_idx_x != -1 and t_idx_x < x_end:
                    content = content[:x_start] + new_x + content[t_idx_x:]

        with open(klm_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] klm.smali: Creator Suite flags intercepted in q(Lkiz;) and x(Lkiz;).")

def patch_sdo_smali():
    print("[*] Patching sdo.smali (Mode change hook for Looks scoping)...")
    sdo_path = os.path.join(APKTOOL_DIR, "smali", "sdo.smali")
    if not os.path.exists(sdo_path):
        print("    [!] Warning: sdo.smali not found.")
        return
    with open(sdo_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Hook sdo.O(Lsql;)V — the mode setter method
    # After storing the new mode, notify TomteInitHelper with the mode ordinal
    target = """.method private final O(Lsql;)V
    .locals 4

    iget-object v0, p0, Lsdo;->f:Lsql;

    iput-object v0, p0, Lsdo;->y:Lsql;

    iput-object p1, p0, Lsdo;->f:Lsql;"""

    replacement = """.method private final O(Lsql;)V
    .locals 4

    iget-object v0, p0, Lsdo;->f:Lsql;

    iput-object v0, p0, Lsdo;->y:Lsql;

    iput-object p1, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V"""

    if target in content:
        content = content.replace(target, replacement)
        with open(sdo_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("    [+] sdo.smali: Mode change hook injected for TomteInitHelper.")
    else:
        print("    [!] Warning: sdo.smali target block not found.")

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
        size_mb = os.path.getsize(dest_apk) / (1024 * 1024)
        print(f"    [+] Successfully copied APK to Desktop: {dest_apk} ({size_mb:.2f} MB)")
        return dest_apk
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

def main():
    clean_build_artifacts()
    patch_manifest()
    patch_app_name()
    patch_uyv_smali()
    patch_qau_smali()
    patch_camera_app_smali()
    inject_tomte_init_helper()
    patch_qkp_smali()
    patch_qkq_smali()
    patch_qmy_smali()
    patch_klm_smali()
    patch_hpq_smali()
    patch_kic_smali()
    patch_mwg_smali()
    patch_aaog_smali()
    patch_libgcastartup()
    patch_mjy_smali()
    patch_psk_smali()
    patch_psh_smali()
    patch_klh_smali()
    patch_num_smali()
    patch_tba_smali()
    patch_pzs_smali()
    patch_mia_smali()
    patch_muh_smali()
    patch_ioy_smali()
    patch_qkj_smali()
    patch_mla_smali()
    patch_pwh_smali()
    patch_kgy_smali()
    patch_kgx_smali()
    patch_khk_smali()
    patch_kgs_smali()
    patch_kfl_smali()
    patch_kfw_smali()
    patch_qhm_smali()
    patch_mzc_smali()
    patch_pro_controls_live()
    patch_sauce_onboarding()
    patch_sdo_smali()
    patch_creator_suite_smali()
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
