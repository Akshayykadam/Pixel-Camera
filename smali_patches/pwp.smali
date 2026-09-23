.class public Lpwp;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lpxb;


# static fields
.field private static final a:Lykq;


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/Object;

.field private final d:Lzrz;

.field private e:Z

.field private final f:Lulx;

.field private final g:Landroid/content/Context;

.field private final h:Z

.field private final i:Z

.field private final j:Z

.field private final k:Z

.field private final l:Ladbv;

.field private final m:Ladbv;

.field private n:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "pwp"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lpwp;->a:Lykq;

    return-void
.end method

.method public constructor <init>(Lulx;Landroid/content/Context;Ljava/lang/String;ZZZZZLadbv;Ladbv;Lzrz;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lpwp;->c:Ljava/lang/Object;

    iput-object p1, p0, Lpwp;->f:Lulx;

    iput-object p2, p0, Lpwp;->g:Landroid/content/Context;

    iput-object p3, p0, Lpwp;->b:Ljava/lang/String;

    iput-boolean p4, p0, Lpwp;->h:Z

    iput-boolean p5, p0, Lpwp;->i:Z

    iput-boolean p6, p0, Lpwp;->j:Z

    iput-boolean p7, p0, Lpwp;->n:Z

    iput-boolean p8, p0, Lpwp;->k:Z

    iput-object p9, p0, Lpwp;->l:Ladbv;

    iput-object p10, p0, Lpwp;->m:Ladbv;

    iput-object p11, p0, Lpwp;->d:Lzrz;

    return-void
.end method

.method private final c(I)V
    .locals 4

    sget-object v0, Lyyp;->a:Lyyp;

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v0

    iget-object v1, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_0
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyyp;

    add-int/lit8 p1, p1, -0x1

    iput p1, v2, Lyyp;->c:I

    iget p1, v2, Lyyp;->b:I

    or-int/lit8 p1, p1, 0x1

    iput p1, v2, Lyyp;->b:I

    iget-object p1, p0, Lpwp;->b:Ljava/lang/String;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_1
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyyp;

    iget v3, v2, Lyyp;->b:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v2, Lyyp;->b:I

    iput-object p1, v2, Lyyp;->d:Ljava/lang/String;

    iget-boolean p1, p0, Lpwp;->h:Z

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_2
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyyp;

    iget v3, v2, Lyyp;->b:I

    or-int/lit8 v3, v3, 0x4

    iput v3, v2, Lyyp;->b:I

    iput-boolean p1, v2, Lyyp;->e:Z

    iget-boolean p1, p0, Lpwp;->i:Z

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_3
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyyp;

    iget v3, v2, Lyyp;->b:I

    or-int/lit8 v3, v3, 0x8

    iput v3, v2, Lyyp;->b:I

    iput-boolean p1, v2, Lyyp;->f:Z

    iget-boolean p1, p0, Lpwp;->j:Z

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_4
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyyp;

    iget v3, v2, Lyyp;->b:I

    or-int/lit8 v3, v3, 0x10

    iput v3, v2, Lyyp;->b:I

    iput-boolean p1, v2, Lyyp;->g:Z

    iget-boolean p1, p0, Lpwp;->n:Z

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_5
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyyp;

    iget v3, v2, Lyyp;->b:I

    or-int/lit8 v3, v3, 0x20

    iput v3, v2, Lyyp;->b:I

    iput-boolean p1, v2, Lyyp;->h:Z

    iget-boolean p1, p0, Lpwp;->k:Z

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_6
    iget-object v1, v0, Laaxk;->b:Laaxp;

    check-cast v1, Lyyp;

    iget v2, v1, Lyyp;->b:I

    or-int/lit8 v2, v2, 0x40

    iput v2, v1, Lyyp;->b:I

    iput-boolean p1, v1, Lyyp;->i:Z

    invoke-virtual {v0}, Laaxk;->i()Laaxp;

    move-result-object p1

    check-cast p1, Lyyp;

    iget-object p0, p0, Lpwp;->m:Ladbv;

    invoke-interface {p0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrex;

    invoke-virtual {p0, p1}, Lrex;->r(Lyyp;)V

    return-void
.end method


# virtual methods
.method public final a()J
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
.end method

.method public final b()V
    .locals 19

    move-object/from16 v1, p0

    iget-object v2, v1, Lpwp;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-boolean v0, v1, Lpwp;->e:Z

    if-nez v0, :cond_7

    iget-object v0, v1, Lpwp;->g:Landroid/content/Context;

    iget-object v3, v1, Lpwp;->b:Ljava/lang/String;

    iget-object v4, v1, Lpwp;->f:Lulx;

    const-string v5, "PortraitSegmenterManager#loadModelAsset"

    invoke-interface {v4, v5}, Lulx;->f(Ljava/lang/String;)V

    const/4 v4, 0x0

    new-array v5, v4, [B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v3

    new-array v6, v3, [B

    invoke-static {v0, v6, v4, v3}, Lcom/google/common/io/ByteStreams;->read(Ljava/io/InputStream;[BII)I

    move-result v7

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v8

    if-eqz v8, :cond_0

    sget-object v8, Lpwp;->a:Lykq;

    invoke-virtual {v8}, Lykh;->b()Lyld;

    move-result-object v8

    const/16 v9, 0x16c6

    invoke-interface {v8, v9}, Lyko;->O(I)Lyld;

    move-result-object v8

    check-cast v8, Lyko;

    const-string v9, "There is more data. This is problematic"

    invoke-interface {v8, v9}, Lyko;->s(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    if-eq v7, v3, :cond_1

    sget-object v0, Lpwp;->a:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v3, 0x16c5

    invoke-interface {v0, v3}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v3, "Didn\'t finish reading the asset..."

    invoke-interface {v0, v3}, Lyko;->s(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    move-object v5, v6

    goto :goto_0

    :catch_0
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

    :goto_0
    iget-object v0, v1, Lpwp;->f:Lulx;

    invoke-interface {v0}, Lulx;->g()V

    iget-object v6, v1, Lpwp;->d:Lzrz;

    iget-object v11, v1, Lpwp;->b:Ljava/lang/String;

    array-length v3, v5

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    invoke-static {v3}, Lcom/google/googlex/gcam/BufferUtils;->a(Ljava/nio/Buffer;)J

    move-result-wide v7

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v9

    int-to-long v9, v9

    const-string v12, "PortraitSegmenterManager#nativeInitialization"

    invoke-interface {v0, v12}, Lulx;->f(Ljava/lang/String;)V

    iget-object v12, v1, Lpwp;->l:Ladbv;

    check-cast v12, Lnjx;

    invoke-virtual {v12}, Lnjx;->b()Lxwg;

    move-result-object v12

    invoke-virtual {v12}, Lxwg;->h()Z

    move-result v13

    if-eqz v13, :cond_4

    const-string v13, "1c33c30c31a74d99b66f54c22014a27a"

    invoke-virtual {v11, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "tflite_vakunov_multi-subject_2018-06-09.fb"

    goto :goto_1

    :cond_2
    const-string v13, "bb75135a398f4b5ca6c8f6991e0a9992"

    invoke-virtual {v11, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_3

    const-string v13, "tflite_vakunov_multi-subject_2018-06-09_custom-op_p26.tflite"

    goto :goto_1

    :cond_3
    move-object v13, v11

    :goto_1
    new-instance v14, Ljava/io/File;

    invoke-virtual {v12}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/io/File;

    const-string v15, ".cache"

    invoke-virtual {v13, v15}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v14, v12, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    :cond_4
    const-string v12, ""

    :goto_2
    iget-boolean v13, v1, Lpwp;->h:Z

    iget-boolean v14, v1, Lpwp;->i:Z

    iget-boolean v15, v1, Lpwp;->j:Z

    iget-boolean v4, v1, Lpwp;->n:Z

    move-object/from16 v18, v0

    iget-boolean v0, v1, Lpwp;->k:Z

    move/from16 v17, v0

    move/from16 v16, v4

    invoke-interface/range {v6 .. v17}, Lzrz;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    if-nez v0, :cond_init_ok

    const/4 v13, 0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-interface/range {v6 .. v17}, Lzrz;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    :cond_init_ok
    if-eqz v0, :cond_5

    if-nez v13, :cond_5

    iget-boolean v4, v1, Lpwp;->n:Z

    if-eqz v4, :cond_5

    invoke-interface {v6}, Lzrz;->dummyImageProducesReasonableMask()Z

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Lpwp;->a:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v4, 0x16c3

    invoke-interface {v0, v4}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v4, "OpenCL segmenter failed to produce a reasonable mask, falling back to OpenGL."

    invoke-interface {v0, v4}, Lyko;->s(Ljava/lang/String;)V

    invoke-interface {v6}, Lzrz;->release()V

    const/4 v0, 0x5

    invoke-direct {v1, v0}, Lpwp;->c(I)V

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    const/4 v3, 0x0

    iput-boolean v3, v1, Lpwp;->n:Z

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/4 v13, 0x0

    invoke-interface/range {v6 .. v17}, Lzrz;->initSegmenter(JJLjava/lang/String;Ljava/lang/String;ZZZZZ)Z

    move-result v0

    :cond_5
    invoke-interface/range {v18 .. v18}, Lulx;->g()V

    if-nez v0, :cond_6

    const/4 v3, 0x4

    invoke-direct {v1, v3}, Lpwp;->c(I)V

    :cond_6
    iput-boolean v0, v1, Lpwp;->e:Z

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

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
