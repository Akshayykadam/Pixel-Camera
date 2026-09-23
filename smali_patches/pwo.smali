.class public Lpwo;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lpxa;
.implements Lnnq;
.implements Lnmp;
.implements Lnmo;


# static fields
.field public static final a:Lykq;

.field public static final b:Lpwn;

.field public static final c:Lyeo;

.field private static final k:Lpwn;

.field private static final l:Lpwn;

.field private static final m:Lpwn;


# instance fields
.field public final d:Landroid/content/Context;

.field public final e:Z

.field public final f:Ladbv;

.field public final g:Lcom/google/googlex/gcam/creativecamera/portraitmode/PortraitRelightingProcessorInterface;

.field public h:Z

.field public final i:Ljava/util/concurrent/locks/ReentrantLock;

.field public final j:Lklm;

.field private final n:Lulx;

.field private final o:Ljava/util/concurrent/Executor;

.field private final p:Lpvz;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const-string v0, "pwo"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lpwo;->a:Lykq;

    new-instance v0, Lpwn;

    const-string v1, "ea2b1dfbbab94acf9786ea68dfeec066.uncompressed"

    const-string v2, "e874f6f3b7564a95a7ecf83a186b078f.uncompressed"

    const-string v3, "5d144ef2a29d4815b1fcaaa8c779d55b.uncompressed"

    const-string v4, "baf98e5b75004ba0915d0209821eb654.uncompressed"

    invoke-direct {v0, v3, v4, v1, v2}, Lpwn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lpwo;->b:Lpwn;

    new-instance v0, Lpwn;

    const-string v1, "bf9710b48fe14d79928ed0993956e2b1.uncompressed"

    const-string v2, "a2db4cc13a4444aaaf01d127f9e27908.uncompressed"

    const-string v3, "f6d695244bdf4cf5ad07601e91bbbe0a.uncompressed"

    const-string v4, "c112a02aea7247aba1d7d42b3717ad4c.uncompressed"

    invoke-direct {v0, v3, v4, v1, v2}, Lpwn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lpwo;->k:Lpwn;

    new-instance v1, Lpwn;

    const-string v2, "03fe86ea92a84aa1ab5ae092a841cc5f.uncompressed"

    const-string v3, "19c2acc65c334b2e99c7def80934a2f6.uncompressed"

    const-string v4, "9e6eafc374b7440e963a6109e6284668.uncompressed"

    const-string v5, "13ef2551c4a84419a5a890235ff7466c.uncompressed"

    invoke-direct {v1, v4, v5, v2, v3}, Lpwn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v1, Lpwo;->l:Lpwn;

    new-instance v2, Lpwn;

    const-string v3, "bfda31e061804f20ae2ff549b9e1386a.uncompressed"

    const-string v4, "77368ba2c4264363b9bc926c458e4927.uncompressed"

    const-string v5, "27882bd78e834ea781365960095deefd.uncompressed"

    const-string v6, "c2449adfe8ce4f6997fbc8a874f059f1.uncompressed"

    invoke-direct {v2, v5, v6, v3, v4}, Lpwn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lpwo;->m:Lpwn;

    new-instance v3, Lyek;

    invoke-direct {v3}, Lyek;-><init>()V

    const-string v4, "P21"

    invoke-virtual {v3, v4, v0}, Lyek;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v0, "P22"

    invoke-virtual {v3, v0, v1}, Lyek;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v0, "P23"

    invoke-virtual {v3, v0, v2}, Lyek;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3}, Lyek;->b()Lyeo;

    move-result-object v0

    sput-object v0, Lpwo;->c:Lyeo;

    return-void
.end method

