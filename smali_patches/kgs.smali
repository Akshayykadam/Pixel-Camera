.class public final Lkgs;
.super Lkgo;
.source "PG"


# instance fields
.field private final a:Ljava/util/List;


# direct methods
.method public constructor <init>(Lklm;Lpvz;)V
    .locals 16

    invoke-direct/range {p0 .. p0}, Lkgo;-><init>()V

    new-instance v0, Laddu;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Laddu;-><init>([B)V

    const/16 v1, 0xb

    new-array v1, v1, [Lkhn;

    sget-object v2, Lkhn;->a:Lkhn;

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lkhl;->b:Lkhl;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    const v5, 0x3f0201ac

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/high16 v9, 0x40a00000    # 5.0f

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    const/high16 v10, 0x41200000    # 10.0f

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    const/high16 v11, 0x41f00000    # 30.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v11, 0x0

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v11

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v12, Lkhl;->c:Lkhl;

    invoke-static {v12, v3}, Lejn;->p(Lkhl;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    const v13, 0x3fb33333    # 1.4f

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v14

    invoke-static {v7, v14}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    const/high16 v11, 0x40800000    # 4.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-static {v7, v14, v15}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v11, 0x1

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v11

    invoke-virtual/range {p2 .. p2}, Lpvz;->c()Z

    move-result v3

    const/high16 v11, 0x40400000    # 3.0f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v13, Lyri;->s:Lyri;

    invoke-static {v13, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v8, v11}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v13, Lyri;->s:Lyri;

    invoke-static {v13, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    const v5, 0x3fc2339c    # 1.5172f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v5, v8}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v13

    invoke-virtual {v3, v13}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v5, v8, v11}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    :goto_0
    const/4 v5, 0x2

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->g:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v5, 0x3

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->K:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v5, 0x4

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->i:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v5, 0x5

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->b:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    const v5, 0x3fb33333    # 1.4f

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v5, v3}, Lejn;->q(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v14}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v14, v15}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v5, 0x6

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->O:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    const v5, 0x3fb33333    # 1.4f

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v5, v3}, Lejn;->q(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v14}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v14, v15}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v5, 0x7

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->s:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    const v5, 0x3fb33333    # 1.4f

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v5, v3}, Lejn;->q(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v14}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v14, v15}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/16 v5, 0x8

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->M:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    const v5, 0x3fb33333    # 1.4f

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v5, v3}, Lejn;->q(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v14}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v14, v15}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/16 v5, 0x9

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v12, v3}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v5, Lyri;->N:Lyri;

    invoke-static {v5, v3}, Lejn;->n(Lyri;Laaxk;)V

    const v5, 0x3fb33333    # 1.4f

    invoke-static {v5, v3}, Lejn;->o(FLaaxk;)V

    invoke-static {v5, v3}, Lejn;->q(FLaaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v14}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v14, v15}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {v3, v5}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/16 v5, 0xa

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-static {v1}, Laaax;->k([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    sget-object v1, Lkjm;->q:Lkiz;

    move-object/from16 v3, p1

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, v1}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v2, Lyri;->P:Lyri;

    invoke-static {v2, v1}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v1}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8, v9}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v2

    invoke-virtual {v1, v2}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v1}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v0}, Laddu;->f()Ljava/util/List;

    move-result-object v0

    move-object/from16 v1, p0

    iput-object v0, v1, Lkgs;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lkgs;->a:Ljava/util/List;

    return-object p0
.end method
