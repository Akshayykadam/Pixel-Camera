.class public Lqaa;
.super Lqhr;
.source "PG"

# interfaces
.implements Lpyx;


# static fields
.field public static final c:Lykq;


# instance fields
.field private A:Luep;

.field private B:Lsmq;

.field private final C:Lrex;

.field public final d:Lput;

.field public final e:Lugh;

.field public final f:Luer;

.field public final g:Lejf;

.field public final h:Lugh;

.field public final i:Lugh;

.field public final j:Lqbm;

.field public final k:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Z

.field public o:Luep;

.field public p:Lsmy;

.field public q:Lrdw;

.field public final r:Lrdw;

.field private final s:Lufv;

.field private final t:Lugh;

.field private final u:Lufv;

.field private final v:Lj$/util/Optional;

.field private w:Landroidx/compose/ui/platform/ComposeView;

.field private x:Z

.field private final y:Lugh;

.field private z:Luep;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "qaa"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lqaa;->c:Lykq;

    return-void
.end method

.method public constructor <init>(Lput;Lugh;Lufv;Lugh;Luer;Lrex;Lufv;Lrdw;Lj$/util/Optional;)V
    .locals 3

    invoke-direct {p0}, Lqhr;-><init>()V

    new-instance v0, Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqaa;->g:Lejf;

    new-instance v0, Lufn;

    const-string v2, ""

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqaa;->h:Lugh;

    new-instance v0, Lufn;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqaa;->i:Lugh;

    new-instance v0, Lqbm;

    invoke-direct {v0}, Lqbm;-><init>()V

    iput-object v0, p0, Lqaa;->j:Lqbm;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lqaa;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-boolean v1, p0, Lqaa;->x:Z

    new-instance v0, Lufn;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqaa;->y:Lugh;

    iput-boolean v1, p0, Lqaa;->n:Z

    const/16 v0, 0x32

    invoke-static {v0}, Lqae;->c(I)Lyeh;

    move-result-object v0

    invoke-static {v0}, Lqae;->d(Lyeh;)Lyfm;

    move-result-object v1

    invoke-static {v1, v0}, Lqae;->a(Lyfm;Lyeh;)Lqbj;

    move-result-object v1

    invoke-static {v0}, Lqae;->e(Lyeh;)Lrdw;

    move-result-object v0

    new-instance v2, Lqbk;

    invoke-direct {v2, v1, v0}, Lqbk;-><init>(Lqbj;Lrdw;)V

    iget-object v0, v2, Lqbk;->b:Lrdw;

    iput-object v0, p0, Lqaa;->q:Lrdw;

    iput-object p1, p0, Lqaa;->d:Lput;

    iput-object p2, p0, Lqaa;->e:Lugh;

    iput-object p3, p0, Lqaa;->s:Lufv;

    iput-object p4, p0, Lqaa;->t:Lugh;

    iput-object p5, p0, Lqaa;->f:Luer;

    iput-object p6, p0, Lqaa;->C:Lrex;

    iput-object p7, p0, Lqaa;->u:Lufv;

    iput-object p8, p0, Lqaa;->r:Lrdw;

    iput-object p9, p0, Lqaa;->v:Lj$/util/Optional;

    return-void
.end method


