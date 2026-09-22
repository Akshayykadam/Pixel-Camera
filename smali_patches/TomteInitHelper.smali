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
