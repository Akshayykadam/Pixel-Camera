.class public Lnrm;
.super Lqhr;
.source "PG"

# interfaces
.implements Lpyx;


# static fields
.field public static final c:Lykq;


# instance fields
.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public final g:Lejf;

.field public final h:Lugh;

.field public final i:Lugh;

.field public final j:Lugh;

.field public final k:Lugh;

.field public final l:Lufv;

.field public final m:Lufv;

.field public final n:Lnqt;

.field public o:F

.field public p:Luep;

.field public q:Z

.field public final r:Lnrf;

.field public final s:Lhze;

.field public final t:Lrex;

.field public final u:Lrdw;

.field public final v:Lppn;

.field private final w:Luer;

.field private x:Z

.field private y:Luep;

.field public final z:Lufn;

.field public rst:Lsmq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "nrm"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnrm;->c:Lykq;

    return-void
.end method

.method public constructor <init>(Losw;Lnrf;Lppn;Lugh;Luer;Lufv;Lnqt;Lhze;Lrex;Lrdw;)V
    .locals 3

    invoke-direct {p0}, Lqhr;-><init>()V

    new-instance v0, Lufn;

    const-string v1, ""

    invoke-direct {v0, v1}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnrm;->z:Lufn;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lnrm;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnrm;->g:Lejf;

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lnrm;->o:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrm;->x:Z

    iput-boolean v1, p0, Lnrm;->q:Z

    iput-object p2, p0, Lnrm;->r:Lnrf;

    iput-object p3, p0, Lnrm;->v:Lppn;

    iput-object p4, p0, Lnrm;->h:Lugh;

    iput-object p5, p0, Lnrm;->w:Luer;

    iget-object p2, p1, Losw;->d:Lugh;

    iput-object p2, p0, Lnrm;->i:Lugh;

    iget-object p2, p1, Losw;->c:Lugh;

    iput-object p2, p0, Lnrm;->j:Lugh;

    iget-object p1, p1, Losw;->a:Lugh;

    iput-object p1, p0, Lnrm;->k:Lugh;

    iput-object p6, p0, Lnrm;->m:Lufv;

    iput-object p7, p0, Lnrm;->n:Lnqt;

    iput-object p8, p0, Lnrm;->s:Lhze;

    iput-object p9, p0, Lnrm;->t:Lrex;

    iget-object p1, p3, Lppn;->c:Lufn;

    iput-object p1, p0, Lnrm;->l:Lufv;

    iput-object p10, p0, Lnrm;->u:Lrdw;

    return-void
.end method

