.class public Lnqj;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lspg;
.implements Lnnq;
.implements Lnno;
.implements Lnnp;
.implements Lnmd;
.implements Lnmb;


# static fields
.field public static final a:Lykq;

.field private static final t:Lyfm;


# instance fields
.field private final A:Lufv;

.field private final B:Lufv;

.field private final C:Lj$/util/Optional;

.field private final D:Lufv;

.field private final E:Lufv;

.field private final F:Lufv;

.field private final G:Lufv;

.field private final H:Lmja;

.field private final I:Lufv;

.field private final J:Lufv;

.field private final K:Lzfe;

.field private final L:Lufv;

.field private final M:Lacbr;

.field private final N:Lufv;

.field private final O:Lufv;

.field private final P:Lufv;

.field private final Q:Lj$/util/Optional;

.field private final R:Lj$/util/Optional;

.field private final S:Landroid/content/Intent;

.field private T:Z

.field private U:Z

.field private V:Z

.field private W:Lj$/util/Optional;

.field private X:Lula;

.field private final Y:Lrvf;

.field private final Z:Lklm;

.field private final aa:Ltit;

.field private final ab:Lvao;

.field public final b:Lufv;

.field public final c:Luer;

.field public final d:Lyeh;

.field public final e:Lufv;

.field public final f:Lufv;

.field public final g:Lugh;

.field public h:Lj$/util/Optional;

.field public final i:Lnnb;

.field public final j:Lugh;

.field public final k:Lnrs;

.field public l:Z

.field public m:Z

.field public final n:Lugh;

.field public final o:Z

.field public final p:Luep;

.field public final q:Ljlc;

.field public final r:Lrex;

.field private final u:Lufv;

.field private final v:Lugh;

.field private final w:Landroid/os/Handler;

.field private final x:Lulx;

.field private final y:Lufv;

