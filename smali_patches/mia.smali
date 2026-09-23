.class public final Lmia;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lrdl;


# static fields
.field private static final a:Lykq;


# instance fields
.field private final b:Ladbv;

.field private final c:Ladbv;

.field private final d:Landroid/content/Context;

.field private final e:Lulx;

.field private final f:Z

.field private final g:Lklm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "mia"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lmia;->a:Lykq;

    return-void
.end method

.method public constructor <init>(Ladbv;Ladbv;Landroid/content/Context;Lulx;Lklm;Lj$/util/Optional;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmia;->b:Ladbv;

    iput-object p2, p0, Lmia;->c:Ladbv;

    iput-object p3, p0, Lmia;->d:Landroid/content/Context;

    iput-object p4, p0, Lmia;->e:Lulx;

    iput-object p5, p0, Lmia;->g:Lklm;

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p6, p1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lmia;->f:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    const-string v0, "PATCH_LOOKS"

    const-string v1, "mia.run: Unconditionally initializing TomteGrain..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lmia;->g:Lklm;

    sget-object v1, Lkjq;->V:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->h(Lkiz;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lxiw;->F(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lmia;->e:Lulx;

    const-string v2, "TomteGrain#initialize"

    invoke-interface {v0, v2}, Lulx;->f(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lmia;->d:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lmia;->c:Ladbv;

    check-cast v0, Lmju;

    invoke-virtual {v0}, Lmju;->b()Lzsj;

    move-result-object v0

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v5

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v6

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v8

    iget-object v3, p0, Lmia;->b:Ladbv;

    invoke-interface {v3}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/googlex/gcam/Gcam;

    if-nez v3, :cond_1

    const-wide/16 v3, 0x0

    :goto_0
    move-wide v10, v3

    goto :goto_1

    :cond_1
    iget-wide v3, v3, Lcom/google/googlex/gcam/Gcam;->a:J

    goto :goto_0

    :goto_1
    move-object v4, v0

    check-cast v4, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual/range {v4 .. v11}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeInitializeTomteGrainFromOpenFile(IJJJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_3

    :try_start_2
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object v3, v0

    if-eqz v2, :cond_2

    :try_start_3
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_2
    throw v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    sget-object v2, Lmia;->a:Lykq;

    invoke-virtual {v2}, Lykh;->b()Lyld;

    move-result-object v2

    const-string v3, "Failed to initialize Tomte Grain model %s"

    const/16 v4, 0xbf0

    invoke-static {v3, v1, v4, v2, v0}, La;->bT(Ljava/lang/String;Ljava/lang/Object;CLyko;Ljava/lang/Throwable;)V

    goto :goto_3

    :catch_1
    move-exception v0

    sget-object v1, Lmia;->a:Lykq;

    invoke-virtual {v1}, Lykh;->b()Lyld;

    move-result-object v1

    const-string v2, "Unable to get Tomte Grain model asset file"

    const/16 v3, 0xbef

    invoke-static {v2, v3, v1, v0}, La;->bH(Ljava/lang/String;CLyko;Ljava/lang/Throwable;)V

    :cond_3
    :goto_3
    iget-object p0, p0, Lmia;->e:Lulx;

    invoke-interface {p0}, Lulx;->g()V

    :cond_4
    :goto_4
    return-void
.end method