# virtual methods
.method public final A(Lqag;)Z
    .locals 0

    iget-boolean p1, p1, Lqag;->c:Z

    if-eqz p1, :cond_0

    iget-object p0, p0, Lqaa;->e:Lugh;

    invoke-interface {p0}, Lugh;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnql;

    invoke-virtual {p0}, Lnql;->a()Lnqm;

    move-result-object p0

    iget-object p0, p0, Lnqm;->f:Lj$/util/Optional;

    invoke-virtual {p0}, Lj$/util/Optional;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final a(Landroid/view/View;)Lula;
    .locals 5

    iget-object v0, p0, Lqaa;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p1, p0, Lqaa;->l:Landroid/view/View;

    new-instance v0, Luep;

    invoke-direct {v0}, Luep;-><init>()V

    iput-object v0, p0, Lqaa;->o:Luep;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    const v3, 0x7f0a01a7

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lqaa;->m:Landroid/view/View;

    const v0, 0x7f0a02cd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/compose/ui/platform/ComposeView;

    iput-object p1, p0, Lqaa;->w:Landroidx/compose/ui/platform/ComposeView;

    iget-object p1, p0, Lqaa;->v:Lj$/util/Optional;

    new-instance v0, Lpzz;

    invoke-direct {v0, p0, v1}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-ne v2, v1, :cond_0

    invoke-virtual {p1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p1

    iget-object v0, v0, Lpzz;->a:Ljava/lang/Object;

    check-cast p1, Lufv;

    move-object v1, v0

    check-cast v1, Lqaa;

    iget-object v2, v1, Lqaa;->o:Luep;

    invoke-static {p1}, Lufr;->a(Lufv;)Lufv;

    move-result-object p1

    new-instance v3, Lpzh;

    const/16 v4, 0x8

    invoke-direct {v3, v0, v4}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v0, v1, Lqaa;->f:Luer;

    invoke-interface {p1, v3, v0}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object p1

    invoke-virtual {v2, p1}, Luep;->e(Lula;)V

    :cond_0
    new-instance p1, Lpzf;

    const/4 v0, 0x4

    invoke-direct {p1, p0, v0}, Lpzf;-><init>(Ljava/lang/Object;I)V

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
    iget-object v0, p0, Lqaa;->z:Luep;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Luep;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lqaa;->z:Luep;
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
    .locals 4

    iget-object v0, p0, Lqaa;->d:Lput;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lput;->b(Z)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqaa;->x:Z

    iget-object v1, p0, Lqaa;->e:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v3

    iput-object v3, v2, Lnql;->f:Lj$/util/Optional;

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lqaa;->g:Lejf;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lejf;->i(Ljava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized g()V
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lnqu;->j()V

    iget-object v0, p0, Lqaa;->y:Lugh;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v3, v0, :cond_0

    move v4, v1

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    iget-object v5, p0, Lqaa;->l:Landroid/view/View;

    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    if-eq v3, v0, :cond_1

    move v1, v2

    :cond_1
    iget-object v2, p0, Lqaa;->m:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    iget-object v0, p0, Lqaa;->s:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqag;

    invoke-virtual {p0, v0}, Lqaa;->A(Lqag;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lqaa;->k()F

    move-result v0

    invoke-static {v1, v0}, Lsmy;->i(Lsmy;F)V

    :cond_2
    iget-object v0, p0, Lqaa;->z:Luep;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    monitor-exit p0

    return-void

    :cond_3
    :try_start_1
    iget-object v0, p0, Lqaa;->o:Luep;

    invoke-virtual {v0}, Luep;->d()Luep;

    move-result-object v0

    iput-object v0, p0, Lqaa;->z:Luep;

    iget-object v1, p0, Lqaa;->s:Lufv;

    new-instance v2, Lpzh;

    const/4 v4, 0x5

    invoke-direct {v2, p0, v4}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v4, p0, Lqaa;->f:Luer;

    invoke-interface {v1, v2, v4}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v0, v2}, Luep;->e(Lula;)V

    iget-object v0, p0, Lqaa;->z:Luep;

    new-instance v2, Lpez;

    const/16 v5, 0x10

    invoke-direct {v2, v5}, Lpez;-><init>(I)V

    invoke-static {v1, v2}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v1

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object v1

    new-instance v2, Lpzh;

    const/4 v5, 0x6

    invoke-direct {v2, p0, v5}, Lpzh;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v2, v4}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object v0, p0, Lqaa;->z:Luep;

    new-instance v1, Lpzf;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lpzf;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iput-boolean v3, p0, Lqaa;->n:Z

    iget-object v0, p0, Lqaa;->m:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lqaa;->m:Landroid/view/View;

    const v2, 0x7f1303e0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f1303dc

    const v3, 0x7f1303df

    invoke-static {v1, v2, v3, v0}, Lobf;->x(Landroid/view/View;IILjava/lang/String;)V

    iput-object v1, p0, Lqaa;->m:Landroid/view/View;
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

    iget-object p0, p0, Lqaa;->B:Lsmq;

    return-object p0
.end method

.method public final hq()Lufv;
    .locals 0

    iget-object p0, p0, Lqaa;->i:Lugh;

    return-object p0
.end method

.method protected final i()Lsmy;
    .locals 5

    iget-object v0, p0, Lqaa;->l:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/16 v1, 0x32

    invoke-static {v1}, Lqae;->b(I)Lqbk;

    move-result-object v1

    iget-object v2, v1, Lqbk;->b:Lrdw;

    iput-object v2, p0, Lqaa;->q:Lrdw;

    new-instance v2, Lsmq;

    const v3, 0x7f1300b8

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Lmcc;

    const/16 v4, 0x11

    invoke-direct {v3, p0, v4}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v4, p0, Lqaa;->g:Lejf;

    invoke-direct {v2, v0, v3, v4}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V

    iput-object v2, p0, Lqaa;->B:Lsmq;

    iget-object v0, v1, Lqbk;->a:Lqbj;

    new-instance v1, Lsmy;

    iget-object v2, p0, Lqaa;->w:Landroidx/compose/ui/platform/ComposeView;

    invoke-virtual {p0, v0}, Lqaa;->u(Lqbj;)Lsmv;

    move-result-object v0

    iget-object v3, p0, Lqaa;->B:Lsmq;

    iget-object v4, p0, Lnqu;->b:Lsbl;

    invoke-direct {v1, v2, v0, v3, v4}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;)V

    iput-object v1, p0, Lqaa;->p:Lsmy;

    new-instance v0, Lnrc;

    const/4 v2, 0x7

    invoke-direct {v0, p0, v2}, Lnrc;-><init>(Lnqu;I)V

    invoke-virtual {v1, v0}, Lsmy;->e(Lsnx;)V

    iget-object v0, p0, Lqaa;->o:Luep;

    new-instance v1, Lppl;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lppl;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lqaa;->f:Luer;

    iget-object v3, p0, Lqaa;->u:Lufv;

    invoke-interface {v3, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object p0, p0, Lqaa;->p:Lsmy;

    return-object p0
.end method

.method public final k()F
    .locals 4

    iget-object v0, p0, Lqaa;->e:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnql;

    invoke-virtual {v0}, Lnql;->a()Lnqm;

    move-result-object v0

    iget-object v0, v0, Lnqm;->f:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lqaa;->r(I)F

    move-result p0

    return p0

    :cond_0
    iget-object v0, p0, Lqaa;->j:Lqbm;

    invoke-virtual {v0}, Lqbm;->a()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_1

    const-wide/16 v2, 0x0

    cmpl-double v2, v0, v2

    if-lez v2, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lqaa;->r(I)F

    move-result p0

    return p0

    :cond_1
    const/high16 p0, 0x3f000000    # 0.5f

    return p0
.end method

.method public final l(Z)V
    .locals 1

    iget-object v0, p0, Lqaa;->y:Lugh;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v0, p1}, Lugh;->a(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lqaa;->n:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lqaa;->l:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnqu;->g()V

    :cond_0
    return-void
.end method

.method public final m()Lufv;
    .locals 0

    iget-object p0, p0, Lqaa;->y:Lugh;

    return-object p0
.end method

.method public final n()Lufv;
    .locals 0

    iget-object p0, p0, Lqaa;->h:Lugh;

    return-object p0
.end method

.method public final o()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f1303dc

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final p()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f1303e0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final q()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f1303df

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final r(I)F
    .locals 2

    iget-object p0, p0, Lqaa;->q:Lrdw;

    int-to-double v0, p1

    invoke-virtual {p0, v0, v1}, Lrdw;->o(D)D

    move-result-wide p0

    double-to-float p0, p0

    const/4 p1, 0x0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p0, p1, v0}, Laaaq;->aH(FFF)F

    move-result p0

    return p0
