.class public final synthetic Lmwg;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field private final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .locals 0

    iput p2, p0, Lmwg;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmwg;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;I[B)V
    .locals 0

    .line 8
    iput p2, p0, Lmwg;->b:I

    iput-object p1, p0, Lmwg;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 30

    move-object/from16 v0, p0

    iget v1, v0, Lmwg;->b:I

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v6, 0x0

    packed-switch v1, :pswitch_data_0

    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lnhx;

    iget-object v0, v0, Lnhx;->e:Lufn;

    invoke-virtual {v0, v5}, Lufn;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_0
    iget-object v1, v0, Lmwg;->a:Ljava/lang/Object;

    :try_start_0
    move-object v0, v1

    check-cast v0, Lnhx;

    iget-object v0, v0, Lnhx;->t:Laaog;

    iget-object v2, v0, Laaog;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Laaog;->l(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    iget-object v4, v0, Laaog;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Laaog;->l(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    move-object v0, v1

    check-cast v0, Lnhx;

    iget-object v0, v0, Lnhx;->i:Lulx;

    const-string v6, "MotionBlur#initialize"

    invoke-interface {v0, v6}, Lulx;->f(Ljava/lang/String;)V

    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->f:Luut;

    invoke-interface {v6}, Luut;->g()Ljava/util/List;

    move-result-object v7

    new-instance v8, Lulc;

    invoke-direct {v8, v3, v3}, Lulc;-><init>(II)V

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Luuv;

    invoke-interface {v6, v7}, Luut;->a(Luuv;)Luus;

    move-result-object v7

    invoke-static {v8, v7}, Lnhx;->i(Lulc;Luus;)Lulc;

    move-result-object v8

    invoke-interface {v7}, Luus;->M()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v7}, Luus;->D()Z

    move-result v9

    if-eqz v9, :cond_0

    check-cast v7, Luur;

    iget-object v7, v7, Luur;->b:Lyfm;

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Luuv;

    invoke-interface {v6, v9}, Luut;->a(Luuv;)Luus;

    move-result-object v9

    invoke-static {v8, v9}, Lnhx;->i(Lulc;Luus;)Lulc;

    move-result-object v8

    goto :goto_0

    :cond_1
    move-object v3, v1

    check-cast v3, Lnhx;

    iget-object v3, v3, Lnhx;->q:Lpwp;

    invoke-virtual {v3}, Lpwp;->a()J

    move-result-wide v6

    const-wide/16 v9, 0x0

    cmp-long v6, v6, v9

    if-nez v6, :cond_2

    const-string v6, "PortraitSegmenter#init"

    invoke-interface {v0, v6}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v3}, Lpwp;->b()V

    invoke-interface {v0}, Lulx;->g()V

    :cond_2
    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->s:Lklm;

    sget-object v7, Lkkb;->j:Lkiz;

    invoke-virtual {v6, v7}, Lklm;->q(Lkiz;)Z

    const/16 v19, 0x0

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v20

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v21

    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v23

    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v25

    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v26

    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v28

    const-string v6, "MotionBlurNativeProcessor#initialize"

    invoke-interface {v0, v6}, Lulx;->f(Ljava/lang/String;)V

    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v9, v6, Lnhx;->c:Lnid;

    iget v10, v8, Lulc;->a:I

    iget v11, v8, Lulc;->b:I

    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v12, v6, Lnhx;->g:Lzne;

    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->j:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->j:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3}, Lpwp;->a()J

    move-result-wide v15

    move-object v3, v1

    check-cast v3, Lnhx;

    iget-object v3, v3, Lnhx;->d:Lzot;

    move-object v6, v1

    check-cast v6, Lnhx;

    iget-object v6, v6, Lnhx;->p:Lcom/google/googlex/gcam/lasagna/LasagnaCallbacks;

    move-object/from16 v17, v3

    move-object/from16 v18, v6

    invoke-virtual/range {v9 .. v29}, Lnid;->d(IILzne;Ljava/lang/String;Ljava/lang/String;JLcom/google/googlex/gcam/clientallocator/InterleavedU8ClientAllocator;Lcom/google/googlex/gcam/lasagna/LasagnaCallbacks;ZIJJIJJ)V

    invoke-interface {v0}, Lulx;->g()V

    invoke-virtual {v9}, Lnid;->e()V

    move-object v0, v1

    check-cast v0, Lnhx;

    iget-object v0, v0, Lnhx;->e:Lufn;

    invoke-virtual {v0, v5}, Lufn;->a(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v4, :cond_4

    :try_start_3
    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_4
    if-eqz v2, :cond_7

    :try_start_4
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_4

    :catchall_0
    move-exception v0

    move-object v3, v0

    if-eqz v4, :cond_5

    :try_start_5
    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_2
    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception v0

    move-object v3, v0

    if-eqz v2, :cond_6

    :try_start_7
    invoke-virtual {v2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v0

    :try_start_8
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_3
    throw v3
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :catchall_4
    move-exception v0

    goto :goto_5

    :catch_0
    move-exception v0

    :try_start_9
    sget-object v2, Lnhx;->a:Lykq;

    invoke-virtual {v2}, Lykh;->b()Lyld;

    move-result-object v2

    invoke-interface {v2, v0}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const/16 v2, 0xed0

    invoke-interface {v0, v2}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v2, "Error initializing processor."

    invoke-interface {v0, v2}, Lyko;->s(Ljava/lang/String;)V

    goto :goto_4

    :catch_1
    move-exception v0

    sget-object v2, Lnhx;->a:Lykq;

    invoke-virtual {v2}, Lykh;->b()Lyld;

    move-result-object v2

    invoke-interface {v2, v0}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const/16 v2, 0xecf

    invoke-interface {v0, v2}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v2, "Unable to get model asset file"

    invoke-interface {v0, v2}, Lyko;->s(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :cond_7
    :goto_4
    check-cast v1, Lnhx;

    iget-object v0, v1, Lnhx;->i:Lulx;

    invoke-interface {v0}, Lulx;->g()V

    return-void

    :goto_5
    check-cast v1, Lnhx;

    iget-object v1, v1, Lnhx;->i:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    throw v0

    :pswitch_1
    iget-object v1, v0, Lmwg;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_a
    move-object v0, v1

    check-cast v0, Lnhk;

    iput-object v6, v0, Lnhk;->f:Lnio;

    monitor-exit v1

    return-void

    :catchall_5
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    throw v0

    :pswitch_2
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lnfu;

    iget-object v1, v0, Lnfu;->d:Lvzt;

    invoke-virtual {v1}, Lvzt;->close()V

    iget-object v1, v0, Lnfu;->f:Lvzp;

    invoke-virtual {v1}, Lvxw;->close()V

    iget-object v1, v0, Lnfu;->c:Lvxo;

    invoke-interface {v1}, Lvxo;->close()V

    iget-object v1, v0, Lnfu;->e:Landroid/view/Surface;

    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    iget-object v0, v0, Lnfu;->b:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void

    :pswitch_3
    sget-object v1, Lnfu;->a:Lykq;

    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    :try_start_b
    check-cast v0, Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_2

    return-void

    :catch_2
    move-exception v0

    sget-object v1, Lnfu;->a:Lykq;

    invoke-virtual {v1}, Lykh;->b()Lyld;

    move-result-object v1

    const-string v2, "Could not close file."

    const/16 v3, 0xe90

    invoke-static {v2, v3, v1, v0}, La;->bH(Ljava/lang/String;CLyko;Ljava/lang/Throwable;)V

    return-void

    :pswitch_4
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/apps/camera/keepalive/ProcessGcService;

    iget-object v1, v0, Lcom/google/android/apps/camera/keepalive/ProcessGcService;->d:Lnfb;

    invoke-virtual {v1}, Lnfb;->d()Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/google/android/apps/camera/keepalive/ProcessGcService;->a(I)V

    return-void

    :cond_8
    const/16 v0, 0x4d2

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    return-void

    :pswitch_5
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lnfe;

    iget-object v5, v1, Lnfe;->f:Lnfb;

    invoke-virtual {v5}, Lnfb;->d()Z

    move-result v5

    if-eqz v5, :cond_9

    goto/16 :goto_b

    :cond_9
    iget-object v5, v1, Lnfe;->c:Lree;

    invoke-interface {v5}, Lree;->b()Lred;

    move-result-object v5

    iget-object v7, v5, Lred;->a:Ljava/util/Map;

    const-string v8, "dalvikRssMb"

    const/4 v9, 0x4

    new-array v10, v9, [Lnfd;

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    instance-of v11, v8, Ljava/lang/Number;

    if-eqz v11, :cond_a

    check-cast v8, Ljava/lang/Number;

    goto :goto_6

    :cond_a
    move-object v8, v6

    :goto_6
    if-nez v8, :cond_c

    :cond_b
    move-object v8, v6

    goto :goto_7

    :cond_c
    invoke-virtual {v8}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    const-wide/16 v13, 0x190

    cmp-long v8, v11, v13

    if-ltz v8, :cond_b

    sget-object v8, Lnfe;->a:Lykq;

    invoke-virtual {v8}, Lykh;->c()Lyld;

    move-result-object v8

    const/16 v13, 0xe5c

    invoke-interface {v8, v13}, Lyld;->O(I)Lyld;

    move-result-object v8

    check-cast v8, Lyko;

    const-string v13, "Bad memory state: Dalvik RSS %dMB >= threshold"

    invoke-interface {v8, v13, v11, v12}, Lyko;->u(Ljava/lang/String;J)V

    sget-object v8, Lnfd;->a:Lnfd;

    :goto_7
    aput-object v8, v10, v3

    const-string v3, "dmabufRssMb"

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    instance-of v7, v3, Ljava/lang/Number;

    if-eqz v7, :cond_d

    check-cast v3, Ljava/lang/Number;

    goto :goto_8

    :cond_d
    move-object v3, v6

    :goto_8
    if-nez v3, :cond_f

    :cond_e
    move-object v3, v6

    goto :goto_9

    :cond_f
    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    const-wide/16 v11, 0x1f4

    cmp-long v3, v7, v11

    if-ltz v3, :cond_e

    sget-object v3, Lnfe;->a:Lykq;

    invoke-virtual {v3}, Lykh;->c()Lyld;

    move-result-object v3

    const/16 v11, 0xe5d

    invoke-interface {v3, v11}, Lyld;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    const-string v11, "Bad memory state: DMABuf RSS %dMB >= threshold"

    invoke-interface {v3, v11, v7, v8}, Lyko;->u(Ljava/lang/String;J)V

    sget-object v3, Lnfd;->b:Lnfd;

    :goto_9
    aput-object v3, v10, v4

    iget-object v3, v5, Lred;->b:Lret;

    iget v4, v3, Lret;->b:I

    and-int/2addr v4, v9

    if-eqz v4, :cond_12

    iget-object v3, v3, Lret;->e:Lnav;

    if-nez v3, :cond_10

    sget-object v3, Lnav;->a:Lnav;

    :cond_10
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v3, Lnav;->c:Laaye;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_12

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnaw;

    iget-wide v7, v4, Lnaw;->b:J

    iget-wide v11, v4, Lnaw;->c:J

    mul-long v17, v7, v11

    const-wide/32 v7, 0xc800000

    cmp-long v7, v17, v7

    if-ltz v7, :cond_11

    sget-object v3, Lnfe;->a:Lykq;

    invoke-virtual {v3}, Lykh;->c()Lyld;

    move-result-object v3

    const/16 v7, 0xe5e

    invoke-interface {v3, v7}, Lyld;->O(I)Lyld;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Lyko;

    iget-wide v3, v4, Lnaw;->b:J

    const-string v14, "Bad memory state: Scudo chunk size %d (total %d bytes) >= threshold"

    move-wide v15, v3

    invoke-interface/range {v13 .. v18}, Lyko;->A(Ljava/lang/String;JJ)V

    sget-object v3, Lnfd;->c:Lnfd;

    goto :goto_a

    :cond_12
    move-object v3, v6

    :goto_a
    const/4 v4, 0x2

    aput-object v3, v10, v4

    iget v3, v5, Lred;->c:I

    if-lt v3, v2, :cond_13

    sget-object v2, Lnfe;->a:Lykq;

    invoke-virtual {v2}, Lykh;->c()Lyld;

    move-result-object v2

    const/16 v5, 0xe59

    invoke-interface {v2, v5}, Lyld;->O(I)Lyld;

    move-result-object v2

    check-cast v2, Lyko;

    const-string v5, "Bad state: Active Activity Count %d >= threshold"

    invoke-interface {v2, v5, v3}, Lyko;->t(Ljava/lang/String;I)V

    sget-object v6, Lnfd;->d:Lnfd;

    :cond_13
    const/4 v2, 0x3

    aput-object v6, v10, v2

    invoke-static {v10}, Laaax;->C([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_14

    sget-object v3, Lnfe;->a:Lykq;

    invoke-virtual {v3}, Lykh;->b()Lyld;

    move-result-object v3

    const/16 v5, 0xe5a

    invoke-interface {v3, v5}, Lyld;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    sget-wide v5, Lnfe;->b:J

    invoke-static {v5, v6}, Ladjv;->e(J)J

    move-result-wide v7

    const-string v9, "Bad memory state detected. Scheduling proactive process termination in %dms. Reason(s): %s"

    invoke-interface {v3, v9, v7, v8, v2}, Lyko;->B(Ljava/lang/String;JLjava/lang/Object;)V

    iget-object v3, v1, Lnfe;->d:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v7, Lmyz;

    invoke-direct {v7, v0, v2, v4}, Lmyz;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-static {v5, v6}, Ladjv;->e(J)J

    move-result-wide v4

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v7, v4, v5, v0}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, v1, Lnfe;->e:Ljava/util/concurrent/ScheduledFuture;

    return-void

    :pswitch_6
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lnfa;

    iput-object v6, v0, Lnfa;->b:Ljava/lang/Runnable;

    invoke-static {}, Luer;->a()V

    iget-object v0, v0, Lnfa;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_15

    :cond_14
    :goto_b
    return-void

    :cond_15
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_7
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lneq;

    invoke-virtual {v0}, Lneq;->o()V

    return-void

    :pswitch_8
    sget v1, Lneg;->a:I

    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->sendAccessibilityEvent(I)V

    return-void

    :pswitch_9
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    check-cast v0, Lnee;

    iget-object v3, v0, Lnee;->m:Lndo;

    iput-wide v1, v3, Lndo;->a:J

    iput-boolean v4, v3, Lndo;->b:Z

    invoke-virtual {v3}, Lndo;->a()V

    sget-object v1, Lncz;->b:Lncz;

    invoke-virtual {v0, v1}, Lnee;->l(Lncz;)V

    invoke-virtual {v0}, Lnee;->j()V

    return-void

    :pswitch_a
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lndw;

    invoke-virtual {v0}, Lndw;->m()V

    return-void

    :pswitch_b
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    invoke-interface {v0}, Lmzd;->i()V

    return-void

    :pswitch_c
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmzb;

    invoke-virtual {v0}, Lmzb;->l()V

    return-void

    :pswitch_d
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lmzb;

    iget-object v1, v1, Lmzb;->c:Lnnb;

    invoke-virtual {v1, v0}, Lnnb;->l(Lnnq;)V

    return-void

    :pswitch_e
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmxy;

    iget-object v1, v0, Lmxy;->i:Lcom/google/android/libraries/vision/opengl/Texture;

    iget-object v2, v0, Lmxy;->h:Lmxv;

    iget v3, v2, Lmxv;->a:I

    iget v2, v2, Lmxv;->b:I

    mul-int/2addr v3, v2

    div-int/lit16 v3, v3, 0x7e90

    int-to-double v2, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-double v2, v2

    const-wide/16 v4, 0x0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    double-to-int v8, v2

    invoke-virtual {v1}, Lcom/google/android/libraries/vision/opengl/Texture;->getName()I

    move-result v5

    invoke-virtual {v1}, Lcom/google/android/libraries/vision/opengl/Texture;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Lcom/google/android/libraries/vision/opengl/Texture;->getHeight()I

    move-result v7

    iget-object v0, v0, Lmxy;->d:Lmxm;

    move-object v4, v0

    check-cast v4, Lcom/google/android/apps/camera/imax/cyclops/processing/NativeCaptureImpl;

    iget v9, v4, Lcom/google/android/apps/camera/imax/cyclops/processing/NativeCaptureImpl;->a:I

    iget v10, v4, Lcom/google/android/apps/camera/imax/cyclops/processing/NativeCaptureImpl;->b:F

    invoke-virtual/range {v4 .. v10}, Lcom/google/android/apps/camera/imax/cyclops/processing/NativeCaptureImpl;->initialize(IIIIIF)V

    return-void

    :pswitch_f
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmxy;

    iget-object v0, v0, Lmxy;->d:Lmxm;

    invoke-interface {v0}, Lmxm;->release()V

    return-void

    :pswitch_10
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmxx;

    invoke-virtual {v0}, Lmxx;->f()V

    return-void

    :pswitch_11
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmxe;

    invoke-virtual {v0}, Lmxe;->c()V

    return-void

    :pswitch_12
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmwi;

    iget-object v1, v0, Lmwi;->b:Lmxy;

    invoke-virtual {v1}, Lmxy;->close()V

    iget-object v0, v0, Lmwi;->m:Lmxc;

    invoke-virtual {v0}, Lmxc;->close()V

    return-void

    :pswitch_13
    iget-object v0, v0, Lmwg;->a:Ljava/lang/Object;

    check-cast v0, Lmwi;

    invoke-virtual {v0, v4, v4}, Lmwi;->h(ZI)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