.method public constructor <init>(Lulx;Landroid/content/Context;Lklm;Ladbv;Ljava/util/concurrent/Executor;ZLpvz;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lpwo;->h:Z

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lpwo;->i:Ljava/util/concurrent/locks/ReentrantLock;

    iput-object p1, p0, Lpwo;->n:Lulx;

    iput-object p2, p0, Lpwo;->d:Landroid/content/Context;

    iput-object p3, p0, Lpwo;->j:Lklm;

    iput-boolean p6, p0, Lpwo;->e:Z

    iput-object p4, p0, Lpwo;->f:Ladbv;

    iput-object p5, p0, Lpwo;->o:Ljava/util/concurrent/Executor;

    new-instance p1, Lcom/google/googlex/gcam/creativecamera/portraitmode/PortraitRelightingProcessorInterface;

    invoke-direct {p1}, Lcom/google/googlex/gcam/creativecamera/portraitmode/PortraitRelightingProcessorInterface;-><init>()V

    iput-object p1, p0, Lpwo;->g:Lcom/google/googlex/gcam/creativecamera/portraitmode/PortraitRelightingProcessorInterface;

    iput-object p7, p0, Lpwo;->p:Lpvz;

    return-void
.end method


# virtual methods
.method public final a()J
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
.end method

.method public final b()V
    .locals 2

    new-instance v0, Lpvt;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lpvt;-><init>(Ljava/lang/Object;I)V

    iget-object p0, p0, Lpwo;->o:Ljava/util/concurrent/Executor;

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()V
    .locals 2

    new-instance v0, Lpap;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lpap;-><init>(Ljava/lang/Object;I)V

    iget-object p0, p0, Lpwo;->o:Ljava/util/concurrent/Executor;

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d()V
    .locals 2

    new-instance v0, Lpvt;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lpvt;-><init>(Ljava/lang/Object;I)V

    iget-object p0, p0, Lpwo;->o:Ljava/util/concurrent/Executor;

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final e(Z)Z
    .locals 2

    if-eqz p1, :cond_0

    iget-object p1, p0, Lpwo;->p:Lpvz;

    iget-boolean p1, p1, Lpvz;->l:Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lpwo;->j:Lklm;

    sget-object v0, Lkkp;->c:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result p1

    :goto_0
    invoke-virtual {p0}, Lpwo;->a()J

    move-result-wide v0

    if-eqz p1, :cond_1

    const-wide/16 p0, 0x0

    cmp-long p0, v0, p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public final f(Landroid/content/Context;Ljava/lang/String;)[B
    .locals 5

    iget-object v0, p0, Lpwo;->n:Lulx;

    const-string v1, "FireflyMgr#readModelAsset"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    const/4 v0, 0x0

    new-array v1, v0, [B

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result p2

    new-array v2, p2, [B

    invoke-static {p1, v2, v0, p2}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result v0

    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lpwo;->a:Lykq;

    invoke-virtual {v3}, Lykh;->b()Lyld;

    move-result-object v3

    const/16 v4, 0x16c0

    invoke-interface {v3, v4}, Lyko;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    const-string v4, "There is more data. This is problematic"

    invoke-interface {v3, v4}, Lyko;->s(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    if-eq v0, p2, :cond_1

    sget-object p1, Lpwo;->a:Lykq;

    invoke-virtual {p1}, Lykh;->b()Lyld;

    move-result-object p1

    const/16 p2, 0x16bf

    invoke-interface {p1, p2}, Lyko;->O(I)Lyld;

    move-result-object p1

    check-cast p1, Lyko;

    const-string p2, "Didn\'t finish reading the asset."

    invoke-interface {p1, p2}, Lyko;->s(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    move-object v1, v2

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    sget-object p2, Lpwo;->a:Lykq;

    invoke-virtual {p2}, Lykh;->b()Lyld;

    move-result-object p2

    const/16 v0, 0x16c1

    invoke-interface {p2, v0}, Lyko;->O(I)Lyld;

    move-result-object p2

    check-cast p2, Lyko;

    const-string v0, "Unable to load the asset: %s"

    invoke-interface {p2, v0, p1}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object p0, p0, Lpwo;->n:Lulx;

    invoke-interface {p0}, Lulx;->g()V

    return-object v1

    :goto_1
    iget-object p0, p0, Lpwo;->n:Lulx;

    invoke-interface {p0}, Lulx;->g()V

    throw p1
.end method
