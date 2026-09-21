.class public final Lqhm;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lqhp;


# static fields
.field public static final synthetic l:I

.field private static final m:Ljava/util/List;

.field private static final n:Ljava/util/List;

.field private static final o:Ljava/util/List;


# instance fields
.field private A:Luep;

.field private final B:Lqtd;

.field private final C:Lklm;

.field private final D:Ltit;

.field private final E:Ltit;

.field public final a:Ladbv;

.field public final b:Lufv;

.field public final c:Lufv;

.field public final d:Lufv;

.field public final e:Lugh;

.field public final f:Lugh;

.field public final g:Ladsh;

.field public final h:Ladqc;

.field public final i:Ladqc;

.field public final j:Ladqc;

.field public final k:Ladsj;

.field private final p:Ladep;

.field private final q:Lufv;

.field private final r:Lufv;

.field private final s:Lugh;

.field private final t:Ladbv;

.field private final u:Lufv;

.field private final v:Lufv;

.field private final w:Leit;

.field private final x:Ladca;

.field private final y:Lufv;

.field private z:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Lnqq;->c:Lnqq;

    invoke-static {v0}, Laaax;->aY(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lqhm;->m:Ljava/util/List;

    const/4 v0, 0x2

    new-array v0, v0, [Lnqq;

    const/4 v1, 0x0

    sget-object v2, Lnqq;->h:Lnqq;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lnqq;->b:Lnqq;

    aput-object v2, v0, v1

    invoke-static {v0}, Laaax;->k([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lqhm;->n:Ljava/util/List;

    sget-object v0, Lnqq;->m:Lnqq;

    invoke-static {v0}, Laaax;->aY(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lqhm;->o:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ltit;Ladbv;Ladep;Lufv;Lufv;Ltit;Lufv;Lugh;Lufv;Lqtd;Leis;Lufv;Lklm;Ladbv;Lugh;Lugh;)V
    .locals 11

    move-object/from16 v0, p10

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p8 .. p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p9 .. p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p12 .. p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p13 .. p13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p14 .. p14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p15 .. p15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p16 .. p16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqhm;->D:Ltit;

    iput-object p2, p0, Lqhm;->a:Ladbv;

    iput-object p3, p0, Lqhm;->p:Ladep;

    iput-object p4, p0, Lqhm;->q:Lufv;

    move-object/from16 p2, p5

    iput-object p2, p0, Lqhm;->r:Lufv;

    move-object/from16 v1, p6

    iput-object v1, p0, Lqhm;->E:Ltit;

    move-object/from16 v2, p7

    iput-object v2, p0, Lqhm;->b:Lufv;

    move-object/from16 v2, p8

    iput-object v2, p0, Lqhm;->s:Lugh;

    move-object/from16 v2, p9

    iput-object v2, p0, Lqhm;->c:Lufv;

    iput-object v0, p0, Lqhm;->B:Lqtd;

    move-object/from16 v2, p12

    iput-object v2, p0, Lqhm;->d:Lufv;

    move-object/from16 v3, p13

    iput-object v3, p0, Lqhm;->C:Lklm;

    move-object/from16 v3, p14

    iput-object v3, p0, Lqhm;->t:Ladbv;

    move-object/from16 v3, p15

    iput-object v3, p0, Lqhm;->e:Lugh;

    move-object/from16 v3, p16

    iput-object v3, p0, Lqhm;->f:Lugh;

    new-instance v2, Lqhq;

    invoke-interface/range {p12 .. p12}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v7, v3

    check-cast v7, Landroid/graphics/Rect;

    const/4 v9, 0x0

    const/16 v10, 0x1df

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v10}, Lqhq;-><init>(Lyeh;Lyeh;ZLadgi;Landroid/graphics/Rect;Ladgi;Ladfx;I)V

    invoke-static {v2}, Ladsk;->a(Ljava/lang/Object;)Ladsj;

    move-result-object v2

    iput-object v2, p0, Lqhm;->k:Ladsj;

    new-instance v3, Ladrs;

    invoke-direct {v3, v2, v4}, Ladrs;-><init>(Ladsh;Ladmv;)V

    iput-object v3, p0, Lqhm;->g:Ladsh;

    invoke-static {v3}, Ltqz;->eD(Ladqc;)Lufv;

    move-result-object v2

    new-instance v5, Lpez;

    const/16 v6, 0x11

    invoke-direct {v5, v6}, Lpez;-><init>(I)V

    invoke-static {v2, v5}, Ltqz;->eE(Lufv;Lxvv;)Lufv;

    move-result-object v2

    iput-object v2, p0, Lqhm;->u:Lufv;

    invoke-static {v3}, Ltqz;->eD(Ladqc;)Lufv;

    move-result-object v2

    new-instance v5, Lpez;

    const/16 v6, 0x12

    invoke-direct {v5, v6}, Lpez;-><init>(I)V

    invoke-static {v2, v5}, Ltqz;->eE(Lufv;Lxvv;)Lufv;

    move-result-object v2

    iput-object v2, p0, Lqhm;->v:Lufv;

    new-instance v2, Lltc;

    const/4 v5, 0x2

    invoke-direct {v2, v3, p0, v5}, Lltc;-><init>(Ladqc;Ljava/lang/Object;I)V

    invoke-static {v2}, Ladqj;->a(Ladqc;)Ladqc;

    move-result-object v2

    iput-object v2, p0, Lqhm;->h:Ladqc;

    new-instance v2, Lgmf;

    const/16 v5, 0x8

    invoke-direct {v2, v3, v5}, Lgmf;-><init>(Ljava/lang/Object;I)V

    invoke-static {v2}, Ladqj;->a(Ladqc;)Ladqc;

    move-result-object v2

    iput-object v2, p0, Lqhm;->i:Ladqc;

    invoke-static/range {p11 .. p11}, Ldwc;->d(Leis;)Leit;

    move-result-object v2

    iput-object v2, p0, Lqhm;->w:Leit;

    new-instance v3, Lqhh;

    const/4 v5, 0x1

    invoke-direct {v3, p0, v5}, Lqhh;-><init>(Ljava/lang/Object;I)V

    new-instance v7, Ladch;

    invoke-direct {v7, v3}, Ladch;-><init>(Ladfx;)V

    iput-object v7, p0, Lqhm;->x:Ladca;

    sget-object v3, Lqsy;->br:Lqtm;

    invoke-virtual {v0, v3}, Lqtd;->a(Lqsw;)Lugh;

    move-result-object v0

    iput-object v0, p0, Lqhm;->y:Lufv;

    invoke-static {p4}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object p1

    invoke-static {p2}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object p2

    invoke-static {v1}, Lsmh;->r(Ltit;)Ladqc;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object v0

    new-instance v3, Lqhk;

    invoke-direct {v3, p0, v4}, Lqhk;-><init>(Lqhm;Ladel;)V

    invoke-static {p1, p2, v1, v0, v3}, Ladhh;->z(Ladqc;Ladqc;Ladqc;Ladqc;Ladgp;)Ladqc;

    move-result-object p1

    iput-object p1, p0, Lqhm;->j:Ladqc;

    new-instance p1, Lkxu;

    invoke-direct {p1, p0, v4, v6}, Lkxu;-><init>(Lqhm;Ladel;I)V

    const/4 p2, 0x0

    const/4 v0, 0x3

    invoke-static {v2, v4, p2, p1, v0}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    new-instance p1, Lkxu;

    const/16 v1, 0x13

    invoke-direct {p1, p0, v4, v1, v4}, Lkxu;-><init>(Lqhm;Ladel;I[B)V

    invoke-static {v2, v4, p2, p1, v0}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    new-instance p1, Lkxu;

    const/16 v1, 0x14

    invoke-direct {p1, p0, v4, v1, v4}, Lkxu;-><init>(Lqhm;Ladel;I[C)V

    invoke-static {v2, v4, p2, p1, v0}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    new-instance p1, Lqhl;

    invoke-direct {p1, p0, v4, v5, v4}, Lqhl;-><init>(Lqhm;Ladel;I[B)V

    invoke-static {v2, v4, p2, p1, v0}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    return-void
.end method

.method public static final i(ZLkgm;ZZ)Z
    .locals 0

    if-nez p0, :cond_1

    sget-object p0, Lkgm;->b:Lkgm;

    if-eq p1, p0, :cond_1

    if-nez p2, :cond_1

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private final j(Lqto;)Lnqq;
    .locals 0

    iget-object p0, p0, Lqhm;->B:Lqtd;

    invoke-virtual {p0, p1}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    const/4 p1, -0x1

    if-ne p0, p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p0}, Lnqq;->a(I)Lnqq;

    move-result-object p0

    return-object p0
.end method

.method private final k(Lnqr;Landroid/util/Size;)Lsmu;
    .locals 6

    new-instance v0, Lsmu;

    iget-object p1, p1, Lnqr;->b:Lufv;

    invoke-interface {p1}, Lufv;->d()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object p0, p0, Lqhm;->z:Landroid/view/View;

    invoke-static {p0}, Ltqz;->bj(Landroid/view/View;)I

    move-result v4

    sget-object v5, Lsms;->a:Lsms;

    const/4 v2, 0x0

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;ILsmh;)V

    return-object v0
.end method

.method private final l(Lnqu;Landroid/util/Size;Ladgi;)Lsmu;
    .locals 6

    invoke-virtual {p1}, Lnqu;->h()Lsmq;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Lsmu;

    iget-object p0, p0, Lqhm;->z:Landroid/view/View;

    invoke-static {p0}, Ltqz;->bj(Landroid/view/View;)I

    move-result v4

    new-instance v5, Lsmr;

    invoke-direct {v5, p3}, Lsmr;-><init>(Ladgi;)V

    iget v1, p1, Lsmq;->d:I

    iget-object v2, p1, Lsmq;->a:Ljava/lang/String;

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;ILsmh;)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private final m(Ljava/util/List;Z)Lyeh;
    .locals 30

    move-object/from16 v0, p0

    move/from16 v1, p2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnqq;

    invoke-direct {v0}, Lqhm;->n()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnqr;

    const/4 v5, 0x0

    if-nez v4, :cond_1

    goto/16 :goto_a

    :cond_1
    iget-object v6, v0, Lqhm;->t:Ladbv;

    invoke-interface {v6}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnqj;

    invoke-virtual {v4}, Lnqr;->a()Lnqp;

    move-result-object v7

    invoke-virtual {v6, v7}, Lnqj;->G(Lnqp;)Z

    move-result v6

    goto :cond_2

    goto/16 :goto_a

    :cond_2
    iget-object v6, v4, Lnqr;->e:Lnqs;

    instance-of v7, v6, Lqhr;

    if-eqz v7, :cond_3

    check-cast v6, Lqhr;

    goto :goto_1

    :cond_3
    move-object v6, v5

    :goto_1
    if-nez v6, :cond_4

    goto/16 :goto_a

    :cond_4
    invoke-virtual {v6}, Lnqu;->j()V

    iget-object v7, v0, Lqhm;->z:Landroid/view/View;

    const-string v8, "Required value was null."

    if-eqz v7, :cond_10

    invoke-virtual {v7}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x7f070926

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    new-instance v9, Landroid/util/Size;

    invoke-direct {v9, v7, v7}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v6}, Lqhr;->B()Lsmv;

    move-result-object v10

    new-instance v7, Lqhf;

    const/4 v11, 0x0

    invoke-direct {v7, v6, v1, v11}, Lqhf;-><init>(Ljava/lang/Object;ZI)V

    if-eqz v1, :cond_6

    iget-object v12, v10, Lsmv;->b:Ljava/util/Set;

    new-instance v13, Ljava/util/ArrayList;

    const/16 v14, 0xa

    invoke-static {v12, v14}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v14

    invoke-direct {v13, v14}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Number;

    invoke-virtual {v14}, Ljava/lang/Number;->intValue()I

    move-result v14

    iget v15, v10, Lsmv;->a:I

    sub-int/2addr v15, v14

    add-int/lit8 v15, v15, -0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_5
    invoke-static {v13}, Laaax;->bK(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v12

    goto :goto_3

    :cond_6
    iget-object v12, v10, Lsmv;->b:Ljava/util/Set;

    :goto_3
    if-eqz v1, :cond_7

    iget-object v13, v10, Lsmv;->f:Ljava/util/List;

    invoke-static {v13}, Laaax;->bC(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v13

    goto :goto_4

    :cond_7
    iget-object v13, v10, Lsmv;->f:Ljava/util/List;

    :goto_4
    if-eqz v1, :cond_8

    invoke-direct {v0, v4, v9}, Lqhm;->k(Lnqr;Landroid/util/Size;)Lsmu;

    move-result-object v14

    goto :goto_5

    :cond_8
    invoke-direct {v0, v6, v9, v7}, Lqhm;->l(Lnqu;Landroid/util/Size;Ladgi;)Lsmu;

    move-result-object v14

    :goto_5
    if-eqz v1, :cond_9

    invoke-direct {v0, v6, v9, v7}, Lqhm;->l(Lnqu;Landroid/util/Size;Ladgi;)Lsmu;

    move-result-object v7

    goto :goto_6

    :cond_9
    invoke-direct {v0, v4, v9}, Lqhm;->k(Lnqr;Landroid/util/Size;)Lsmu;

    move-result-object v7

    :goto_6
    move-object v15, v7

    const/16 v16, 0x0

    const/16 v17, 0x1e3d

    move v7, v11

    move-object v11, v12

    const/4 v12, 0x0

    invoke-static/range {v10 .. v17}, Lsmv;->a(Lsmv;Ljava/util/Set;ILjava/util/List;Lsmu;Lsmu;II)Lsmv;

    move-result-object v9

    const/4 v10, 0x6

    const/4 v11, 0x5

    if-eqz v1, :cond_a

    new-instance v12, Lwxs;

    new-instance v13, Lkoy;

    invoke-direct {v13, v6, v11}, Lkoy;-><init>(Ljava/lang/Object;I)V

    invoke-direct {v12, v9, v13}, Lwxs;-><init>(Lsmv;Ladgn;)V

    goto :goto_7

    :cond_a
    new-instance v12, Lwxs;

    new-instance v13, Lkoy;

    invoke-direct {v13, v6, v10}, Lkoy;-><init>(Ljava/lang/Object;I)V

    invoke-direct {v12, v9, v13}, Lwxs;-><init>(Lsmv;Ladgn;)V

    :goto_7
    invoke-virtual {v6}, Lqhr;->k()F

    move-result v13

    if-eqz v1, :cond_b

    const/high16 v14, 0x3f800000    # 1.0f

    sub-float v13, v14, v13

    :cond_b
    invoke-virtual {v12, v13}, Lwxs;->j(F)V

    iget-object v13, v0, Lqhm;->A:Luep;

    if-eqz v13, :cond_f

    iget-object v8, v0, Lqhm;->p:Ladep;

    invoke-virtual {v6}, Lqhr;->x()Z

    move-result v14

    invoke-static {v13, v8}, Ltqz;->eR(Luep;Ladep;)Ladlm;

    move-result-object v8

    if-eqz v14, :cond_c

    invoke-virtual {v6}, Lqhr;->hq()Lufv;

    move-result-object v13

    invoke-static {v13}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object v13

    new-instance v14, Lgmf;

    invoke-direct {v14, v13, v11}, Lgmf;-><init>(Ljava/lang/Object;I)V

    new-instance v13, Lgmf;

    invoke-direct {v13, v14, v10}, Lgmf;-><init>(Ljava/lang/Object;I)V

    new-instance v10, Lqhj;

    invoke-direct {v10, v12, v1, v5}, Lqhj;-><init>(Lwxs;ZLadel;)V

    new-instance v14, Ladqn;

    const/4 v15, 0x4

    invoke-direct {v14, v13, v10, v15}, Ladqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    new-instance v10, Lknt;

    const/16 v13, 0x8

    invoke-direct {v10, v14, v5, v13, v5}, Lknt;-><init>(Ladqc;Ladel;I[B)V

    const/4 v13, 0x3

    invoke-static {v8, v5, v7, v10, v13}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    :cond_c
    invoke-virtual {v6}, Lqhr;->n()Lufv;

    move-result-object v10

    sget-object v13, Ladsb;->a:Ladsc;

    invoke-static {v10, v8, v13}, Ltqz;->eG(Lufv;Ladlm;Ladsc;)Ladsh;

    move-result-object v23

    invoke-virtual {v6}, Lnqu;->h()Lsmq;

    move-result-object v10

    if-eqz v10, :cond_e

    new-instance v14, Lwp;

    iget-object v10, v10, Lsmq;->c:Lejf;

    invoke-direct {v14, v10, v5, v11}, Lwp;-><init>(Leje;Ladel;I)V

    new-instance v5, Ladpy;

    invoke-direct {v5, v14}, Ladpy;-><init>(Ladgm;)V

    invoke-static {v5}, Ladhh;->M(Ladqc;)Ladqc;

    move-result-object v5

    invoke-virtual {v6}, Lnqu;->h()Lsmq;

    move-result-object v10

    if-eqz v10, :cond_d

    iget-object v10, v10, Lsmq;->c:Lejf;

    invoke-virtual {v10}, Leje;->a()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    if-eqz v10, :cond_d

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    goto :goto_8

    :cond_d
    move v11, v7

    :goto_8
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    invoke-static {v5, v8, v13, v10}, Ladhh;->C(Ladqc;Ladlm;Ladsc;Ljava/lang/Object;)Ladsh;

    move-result-object v5

    goto :goto_9

    :cond_e
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v5}, Ladsk;->a(Ljava/lang/Object;)Ladsj;

    move-result-object v5

    :goto_9
    move-object/from16 v24, v5

    invoke-virtual {v6}, Lqhr;->m()Lufv;

    move-result-object v5

    invoke-static {v5, v8, v13}, Ltqz;->eG(Lufv;Ladlm;Ladsc;)Ladsh;

    move-result-object v25

    new-instance v18, Lqho;

    invoke-virtual {v4}, Lnqr;->b()Lnqq;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v6}, Lqhr;->o()Ljava/lang/Integer;

    move-result-object v26

    invoke-virtual {v6}, Lqhr;->q()Ljava/lang/Integer;

    move-result-object v27

    invoke-virtual {v6}, Lqhr;->p()Ljava/lang/Integer;

    move-result-object v28

    new-instance v5, Lqhg;

    invoke-direct {v5, v0, v4, v1, v7}, Lqhg;-><init>(Lqhm;Lnqr;ZI)V

    const/16 v22, 0x1

    move-object/from16 v29, v5

    move-object/from16 v20, v9

    move-object/from16 v21, v12

    invoke-direct/range {v18 .. v29}, Lqho;-><init>(Lnqq;Lsmv;Lwxs;ILadsh;Ladsh;Ladsh;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ladfx;)V

    move-object/from16 v5, v18

    :goto_a
    if-eqz v5, :cond_0

    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    invoke-static {v2}, Lyny;->aw(Ljava/util/Collection;)Lyeh;

    move-result-object v0

    return-object v0
.end method

.method private final n()Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lqhm;->x:Ladca;

    invoke-interface {p0}, Ladca;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public final a()Lufv;
    .locals 0

    iget-object p0, p0, Lqhm;->v:Lufv;

    return-object p0
.end method

.method public final b()Lufv;
    .locals 0

    iget-object p0, p0, Lqhm;->u:Lufv;

    return-object p0
.end method

.method public final c()Ladsh;
    .locals 0

    iget-object p0, p0, Lqhm;->g:Ladsh;

    return-object p0
.end method

.method public final d()V
    .locals 10

    iget-object v0, p0, Lqhm;->k:Ladsj;

    invoke-virtual {v0}, Ladsj;->c()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lqhq;

    const/4 v8, 0x0

    const/16 v9, 0x1fb

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v2 .. v9}, Lqhq;->a(Lqhq;Lyeh;Lyeh;ZZLandroid/graphics/Rect;Lnqq;I)Lqhq;

    move-result-object v1

    invoke-virtual {v0, v1}, Ladsj;->e(Ljava/lang/Object;)V

    iget-object v0, p0, Lqhm;->A:Luep;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Luep;->close()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lqhm;->A:Luep;

    return-void
.end method

.method public final synthetic e()V
    .locals 2

    sget-wide v0, Ladjv;->a:J

    const/16 v0, 0x9c4

    sget-object v1, Ladjx;->c:Ladjx;

    invoke-static {v0, v1}, Ladhc;->D(ILadjx;)J

    move-result-wide v0

    invoke-interface {p0, v0, v1}, Lqhp;->g(J)V

    return-void
.end method

.method public final synthetic f(I)V
    .locals 2

    sget-wide v0, Ladjv;->a:J

    sget-object v0, Ladjx;->c:Ladjx;

    invoke-static {p1, v0}, Ladhc;->D(ILadjx;)J

    move-result-wide v0

    invoke-interface {p0, v0, v1}, Lqhp;->g(J)V

    return-void
.end method

.method public final g(J)V
    .locals 18

    move-object/from16 v1, p0

    iget-object v0, v1, Lqhm;->q:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, v1, Lqhm;->r:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v4, Lkgm;

    iget-object v5, v1, Lqhm;->y:Lufv;

    iget-object v6, v1, Lqhm;->E:Ltit;

    invoke-virtual {v6}, Ltit;->A()Z

    move-result v7

    invoke-interface {v5}, Lufv;->d()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-static {v2, v4, v7, v8}, Lqhm;->i(ZLkgm;ZZ)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    invoke-virtual {v6}, Ltit;->A()Z

    invoke-interface {v5}, Lufv;->d()Ljava/lang/Object;

    return-void

    :cond_0
    iget-object v0, v1, Lqhm;->A:Luep;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Luep;->close()V

    :cond_1
    new-instance v0, Luep;

    invoke-direct {v0}, Luep;-><init>()V

    iput-object v0, v1, Lqhm;->A:Luep;

    iget-object v2, v1, Lqhm;->z:Landroid/view/View;

    if-nez v2, :cond_2

    iget-object v2, v1, Lqhm;->D:Ltit;

    const v3, 0x7f0a042c

    invoke-virtual {v2, v3}, Ltit;->d(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/ViewStub;

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lqhm;->z:Landroid/view/View;

    :cond_2
    iget-object v2, v1, Lqhm;->b:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsql;

    iget-object v3, v1, Lqhm;->C:Lklm;

    sget-object v4, Lkkh;->b:Lkiz;

    invoke-virtual {v3, v4}, Lklm;->q(Lkiz;)Z

    move-result v3

    const/4 v6, 0x2

    const/4 v4, 0x1

    const/4 v7, 0x0

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Lsql;->f()Z

    move-result v2

    if-eqz v2, :cond_3

    new-array v2, v6, [Lnqq;

    sget-object v3, Lqsy;->bI:Lqto;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v3}, Lqhm;->j(Lqto;)Lnqq;

    move-result-object v3

    aput-object v3, v2, v7

    sget-object v3, Lqsy;->bJ:Lqto;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v3}, Lqhm;->j(Lqto;)Lnqq;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v2}, Laaax;->C([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-array v3, v6, [Lnqq;

    sget-object v5, Lqsy;->bK:Lqto;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v5}, Lqhm;->j(Lqto;)Lnqq;

    move-result-object v5

    aput-object v5, v3, v7

    sget-object v5, Lqsy;->bL:Lqto;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v1, v5}, Lqhm;->j(Lqto;)Lnqq;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v3}, Laaax;->C([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    goto :goto_1

    :cond_3
    iget-object v2, v1, Lqhm;->s:Lugh;

    sget-object v3, Lqhm;->m:Ljava/util/List;

    invoke-interface {v2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    sget-object v5, Lljz;->a:Lljz;

    if-ne v2, v5, :cond_4

    sget-object v2, Lqhm;->o:Ljava/util/List;

    goto :goto_0

    :cond_4
    sget-object v2, Lqhm;->n:Ljava/util/List;

    :goto_0
    move-object/from16 v17, v3

    move-object v3, v2

    move-object/from16 v2, v17

    :goto_1
    iget-object v5, v1, Lqhm;->k:Ladsj;

    new-instance v8, Lqhq;

    invoke-direct {v1, v2, v4}, Lqhm;->m(Ljava/util/List;Z)Lyeh;

    move-result-object v9

    invoke-direct {v1, v3, v7}, Lqhm;->m(Ljava/util/List;Z)Lyeh;

    move-result-object v10

    iget-object v2, v1, Lqhm;->c:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    xor-int/lit8 v11, v2, 0x1

    new-instance v12, Lqba;

    const/4 v2, 0x3

    invoke-direct {v12, v1, v2}, Lqba;-><init>(Ljava/lang/Object;I)V

    iget-object v3, v1, Lqhm;->d:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v13, v3

    check-cast v13, Landroid/graphics/Rect;

    new-instance v14, Lqba;

    const/4 v3, 0x4

    invoke-direct {v14, v1, v3}, Lqba;-><init>(Ljava/lang/Object;I)V

    new-instance v15, Lqhh;

    invoke-direct {v15, v1, v7}, Lqhh;-><init>(Ljava/lang/Object;I)V

    const/16 v16, 0x44

    invoke-direct/range {v8 .. v16}, Lqhq;-><init>(Lyeh;Lyeh;ZLadgi;Landroid/graphics/Rect;Ladgi;Ladfx;I)V

    invoke-virtual {v5, v8}, Ladsj;->e(Ljava/lang/Object;)V

    invoke-virtual {v5}, Ladsj;->c()Ljava/lang/Object;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Lqhq;

    const/4 v14, 0x0

    const/16 v15, 0x1fb

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v8 .. v15}, Lqhq;->a(Lqhq;Lyeh;Lyeh;ZZLandroid/graphics/Rect;Lnqq;I)Lqhq;

    move-result-object v3

    invoke-virtual {v5, v3}, Ladsj;->e(Ljava/lang/Object;)V

    iget-object v3, v1, Lqhm;->p:Ladep;

    invoke-static {v0, v3}, Ltqz;->eR(Luep;Ladep;)Ladlm;

    move-result-object v8

    new-instance v0, Lara;

    const/4 v4, 0x0

    const/16 v5, 0x8

    move v9, v2

    move-wide/from16 v2, p1

    invoke-direct/range {v0 .. v5}, Lara;-><init>(Lqhm;JLadel;I)V

    const/4 v2, 0x0

    invoke-static {v8, v2, v7, v0, v9}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    new-instance v0, Lqhl;

    invoke-direct {v0, v1, v2, v7}, Lqhl;-><init>(Lqhm;Ladel;I)V

    invoke-static {v8, v2, v7, v0, v9}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    new-instance v0, Lqhl;

    invoke-direct {v0, v1, v2, v6, v2}, Lqhl;-><init>(Lqhm;Ladel;I[C)V

    invoke-static {v8, v2, v7, v0, v9}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    return-void
.end method

.method public final h(Lnqq;)Z
    .locals 1

    sget-object v0, Lnqq;->h:Lnqq;

    if-ne p1, v0, :cond_qa_b

    const/4 p0, 0x1

    return p0

    :cond_qa_b
    sget-object v0, Lnqq;->b:Lnqq;

    if-ne p1, v0, :cond_qa_i

    const/4 p0, 0x1

    return p0

    :cond_qa_i
    sget-object v0, Lnqq;->i:Lnqq;

    if-ne p1, v0, :cond_qa_j

    const/4 p0, 0x1

    return p0

    :cond_qa_j
    sget-object v0, Lnqq;->j:Lnqq;

    if-ne p1, v0, :cond_orig_h

    const/4 p0, 0x1

    return p0

    :cond_orig_h
    invoke-direct {p0}, Lqhm;->n()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnqr;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-virtual {p0}, Lnqr;->a()Lnqp;

    move-result-object p0

    invoke-virtual {p0}, Lnqp;->a()Z

    move-result p0

    return p0
.end method
