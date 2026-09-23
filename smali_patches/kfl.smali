.class public final Lkfl;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Ladqd;


# instance fields
.field final synthetic a:Lkfw;


# direct methods
.method public constructor <init>(Lkfw;)V
    .locals 0

    iput-object p1, p0, Lkfl;->a:Lkfw;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;Ladel;)Ljava/lang/Object;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1c

    iget-object v4, v0, Lkfl;->a:Lkfw;

    check-cast v3, Lkhn;

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

    check-cast v1, Lkhn;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v3, v1

    :goto_0
    iget-boolean v14, v4, Lkfw;->N:Z

    iget-object v1, v3, Lkhn;->e:Laaxu;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    iget-object v4, v4, Lkfw;->ah:Ltp;

    const/4 v8, 0x0

    if-eqz v1, :cond_1

    iget-object v1, v3, Lkhn;->i:Laaye;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v3, Lkhn;->f:Laaxu;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v4, Ltp;->h:Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, v4, Ltp;->g:Ljava/lang/Object;

    check-cast v1, Ladsj;

    invoke-virtual {v1, v8}, Ladsj;->e(Ljava/lang/Object;)V

    goto/16 :goto_d

    :cond_1
    iget-object v1, v4, Ltp;->c:Ljava/lang/Object;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljnz;

    iget-object v10, v9, Ljnz;->a:Loui;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v11, v4, Ltp;->a:Ljava/lang/Object;

    invoke-interface {v11}, Lufv;->d()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v12, Lsql;

    invoke-static {v3, v10, v12, v6}, Lejn;->v(Lkhn;Loui;Lsql;Ljava/lang/Float;)F

    move-result v12

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, v3, Lkhn;->e:Laaxu;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6}, Laaax;->bw(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    iget-object v9, v3, Lkhn;->i:Laaye;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v13, Ljava/util/ArrayList;

    const/16 v15, 0xa

    invoke-static {v9, v15}, Laaax;->bh(Ljava/lang/Iterable;I)I

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

    check-cast v15, Lkhm;

    iget v15, v15, Lkhm;->c:F

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-interface {v13, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-static {v13}, Laaax;->bw(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    iget-object v13, v3, Lkhn;->f:Laaxu;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13}, Laaax;->bw(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Float;

    filled-new-array {v6, v9, v13}, [Ljava/lang/Float;

    move-result-object v6

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v6, v9}, Laaax;->S([Ljava/lang/Object;Ljava/util/Collection;)V

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1b

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
    iget-object v6, v4, Ltp;->i:Ljava/lang/Object;

    invoke-interface {v6}, Lufv;->d()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v11}, Lufv;->d()Ljava/lang/Object;

    move-result-object v6

    sget-object v11, Lsql;->b:Lsql;

    if-ne v6, v11, :cond_4

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljnz;

    invoke-virtual {v1}, Ljnz;->b()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, v4, Ltp;->e:Ljava/lang/Object;

    check-cast v1, Ltba;

    invoke-virtual {v1}, Ltba;->a()F

    move-result v1

    invoke-virtual {v10}, Luvf;->c()F

    move-result v6

    invoke-static {v1, v6}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_3

    :cond_4
    invoke-virtual {v10}, Luvf;->c()F

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
    const/4 v1, 0x5

    invoke-virtual {v3, v1, v8}, Laaxp;->a(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Laaxk;

    invoke-virtual {v6, v3}, Laaxk;->r(Laaxp;)V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v6, Laaxk;->b:Laaxp;

    invoke-virtual {v7}, Laaxp;->T()Z

    move-result v7

    if-nez v7, :cond_7

    invoke-virtual {v6}, Laaxk;->o()V

    :cond_7
    iget-object v7, v6, Laaxk;->b:Laaxp;

    check-cast v7, Lkhn;

    sget-object v9, Laaxi;->a:Laaxi;

    iput-object v9, v7, Lkhn;->e:Laaxu;

    iget-object v7, v3, Lkhn;->e:Laaxu;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_b

    invoke-static {v7}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-static {v10, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v10

    invoke-static {v7}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-static {v11, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v11

    invoke-static {v7}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v15

    invoke-static {v7}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v16

    move/from16 p1, v5

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v17, v1

    check-cast v17, Ljava/lang/Float;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-static {v8, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v17

    if-ltz v17, :cond_8

    invoke-static {v8, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v8

    if-gtz v8, :cond_8

    invoke-interface {v5, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_8
    const/4 v1, 0x5

    const/4 v8, 0x0

    goto :goto_5

    :cond_9
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-gez v10, :cond_a

    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a

    invoke-static {v7}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-lez v1, :cond_a

    check-cast v15, Ljava/lang/Float;

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v7, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_a
    if-lez v11, :cond_c

    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c

    invoke-static {v7}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-gez v1, :cond_c

    check-cast v16, Ljava/lang/Float;

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_b
    move/from16 p1, v5

    :cond_c
    :goto_6
    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_skip_10x_kfl

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-gtz v1, :cond_skip_10x_kfl

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_skip_10x_kfl

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kfl
    invoke-virtual {v6, v7}, Laaxk;->v(Ljava/lang/Iterable;)V

    iget-object v1, v6, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_d

    invoke-virtual {v6}, Laaxk;->o()V

    :cond_d
    iget-object v1, v6, Laaxk;->b:Laaxp;

    check-cast v1, Lkhn;

    sget-object v5, Laazb;->a:Laazb;

    iput-object v5, v1, Lkhn;->i:Laaye;

    iget-object v1, v3, Lkhn;->i:Laaye;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_11

    invoke-static {v1}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkhm;

    iget v5, v5, Lkhm;->c:F

    invoke-static {v5, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    invoke-static {v1}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkhm;

    iget v7, v7, Lkhm;->c:F

    invoke-static {v7, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v7

    invoke-static {v1}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v1}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    move-object v2, v15

    check-cast v2, Lkhm;

    iget v2, v2, Lkhm;->c:F

    invoke-static {v2, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v17

    if-ltz v17, :cond_e

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gtz v2, :cond_e

    invoke-interface {v11, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_e
    const/4 v2, 0x0

    goto :goto_7

    :cond_f
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-gez v5, :cond_10

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_10

    invoke-static {v1}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkhm;

    iget v2, v2, Lkhm;->c:F

    invoke-static {v2, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-lez v2, :cond_10

    check-cast v8, Lkhm;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x5

    const/4 v5, 0x0

    invoke-virtual {v8, v2, v5}, Laaxp;->a(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Laaxk;

    invoke-virtual {v11, v8}, Laaxk;->r(Laaxp;)V

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v11}, Lhpq;->bi(FLaaxk;)V

    invoke-static {v11}, Lhpq;->bh(Laaxk;)Lkhm;

    move-result-object v2

    const/4 v5, 0x0

    invoke-interface {v1, v5, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_10
    if-lez v7, :cond_11

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_11

    invoke-static {v1}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkhm;

    iget v2, v2, Lkhm;->c:F

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gez v2, :cond_11

    check-cast v10, Lkhm;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x5

    const/4 v5, 0x0

    invoke-virtual {v10, v2, v5}, Laaxp;->a(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Laaxk;

    invoke-virtual {v2, v10}, Laaxk;->r(Laaxp;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2}, Lhpq;->bi(FLaaxk;)V

    invoke-static {v2}, Lhpq;->bh(Laaxk;)Lkhm;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_11
    const/4 v5, 0x0

    :goto_8
    invoke-virtual {v6, v1}, Laaxk;->t(Ljava/lang/Iterable;)V

    iget-object v1, v6, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_12

    invoke-virtual {v6}, Laaxk;->o()V

    :cond_12
    iget-object v1, v6, Laaxk;->b:Laaxp;

    check-cast v1, Lkhn;

    iput-object v9, v1, Lkhn;->f:Laaxu;

    iget-object v1, v3, Lkhn;->f:Laaxu;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16

    invoke-static {v1}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    invoke-static {v1}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    invoke-static {v1}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v1}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_13
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-static {v11, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v15

    if-ltz v15, :cond_13

    invoke-static {v11, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v11

    if-gtz v11, :cond_13

    invoke-interface {v9, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_14
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-gez v2, :cond_15

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_15

    invoke-static {v1}, Laaax;->br(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2, v12}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-lez v2, :cond_15

    check-cast v7, Ljava/lang/Float;

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v7, 0x0

    invoke-interface {v1, v7, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_15
    if-lez v3, :cond_16

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_16

    invoke-static {v1}, Laaax;->bv(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2, v13}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gez v2, :cond_16

    check-cast v8, Ljava/lang/Float;

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_16
    invoke-virtual {v6, v1}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v6}, Laaxk;->i()Laaxp;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v9, v1

    check-cast v9, Lkhn;

    iget v1, v9, Lkhn;->g:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-gtz v2, :cond_17

    move-object v1, v5

    :cond_17
    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    move v11, v1

    goto :goto_a

    :cond_18
    move v11, v2

    :goto_a
    iget v1, v9, Lkhn;->h:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v6

    cmpl-float v3, v6, v3

    if-gtz v3, :cond_19

    move-object v8, v5

    goto :goto_b

    :cond_19
    move-object v8, v1

    :goto_b
    if-eqz v8, :cond_1a

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_c

    :cond_1a
    invoke-static {v12, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :goto_c
    move v10, v1

    iget-object v1, v4, Ltp;->h:Ljava/lang/Object;

    invoke-static/range {p1 .. p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, v4, Ltp;->b:Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, v4, Ltp;->f:Ljava/lang/Object;

    new-instance v2, Lkgl;

    invoke-direct {v2, v12, v13, v11}, Lkgl;-><init>(FFF)V

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    new-instance v8, Lkdz;

    invoke-direct/range {v8 .. v14}, Lkdz;-><init>(Lkhn;FFFFZ)V

    invoke-virtual {v8}, Lkdz;->toString()Ljava/lang/String;

    iget-object v1, v4, Ltp;->g:Ljava/lang/Object;

    check-cast v1, Ladsj;

    invoke-virtual {v1, v8}, Ladsj;->e(Ljava/lang/Object;)V

    goto :goto_d

    :cond_1b
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    :cond_1c
    :goto_d
    iget-object v0, v0, Lkfl;->a:Lkfw;

    const/4 v5, 0x0

    iput-boolean v5, v0, Lkfw;->N:Z

    sget-object v0, Ladcp;->a:Ladcp;

    return-object v0
.end method
