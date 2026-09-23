.class public final Lkha;
.super Lkgo;
.source "PG"


# instance fields
.field private final a:Ljava/util/List;


# direct methods
.method public constructor <init>(Lklm;Lpvz;)V
    .locals 18

    move-object/from16 v0, p1

    invoke-direct/range {p0 .. p0}, Lkgo;-><init>()V

    new-instance v1, Laddu;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Laddu;-><init>([B)V

    const/16 v2, 0xc

    new-array v2, v2, [Lkhn;

    sget-object v3, Lkhn;->a:Lkhn;

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lkhl;->b:Lkhl;

    invoke-static {v5, v4}, Lejn;->p(Lkhl;Laaxk;)V

    invoke-static {v4}, Lejn;->m(Laaxk;)Labae;

    const v6, 0x3f0201ac

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    const/high16 v10, 0x40a00000    # 5.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    const/high16 v11, 0x41200000    # 10.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static {v7, v8, v9, v10, v11}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v12

    invoke-virtual {v4, v12}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v4}, Lejn;->l(Laaxk;)Labae;

    const/high16 v12, 0x41f00000    # 30.0f

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    invoke-static/range {v7 .. v12}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v12

    invoke-virtual {v4, v12}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v4}, Laaxk;->i()Laaxp;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v4, Lkhn;

    const/4 v12, 0x0

    aput-object v4, v2, v12

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v13, Lkhl;->c:Lkhl;

    invoke-static {v13, v4}, Lejn;->p(Lkhl;Laaxk;)V

    invoke-static {v4}, Lejn;->m(Laaxk;)Labae;

    const v14, 0x3fb33333    # 1.4f

    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-static {v8, v15}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v12

    invoke-virtual {v4, v12}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v4}, Lejn;->l(Laaxk;)Labae;

    const/high16 v12, 0x40800000    # 4.0f

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    invoke-static {v8, v15, v12}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v14

    invoke-virtual {v4, v14}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v4}, Laaxk;->i()Laaxp;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v4, Lkhn;

    const/4 v14, 0x1

    aput-object v4, v2, v14

    invoke-virtual/range {p2 .. p2}, Lpvz;->c()Z

    move-result v4

    const/high16 v14, 0x40400000    # 3.0f

    invoke-static {v14}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v4}, Lejn;->p(Lkhl;Laaxk;)V

    move-object/from16 v16, v2

    sget-object v2, Lyri;->s:Lyri;

    invoke-static {v2, v4}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v6, v4}, Lejn;->o(FLaaxk;)V

    invoke-static {v4}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v9, v10}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v2

    invoke-virtual {v4, v2}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v4}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v9, v14, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v2

    invoke-virtual {v4, v2}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v4}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    goto :goto_0

    :cond_0
    move-object/from16 v16, v2

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v4, Lyri;->s:Lyri;

    invoke-static {v4, v2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v6, v2}, Lejn;->o(FLaaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    const v4, 0x3fc2339c    # 1.5172f

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-static {v4, v9, v10}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v4, v9, v14, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v4

    invoke-virtual {v2, v4}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    :goto_0
    const/4 v4, 0x2

    aput-object v2, v16, v4

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v4, Lyri;->g:Lyri;

    invoke-static {v4, v2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8, v9, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v4

    invoke-virtual {v2, v4}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v17, v12

    move-object v12, v4

    move-object/from16 v4, v17

    invoke-static/range {v7 .. v12}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/4 v6, 0x3

    aput-object v2, v16, v6

    sget-object v2, Lkla;->h:Lkiz;

    invoke-virtual {v0, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->R:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8, v9, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v7 .. v12}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->R:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v9, v10}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v9, v10, v11, v12}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    :goto_1
    const/4 v6, 0x4

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->K:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8, v9, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v7 .. v12}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/4 v6, 0x5

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->i:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8, v9, v10}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v7 .. v12}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/4 v6, 0x6

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->b:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    const v6, 0x3fb33333    # 1.4f

    invoke-static {v6, v2}, Lejn;->o(FLaaxk;)V

    invoke-static {v6, v2}, Lejn;->q(FLaaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v15}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v15, v4}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/4 v6, 0x7

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->O:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    const v6, 0x3fb33333    # 1.4f

    invoke-static {v6, v2}, Lejn;->o(FLaaxk;)V

    invoke-static {v6, v2}, Lejn;->q(FLaaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v15}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v15, v4}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/16 v6, 0x8

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->s:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    const v6, 0x3fb33333    # 1.4f

    invoke-static {v6, v2}, Lejn;->o(FLaaxk;)V

    invoke-static {v6, v2}, Lejn;->q(FLaaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v15}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v15, v4}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/16 v6, 0x9

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->M:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    const v6, 0x3fb33333    # 1.4f

    invoke-static {v6, v2}, Lejn;->o(FLaaxk;)V

    invoke-static {v6, v2}, Lejn;->q(FLaaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v15}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v15, v4}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/16 v6, 0xa

    aput-object v2, v16, v6

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v13, v2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v6, Lyri;->N:Lyri;

    invoke-static {v6, v2}, Lejn;->n(Lyri;Laaxk;)V

    const v6, 0x3fb33333    # 1.4f

    invoke-static {v6, v2}, Lejn;->o(FLaaxk;)V

    invoke-static {v6, v2}, Lejn;->q(FLaaxk;)V

    invoke-static {v2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v15}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v6

    invoke-virtual {v2, v6}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v8, v15, v4}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v4

    invoke-virtual {v2, v4}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Lkhn;

    const/16 v4, 0xb

    aput-object v2, v16, v4

    invoke-static/range {v16 .. v16}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    sget-object v2, Lkjm;->q:Lkiz;

    invoke-virtual {v0, v2}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v0}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v2, Lyri;->P:Lyri;

    invoke-static {v2, v0}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v0}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v8, v9, v10}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v2

    invoke-virtual {v0, v2}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-virtual {v0}, Laaxk;->i()Laaxp;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Lkhn;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    invoke-virtual {v1}, Laddu;->f()Ljava/util/List;

    move-result-object v0

    move-object/from16 v1, p0

    iput-object v0, v1, Lkha;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lkha;->a:Ljava/util/List;

    return-object p0
.end method
