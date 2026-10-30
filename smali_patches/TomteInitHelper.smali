.class public Lcom/google/android/patch/cameralooks/TomteInitHelper;
.super Ljava/lang/Object;
.source "TomteInitHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PATCH_LOOKS"

.field private static sLastInitGcamPtr:J

.field public static sCurrentModeOrdinal:I

.field public static sSelectedLookId:I

.field public static sLastSelectedLook:Lqvj;

.field public static sAppContext:Landroid/content/Context;

.field public static final PREF_FILM_GRAIN:Ljava/lang/String; = "pref_camera_looks_film_grain_key"

.field public static final PREF_MAX_BRIGHTNESS:Ljava/lang/String; = "pref_camera_max_brightness_key"

.field public static final PREF_JPEG_QUALITY:Ljava/lang/String; = "pref_camera_jpeg_quality_key"

.field public static final PREF_NOISE_REDUCTION:Ljava/lang/String; = "pref_camera_noise_reduction_key"

.field public static sCurrentActivity:Ljava/lang/ref/WeakReference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 11
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastInitGcamPtr:J

    .line 12
    const/4 v0, 0x0

    sput v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sSelectedLookId:I

    const/4 v0, 0x1

    sput v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentModeOrdinal:I

    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqvj;

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sAppContext:Landroid/content/Context;

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentActivity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0

    sput-object p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sAppContext:Landroid/content/Context;

    return-void
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .locals 1

    :try_start_app
    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sAppContext:Landroid/content/Context;

    if-eqz v0, :cond_try_camera_app

    return-object v0
    :try_end_app
    .catch Ljava/lang/Throwable; {:try_start_app .. :try_end_app} :catch_app

    :catch_app
    :cond_try_camera_app
    :try_start_camera_app
    sget-object v0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;

    if-eqz v0, :cond_try_activity

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sAppContext:Landroid/content/Context;

    return-object v0
    :try_end_camera_app
    .catch Ljava/lang/Throwable; {:try_start_camera_app .. :try_end_camera_app} :catch_camera_app

    :catch_camera_app
    :cond_try_activity
    :try_start_act
    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentActivity:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_try_activity_thread

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_try_activity_thread

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_try_activity_thread

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sAppContext:Landroid/content/Context;

    return-object v0
    :try_end_act
    .catch Ljava/lang/Throwable; {:try_start_act .. :try_end_act} :catch_act

    :catch_act
    :cond_try_activity_thread
    :try_start_thread
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    move-result-object v0

    if-eqz v0, :cond_null

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sAppContext:Landroid/content/Context;

    return-object v0
    :try_end_thread
    .catch Ljava/lang/Throwable; {:try_start_thread .. :try_end_thread} :catch_thread

    :catch_thread
    :cond_null
    const/4 v0, 0x0

    return-object v0
.end method

.method private static checkPrefValue(Ljava/lang/Object;Z)Z
    .locals 1

    if-nez p0, :cond_not_null

    return p1

    :cond_not_null
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_check_str

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_check_str
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_check_num

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_true

    const-string v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_false

    :cond_true
    const/4 p0, 0x1

    return p0

    :cond_check_false
    const-string v0, "0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_false

    const-string v0, "false"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_ret_def

    :cond_false
    const/4 p0, 0x0

    return p0

    :cond_check_num
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_ret_def

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    if-eqz p0, :cond_false

    const/4 p0, 0x1

    return p0

    :cond_ret_def
    return p1
.end method