.method private final m()V
    .locals 2

    iget-object v0, p0, Lnrm;->r:Lnrf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnrf;->c(Z)V

    iget-object v0, p0, Lnrm;->k:Lugh;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->j:Lugh;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->i:Lugh;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->v:Lppn;

    invoke-virtual {v0}, Lppn;->f()V

    iget-object p0, p0, Lnrm;->h:Lugh;

    invoke-interface {p0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    iput-object v1, v0, Lnql;->b:Lj$/util/Optional;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    iput-object v1, v0, Lnql;->e:Lj$/util/Optional;

    invoke-interface {p0, v0}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lula;
    .locals 3

    iget-object v0, p0, Lnrm;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object p1, p0, Lnrm;->e:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a01a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lnrm;->f:Landroid/view/View;

    new-instance p1, Luep;

    invoke-direct {p1}, Luep;-><init>()V

    iput-object p1, p0, Lnrm;->p:Luep;

    iget-object v0, p0, Lnrm;->k:Lugh;

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v1, Lnrb;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lnrb;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lnrm;->w:Luer;

    invoke-interface {v0, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {p1, v0}, Luep;->e(Lula;)V

    new-instance p1, Lnht;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lnht;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :cond_0
    new-instance p1, Lnht;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lnht;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method

.method public final declared-synchronized d()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnrm;->y:Luep;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Luep;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lnrm;->y:Luep;
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
    .locals 5

    iget-object v0, p0, Lnrm;->g:Lejf;

    if-eqz v0, :cond_rst_btn_m

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_rst_btn_m
    iget-object v0, p0, Lnrm;->z:Lufn;

    if-eqz v0, :cond_rst_z

    const-string v1, ""

    invoke-virtual {v0, v1}, Lufn;->a(Ljava/lang/Object;)V

    :cond_rst_z
    iget-object v0, p0, Lnqu;->a:Lsmy;

    if-eqz v0, :cond_skip_smy_m

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v0, v1}, Lsmy;->i(Lsmy;F)V

    const-string v1, ""

    invoke-virtual {v0, v1}, Lsmy;->f(Ljava/lang/String;)V

    :cond_skip_smy_m
    iget-object v0, p0, Lnrm;->i:Lugh;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->v:Lppn;

    if-eqz v0, :cond_skip_ev_rst_m

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_skip_ev_rst_m

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrm;->j:Lugh;

    if-eqz v2, :cond_get_b_rst_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_b_rst_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_b_rst_done

    move v1, v2

    :cond_get_b_rst_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v1, v2

    const/high16 v2, 0x41c00000    # 24.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    :cond_skip_ev_rst_m
    iget-object v0, p0, Lnrm;->r:Lnrf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnrf;->c(Z)V

    iget-object v0, p0, Lnrm;->h:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    iput-object v2, v1, Lnql;->e:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final declared-synchronized g()V
    .locals 7

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lnqu;->j()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrm;->q:Z

    iget-object v1, p0, Lnrm;->e:Landroid/view/View;

    iget-boolean v2, p0, Lnrm;->x:Z

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eq v0, v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lnrm;->f:Landroid/view/View;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lnrm;->f:Landroid/view/View;

    const v5, 0x7f130897

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v5, 0x7f130894

    const v6, 0x7f130896

    invoke-static {v2, v5, v6, v1}, Lobf;->x(Landroid/view/View;IILjava/lang/String;)V

    iput-object v2, p0, Lnrm;->f:Landroid/view/View;

    iget-boolean v1, p0, Lnrm;->x:Z

    if-eq v0, v1, :cond_1

    move v3, v4

    :cond_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    iget-object v0, p0, Lnrm;->y:Luep;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    monitor-exit p0

    return-void

    :cond_3
    :try_start_1
    iget-object v0, p0, Lnrm;->r:Lnrf;

    invoke-virtual {v0}, Lnrf;->b()V

    iget-boolean v0, p0, Lnrm;->x:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lnrm;->i:Lugh;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_4

    invoke-direct {p0}, Lnrm;->m()V

    invoke-virtual {p0, v4}, Lnrm;->k(Z)V

    :cond_4
    iget-object v0, p0, Lnrm;->m:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnqm;

    iget-object v0, v0, Lnqm;->e:Lj$/util/Optional;

    new-instance v1, Liem;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Liem;-><init>(Ljava/lang/Object;I)V

    new-instance v2, Lnif;

    const/16 v3, 0xe

    invoke-direct {v2, p0, v3}, Lnif;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1, v2}, Lj$/util/Optional;->ifPresentOrElse(Ljava/util/function/Consumer;Ljava/lang/Runnable;)V

    iget-object v0, p0, Lnrm;->p:Luep;

    invoke-virtual {v0}, Luep;->d()Luep;

    move-result-object v0

    iput-object v0, p0, Lnrm;->y:Luep;

    new-instance v1, Lnht;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lnht;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V
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

