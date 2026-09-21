.class public Lqbb;
.super Lqhr;
.source "PG"

# interfaces
.implements Lpyx;


# static fields
.field public static final c:Lykq;

.field private static final t:Lj$/time/Duration;


# instance fields
.field private final A:Lugh;

.field private B:Luep;

.field private C:Luep;

.field private D:Lsmq;

.field private final E:Lrex;

.field public final d:Lpus;

.field public final e:Lugh;

.field public final f:Luer;

.field public final g:Lejf;

.field public final h:Lugh;

.field public final i:Lugh;

.field public final j:Lqbm;

.field public final k:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public l:Lsmy;

.field public m:Landroid/view/View;

.field public n:Landroid/view/View;

.field public o:Z

.field public p:Luep;

.field public final q:Lqgu;

.field public r:Lrdw;

.field public final s:Lrdw;

.field private final u:Lufv;

.field private final v:Lugh;

.field private final w:Lufv;

.field private final x:Lj$/util/Optional;

.field private y:Landroidx/compose/ui/platform/ComposeView;

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "qbb"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lqbb;->c:Lykq;

    const-wide/16 v0, 0x64

    invoke-static {v0, v1}, Lj$/time/Duration;->ofMillis(J)Lj$/time/Duration;

    move-result-object v0

    sput-object v0, Lqbb;->t:Lj$/time/Duration;

    return-void
.end method