.method private static getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4

    :try_start_pref
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_has_ctx

    const/4 p0, 0x0

    return-object p0

    :cond_has_ctx
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_preferences_camera"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    if-eqz v1, :cond_check_def

    invoke-interface {v1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_check_def

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_check_def

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_check_def
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_ret_null

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_ret_null

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ret_null

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_ret_null
    const/4 p0, 0x0

    return-object p0
    :try_end_pref
    .catchall {:try_start_pref .. :try_end_pref} :catch_pref

    :catch_pref
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isGrainEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static isFineTuningSupported()Z
    .locals 3

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    if-nez v0, :cond_check_device

    const/4 v0, 0x0

    return v0

    :cond_check_device
    const-string v1, "oriole"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_raven

    const/4 v0, 0x0

    return v0

    :cond_c_raven
    const-string v1, "raven"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_bluejay

    const/4 v0, 0x0

    return v0

    :cond_c_bluejay
    const-string v1, "bluejay"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_panther

    const/4 v0, 0x0

    return v0

    :cond_c_panther
    const-string v1, "panther"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_cheetah

    const/4 v0, 0x0

    return v0

    :cond_c_cheetah
    const-string v1, "cheetah"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_lynx

    const/4 v0, 0x0

    return v0

    :cond_c_lynx
    const-string v1, "lynx"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_felix

    const/4 v0, 0x0

    return v0

    :cond_c_felix
    const-string v1, "felix"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_tangorpro

    const/4 v0, 0x0

    return v0

    :cond_c_tangorpro
    const-string v1, "tangorpro"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_shiba

    const/4 v0, 0x0

    return v0

    :cond_c_shiba
    const-string v1, "shiba"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_husky

    const/4 v0, 0x0

    return v0

    :cond_c_husky
    const-string v1, "husky"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_akita

    const/4 v0, 0x0

    return v0

    :cond_c_akita
    const-string v1, "akita"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_tokay

    const/4 v0, 0x0

    return v0

    :cond_c_tokay
    const-string v1, "tokay"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_caiman

    const/4 v0, 0x0

    return v0

    :cond_c_caiman
    const-string v1, "caiman"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_komodo

    const/4 v0, 0x0

    return v0

    :cond_c_komodo
    const-string v1, "komodo"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c_comet

    const/4 v0, 0x0

    return v0

    :cond_c_comet
    const-string v1, "comet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_hardware

    const/4 v0, 0x0

    return v0

    :cond_check_hardware
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    if-nez v0, :cond_hw_nonnull

    const/4 v0, 0x1

    return v0

    :cond_hw_nonnull
    const-string v1, "gs101"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_hw_gs201

    const/4 v0, 0x0

    return v0

    :cond_hw_gs201
    const-string v1, "gs201"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_hw_zuma

    const/4 v0, 0x0

    return v0

    :cond_hw_zuma
    const-string v1, "zuma"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_hw_zumapro

    const/4 v0, 0x0

    return v0

    :cond_hw_zumapro
    const-string v1, "zumapro"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_supported

    const/4 v0, 0x0

    return v0

    :cond_supported
    const/4 v0, 0x1

    return v0
.end method

.method public static isMaxBrightnessEnabled()Z
    .locals 2

    const-string v0, "pref_camera_max_brightness_key"

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->checkPrefValue(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public static getJpegQuality()I
    .locals 3

    :try_start_jq
    const-string v0, "pref_camera_jpeg_quality_key"

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_default

    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_check_str

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    return v0

    :cond_check_str
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_jq
    .catch Ljava/lang/Throwable; {:try_start_jq .. :try_end_jq} :catch_jq

    return v0

    :catch_jq
    :cond_default
    const/16 v0, 0x64

    return v0
.end method

.method public static getNoiseReductionMode()I
    .locals 2

    :try_start_nr
    const-string v0, "pref_camera_noise_reduction_key"

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_default

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "off"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_ret_off

    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_min

    :cond_ret_off
    const/4 v0, 0x0

    return v0

    :cond_check_min
    const-string v1, "minimal"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_ret_min

    const-string v1, "3"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_default

    :cond_ret_min
    const/4 v0, 0x1

    return v0

    :try_end_nr
    .catch Ljava/lang/Throwable; {:try_start_nr .. :try_end_nr} :catch_nr

    :catch_nr
    :cond_default
    const/4 v0, 0x2

    return v0
.end method

.method public static filterPecanForce(Z)Z
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterPecanModelType(I)I
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    return p0

    :cond_ret_orig
    return p0
.end method

.method public static filterWalnutEnabled(Z)Z
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterWalnutOption(I)I
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterChessEnabled(Z)Z
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterEdamameEnabled(Z)Z
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterAlmondEnabled(Z)Z
    .locals 1

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    if-nez v0, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterMochiEnabled(Z)Z
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterSkyDenoise(Z)Z
    .locals 2

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_ret_orig

    const/4 p0, 0x0

    :cond_ret_orig
    return p0
.end method

.method public static filterNoiseScale(F)F
    .locals 2

    :try_start_fns
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getNoiseReductionMode()I

    move-result v0

    if-nez v0, :cond_check_min

    const/4 v0, 0x0

    return v0

    :cond_check_min
    const/4 v1, 0x1

    if-ne v0, v1, :cond_ret_stock

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr p0, v0

    return p0
    :try_end_fns
    .catch Ljava/lang/Throwable; {:try_start_fns .. :try_end_fns} :catch_fns

    :catch_fns
    :cond_ret_stock
    return p0
.end method

.method public static filterCompressDng(Z)Z
    .locals 2

    :try_start_fcd
    const-string v0, "pref_camera_raw_compression_key"

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_default_compressed

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "uncompressed"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_default_compressed

    const/4 p0, 0x0

    return p0

    :cond_default_compressed
    const/4 p0, 0x1

    return p0
    :try_end_fcd
    .catch Ljava/lang/Throwable; {:try_start_fcd .. :try_end_fcd} :catch_fcd

    :catch_fcd
    const/4 p0, 0x1
    return p0
.end method

.method public static getEdgeMode()I
    .locals 2

    :try_start_gem
    const-string v0, "pref_camera_sharpness_key"

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_em_standard

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "soft"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_em_soft

    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_natural

    :cond_em_soft
    const/4 v0, 0x0

    return v0

    :cond_check_natural
    const-string v1, "natural"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_em_standard

    const/4 v0, 0x1

    return v0

    :cond_em_standard
    const/4 v0, 0x2

    return v0
    :try_end_gem
    .catch Ljava/lang/Throwable; {:try_start_gem .. :try_end_gem} :catch_gem

    :catch_gem
    const/4 v0, 0x2

    return v0
.end method

.method public static getSharpnessFactor()F
    .locals 2

    :try_start_gsf
    const-string v0, "pref_camera_sharpness_key"

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getPrefEntry(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_ret_standard

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "soft"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_ret_soft

    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_natural

    :cond_ret_soft
    const/4 v0, 0x0

    return v0

    :cond_check_natural
    const-string v1, "natural"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_ret_standard

    const/high16 v0, 0x3f000000    # 0.5f

    return v0

    :cond_ret_standard
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
    :try_end_gsf
    .catch Ljava/lang/Throwable; {:try_start_gsf .. :try_end_gsf} :catch_gsf

    :catch_gsf
    const/high16 v0, 0x3f800000    # 1.0f

    return v0
.end method

.method public static filterSharpness(F)F
    .locals 1

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getSharpnessFactor()F

    move-result v0

    mul-float/2addr p0, v0

    return p0
.end method

.method public static filterBrightness(F)F
    .locals 1

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isMaxBrightnessEnabled()Z

    move-result v0

    if-eqz v0, :cond_orig

    const/high16 p0, 0x3f800000    # 1.0f

    :cond_orig
    return p0
.end method

.method public static onSharedPrefChanged(Ljava/lang/String;Z)V
    .locals 1

    const-string v0, "pref_camera_max_brightness_key"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_skip

    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onBrightnessPrefChanged(Z)V

    :cond_skip
    return-void
.end method

.method public static onModeChanged(Ljava/lang/Object;)V
    .locals 1

    if-nez p0, :cond_start

    return-void

    :cond_start
    instance-of v0, p0, Ljava/lang/Enum;

    if-eqz v0, :cond_end

    check-cast p0, Ljava/lang/Enum;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    :cond_end
    return-void
.end method

.method public static applyScreenBrightness(Landroid/app/Activity;)V
    .locals 3

    if-nez p0, :cond_start

    return-void

    :cond_start
    :try_start_0
    instance-of v0, p0, Lcom/google/android/apps/camera/activity/main/CameraActivity;

    if-eqz v0, :cond_check_secure

    goto :cond_is_viewfinder

    :cond_check_secure
    instance-of v0, p0, Lcom/google/android/apps/camera/activity/SecureCameraActivity;

    if-eqz v0, :cond_check_capture

    goto :cond_is_viewfinder

    :cond_check_capture
    instance-of v0, p0, Lcom/google/android/apps/camera/activity/CaptureActivity;

    if-eqz v0, :cond_not_viewfinder

    :cond_is_viewfinder
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_win_ok

    return-void

    :cond_win_ok
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_lp_ok

    return-void

    :cond_lp_ok
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isMaxBrightnessEnabled()Z

    move-result v2

    if-eqz v2, :cond_reset

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void

    :cond_reset
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/4 p0, 0x0

    cmpl-float p0, v2, p0

    if-lez p0, :cond_ret

    const/high16 p0, -0x40800000    # -1.0f

    iput p0, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_ret
    return-void

    :cond_not_viewfinder
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_non_vf_win

    return-void

    :cond_non_vf_win
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_non_vf_lp

    return-void

    :cond_non_vf_lp
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static resetScreenBrightness(Landroid/app/Activity;)V
    .locals 3

    if-nez p0, :cond_start

    return-void

    :cond_start
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_win_ok

    return-void

    :cond_win_ok
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_lp_ok

    return-void

    :cond_lp_ok
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public static onBrightnessPrefChanged(Z)V
    .locals 3

    :try_start_0
    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentActivity:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_has_ref

    return-void

    :cond_has_ref
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_has_act

    return-void

    :cond_has_act
    instance-of v1, v0, Lcom/google/android/apps/camera/activity/main/CameraActivity;

    if-nez v1, :cond_is_vf

    instance-of v1, v0, Lcom/google/android/apps/camera/activity/SecureCameraActivity;

    if-nez v1, :cond_is_vf

    instance-of v1, v0, Lcom/google/android/apps/camera/activity/CaptureActivity;

    if-nez v1, :cond_is_vf

    return-void

    :cond_is_vf
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_has_win

    return-void

    :cond_has_win
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_has_lp

    return-void

    :cond_has_lp
    if-eqz p0, :cond_dim

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    goto :cond_apply

    :cond_dim
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    :cond_apply
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEffectiveLookId(I)I
    .locals 3

    # Check if current mode supports looks
    sget v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentModeOrdinal:I

    # Video = 2, Photo Sphere/Panorama = 4, Landscape(LongExposure) = 14, Action Pan = 15
    const/4 v1, 0x2

    if-eq v0, v1, :cond_no_looks

    const/4 v1, 0x4

    if-eq v0, v1, :cond_no_looks

    const/16 v1, 0xe

    if-eq v0, v1, :cond_no_looks

    const/16 v1, 0xf

    if-eq v0, v1, :cond_no_looks

    .line 52
    if-nez p0, :cond_0

    sget v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sSelectedLookId:I

    if-eqz v0, :cond_0

    .line 53
    sget p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sSelectedLookId:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TomteInitHelper.getEffectiveLookId: overriding type 0 with selected lookId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "PATCH_LOOKS"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    sget p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sSelectedLookId:I

    return p0

    :cond_no_looks
    # Unsupported mode — return original value without override
    return p0

    .line 56
    :cond_0
    return p0
.end method

.method public static setCurrentMode(I)V
    .locals 2

    sput p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sCurrentModeOrdinal:I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TomteInitHelper.setCurrentMode: modeOrdinal="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "PATCH_LOOKS"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static declared-synchronized initTomteGrain(J)V
    .locals 11

    const-class v1, Lcom/google/android/patch/cameralooks/TomteInitHelper;

    monitor-enter v1

    :try_start_grain_check
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->isGrainEnabled()Z

    move-result v0

    if-nez v0, :cond_grain_allowed

    const-string v0, "PATCH_LOOKS"

    const-string v2, "TomteInitHelper.initTomteGrain: film grain is DISABLED by user setting."

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v1

    return-void

    :cond_grain_allowed
    :try_end_grain_check
    .catchall {:try_start_grain_check .. :try_end_grain_check} :catchall_1

    .line 15
    const-wide/16 v2, 0x0

    cmp-long v0, p0, v2

    if-nez v0, :cond_0

    .line 16
    :try_start_0
    const-string p0, "PATCH_LOOKS"

    const-string p1, "TomteInitHelper.initTomteGrain: gcamPtr is 0"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    monitor-exit v1

    return-void

    .line 19
    :cond_0
    :try_start_1
    sget-wide v2, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastInitGcamPtr:J

    cmp-long v0, v2, p0

    if-nez v0, :cond_1

    .line 20
    const-string v0, "PATCH_LOOKS"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TomteInitHelper.initTomteGrain: already initialized for gcamPtr="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    monitor-exit v1

    return-void

    .line 24
    :cond_1
    :try_start_2
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    .line 26
    const-string p0, "PATCH_LOOKS"

    const-string p1, "TomteInitHelper.initTomteGrain: CameraApp.sAppContext is null!"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    monitor-exit v1

    return-void

    .line 29
    :cond_2
    :try_start_3
    const-string v2, "3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed"

    .line 30
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v4

    .line 32
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v5

    .line 33
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v7

    .line 34
    const-string v2, "PATCH_LOOKS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "TomteInitHelper: Calling nativeInitializeTomteGrainFromOpenFile(fd="

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, ", offset="

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, ", len="

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, ", gcamPtr="

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, ")..."

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    new-instance v3, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-direct {v3}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;-><init>()V

    .line 37
    move-wide v9, p0

    invoke-virtual/range {v3 .. v10}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeInitializeTomteGrainFromOpenFile(IJJJ)V

    .line 38
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 39
    sput-wide v9, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastInitGcamPtr:J

    .line 40
    const-string p0, "PATCH_LOOKS"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "TomteInitHelper: Successfully initialized TomteGrain on gcamPtr="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    goto :goto_0

    .line 41
    :catchall_0
    move-exception v0

    move-object p0, v0

    .line 42
    :try_start_4
    const-string p1, "PATCH_LOOKS"

    const-string v0, "TomteInitHelper: initTomteGrain failed"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 44
    :goto_0
    monitor-exit v1

    return-void

    .line 14
    :catchall_1
    move-exception v0

    move-object p0, v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p0
.end method

.method public static onLookSelected(I)V
    .locals 2

    .line 47
    sput p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sSelectedLookId:I

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TomteInitHelper.onLookSelected: lookId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "PATCH_LOOKS"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    return-void
.end method

.method public static onLookObjectSelected(Lqvj;)V
    .locals 2

    if-eqz p0, :cond_null

    sput-object p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqvj;

    iget v0, p0, Lqvj;->d:I

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookSelected(I)V

    return-void

    :cond_null
    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqvj;

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookSelected(I)V

    return-void
.end method

.method public static getLastSelectedLook()Lqvj;
    .locals 1

    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqvj;

    return-object v0
.end method

.method public static getEffectiveLookOrFallback(Lqvj;)Lqvj;
    .locals 1

    if-eqz p0, :cond_use_fallback

    return-object p0

    :cond_use_fallback
    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqvj;

    return-object v0
.end method

.method public static getFlagOverride(Ljava/lang/String;)I
    .locals 2

    if-nez p0, :cond_check_lasagna

    const/4 v0, -0x1

    return v0

    :cond_check_lasagna
    const-string v0, "camera.lasagna"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_ark_lens

    const-string v0, "camera.lasagna.use_darwinn"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_lasagna_false

    const/4 v0, 0x1

    return v0

    :cond_lasagna_false
    const/4 v0, 0x0

    return v0

    :cond_check_ark_lens
    const-string v0, "camera.ark_lens_selector"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_ark

    const/4 v0, 0x1

    return v0

    :cond_check_ark
    const-string v0, "camera.ark"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_chameleon

    const/4 v0, 0x1

    return v0

    :cond_check_chameleon
    const-string v0, "camera.chameleon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_cct

    const/4 v0, 0x1

    return v0

    :cond_check_cct
    const-string v0, "camera.enable_show_cct"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_freesia

    const/4 v0, 0x1

    return v0

    :cond_check_freesia
    const-string v0, "camera.enable_freesia"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_peony

    const/4 v0, 0x1

    return v0

    :cond_check_peony
    const-string v0, "camera.enable_peony"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_basil

    const/4 v0, 0x1

    return v0

    :cond_check_basil
    const-string v0, "camera.enable_basil"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_creator_granite

    const/4 v0, 0x1

    return v0

    :cond_check_creator_granite
    const-string v0, "camera.enable_granite"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_creator_biotite

    const/4 v0, 0x1

    return v0

    :cond_check_creator_biotite
    const-string v0, "camera.enable_biotite"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_creator_mica

    const/4 v0, 0x1

    return v0

    :cond_check_creator_mica
    const-string v0, "camera.enable_mica"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_creator_slate

    const/4 v0, 0x1

    return v0

    :cond_check_creator_slate
    const-string v0, "camera.enable_slate"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_creator_basalt

    const/4 v0, 0x1

    return v0

    :cond_check_creator_basalt
    const-string v0, "camera.enable_basalt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_creator_autoscroll

    const/4 v0, 0x1

    return v0

    :cond_check_creator_autoscroll
    const-string v0, "camera.biotite_auto_scroll"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_sauce

    const/4 v0, 0x1

    return v0

    :cond_check_sauce
    const-string v0, "camera.sauce"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_qa

    const/4 v0, 0x1

    return v0

    :cond_check_qa
    const-string v0, "camera.quick_access"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_dualev_single_knob

    const/4 v0, 0x1

    return v0

    :cond_check_dualev_single_knob
    const-string v0, "camera.dualev.singleKnob"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_enable_twilight

    const/4 v0, 0x0

    return v0

    :cond_check_enable_twilight
    const-string v0, "camera.enable_twilight"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_dualev_ultrawide

    const/4 v0, 0x1

    return v0

    :cond_check_dualev_ultrawide
    const-string v0, "camera.dualev.limitUltrawide"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_dualev_shadowboost

    const/4 v0, 0x0

    return v0

    :cond_check_dualev_shadowboost
    const-string v0, "camera.dualev.limitShadowBoost"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_gs

    const/4 v0, 0x0

    return v0

    :cond_check_gs
    const-string v0, "camera.getting_started_enabled"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_centaur

    const/4 v0, 0x1

    return v0

    :cond_check_centaur
    const-string v0, "camera.enable_centaur"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_boba_eligible

    const/4 v0, 0x1

    return v0

    :cond_check_boba_eligible
    const-string v0, "camera.boba_jelly_eligible"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_cpu_seg

    const/4 v0, 0x1

    return v0

    :cond_check_cpu_seg
    const-string v0, "segmenter_force_cpu_inference"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_tpu_del

    const/4 v0, 0x1

    return v0

    :cond_check_tpu_del
    const-string v0, "segmenter_use_darwinn_tpu_delegate"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_almond

    const/4 v0, 0x0

    return v0

    :cond_check_almond
    const-string v0, "camera.almond_use_tpu"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_cyclops

    const/4 v0, 0x0

    return v0

    :cond_check_cyclops
    const-string v0, "camera.cyclops_use_tpu"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_offline_comp

    const/4 v0, 0x0

    return v0

    :cond_check_offline_comp
    const-string v0, "camera.gouda.use_darwinn_offline_compilation"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_fg_color

    const/4 v0, 0x0

    return v0

    :cond_check_fg_color
    const-string v0, "camera.gouda.foreground_color_estimator_use_tpu"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_macro_badging

    const/4 v0, 0x0

    return v0

    :cond_check_macro_badging
    const-string v0, "camera.enable_macro_focus_badging"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_boba_jelly

    const/4 v0, 0x0

    return v0

    :cond_check_boba_jelly
    const-string v0, "camera.enable_boba_jelly"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_ceftazidime

    const/4 v0, 0x0

    return v0

    :cond_check_ceftazidime
    const-string v0, "camera.ceftazidime"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_decepticon

    const/4 v0, 0x0

    return v0

    :cond_check_decepticon
    const-string v0, "camera.decepticon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_use_eclipse

    const/4 v0, 0x0

    return v0

    :cond_check_use_eclipse
    const-string v0, "camera.use_eclipse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_milk

    const/4 v0, 0x0

    return v0

    :cond_check_milk
    const-string v0, "camera.milk"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_rear_rgbpd

    const/4 v0, 0x0

    return v0

    :cond_check_rear_rgbpd
    const-string v0, "camera.gouda.rear_rgbpd"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_physeter

    const/4 v0, 0x0

    return v0

    :cond_check_physeter
    const-string v0, "physeter"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_check_generic_tpu

    const/4 v0, 0x0

    return v0

    :cond_check_generic_tpu
    const-string v0, "use_tpu"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_check_generic_darwinn

    const/4 v0, 0x0

    return v0

    :cond_check_generic_darwinn
    const-string v0, "darwinn"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_check_jellybean_setting

    const-string v0, "camera.lasagna.use_darwinn"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_darwinn_false

    const/4 v0, 0x1

    return v0

    :cond_darwinn_false
    const/4 v0, 0x0

    return v0

    :cond_check_jellybean_setting
    const-string v0, "camcorder.jellybean_setting"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_check_jellybean_feature

    const/4 v0, 0x1

    return v0

    :cond_check_jellybean_feature
    const-string v0, "camcorder_jellybean_feature"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_not_found

    const/4 v0, 0x1

    return v0

    :cond_not_found
    const/4 v0, -0x1

    return v0
.end method

.method public static interceptFlagQ(Lksf;Lkps;)Z
    .locals 2

    if-eqz p1, :cond_orig_q

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_orig_q

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getFlagOverride(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_check_false_q

    return v1

    :cond_check_false_q
    if-nez v0, :cond_orig_q

    const/4 v0, 0x0

    return v0

    :cond_orig_q
    :try_start_orig_q
    invoke-virtual {p0, p1}, Lksf;->original_q(Lkps;)Z

    move-result p0

    return p0
    :try_end_orig_q
    .catch Ljava/lang/Throwable; {:try_start_orig_q .. :try_end_orig_q} :catch_orig_q

    :catch_orig_q
    const/4 p0, 0x1

    return p0
.end method

.method public static interceptFlagX(Lksf;Lkps;)Z
    .locals 2

    if-eqz p1, :cond_orig_x

    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_orig_x

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getFlagOverride(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_check_false_x

    return v1

    :cond_check_false_x
    if-nez v0, :cond_orig_x

    const/4 v0, 0x0

    return v0

    :cond_orig_x
    :try_start_orig_x
    invoke-virtual {p0, p1}, Lksf;->original_x(Lkps;)Z

    move-result p0

    return p0
    :try_end_orig_x
    .catch Ljava/lang/Throwable; {:try_start_orig_x .. :try_end_orig_x} :catch_orig_x

    :catch_orig_x
    const/4 p0, 0x1

    return p0
.end method

.method public static interceptPref(Lrdo;Lrdg;)Ljava/lang/Object;
    .locals 2

    if-nez p1, :cond_check_pref

    const/4 p0, 0x0

    return-object p0

    :cond_check_pref
    iget-object v0, p1, Lrdg;->a:Ljava/lang/String;

    if-nez v0, :cond_check_qa_key

    const/4 p0, 0x0

    return-object p0

    :cond_check_qa_key
    const-string v1, "pref_quick_access_controls_key"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_slot_left

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_check_slot_left
    const-string v1, "pref_quick_access_slot_left_1_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_slot_r1

    invoke-virtual {p0, p1}, Lrdo;->c(Lrdg;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_use_def_left

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_ret_null

    :cond_use_def_left
    const/4 p0, 0x2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_check_slot_r1
    const-string v1, "pref_quick_access_slot_right_1_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_slot_r2

    invoke-virtual {p0, p1}, Lrdo;->c(Lrdg;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_use_def_r1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_ret_null

    :cond_use_def_r1
    const/16 p0, 0x9

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_check_slot_r2
    const-string v1, "pref_quick_access_slot_right_2_id"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_ret_null

    invoke-virtual {p0, p1}, Lrdo;->c(Lrdg;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_use_def_r2

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_ret_null

    :cond_use_def_r2
    const/16 p0, 0x8

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_ret_null
    const/4 p0, 0x0

    return-object p0
.end method

.method public static interceptFlagA(Lksf;Lkpr;)Lj$/util/Optional;
    .locals 3

    if-eqz p1, :cond_orig_a

    # kiy extends kix, which has field a:Ljava/lang/String; (the flag name)
    iget-object v0, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v0, :cond_orig_a

    # Check centaur_focus_detection_override → return Optional.of(0)
    const-string v1, "camera.centaur_focus_detection_override"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_try_orig_a

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    return-object v1

    :cond_try_orig_a
    # Call original method first; if result is present, return it
    :try_start_orig_a
    invoke-virtual {p0, p1}, Lksf;->original_a(Lkpr;)Lj$/util/Optional;

    move-result-object v0
    :try_end_orig_a
    .catch Ljava/lang/Throwable; {:try_start_orig_a .. :try_end_orig_a} :catch_orig_a

    # Check if result is present
    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-nez v1, :cond_return_result

    # Result is empty — check if we have a binned RAW fallback
    iget-object v1, p1, Lkpq;->a:Ljava/lang/String;

    if-eqz v1, :cond_return_result

    # Check tele_binned_raw_width fallback
    const-string v2, "camera.tele_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_tbrh

    const/16 v2, 0x7e0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # tele_binned_raw_height → 0x5e8 (1512)
    :cond_check_tbrh
    const-string v2, "camera.tele_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_brs

    const/16 v2, 0x5e8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # Check binned_row_start
    :cond_check_brs
    const-string v2, "camera.binned_row_start"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_return_result

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    :cond_return_result
    return-object v0

    :cond_orig_a
    :try_start_orig_a2
    invoke-virtual {p0, p1}, Lksf;->original_a(Lkpr;)Lj$/util/Optional;

    move-result-object p0

    return-object p0
    :try_end_orig_a2
    .catch Ljava/lang/Throwable; {:try_start_orig_a2 .. :try_end_orig_a2} :catch_orig_a

    :catch_orig_a
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p0

    return-object p0
.end method

.method public static interceptFlagH(Lksf;Lkps;)Ljava/lang/String;
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

    if-eqz v1, :cond_check_cottage_looknet_model

    const-string v0, "portrait_matting_mask_1024_768.tflite.uncompressed"

    return-object v0

    :cond_check_cottage_looknet_model
    const-string v1, "camera.cottage_looknet_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_cottage_film_blender_model

    const-string v0, "looknet_v2.1_float.tflite.uncompressed"

    return-object v0

    :cond_check_cottage_film_blender_model
    const-string v1, "camera.cottage_film_blender_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_orig_h

    const-string v0, "all_in_film_blender.tflite.uncompressed"

    return-object v0

    :cond_check_orig_h
    :try_start_orig_h
    invoke-virtual {p0, p1}, Lksf;->original_h(Lkps;)Ljava/lang/String;

    move-result-object p0

    return-object p0
    :try_end_orig_h
    .catch Ljava/lang/Throwable; {:try_start_orig_h .. :try_end_orig_h} :catch_orig_h

    :catch_orig_h
    const-string p0, ""

    return-object p0
.end method

.method public static interceptFlagR(Lksf;Lkps;)Lj$/util/Optional;
    .locals 2

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
    :try_start_orig_r
    invoke-virtual {p0, p1}, Lksf;->original_r(Lkps;)Lj$/util/Optional;

    move-result-object p0

    return-object p0
    :try_end_orig_r
    .catch Ljava/lang/Throwable; {:try_start_orig_r .. :try_end_orig_r} :catch_orig_r

    :catch_orig_r
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p0

    return-object p0
.end method

.method public static hookZoomButtons(Lkmo;)V
    .locals 3

    if-nez p0, :cond_end

    :try_start_0
    iget-object v0, p0, Lkmo;->Q:Ljava/util/List;

    if-nez v0, :cond_check_5

    return-void

    :cond_check_5
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_check_10

    return-void

    :cond_check_10
    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_add_10

    return-void

    :cond_add_10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lkmo;->P:Lchy;

    if-eqz v0, :cond_end

    new-instance v1, Lkkl;

    const-string v2, "10"

    invoke-direct {v1, v2}, Lkkl;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lchy;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_hook_zoom

    :cond_end
    return-void

    :catch_hook_zoom
    return-void
.end method

.method public static hookSliderStops(Ljava/util/List;)V
    .locals 2

    if-nez p0, :cond_end

    :try_start_0
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_check_10

    return-void

    :cond_check_10
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_add_10

    return-void

    :cond_add_10
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_hook_slider

    :cond_end
    return-void

    :catch_hook_slider
    return-void
.end method

.method public static configureGalleryIntent(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 4

    if-nez p0, :cond_start

    return-object p0

    :cond_start
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_full
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_has_context

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_adjust_action

    :cond_has_context
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    if-nez v1, :cond_check_prefs

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_adjust_action

    :cond_check_prefs
    :try_start_pref
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "pref_gallery_package_key"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_no_pref

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_no_pref

    const-string v2, "default"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_no_pref

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_adjust_action
    :try_end_pref
    .catch Ljava/lang/Throwable; {:try_start_pref .. :try_end_pref} :catch_pref

    :catch_pref
    :cond_no_pref
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    :goto_adjust_action
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_check_action_name

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    return-object p0

    :cond_check_action_name
    const-string v2, "com.google.android.apps.photos.mars.api.ACTION_REVIEW_SECURE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_secure_action

    const-string v2, "android.provider.action.REVIEW_SECURE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_regular_action

    :cond_secure_action
    const-string v0, "com.google.android.apps.photos"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "com.google.android.apps.photos.mars.api.ACTION_REVIEW_SECURE"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    return-object p0

    :cond_regular_action
    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    return-object p0
    :try_end_full
    .catch Ljava/lang/Throwable; {:try_start_full .. :try_end_full} :catch_all_fallback

    :catch_all_fallback
    return-object p0
.end method

.method public static isProDevice()Z
    .locals 3

    :try_start_0
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    if-eqz v0, :cond_check_device

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "pro"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_check_device

    const/4 v0, 0x1

    return v0

    :cond_check_device
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    if-eqz v0, :cond_check_product

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "husky"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_is_pro

    const-string v1, "cheetah"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_is_pro

    const-string v1, "raven"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_is_pro

    const-string v1, "caiman"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_is_pro

    const-string v1, "komodo"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_is_pro

    const-string v1, "comet"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_is_pro

    const-string v1, "pro"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_check_product

    :cond_is_pro
    const/4 v0, 0x1

    return v0

    :cond_check_product
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    if-eqz v0, :cond_ret_false

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "pro"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_is_pro_prod

    const-string v1, "husky"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_is_pro_prod

    const-string v1, "cheetah"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_is_pro_prod

    const-string v1, "raven"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_ret_false

    :cond_is_pro_prod
    const/4 v0, 0x1

    return v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    :cond_ret_false
    const/4 v0, 0x0

    return v0
.end method


