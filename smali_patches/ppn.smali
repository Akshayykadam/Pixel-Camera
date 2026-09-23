.class public final Lppn;
.super Ljava/lang/Object;
.source "PG"


# instance fields
.field public a:Lppk;

.field public final b:Lufn;

.field public final c:Lufn;

.field private d:Z

.field private final e:Z

.field public final f:Losw;

.field private final g:Lulx;

.field private h:F

.field private i:F

.field private j:I

.field private k:Lzfe;

.field private l:Ljava/lang/Float;

.field private m:Ljava/lang/Float;

.field private n:Ljava/lang/Float;

.field private o:Ljava/lang/Float;

.field private p:Ljava/lang/Float;

.field private q:Ljava/lang/Float;

.field private r:Ljava/lang/Float;

.field private s:Luus;

.field private t:Lufv;

.field public final u:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final v:Lzfl;

.field private final w:Lklm;


# direct methods
.method public constructor <init>(Lklm;Losw;Lzfl;Lulm;Lulx;)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lppn;->d:Z

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v1, Lufn;

    new-instance v2, Lppm;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Lppm;-><init>(FFFIF)V

    invoke-direct {v1, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lppn;->b:Lufn;

    new-instance v1, Lufn;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-direct {v1, v3}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lppn;->c:Lufn;

    iput-object p1, p0, Lppn;->w:Lklm;

    sget-object v1, Lkim;->f:Lkiz;

    invoke-virtual {p1, v1}, Lklm;->q(Lkiz;)Z

    move-result p1

    iput-boolean p1, p0, Lppn;->e:Z

    iput-object p2, p0, Lppn;->f:Losw;

    iput-object p3, p0, Lppn;->v:Lzfl;

    const-string p1, "DualEvCtrl"

    invoke-interface {p4, p1}, Lulm;->a(Ljava/lang/String;)Luln;

    iput-object p5, p0, Lppn;->g:Lulx;

    const/high16 p1, 0x3f000000    # 0.5f

    iput p1, p0, Lppn;->h:F

    iput v2, p0, Lppn;->i:F

    iput v0, p0, Lppn;->j:I

    return-void
.end method

.method private static k(F)F
    .locals 2

    const v0, 0x3cf5c28f    # 0.03f

    const v1, 0x3f7851ec    # 0.97f

    invoke-static {p0, v0, v1}, Laaaq;->aH(FFF)F

    move-result p0

    return p0
.end method

.method private final declared-synchronized l(F)F
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lppn;->m()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, v1, v0}, Laaaq;->aH(FFF)F

    move-result p1

    const/high16 v1, -0x40800000    # -1.0f

    add-float/2addr p1, v1

    add-float/2addr v0, v1

    div-float/2addr p1, v0

    float-to-double v0, p1

    const-wide/high16 v2, 0x3fe8000000000000L    # 0.75

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    double-to-float p1, v0

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

