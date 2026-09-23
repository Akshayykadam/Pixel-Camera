.class public Lcom/google/android/patch/cameralooks/TomteInitHelper;
.super Ljava/lang/Object;
.source "TomteInitHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PATCH_LOOKS"

.field private static sLastInitGcamPtr:J

.field public static sCurrentModeOrdinal:I

.field public static sSelectedLookId:I

.field public static sLastSelectedLook:Lqlh;


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

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqlh;

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
    sget-object v0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;

    .line 25
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

.method public static onLookObjectSelected(Lqlh;)V
    .locals 2

    if-eqz p0, :cond_null

    sput-object p0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqlh;

    iget v0, p0, Lqlh;->d:I

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookSelected(I)V

    return-void

    :cond_null
    const/4 v0, 0x0

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqlh;

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookSelected(I)V

    return-void
.end method

.method public static getLastSelectedLook()Lqlh;
    .locals 1

    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqlh;

    return-object v0
.end method

.method public static getEffectiveLookOrFallback(Lqlh;)Lqlh;
    .locals 1

    if-eqz p0, :cond_use_fallback

    return-object p0

    :cond_use_fallback
    sget-object v0, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sLastSelectedLook:Lqlh;

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

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_ark

    const/4 v0, 0x0

    return v0

    :cond_check_ark
    const-string v0, "camera.ark"

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

    if-eqz v0, :cond_check_gs

    const/4 v0, 0x1

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

    if-eqz v0, :cond_not_found

    const/4 v0, 0x0

    return v0

    :cond_not_found
    const/4 v0, -0x1

    return v0
.end method

.method public static interceptFlagQ(Lklm;Lkiz;)Z
    .locals 2

    if-eqz p1, :cond_orig_q

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

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
    invoke-virtual {p0, p1}, Lklm;->original_q(Lkiz;)Z

    move-result p0

    return p0
    :try_end_orig_q
    .catch Ljava/lang/Throwable; {:try_start_orig_q .. :try_end_orig_q} :catch_orig_q

    :catch_orig_q
    const/4 p0, 0x1

    return p0
.end method

.method public static interceptFlagX(Lklm;Lkiz;)Z
    .locals 2

    if-eqz p1, :cond_orig_x

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

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
    invoke-virtual {p0, p1}, Lklm;->original_x(Lkiz;)Z

    move-result p0

    return p0
    :try_end_orig_x
    .catch Ljava/lang/Throwable; {:try_start_orig_x .. :try_end_orig_x} :catch_orig_x

    :catch_orig_x
    const/4 p0, 0x1

    return p0
.end method

.method public static interceptFlagA(Lklm;Lkiy;)Lj$/util/Optional;
    .locals 3

    if-eqz p1, :cond_orig_a

    # kiy extends kix, which has field a:Ljava/lang/String; (the flag name)
    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

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
    invoke-virtual {p0, p1}, Lklm;->original_a(Lkiy;)Lj$/util/Optional;

    move-result-object v0
    :try_end_orig_a
    .catch Ljava/lang/Throwable; {:try_start_orig_a .. :try_end_orig_a} :catch_orig_a

    # Check if result is present
    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-nez v1, :cond_return_result

    # Result is empty — check if we have a binned RAW fallback
    iget-object v1, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v1, :cond_return_result

    # wide_binned_raw_width → 0x7f0 (2032)
    const-string v2, "camera.wide_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_wbrh

    const/16 v2, 0x7f0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # wide_binned_raw_height → 0x600 (1536)
    :cond_check_wbrh
    const-string v2, "camera.wide_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_tbrw

    const/16 v2, 0x600

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # tele_binned_raw_width → 0x7e0 (2016)
    :cond_check_tbrw
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

    if-eqz v2, :cond_check_ubrw

    const/16 v2, 0x5e8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # uw_binned_raw_width → 0x7e0 (2016)
    :cond_check_ubrw
    const-string v2, "camera.uw_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_ubrh

    const/16 v2, 0x7e0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # uw_binned_raw_height → 0x5e8 (1512)
    :cond_check_ubrh
    const-string v2, "camera.uw_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_brs

    const/16 v2, 0x5e8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    return-object v2

    # binned_row_start → 0
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
    invoke-virtual {p0, p1}, Lklm;->original_a(Lkiy;)Lj$/util/Optional;

    move-result-object p0

    return-object p0
    :try_end_orig_a2
    .catch Ljava/lang/Throwable; {:try_start_orig_a2 .. :try_end_orig_a2} :catch_orig_a

    :catch_orig_a
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p0

    return-object p0
.end method

.method public static hookZoomButtons(Lkfw;)V
    .locals 3

    if-nez p0, :cond_end

    :try_start_0
    iget-object v0, p0, Lkfw;->Q:Ljava/util/List;

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

    iget-object v0, p0, Lkfw;->P:Lcgz;

    if-eqz v0, :cond_end

    new-instance v1, Lkds;

    const-string v2, "10"

    invoke-direct {v1, v2}, Lkds;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcgz;->add(Ljava/lang/Object;)Z
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