.method public constructor <init>(Lpus;Lugh;Lufv;Luer;Lugh;Lufv;Lrex;Lrdw;Lj$/util/Optional;)V
    .locals 4

    invoke-direct {p0}, Lqhr;-><init>()V

    new-instance v0, Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqbb;->g:Lejf;

    new-instance v0, Lufn;

    const-string v2, ""

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqbb;->h:Lugh;

    new-instance v0, Lufn;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqbb;->i:Lugh;

    new-instance v0, Lqgu;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lqbb;->q:Lqgu;

    new-instance v0, Lqbm;

    invoke-direct {v0}, Lqbm;-><init>()V

    iput-object v0, p0, Lqbb;->j:Lqbm;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lqbb;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-wide/32 v2, 0x186a0

    invoke-static {v2, v3}, Lqbg;->a(J)Lqbk;

    move-result-object v0

    iget-object v0, v0, Lqbk;->b:Lrdw;

    iput-object v0, p0, Lqbb;->r:Lrdw;

    iput-boolean v1, p0, Lqbb;->z:Z

    new-instance v0, Lufn;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lqbb;->A:Lugh;

    iput-boolean v1, p0, Lqbb;->o:Z

    iput-object p1, p0, Lqbb;->d:Lpus;

    iput-object p2, p0, Lqbb;->e:Lugh;

    iput-object p3, p0, Lqbb;->u:Lufv;

    iput-object p4, p0, Lqbb;->f:Luer;

    iput-object p5, p0, Lqbb;->v:Lugh;

    iput-object p6, p0, Lqbb;->w:Lufv;

    iput-object p7, p0, Lqbb;->E:Lrex;

    iput-object p8, p0, Lqbb;->s:Lrdw;

    iput-object p9, p0, Lqbb;->x:Lj$/util/Optional;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lula;
    .locals 5

    iget-object v0, p0, Lqbb;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p1, p0, Lqbb;->m:Landroid/view/View;

    new-instance v0, Luep;

    invoke-direct {v0}, Luep;-><init>()V

    iput-object v0, p0, Lqbb;->p:Luep;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a01a7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lqbb;->n:Landroid/view/View;

    const v0, 0x7f0a04c1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/compose/ui/platform/ComposeView;

    iput-object p1, p0, Lqbb;->y:Landroidx/compose/ui/platform/ComposeView;

    iget-object p1, p0, Lqbb;->x:Lj$/util/Optional;

    new-instance v0, Lpzz;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-ne v2, v1, :cond_0

    invoke-virtual {p1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p1

    iget-object v0, v0, Lpzz;->a:Ljava/lang/Object;

    check-cast p1, Lufv;

    move-object v1, v0

    check-cast v1, Lqbb;

    iget-object v2, v1, Lqbb;->p:Luep;

    invoke-static {p1}, Lufr;->a(Lufv;)Lufv;

    move-result-object p1

    new-instance v3, Lpzh;

    const/16 v4, 0xb

    invoke-direct {v3, v0, v4}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v0, v1, Lqbb;->f:Luer;

    invoke-interface {p1, v3, v0}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object p1

    invoke-virtual {v2, p1}, Luep;->e(Lula;)V

    :cond_0
    new-instance p1, Lpzf;

    const/4 v0, 0x5

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
    iget-object v0, p0, Lqbb;->B:Luep;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Luep;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lqbb;->B:Luep;
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

    iget-object v0, p0, Lqbb;->d:Lpus;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lpus;->b(Z)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqbb;->z:Z

    iget-object v1, p0, Lqbb;->v:Lugh;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lqbb;->e:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v3

    iput-object v3, v2, Lnql;->g:Lj$/util/Optional;

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lqbb;->g:Lejf;

    invoke-virtual {p0, v0}, Lejf;->i(Ljava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized g()V
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lnqu;->j()V

    iget-object v0, p0, Lqbb;->A:Lugh;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    const/4 v3, 0x1

    if-eq v3, v0, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    move v4, v1

    :goto_0
    iget-object v5, p0, Lqbb;->m:Landroid/view/View;

    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    if-eq v3, v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    iget-object v4, p0, Lqbb;->n:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    iget-object v0, p0, Lqbb;->u:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqbi;

    invoke-virtual {p0, v0}, Lqbb;->z(Lqbi;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lqbb;->k()F

    move-result v0

    invoke-static {v1, v0}, Lsmy;->i(Lsmy;F)V

    :cond_2
    iget-object v0, p0, Lqbb;->B:Luep;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    monitor-exit p0

    return-void

    :cond_3
    :try_start_1
    iget-object v0, p0, Lqbb;->p:Luep;

    invoke-virtual {v0}, Luep;->d()Luep;

    move-result-object v0

    iput-object v0, p0, Lqbb;->B:Luep;

    iget-object v1, p0, Lqbb;->u:Lufv;

    new-instance v4, Lpzh;

    const/16 v5, 0xa

    invoke-direct {v4, p0, v5}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v5, p0, Lqbb;->f:Luer;

    invoke-interface {v1, v4, v5}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v4

    invoke-virtual {v0, v4}, Luep;->e(Lula;)V

    iget-object v0, p0, Lqbb;->B:Luep;

    new-instance v4, Lpud;

    invoke-direct {v4, v2}, Lpud;-><init>(I)V

    invoke-static {v1, v4}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v1

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object v1

    new-instance v2, Lppl;

    const/16 v4, 0xe

    invoke-direct {v2, p0, v4}, Lppl;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v2, v5}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object v0, p0, Lqbb;->B:Luep;

    new-instance v1, Lpzf;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lpzf;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iput-boolean v3, p0, Lqbb;->o:Z

    iget-object v0, p0, Lqbb;->n:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lqbb;->n:Landroid/view/View;

    const v2, 0x7f1308ae

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f1308a9

    const v3, 0x7f1308ad

    invoke-static {v1, v2, v3, v0}, Lobf;->x(Landroid/view/View;IILjava/lang/String;)V

    iput-object v1, p0, Lqbb;->n:Landroid/view/View;
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

    iget-object p0, p0, Lqbb;->D:Lsmq;

    return-object p0
.end method

.method public final hq()Lufv;
    .locals 0

    iget-object p0, p0, Lqbb;->i:Lugh;

    return-object p0
.end method

.method protected final i()Lsmy;
    .locals 5

    const-wide/32 v0, 0x186a0

    invoke-static {v0, v1}, Lqbg;->a(J)Lqbk;

    move-result-object v0

    iget-object v1, p0, Lqbb;->y:Landroidx/compose/ui/platform/ComposeView;

    invoke-virtual {v1}, Landroidx/compose/ui/platform/ComposeView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lqbb;->y:Landroidx/compose/ui/platform/ComposeView;

    invoke-virtual {v2}, Ldbc;->f()V

    iget-object v2, v0, Lqbk;->b:Lrdw;

    iput-object v2, p0, Lqbb;->r:Lrdw;

    new-instance v2, Lsmq;

    const v3, 0x7f1300bf

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lmcc;

    const/16 v4, 0x12

    invoke-direct {v3, p0, v4}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v4, p0, Lqbb;->g:Lejf;

    invoke-direct {v2, v1, v3, v4}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V

    iput-object v2, p0, Lqbb;->D:Lsmq;

    iget-object v0, v0, Lqbk;->a:Lqbj;

    new-instance v1, Lsmy;

    iget-object v2, p0, Lqbb;->y:Landroidx/compose/ui/platform/ComposeView;

    invoke-virtual {p0, v0}, Lqbb;->u(Lqbj;)Lsmv;

    move-result-object v0

    iget-object v3, p0, Lqbb;->D:Lsmq;

    iget-object v4, p0, Lnqu;->b:Lsbl;

    invoke-direct {v1, v2, v0, v3, v4}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;)V

    iput-object v1, p0, Lqbb;->l:Lsmy;

    new-instance v0, Lnrc;

    const/16 v2, 0x8

    invoke-direct {v0, p0, v2}, Lnrc;-><init>(Lnqu;I)V

    invoke-virtual {v1, v0}, Lsmy;->e(Lsnx;)V

    iget-object v0, p0, Lqbb;->p:Luep;

    new-instance v1, Lpzh;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lqbb;->f:Luer;

    iget-object v3, p0, Lqbb;->w:Lufv;

    invoke-interface {v3, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object p0, p0, Lqbb;->l:Lsmy;

    return-object p0
.end method

.method public final k()F
    .locals 4

    iget-object v0, p0, Lqbb;->e:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnql;

    invoke-virtual {v0}, Lnql;->a()Lnqm;

    move-result-object v0

    iget-object v0, v0, Lnqm;->g:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lqbb;->r(J)F

    move-result p0

    return p0

    :cond_0
    iget-object v0, p0, Lqbb;->j:Lqbm;

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

    invoke-virtual {p0, v0, v1}, Lqbb;->r(J)F

    move-result p0

    return p0

    :cond_1
    const/high16 p0, 0x3f000000    # 0.5f

    return p0
.end method

.method public final l(Z)V
    .locals 1

    iget-object v0, p0, Lqbb;->A:Lugh;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v0, p1}, Lugh;->a(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lqbb;->o:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lqbb;->m:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnqu;->g()V

    :cond_0
    return-void
.end method

.method public final m()Lufv;
    .locals 0

    iget-object p0, p0, Lqbb;->A:Lugh;

    return-object p0
.end method

.method public final n()Lufv;
    .locals 0

    iget-object p0, p0, Lqbb;->h:Lugh;

    return-object p0
.end method

.method public final o()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f1308a9

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final p()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f1308ae

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final q()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f1308ad

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final r(J)F
    .locals 0

    iget-object p0, p0, Lqbb;->r:Lrdw;

    long-to-double p1, p1

    invoke-virtual {p0, p1, p2}, Lrdw;->o(D)D

    move-result-wide p0

    double-to-float p0, p0

    const/4 p1, 0x0

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p0, p1, p2}, Laaaq;->aH(FFF)F

    move-result p0

    return p0
.end method

.method public final s(FZLsnw;)V
    .locals 3

    invoke-virtual {p0, p1}, Lqbb;->t(F)J

    move-result-wide v0

    invoke-static {v0, v1}, Lqgu;->i(J)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lqbb;->h:Lugh;

    invoke-interface {v2, p1}, Lugh;->a(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, v1, p2, p3}, Lqbb;->v(JZLsnw;)V

    return-void
.end method

.method public final t(F)J
    .locals 8

    iget-object v0, p0, Lqbb;->d:Lpus;

    invoke-interface {v0}, Lpus;->a()Lufv;

    move-result-object v0

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/Range;

    iget-object p0, p0, Lqbb;->r:Lrdw;

    float-to-double v1, p1

    invoke-virtual {p0, v1, v2}, Lrdw;->n(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v0, v4, v6

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move v2, v0

    const-string v3, "min (%s) must be less than or equal to max (%s)"

    invoke-static/range {v2 .. v7}, Lyny;->bg(ZLjava/lang/String;JJ)V

    invoke-static {p0, p1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    invoke-static {p0, p1, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public final u(Lqbj;)Lsmv;
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lqbb;->y:Landroidx/compose/ui/platform/ComposeView;

    invoke-virtual {v2}, Landroidx/compose/ui/platform/ComposeView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    new-instance v3, Lsmv;

    iget v4, v1, Lqbj;->b:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    int-to-float v6, v4

    const v4, 0x7f0701b4

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v11, Lsmu;

    const v5, 0x7f1301cc

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v7, Landroid/util/Size;

    invoke-direct {v7, v4, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v4, v0, Lqbb;->m:Landroid/view/View;

    invoke-static {v4}, Ltqz;->bj(Landroid/view/View;)I

    move-result v4

    const v8, 0x7f080354

    invoke-direct {v11, v8, v5, v7, v4}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    const v4, 0x7f0703e2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v12, Lsmu;

    const v5, 0x7f1303c6

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v7, Landroid/util/Size;

    invoke-direct {v7, v4, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v4, v0, Lqbb;->m:Landroid/view/View;

    invoke-static {v4}, Ltqz;->bj(Landroid/view/View;)I

    move-result v4

    const v8, 0x7f080353

    invoke-direct {v12, v8, v5, v7, v4}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    new-instance v13, Lqba;

    const/4 v4, 0x0

    invoke-direct {v13, v0, v4}, Lqba;-><init>(Ljava/lang/Object;I)V

    new-instance v4, Llaf;

    const/16 v5, 0xd

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

.method public final v(JZLsnw;)V
    .locals 1

    :cond_0
    iget-object p3, p0, Lqbb;->d:Lpus;

    const/4 v0, 0x0

    invoke-interface {p3, v0}, Lpus;->b(Z)V

    invoke-virtual {p0, p1, p2}, Lqbb;->y(J)V

    iget-object p0, p0, Lqbb;->E:Lrex;

    const/4 p3, 0x5

    long-to-double p1, p1

    invoke-virtual {p0, p4, p3, p1, p2}, Lrex;->E(Lsnw;ID)V

    return-void
.end method

.method public final declared-synchronized w(Z)V
    .locals 4

    monitor-enter p0

    iget-object v0, p0, Lqbb;->C:Luep;

    if-eqz p1, :cond_1

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    iget-object p1, p0, Lqbb;->p:Luep;

    invoke-virtual {p1}, Luep;->d()Luep;

    move-result-object p1

    iput-object p1, p0, Lqbb;->C:Luep;

    iget-object v0, p0, Lqbb;->u:Lufv;

    new-instance v1, Lpzh;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lpzh;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lqbb;->f:Luer;

    invoke-interface {v0, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {p1, v1}, Luep;->e(Lula;)V

    iget-object p1, p0, Lqbb;->C:Luep;

    new-instance v1, Lpud;

    const/16 v3, 0x8

    invoke-direct {v1, v3}, Lpud;-><init>(I)V

    invoke-static {v0, v1}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v0

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v1, Lppl;

    const/16 v3, 0xe

    invoke-direct {v1, p0, v3}, Lppl;-><init>(Ljava/lang/Object;I)V

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

    iput-object p1, p0, Lqbb;->C:Luep;
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

.method public final y(J)V
    .locals 3

    sget-object v0, Lqbb;->t:Lj$/time/Duration;

    invoke-virtual {v0}, Lj$/time/Duration;->toNanos()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lqbb;->z:Z

    iget-object v2, p0, Lqbb;->v:Lugh;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v2, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-boolean v1, p0, Lqbb;->z:Z

    iget-object v2, p0, Lqbb;->d:Lpus;

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lj$/time/Duration;->toNanos()J

    move-result-wide v0

    invoke-interface {v2, v0, v1}, Lpus;->c(J)V

    goto :goto_1

    :cond_1
    invoke-interface {v2, p1, p2}, Lpus;->c(J)V

    :goto_1
    iget-object v0, p0, Lqbb;->e:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p1

    iput-object p1, v1, Lnql;->g:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lqbb;->i:Lugh;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p1

    invoke-interface {p0, p1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final z(Lqbi;)Z
    .locals 1

    iget-boolean v0, p0, Lqbb;->z:Z

    if-nez v0, :cond_0

    iget-object p0, p0, Lqbb;->e:Lugh;

    invoke-interface {p0}, Lugh;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnql;

    invoke-virtual {p0}, Lnql;->a()Lnqm;

    move-result-object p0

    iget-object p0, p0, Lnqm;->g:Lj$/util/Optional;

    invoke-virtual {p0}, Lj$/util/Optional;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    iget-boolean p0, p1, Lqbi;->b:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
