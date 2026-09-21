.class public Lnrn;
.super Lqhr;
.source "PG"


# static fields
.field public static final c:Lykq;


# instance fields
.field private final A:Lrex;

.field private final B:Ladvz;

.field public final d:Luer;

.field public final e:Lufv;

.field public final f:Lugh;

.field public final g:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final h:Lejf;

.field public final i:Ljava/lang/Runnable;

.field public j:Landroid/view/View;

.field public k:Lsmy;

.field public l:Luep;

.field public m:Luep;

.field public n:Z

.field public o:Landroidx/compose/ui/platform/ComposeView;

.field public p:Ljava/lang/Float;

.field public final q:Lrdw;

.field private final r:Lugh;

.field private final s:Lufv;

.field private final t:Lufv;

.field private final u:Lj$/util/Optional;

.field private final v:Lufv;

.field private w:Luep;

.field private x:Lsmq;

.field private final y:Lhze;

.field private final z:Lklm;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "nrn"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnrn;->c:Lykq;

    return-void
.end method

.method public constructor <init>(Ladvz;Lufv;Lhze;Lklm;Lugh;Luer;Lrex;Lufv;Lqtd;Lrdw;Lj$/util/Optional;)V
    .locals 2

    invoke-direct {p0}, Lqhr;-><init>()V

    new-instance v0, Lufn;

    const-string v1, ""

    invoke-direct {v0, v1}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnrn;->f:Lugh;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lnrn;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnrn;->h:Lejf;

    iput-object p1, p0, Lnrn;->B:Ladvz;

    iput-object p11, p0, Lnrn;->u:Lj$/util/Optional;

    iput-object p2, p0, Lnrn;->e:Lufv;

    iput-object p3, p0, Lnrn;->y:Lhze;

    iput-object p4, p0, Lnrn;->z:Lklm;

    iput-object p5, p0, Lnrn;->r:Lugh;

    iput-object p6, p0, Lnrn;->d:Luer;

    iput-object p7, p0, Lnrn;->A:Lrex;

    iput-object p8, p0, Lnrn;->v:Lufv;

    sget-object p2, Lqsy;->br:Lqtm;

    invoke-virtual {p9, p2}, Lqtd;->a(Lqsw;)Lugh;

    move-result-object p2

    iput-object p2, p0, Lnrn;->t:Lufv;

    iput-object p10, p0, Lnrn;->q:Lrdw;

    iget-object p1, p1, Ladvz;->c:Ljava/lang/Object;

    new-instance p2, Lndg;

    const/4 p3, 0x4

    invoke-direct {p2, p3}, Lndg;-><init>(I)V

    new-instance p3, Lufy;

    invoke-direct {p3, p1, p2, p1}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {p3}, Lufr;->a(Lufv;)Lufv;

    move-result-object p1

    iput-object p1, p0, Lnrn;->s:Lufv;

    new-instance p1, Lmyz;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p10, p2}, Lmyz;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    iput-object p1, p0, Lnrn;->i:Ljava/lang/Runnable;

    return-void
.end method

.method public static l(F)F
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr p0, v1

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Laaaq;->aH(FFF)F

    move-result p0

    return p0
.end method