.method protected final i()Lsmy;
    .locals 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lnrm;->e:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v2, Lsmy;

    iget-object v3, v0, Lnrm;->e:Landroid/view/View;

    const v4, 0x7f0a04af

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/platform/ComposeView;

    new-instance v4, Lsmv;

    new-instance v5, Lnrk;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lnrk;-><init>(I)V

    new-instance v7, Lnri;

    const/4 v8, 0x2

    invoke-direct {v7, v8}, Lnri;-><init>(I)V

    invoke-static {v6, v5, v7}, Lj$/util/stream/IntStream$-CC;->iterate(ILjava/util/function/IntPredicate;Ljava/util/function/IntUnaryOperator;)Lj$/util/stream/IntStream;

    move-result-object v5

    invoke-interface {v5}, Lj$/util/stream/IntStream;->boxed()Lj$/util/stream/Stream;

    move-result-object v5

    sget-object v6, Lybh;->b:Lj$/util/stream/Collector;

    invoke-interface {v5, v6}, Lj$/util/stream/Stream;->collect(Lj$/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/util/Set;

    const v5, 0x7f070925

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v7, v5

    const/16 v5, -0xa

    const/16 v8, 0xa

    invoke-static {v5, v8}, Lj$/util/stream/IntStream$-CC;->rangeClosed(II)Lj$/util/stream/IntStream;

    move-result-object v5

    new-instance v9, Ljub;

    const/4 v10, 0x4

    invoke-direct {v9, v10}, Ljub;-><init>(I)V

    invoke-interface {v5, v9}, Lj$/util/stream/IntStream;->mapToObj(Ljava/util/function/IntFunction;)Lj$/util/stream/Stream;

    move-result-object v5

    sget v9, Lyeh;->d:I

    sget-object v9, Lybh;->a:Lj$/util/stream/Collector;

    invoke-interface {v5, v9}, Lj$/util/stream/Stream;->collect(Lj$/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Ljava/util/List;

    iget-object v5, v0, Lnrm;->e:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0709ba

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    new-instance v12, Lsmu;

    const v10, 0x7f1301c9

    invoke-virtual {v5, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v10, Landroid/util/Size;

    invoke-direct {v10, v9, v9}, Landroid/util/Size;-><init>(II)V

    iget-object v9, v0, Lnrm;->e:Landroid/view/View;

    invoke-static {v9}, Ltqz;->bj(Landroid/view/View;)I

    move-result v9

    const v13, 0x7f0805ea

    invoke-direct {v12, v13, v5, v10, v9}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    iget-object v5, v0, Lnrm;->e:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0709b9

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    new-instance v13, Lsmu;

    const v10, 0x7f1303c3

    invoke-virtual {v5, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v10, Landroid/util/Size;

    invoke-direct {v10, v9, v9}, Landroid/util/Size;-><init>(II)V

    iget-object v9, v0, Lnrm;->e:Landroid/view/View;

    invoke-static {v9}, Ltqz;->bj(Landroid/view/View;)I

    move-result v9

    const v14, 0x7f0802ee

    invoke-direct {v13, v14, v5, v10, v9}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    new-instance v14, Lndq;

    const/16 v5, 0xd

    invoke-direct {v14, v0, v5}, Lndq;-><init>(Ljava/lang/Object;I)V

    new-instance v5, Lndq;

    const/16 v9, 0xe

    invoke-direct {v5, v1, v9}, Lndq;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v17, v5

    const/16 v5, 0x51

    move v9, v8

    const/high16 v8, 0x3f000000    # 0.5f

    move v10, v9

    const/4 v9, 0x0

    move v15, v10

    const/4 v10, 0x3

    move/from16 v16, v15

    const/4 v15, 0x0

    move/from16 v18, v16

    const/16 v16, 0x1

    move-object/from16 v19, v2

    move/from16 v2, v18

    invoke-direct/range {v4 .. v17}, Lsmv;-><init>(ILjava/util/Set;FFZILjava/util/List;Lsmu;Lsmu;Ladgi;ZILadgi;)V

    new-instance v5, Lsmq;

    const v6, 0x7f1300be

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v6, Lmcc;

    invoke-direct {v6, v0, v2}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v2, v0, Lnrm;->g:Lejf;

    invoke-direct {v5, v1, v6, v2}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V

    iput-object v5, v0, Lnrm;->rst:Lsmq;

    iget-object v1, v0, Lnqu;->b:Lsbl;

    move-object/from16 v2, v19

    invoke-direct {v2, v3, v4, v5, v1}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;)V

    new-instance v1, Lnrc;

    const/4 v3, 0x5

    invoke-direct {v1, v0, v3}, Lnrc;-><init>(Lnqu;I)V

    invoke-virtual {v2, v1}, Lsmy;->e(Lsnx;)V

    return-object v2
.end method

.method public final k(Z)V
    .locals 2

    iget-object v0, p0, Lnrm;->v:Lppn;

    invoke-virtual {v0}, Lppn;->g()V

    invoke-virtual {v0}, Lppn;->e()Lzfe;

    move-result-object v0

    new-instance v1, Lnrl;

    invoke-direct {v1, p0, p1}, Lnrl;-><init>(Lnrm;Z)V

    sget-object p0, Luer;->a:Lues;

    invoke-static {v0, v1, p0}, Laaaq;->ar(Lzfe;Lzer;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public final l(Z)V
    .locals 0

    iput-boolean p1, p0, Lnrm;->x:Z

    iget-boolean p1, p0, Lnrm;->q:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnqu;->g()V

    :cond_0
    return-void
.end method

.method public final k()F
    .locals 1

    const/high16 v0, 0x3f000000    # 0.5f

    return v0
.end method

.method public final n()Lufv;
    .locals 1

    iget-object v0, p0, Lnrm;->z:Lufn;

    return-object v0
.end method

.method public final o()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f130894

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final p()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f130897

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final q()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f130896

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final s(FZLsnw;)V
    .locals 8

    invoke-static {p1}, Lobf;->p(F)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnrm;->z:Lufn;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Lsmy;->f(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lnrm;->g:Lejf;

    if-eqz v0, :cond_skip_rst

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_rst_off

    const/4 v1, 0x1

    goto :goto_rst

    :cond_rst_off
    const/4 v1, 0x0

    :goto_rst
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_skip_rst
    iget-object v0, p0, Lnrm;->v:Lppn;

    if-eqz v0, :cond_ppn

    iget-object v1, v0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_ppn

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget-object v2, v0, Losw;->d:Lugh;

    invoke-interface {v2, v1}, Lugh;->a(Ljava/lang/Object;)V

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrm;->j:Lugh;

    if-eqz v2, :cond_get_b_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_b_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_b_done

    move v1, v2

    :cond_get_b_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v3, v1, v2

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float/2addr v3, v4

    sub-float v2, p1, v2

    const/high16 v4, 0x41400000    # 12.0f

    mul-float/2addr v2, v4

    add-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    const/16 v3, 0x18

    if-le v2, v3, :cond_clamp_high_s

    move v2, v3

    :cond_clamp_high_s
    const/16 v3, -0x18

    if-ge v2, v3, :cond_clamp_low_s

    move v2, v3

    :cond_clamp_low_s
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v2}, Lugh;->a(Ljava/lang/Object;)V

    :cond_ppn
    const/4 v0, 0x1

    iget-object v1, p0, Lnrm;->r:Lnrf;

    invoke-virtual {v1, v0}, Lnrf;->c(Z)V

    iget-object v1, p0, Lnrm;->k:Lugh;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v1, p0, Lnrm;->i:Lugh;

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lnrm;->j:Lugh;

    move-object v2, v1

    check-cast v2, Lufn;

    iget-object v3, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    :cond_3
    iget-object v1, p0, Lnrm;->h:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnql;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->e:Lj$/util/Optional;

    iget-object v0, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->b:Lj$/util/Optional;

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrm;->t:Lrex;

    const/4 v1, 0x3

    float-to-double v2, p1

    invoke-virtual {v0, p3, v1, v2, v3}, Lrex;->E(Lsnw;ID)V

    return-void
.end method


.method public final h()Lsmq;
    .locals 1

    iget-object v0, p0, Lnrm;->rst:Lsmq;

    return-object v0
.end method
