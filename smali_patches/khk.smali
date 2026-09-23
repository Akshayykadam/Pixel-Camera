.class public final Lkhk;
.super Lkgo;
.source "PG"


# instance fields
.field private final a:Ljava/util/List;


# direct methods
.method public constructor <init>(Lklm;Lpvz;)V
    .locals 13

    invoke-direct {p0}, Lkgo;-><init>()V

    new-instance v0, Laddu;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Laddu;-><init>([B)V

    const/4 v1, 0x7

    new-array v1, v1, [Lkhn;

    sget-object v2, Lkhn;->a:Lkhn;

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lkhl;->b:Lkhl;

    invoke-static {v4, v3}, Lejn;->p(Lkhl;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    const v5, 0x3f0181cf

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

    sget-object v11, Lkhl;->c:Lkhl;

    invoke-static {v11, v3}, Lejn;->p(Lkhl;Laaxk;)V

    invoke-static {v3}, Lejn;->m(Laaxk;)Labae;

    const v11, 0x3fb33333    # 1.4f

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static {v7, v11}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v12

    invoke-virtual {v3, v12}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {v3}, Lejn;->l(Laaxk;)Labae;

    const/high16 v12, 0x40800000    # 4.0f

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    invoke-static {v7, v11, v12}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {v3, v11}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v11, 0x1

    invoke-static {v3}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object v3

    aput-object v3, v1, v11

    invoke-virtual {p2}, Lpvz;->c()Z

    move-result p2

    const/high16 v3, 0x40400000    # 3.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    if-eqz p2, :cond_0

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v11, Lyri;->s:Lyri;

    invoke-static {v11, p2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v5, p2}, Lejn;->o(FLaaxk;)V

    invoke-static {p2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v5

    invoke-virtual {p2, v5}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v8, v3}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p2

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v11, Lyri;->s:Lyri;

    invoke-static {v11, p2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {v5, p2}, Lejn;->o(FLaaxk;)V

    invoke-static {p2}, Lejn;->m(Laaxk;)Labae;

    const v5, 0x3fbe7a10    # 1.4881f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v5, v8}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v11

    invoke-virtual {p2, v11}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v5, v8, v3}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->u(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p2

    :goto_0
    const/4 v3, 0x2

    aput-object p2, v1, v3

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v3, Lyri;->g:Lyri;

    invoke-static {v3, p2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {p2}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->l(Laaxk;)Labae;

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v3, 0x3

    invoke-static {p2}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p2

    aput-object p2, v1, v3

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v3, Lyri;->R:Lyri;

    invoke-static {v3, p2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {p2}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->l(Laaxk;)Labae;

    invoke-static {v7, v8}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v3, 0x4

    invoke-static {p2}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p2

    aput-object p2, v1, v3

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v3, Lyri;->K:Lyri;

    invoke-static {v3, p2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {p2}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v3, 0x5

    invoke-static {p2}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p2

    aput-object p2, v1, v3

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p2}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object v3, Lyri;->i:Lyri;

    invoke-static {v3, p2}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {p2}, Lejn;->m(Laaxk;)Labae;

    invoke-static/range {v6 .. v10}, Lyeh;->p(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p2}, Lejn;->l(Laaxk;)Labae;

    invoke-static/range {v6 .. v11}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v3

    invoke-virtual {p2, v3}, Laaxk;->u(Ljava/lang/Iterable;)V

    const/4 v3, 0x6

    invoke-static {p2}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p2

    aput-object p2, v1, v3

    invoke-static {v1}, Laaax;->k([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    sget-object p2, Lkjm;->q:Lkiz;

    invoke-virtual {p1, p2}, Lklm;->q(Lkiz;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p1}, Lejn;->p(Lkhl;Laaxk;)V

    sget-object p2, Lyri;->P:Lyri;

    invoke-static {p2, p1}, Lejn;->n(Lyri;Laaxk;)V

    invoke-static {p1}, Lejn;->m(Laaxk;)Labae;

    invoke-static {v7, v8, v9}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object p2

    invoke-virtual {p1, p2}, Laaxk;->v(Ljava/lang/Iterable;)V

    invoke-static {p1}, Lejn;->j(Laaxk;)Lkhn;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v0}, Laddu;->f()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lkhk;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lkhk;->a:Ljava/util/List;

    return-object p0
.end method