.method private final u(Z)V
    .locals 0

    iget-object p0, p0, Lnrn;->h:Lejf;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lejf;->i(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lula;
    .locals 6

    iget-object v0, p0, Lnrn;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p1, p0, Lnrn;->j:Landroid/view/View;

    new-instance v0, Luep;

    invoke-direct {v0}, Luep;-><init>()V

    iput-object v0, p0, Lnrn;->l:Luep;

    const v0, 0x7f0a064d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/compose/ui/platform/ComposeView;

    iput-object p1, p0, Lnrn;->o:Landroidx/compose/ui/platform/ComposeView;

    iget-object p1, p0, Lnrn;->B:Ladvz;

    iget-object v0, p0, Lnrn;->y:Lhze;

    invoke-virtual {p1, v0}, Ladvz;->s(Lhze;)V

    iget-object p1, p0, Lnrn;->u:Lj$/util/Optional;

    new-instance v0, Lmkt;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lmkt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p1

    iget-object v0, v0, Lmkt;->a:Ljava/lang/Object;

    check-cast p1, Lufv;

    move-object v2, v0

    check-cast v2, Lnrn;

    iget-object v3, v2, Lnrn;->l:Luep;

    invoke-static {p1}, Lufr;->a(Lufv;)Lufv;

    move-result-object p1

    new-instance v4, Lnrb;

    const/4 v5, 0x4

    invoke-direct {v4, v0, v5}, Lnrb;-><init>(Ljava/lang/Object;I)V

    iget-object v0, v2, Lnrn;->d:Luer;

    invoke-interface {p1, v4, v0}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object p1

    invoke-virtual {v3, p1}, Luep;->e(Lula;)V

    :cond_0
    new-instance p1, Lnht;

    invoke-direct {p1, p0, v1}, Lnht;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot bind multiple times."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final declared-synchronized d()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnrn;->w:Luep;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Luep;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lnrn;->w:Luep;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final e()V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnrn;->u(Z)V

    iget-object v1, p0, Lnrn;->B:Ladvz;

    invoke-virtual {v1, v0}, Ladvz;->q(I)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Ladvz;->r(F)V

    iget-object p0, p0, Lnrn;->r:Lugh;

    invoke-interface {p0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    iput-object v1, v0, Lnql;->h:Lj$/util/Optional;

    invoke-interface {p0, v0}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized g()V
    .locals 5

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lnqu;->j()V

    iget-object v0, p0, Lnrn;->w:Luep;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lnrn;->l:Luep;

    invoke-virtual {v0}, Luep;->d()Luep;

    move-result-object v0

    iput-object v0, p0, Lnrn;->w:Luep;

    iget-object v1, p0, Lnrn;->s:Lufv;

    new-instance v2, Lnrb;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Lnrb;-><init>(Ljava/lang/Object;I)V

    iget-object v3, p0, Lnrn;->d:Luer;

    invoke-interface {v1, v2, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object v0, p0, Lnrn;->w:Luep;

    new-instance v1, Lmmf;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Lmmf;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object v0, p0, Lnrn;->t:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnrn;->v:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnqm;

    iget-object v0, v0, Lnqm;->h:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v0

    invoke-direct {p0, v0}, Lnrn;->u(Z)V

    :cond_1
    iget-object v0, p0, Lnrn;->z:Lklm;

    sget-object v1, Lkld;->b:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lnrn;->w:Luep;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p0, Lnrn;->e:Lufv;

    new-instance v2, Lnqh;

    const/4 v4, 0x7

    invoke-direct {v2, p0, v4}, Lnqh;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v2, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    :cond_2
    iget-object v0, p0, Lnrn;->j:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public final h()Lsmq;
    .locals 0

    iget-object p0, p0, Lnrn;->x:Lsmq;

    return-object p0
.end method

.method protected final i()Lsmy;
    .locals 15

    iget-object v0, p0, Lnrn;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lsmq;

    const v2, 0x7f1300c1

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lmcc;

    const/16 v4, 0xb

    invoke-direct {v3, p0, v4}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v4, p0, Lnrn;->h:Lejf;

    invoke-direct {v1, v2, v3, v4}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V

    iput-object v1, p0, Lnrn;->x:Lsmq;

    new-instance v1, Lsmy;

    iget-object v2, p0, Lnrn;->o:Landroidx/compose/ui/platform/ComposeView;

    new-instance v3, Lsmv;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v4, 0x8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v4, 0xc

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v4, 0x10

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/16 v4, 0x14

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v4, 0x18

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v11, 0x1c

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v12, 0x20

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x24

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/16 v14, 0x28

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v4, v11, v12, v13, v14}, [Ljava/lang/Integer;

    move-result-object v11

    invoke-static/range {v5 .. v11}, Lyfm;->M(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lyfm;

    move-result-object v5

    const v4, 0x7f070925

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v6, v0

    sget v0, Lyeh;->d:I

    sget-object v8, Lyil;->a:Lyeh;

    iget-object v0, p0, Lnrn;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v7, 0x7f070ca5

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v9, Lsmu;

    const v10, 0x7f1303c8

    invoke-virtual {v0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Landroid/util/Size;

    invoke-direct {v11, v4, v4}, Landroid/util/Size;-><init>(II)V

    const v4, 0x7f060c5f

    invoke-virtual {v0, v4}, Landroid/content/Context;->getColor(I)I

    move-result v0

    const v4, 0x7f080366

    invoke-direct {v9, v4, v10, v11, v0}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    iget-object v0, p0, Lnrn;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v10, Lsmu;

    const v7, 0x7f1301ce

    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v11, Landroid/util/Size;

    invoke-direct {v11, v4, v4}, Landroid/util/Size;-><init>(II)V

    const v4, 0x7f060c60

    invoke-virtual {v0, v4}, Landroid/content/Context;->getColor(I)I

    move-result v0

    const v4, 0x7f080365

    invoke-direct {v10, v4, v7, v11, v0}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    new-instance v11, Lndq;

    const/16 v0, 0xf

    invoke-direct {v11, p0, v0}, Lndq;-><init>(Ljava/lang/Object;I)V

    const/16 v4, 0x29

    const/4 v7, 0x3

    invoke-direct/range {v3 .. v11}, Lsmv;-><init>(ILjava/util/Set;FILjava/util/List;Lsmu;Lsmu;Ladgi;)V

    iget-object v0, p0, Lnrn;->x:Lsmq;

    iget-object v4, p0, Lnqu;->b:Lsbl;

    invoke-direct {v1, v2, v3, v0, v4}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;)V

    iput-object v1, p0, Lnrn;->k:Lsmy;

    new-instance v0, Lnrc;

    const/4 v2, 0x6

    invoke-direct {v0, p0, v2}, Lnrc;-><init>(Lnqu;I)V

    invoke-virtual {v1, v0}, Lsmy;->e(Lsnx;)V

    iget-object p0, p0, Lnrn;->k:Lsmy;

    return-object p0
.end method

.method public final k()F
    .locals 2

    iget-object p0, p0, Lnrn;->v:Lufv;

    invoke-interface {p0}, Lufv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnqm;

    iget-object p0, p0, Lnqm;->h:Lj$/util/Optional;

    const/4 v0, 0x1

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    invoke-static {p0}, Lnrn;->l(F)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-static {p0}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    :cond_0
    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, v0}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0
.end method

.method public final n()Lufv;
    .locals 0

    iget-object p0, p0, Lnrn;->f:Lugh;

    return-object p0
.end method

.method public final r(F)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lnrn;->v:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnqm;

    iget-object v0, v0, Lnqm;->h:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isEmpty()Z

    move-result v0

    iget-object p0, p0, Lnrn;->j:Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f130ab8

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const v0, 0x7f130ab9

    invoke-virtual {p0, v0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final s(FZLsnw;)V
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lnrn;->t(FZLsnw;)V

    return-void
.end method

.method public final t(FZLsnw;)V
    .locals 4

    :cond_0
    add-float/2addr p1, p1

    iget-object p2, p0, Lnrn;->B:Ladvz;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Ladvz;->q(I)V

    const/high16 v1, -0x40800000    # -1.0f

    add-float/2addr p1, v1

    invoke-virtual {p2, p1}, Ladvz;->r(F)V

    iget-object p2, p0, Lnrn;->r:Lugh;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    iput-object v2, v1, Lnql;->h:Lj$/util/Optional;

    invoke-interface {p2, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p2, p0, Lnrn;->A:Lrex;

    const/4 v1, 0x4

    float-to-double v2, p1

    invoke-virtual {p2, p3, v1, v2, v3}, Lrex;->E(Lsnw;ID)V

    invoke-direct {p0, v0}, Lnrn;->u(Z)V

    sget-object p1, Lsnw;->c:Lsnw;

    if-ne p3, p1, :cond_1

    iput-boolean v0, p0, Lnrn;->n:Z

    :cond_1
    :goto_0
    return-void
.end method