.method private final m()F
    .locals 3

    const/4 v0, 0x1

    iget-boolean v1, p0, Lppn;->d:Z

    if-eq v0, v1, :cond_0

    const v0, 0x4174cccd    # 15.3f

    goto :goto_0

    :cond_0
    const v0, 0x413e6666    # 11.9f

    :goto_0
    iget-object v1, p0, Lppn;->o:Ljava/lang/Float;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lppn;->p:Ljava/lang/Float;

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v2, p0, Lppn;->o:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float/2addr v1, v2

    goto :goto_2

    :cond_2
    :goto_1
    move v1, v0

    :goto_2
    iget-object p0, p0, Lppn;->w:Lklm;

    sget-object v2, Lkim;->e:Lkiz;

    invoke-virtual {p0, v2}, Lklm;->q(Lkiz;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/high16 p0, 0x40800000    # 4.0f

    mul-float/2addr v1, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p0

    return p0

    :cond_3
    return v0
.end method

.method private final declared-synchronized n(F)F
    .locals 4

    monitor-enter p0

    float-to-double v0, p1

    :try_start_0
    invoke-direct {p0}, Lppn;->m()F

    move-result p1

    const-wide v2, 0x3ff5555560000000L    # 1.3333333730697632

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    double-to-float v0, v0

    const/high16 v1, -0x40800000    # -1.0f

    add-float/2addr p1, v1

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p1, v0

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

.method private final declared-synchronized o(FFF)V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lppn;->o:Ljava/lang/Float;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lppn;->p:Ljava/lang/Float;

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    iput-object p3, p0, Lppn;->q:Ljava/lang/Float;

    div-float/2addr p2, p1

    invoke-direct {p0, p2}, Lppn;->l(F)F

    move-result p1

    invoke-static {p1}, Lppn;->k(F)F

    move-result p1

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->log(D)D

    move-result-wide p1

    iget p3, p0, Lppn;->i:F

    invoke-static {p3}, Lppn;->k(F)F

    move-result p3

    float-to-double v0, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    div-double/2addr p1, v0

    double-to-float p1, p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lppn;->r:Ljava/lang/Float;
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

.method private final declared-synchronized p()V
    .locals 6

    monitor-enter p0

    :try_start_0
    new-instance v0, Lppm;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lppm;-><init>(FFFIF)V

    iget-object v1, p0, Lppn;->b:Lufn;

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lppn;->l:Ljava/lang/Float;

    iput-object v0, p0, Lppn;->m:Ljava/lang/Float;

    iput-object v0, p0, Lppn;->n:Ljava/lang/Float;

    iput-object v0, p0, Lppn;->o:Ljava/lang/Float;

    iput-object v0, p0, Lppn;->p:Ljava/lang/Float;

    iput-object v0, p0, Lppn;->q:Ljava/lang/Float;

    iput-object v0, p0, Lppn;->r:Ljava/lang/Float;
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

.method private static q(F)Z
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p0, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float p0, p0, v0

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final declared-synchronized a(FF)Lppm;
    .locals 10

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    if-eqz v0, :cond_skip_u

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_skip_u
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, v0, v1}, Laaaq;->aH(FFF)F

    move-result p1

    const v0, 0x3d4ccccd    # 0.05f

    invoke-static {p2, v0, v1}, Laaaq;->aH(FFF)F

    move-result p2

    iget-object v0, p0, Lppn;->s:Luus;

    if-eqz v0, :cond_default_s

    invoke-interface {v0}, Luus;->a()F

    move-result v0

    iget-object v1, p0, Lppn;->s:Luus;

    invoke-interface {v1}, Luus;->f()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    iget-object v2, p0, Lppn;->s:Luus;

    invoke-interface {v2}, Luus;->e()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    goto :goto_ev_calc

    :cond_default_s
    const v0, 0x3e2aaaab    # 0.16666667f (1/6 EV step)

    const/high16 v1, -0x3f800000    # -4.0f min EV

    const/high16 v2, 0x40800000    # +4.0f max EV

    :goto_ev_calc
    sub-float/2addr v2, v1

    mul-float/2addr v2, p1

    add-float/2addr v1, v2

    div-float v2, v1, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v6

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    float-to-double v4, v1

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    double-to-float v3, v8

    float-to-double v4, p2

    const-wide/high16 v8, 0x3fe8000000000000L    # 0.75

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    double-to-float v7, v8

    mul-float v4, v3, v7

    move v5, v3

    new-instance v2, Lppm;

    invoke-direct/range {v2 .. v7}, Lppm;-><init>(FFFIF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized b()Lppp;
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lppn;->l:Ljava/lang/Float;

    const/high16 v1, 0x3f000000    # 0.5f

    if-eqz v0, :cond_2

    iget-object v2, p0, Lppn;->m:Ljava/lang/Float;

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lppn;->n:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v2, p0, Lppn;->m:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, p0, Lppn;->n:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    div-float/2addr v2, v0

    iput v1, p0, Lppn;->h:F

    invoke-direct {p0, v2}, Lppn;->l(F)F

    move-result v0

    iput v0, p0, Lppn;->i:F

    iget v1, p0, Lppn;->j:I

    if-lez v1, :cond_1

    const v1, 0x3da3d70a    # 0.08f

    const v2, 0x3f6b851f    # 0.92f

    invoke-static {v0, v1, v2}, Laaaq;->aH(FFF)F

    move-result v0

    iput v0, p0, Lppn;->i:F

    :cond_1
    iget v1, p0, Lppn;->h:F

    new-instance v2, Lppp;

    invoke-direct {v2, v1, v0}, Lppp;-><init>(FF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    :cond_2
    :goto_0
    :try_start_1
    new-instance v0, Lppp;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lppp;-><init>(FF)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public final declared-synchronized c()Lufv;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lppn;->b:Lufn;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final declared-synchronized d()Lyve;
    .locals 8

    monitor-enter p0

    :try_start_0
    sget-object v0, Lyve;->a:Lyve;

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v0

    iget-object v1, p0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lppn;->o:Ljava/lang/Float;

    if-eqz v1, :cond_7

    iget-object v2, p0, Lppn;->p:Ljava/lang/Float;

    if-nez v2, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v2, p0, Lppn;->q:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v2, p0, Lppn;->p:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, p0, Lppn;->q:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v4, p0, Lppn;->b:Lufn;

    iget-object v4, v4, Lufn;->c:Ljava/lang/Object;

    check-cast v4, Lppm;

    iget-object v5, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_1
    iget-object v5, v0, Laaxk;->b:Laaxp;

    move-object v6, v5

    check-cast v6, Lyve;

    iget v7, v6, Lyve;->b:I

    or-int/lit8 v7, v7, 0x1

    iput v7, v6, Lyve;->b:I

    iput v1, v6, Lyve;->c:F

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_2
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v5, v1

    check-cast v5, Lyve;

    iget v6, v5, Lyve;->b:I

    or-int/lit8 v6, v6, 0x2

    iput v6, v5, Lyve;->b:I

    iput v2, v5, Lyve;->d:F

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_3
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v2, v1

    check-cast v2, Lyve;

    iget v5, v2, Lyve;->b:I

    or-int/lit8 v5, v5, 0x4

    iput v5, v2, Lyve;->b:I

    iput v3, v2, Lyve;->e:F

    iget v2, v4, Lppm;->b:F

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_4
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v3, v1

    check-cast v3, Lyve;

    iget v5, v3, Lyve;->b:I

    or-int/lit8 v5, v5, 0x8

    iput v5, v3, Lyve;->b:I

    iput v2, v3, Lyve;->f:F

    iget v2, v4, Lppm;->c:F

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_5
    iget-object v1, v0, Laaxk;->b:Laaxp;

    move-object v3, v1

    check-cast v3, Lyve;

    iget v5, v3, Lyve;->b:I

    or-int/lit8 v5, v5, 0x10

    iput v5, v3, Lyve;->b:I

    iput v2, v3, Lyve;->g:F

    iget v2, v4, Lppm;->d:F

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_6
    iget-object v1, v0, Laaxk;->b:Laaxp;

    check-cast v1, Lyve;

    iget v3, v1, Lyve;->b:I

    or-int/lit8 v3, v3, 0x20

    iput v3, v1, Lyve;->b:I

    iput v2, v1, Lyve;->h:F

    invoke-virtual {v0}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Lyve;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_7
    :goto_0
    :try_start_1
    invoke-virtual {v0}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Lyve;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public final e()Lzfe;
    .locals 6

    iget-object v0, p0, Lppn;->k:Lzfe;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lzfe;->isDone()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lppn;->g:Lulx;

    const-string v1, "PckDualEvController#waitForAeReset"

    invoke-interface {v0, v1}, Lulx;->a(Ljava/lang/String;)Lulz;

    move-result-object v0

    iget v1, p0, Lppn;->j:I

    if-gtz v1, :cond_1

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v2, Lzfa;

    invoke-direct {v2, v1}, Lzfa;-><init>(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lppn;->p()V

    new-instance v1, Lppk;

    invoke-direct {v1}, Lppk;-><init>()V

    monitor-enter p0

    :try_start_0
    iput-object v1, p0, Lppn;->a:Lppk;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, p0, Lppn;->v:Lzfl;

    iget-object v1, v1, Lppk;->b:Lzfr;

    const-wide/16 v3, 0x1f4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v1, v3, v4, v5, v2}, Laaaq;->ao(Lzfe;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Lzfe;

    move-result-object v1

    new-instance v3, Lpez;

    const/16 v4, 0x9

    invoke-direct {v3, v4}, Lpez;-><init>(I)V

    sget v4, Lzcp;->d:I

    const-class v4, Ljava/lang/Throwable;

    new-instance v5, Lzco;

    invoke-direct {v5, v1, v4, v3}, Lzco;-><init>(Lzfe;Ljava/lang/Class;Lxvv;)V

    invoke-static {v2, v5}, Laaaq;->aa(Ljava/util/concurrent/Executor;Lzcx;)Ljava/util/concurrent/Executor;

    move-result-object v2

    invoke-interface {v1, v5, v2}, Lzfe;->c(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    new-instance v1, Lphy;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lphy;-><init>(Ljava/lang/Object;I)V

    sget-object v2, Lzdy;->a:Lzdy;

    invoke-interface {v5, v1, v2}, Lzfe;->c(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    move-object v2, v5

    :goto_0
    new-instance v1, Lmmh;

    const/4 v3, 0x2

    invoke-direct {v1, p0, v0, v3}, Lmmh;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    iget-object v0, p0, Lppn;->v:Lzfl;

    sget v3, Lzdj;->c:I

    new-instance v3, Lzdi;

    invoke-direct {v3, v2, v1}, Lzdi;-><init>(Lzfe;Lxvv;)V

    invoke-static {v0, v3}, Laaaq;->aa(Ljava/util/concurrent/Executor;Lzcx;)Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Lzfe;->c(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    iput-object v3, p0, Lppn;->k:Lzfe;

    :cond_2
    iget-object p0, p0, Lppn;->k:Lzfe;

    return-object p0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final declared-synchronized f()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lppn;->e:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lppn;->j:I

    invoke-virtual {p0}, Lppn;->i()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0}, Lppn;->p()V

    iget-object v1, p0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
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

.method public final declared-synchronized g()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lppn;->e:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lppn;->i()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lppn;->j:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lppn;->j:I

    invoke-direct {p0}, Lppn;->p()V

    iget-object v0, p0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
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

.method public final declared-synchronized h(Luus;FFF)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lppn;->s:Luus;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lppn;->d:Z

    iget-object v0, p0, Lppn;->w:Lklm;

    sget-object v1, Lkim;->d:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lppn;->s:Luus;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Luus;->l()Luve;

    move-result-object v0

    sget-object v2, Luve;->b:Luve;

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lppn;->s:Luus;

    invoke-interface {v0}, Luus;->u()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lppn;->s:Luus;

    invoke-interface {v0}, Luus;->u()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x40600000    # 3.5f

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    iput-boolean v1, p0, Lppn;->d:Z

    :cond_0
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lppn;->l:Ljava/lang/Float;

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lppn;->m:Ljava/lang/Float;

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    iput-object p1, p0, Lppn;->n:Ljava/lang/Float;

    iget-object p1, p0, Lppn;->a:Lppk;

    if-eqz p1, :cond_1

    iget-object p4, p1, Lppk;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p4

    if-gtz p4, :cond_1

    iget-object p1, p1, Lppk;->b:Lzfr;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-virtual {p1, p4}, Lzfr;->d(Ljava/lang/Object;)Z

    :cond_1
    iget-object p1, p0, Lppn;->c:Lufn;

    div-float/2addr p3, p2

    invoke-direct {p0, p3}, Lppn;->l(F)F

    move-result p2

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p1, p2}, Lufn;->a(Ljava/lang/Object;)V
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

.method public final declared-synchronized i()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final declared-synchronized j(Luep;Lufv;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iput-object p2, p0, Lppn;->t:Lufv;

    const/4 p2, 0x2

    new-array p2, p2, [Lufv;

    iget-object v0, p0, Lppn;->f:Losw;

    iget-object v1, v0, Losw;->c:Lugh;

    const/4 v2, 0x0

    aput-object v1, p2, v2

    iget-object v0, v0, Losw;->d:Lugh;

    const/4 v1, 0x1

    aput-object v0, p2, v1

    invoke-static {p2}, Lugc;->a([Lufv;)Lufv;

    move-result-object p2

    new-instance v0, Lppl;

    invoke-direct {v0, p0, v2}, Lppl;-><init>(Ljava/lang/Object;I)V

    sget-object v1, Lzdy;->a:Lzdy;

    invoke-interface {p2, v0, v1}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object p2

    invoke-virtual {p1, p2}, Luep;->e(Lula;)V
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