.field private final z:Lufv;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "nqj"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnqj;->a:Lykq;

    sget-object v0, Lsql;->m:Lsql;

    sget-object v1, Lsql;->d:Lsql;

    sget-object v2, Lsql;->q:Lsql;

    sget-object v3, Lsql;->r:Lsql;

    invoke-static {v0, v1, v2, v3}, Lyfm;->K(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyfm;

    move-result-object v0

    sput-object v0, Lnqj;->t:Lyfm;

    return-void
.end method

.method public constructor <init>(Ltit;Lufv;Landroid/os/Handler;Lnnb;Lhze;Lyeh;Luer;Lulx;Lufv;Lufv;Lufv;Lugh;Ljlc;Lufv;Lugh;Lufv;Lufv;Lufv;Lufv;Lufv;Lrex;Lmja;Lufv;Lufv;Lufv;Lrvf;Lufv;Lufv;Lacbr;Lklm;Lugh;Lufv;Lnrs;Lufv;Lufv;Lvao;Lj$/util/Optional;Lugh;Lj$/util/Optional;Lj$/util/Optional;Landroid/content/Intent;)V
    .locals 3

    move-object/from16 v0, p26

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    iput-object v1, p0, Lnqj;->h:Lj$/util/Optional;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lnqj;->l:Z

    iput-boolean v1, p0, Lnqj;->T:Z

    iput-boolean v1, p0, Lnqj;->U:Z

    iput-boolean v1, p0, Lnqj;->m:Z

    iput-boolean v1, p0, Lnqj;->V:Z

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    iput-object v2, p0, Lnqj;->W:Lj$/util/Optional;

    iput-object p8, p0, Lnqj;->x:Lulx;

    invoke-virtual {p5}, Lhze;->h()Luep;

    move-result-object p5

    iput-object p5, p0, Lnqj;->p:Luep;

    move-object/from16 p8, p41

    iput-object p8, p0, Lnqj;->S:Landroid/content/Intent;

    iput-object p9, p0, Lnqj;->b:Lufv;

    iput-object p10, p0, Lnqj;->u:Lufv;

    iput-object p1, p0, Lnqj;->aa:Ltit;

    iput-object p7, p0, Lnqj;->c:Luer;

    iput-object p3, p0, Lnqj;->w:Landroid/os/Handler;

    iput-object p6, p0, Lnqj;->d:Lyeh;

    iput-object p12, p0, Lnqj;->v:Lugh;

    iput-object p2, p0, Lnqj;->B:Lufv;

    iput-object p11, p0, Lnqj;->e:Lufv;

    move-object/from16 p1, p13

    iput-object p1, p0, Lnqj;->q:Ljlc;

    move-object/from16 p1, p14

    iput-object p1, p0, Lnqj;->D:Lufv;

    move-object/from16 p1, p15

    iput-object p1, p0, Lnqj;->g:Lugh;

    move-object/from16 p1, p16

    iput-object p1, p0, Lnqj;->y:Lufv;

    move-object/from16 p1, p17

    iput-object p1, p0, Lnqj;->z:Lufv;

    move-object/from16 p1, p18

    iput-object p1, p0, Lnqj;->A:Lufv;

    move-object/from16 p1, p19

    iput-object p1, p0, Lnqj;->E:Lufv;

    move-object/from16 p1, p20

    iput-object p1, p0, Lnqj;->F:Lufv;

    iput-object p4, p0, Lnqj;->i:Lnnb;

    move-object/from16 p1, p21

    iput-object p1, p0, Lnqj;->r:Lrex;

    move-object/from16 p1, p22

    iput-object p1, p0, Lnqj;->H:Lmja;

    move-object/from16 p1, p23

    iput-object p1, p0, Lnqj;->I:Lufv;

    move-object/from16 p1, p24

    iput-object p1, p0, Lnqj;->f:Lufv;

    move-object/from16 p1, p25

    iput-object p1, p0, Lnqj;->G:Lufv;

    iput-object v0, p0, Lnqj;->Y:Lrvf;

    move-object/from16 p1, p27

    iput-object p1, p0, Lnqj;->J:Lufv;

    move-object/from16 p1, p30

    iput-object p1, p0, Lnqj;->Z:Lklm;

    move-object/from16 p1, p28

    iput-object p1, p0, Lnqj;->L:Lufv;

    move-object/from16 p1, p29

    iput-object p1, p0, Lnqj;->M:Lacbr;

    move-object/from16 p1, p31

    iput-object p1, p0, Lnqj;->j:Lugh;

    move-object/from16 p1, p32

    iput-object p1, p0, Lnqj;->N:Lufv;

    move-object/from16 p1, p33

    iput-object p1, p0, Lnqj;->k:Lnrs;

    move-object/from16 p1, p34

    iput-object p1, p0, Lnqj;->O:Lufv;

    move-object/from16 p1, p35

    iput-object p1, p0, Lnqj;->P:Lufv;

    move-object/from16 p1, p36

    iput-object p1, p0, Lnqj;->ab:Lvao;

    move-object/from16 p1, p37

    iput-object p1, p0, Lnqj;->Q:Lj$/util/Optional;

    move-object/from16 p1, p38

    iput-object p1, p0, Lnqj;->n:Lugh;

    move-object/from16 p1, p39

    iput-object p1, p0, Lnqj;->R:Lj$/util/Optional;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    move-object/from16 p2, p40

    invoke-virtual {p2, p1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lnqj;->o:Z

    invoke-static {p6}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance p2, Lkjo;

    const/4 p3, 0x7

    invoke-direct {p2, p3}, Lkjo;-><init>(I)V

    invoke-interface {p1, p2}, Lj$/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance p2, Ljpa;

    const/16 p3, 0x8

    invoke-direct {p2, p3}, Ljpa;-><init>(I)V

    invoke-interface {p1, p2}, Lj$/util/stream/Stream;->map(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object p1

    invoke-interface {p1}, Lj$/util/stream/Stream;->findFirst()Lj$/util/Optional;

    move-result-object p1

    iput-object p1, p0, Lnqj;->C:Lj$/util/Optional;

    iget-object p1, v0, Lrvf;->d:Lugh;

    invoke-static {p1, p5}, Lugc;->k(Lufv;Luep;)Lzfe;

    move-result-object p1

    iput-object p1, p0, Lnqj;->K:Lzfe;

    return-void
.end method

.method public static final I(Lnqp;)Z
    .locals 1

    sget-object v0, Lnqp;->j:Lnqp;

    if-eq p0, v0, :cond_1

    sget-object v0, Lnqp;->k:Lnqp;

    if-eq p0, v0, :cond_1

    sget-object v0, Lnqp;->l:Lnqp;

    if-eq p0, v0, :cond_1

    sget-object v0, Lnqp;->m:Lnqp;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static final J(Lnqs;Z)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p0}, Lnqs;->g()V

    return-void

    :cond_0
    invoke-interface {p0}, Lnqs;->d()V

    return-void
.end method

.method private final declared-synchronized K()Lula;
    .locals 4

    monitor-enter p0

    :try_start_0
    new-instance v0, Lokm;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lokm;-><init>(Lnqj;I)V

    iget-object v1, p0, Lnqj;->q:Ljlc;

    invoke-virtual {v1, v0}, Ljlc;->a(Ljlg;)V

    new-instance v1, Libt;

    const/16 v2, 0x12

    const/4 v3, 0x0

    invoke-direct {v1, p0, v0, v2, v3}, Libt;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private final L(Landroid/content/Intent;)V
    .locals 2

    iget-boolean v0, p0, Lnqj;->o:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    const/4 v0, 0x0

    const-string v1, "com.google.android.apps.camera.extra.SHOW_SAUCE_CAROUSEL"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnqj;->m:Z

    invoke-virtual {p1, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    iget-boolean p1, p0, Lnqj;->V:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lnqj;->c:Luer;

    new-instance v0, Llpe;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Llpe;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1, v0}, Luer;->c(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private final declared-synchronized M()V
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lnqj;->T:Z

    const/4 v1, 0x1

    const/4 v2, 0x5

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lnqj;->U:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lnqj;->d:Lyeh;

    invoke-static {v0}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v3, Lkjo;

    invoke-direct {v3, v2}, Lkjo;-><init>(I)V

    invoke-interface {v0, v3}, Lj$/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v3, Lnmy;

    invoke-direct {v3, v2}, Lnmy;-><init>(I)V

    invoke-interface {v0, v3}, Lj$/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    iget-object v0, p0, Lnqj;->W:Lj$/util/Optional;

    iget-object v3, p0, Lnqj;->Y:Lrvf;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lmkt;

    invoke-direct {v4, v3, v2}, Lmkt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, v4, Lmkt;->a:Ljava/lang/Object;

    check-cast v1, Lrvf;

    check-cast v0, Lrvi;

    invoke-virtual {v1, v0}, Lrvf;->k(Lrvi;)V

    :cond_0
    invoke-virtual {p0}, Lnqj;->z()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lnqj;->d:Lyeh;

    invoke-static {v0}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v3, Lkjo;

    const/4 v4, 0x6

    invoke-direct {v3, v4}, Lkjo;-><init>(I)V

    invoke-interface {v0, v3}, Lj$/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v3, Lnmy;

    invoke-direct {v3, v4}, Lnmy;-><init>(I)V

    invoke-interface {v0, v3}, Lj$/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    iget-object v0, p0, Lnqj;->W:Lj$/util/Optional;

    iget-object v3, p0, Lnqj;->Y:Lrvf;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lmkt;

    invoke-direct {v5, v3, v2}, Lmkt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v2

    if-ne v1, v2, :cond_2

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v2, v5, Lmkt;->a:Ljava/lang/Object;

    check-cast v2, Lrvf;

    check-cast v0, Lrvi;

    invoke-virtual {v2, v0}, Lrvf;->k(Lrvi;)V

    :cond_2
    iget-object v0, p0, Lnqj;->C:Lj$/util/Optional;

    new-instance v2, Lmkt;

    invoke-direct {v2, p0, v4}, Lmkt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v1, v3, :cond_3

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v2, v2, Lmkt;->a:Ljava/lang/Object;

    check-cast v0, Lnqs;

    check-cast v2, Lnqj;

    iget-object v2, v2, Lnqj;->e:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lqaw;->a:Lqaw;

    if-eq v2, v3, :cond_3

    invoke-static {v0, v1}, Lnqj;->J(Lnqs;Z)V

    :cond_3
    :goto_0
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    iput-object v0, p0, Lnqj;->W:Lj$/util/Optional;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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

.method private final declared-synchronized N()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->Y:Lrvf;

    invoke-virtual {v0}, Lrvf;->a()Lrvi;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, p0, Lnqj;->W:Lj$/util/Optional;

    invoke-virtual {p0}, Lnqj;->H()Z

    move-result v0

    iput-boolean v0, p0, Lnqj;->T:Z

    iget-object v0, p0, Lnqj;->g:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj$/util/Optional;

    sget-object v1, Lnqq;->q:Lnqq;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lnqj;->U:Z

    invoke-direct {p0}, Lnqj;->O()V

    new-instance v0, Lmky;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lmky;-><init>(Ljava/lang/Object;I)V

    iget-object v1, p0, Lnqj;->C:Lj$/util/Optional;

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v2

    const/4 v3, 0x1

    if-eq v3, v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    iget-object v0, v0, Lmky;->a:Ljava/lang/Object;

    check-cast v1, Lnqs;

    check-cast v0, Lnqj;

    iget-object v0, v0, Lnqj;->e:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    sget-object v2, Lqaw;->a:Lqaw;

    if-eq v0, v2, :cond_1

    const/4 v0, 0x0

    invoke-static {v1, v0}, Lnqj;->J(Lnqs;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
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

.method private final declared-synchronized O()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lnqj;->m:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lnqj;->k:Lnrs;

    invoke-virtual {v0}, Lnrs;->e()V
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

.method private final declared-synchronized P()V
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lnqj;->o:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lnqj;->R:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p0}, Lnqj;->s()V

    iget-object v1, p0, Lnqj;->b:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsql;

    invoke-virtual {v1}, Lsql;->f()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    sget-object v1, Lnqp;->j:Lnqp;

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Lnqj;->v(Lnqp;Z)V

    sget-object v1, Lnqp;->m:Lnqp;

    invoke-virtual {p0, v1, v3}, Lnqj;->v(Lnqp;Z)V

    sget-object v1, Lnqp;->n:Lnqp;

    invoke-virtual {p0, v1, v3}, Lnqj;->v(Lnqp;Z)V

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    sget-object v4, Lqku;->a:Lqku;

    if-ne v1, v4, :cond_1

    move v5, v2

    goto :goto_0

    :cond_1
    move v5, v3

    :goto_0
    if-ne v1, v4, :cond_2

    move v2, v3

    :cond_2
    sget-object v1, Lnqp;->k:Lnqp;

    invoke-virtual {p0, v1, v5}, Lnqj;->v(Lnqp;Z)V

    sget-object v1, Lnqp;->l:Lnqp;

    invoke-virtual {p0, v1, v2}, Lnqj;->v(Lnqp;Z)V

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lufv;

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v1, Lmgj;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Lmgj;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lnqj;->c:Luer;

    invoke-interface {v0, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    iput-object v0, p0, Lnqj;->X:Lula;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    :try_start_1
    iget-object v0, p0, Lnqj;->n:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lnqj;->o()V

    :cond_4
    iget-object v0, p0, Lnqj;->d:Lyeh;

    invoke-static {v0}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lkjo;

    const/4 v3, 0x4

    invoke-direct {v1, v3}, Lkjo;-><init>(I)V

    invoke-interface {v0, v1}, Lj$/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v1, Llug;

    const/16 v3, 0x8

    invoke-direct {v1, v3}, Llug;-><init>(I)V

    invoke-interface {v0, v1}, Lj$/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    sget-object v0, Lnqp;->j:Lnqp;

    invoke-virtual {p0, v0, v2}, Lnqj;->v(Lnqp;Z)V

    sget-object v0, Lnqp;->m:Lnqp;

    invoke-virtual {p0, v0, v2}, Lnqj;->v(Lnqp;Z)V

    sget-object v0, Lnqp;->k:Lnqp;

    invoke-virtual {p0, v0, v2}, Lnqj;->v(Lnqp;Z)V

    sget-object v0, Lnqp;->l:Lnqp;

    invoke-virtual {p0, v0, v2}, Lnqj;->v(Lnqp;Z)V

    sget-object v0, Lnqp;->n:Lnqp;

    invoke-virtual {p0, v0, v2}, Lnqj;->v(Lnqp;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_5
    :goto_1
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

.method private final declared-synchronized Q()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnqp;->c:Lnqp;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lnqj;->v(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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

.method private final R(Ljava/lang/Runnable;)V
    .locals 2

    new-instance v0, Lnqi;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lnqi;-><init>(Ljava/lang/Object;I)V

    iget-object p1, p0, Lnqj;->K:Lzfe;

    new-instance v1, Lzes;

    invoke-direct {v1, p1, v0}, Lzes;-><init>(Lzfe;Lzer;)V

    iget-object p0, p0, Lnqj;->c:Luer;

    invoke-interface {p1, v1, p0}, Lzfe;->c(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method


# virtual methods
.method public final declared-synchronized A(Lnqq;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p1

    iput-object p1, p0, Lnqj;->h:Lj$/util/Optional;

    invoke-virtual {p0}, Lnqj;->H()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lnqj;->k:Lnrs;

    iget-object v0, p0, Lnqj;->h:Lj$/util/Optional;

    invoke-virtual {p1, v0}, Lnrs;->j(Lj$/util/Optional;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lnqj;->z()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public final declared-synchronized B()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lnqj;->o:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lnqj;->n:Lugh;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnqj;->k:Lnrs;

    invoke-virtual {v0, v1}, Lnrs;->i(Z)V

    invoke-virtual {p0}, Lnqj;->o()V

    invoke-virtual {v0}, Lnrs;->n()Z
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

.method public final C()V
    .locals 2

    iget-object p0, p0, Lnqj;->k:Lnrs;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lnrs;->h(Lj$/util/Optional;Z)V

    invoke-virtual {p0, v1}, Lnrs;->a(Z)V

    return-void
.end method

.method public final declared-synchronized D()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lnqj;->H()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnqj;->n()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :cond_0
    monitor-exit p0

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final declared-synchronized E()V
    .locals 14

    monitor-enter p0

    :try_start_0
    invoke-static {}, Luer;->d()Z

    move-result v0

    const-string v1, "Not main thread."

    invoke-static {v0, v1}, Lyny;->bm(ZLjava/lang/Object;)V

    new-instance v0, Lxiy;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lxiy;-><init>(Ljava/lang/Object;[B)V

    new-instance v2, Ltbe;

    invoke-direct {v2, p0, v1}, Ltbe;-><init>(Ljava/lang/Object;[B)V

    new-instance v3, Lxiy;

    invoke-direct {v3, p0, v1}, Lxiy;-><init>(Ljava/lang/Object;[B)V

    iget-object v1, p0, Lnqj;->k:Lnrs;

    invoke-virtual {v1, v0, v2, v3}, Lnrs;->o(Lxiy;Ltbe;Lxiy;)V

    iget-object v0, p0, Lnqj;->aa:Ltit;

    const v1, 0x7f0a0095

    invoke-virtual {v0, v1}, Ltit;->d(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/ViewStub;

    const v3, 0x7f0d00e6

    invoke-virtual {v2, v3}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    new-instance v1, Lmkt;

    const/4 v3, 0x4

    invoke-direct {v1, v2, v3}, Lmkt;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lnqj;->Q:Lj$/util/Optional;

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    iget-object v1, v1, Lmkt;->a:Ljava/lang/Object;

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqjm;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1}, Lqjm;->c(Landroid/view/ViewGroup;)V

    new-instance v1, Lmbt;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lmbt;-><init>(Ljava/lang/Object;I)V

    iget-object v3, p0, Lnqj;->c:Luer;

    iget-object v4, p0, Lnqj;->y:Lufv;

    invoke-interface {v4, v1, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    iget-object v4, p0, Lnqj;->p:Luep;

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    new-instance v1, Lmgj;

    const/16 v5, 0xe

    invoke-direct {v1, p0, v5}, Lmgj;-><init>(Ljava/lang/Object;I)V

    iget-object v6, p0, Lnqj;->z:Lufv;

    invoke-interface {v6, v1, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    new-instance v1, Lmbt;

    const/16 v6, 0x14

    invoke-direct {v1, p0, v6}, Lmbt;-><init>(Ljava/lang/Object;I)V

    iget-object v7, p0, Lnqj;->A:Lufv;

    invoke-interface {v7, v1, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    new-instance v1, Lnrb;

    const/4 v7, 0x1

    invoke-direct {v1, p0, v7}, Lnrb;-><init>(Ljava/lang/Object;I)V

    iget-object v8, p0, Lnqj;->v:Lugh;

    invoke-interface {v8, v1, v3}, Lugh;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    new-instance v1, Lmgj;

    const/16 v8, 0xf

    invoke-direct {v1, p0, v8}, Lmgj;-><init>(Ljava/lang/Object;I)V

    iget-object v9, p0, Lnqj;->E:Lufv;

    invoke-interface {v9, v1, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    new-instance v1, Lmgj;

    const/16 v9, 0x10

    invoke-direct {v1, p0, v9}, Lmgj;-><init>(Ljava/lang/Object;I)V

    iget-object v10, p0, Lnqj;->F:Lufv;

    invoke-interface {v10, v1, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    iget-object v1, p0, Lnqj;->b:Lufv;

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object v1

    new-instance v10, Lmgj;

    invoke-direct {v10, p0, v2}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v10, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    iget-object v1, p0, Lnqj;->u:Lufv;

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object v1

    new-instance v2, Lmgj;

    invoke-direct {v2, p0, v6}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v2, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    new-instance v1, Lnqh;

    invoke-direct {v1, p0, v7}, Lnqh;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lnqj;->e:Lufv;

    invoke-interface {v2, v1, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v4, v1}, Luep;->e(Lula;)V

    iget-object v1, p0, Lnqj;->B:Lufv;

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v6, Lnqh;

    const/4 v10, 0x0

    invoke-direct {v6, p0, v10}, Lnqh;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v6, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v4, v2}, Luep;->e(Lula;)V

    invoke-direct {p0}, Lnqj;->K()Lula;

    move-result-object v2

    invoke-virtual {v4, v2}, Luep;->e(Lula;)V

    new-instance v2, Lnqh;

    const/4 v6, 0x2

    invoke-direct {v2, p0, v6}, Lnqh;-><init>(Ljava/lang/Object;I)V

    iget-object v6, p0, Lnqj;->L:Lufv;

    invoke-interface {v6, v2, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v4, v2}, Luep;->e(Lula;)V

    iget-object v2, p0, Lnqj;->H:Lmja;

    invoke-virtual {v2}, Lmja;->d()Lufv;

    move-result-object v6

    new-instance v11, Lnqh;

    const/4 v12, 0x3

    invoke-direct {v11, p0, v12}, Lnqh;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v6, v11, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v6

    invoke-virtual {v4, v6}, Luep;->e(Lula;)V

    iget-object v6, p0, Lnqj;->I:Lufv;

    invoke-static {v6}, Lufr;->a(Lufv;)Lufv;

    move-result-object v6

    new-instance v11, Lmgj;

    const/4 v12, 0x7

    invoke-direct {v11, p0, v12}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v6, v11, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v6

    invoke-virtual {v4, v6}, Luep;->e(Lula;)V

    new-instance v6, Llpe;

    invoke-direct {v6, p0, v5}, Llpe;-><init>(Ljava/lang/Object;I)V

    invoke-direct {p0, v6}, Lnqj;->R(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Lmja;->e()Lufv;

    move-result-object v2

    new-instance v5, Lmgj;

    const/16 v6, 0x8

    invoke-direct {v5, p0, v6}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v4, v2}, Luep;->e(Lula;)V

    iget-object v2, p0, Lnqj;->j:Lugh;

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v5

    new-instance v6, Lmgj;

    const/16 v11, 0x9

    invoke-direct {v6, p0, v11}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v5, v6, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v5

    invoke-virtual {v4, v5}, Luep;->e(Lula;)V

    iget-object v5, p0, Lnqj;->N:Lufv;

    invoke-static {v5}, Lufr;->a(Lufv;)Lufv;

    move-result-object v5

    new-instance v6, Lmgj;

    const/16 v11, 0xa

    invoke-direct {v6, p0, v11}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v5, v6, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v5

    invoke-virtual {v4, v5}, Luep;->e(Lula;)V

    iget-object v5, p0, Lnqj;->P:Lufv;

    invoke-static {v5}, Lufr;->a(Lufv;)Lufv;

    move-result-object v5

    new-instance v6, Lmgj;

    const/16 v11, 0xb

    invoke-direct {v6, p0, v11}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v5, v6, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v5

    invoke-virtual {v4, v5}, Luep;->e(Lula;)V

    new-instance v5, Lmmf;

    invoke-direct {v5, p0, v12}, Lmmf;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v4, v5}, Luep;->e(Lula;)V

    invoke-direct {p0}, Lnqj;->Q()V

    invoke-direct {p0}, Lnqj;->P()V

    new-instance v5, Llpe;

    invoke-direct {v5, p0, v8}, Llpe;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v3, v5}, Luer;->c(Ljava/lang/Runnable;)V

    iget-object v5, p0, Lnqj;->d:Lyeh;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    :goto_0
    if-ge v10, v6, :cond_0

    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lnqr;

    iget-object v11, v8, Lnqr;->e:Lnqs;

    iget v8, v8, Lnqr;->d:I

    invoke-virtual {v0, v8}, Ltit;->d(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    invoke-interface {v11, v8}, Lnqs;->a(Landroid/view/View;)Lula;

    move-result-object v8

    invoke-virtual {v4, v8}, Luep;->e(Lula;)V

    iget-object v8, p0, Lnqj;->D:Lufv;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v12, Lmgj;

    const/16 v13, 0xc

    invoke-direct {v12, v11, v13}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v8, v12, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v8

    invoke-virtual {v4, v8}, Luep;->e(Lula;)V

    new-instance v8, Lmgj;

    const/16 v12, 0xd

    invoke-direct {v8, v11, v12}, Lmgj;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v8, v3}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v8

    invoke-virtual {v4, v8}, Luep;->e(Lula;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lnqj;->ab:Lvao;

    new-instance v1, Llpe;

    invoke-direct {v1, p0, v9}, Llpe;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v4, v2, v1}, Lvao;->t(Luep;Lufv;Ljava/lang/Runnable;)V

    iput-boolean v7, p0, Lnqj;->V:Z

    iget-boolean v0, p0, Lnqj;->m:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lnqj;->B()V

    iget-object v0, p0, Lnqj;->w:Landroid/os/Handler;

    new-instance v1, Llpe;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Llpe;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
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

.method public final F()Z
    .locals 3

    iget-object v0, p0, Lnqj;->b:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsql;

    sget-object v2, Lsql;->k:Lsql;

    invoke-virtual {v1, v2}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object p0, p0, Lnqj;->G:Lufv;

    invoke-interface {p0}, Lufv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_0
    sget-object p0, Lnqj;->t:Lyfm;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public final declared-synchronized G(Lnqp;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnqp;->a:Lnqp;

    if-eq p1, v0, :cond_ret_true

    sget-object v0, Lnqp;->b:Lnqp;

    if-ne p1, v0, :cond_check_orig

    :cond_ret_true
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_check_orig
    iget-object v0, p0, Lnqj;->k:Lnrs;

    invoke-virtual {v0, p1}, Lnrs;->l(Lnqp;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final H()Z
    .locals 0

    iget-object p0, p0, Lnqj;->k:Lnrs;

    invoke-virtual {p0}, Lnrs;->m()Z

    move-result p0

    return p0
.end method

.method public final a()V
    .locals 3

    new-instance v0, Llpe;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Llpe;-><init>(Ljava/lang/Object;I)V

    iget-object v1, p0, Lnqj;->x:Lulx;

    const-string v2, "ManualFeaturesController#wireOnMainThread"

    invoke-interface {v1, v2, v0}, Lulx;->c(Ljava/lang/String;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    iget-object p0, p0, Lnqj;->w:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final declared-synchronized b(Z)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->b:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lsql;->j:Lsql;

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lnqj;->g:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj$/util/Optional;

    sget-object v1, Lnqq;->q:Lnqq;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->equals(Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Lnqp;->i:Lnqp;

    const/4 v2, 0x1

    if-nez p1, :cond_1

    iget-object v3, p0, Lnqj;->J:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj$/util/Optional;

    invoke-virtual {v3}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-nez v3, :cond_3

    :cond_1
    iget-object v3, p0, Lnqj;->O:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :cond_3
    :goto_0
    invoke-virtual {p0, v1, v2}, Lnqj;->v(Lnqp;Z)V

    if-eqz v0, :cond_4

    if-eqz p1, :cond_4

    iget-object p1, p0, Lnqj;->O:Lufv;

    invoke-interface {p1}, Lufv;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lnqj;->k:Lnrs;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnrs;->j(Lj$/util/Optional;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized c(Z)V
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->g:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj$/util/Optional;

    sget-object v1, Lnqq;->q:Lnqq;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p1, :cond_1

    iget-object p1, p0, Lnqj;->b:Lufv;

    invoke-interface {p1}, Lufv;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsql;

    sget-object v3, Lsql;->j:Lsql;

    invoke-virtual {p1, v3}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v2

    goto :goto_1

    :cond_1
    :goto_0
    move p1, v1

    :goto_1
    iget-object v3, p0, Lnqj;->b:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsql;

    sget-object v5, Lsql;->q:Lsql;

    invoke-virtual {v4, v5}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsql;

    sget-object v5, Lsql;->k:Lsql;

    invoke-virtual {v4, v5}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lsql;

    sget-object v4, Lsql;->j:Lsql;

    invoke-virtual {v3, v4}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lnqj;->J:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj$/util/Optional;

    invoke-virtual {v3}, Lj$/util/Optional;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    :cond_2
    move v3, v1

    goto :goto_2

    :cond_3
    move v3, v2

    :goto_2
    sget-object v4, Lnqp;->i:Lnqp;

    if-eqz p1, :cond_4

    if-eqz v3, :cond_4

    goto :goto_3

    :cond_4
    move v1, v2

    :goto_3
    invoke-virtual {p0, v4, v1}, Lnqj;->v(Lnqp;Z)V

    if-eqz v0, :cond_6

    if-eqz p1, :cond_5

    if-nez v3, :cond_6

    :cond_5
    iget-object p1, p0, Lnqj;->k:Lnrs;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnrs;->j(Lj$/util/Optional;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_6
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized d(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnqp;->f:Lnqp;

    invoke-virtual {p0, v0, p1}, Lnqj;->v(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized e(Lljz;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lljz;->a:Lljz;

    invoke-virtual {p1, v0}, Lljz;->equals(Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Lljz;->c:Lljz;

    invoke-virtual {p1, v1}, Lljz;->equals(Ljava/lang/Object;)Z

    move-result p1

    sget-object v1, Lnqp;->b:Lnqp;

    invoke-virtual {p0, v1, v0}, Lnqj;->v(Lnqp;Z)V

    sget-object v0, Lnqp;->a:Lnqp;

    invoke-virtual {p0, v0, p1}, Lnqj;->v(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized f(Z)V
    .locals 4

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-direct {p0}, Lnqj;->O()V

    :cond_0
    iget-object v0, p0, Lnqj;->C:Lj$/util/Optional;

    new-instance v1, Lnqg;

    invoke-direct {v1, p0, p1}, Lnqg;-><init>(Lnqj;Z)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result p1

    const/4 v2, 0x1

    if-eq v2, p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p1

    iget-object v0, v1, Lnqg;->a:Lnqj;

    iget-boolean v1, v1, Lnqg;->b:Z

    check-cast p1, Lnqs;

    iget-object v0, v0, Lnqj;->e:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    sget-object v3, Lqaw;->a:Lqaw;

    if-eq v0, v3, :cond_2

    xor-int/lit8 v0, v1, 0x1

    invoke-static {p1, v0}, Lnqj;->J(Lnqs;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized g(Lsql;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lnqj;->P()V

    invoke-virtual {p0}, Lnqj;->r()V

    sget-object v0, Lsql;->j:Lsql;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lnqj;->J:Lufv;

    sget-object v0, Lnqp;->i:Lnqp;

    invoke-interface {p1}, Lufv;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj$/util/Optional;

    invoke-virtual {p1}, Lj$/util/Optional;->isPresent()Z

    move-result p1

    invoke-virtual {p0, v0, p1}, Lnqj;->v(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object p1, p0, Lnqj;->H:Lmja;

    sget-object v0, Lnqp;->i:Lnqp;

    invoke-virtual {p1}, Lmja;->d()Lufv;

    move-result-object p1

    invoke-interface {p1}, Lufv;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, v0, p1}, Lnqj;->v(Lnqp;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public final declared-synchronized h(Z)V
    .locals 0

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-direct {p0}, Lnqj;->N()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lnqj;->M()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public final declared-synchronized i(Z)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->k:Lnrs;

    sget-object v1, Lnqq;->q:Lnqq;

    invoke-virtual {v0, v1, p1}, Lnrs;->g(Lnqq;Z)V

    if-nez p1, :cond_1

    iget-object p1, p0, Lnqj;->h:Lj$/util/Optional;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v2

    invoke-virtual {p1, v2}, Lj$/util/Optional;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p1

    iput-object p1, p0, Lnqj;->h:Lj$/util/Optional;

    :cond_0
    iget-object p1, p0, Lnqj;->g:Lugh;

    invoke-interface {p1}, Lugh;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj$/util/Optional;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {p1, v1}, Lj$/util/Optional;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lnqj;->h:Lj$/util/Optional;

    invoke-virtual {v0, p1}, Lnrs;->j(Lj$/util/Optional;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized j(Lnqp;ZZ)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lnqj;->v(Lnqp;Z)V

    if-eqz p3, :cond_0

    iget-object p2, p0, Lnqj;->d:Lyeh;

    invoke-static {p2}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object p2

    new-instance p3, Lndz;

    const/4 v0, 0x4

    invoke-direct {p3, p1, v0}, Lndz;-><init>(Ljava/lang/Object;I)V

    invoke-interface {p2, p3}, Lj$/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance p2, Ljpa;

    const/16 p3, 0x8

    invoke-direct {p2, p3}, Ljpa;-><init>(I)V

    invoke-interface {p1, p2}, Lj$/util/stream/Stream;->map(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance p2, Lnmy;

    const/4 p3, 0x3

    invoke-direct {p2, p3}, Lnmy;-><init>(I)V

    invoke-interface {p1, p2}, Lj$/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized k(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnqp;->g:Lnqp;

    invoke-virtual {p0, v0, p1}, Lnqj;->v(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized l(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    sget-object v0, Lnqp;->h:Lnqp;

    invoke-virtual {p0, v0, p1}, Lnqj;->v(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final m()V
    .locals 6

    iget-object v0, p0, Lnqj;->d:Lyeh;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_4

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnqr;

    invoke-virtual {v3}, Lnqr;->b()Lnqq;

    move-result-object v4

    sget-object v5, Lnqq;->q:Lnqq;

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lnqj;->f:Lufv;

    invoke-interface {v4}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lnqj;->J:Lufv;

    invoke-interface {v4}, Lufv;->d()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lj$/util/Optional;

    invoke-virtual {v5}, Lj$/util/Optional;->isPresent()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lj$/util/Optional;

    invoke-virtual {v4}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lj$/time/Duration;

    sget-object v5, Lisj;->a:Lj$/time/Duration;

    invoke-virtual {v4, v5}, Lj$/time/Duration;->compareTo(Lj$/time/Duration;)I

    move-result v4

    if-gez v4, :cond_3

    :cond_0
    sget-object v4, Lkkc;->a:Lkiy;

    :cond_1
    new-instance v4, Llpe;

    const/16 v5, 0x12

    invoke-direct {v4, v3, v5}, Llpe;-><init>(Ljava/lang/Object;I)V

    invoke-direct {p0, v4}, Lnqj;->R(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_2
    iget-object v3, v3, Lnqr;->e:Lnqs;

    invoke-interface {v3}, Lnqs;->d()V

    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lnqj;->g:Lugh;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnqj;->L:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lnqj;->f:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lnqj;->F()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnqj;->w(Z)V

    :cond_5
    return-void
.end method

.method public final declared-synchronized n()V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lnqj;->O()V

    invoke-virtual {p0}, Lnqj;->m()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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

.method public final o()V
    .locals 3

    invoke-direct {p0}, Lnqj;->Q()V

    invoke-direct {p0}, Lnqj;->P()V

    iget-object v0, p0, Lnqj;->A:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lnqj;->d(Z)V

    iget-object v0, p0, Lnqj;->v:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lljz;

    invoke-virtual {p0, v0}, Lnqj;->e(Lljz;)V

    iget-object v0, p0, Lnqj;->E:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lnqj;->k(Z)V

    iget-object v0, p0, Lnqj;->F:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lnqj;->l(Z)V

    iget-object v0, p0, Lnqj;->y:Lufv;

    sget-object v1, Lnqp;->d:Lnqp;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lnqj;->j(Lnqp;ZZ)V

    iget-object v0, p0, Lnqj;->z:Lufv;

    sget-object v1, Lnqp;->e:Lnqp;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v1, v0, v2}, Lnqj;->j(Lnqp;ZZ)V

    iget-object v0, p0, Lnqj;->H:Lmja;

    invoke-virtual {v0}, Lmja;->d()Lufv;

    move-result-object v1

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {p0, v1}, Lnqj;->c(Z)V

    invoke-virtual {v0}, Lmja;->e()Lufv;

    move-result-object v0

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lnqj;->b(Z)V

    return-void
.end method

.method public final p(Landroid/content/Intent;)V
    .locals 2

    invoke-virtual {p0}, Lnqj;->n()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnqj;->w(Z)V

    sget-object v0, Lnqp;->d:Lnqp;

    sget-object v1, Lnqp;->e:Lnqp;

    invoke-static {v0, v1}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnqj;->q(Lyeh;)V

    invoke-direct {p0, p1}, Lnqj;->L(Landroid/content/Intent;)V

    return-void
.end method

.method public final declared-synchronized q(Lyeh;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->d:Lyeh;

    invoke-static {v0}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v0

    new-instance v1, Ljlo;

    const/4 v2, 0x5

    invoke-direct {v1, p1, v2}, Ljlo;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v0, v1}, Lj$/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance v0, Ljpa;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljpa;-><init>(I)V

    invoke-interface {p1, v0}, Lj$/util/stream/Stream;->map(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lnmy;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lnmy;-><init>(I)V

    invoke-interface {p1, v0}, Lj$/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized r()V
    .locals 3

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lnqj;->O()V

    sget-object v0, Lnqp;->b:Lnqp;

    sget-object v1, Lnqp;->c:Lnqp;

    sget-object v2, Lnqp;->a:Lnqp;

    invoke-static {v0, v1, v2}, Lyeh;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnqj;->q(Lyeh;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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

.method public final s()V
    .locals 1

    iget-object v0, p0, Lnqj;->X:Lula;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lula;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lnqj;->X:Lula;

    :cond_0
    return-void
.end method

.method public final t()V
    .locals 1

    iget-object v0, p0, Lnqj;->S:Landroid/content/Intent;

    invoke-direct {p0, v0}, Lnqj;->L(Landroid/content/Intent;)V

    return-void
.end method

.method public final u()V
    .locals 1

    iget-object v0, p0, Lnqj;->M:Lacbr;

    invoke-interface {v0}, Lacbr;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpu;

    invoke-virtual {v0}, Llpu;->c()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnqj;->n()V

    :cond_0
    return-void
.end method

.method public final declared-synchronized v(Lnqp;Z)V
    .locals 2

    monitor-enter p0

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    :try_start_0
    iget-object p2, p0, Lnqj;->n:Lugh;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {p1}, Lnqj;->I(Lnqp;)Z

    move-result v1

    if-ne p2, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    iget-object p2, p0, Lnqj;->k:Lnrs;

    invoke-virtual {p2, p1, v0}, Lnrs;->f(Lnqp;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final w(Z)V
    .locals 2

    new-instance v0, Lnqf;

    invoke-direct {v0, p0, p1}, Lnqf;-><init>(Lnqj;Z)V

    new-instance p1, Lnii;

    const/4 v1, 0x5

    invoke-direct {p1, v1}, Lnii;-><init>(I)V

    iget-object p0, p0, Lnqj;->C:Lj$/util/Optional;

    invoke-virtual {p0, v0, p1}, Lj$/util/Optional;->ifPresentOrElse(Ljava/util/function/Consumer;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final declared-synchronized x()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Lnqj;->y(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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

.method public final declared-synchronized y(Z)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->k:Lnrs;

    iget-object v1, p0, Lnqj;->h:Lj$/util/Optional;

    invoke-virtual {v0, v1, p1}, Lnrs;->k(Lj$/util/Optional;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized z()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnqj;->k:Lnrs;

    invoke-virtual {v0}, Lnrs;->n()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnqj;->x()V
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