.end method

.method public final s(FZLsnw;)V
    .locals 3

    invoke-virtual {p0, p1}, Lqaa;->t(F)I

    move-result p1

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqaa;->h:Lugh;

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2, p3}, Lqaa;->v(IZLsnw;)V

    return-void
.end method

.method public final t(F)I
    .locals 3

    iget-object v0, p0, Lqaa;->d:Lput;

    invoke-interface {v0}, Lput;->a()Lufv;

    move-result-object v0

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/Range;

    iget-object p0, p0, Lqaa;->q:Lrdw;

    float-to-double v1, p1

    invoke-virtual {p0, v1, v2}, Lrdw;->n(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    long-to-int p0, p0

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {p0, p1, v0}, Laaaq;->aw(III)I

    move-result p0

    return p0
.end method

.method public final u(Lqbj;)Lsmv;
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lqaa;->w:Landroidx/compose/ui/platform/ComposeView;

    invoke-virtual {v2}, Landroidx/compose/ui/platform/ComposeView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    new-instance v3, Lsmv;

    iget v4, v1, Lqbj;->b:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    int-to-float v6, v4

    const v4, 0x7f0701b3

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v11, Lsmu;

    const v5, 0x7f1301c5

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v7, Landroid/util/Size;

    invoke-direct {v7, v4, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v4, v0, Lqaa;->l:Landroid/view/View;

    invoke-static {v4}, Ltqz;->bj(Landroid/view/View;)I

    move-result v4

    const v8, 0x7f080363

    invoke-direct {v11, v8, v5, v7, v4}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    const v4, 0x7f0703e1

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v12, Lsmu;

    const v5, 0x7f1303bf

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v7, Landroid/util/Size;

    invoke-direct {v7, v4, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v4, v0, Lqaa;->l:Landroid/view/View;

    invoke-static {v4}, Ltqz;->bj(Landroid/view/View;)I

    move-result v4

    const v8, 0x7f080362

    invoke-direct {v12, v8, v5, v7, v4}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    new-instance v13, Lqba;

    const/4 v4, 0x1

    invoke-direct {v13, v0, v4}, Lqba;-><init>(Ljava/lang/Object;I)V

    new-instance v4, Llaf;

    const/16 v5, 0xc

    const/4 v7, 0x0

    invoke-direct {v4, v0, v2, v5, v7}, Llaf;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    move-object/from16 v16, v4

    iget v4, v1, Lqbj;->a:I

    iget-object v5, v1, Lqbj;->c:Lyfm;

    iget-object v10, v1, Lqbj;->d:Lyeh;

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/high16 v7, 0x3f000000    # 0.5f

    const/4 v8, 0x0

    const/4 v9, 0x3

    invoke-direct/range {v3 .. v16}, Lsmv;-><init>(ILjava/util/Set;FFZILjava/util/List;Lsmu;Lsmu;Ladgi;ZILadgi;)V

    return-object v3
.end method

.method public final v(IZLsnw;)V
    .locals 2

    :cond_0
    iget-object p2, p0, Lqaa;->d:Lput;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lput;->b(Z)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lqaa;->x:Z

    invoke-virtual {p0, p1}, Lqaa;->y(I)V

    iget-object p0, p0, Lqaa;->C:Lrex;

    const/4 p2, 0x7

    int-to-double v0, p1

    invoke-virtual {p0, p3, p2, v0, v1}, Lrex;->E(Lsnw;ID)V

    return-void
.end method

.method public final declared-synchronized w(Z)V
    .locals 4

    monitor-enter p0

    iget-object v0, p0, Lqaa;->A:Luep;

    if-eqz p1, :cond_1

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    iget-object p1, p0, Lqaa;->o:Luep;

    invoke-virtual {p1}, Luep;->d()Luep;

    move-result-object p1

    iput-object p1, p0, Lqaa;->A:Luep;

    iget-object v0, p0, Lqaa;->s:Lufv;

    new-instance v1, Lpzh;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lqaa;->f:Luer;

    invoke-interface {v0, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {p1, v1}, Luep;->e(Lula;)V

    iget-object p1, p0, Lqaa;->A:Luep;

    new-instance v1, Lpez;

    const/16 v3, 0x10

    invoke-direct {v1, v3}, Lpez;-><init>(I)V

    invoke-static {v0, v1}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v0

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v1, Lpzh;

    const/4 v3, 0x6

    invoke-direct {v1, p0, v3}, Lpzh;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v0, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {p1, v0}, Luep;->e(Lula;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Luep;->close()V

    const/4 p1, 0x0

    iput-object p1, p0, Lqaa;->A:Luep;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_2
    :goto_1
    monitor-exit p0

    return-void
.end method

.method public final x()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final y(I)V
    .locals 3

    iget-object v0, p0, Lqaa;->s:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqag;

    iget v0, v0, Lqag;->b:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v2, p0, Lqaa;->d:Lput;

    invoke-interface {v2, v1}, Lput;->c(I)V

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lqaa;->t:Lugh;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lqaa;->e:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p1

    iput-object p1, v1, Lnql;->f:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lqaa;->i:Lugh;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p1

    invoke-interface {p0, p1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final z(ILqag;)V
    .locals 1

    iget-boolean v0, p0, Lqaa;->x:Z

    if-eqz v0, :cond_0

    iget p2, p2, Lqag;->b:I

    if-ge p1, p2, :cond_0

    iget-object p1, p0, Lqaa;->d:Lput;

    invoke-interface {p1, p2}, Lput;->c(I)V

    iget-object p0, p0, Lqaa;->t:Lugh;

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lugh;->a(Ljava/lang/Object;)V

    return-void

    :cond_0
    iget-object p0, p0, Lqaa;->t:Lugh;

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method
