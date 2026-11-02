.class public final Lkmd;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laebw;


# instance fields
.field final synthetic a:Lkmo;


# direct methods
.method public constructor <init>(Lkmo;)V
    .locals 0

    iput-object p1, p0, Lkmd;->a:Lkmo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;Ladqg;)Ljava/lang/Object;
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_19

    iget-object v4, v0, Lkmd;->a:Lkmo;

    check-cast v3, Lkof;

    const/4 v5, 0x1

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    const/4 v7, 0x2

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    const/4 v8, 0x3

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkof;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v3, v1

    :goto_0
    iget-boolean v14, v4, Lkmo;->P:Z

    iget-object v1, v3, Lkof;->d:Labjy;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    iget-object v4, v4, Lkmo;->ai:Lub;

    const/4 v8, 0x0

    if-eqz v1, :cond_1

    iget-object v1, v3, Lkof;->h:Labki;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v3, Lkof;->e:Labjy;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v4, Lub;->h:Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v3}, Lusf;->a(Ljava/lang/Object;)V

    iget-object v1, v4, Lub;->g:Ljava/lang/Object;

    check-cast v1, Laeec;

    invoke-virtual {v1, v8}, Laeec;->e(Ljava/lang/Object;)V

    goto/16 :goto_c

    :cond_1
    iget-object v1, v4, Lub;->c:Ljava/lang/Object;

    invoke-interface {v1}, Lurt;->d()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljut;

    iget-object v10, v9, Ljut;->a:Lpeb;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v11, v4, Lub;->a:Ljava/lang/Object;

    invoke-interface {v11}, Lurt;->d()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v12, Ltbp;

    invoke-static {v3, v10, v12, v6}, Lgei;->u(Lkof;Lpeb;Ltbp;Ljava/lang/Float;)F

    move-result v12

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v3, Lkof;->d:Labjy;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Laamv;->aX(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    iget-object v9, v3, Lkof;->h:Labki;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v13, Ljava/util/ArrayList;

    const/16 v15, 0xa

    invoke-static {v9, v15}, Laamv;->aI(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v13, v15}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lkoe;

    iget v15, v15, Lkoe;->b:F

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-interface {v13, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-static {v13}, Laamv;->aX(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    iget-object v13, v3, Lkof;->e:Labjy;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13}, Laamv;->aX(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Float;

    filled-new-array {v6, v9, v13}, [Ljava/lang/Float;

    move-result-object v6

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v6, v9}, Laamv;->cj([Ljava/lang/Object;Ljava/util/Collection;)V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_18

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Number;

    invoke-virtual {v13}, Ljava/lang/Number;->floatValue()F

    move-result v13

    invoke-static {v9, v13}, Ljava/lang/Math;->max(FF)F

    move-result v9

    goto :goto_2

    :cond_3
    iget-object v6, v4, Lub;->i:Ljava/lang/Object;

    invoke-interface {v6}, Lurt;->d()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v11}, Lurt;->d()Ljava/lang/Object;

    move-result-object v6

    sget-object v11, Ltbp;->b:Ltbp;

    if-ne v6, v11, :cond_4

    invoke-interface {v1}, Lurt;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljut;

    invoke-virtual {v1}, Ljut;->b()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, v4, Lub;->e:Ljava/lang/Object;

    check-cast v1, Ltmu;

    invoke-virtual {v1}, Ltmu;->a()F

    move-result v1

    invoke-virtual {v10}, Lvhe;->c()F

    move-result v6

    invoke-static {v1, v6}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_3

    :cond_4
    invoke-virtual {v10}, Lvhe;->c()F

    move-result v1

    :goto_3
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpl-float v7, v6, v9

    if-gtz v7, :cond_5

    move v9, v6

    :cond_5
    cmpl-float v6, v9, v1

    if-gtz v6, :cond_6

    move v13, v9

    goto :goto_4

    :cond_6
    move v13, v1

    :goto_4
    invoke-virtual {v3}, Labjt;->q()Labjo;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Labjo;->n()V

    iget-object v6, v1, Labjo;->b:Labjt;

    check-cast v6, Lkof;

    sget-object v7, Labjm;->a:Labjm;

    iput-object v7, v6, Lkof;->d:Labjy;

    iget-object v6, v3, Lkof;->d:Labjy;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_a

    invoke-static {v6}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-static {v9, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v9

    invoke-static {v6}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-static {v10, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v10

    invoke-static {v6}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v6}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v15

    move/from16 p1, v5

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v16, v8

    check-cast v16, Ljava/lang/Float;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v16

    if-ltz v16, :cond_7

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gtz v2, :cond_7

    invoke-interface {v5, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_7
    const/4 v2, 0x0

    const/4 v8, 0x0

    goto :goto_5

    :cond_8
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-gez v9, :cond_9

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    invoke-static {v6}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-lez v2, :cond_9

    check-cast v11, Ljava/lang/Float;

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v5, 0x0

    invoke-interface {v6, v5, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_9
    if-lez v10, :cond_b

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b

    invoke-static {v6}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gez v2, :cond_b

    check-cast v15, Ljava/lang/Float;

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_a
    move/from16 p1, v5

    :cond_b
    :goto_6
    if-eqz v3, :cond_check_5x_kmd

    iget v2, v3, Lkof;->c:I

    sget-object v5, Lzde;->s:Lzde;

    iget v5, v5, Lzde;->X:I

    if-ne v2, v5, :cond_check_video_portrait_kmd

    goto :cond_skip_10x_kmd

    :cond_check_video_portrait_kmd
    sget-object v5, Lzde;->H:Lzde;

    iget v5, v5, Lzde;->X:I

    if-ne v2, v5, :cond_check_video_portrait_still_kmd

    goto :cond_skip_10x_kmd

    :cond_check_video_portrait_still_kmd
    sget-object v5, Lzde;->I:Lzde;

    iget v5, v5, Lzde;->X:I

    if-ne v2, v5, :cond_check_5x_kmd

    goto :cond_skip_10x_kmd

    :cond_check_5x_kmd
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v6, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_skip_10x_kmd

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gtz v2, :cond_skip_10x_kmd

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v6, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_skip_10x_kmd

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kmd
    invoke-virtual {v1, v6}, Labjo;->w(Ljava/lang/Iterable;)V

    invoke-virtual {v1}, Labjo;->n()V

    iget-object v2, v1, Labjo;->b:Labjt;

    check-cast v2, Lkof;

    sget-object v5, Lablf;->a:Lablf;

    iput-object v5, v2, Lkof;->h:Labki;

    iget-object v2, v3, Lkof;->h:Labki;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f

    invoke-static {v2}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkoe;

    iget v5, v5, Lkoe;->b:F

    invoke-static {v5, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    invoke-static {v2}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkoe;

    iget v6, v6, Lkoe;->b:F

    invoke-static {v6, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v6

    invoke-static {v2}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v2}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Lkoe;

    iget v15, v15, Lkoe;->b:F

    invoke-static {v15, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v16

    if-ltz v16, :cond_c

    invoke-static {v15, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v15

    if-gtz v15, :cond_c

    invoke-interface {v10, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_d
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-gez v5, :cond_e

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_e

    invoke-static {v2}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkoe;

    iget v5, v5, Lkoe;->b:F

    invoke-static {v5, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    if-lez v5, :cond_e

    check-cast v8, Lkoe;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8}, Labjt;->q()Labjo;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v5}, Lfue;->bM(FLabjo;)V

    invoke-static {v5}, Lfue;->bL(Labjo;)Lkoe;

    move-result-object v5

    const/4 v8, 0x0

    invoke-interface {v2, v8, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_e
    if-lez v6, :cond_f

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f

    invoke-static {v2}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkoe;

    iget v5, v5, Lkoe;->b:F

    invoke-static {v5, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    if-gez v5, :cond_f

    check-cast v9, Lkoe;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Labjt;->q()Labjo;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v5}, Lfue;->bM(FLabjo;)V

    invoke-static {v5}, Lfue;->bL(Labjo;)Lkoe;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_f
    invoke-virtual {v1, v2}, Labjo;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v1}, Labjo;->n()V

    iget-object v2, v1, Labjo;->b:Labjt;

    check-cast v2, Lkof;

    iput-object v7, v2, Lkof;->e:Labjy;

    iget-object v2, v3, Lkof;->e:Labjy;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_13

    invoke-static {v2}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    invoke-static {v2}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-static {v5, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    invoke-static {v2}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v2}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v7

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_10
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_11

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-static {v10, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v11

    if-ltz v11, :cond_10

    invoke-static {v10, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v10

    if-gtz v10, :cond_10

    invoke-interface {v8, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_11
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-gez v3, :cond_12

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_12

    invoke-static {v2}, Laamv;->aS(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-lez v3, :cond_12

    check-cast v6, Ljava/lang/Float;

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const/4 v8, 0x0

    invoke-interface {v2, v8, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_12
    if-lez v5, :cond_13

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_13

    invoke-static {v2}, Laamv;->aW(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-gez v3, :cond_13

    check-cast v7, Ljava/lang/Float;

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_13
    invoke-virtual {v1, v2}, Labjo;->v(Ljava/lang/Iterable;)V

    invoke-virtual {v1}, Labjo;->i()Labjt;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v9, v1

    check-cast v9, Lkof;

    iget v1, v9, Lkof;->f:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gtz v2, :cond_14

    const/4 v1, 0x0

    :cond_14
    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    move v11, v1

    goto :goto_9

    :cond_15
    const/4 v1, 0x2

    iget v3, v9, Lkof;->b:I

    move v11, v2

    :goto_9
    const/4 v3, 0x0

    iget v1, v9, Lkof;->g:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v5

    cmpl-float v3, v5, v3

    if-gtz v3, :cond_16

    const/4 v8, 0x0

    goto :goto_a

    :cond_16
    move-object v8, v1

    :goto_a
    if-eqz v8, :cond_17

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_b

    :cond_17
    invoke-static {v12, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :goto_b
    move v10, v1

    const/4 v1, 0x2

    iget v2, v9, Lkof;->b:I

    if-ne v2, v1, :cond_check_zoom_range_kmd

    goto :cond_skip_focal_kmd

    :cond_check_zoom_range_kmd
    const/high16 v1, 0x3f880000    # 1.0625f

    cmpl-float v1, v10, v1

    if-ltz v1, :cond_restore_focal_kmd

    goto :cond_skip_focal_kmd

    :cond_restore_focal_kmd
    invoke-static {v10}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getSavedFocalLength(F)F

    move-result v10

    :cond_skip_focal_kmd
    iget-object v1, v4, Lub;->h:Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lusf;->a(Ljava/lang/Object;)V

    iget-object v1, v4, Lub;->b:Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v2}, Lusf;->a(Ljava/lang/Object;)V

    iget-object v1, v4, Lub;->f:Ljava/lang/Object;

    new-instance v2, Lknd;

    invoke-direct {v2, v12, v13, v11}, Lknd;-><init>(FFF)V

    invoke-interface {v1, v2}, Lusf;->a(Ljava/lang/Object;)V

    new-instance v8, Lkkt;

    invoke-direct/range {v8 .. v14}, Lkkt;-><init>(Lkof;FFFFZ)V

    invoke-virtual {v8}, Lkkt;->toString()Ljava/lang/String;

    iget-object v1, v4, Lub;->g:Ljava/lang/Object;

    check-cast v1, Laeec;

    invoke-virtual {v1, v8}, Laeec;->e(Ljava/lang/Object;)V

    goto :goto_c

    :cond_18
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :cond_19
    :goto_c
    iget-object v0, v0, Lkmd;->a:Lkmo;

    const/4 v8, 0x0

    iput-boolean v8, v0, Lkmo;->P:Z

    sget-object v0, Ladok;->a:Ladok;

    return-object v0
.end method
