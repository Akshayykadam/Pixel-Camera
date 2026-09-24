.class public Lmkm;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field private static final b:Lykq;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field private final c:Lmlt;

.field private final d:Ladbv;

.field private final e:Lmmz;

.field private final f:Lmsv;

.field private final g:Lyeo;

.field private final h:Lulx;

.field private final i:Lsql;

.field private final j:Lpeb;

.field private final k:Loui;

.field private final l:Lklm;

.field private final m:Lovu;

.field private final n:Lovu;

.field private final o:Lovu;

.field private final p:Lrdw;

.field private final q:Lrdw;

.field private final r:Lrdw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "mkm"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lmkm;->b:Lykq;

    return-void
.end method

.method public constructor <init>(Lrdw;Lmlt;Loui;Lacbr;Lacbr;Lacbr;Ladbv;Lklm;Lrdw;Lrdw;Lmmz;Lmsv;Lyeo;Lulx;Lsql;Lpeb;Ljava/util/concurrent/Executor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmkm;->p:Lrdw;

    iput-object p2, p0, Lmkm;->c:Lmlt;

    new-instance p1, Lovu;

    const/4 p2, 0x0

    invoke-direct {p1, p4, p2}, Lovu;-><init>(Ljava/lang/Object;[B)V

    iput-object p1, p0, Lmkm;->m:Lovu;

    iput-object p3, p0, Lmkm;->k:Loui;

    new-instance p1, Lovu;

    invoke-direct {p1, p5, p2}, Lovu;-><init>(Ljava/lang/Object;[B)V

    iput-object p1, p0, Lmkm;->n:Lovu;

    new-instance p1, Lovu;

    invoke-direct {p1, p6, p2}, Lovu;-><init>(Ljava/lang/Object;[B)V

    iput-object p1, p0, Lmkm;->o:Lovu;

    iput-object p7, p0, Lmkm;->d:Ladbv;

    iput-object p8, p0, Lmkm;->l:Lklm;

    iput-object p9, p0, Lmkm;->r:Lrdw;

    iput-object p10, p0, Lmkm;->q:Lrdw;

    iput-object p11, p0, Lmkm;->e:Lmmz;

    iput-object p12, p0, Lmkm;->f:Lmsv;

    iput-object p13, p0, Lmkm;->g:Lyeo;

    iput-object p14, p0, Lmkm;->h:Lulx;

    iput-object p15, p0, Lmkm;->i:Lsql;

    move-object/from16 p1, p16

    iput-object p1, p0, Lmkm;->j:Lpeb;

    move-object/from16 p1, p17

    iput-object p1, p0, Lmkm;->a:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private static e(Lmnz;)Lmiw;
    .locals 1

    iget-object v0, p0, Lmnz;->b:Lcom/google/googlex/gcam/YuvImage;

    if-nez v0, :cond_2

    iget-object v0, p0, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-nez v0, :cond_1

    iget-object p0, p0, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    if-eqz p0, :cond_0

    sget-object p0, Lmiw;->d:Lmiw;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unknown image format in PostprocessingImage."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    sget-object p0, Lmiw;->c:Lmiw;

    return-object p0

    :cond_2
    sget-object p0, Lmiw;->b:Lmiw;

    return-object p0
.end method

.method private static f(Lmnz;)Lj$/util/Optional;
    .locals 2

    iget-object p0, p0, Lmnz;->u:Ltse;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Ltse;->c:Ljava/lang/Object;

    invoke-interface {p0}, Lqrg;->u()Lxwg;

    move-result-object p0

    invoke-virtual {p0}, Lxwg;->k()Lj$/util/Optional;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eq v0, v1, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgxt;

    iget-object p0, p0, Lgxt;->a:Ljava/lang/Object;

    invoke-static {p0}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    return-object p0
.end method

.method private final g(Lmnz;)V
    .locals 3

    iget-object v0, p0, Lmkm;->i:Lsql;

    sget-object v1, Lsql;->r:Lsql;

    invoke-virtual {v0, v1}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p1, Lmnz;->p:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p0, p0, Lmkm;->e:Lmmz;

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llyi;

    invoke-virtual {p0, p1, v0}, Lmmz;->g(Lmnz;Llyi;)V

    return-void

    :cond_0
    iget-object v1, p1, Lmnz;->h:Lmnv;

    invoke-interface {v1}, Lmnv;->f()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {v1}, Lmnv;->c()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p0, p0, Lmkm;->e:Lmmz;

    sget-object v1, Lsql;->g:Lsql;

    if-ne v0, v1, :cond_1

    sget-object v0, Llyi;->v:Llyi;

    goto :goto_0

    :cond_1
    sget-object v0, Llyi;->p:Llyi;

    :goto_0
    invoke-virtual {p0, p1, v0}, Lmmz;->g(Lmnz;Llyi;)V

    :cond_2
    return-void

    :cond_3
    iget-object p0, p0, Lmkm;->e:Lmmz;

    sget-object v0, Llyi;->u:Llyi;

    invoke-virtual {p0, p1, v0}, Lmmz;->g(Lmnz;Llyi;)V

    return-void
.end method

.method private static h(Lmnz;)Z
    .locals 5

    iget-object p0, p0, Lmnz;->d:Lcom/google/googlex/gcam/ShotMetadata;

    invoke-virtual {p0}, Lcom/google/googlex/gcam/ShotMetadata;->d()Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/googlex/gcam/FrameMetadata;->p()Lcom/google/googlex/gcam/FaceInfoVector;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/google/googlex/gcam/FaceInfoVector;->b()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p0, v1, v3

    if-lez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0
.end method

.method private final i(Lmnz;)Z
    .locals 2

    iget-object v0, p0, Lmkm;->i:Lsql;

    sget-object v1, Lsql;->r:Lsql;

    invoke-virtual {v0, v1}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lmkm;->j:Lpeb;

    invoke-virtual {p1}, Lmnz;->b()Lulc;

    move-result-object v0

    iget-object p0, p0, Lpeb;->b:Lulc;

    invoke-virtual {p0, v0}, Lulc;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lmnz;->b()Lulc;

    move-result-object v0

    invoke-virtual {v0}, Lulc;->g()Lulc;

    move-result-object v0

    invoke-virtual {p0, v0}, Lulc;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lmnz;->b()Lulc;

    :cond_1
    return v1
.end method

.method private final j(Lmnz;Loui;)V
    .locals 18

    return-void

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p2 .. p2}, Luvf;->l()Luve;

    move-result-object v2

    sget-object v3, Luve;->a:Luve;

    invoke-virtual {v2, v3}, Luve;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, v1, Lmnz;->f:Luzj;

    invoke-interface {v3}, Luzj;->b()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lmkm;->d(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-nez v4, :cond_1

    invoke-interface {v3}, Luzj;->c()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-static {v3}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v3

    new-instance v4, Liib;

    const/16 v7, 0x14

    invoke-direct {v4, v0, v7}, Liib;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v3, v4}, Lj$/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    move v3, v5

    goto :goto_1

    :cond_1
    :goto_0
    move v3, v6

    :goto_1
    iget-object v4, v1, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v4, :cond_2

    move v7, v6

    goto :goto_2

    :cond_2
    move v7, v5

    :goto_2
    iget-object v8, v1, Lmnz;->u:Ltse;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v9, v8, Ltse;->a:Ljava/lang/Object;

    check-cast v9, Lost;

    iget-boolean v9, v9, Lost;->k:Z

    if-eqz v7, :cond_2d

    if-nez v2, :cond_3

    if-eqz v3, :cond_2d

    :cond_3
    if-nez v9, :cond_2d

    sget-object v2, Lmuo;->a:Lmuo;

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lcom/google/googlex/gcam/InterleavedImageU8;->e(Lcom/google/googlex/gcam/InterleavedImageU8;)J

    move-result-wide v3

    iget-object v7, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v7}, Laaxp;->T()Z

    move-result v7

    if-nez v7, :cond_4

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_4
    iget-object v7, v2, Laaxk;->b:Laaxp;

    move-object v9, v7

    check-cast v9, Lmuo;

    iget v10, v9, Lmuo;->b:I

    or-int/2addr v10, v6

    iput v10, v9, Lmuo;->b:I

    iput-wide v3, v9, Lmuo;->c:J

    iget-object v3, v1, Lmnz;->d:Lcom/google/googlex/gcam/ShotMetadata;

    invoke-static {v3}, Lcom/google/googlex/gcam/ShotMetadata;->a(Lcom/google/googlex/gcam/ShotMetadata;)J

    move-result-wide v3

    invoke-virtual {v7}, Laaxp;->T()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_5
    iget-object v7, v2, Laaxk;->b:Laaxp;

    check-cast v7, Lmuo;

    iget v9, v7, Lmuo;->b:I

    const/4 v10, 0x2

    or-int/2addr v9, v10

    iput v9, v7, Lmuo;->b:I

    iput-wide v3, v7, Lmuo;->d:J

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v8, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v3}, Lqrg;->q()Lqrt;

    move-result-object v3

    iget v3, v3, Lqrt;->a:I

    int-to-long v3, v3

    iget-object v7, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v7}, Laaxp;->T()Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_6
    iget-object v7, v2, Laaxk;->b:Laaxp;

    check-cast v7, Lmuo;

    iget v8, v7, Lmuo;->b:I

    const/4 v9, 0x4

    or-int/2addr v8, v9

    iput v8, v7, Lmuo;->b:I

    iput-wide v3, v7, Lmuo;->e:J

    invoke-static {v1}, Lmkm;->f(Lmnz;)Lj$/util/Optional;

    move-result-object v3

    new-instance v4, Llza;

    const/16 v7, 0xc

    invoke-direct {v4, v2, v7}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v3}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    if-eq v6, v7, :cond_7

    goto :goto_3

    :cond_7
    invoke-virtual {v3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    iget-object v4, v4, Llza;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    check-cast v4, Laaxk;

    iget-object v7, v4, Laaxk;->b:Laaxp;

    invoke-virtual {v7}, Laaxp;->T()Z

    move-result v7

    if-nez v7, :cond_8

    invoke-virtual {v4}, Laaxk;->o()V

    :cond_8
    iget-object v4, v4, Laaxk;->b:Laaxp;

    check-cast v4, Lmuo;

    iget v7, v4, Lmuo;->b:I

    or-int/lit8 v7, v7, 0x10

    iput v7, v4, Lmuo;->b:I

    iput-object v3, v4, Lmuo;->g:Ljava/lang/String;

    :goto_3
    iget-object v3, v0, Lmkm;->d:Ladbv;

    check-cast v3, Lmum;

    invoke-virtual {v3}, Lmum;->b()Lcom/google/android/apps/camera/hdrplus/postprocessing/flareremoval/jni/NativeFlareRemoval;

    move-result-object v3

    const/4 v4, 0x0

    :try_start_0
    new-instance v7, Lulw;

    iget-object v8, v0, Lmkm;->h:Lulx;

    const-string v11, "ceftazidime#process"

    invoke-direct {v7, v8, v11}, Lulw;-><init>(Lulx;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    :try_start_1
    new-instance v8, Lmcw;

    invoke-direct {v8, v0, v3, v9}, Lmcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_b

    :try_start_2
    iget-object v0, v1, Lmnz;->t:Lj$/util/Optional;

    invoke-virtual {v0, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lmuy;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_9

    if-eqz v11, :cond_9

    :try_start_3
    iget-object v0, v11, Lmuy;->a:Lmux;

    iget-object v0, v0, Lmux;->a:Lpqd;

    invoke-virtual {v0}, Lpqd;->t()Luzo;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v12, v0

    goto :goto_4

    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object/from16 p2, v7

    goto/16 :goto_d

    :cond_9
    move-object v12, v4

    :goto_4
    if-eqz v12, :cond_1c

    :try_start_4
    new-instance v13, Lzsl;

    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v13, v12}, Lzsl;->c(Luzo;)Lcom/google/googlex/gcam/YuvWriteView;

    move-result-object v4

    invoke-static {v4}, Lcom/google/googlex/gcam/YuvWriteView;->c(Lcom/google/googlex/gcam/YuvWriteView;)J

    move-result-wide v13

    iget-object v15, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v15}, Laaxp;->T()Z

    move-result v15

    if-nez v15, :cond_a

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_a
    iget-object v15, v2, Laaxk;->b:Laaxp;

    check-cast v15, Lmuo;

    const/16 p0, 0x8

    iget v0, v15, Lmuo;->b:I

    or-int/lit8 v0, v0, 0x8

    iput v0, v15, Lmuo;->b:I

    iput-wide v13, v15, Lmuo;->f:J

    sget-object v0, Labkr;->a:Labkr;

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v0

    sget-object v13, Labkq;->a:Labkq;

    invoke-virtual {v13}, Laaxp;->D()Laaxk;

    move-result-object v13

    iget-object v14, v11, Lmuy;->a:Lmux;

    iget-object v15, v14, Lmux;->e:Ljava/util/List;

    invoke-interface {v15, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Float;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Float;->floatValue()F

    move-result v5

    move/from16 v16, v9

    iget-object v9, v13, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_b

    invoke-virtual {v13}, Laaxk;->o()V

    :cond_b
    iget-object v9, v13, Laaxk;->b:Laaxp;

    check-cast v9, Labkq;

    move/from16 v17, v10

    iget v10, v9, Labkq;->b:I

    or-int/2addr v10, v6

    iput v10, v9, Labkq;->b:I

    iput v5, v9, Labkq;->c:F

    invoke-interface {v15, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v9, v13, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_c

    invoke-virtual {v13}, Laaxk;->o()V

    :cond_c
    iget-object v9, v13, Laaxk;->b:Laaxp;

    check-cast v9, Labkq;

    iget v10, v9, Labkq;->b:I

    or-int/lit8 v10, v10, 0x2

    iput v10, v9, Labkq;->b:I

    iput v5, v9, Labkq;->d:F

    move/from16 v5, v17

    invoke-interface {v15, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v9, v13, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_d

    invoke-virtual {v13}, Laaxk;->o()V

    :cond_d
    iget-object v9, v13, Laaxk;->b:Laaxp;

    check-cast v9, Labkq;

    iget v10, v9, Labkq;->b:I

    or-int/lit8 v10, v10, 0x4

    iput v10, v9, Labkq;->b:I

    iput v5, v9, Labkq;->e:F

    const/4 v5, 0x3

    invoke-interface {v15, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v9, v13, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_e

    invoke-virtual {v13}, Laaxk;->o()V

    :cond_e
    iget-object v9, v13, Laaxk;->b:Laaxp;

    check-cast v9, Labkq;

    iget v10, v9, Labkq;->b:I

    or-int/lit8 v10, v10, 0x8

    iput v10, v9, Labkq;->b:I

    iput v5, v9, Labkq;->f:F

    move/from16 v5, v16

    invoke-interface {v15, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget-object v9, v13, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_f

    invoke-virtual {v13}, Laaxk;->o()V

    :cond_f
    iget-object v9, v13, Laaxk;->b:Laaxp;

    check-cast v9, Labkq;

    iget v10, v9, Labkq;->b:I

    or-int/lit8 v10, v10, 0x10

    iput v10, v9, Labkq;->b:I

    iput v5, v9, Labkq;->g:F

    invoke-virtual {v13}, Laaxk;->i()Laaxp;

    move-result-object v5

    check-cast v5, Labkq;

    iget-object v9, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_10

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_10
    iget-object v9, v0, Laaxk;->b:Laaxp;

    check-cast v9, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v9, Labkr;->e:Labkq;

    iget v5, v9, Labkr;->b:I

    const/16 v16, 0x4

    or-int/lit8 v5, v5, 0x4

    iput v5, v9, Labkr;->b:I

    sget-object v5, Labhi;->a:Labhi;

    invoke-virtual {v5}, Laaxp;->D()Laaxk;

    move-result-object v5

    iget-object v9, v14, Lmux;->f:Ljava/util/List;

    const/4 v10, 0x0

    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-object/from16 p2, v7

    float-to-double v6, v10

    :try_start_5
    iget-object v10, v5, Laaxk;->b:Laaxp;

    invoke-virtual {v10}, Laaxp;->T()Z

    move-result v10

    if-nez v10, :cond_11

    invoke-virtual {v5}, Laaxk;->o()V

    :cond_11
    iget-object v10, v5, Laaxk;->b:Laaxp;

    check-cast v10, Labhi;

    iput-wide v6, v10, Labhi;->b:D

    const/4 v13, 0x1

    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    float-to-double v6, v6

    iget-object v10, v5, Laaxk;->b:Laaxp;

    invoke-virtual {v10}, Laaxp;->T()Z

    move-result v10

    if-nez v10, :cond_12

    invoke-virtual {v5}, Laaxk;->o()V

    :cond_12
    iget-object v10, v5, Laaxk;->b:Laaxp;

    check-cast v10, Labhi;

    iput-wide v6, v10, Labhi;->c:D

    const/4 v6, 0x2

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v6

    float-to-double v6, v6

    iget-object v9, v5, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_13

    invoke-virtual {v5}, Laaxk;->o()V

    :cond_13
    iget-object v9, v5, Laaxk;->b:Laaxp;

    check-cast v9, Labhi;

    iput-wide v6, v9, Labhi;->d:D

    invoke-virtual {v5}, Laaxk;->i()Laaxp;

    move-result-object v5

    check-cast v5, Labhi;

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_14

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_14
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v6, Labkr;->f:Labhi;

    iget v5, v6, Labkr;->b:I

    or-int/lit8 v5, v5, 0x8

    iput v5, v6, Labkr;->b:I

    iget-object v5, v14, Lmux;->g:Laaal;

    invoke-static {v5}, Lmuy;->i(Laaal;)Labhh;

    move-result-object v5

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_15

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_15
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v6, Labkr;->g:Labhh;

    iget v5, v6, Labkr;->b:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v6, Labkr;->b:I

    iget-object v5, v14, Lmux;->h:Landroid/graphics/Rect;

    invoke-static {v5}, Lmuy;->h(Landroid/graphics/Rect;)Labcs;

    move-result-object v5

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_16

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_16
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v6, Labkr;->h:Labcs;

    iget v5, v6, Labkr;->b:I

    or-int/lit8 v5, v5, 0x20

    iput v5, v6, Labkr;->b:I

    iget-object v5, v14, Lmux;->j:Landroid/graphics/Rect;

    invoke-static {v5}, Lmuy;->h(Landroid/graphics/Rect;)Labcs;

    move-result-object v5

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_17

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_17
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v6, Labkr;->i:Labcs;

    iget v5, v6, Labkr;->b:I

    or-int/lit8 v5, v5, 0x40

    iput v5, v6, Labkr;->b:I

    iget-object v5, v14, Lmux;->i:Lzoi;

    sget-object v6, Lzua;->a:Lyeo;

    sget-object v7, Lzsq;->a:Lzsq;

    invoke-virtual {v6, v5, v7}, Lyeo;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lzsq;

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_18

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_18
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    iget v5, v5, Lzsq;->y:I

    iput v5, v6, Labkr;->j:I

    iget v5, v6, Labkr;->b:I

    or-int/lit16 v5, v5, 0x80

    iput v5, v6, Labkr;->b:I

    iget-object v5, v14, Lmux;->k:Laaal;

    invoke-static {v5}, Lmuy;->i(Laaal;)Labhh;

    move-result-object v5

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_19

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_19
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v6, Labkr;->d:Labhh;

    iget v5, v6, Labkr;->b:I

    const/16 v17, 0x2

    or-int/lit8 v5, v5, 0x2

    iput v5, v6, Labkr;->b:I

    iget-object v5, v11, Lmuy;->b:Laaal;

    invoke-static {v5}, Lmuy;->i(Laaal;)Labhh;

    move-result-object v5

    iget-object v6, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v6}, Laaxp;->T()Z

    move-result v6

    if-nez v6, :cond_1a

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_1a
    iget-object v6, v0, Laaxk;->b:Laaxp;

    check-cast v6, Labkr;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v5, v6, Labkr;->c:Labhh;

    iget v5, v6, Labkr;->b:I

    const/4 v13, 0x1

    or-int/2addr v5, v13

    iput v5, v6, Labkr;->b:I

    invoke-virtual {v0}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Labkr;

    iget-object v5, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v5

    if-nez v5, :cond_1b

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_1b
    iget-object v5, v2, Laaxk;->b:Laaxp;

    check-cast v5, Lmuo;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v0, v5, Lmuo;->h:Labkr;

    iget v0, v5, Lmuo;->b:I

    or-int/lit8 v0, v0, 0x20

    iput v0, v5, Lmuo;->b:I

    goto :goto_6

    :catchall_1
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object/from16 p2, v7

    :goto_5
    move-object v1, v0

    goto/16 :goto_a

    :cond_1c
    move-object/from16 p2, v7

    const/16 p0, 0x8

    :goto_6
    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Lmuo;

    sget-object v2, Lmut;->a:Lmut;

    invoke-virtual {v3, v0, v2}, Lcom/google/android/apps/camera/hdrplus/postprocessing/flareremoval/jni/NativeFlareRemoval;->a(Lmuo;Lmut;)Lmuu;

    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v12, :cond_1d

    :try_start_6
    invoke-interface {v12}, Luzo;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    goto :goto_7

    :catchall_3
    move-exception v0

    goto/16 :goto_c

    :cond_1d
    :goto_7
    if-eqz v11, :cond_1e

    :try_start_7
    invoke-virtual {v11}, Lmuy;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    goto :goto_8

    :catchall_4
    move-exception v0

    goto/16 :goto_f

    :cond_1e
    :goto_8
    :try_start_8
    invoke-interface {v8}, Lula;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    :try_start_9
    invoke-virtual/range {p2 .. p2}, Lulw;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    if-eqz v4, :cond_1f

    invoke-virtual {v4}, Lcom/google/googlex/gcam/YuvWriteView;->e()V

    :cond_1f
    sget-object v2, Lyvp;->a:Lyvp;

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v2

    iget-object v0, v0, Lmuu;->b:Labko;

    if-nez v0, :cond_20

    sget-object v0, Labko;->b:Labko;

    :cond_20
    new-instance v3, Laaxx;

    iget-object v4, v0, Labko;->c:Laaxv;

    sget-object v5, Labko;->a:Laaxw;

    invoke-direct {v3, v4, v5}, Laaxx;-><init>(Laaxv;Laaxw;)V

    iget-object v4, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v4}, Laaxp;->T()Z

    move-result v4

    if-nez v4, :cond_21

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_21
    iget-object v4, v2, Laaxk;->b:Laaxp;

    check-cast v4, Lyvp;

    iget-object v5, v4, Lyvp;->c:Laaxv;

    invoke-interface {v5}, Laaxv;->c()Z

    move-result v6

    if-nez v6, :cond_22

    invoke-static {v5}, Laaxp;->I(Laaxv;)Laaxv;

    move-result-object v5

    iput-object v5, v4, Lyvp;->c:Laaxv;

    :cond_22
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_23

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Labkn;

    iget-object v7, v4, Lyvp;->c:Laaxv;

    iget v6, v6, Labkn;->H:I

    invoke-interface {v7, v6}, Laaxv;->g(I)V

    goto :goto_9

    :cond_23
    iget v4, v0, Labko;->d:I

    invoke-static {v4}, La;->T(I)I

    move-result v4

    if-nez v4, :cond_24

    const/4 v4, 0x1

    :cond_24
    iget-object v5, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v5

    if-nez v5, :cond_25

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_25
    iget-object v5, v2, Laaxk;->b:Laaxp;

    move-object v6, v5

    check-cast v6, Lyvp;

    add-int/lit8 v4, v4, -0x1

    iput v4, v6, Lyvp;->d:I

    iget v4, v6, Lyvp;->b:I

    const/4 v13, 0x1

    or-int/2addr v4, v13

    iput v4, v6, Lyvp;->b:I

    iget-object v0, v0, Labko;->e:Laaxu;

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v4

    if-nez v4, :cond_26

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_26
    iget-object v4, v2, Laaxk;->b:Laaxp;

    check-cast v4, Lyvp;

    iget-object v5, v4, Lyvp;->e:Laaxu;

    invoke-interface {v5}, Laaxu;->c()Z

    move-result v6

    if-nez v6, :cond_27

    invoke-static {v5}, Laaxp;->H(Laaxu;)Laaxu;

    move-result-object v5

    iput-object v5, v4, Lyvp;->e:Laaxu;

    :cond_27
    iget-object v4, v4, Lyvp;->e:Laaxu;

    invoke-static {v0, v4}, Laawa;->e(Ljava/lang/Iterable;Ljava/util/List;)V

    invoke-static {v3}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v4, Lkwj;

    const/4 v5, 0x7

    invoke-direct {v4, v5}, Lkwj;-><init>(I)V

    invoke-interface {v0, v4}, Lj$/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v0

    invoke-static {v3}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v3

    new-instance v4, Lkwj;

    move/from16 v5, p0

    invoke-direct {v4, v5}, Lkwj;-><init>(I)V

    invoke-interface {v3, v4}, Lj$/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    move-result v3

    if-eqz v0, :cond_28

    invoke-static {v1}, Lnbw;->h(Lmnz;)V

    :cond_28
    if-eqz v3, :cond_29

    iget-object v0, v1, Lmnz;->u:Ltse;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Ltse;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Lqrg;->o()Lqri;

    move-result-object v0

    invoke-static {}, Lqel;->c()Lqed;

    move-result-object v3

    invoke-virtual {v0, v3}, Lqri;->c(Lqed;)V

    :cond_29
    iget-object v0, v1, Lmnz;->u:Ltse;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v0}, Lqrg;->t()Lrej;

    move-result-object v0

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v1

    check-cast v1, Lyvp;

    check-cast v0, Lrek;

    iput-object v1, v0, Lrek;->v:Lyvp;

    return-void

    :catchall_5
    move-exception v0

    goto :goto_13

    :catchall_6
    move-exception v0

    goto :goto_11

    :goto_a
    if-eqz v12, :cond_2a

    :try_start_a
    invoke-interface {v12}, Luzo;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    goto :goto_b

    :catchall_7
    move-exception v0

    :try_start_b
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2a
    :goto_b
    throw v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :goto_c
    move-object v1, v0

    :goto_d
    if-eqz v11, :cond_2b

    :try_start_c
    invoke-virtual {v11}, Lmuy;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    goto :goto_e

    :catchall_8
    move-exception v0

    :try_start_d
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2b
    :goto_e
    throw v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :catchall_9
    move-exception v0

    move-object/from16 p2, v7

    :goto_f
    move-object v1, v0

    :try_start_e
    invoke-interface {v8}, Lula;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_a

    goto :goto_10

    :catchall_a
    move-exception v0

    :try_start_f
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_10
    throw v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    :catchall_b
    move-exception v0

    move-object/from16 p2, v7

    :goto_11
    move-object v1, v0

    :try_start_10
    invoke-virtual/range {p2 .. p2}, Lulw;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_c

    goto :goto_12

    :catchall_c
    move-exception v0

    :try_start_11
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_12
    throw v1
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    :goto_13
    if-eqz v4, :cond_2c

    invoke-virtual {v4}, Lcom/google/googlex/gcam/YuvWriteView;->e()V

    :cond_2c
    throw v0

    :cond_2d
    sget-object v0, Lmkm;->b:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    const/16 v1, 0xc28

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lyko;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    const-string v11, "Skipping processing flare removal: (%s, %s, %s, %s)"

    invoke-interface/range {v10 .. v15}, Lyko;->H(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Lmnv;Lxwg;Lmqa;)Lxwg;
    .locals 8

    :try_start_0
    iget-object v0, p0, Lmkm;->h:Lulx;

    const-string v1, "processPrimary"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    const-string v7, "primary"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    :try_start_1
    invoke-virtual/range {v2 .. v7}, Lmkm;->b(Lmnv;Lxwg;Lmqa;ZLjava/lang/String;)Lxwg;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object p1, v2, Lmkm;->h:Lulx;

    invoke-interface {p1}, Lulx;->g()V

    return-object p0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object v2, p0

    :goto_0
    move-object p0, v0

    iget-object p1, v2, Lmkm;->h:Lulx;

    invoke-interface {p1}, Lulx;->g()V

    throw p0
.end method

.method public final b(Lmnv;Lxwg;Lmqa;ZLjava/lang/String;)Lxwg;
    .locals 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lmkm;->h:Lulx;

    const-string v3, "SKYA#DustyTome"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    const-string v3, ""

    if-eqz p4, :cond_1

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v4

    iget-object v5, v0, Lmkm;->m:Lovu;

    invoke-virtual {v5}, Lovu;->p()Z

    move-result v6

    if-eqz v6, :cond_0

    move-object v6, v4

    check-cast v6, Lmnz;

    iget-object v7, v6, Lmnz;->u:Ltse;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v7, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v7}, Lqrg;->q()Lqrt;

    move-result-object v7

    invoke-virtual {v5}, Lovu;->o()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Loph;

    iget-wide v8, v6, Lmnz;->g:J

    invoke-interface {v5, v7, v8, v9}, Loph;->i(Lqrt;J)V

    :cond_0
    check-cast v4, Lmnz;

    invoke-direct {v0, v4}, Lmkm;->g(Lmnz;)V

    iget-object v5, v0, Lmkm;->f:Lmsv;

    iget-object v6, v4, Lmnz;->d:Lcom/google/googlex/gcam/ShotMetadata;

    iget-object v7, v4, Lmnz;->u:Ltse;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v8, v4, Lmnz;->i:Lj$/util/Optional;

    move-object/from16 v9, p3

    invoke-virtual {v8, v9}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lmqa;

    iget-object v7, v7, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v5, v6, v7, v1, v8}, Lmsv;->a(Lcom/google/googlex/gcam/ShotMetadata;Lqrg;Lmnv;Lmqa;)V

    invoke-static {v4}, Lmkm;->f(Lmnz;)Lj$/util/Optional;

    move-result-object v4

    invoke-virtual {v4, v3}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    sget-object v5, Lmis;->a:Lzoa;

    invoke-static {v6, v4}, Laaaq;->M(Lcom/google/googlex/gcam/ShotMetadata;[B)V

    goto :goto_0

    :cond_1
    move-object/from16 v9, p3

    :goto_0
    iget-object v4, v0, Lmkm;->c:Lmlt;

    sget-object v5, Lmlt;->d:Lmlt;

    if-ne v4, v5, :cond_3

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lmiw;->h:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_2
    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_3
    iget-object v4, v0, Lmkm;->i:Lsql;

    sget-object v5, Lsql;->r:Lsql;

    if-ne v4, v5, :cond_4

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v5

    if-nez v5, :cond_4

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_4
    sget-object v5, Lsql;->q:Lsql;

    if-ne v4, v5, :cond_6

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_5
    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_6
    invoke-virtual {v9}, Lmqa;->a()Lmpz;

    move-result-object v4

    sget-object v5, Lmpz;->b:Lmpz;

    if-ne v4, v5, :cond_8

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v0

    if-nez v0, :cond_7

    sget-object v0, Lmiw;->f:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_7
    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_8
    invoke-virtual {v9}, Lmqa;->a()Lmpz;

    move-result-object v4

    sget-object v5, Lmpz;->c:Lmpz;

    if-ne v4, v5, :cond_a

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_9
    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_a
    invoke-virtual {v9}, Lmqa;->a()Lmpz;

    move-result-object v4

    sget-object v5, Lmpz;->d:Lmpz;

    if-ne v4, v5, :cond_c

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v0

    if-nez v0, :cond_b

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_b
    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_c
    invoke-virtual {v9}, Lmqa;->a()Lmpz;

    move-result-object v4

    sget-object v5, Lmpz;->g:Lmpz;

    if-ne v4, v5, :cond_e

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v0

    if-nez v0, :cond_d

    sget-object v0, Lmiw;->f:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_d
    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_e
    invoke-virtual {v9}, Lmqa;->a()Lmpz;

    move-result-object v4

    sget-object v5, Lmpz;->h:Lmpz;

    if-ne v4, v5, :cond_f

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v4

    if-nez v4, :cond_f

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_f
    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmnz;

    invoke-static {v4}, Lmkm;->e(Lmnz;)Lmiw;

    move-result-object v4

    invoke-static {v4}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v4

    goto :goto_1

    :cond_10
    sget-object v4, Lxuz;->a:Lxuz;

    :goto_1
    iget-object v5, v0, Lmkm;->l:Lklm;

    sget-object v6, Lkkp;->a:Lkiy;

    invoke-virtual {v5, v6}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v7

    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v9, 0x1

    if-ne v7, v9, :cond_11

    move v7, v9

    goto :goto_2

    :cond_11
    const/4 v7, 0x0

    :goto_2
    invoke-virtual {v5, v6}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v6

    invoke-virtual {v6}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v10, 0x2

    if-ne v6, v10, :cond_12

    move v6, v9

    goto :goto_3

    :cond_12
    const/4 v6, 0x0

    :goto_3
    iget-object v11, v0, Lmkm;->k:Loui;

    invoke-virtual {v11}, Luvf;->l()Luve;

    move-result-object v12

    sget-object v13, Luve;->a:Luve;

    if-nez v6, :cond_14

    if-eqz v7, :cond_13

    goto :goto_4

    :cond_13
    const/4 v14, 0x0

    goto :goto_5

    :cond_14
    :goto_4
    move v14, v9

    :goto_5
    invoke-virtual {v11}, Luvf;->l()Luve;

    move-result-object v15

    if-eq v15, v13, :cond_15

    move-object v15, v1

    check-cast v15, Lmio;

    iget-boolean v15, v15, Lmio;->j:Z

    if-eqz v15, :cond_16

    :cond_15
    sget-object v15, Lkin;->g:Lkiz;

    invoke-virtual {v5, v15}, Lklm;->q(Lkiz;)Z

    move-result v15

    if-eqz v15, :cond_16

    move-object v15, v1

    check-cast v15, Lmio;

    iget-object v15, v15, Lmio;->a:Lqsi;

    invoke-virtual {v15}, Lqsi;->b()Z

    move-result v15

    if-eqz v15, :cond_16

    move v15, v9

    goto :goto_6

    :cond_16
    const/4 v15, 0x0

    :goto_6
    sget-object v16, Lkin;->a:Lkiy;

    iget-object v10, v0, Lmkm;->r:Lrdw;

    iget-object v8, v0, Lmkm;->n:Lovu;

    invoke-virtual {v10}, Lrdw;->X()Z

    move-result v10

    invoke-virtual {v8}, Lovu;->p()Z

    move-result v17

    if-eqz v17, :cond_1b

    invoke-virtual {v8}, Lovu;->o()Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Lmmv;

    if-eqz v8, :cond_1b

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v1

    if-nez v1, :cond_17

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_17
    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    iget-object v3, v1, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v4, "FaceRetouchRgb"

    invoke-interface {v2, v4}, Lulx;->f(Ljava/lang/String;)V

    iget-object v0, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->d()I

    move-result v4

    and-int/lit8 v4, v4, -0x2

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->b()I

    move-result v5

    and-int/lit8 v5, v5, -0x2

    sget-object v6, Lzon;->b:Lzon;

    new-instance v7, Lcom/google/googlex/gcam/YuvImage;

    invoke-direct {v7, v4, v5, v6}, Lcom/google/googlex/gcam/YuvImage;-><init>(IILzon;)V

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->f()Lcom/google/googlex/gcam/InterleavedReadViewU8;

    move-result-object v4

    invoke-static {v7}, Lzos;->d(Lcom/google/googlex/gcam/YuvImage;)Lcom/google/googlex/gcam/YuvWriteView;

    move-result-object v5

    invoke-static {v4, v5, v9}, Lcom/google/googlex/gcam/image/YuvUtils;->b(Lcom/google/googlex/gcam/InterleavedReadViewU8;Lcom/google/googlex/gcam/YuvWriteView;Z)Z

    move-result v4

    if-nez v4, :cond_18

    iget-object v4, v0, Lmmz;->c:Luln;

    const-string v5, "Failed to convert RGB to YUV cropped"

    invoke-interface {v4, v5}, Luln;->b(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/google/googlex/gcam/YuvImage;->c()V

    goto :goto_7

    :cond_18
    iget-object v4, v0, Lmmz;->d:Lacbr;

    invoke-interface {v4}, Lacbr;->a()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llmj;

    iget-wide v5, v1, Lmnz;->g:J

    new-instance v8, Luwt;

    invoke-direct {v8, v7, v5, v6}, Luwt;-><init>(Lcom/google/googlex/gcam/YuvImage;J)V

    invoke-virtual {v0, v4, v1, v8}, Lmmz;->i(Llmj;Lmnz;Luzo;)V

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->g()Lcom/google/googlex/gcam/InterleavedWriteViewU8;

    move-result-object v4

    invoke-static {v7}, Lzos;->b(Lcom/google/googlex/gcam/YuvImage;)Lcom/google/googlex/gcam/YuvReadView;

    move-result-object v5

    invoke-static {v5, v4, v9}, Lcom/google/googlex/gcam/image/YuvUtils;->d(Lcom/google/googlex/gcam/YuvReadView;Lcom/google/googlex/gcam/InterleavedWriteViewU8;Z)Z

    move-result v4

    if-nez v4, :cond_19

    iget-object v4, v0, Lmmz;->c:Luln;

    const-string v5, "Failed to convert returned YUV back to RGB."

    invoke-interface {v4, v5}, Luln;->b(Ljava/lang/String;)V

    :cond_19
    invoke-virtual {v7}, Lcom/google/googlex/gcam/YuvImage;->c()V

    :goto_7
    const-string v4, "sendImageForPortraitProcessing"

    invoke-interface {v2, v4}, Lulx;->h(Ljava/lang/String;)V

    if-eqz v3, :cond_1a

    iget-object v4, v0, Lmmz;->j:Lmmu;

    iget-object v5, v0, Lmmz;->h:Lxwg;

    invoke-virtual {v5}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmms;

    new-instance v6, Lmmx;

    invoke-direct {v6, v0, v1, v3}, Lmmx;-><init>(Lmmz;Lmnz;Lcom/google/googlex/gcam/InterleavedImageU8;)V

    new-instance v0, Leuk;

    const/16 v3, 0xe

    invoke-direct {v0, v3}, Leuk;-><init>(I)V

    iget-object v1, v1, Lmnz;->u:Ltse;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x0

    move-object/from16 p3, v0

    move-object/from16 p4, v1

    move-object/from16 p5, v3

    move-object/from16 p0, v4

    move-object/from16 p1, v5

    move-object/from16 p2, v6

    invoke-virtual/range {p0 .. p5}, Lmmu;->a(Lmms;Ljava/util/function/Consumer;Ljava/lang/Runnable;Ltse;Lmqa;)V

    invoke-interface {v2}, Lulx;->g()V

    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_1a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "RGB for portrait processing unavailable"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b
    sget-object v8, Lkiq;->m:Lkiz;

    invoke-virtual {v5, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    if-nez v8, :cond_1c

    sget-object v8, Lkiq;->n:Lkiz;

    invoke-virtual {v5, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    if-eqz v8, :cond_1e

    :cond_1c
    if-eqz p4, :cond_1e

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v8

    if-nez v8, :cond_1d

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_1d
    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lmnz;

    invoke-direct {v0, v8, v11}, Lmkm;->j(Lmnz;Loui;)V

    :cond_1e
    const-string v8, "setWarpfield"

    const-string v11, "Rectiface"

    const-string v9, "applyRgb"

    if-nez v7, :cond_1f

    if-eqz v6, :cond_25

    if-ne v12, v13, :cond_25

    :cond_1f
    check-cast v1, Lmio;

    iget-boolean v1, v1, Lmio;->g:Z

    if-eqz v1, :cond_25

    iget-object v1, v0, Lmkm;->o:Lovu;

    invoke-virtual {v1}, Lovu;->p()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v1

    if-nez v1, :cond_20

    sget-object v0, Lmiw;->d:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_20
    invoke-interface {v2, v11}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    iget-object v6, v1, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v6, :cond_21

    invoke-interface {v2, v9}, Lulx;->f(Ljava/lang/String;)V

    iget-object v6, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v6, v1}, Lmmz;->c(Lmnz;)Lmnz;

    move-result-object v1

    move-object/from16 v28, v3

    goto/16 :goto_b

    :cond_21
    const-string v6, "applyRgbHw"

    invoke-interface {v2, v6}, Lulx;->f(Ljava/lang/String;)V

    iget-object v6, v1, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v11, Lmlt;->c:Lmlt;

    iget-object v12, v7, Lmmz;->e:Lacbr;

    invoke-interface {v12}, Lacbr;->a()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lxwg;

    invoke-virtual {v12}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v12

    move-object/from16 v19, v12

    check-cast v19, Lqjc;

    invoke-interface/range {v19 .. v19}, Lqjc;->a()Lqjk;

    move-result-object v24

    iget-object v12, v7, Lmmz;->k:Lklm;

    sget-object v13, Lkio;->d:Lkiz;

    invoke-virtual {v12, v13}, Lklm;->q(Lkiz;)Z

    move-result v12

    if-eqz v12, :cond_22

    new-instance v12, Lcom/google/googlex/gcam/InterleavedImageU8;

    invoke-virtual {v6}, Landroid/hardware/HardwareBuffer;->getWidth()I

    move-result v13

    invoke-virtual {v6}, Landroid/hardware/HardwareBuffer;->getHeight()I

    move-result v14

    move-object/from16 v28, v3

    const/4 v3, 0x1

    invoke-direct {v12, v13, v14, v3}, Lcom/google/googlex/gcam/InterleavedImageU8;-><init>(III)V

    goto :goto_8

    :cond_22
    move-object/from16 v28, v3

    const/4 v12, 0x0

    :goto_8
    if-nez v12, :cond_23

    const/16 v27, 0x0

    goto :goto_9

    :cond_23
    invoke-virtual {v12}, Lcom/google/googlex/gcam/InterleavedImageU8;->g()Lcom/google/googlex/gcam/InterleavedWriteViewU8;

    move-result-object v3

    move-object/from16 v27, v3

    :goto_9
    iget-object v3, v7, Lmmz;->g:Lmlt;

    if-ne v3, v11, :cond_24

    const/16 v22, 0x1

    goto :goto_a

    :cond_24
    const/16 v22, 0x0

    :goto_a
    new-instance v3, Lmmy;

    const/4 v7, 0x0

    invoke-direct {v3, v1, v7}, Lmmy;-><init>(Lmnz;I)V

    iget-object v7, v1, Lmnz;->d:Lcom/google/googlex/gcam/ShotMetadata;

    iget-object v11, v1, Lmnz;->u:Ltse;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v13, v11, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v13}, Lqrg;->B()Ljava/lang/String;

    move-result-object v23

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v13}, Lqrg;->t()Lrej;

    move-result-object v25

    move-object/from16 v26, v3

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    invoke-interface/range {v19 .. v27}, Lqjc;->b(Landroid/hardware/HardwareBuffer;Lcom/google/googlex/gcam/ShotMetadata;ZLjava/lang/String;Lqjk;Lrej;Lcom/google/android/apps/camera/rectiface/Rectiface$RectifaceCallback;Lcom/google/googlex/gcam/InterleavedWriteViewU8;)V

    move-object/from16 v3, v24

    new-instance v6, Lmny;

    invoke-direct {v6, v1}, Lmny;-><init>(Lmnz;)V

    iput-object v3, v6, Lmny;->i:Lqjk;

    iput-object v12, v6, Lmny;->h:Lcom/google/googlex/gcam/InterleavedImageU8;

    invoke-virtual {v6}, Lmny;->a()Lmnz;

    move-result-object v1

    :goto_b
    invoke-interface {v2, v8}, Lulx;->h(Ljava/lang/String;)V

    iget-object v3, v1, Lmnz;->n:Lqjk;

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v0, Lmkm;->q:Lrdw;

    move-object v7, v1

    check-cast v7, Lxwm;

    iget-object v7, v7, Lxwm;->a:Ljava/lang/Object;

    check-cast v7, Lmnz;

    iget-object v7, v7, Lmnz;->u:Ltse;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v7, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v7}, Lqrg;->q()Lqrt;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Lrdw;->U(Lqrt;Lqjk;)V

    invoke-interface {v2}, Lulx;->g()V

    invoke-interface {v2}, Lulx;->g()V

    goto/16 :goto_c

    :cond_25
    move-object/from16 v28, v3

    if-eqz v14, :cond_27

    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v1

    if-nez v1, :cond_26

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_26
    invoke-interface {v2, v11}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    iget-object v1, v1, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v9}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->c(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v3

    invoke-interface {v2, v8}, Lulx;->h(Ljava/lang/String;)V

    iget-object v1, v1, Lmnz;->n:Lqjk;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v0, Lmkm;->q:Lrdw;

    move-object v7, v3

    check-cast v7, Lxwm;

    iget-object v7, v7, Lxwm;->a:Ljava/lang/Object;

    check-cast v7, Lmnz;

    iget-object v7, v7, Lmnz;->u:Ltse;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v7, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v7}, Lqrg;->q()Lqrt;

    move-result-object v7

    invoke-virtual {v6, v7, v1}, Lrdw;->U(Lqrt;Lqjk;)V

    invoke-interface {v2}, Lulx;->g()V

    invoke-interface {v2}, Lulx;->g()V

    move-object v1, v3

    goto :goto_c

    :cond_27
    invoke-virtual/range {p2 .. p2}, Lxwg;->h()Z

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, v0, Lmkm;->q:Lrdw;

    invoke-virtual/range {p2 .. p2}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->u:Ltse;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v3, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v3}, Lqrg;->q()Lqrt;

    move-result-object v3

    const/4 v6, 0x0

    invoke-virtual {v1, v3, v6}, Lrdw;->U(Lqrt;Lqjk;)V

    :cond_28
    move-object/from16 v1, p2

    :goto_c
    sget-object v3, Lkio;->a:Lkiy;

    sget-object v3, Lkio;->d:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    if-eqz v3, :cond_31

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v3

    if-nez v3, :cond_29

    sget-object v0, Lmiw;->b:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_29
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->h:Lmnv;

    invoke-interface {v3}, Lmnv;->c()Z

    move-result v3

    if-nez v3, :cond_31

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    invoke-direct {v0, v3}, Lmkm;->i(Lmnz;)Z

    move-result v3

    if-nez v3, :cond_31

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    invoke-static {v3}, Lmkm;->h(Lmnz;)Z

    move-result v3

    if-eqz v3, :cond_31

    const-string v3, "FaceMetadata"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->b:Lcom/google/googlex/gcam/YuvImage;

    const-string v6, "applyYuv"

    if-eqz v3, :cond_2a

    invoke-interface {v2, v6}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->b(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    :goto_d
    move-object/from16 v18, v4

    move/from16 v21, v10

    goto/16 :goto_14

    :cond_2a
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v3, :cond_2b

    const-string v3, "rgbToYuv"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->e(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2, v6}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lmmz;->b(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_d

    :cond_2b
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    if-eqz v3, :cond_30

    const-string v3, "rgbHwToYuv"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lmnz;

    iget-object v8, v7, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8}, Landroid/hardware/HardwareBuffer;->getFormat()I

    move-result v11

    const/4 v12, 0x1

    if-ne v11, v12, :cond_2c

    const/4 v11, 0x1

    goto :goto_e

    :cond_2c
    const/4 v11, 0x0

    :goto_e
    const-string v12, "HardwareBuffer format unexpected."

    invoke-static {v11, v12}, Lyny;->ba(ZLjava/lang/Object;)V

    :try_start_0
    new-instance v11, Lcom/google/googlex/gcam/LockedHardwareBuffer;

    const-wide/16 v12, 0x2

    invoke-direct {v11, v8, v12, v13}, Lcom/google/googlex/gcam/LockedHardwareBuffer;-><init>(Landroid/hardware/HardwareBuffer;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    :try_start_1
    invoke-virtual {v11}, Lcom/google/googlex/gcam/LockedHardwareBuffer;->a()Lcom/google/googlex/gcam/InterleavedReadViewU8;

    move-result-object v12

    sget-object v13, Lzon;->b:Lzon;

    new-instance v14, Lcom/google/googlex/gcam/YuvImage;

    move-object/from16 p1, v1

    invoke-virtual {v12}, Lcom/google/googlex/gcam/InterleavedReadViewU8;->d()I

    move-result v1

    move-object/from16 v18, v4

    invoke-virtual {v12}, Lcom/google/googlex/gcam/InterleavedReadViewU8;->c()I

    move-result v4

    invoke-direct {v14, v1, v4, v13}, Lcom/google/googlex/gcam/YuvImage;-><init>(IILzon;)V

    invoke-static {v14}, Lzos;->d(Lcom/google/googlex/gcam/YuvImage;)Lcom/google/googlex/gcam/YuvWriteView;

    move-result-object v1

    iget-wide v12, v12, Lcom/google/googlex/gcam/InterleavedReadViewU8;->a:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move v4, v10

    move-object/from16 p2, v11

    :try_start_2
    invoke-static {v1}, Lcom/google/googlex/gcam/YuvWriteView;->c(Lcom/google/googlex/gcam/YuvWriteView;)J

    move-result-wide v10

    const-wide/16 v19, 0x0

    cmp-long v1, v12, v19

    if-eqz v1, :cond_2d

    const/4 v1, 0x1

    goto :goto_f

    :cond_2d
    const/4 v1, 0x0

    :goto_f
    move/from16 v21, v4

    const-string v4, "src view is null"

    invoke-static {v1, v4}, Lyny;->ba(ZLjava/lang/Object;)V

    cmp-long v1, v10, v19

    if-eqz v1, :cond_2e

    const/4 v1, 0x1

    goto :goto_10

    :cond_2e
    const/4 v1, 0x0

    :goto_10
    const-string v4, "dst view is null"

    invoke-static {v1, v4}, Lyny;->ba(ZLjava/lang/Object;)V

    const/4 v1, 0x0

    invoke-static {v12, v13, v10, v11, v1}, Lcom/google/googlex/gcam/image/YuvUtils;->rgbaToYuvImpl(JJZ)Z

    move-result v4

    if-nez v4, :cond_2f

    iget-object v1, v3, Lmmz;->c:Luln;

    const-string v4, "Failed to convert YUV to RGB"

    invoke-interface {v1, v4}, Luln;->b(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual/range {p2 .. p2}, Lcom/google/googlex/gcam/LockedHardwareBuffer;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    invoke-virtual {v8}, Landroid/hardware/HardwareBuffer;->close()V

    move-object/from16 v1, p1

    goto :goto_11

    :cond_2f
    :try_start_4
    invoke-virtual/range {p2 .. p2}, Lcom/google/googlex/gcam/LockedHardwareBuffer;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    invoke-virtual {v8}, Landroid/hardware/HardwareBuffer;->close()V

    new-instance v1, Lmny;

    invoke-direct {v1, v7}, Lmny;-><init>(Lmnz;)V

    invoke-virtual {v1}, Lmny;->b()V

    iput-object v14, v1, Lmny;->b:Lcom/google/googlex/gcam/YuvImage;

    invoke-virtual {v1}, Lmny;->a()Lmnz;

    move-result-object v1

    :goto_11
    invoke-interface {v2, v6}, Lulx;->h(Ljava/lang/String;)V

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->b(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_14

    :catchall_0
    move-exception v0

    goto :goto_12

    :catchall_1
    move-exception v0

    move-object/from16 p2, v11

    :goto_12
    move-object v1, v0

    :try_start_5
    invoke-virtual/range {p2 .. p2}, Lcom/google/googlex/gcam/LockedHardwareBuffer;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_13

    :catchall_2
    move-exception v0

    :try_start_6
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_13
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :catchall_3
    move-exception v0

    invoke-virtual {v8}, Landroid/hardware/HardwareBuffer;->close()V

    throw v0

    :cond_30
    move-object/from16 v18, v4

    move/from16 v21, v10

    sget-object v3, Lmkm;->b:Lykq;

    invoke-virtual {v3}, Lykh;->c()Lyld;

    move-result-object v3

    const/16 v4, 0xc2d

    invoke-interface {v3, v4}, Lyko;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmnz;

    invoke-static {v4}, Lmkm;->e(Lmnz;)Lmiw;

    move-result-object v4

    const-string v6, "couldn\'t extract face metadata on %s"

    invoke-interface {v3, v6, v4}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_14
    invoke-interface {v2}, Lulx;->g()V

    goto :goto_15

    :cond_31
    move-object/from16 v18, v4

    move/from16 v21, v10

    :goto_15
    sget-object v3, Lkki;->c:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    const-string v4, "yuvToRgb"

    if-eqz v3, :cond_36

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v3

    if-nez v3, :cond_32

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_32
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->h:Lmnv;

    invoke-interface {v3}, Lmnv;->c()Z

    move-result v3

    if-nez v3, :cond_36

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    invoke-direct {v0, v3}, Lmkm;->i(Lmnz;)Z

    move-result v3

    if-nez v3, :cond_36

    const-string v3, "PhotoUnblur"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v3, :cond_33

    invoke-interface {v2, v9}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lmnz;

    invoke-virtual {v3, v6}, Lmmz;->h(Lmnz;)V

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_16

    :cond_33
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->b:Lcom/google/googlex/gcam/YuvImage;

    if-eqz v3, :cond_34

    invoke-interface {v2, v4}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->f(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2, v9}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lmmz;->h(Lmnz;)V

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_16

    :cond_34
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    if-eqz v3, :cond_35

    const-string v3, "rgbHWtoRgb"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->d(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2, v9}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lmmz;->h(Lmnz;)V

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    :cond_35
    :goto_16
    invoke-interface {v2}, Lulx;->g()V

    :cond_36
    new-instance v3, Lkqi;

    const/16 v6, 0xd

    invoke-direct {v3, v6}, Lkqi;-><init>(I)V

    invoke-virtual {v1, v3}, Lxwg;->b(Lxvv;)Lxwg;

    move-result-object v3

    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v3, v6}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz p4, :cond_3c

    sget-object v6, Lkio;->d:Lkiz;

    invoke-virtual {v5, v6}, Lklm;->q(Lkiz;)Z

    move-result v6

    if-eqz v6, :cond_3c

    if-nez v3, :cond_3c

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v3

    if-nez v3, :cond_37

    sget-object v0, Lmiw;->c:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_37
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->h:Lmnv;

    invoke-interface {v3}, Lmnv;->c()Z

    move-result v3

    if-nez v3, :cond_3b

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    invoke-direct {v0, v3}, Lmkm;->i(Lmnz;)Z

    move-result v3

    if-nez v3, :cond_3b

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    invoke-static {v3}, Lmkm;->h(Lmnz;)Z

    move-result v3

    if-eqz v3, :cond_3b

    const-string v3, "DeepR"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->b:Lcom/google/googlex/gcam/YuvImage;

    if-eqz v3, :cond_38

    invoke-interface {v2, v4}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->f(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2, v9}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lmmz;->a(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    check-cast v1, Lxwm;

    iget-object v1, v1, Lxwm;->a:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lmnz;

    invoke-virtual {v3, v4}, Lmmz;->j(Lmnz;)V

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_17

    :cond_38
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v3, :cond_39

    invoke-interface {v2, v9}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->a(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    check-cast v1, Lxwm;

    iget-object v1, v1, Lxwm;->a:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lmnz;

    invoke-virtual {v3, v4}, Lmmz;->j(Lmnz;)V

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_17

    :cond_39
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    if-eqz v3, :cond_3a

    const-string v3, "rgbHwToRgb"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->d(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2, v9}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lmmz;->a(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    check-cast v1, Lxwm;

    iget-object v1, v1, Lxwm;->a:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lmnz;

    invoke-virtual {v3, v4}, Lmmz;->j(Lmnz;)V

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    invoke-interface {v2}, Lulx;->g()V

    :cond_3a
    :goto_17
    invoke-interface {v2}, Lulx;->g()V

    goto :goto_18

    :cond_3b
    sget-object v3, Lmkm;->b:Lykq;

    invoke-virtual {v3}, Lykh;->c()Lyld;

    move-result-object v3

    const/16 v4, 0xc2c

    invoke-interface {v3, v4}, Lyko;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lmnz;

    invoke-static {v4}, Lmkm;->e(Lmnz;)Lmiw;

    move-result-object v4

    const-string v6, "couldn\'t apply face deblur on %s"

    invoke-interface {v3, v6, v4}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_18
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    invoke-direct {v0, v3}, Lmkm;->g(Lmnz;)V

    :cond_3c
    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v3

    if-eqz v3, :cond_3d

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnz;

    iget-object v3, v3, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    if-eqz v3, :cond_3d

    const-string v3, "RgbHwToRgb"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnz;

    invoke-virtual {v3, v1}, Lmmz;->d(Lmnz;)Lmnz;

    move-result-object v1

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    :cond_3d
    if-eqz v15, :cond_41

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v3

    if-nez v3, :cond_3e

    sget-object v0, Lmiw;->b:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_3e
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lmnz;

    iget-object v4, v3, Lmnz;->c:Landroid/hardware/HardwareBuffer;

    if-nez v4, :cond_3f

    const/4 v4, 0x1

    goto :goto_19

    :cond_3f
    const/4 v4, 0x0

    :goto_19
    invoke-static {v4}, Lyny;->bl(Z)V

    iget-object v4, v3, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v4, :cond_40

    const-string v1, "FaceRetouch#rgbToYuv"

    invoke-interface {v2, v1}, Lulx;->f(Ljava/lang/String;)V

    iget-object v1, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1, v3}, Lmmz;->e(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    :cond_40
    const-string v3, "FaceRetouch#applyYuv"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v0, Lmkm;->e:Lmmz;

    move-object v4, v1

    check-cast v4, Lmnz;

    iget-object v6, v4, Lmnz;->b:Lcom/google/googlex/gcam/YuvImage;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v3, Lmmz;->d:Lacbr;

    invoke-interface {v7}, Lacbr;->a()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Llmj;

    new-instance v8, Luwt;

    iget-wide v9, v4, Lmnz;->g:J

    invoke-direct {v8, v6, v9, v10}, Luwt;-><init>(Lcom/google/googlex/gcam/YuvImage;J)V

    invoke-virtual {v3, v7, v4, v8}, Lmmz;->i(Llmj;Lmnz;Luzo;)V

    invoke-interface {v2}, Lulx;->g()V

    invoke-static {v1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v1

    :cond_41
    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v3

    if-nez v3, :cond_42

    if-eqz v21, :cond_42

    sget-object v0, Lmiw;->b:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_42
    sget-object v3, Lkjq;->bJ:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    const/high16 v4, -0x40800000    # -1.0f

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sget-object v6, Lkjq;->q:Lkiy;

    invoke-virtual {v5, v6}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v6

    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v7

    if-nez v7, :cond_43

    sget-object v0, Lmiw;->b:Lmiw;

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    goto/16 :goto_1c

    :cond_43
    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lmnz;

    iget-object v8, v7, Lmnz;->u:Ltse;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v8, v8, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v8}, Lqrg;->al()Z

    move-result v8

    if-eqz v8, :cond_44

    iget-object v8, v7, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v8, :cond_44

    const-string v1, "RgbToYuv"

    invoke-interface {v2, v1}, Lulx;->f(Ljava/lang/String;)V

    iget-object v1, v0, Lmkm;->e:Lmmz;

    invoke-virtual {v1, v7}, Lmmz;->e(Lmnz;)Lmnz;

    move-result-object v1

    invoke-interface {v2}, Lulx;->g()V

    :cond_44
    check-cast v1, Lmnz;

    iget-object v7, v1, Lmnz;->e:Lcom/google/googlex/gcam/JpgEncoderMetadata;

    if-eqz v7, :cond_48

    sget-object v8, Lkjq;->p:Lkiy;

    invoke-virtual {v5, v8}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v8

    invoke-virtual {v8}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-nez v8, :cond_45

    sget-object v8, Lznr;->b:Lznr;

    invoke-virtual {v7, v8}, Lcom/google/googlex/gcam/JpgEncoderMetadata;->b(Lznr;)V

    goto :goto_1a

    :cond_45
    const/4 v12, 0x1

    if-ne v8, v12, :cond_46

    sget-object v8, Lznr;->c:Lznr;

    invoke-virtual {v7, v8}, Lcom/google/googlex/gcam/JpgEncoderMetadata;->b(Lznr;)V

    goto :goto_1a

    :cond_46
    const/4 v9, 0x2

    if-ne v8, v9, :cond_47

    sget-object v8, Lznr;->d:Lznr;

    invoke-virtual {v7, v8}, Lcom/google/googlex/gcam/JpgEncoderMetadata;->b(Lznr;)V

    goto :goto_1a

    :cond_47
    sget-object v8, Lznr;->a:Lznr;

    invoke-virtual {v7, v8}, Lcom/google/googlex/gcam/JpgEncoderMetadata;->b(Lznr;)V

    :cond_48
    :goto_1a
    if-eqz p4, :cond_4e

    const-string v7, "JpegCompression"

    invoke-interface {v2, v7}, Lulx;->f(Ljava/lang/String;)V

    iget-object v7, v1, Lmnz;->b:Lcom/google/googlex/gcam/YuvImage;

    if-eqz v7, :cond_4c

    iget-object v0, v0, Lmkm;->p:Lrdw;

    invoke-static {}, Lmly;->a()Lmho;

    move-result-object v7

    invoke-virtual/range {v18 .. v18}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lmiw;

    invoke-virtual {v8}, Lmiw;->ordinal()I

    move-result v8

    const/4 v12, 0x1

    if-eq v8, v12, :cond_4b

    const/4 v9, 0x2

    if-eq v8, v9, :cond_4a

    const/4 v9, 0x3

    if-eq v8, v9, :cond_49

    move-object/from16 v8, v28

    goto :goto_1b

    :cond_49
    const-string v8, "h"

    goto :goto_1b

    :cond_4a
    const-string v8, "r"

    goto :goto_1b

    :cond_4b
    const-string v8, "y"

    :goto_1b
    iput-object v8, v7, Lmho;->a:Ljava/lang/String;

    invoke-virtual {v7, v3}, Lmho;->b(F)V

    sget-object v3, Lkjq;->bK:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    invoke-virtual {v3, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v7, v3}, Lmho;->d(F)V

    sget-object v3, Lkjq;->bL:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    invoke-virtual {v3, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v7, v3}, Lmho;->c(F)V

    invoke-virtual {v7, v6}, Lmho;->e(I)V

    iget-object v3, v1, Lmnz;->p:Lj$/util/Optional;

    invoke-virtual {v7, v3}, Lmho;->j(Lj$/util/Optional;)V

    iget-object v3, v1, Lmnz;->q:Lj$/util/Optional;

    invoke-virtual {v7, v3}, Lmho;->g(Lj$/util/Optional;)V

    iget-object v3, v1, Lmnz;->r:Lj$/util/Optional;

    invoke-virtual {v7, v3}, Lmho;->f(Lj$/util/Optional;)V

    invoke-virtual {v7}, Lmho;->a()Lmly;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lrdw;->P(Lmnz;Lmly;)V

    invoke-interface {v2}, Lulx;->g()V

    sget-object v0, Lxuz;->a:Lxuz;

    goto/16 :goto_1c

    :cond_4c
    iget-object v7, v1, Lmnz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    if-eqz v7, :cond_4d

    iget-object v0, v0, Lmkm;->p:Lrdw;

    invoke-static {}, Lmly;->a()Lmho;

    move-result-object v7

    invoke-virtual {v7, v3}, Lmho;->b(F)V

    sget-object v3, Lkjq;->bK:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    invoke-virtual {v3, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v7, v3}, Lmho;->d(F)V

    sget-object v3, Lkjq;->bL:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    invoke-virtual {v3, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v7, v3}, Lmho;->c(F)V

    invoke-virtual {v7, v6}, Lmho;->e(I)V

    iget-object v3, v1, Lmnz;->p:Lj$/util/Optional;

    invoke-virtual {v7, v3}, Lmho;->j(Lj$/util/Optional;)V

    iget-object v3, v1, Lmnz;->q:Lj$/util/Optional;

    invoke-virtual {v7, v3}, Lmho;->g(Lj$/util/Optional;)V

    iget-object v3, v1, Lmnz;->r:Lj$/util/Optional;

    invoke-virtual {v7, v3}, Lmho;->f(Lj$/util/Optional;)V

    invoke-virtual {v7}, Lmho;->a()Lmly;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lrdw;->P(Lmnz;Lmly;)V

    invoke-interface {v2}, Lulx;->g()V

    sget-object v0, Lxuz;->a:Lxuz;

    goto :goto_1c

    :cond_4d
    invoke-interface {v2}, Lulx;->g()V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Requested JPEG and still got uncompressed callback."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4e
    const-string v3, "SaveSecondaryImage"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v0, v0, Lmkm;->p:Lrdw;

    invoke-static {}, Lmly;->a()Lmho;

    move-result-object v3

    const/4 v12, 0x1

    invoke-virtual {v3, v12}, Lmho;->h(Z)V

    move-object/from16 v4, p5

    iput-object v4, v3, Lmho;->b:Ljava/lang/String;

    iget-object v4, v1, Lmnz;->p:Lj$/util/Optional;

    invoke-virtual {v3, v4}, Lmho;->j(Lj$/util/Optional;)V

    iget-object v4, v1, Lmnz;->q:Lj$/util/Optional;

    invoke-virtual {v3, v4}, Lmho;->g(Lj$/util/Optional;)V

    iget-object v4, v1, Lmnz;->r:Lj$/util/Optional;

    invoke-virtual {v3, v4}, Lmho;->f(Lj$/util/Optional;)V

    invoke-virtual {v3}, Lmho;->a()Lmly;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lrdw;->P(Lmnz;Lmly;)V

    invoke-interface {v2}, Lulx;->g()V

    sget-object v0, Lxuz;->a:Lxuz;

    :goto_1c
    invoke-interface {v2}, Lulx;->g()V

    return-object v0
.end method

.method public final c(Lmnv;Lmnz;Ljava/lang/String;)V
    .locals 7

    new-instance v0, Lfh;

    const/16 v5, 0x12

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Lfh;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I[C)V

    iget-object p0, v1, Lmkm;->h:Lulx;

    const-string p1, "processSecondary"

    invoke-interface {p0, p1, v0}, Lulx;->e(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d(Ljava/lang/String;)Z
    .locals 0

    iget-object p0, p0, Lmkm;->g:Lyeo;

    invoke-virtual {p0, p1}, Lyeo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpsy;->b:Lpsy;

    invoke-static {p0, p1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
