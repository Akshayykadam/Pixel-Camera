.class public final Lmjy;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laccc;


# instance fields
.field private final a:Laccg;

.field private final b:Laccg;

.field private final c:Laccg;

.field private final d:Laccg;

.field private final e:Laccg;

.field private final f:Laccg;

.field private final g:Laccg;

.field private final h:Laccg;

.field private final i:Laccg;

.field private final j:Laccg;

.field private final k:Laccg;


# direct methods
.method public constructor <init>(Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmjy;->a:Laccg;

    iput-object p2, p0, Lmjy;->b:Laccg;

    iput-object p3, p0, Lmjy;->c:Laccg;

    iput-object p4, p0, Lmjy;->d:Laccg;

    iput-object p5, p0, Lmjy;->e:Laccg;

    iput-object p6, p0, Lmjy;->f:Laccg;

    iput-object p7, p0, Lmjy;->g:Laccg;

    iput-object p8, p0, Lmjy;->h:Laccg;

    iput-object p9, p0, Lmjy;->i:Laccg;

    iput-object p10, p0, Lmjy;->j:Laccg;

    iput-object p11, p0, Lmjy;->k:Laccg;

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 37

    move-object/from16 v0, p0

    iget-object v1, v0, Lmjy;->a:Laccg;

    check-cast v1, Lssp;

    invoke-virtual {v1}, Lssp;->b()Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v2, v0, Lmjy;->b:Laccg;

    check-cast v2, Lukj;

    invoke-virtual {v2}, Lukj;->b()Luut;

    move-result-object v2

    iget-object v3, v0, Lmjy;->c:Laccg;

    invoke-interface {v3}, Laccg;->a()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lovu;

    iget-object v4, v0, Lmjy;->d:Laccg;

    check-cast v4, Lacci;

    invoke-virtual {v4}, Lacci;->b()Ljava/util/Set;

    move-result-object v4

    iget-object v5, v0, Lmjy;->e:Laccg;

    invoke-interface {v5}, Laccg;->a()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lulx;

    iget-object v6, v0, Lmjy;->f:Laccg;

    invoke-interface {v6}, Laccg;->a()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lklm;

    iget-object v7, v0, Lmjy;->g:Laccg;

    check-cast v7, Lkuk;

    invoke-virtual {v7}, Lkuk;->b()Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    iget-object v8, v0, Lmjy;->h:Laccg;

    check-cast v8, Lkuk;

    invoke-virtual {v8}, Lkuk;->b()Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    iget-object v9, v0, Lmjy;->i:Laccg;

    invoke-interface {v9}, Laccg;->a()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lnoe;

    iget-object v10, v0, Lmjy;->j:Laccg;

    invoke-interface {v10}, Laccg;->a()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lkxm;

    iget-object v0, v0, Lmjy;->k:Laccg;

    check-cast v0, Linh;

    invoke-virtual {v0}, Linh;->b()Lj$/util/Optional;

    move-result-object v11

    const-string v0, "Gcam#provide"

    invoke-interface {v5, v0}, Lulx;->f(Ljava/lang/String;)V

    sget-object v0, Lzor;->a:Lzor;

    sget-object v12, Lkjq;->a:Lkiy;

    const/4 v12, 0x0

    iput-boolean v12, v0, Lzor;->b:Z

    invoke-static {}, Lcom/google/googlex/gcam/hdrplus/HalideRuntime;->checkGcamHalideRuntime()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lmjt;->a:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v13, 0xc11

    invoke-interface {v0, v13}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v13, "HalideRuntime.checkGcamHalideRuntime -> Failed"

    invoke-interface {v0, v13}, Lyko;->s(Ljava/lang/String;)V

    :cond_0
    sget-object v0, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusAndroidInterface;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v13, 0x1

    invoke-virtual {v0, v13}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusAndroidInterface;->staticInitializeNative()V

    :cond_1
    sget-object v0, Lkjq;->F:Lkiy;

    invoke-virtual {v6, v0}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v0

    const/4 v14, -0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v0, v14}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusAndroidInterface;->setMakernoteThumbnailSizeOverride(I)V

    new-instance v14, Lcom/google/googlex/gcam/StaticMetadataVector;

    invoke-direct {v14}, Lcom/google/googlex/gcam/StaticMetadataVector;-><init>()V

    const/4 v15, 0x2

    move/from16 p0, v13

    new-array v13, v15, [Luve;

    sget-object v0, Luve;->b:Luve;

    aput-object v0, v13, v12

    sget-object v0, Luve;->a:Luve;

    aput-object v0, v13, p0

    :goto_0
    const-wide/16 v20, 0x0

    move-object/from16 v22, v5

    if-ge v12, v15, :cond_1f

    aget-object v0, v13, v12

    invoke-interface {v2, v0}, Luut;->h(Luve;)Ljava/util/List;

    move-result-object v0

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_2
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v5, v19

    check-cast v5, Luuv;

    if-eqz v5, :cond_2

    move/from16 v19, v7

    iget-object v7, v5, Luuv;->a:Ljava/lang/String;

    if-eqz v7, :cond_5

    invoke-interface {v2, v5}, Luut;->a(Luuv;)Luus;

    move-result-object v5

    invoke-static {v5}, Lmjt;->b(Luus;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-static {v5}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->C(Luus;)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v7

    move-object/from16 v24, v5

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v5}, Lcom/google/googlex/gcam/StaticMetadata;->q(Ljava/lang/String;)V

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v7, v5}, Lcom/google/googlex/gcam/StaticMetadata;->r(Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    invoke-virtual {v14, v7}, Lcom/google/googlex/gcam/StaticMetadataVector;->c(Lcom/google/googlex/gcam/StaticMetadata;)V

    goto :goto_2

    :cond_3
    move-object/from16 v24, v5

    :goto_2
    move-object/from16 v5, v24

    check-cast v5, Luur;

    iget-object v5, v5, Luur;->b:Lyfm;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Luuv;

    invoke-interface {v0, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_4

    invoke-interface {v15, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_4

    invoke-interface {v15, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_5
    move/from16 v7, v19

    goto :goto_1

    :cond_6
    move/from16 v19, v7

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v5

    const/4 v7, 0x0

    :goto_4
    if-ge v7, v5, :cond_1e

    invoke-interface {v15, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luuv;

    invoke-interface {v2, v0}, Luut;->a(Luuv;)Luus;

    move-result-object v0

    invoke-static {v0}, Lmjt;->b(Luus;)Z

    move-result v18

    if-nez v18, :cond_7

    move-object/from16 v25, v1

    move-object/from16 v18, v2

    move/from16 v24, v5

    move/from16 v26, v7

    move/from16 v27, v8

    move/from16 v29, v12

    move-object/from16 v28, v13

    move-object/from16 v30, v15

    const/4 v8, 0x2

    goto/16 :goto_14

    :cond_7
    move-object/from16 v18, v2

    invoke-static {v0}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->C(Luus;)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v2

    move/from16 v24, v5

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/google/googlex/gcam/StaticMetadata;->q(Ljava/lang/String;)V

    iget-object v5, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Lcom/google/googlex/gcam/StaticMetadata;->r(Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    invoke-virtual {v14, v2}, Lcom/google/googlex/gcam/StaticMetadataVector;->c(Lcom/google/googlex/gcam/StaticMetadata;)V

    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v5

    move-object/from16 v25, v1

    sget-object v1, Lzoi;->n:Lzoi;

    if-ne v5, v1, :cond_a

    sget-object v5, Lkjq;->bO:Lkiz;

    invoke-virtual {v6, v5}, Lklm;->x(Lkiz;)Z

    move-result v5

    if-eqz v5, :cond_a

    new-instance v5, Lcom/google/googlex/gcam/StaticMetadata;

    invoke-direct {v5, v2}, Lcom/google/googlex/gcam/StaticMetadata;-><init>(Lcom/google/googlex/gcam/StaticMetadata;)V

    move/from16 v26, v7

    invoke-interface {v0}, Luus;->u()Ljava/util/List;

    move-result-object v7

    move/from16 v27, v8

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sget-object v8, Lkjl;->ae:Lkiz;

    invoke-virtual {v6, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    if-eqz v8, :cond_8

    const/high16 v8, 0x40600000    # 3.5f

    cmpg-float v8, v7, v8

    if-gez v8, :cond_8

    sget-object v7, Lkhw;->c:Lkiy;

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

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sget-object v8, Lzoi;->j:Lzoi;

    :goto_5
    move/from16 v29, v12

    move-object/from16 v28, v13

    move-object/from16 v30, v15

    goto :goto_6

    :cond_9
    sget-object v7, Lkhw;->d:Lkiy;

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

    invoke-virtual {v7, v8}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sget-object v8, Lzoi;->c:Lzoi;

    :goto_6
    invoke-static {v8, v5, v7, v0, v6}, Lmjt;->d(Lzoi;Lcom/google/googlex/gcam/StaticMetadata;ILuus;Lklm;)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    invoke-virtual {v14, v5}, Lcom/google/googlex/gcam/StaticMetadataVector;->c(Lcom/google/googlex/gcam/StaticMetadata;)V

    goto :goto_7

    :cond_a
    move/from16 v26, v7

    move/from16 v27, v8

    move/from16 v29, v12

    move-object/from16 v28, v13

    move-object/from16 v30, v15

    :goto_7
    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v5

    if-ne v5, v1, :cond_b

    sget-object v5, Lkkn;->aW:Lkiz;

    invoke-virtual {v6, v5}, Lklm;->x(Lkiz;)Z

    move-result v5

    goto :goto_8

    :cond_b
    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v5

    sget-object v7, Lzoi;->b:Lzoi;

    if-ne v5, v7, :cond_f

    sget-object v5, Lkkn;->au:Lkiz;

    invoke-virtual {v6, v5}, Lklm;->q(Lkiz;)Z

    move-result v5

    :goto_8
    if-eqz v5, :cond_f

    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v5

    if-ne v5, v1, :cond_c

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

    goto :goto_9

    :cond_c
    sget-object v5, Lkhw;->e:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    if-nez v7, :cond_c_has_val

    goto :cond_f

    :cond_c_has_val
    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    :goto_9
    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v7

    if-ne v7, v1, :cond_d

    sget-object v1, Lzoi;->r:Lzoi;

    goto :goto_a

    :cond_d
    sget-object v1, Lzoi;->h:Lzoi;

    :goto_a
    invoke-static {v1, v2, v5, v0, v6}, Lmjt;->d(Lzoi;Lcom/google/googlex/gcam/StaticMetadata;ILuus;Lklm;)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v1

    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v5

    sget-object v7, Lzoi;->b:Lzoi;

    if-ne v5, v7, :cond_e

    sget-object v5, Lkhw;->d:Lkiy;

    invoke-virtual {v6, v5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    if-nez v7, :cond_d_has_val

    goto :cond_e

    :cond_d_has_val
    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/google/googlex/gcam/StaticMetadata;->m(I)V

    invoke-virtual {v1}, Lcom/google/googlex/gcam/StaticMetadata;->f()Lcom/google/googlex/gcam/PixelRect;

    move-result-object v7

    invoke-virtual {v7, v5}, Lcom/google/googlex/gcam/PixelRect;->j(I)V

    invoke-virtual {v1, v5}, Lcom/google/googlex/gcam/StaticMetadata;->t(I)V

    :cond_e
    invoke-virtual {v1}, Lcom/google/googlex/gcam/StaticMetadata;->b()F

    move-result v5

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v5, v7

    invoke-virtual {v1, v5}, Lcom/google/googlex/gcam/StaticMetadata;->w(F)V

    invoke-virtual {v1}, Lcom/google/googlex/gcam/StaticMetadata;->a()F

    move-result v5

    div-float/2addr v5, v7

    invoke-virtual {v1, v5}, Lcom/google/googlex/gcam/StaticMetadata;->v(F)V

    invoke-virtual {v1}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    invoke-virtual {v14, v1}, Lcom/google/googlex/gcam/StaticMetadataVector;->c(Lcom/google/googlex/gcam/StaticMetadata;)V

    :cond_f
    invoke-static {v2, v6, v9}, Lmjt;->f(Lcom/google/googlex/gcam/StaticMetadata;Lklm;Lnoe;)Lzoi;

    move-result-object v1

    sget-object v5, Lzoi;->a:Lzoi;

    if-eq v1, v5, :cond_1c

    new-instance v5, Lcom/google/googlex/gcam/StaticMetadata;

    invoke-direct {v5, v2}, Lcom/google/googlex/gcam/StaticMetadata;-><init>(Lcom/google/googlex/gcam/StaticMetadata;)V

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->u(Lzoi;)V

    invoke-virtual {v2}, Lcom/google/googlex/gcam/StaticMetadata;->d()Lzmz;

    move-result-object v1

    iget v1, v1, Lzmz;->k:I

    invoke-static {v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->StandardToQuadBayerPattern(I)I

    move-result v1

    invoke-static {v1}, Lzmz;->a(I)Lzmz;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->j(Lzmz;)V

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PIXEL_ARRAY_SIZE_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v1}, Luus;->o(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->t(I)V

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->s(I)V

    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_PRE_CORRECTION_ACTIVE_ARRAY_SIZE_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v0, v7}, Luus;->o(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Rect;

    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->f()Lcom/google/googlex/gcam/PixelRect;

    move-result-object v8

    iget v12, v7, Landroid/graphics/Rect;->left:I

    invoke-virtual {v8, v12}, Lcom/google/googlex/gcam/PixelRect;->i(I)V

    iget v12, v7, Landroid/graphics/Rect;->right:I

    invoke-virtual {v8, v12}, Lcom/google/googlex/gcam/PixelRect;->j(I)V

    iget v12, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v8, v12}, Lcom/google/googlex/gcam/PixelRect;->k(I)V

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v8, v7}, Lcom/google/googlex/gcam/PixelRect;->l(I)V

    invoke-virtual {v5, v8}, Lcom/google/googlex/gcam/StaticMetadata;->i(Lcom/google/googlex/gcam/PixelRect;)V

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->m(I)V

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->l(I)V

    invoke-virtual {v9}, Lnoe;->g()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v1

    sget-object v7, Lzoi;->l:Lzoi;

    if-eq v1, v7, :cond_12

    :cond_10
    invoke-static {v6}, Lmjt;->e(Lklm;)Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v1

    sget-object v7, Lzoi;->e:Lzoi;

    if-eq v1, v7, :cond_12

    :cond_11
    invoke-virtual {v9}, Lnoe;->h()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v1

    sget-object v7, Lzoi;->q:Lzoi;

    if-ne v1, v7, :cond_13

    :cond_12
    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->b()F

    move-result v1

    add-float/2addr v1, v1

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->w(F)V

    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->a()F

    move-result v1

    add-float/2addr v1, v1

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->v(F)V

    :cond_13
    invoke-static {v0}, Lzsn;->h(Luus;)Landroid/util/Range;

    move-result-object v1

    if-eqz v1, :cond_14

    new-instance v7, Lcom/google/googlex/gcam/FloatArray2;

    invoke-direct {v7}, Lcom/google/googlex/gcam/FloatArray2;-><init>()V

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    const/4 v15, 0x0

    invoke-virtual {v7, v15, v8}, Lcom/google/googlex/gcam/FloatArray2;->c(IF)V

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    move/from16 v12, p0

    invoke-virtual {v7, v12, v8}, Lcom/google/googlex/gcam/FloatArray2;->c(IF)V

    invoke-virtual {v5, v7}, Lcom/google/googlex/gcam/StaticMetadata;->o(Lcom/google/googlex/gcam/FloatArray2;)V

    invoke-virtual {v1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->p(F)V

    :cond_14
    sget-object v1, Ltds;->D:Landroid/hardware/camera2/CameraCharacteristics$Key;

    if-eqz v1, :cond_1b

    invoke-interface {v0, v1}, Luus;->m(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    if-eqz v0, :cond_1b

    array-length v1, v0

    if-lez v1, :cond_1b

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    :try_start_0
    new-instance v1, Labxf;

    const/4 v7, 0x0

    invoke-direct {v1, v7}, Labxf;-><init>([B)V

    sget-object v7, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v7

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v1, v7, v0}, Labxf;->i(ILjava/nio/ByteBuffer;)V

    const/4 v0, 0x0

    :goto_b
    const/4 v7, 0x4

    invoke-virtual {v1, v7}, Labxf;->f(I)I

    move-result v8

    if-eqz v8, :cond_15

    invoke-virtual {v1, v8}, Labxf;->h(I)I

    move-result v8

    goto :goto_c

    :cond_15
    const/4 v8, 0x0

    :goto_c
    if-ge v0, v8, :cond_1b

    new-instance v8, Labxf;

    const/4 v12, 0x0

    invoke-direct {v8, v12}, Labxf;-><init>([B)V

    invoke-virtual {v1, v7}, Labxf;->f(I)I

    move-result v12

    if-eqz v12, :cond_16

    invoke-virtual {v1, v12}, Labxf;->g(I)I

    move-result v12

    mul-int/lit8 v13, v0, 0x4

    add-int/2addr v12, v13

    invoke-virtual {v1, v12}, Labxf;->d(I)I

    move-result v12

    iget-object v13, v1, Labxf;->d:Ljava/lang/Object;

    check-cast v13, Ljava/nio/ByteBuffer;

    invoke-virtual {v8, v12, v13}, Labxf;->i(ILjava/nio/ByteBuffer;)V

    goto :goto_d

    :cond_16
    const/4 v8, 0x0

    :goto_d
    if-eqz v8, :cond_1a

    invoke-virtual {v8}, Labxf;->N()Labxf;

    move-result-object v12

    if-eqz v12, :cond_1a

    invoke-virtual {v8}, Labxf;->N()Labxf;

    move-result-object v12

    const/16 v13, 0xa

    invoke-virtual {v12, v13}, Labxf;->f(I)I

    move-result v13

    if-eqz v13, :cond_1a

    iget-object v15, v12, Labxf;->d:Ljava/lang/Object;

    iget v12, v12, Labxf;->b:I

    add-int/2addr v13, v12

    check-cast v15, Ljava/nio/ByteBuffer;

    invoke-virtual {v15, v13}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v12

    if-eqz v12, :cond_1a

    new-instance v12, Labxf;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Labxf;-><init>([B)V

    const/4 v15, 0x6

    invoke-virtual {v8, v15}, Labxf;->f(I)I

    move-result v23

    if-eqz v23, :cond_17

    iget v13, v8, Labxf;->b:I

    add-int v13, v23, v13

    invoke-virtual {v8, v13}, Labxf;->d(I)I

    move-result v13

    iget-object v8, v8, Labxf;->d:Ljava/lang/Object;

    check-cast v8, Ljava/nio/ByteBuffer;

    invoke-virtual {v12, v13, v8}, Labxf;->i(ILjava/nio/ByteBuffer;)V

    goto :goto_e

    :cond_17
    const/4 v12, 0x0

    :goto_e
    if-eqz v12, :cond_1a

    invoke-virtual {v12, v7}, Labxf;->f(I)I

    move-result v0

    if-eqz v0, :cond_18

    iget-object v1, v12, Labxf;->d:Ljava/lang/Object;

    iget v7, v12, Labxf;->b:I

    add-int/2addr v0, v7

    check-cast v1, Ljava/nio/ByteBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v0

    goto :goto_f

    :cond_18
    move-wide/from16 v0, v20

    :goto_f
    invoke-virtual {v12, v15}, Labxf;->f(I)I

    move-result v7

    if-eqz v7, :cond_19

    iget-object v8, v12, Labxf;->d:Ljava/lang/Object;

    iget v12, v12, Labxf;->b:I

    add-int/2addr v7, v12

    check-cast v8, Ljava/nio/ByteBuffer;

    invoke-virtual {v8, v7}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v7
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_10

    :cond_19
    move-wide/from16 v7, v20

    :goto_10
    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    long-to-float v7, v7

    div-float/2addr v7, v1

    const/4 v8, 0x2

    :try_start_1
    new-array v1, v8, [F

    const/16 v16, 0x0

    aput v0, v1, v16

    const/4 v12, 0x1

    aput v7, v1, v12

    invoke-virtual {v5, v1}, Lcom/google/googlex/gcam/StaticMetadata;->k([F)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_12

    :catch_0
    move-exception v0

    goto :goto_11

    :cond_1a
    const/4 v8, 0x2

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_b

    :catch_1
    move-exception v0

    const/4 v8, 0x2

    :goto_11
    sget-object v1, Lzsn;->a:Ljava/lang/String;

    const-string v7, "Failed to parse SensorModeExposureTimeRanges."

    invoke-static {v1, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_12

    :cond_1b
    const/4 v8, 0x2

    :goto_12
    invoke-virtual {v5}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    invoke-virtual {v14, v5}, Lcom/google/googlex/gcam/StaticMetadataVector;->c(Lcom/google/googlex/gcam/StaticMetadata;)V

    goto :goto_13

    :cond_1c
    const/4 v8, 0x2

    :goto_13
    invoke-static {v2, v6, v10}, Lmjt;->c(Lcom/google/googlex/gcam/StaticMetadata;Lklm;Lkxm;)Lzoi;

    move-result-object v0

    sget-object v1, Lzoi;->a:Lzoi;

    if-eq v0, v1, :cond_1d

    new-instance v1, Lcom/google/googlex/gcam/StaticMetadata;

    invoke-direct {v1, v2}, Lcom/google/googlex/gcam/StaticMetadata;-><init>(Lcom/google/googlex/gcam/StaticMetadata;)V

    invoke-virtual {v1, v0}, Lcom/google/googlex/gcam/StaticMetadata;->u(Lzoi;)V

    const/16 v0, 0xfff

    invoke-virtual {v1, v0}, Lcom/google/googlex/gcam/StaticMetadata;->x(I)V

    invoke-virtual {v1}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    invoke-virtual {v14, v1}, Lcom/google/googlex/gcam/StaticMetadataVector;->c(Lcom/google/googlex/gcam/StaticMetadata;)V

    :cond_1d
    :goto_14
    add-int/lit8 v7, v26, 0x1

    move-object/from16 v2, v18

    move/from16 v5, v24

    move-object/from16 v1, v25

    move/from16 v8, v27

    move-object/from16 v13, v28

    move/from16 v12, v29

    move-object/from16 v15, v30

    const/16 p0, 0x1

    goto/16 :goto_4

    :cond_1e
    move-object/from16 v25, v1

    move-object/from16 v18, v2

    move/from16 v27, v8

    move/from16 v29, v12

    move-object/from16 v28, v13

    const/4 v8, 0x2

    add-int/lit8 v12, v29, 0x1

    move v15, v8

    move/from16 v7, v19

    move-object/from16 v5, v22

    move/from16 v8, v27

    const/16 p0, 0x1

    goto/16 :goto_0

    :cond_1f
    move/from16 v19, v7

    move/from16 v27, v8

    const/4 v0, 0x0

    :goto_15
    invoke-virtual {v14}, Lcom/google/googlex/gcam/StaticMetadataVector;->a()J

    move-result-wide v1

    int-to-long v7, v0

    cmp-long v1, v7, v1

    if-gez v1, :cond_20

    invoke-virtual {v14, v0}, Lcom/google/googlex/gcam/StaticMetadataVector;->b(I)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v1

    iget-wide v7, v1, Lcom/google/googlex/gcam/StaticMetadata;->a:J

    const/4 v15, 0x0

    invoke-static {v7, v8, v1, v15}, Lcom/google/googlex/gcam/GcamModuleJNI;->StaticMetadata_use_driver_clut_weights_set(JLcom/google/googlex/gcam/StaticMetadata;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    :cond_20
    const/4 v15, 0x0

    iget-object v0, v3, Lovu;->a:Ljava/lang/Object;

    new-instance v1, Lcom/google/googlex/gcam/FloatArray2;

    invoke-direct {v1}, Lcom/google/googlex/gcam/FloatArray2;-><init>()V

    sget-object v2, Lzns;->b:Lzns;

    invoke-static {v14, v2}, Lmjt;->a(Lcom/google/googlex/gcam/StaticMetadataVector;Lzns;)F

    move-result v2

    invoke-virtual {v1, v15, v2}, Lcom/google/googlex/gcam/FloatArray2;->c(IF)V

    sget-object v2, Lzns;->c:Lzns;

    invoke-static {v14, v2}, Lmjt;->a(Lcom/google/googlex/gcam/StaticMetadataVector;Lzns;)F

    move-result v2

    const/4 v12, 0x1

    invoke-virtual {v1, v12, v2}, Lcom/google/googlex/gcam/FloatArray2;->c(IF)V

    move-object v2, v0

    check-cast v2, Lcom/google/googlex/gcam/InitParams;

    iget-wide v7, v2, Lcom/google/googlex/gcam/InitParams;->a:J

    iget-wide v9, v1, Lcom/google/googlex/gcam/FloatArray2;->a:J

    move-object/from16 v36, v1

    move-object/from16 v33, v2

    move-wide/from16 v31, v7

    move-wide/from16 v34, v9

    invoke-static/range {v31 .. v36}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_reference_focal_length_35mm_set(JLcom/google/googlex/gcam/InitParams;JLcom/google/googlex/gcam/FloatArray2;)V

    move-object/from16 v1, v33

    sget-object v2, Lkjq;->aD:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    iget-wide v7, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v7, v8, v1, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_portrait_brightening_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    sget-object v2, Lkjq;->aF:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_21

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    const/4 v12, 0x1

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_pecan_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    goto :goto_16

    :cond_21
    const/4 v12, 0x1

    :goto_16
    sget-object v2, Lkjq;->aK:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_22

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_pecan_light_model_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_22
    sget-object v2, Lkjq;->aG:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_23

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_pecan_pie_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_23
    if-eqz v19, :cond_24

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_pecan_v2_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_24
    sget-object v2, Lkjq;->aN:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_25

    sget-object v2, Lkjq;->aO:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_25

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_ml_walnut_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_25
    sget-object v2, Lkjq;->bP:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->x(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_26

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_chess_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_26
    sget-object v2, Lkjq;->ai:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_27

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_lancet_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_27
    sget-object v2, Lkjq;->ak:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_28

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_kepler_gan_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_28
    sget-object v2, Lkjq;->aQ:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_29

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_almond_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_29
    if-eqz v27, :cond_2a

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_almond_use_tpu_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_2a
    sget-object v2, Lkjq;->aw:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_2b

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_edamame_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    :cond_2b
    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v11, v2}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    const/4 v12, 0x1

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_tomte_grain_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    # Bypassed initialize_on_gcam_creation to avoid Embedded models compiled out error
    sget-object v2, Lznp;->a:Lznp;

    iget-wide v7, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    iget v2, v2, Lznp;->b:I

    invoke-static {v7, v8, v1, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_spatial_merge_processor_type_set(JLcom/google/googlex/gcam/InitParams;I)V

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v2, v3, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_spatial_merge_processor_error_fallback_set(JLcom/google/googlex/gcam/InitParams;Z)V

    sget-object v2, Lkjq;->aY:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_2d

    sget-object v2, Lzno;->a:Lzno;

    iget-wide v7, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    iget v2, v2, Lzno;->b:I

    invoke-static {v7, v8, v1, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_pipeline_type_set(JLcom/google/googlex/gcam/InitParams;I)V

    :cond_2d
    sget-object v2, Lkjq;->aM:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    iget-wide v7, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v7, v8, v1, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_standard_bayer_separable_rgb_merge_set(JLcom/google/googlex/gcam/InitParams;Z)V

    sget-object v2, Lkjq;->aV:Lkiz;

    invoke-virtual {v6, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    iget-wide v5, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v5, v6, v1, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_finish_mst_based_contrast_enhancement_enabled_set(JLcom/google/googlex/gcam/InitParams;Z)V

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    const/4 v15, 0x0

    invoke-static {v2, v3, v1, v15}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_quad_bayer_separable_rgb_merge_set(JLcom/google/googlex/gcam/InitParams;Z)V

    new-instance v2, Ljpc;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Ljpc;-><init>(Ljava/lang/Object;I)V

    invoke-static {v4, v2}, Lj$/lang/Iterable$-EL;->forEach(Ljava/lang/Iterable;Ljava/util/function/Consumer;)V

    iget-wide v2, v1, Lcom/google/googlex/gcam/InitParams;->a:J

    iget-wide v4, v14, Lcom/google/googlex/gcam/StaticMetadataVector;->a:J

    move-object/from16 v16, v1

    move-wide/from16 v17, v4

    move-object/from16 v19, v14

    move-wide v14, v2

    invoke-static/range {v14 .. v19}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_Create(JLcom/google/googlex/gcam/InitParams;JLcom/google/googlex/gcam/StaticMetadataVector;)J

    move-result-wide v0

    cmp-long v2, v0, v20

    if-nez v2, :cond_2e

    const/4 v5, 0x0

    goto :goto_17

    :cond_2e
    new-instance v5, Lcom/google/googlex/gcam/Gcam;

    invoke-direct {v5, v0, v1}, Lcom/google/googlex/gcam/Gcam;-><init>(J)V

    invoke-static {v0, v1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->initTomteGrain(J)V

    :goto_17
    invoke-virtual {v5}, Lcom/google/googlex/gcam/Gcam;->g()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-interface/range {v22 .. v22}, Lulx;->g()V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v5

    :cond_2f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method
