.class public Lnij;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lcom/google/googlex/gcam/lasagna/LasagnaCallbacks;
.implements Lniv;


# static fields
.field public static final a:Lykq;


# instance fields
.field public final b:Lnih;

.field public final c:Lnid;

.field public final d:I

.field public final e:Lulx;

.field public final f:Lzfr;

.field public final g:Lqrg;

.field public h:Lmnk;

.field public i:Lzfr;

.field public j:Ljava/lang/Runnable;

.field public k:Z

.field public final l:Lnhk;

.field public m:Lnil;

.field public final n:Lgxt;

.field private final o:Lzot;

.field private final p:Ljava/util/concurrent/Executor;

.field private final q:Lzfr;

.field private final r:Lozw;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "nij"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnij;->a:Lykq;

    return-void
.end method

.method public constructor <init>(Lzot;Lnih;Ljava/util/concurrent/Executor;Lulx;Ltse;Lnid;Lnhk;Lzfr;Lzfr;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnij;->k:Z

    iput-object p1, p0, Lnij;->o:Lzot;

    iput-object p2, p0, Lnij;->b:Lnih;

    iput-object p3, p0, Lnij;->p:Ljava/util/concurrent/Executor;

    iput-object p4, p0, Lnij;->e:Lulx;

    iget-object p1, p5, Ltse;->d:Ljava/lang/Object;

    iput-object p1, p0, Lnij;->r:Lozw;

    iput-object p6, p0, Lnij;->c:Lnid;

    iput-object p7, p0, Lnij;->l:Lnhk;

    iput-object p8, p0, Lnij;->f:Lzfr;

    iput-object p9, p0, Lnij;->q:Lzfr;

    iget-object p1, p5, Ltse;->c:Ljava/lang/Object;

    invoke-interface {p1}, Lqrg;->q()Lqrt;

    move-result-object p1

    iget p1, p1, Lqrt;->a:I

    iput p1, p0, Lnij;->d:I

    iget-object p1, p5, Ltse;->c:Ljava/lang/Object;

    iput-object p1, p0, Lnij;->g:Lqrg;

    new-instance p1, Lgxt;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lgxt;-><init>([S)V

    iput-object p1, p0, Lnij;->n:Lgxt;

    return-void
.end method

.method private final d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    sget-object v0, Lnij;->a:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    invoke-interface {v0, p2}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object p2

    check-cast p2, Lyko;

    const/16 v0, 0xf1c

    invoke-interface {p2, v0}, Lyko;->O(I)Lyld;

    move-result-object p2

    check-cast p2, Lyko;

    const-string v0, "[shot-%s] %s"

    iget p0, p0, Lnij;->d:I

    invoke-interface {p2, v0, p0, p1}, Lyko;->y(Ljava/lang/String;ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final declared-synchronized a(IILjava/lang/String;Lxwg;)V
    .locals 7

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnij;->k:Z

    iget-object v1, p0, Lnij;->j:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_0

    :try_start_1
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    move-object v1, p0

    goto/16 :goto_4

    :cond_0
    :goto_0
    :try_start_2
    iget-object v1, p0, Lnij;->q:Lzfr;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lzfr;->d(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez p2, :cond_2b

    :try_start_3
    iget-object p2, p0, Lnij;->i:Lzfr;

    if-eqz p2, :cond_1

    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p2, p3}, Lzfr;->d(Ljava/lang/Object;)Z

    :cond_1
    iget-object p2, p0, Lnij;->n:Lgxt;

    iget-object p2, p2, Lgxt;->a:Ljava/lang/Object;

    move-object p3, p2

    check-cast p3, Laaxk;

    iget-object p3, p3, Laaxk;->b:Laaxp;

    invoke-virtual {p3}, Laaxp;->T()Z

    move-result p3

    if-nez p3, :cond_2

    move-object p3, p2

    check-cast p3, Laaxk;

    invoke-virtual {p3}, Laaxk;->o()V

    :cond_2
    move-object p3, p2

    check-cast p3, Laaxk;

    iget-object p3, p3, Laaxk;->b:Laaxp;

    check-cast p3, Lyxu;

    sget-object v1, Lyxu;->a:Lyxu;

    iget v1, p3, Lyxu;->b:I

    or-int/lit8 v1, v1, 0x2

    iput v1, p3, Lyxu;->b:I

    iput-boolean v0, p3, Lyxu;->d:Z

    invoke-virtual {p4}, Lxwg;->h()Z

    move-result p3

    if-eqz p3, :cond_2a

    invoke-virtual {p4}, Lxwg;->c()Ljava/lang/Object;

    move-result-object p3

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-object p4, p4, Lzuh;->i:Laaxu;

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {p4}, Lyny;->an(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Float;

    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    move-result p4

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p4

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_3

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_3
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit8 v2, v2, 0x20

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->g:F

    :cond_4
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit16 p4, p4, 0x80

    if-eqz p4, :cond_6

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->f:F

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_5

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_5
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit8 v2, v2, 0x40

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->h:F

    :cond_6
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit16 p4, p4, 0x100

    if-eqz p4, :cond_8

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->g:F

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_7

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_7
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit16 v2, v2, 0x80

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->i:F

    :cond_8
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit8 p4, p4, 0x10

    if-eqz p4, :cond_a

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->d:I

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_9

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_9
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit16 v2, v2, 0x200

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->k:I

    :cond_a
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit8 p4, p4, 0x20

    if-eqz p4, :cond_c

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->e:I

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_b

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_b
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit16 v2, v2, 0x400

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->l:I

    :cond_c
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit16 p4, p4, 0x200

    if-eqz p4, :cond_e

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->h:I

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_d

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_d
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit16 v2, v2, 0x800

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->m:I

    :cond_e
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit16 p4, p4, 0x800

    if-eqz p4, :cond_10

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-boolean p4, p4, Lzuh;->j:Z

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_f

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_f
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit16 v2, v2, 0x1000

    iput v2, v1, Lyxu;->b:I

    iput-boolean p4, v1, Lyxu;->n:Z

    :cond_10
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    and-int/lit8 p4, p4, 0x8

    if-eqz p4, :cond_12

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->c:I

    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_11

    move-object v1, p2

    check-cast v1, Laaxk;

    invoke-virtual {v1}, Laaxk;->o()V

    :cond_11
    move-object v1, p2

    check-cast v1, Laaxk;

    iget-object v1, v1, Laaxk;->b:Laaxp;

    check-cast v1, Lyxu;

    iget v2, v1, Lyxu;->b:I

    or-int/lit16 v2, v2, 0x2000

    iput v2, v1, Lyxu;->b:I

    iput p4, v1, Lyxu;->o:I

    :cond_12
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v1, 0x80000

    and-int/2addr p4, v1

    if-eqz p4, :cond_15

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-object p4, p4, Lzuh;->k:Lzuf;

    if-nez p4, :cond_13

    sget-object p4, Lzuf;->a:Lzuf;

    :cond_13
    invoke-static {p4}, Lgxt;->p(Lzuf;)Lyvm;

    move-result-object p4

    move-object v2, p2

    check-cast v2, Laaxk;

    iget-object v2, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v2}, Laaxp;->T()Z

    move-result v2

    if-nez v2, :cond_14

    move-object v2, p2

    check-cast v2, Laaxk;

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_14
    move-object v2, p2

    check-cast v2, Laaxk;

    iget-object v2, v2, Laaxk;->b:Laaxp;

    check-cast v2, Lyxu;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p4, v2, Lyxu;->q:Lyvm;

    iget p4, v2, Lyxu;->b:I

    const v3, 0x8000

    or-int/2addr p4, v3

    iput p4, v2, Lyxu;->b:I

    :cond_15
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v2, 0x400000

    and-int/2addr p4, v2

    if-eqz p4, :cond_18

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-object p4, p4, Lzuh;->n:Lzuf;

    if-nez p4, :cond_16

    sget-object p4, Lzuf;->a:Lzuf;

    :cond_16
    invoke-static {p4}, Lgxt;->p(Lzuf;)Lyvm;

    move-result-object p4

    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_17

    move-object v3, p2

    check-cast v3, Laaxk;

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_17
    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    check-cast v3, Lyxu;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p4, v3, Lyxu;->r:Lyvm;

    iget p4, v3, Lyxu;->b:I

    const/high16 v4, 0x10000

    or-int/2addr p4, v4

    iput p4, v3, Lyxu;->b:I

    :cond_18
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v3, 0x800000

    and-int/2addr p4, v3

    if-eqz p4, :cond_1b

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-object p4, p4, Lzuh;->o:Lzuf;

    if-nez p4, :cond_19

    sget-object p4, Lzuf;->a:Lzuf;

    :cond_19
    invoke-static {p4}, Lgxt;->p(Lzuf;)Lyvm;

    move-result-object p4

    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_1a

    move-object v3, p2

    check-cast v3, Laaxk;

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_1a
    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    check-cast v3, Lyxu;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p4, v3, Lyxu;->s:Lyvm;

    iget p4, v3, Lyxu;->b:I

    const/high16 v4, 0x20000

    or-int/2addr p4, v4

    iput p4, v3, Lyxu;->b:I

    :cond_1b
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v3, 0x1000000

    and-int/2addr p4, v3

    if-eqz p4, :cond_1e

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-object p4, p4, Lzuh;->p:Lzuf;

    if-nez p4, :cond_1c

    sget-object p4, Lzuf;->a:Lzuf;

    :cond_1c
    invoke-static {p4}, Lgxt;->p(Lzuf;)Lyvm;

    move-result-object p4

    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_1d

    move-object v3, p2

    check-cast v3, Laaxk;

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_1d
    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    check-cast v3, Lyxu;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p4, v3, Lyxu;->t:Lyvm;

    iget p4, v3, Lyxu;->b:I

    const/high16 v4, 0x40000

    or-int/2addr p4, v4

    iput p4, v3, Lyxu;->b:I

    :cond_1e
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v3, 0x2000000

    and-int/2addr p4, v3

    if-eqz p4, :cond_21

    move-object p4, p3

    check-cast p4, Lzuh;

    iget-object p4, p4, Lzuh;->q:Lzuf;

    if-nez p4, :cond_1f

    sget-object p4, Lzuf;->a:Lzuf;

    :cond_1f
    invoke-static {p4}, Lgxt;->p(Lzuf;)Lyvm;

    move-result-object p4

    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_20

    move-object v3, p2

    check-cast v3, Laaxk;

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_20
    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    check-cast v3, Lyxu;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p4, v3, Lyxu;->u:Lyvm;

    iget p4, v3, Lyxu;->b:I

    or-int/2addr p4, v1

    iput p4, v3, Lyxu;->b:I

    :cond_21
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v1, 0x100000

    and-int/2addr p4, v1

    if-eqz p4, :cond_23

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->l:F

    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_22

    move-object v3, p2

    check-cast v3, Laaxk;

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_22
    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    check-cast v3, Lyxu;

    iget v4, v3, Lyxu;->b:I

    or-int/2addr v1, v4

    iput v1, v3, Lyxu;->b:I

    iput p4, v3, Lyxu;->v:F

    :cond_23
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v1, 0x200000

    and-int/2addr p4, v1

    if-eqz p4, :cond_25

    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->m:F

    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_24

    move-object v3, p2

    check-cast v3, Laaxk;

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_24
    move-object v3, p2

    check-cast v3, Laaxk;

    iget-object v3, v3, Laaxk;->b:Laaxp;

    check-cast v3, Lyxu;

    iget v4, v3, Lyxu;->b:I

    or-int/2addr v1, v4

    iput v1, v3, Lyxu;->b:I

    iput p4, v3, Lyxu;->w:F

    :cond_25
    move-object p4, p3

    check-cast p4, Lzuh;

    iget p4, p4, Lzuh;->b:I

    const/high16 v1, 0x4000000

    and-int/2addr p4, v1

    if-eqz p4, :cond_2a

    check-cast p3, Lzuh;

    iget-object p3, p3, Lzuh;->r:Lzue;

    if-nez p3, :cond_26

    sget-object p3, Lzue;->a:Lzue;

    :cond_26
    sget-object p4, Lyse;->a:Lyse;

    invoke-virtual {p4}, Laaxp;->D()Laaxk;

    move-result-object p4

    iget-wide v3, p3, Lzue;->b:D

    iget-object v1, p4, Laaxk;->b:Laaxp;

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual {p4}, Laaxk;->o()V

    :cond_27
    iget-object v1, p4, Laaxk;->b:Laaxp;

    move-object v5, v1

    check-cast v5, Lyse;

    iget v6, v5, Lyse;->b:I

    or-int/2addr v6, v0

    iput v6, v5, Lyse;->b:I

    iput-wide v3, v5, Lyse;->c:D

    iget p3, p3, Lzue;->c:I

    invoke-virtual {v1}, Laaxp;->T()Z

    move-result v1

    if-nez v1, :cond_28

    invoke-virtual {p4}, Laaxk;->o()V

    :cond_28
    iget-object v1, p4, Laaxk;->b:Laaxp;

    check-cast v1, Lyse;

    iget v3, v1, Lyse;->b:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v1, Lyse;->b:I

    iput p3, v1, Lyse;->d:I

    invoke-virtual {p4}, Laaxk;->i()Laaxp;

    move-result-object p3

    check-cast p3, Lyse;

    move-object p4, p2

    check-cast p4, Laaxk;

    iget-object p4, p4, Laaxk;->b:Laaxp;

    invoke-virtual {p4}, Laaxp;->T()Z

    move-result p4

    if-nez p4, :cond_29

    move-object p4, p2

    check-cast p4, Laaxk;

    invoke-virtual {p4}, Laaxk;->o()V

    :cond_29
    check-cast p2, Laaxk;

    iget-object p2, p2, Laaxk;->b:Laaxp;

    check-cast p2, Lyxu;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p3, p2, Lyxu;->x:Lyse;

    iget p3, p2, Lyxu;->b:I

    or-int/2addr p3, v2

    iput p3, p2, Lyxu;->b:I

    :cond_2a
    iget-object p2, p0, Lnij;->b:Lnih;

    invoke-virtual {p2, p1, v0}, Lnih;->b(IZ)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :cond_2b
    :try_start_4
    sget-object p4, Lnij;->a:Lykq;

    invoke-virtual {p4}, Lykh;->c()Lyld;

    move-result-object p4

    const/16 v0, 0xf1d

    invoke-interface {p4, v0}, Lyko;->O(I)Lyld;

    move-result-object p4

    check-cast p4, Lyko;

    const-string v0, "[shot-%s] Final error status [%s]. "

    invoke-interface {p4, v0, p1, p3}, Lyko;->y(Ljava/lang/String;ILjava/lang/Object;)V

    const/16 p4, 0xa

    if-eq p2, p4, :cond_2c

    iget-object p2, p0, Lnij;->p:Ljava/util/concurrent/Executor;

    new-instance v0, Llz;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/16 v4, 0x11

    const/4 v5, 0x0

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    :try_start_5
    invoke-direct/range {v0 .. v5}, Llz;-><init>(Ljava/lang/Object;ILjava/lang/Object;I[B)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_2

    :cond_2c
    :goto_1
    move-object v1, p0

    :goto_2
    iget-object p0, v1, Lnij;->g:Lqrg;

    iget-object p1, v1, Lnij;->n:Lgxt;

    invoke-interface {p0}, Lqrg;->t()Lrej;

    move-result-object p0

    invoke-virtual {p1}, Lgxt;->o()Lyxu;

    move-result-object p1

    check-cast p0, Lrek;

    iput-object p1, p0, Lrek;->z:Lyxu;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit v1

    return-void

    :catchall_1
    move-exception v0

    move-object v1, p0

    :goto_3
    move-object p1, v0

    :goto_4
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p1

    :catchall_2
    move-exception v0

    goto :goto_3
.end method

.method public final declared-synchronized b(Lzub;)V
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lnij;->k:Z

    if-nez v0, :cond_1

    iget-object v0, p1, Lzub;->b:Lcom/google/googlex/gcam/FrameMetadata;

    invoke-virtual {v0}, Lcom/google/googlex/gcam/FrameMetadata;->d()J

    invoke-virtual {v0}, Lcom/google/googlex/gcam/FrameMetadata;->d()J

    move-result-wide v0

    iget-object v2, p0, Lnij;->b:Lnih;

    iget v3, p0, Lnij;->d:I

    new-instance v4, Lmyz;

    const/16 v5, 0xb

    invoke-direct {v4, p0, p1, v5}, Lmyz;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    new-instance v5, Leuv;

    const/4 v6, 0x5

    invoke-direct {v5, v0, v1, p1, v6}, Leuv;-><init>(JLjava/lang/Object;I)V

    const-string p1, "onPslFrame"

    invoke-virtual {v2, v3, p1, v4, v5}, Lnih;->d(ILjava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    sget-object p1, Lnij;->a:Lykq;

    invoke-virtual {p1}, Lykh;->c()Lyld;

    move-result-object p1

    const/16 v0, 0xf22

    invoke-interface {p1, v0}, Lyko;->O(I)Lyld;

    move-result-object p1

    check-cast p1, Lyko;

    const-string v0, "Couldn\'t post PSL frame"

    invoke-interface {p1, v0}, Lyko;->s(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    iget-object v0, p1, Lzub;->b:Lcom/google/googlex/gcam/FrameMetadata;

    invoke-virtual {v0}, Lcom/google/googlex/gcam/FrameMetadata;->d()J

    iget-object p1, p1, Lzub;->d:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
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

.method public final c()V
    .locals 2

    iget-object v0, p0, Lnij;->q:Lzfr;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lzfr;->d(Ljava/lang/Object;)Z

    iget-object v0, p0, Lnij;->l:Lnhk;

    if-eqz v0, :cond_0

    iget v1, p0, Lnij;->d:I

    invoke-virtual {v0, v1}, Lnhk;->d(I)V

    :cond_0
    iget-object p0, p0, Lnij;->r:Lozw;

    invoke-interface {p0}, Lozw;->f()V

    return-void
.end method

.method public final declared-synchronized e(Z)V
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnij;->q:Lzfr;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lzfr;->d(Ljava/lang/Object;)Z

    iget-boolean v0, p0, Lnij;->k:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    if-eq v1, p1, :cond_1

    const-string v0, "endShot"

    goto :goto_0

    :cond_1
    const-string v0, "abortShot"

    :goto_0
    iget-object v2, p0, Lnij;->b:Lnih;

    iget v3, p0, Lnij;->d:I

    new-instance v4, Lgzw;

    const/16 v5, 0x9

    invoke-direct {v4, p0, v0, p1, v5}, Lgzw;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZI)V

    new-instance p1, Lnif;

    const/4 v5, 0x4

    invoke-direct {p1, v0, v5}, Lnif;-><init>(Ljava/lang/Object;I)V

    const-string v5, "onPslDone: "

    invoke-virtual {v5, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5, v4, p1}, Lnih;->d(ILjava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)I

    move-result p1

    if-eq p1, v1, :cond_2

    sget-object p1, Lnij;->a:Lykq;

    invoke-virtual {p1}, Lykh;->c()Lyld;

    move-result-object p1

    const/16 v1, 0xf21

    invoke-interface {p1, v1}, Lyko;->O(I)Lyld;

    move-result-object p1

    check-cast p1, Lyko;

    const-string v1, "Couldn\'t post %s"

    invoke-interface {p1, v1, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
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

.method public final f(IJILjava/lang/String;Lcom/google/googlex/gcam/ShotMetadata;)V
    .locals 18

    move-object/from16 v1, p0

    move/from16 v0, p4

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    if-eqz v0, :cond_11

    add-int/lit8 v4, v0, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0}, Lzuc;->d(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v6, p5

    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Got image!!! allocationId = %d, outputType=%d (%s), description=%s)"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    iget-object v2, v1, Lnij;->e:Lulx;

    const-string v3, "MotionBlur#onImage"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-object v3, v1, Lnij;->o:Lzot;

    move-wide/from16 v4, p2

    invoke-virtual {v3, v4, v5}, Lzot;->a(J)Lxwg;

    move-result-object v3

    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "settingResult"

    invoke-interface {v2, v4}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v3}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/googlex/gcam/InterleavedImageU8;

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->d()I

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->b()I

    invoke-virtual {v3}, Lcom/google/googlex/gcam/InterleavedImageU8;->a()I

    new-instance v4, Lniz;

    move-object/from16 v5, p6

    invoke-direct {v4, v3, v0, v5}, Lniz;-><init>(Lcom/google/googlex/gcam/InterleavedImageU8;ILcom/google/googlex/gcam/ShotMetadata;)V

    invoke-static {v4}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v3

    invoke-interface {v2}, Lulx;->g()V

    goto :goto_0

    :cond_0
    sget-object v3, Lxuz;->a:Lxuz;

    :goto_0
    iget-object v2, v1, Lnij;->m:Lnil;

    if-eqz v2, :cond_10

    iget-object v4, v1, Lnij;->h:Lmnk;

    if-eqz v4, :cond_10

    :try_start_0
    invoke-virtual {v4}, Lmnk;->a()I

    iget-object v5, v2, Lnil;->e:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnia;

    if-nez v5, :cond_2

    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v3}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lniz;

    invoke-virtual {v0}, Lniz;->close()V

    :cond_1
    const-string v0, "Shot hasn\'t been started yet"

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_2
    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-virtual {v4}, Lmnk;->a()I

    move-result v0

    int-to-long v7, v0

    invoke-virtual {v3}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lniz;

    iget v4, v4, Lniz;->d:I

    iget-object v6, v2, Lnil;->g:Lmsv;

    move-object v9, v0

    check-cast v9, Lniz;

    iget-object v9, v9, Lniz;->b:Lcom/google/googlex/gcam/ShotMetadata;

    iget-object v10, v5, Lnia;->b:Lmnk;

    iget-object v11, v5, Lptj;->l:Lmnv;

    sget-object v12, Lmqa;->a:Lmqa;

    iget-object v10, v10, Lmnk;->G:Ltse;

    iget-object v14, v10, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v6, v9, v14, v11, v12}, Lmsv;->a(Lcom/google/googlex/gcam/ShotMetadata;Lqrg;Lmnv;Lmqa;)V

    invoke-interface {v14}, Lqrg;->u()Lxwg;

    move-result-object v6

    invoke-virtual {v6}, Lxwg;->k()Lj$/util/Optional;

    move-result-object v6

    invoke-virtual {v6}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    const/4 v11, 0x1

    if-ne v11, v10, :cond_3

    invoke-virtual {v6}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgxt;

    iget-object v6, v6, Lgxt;->a:Ljava/lang/Object;

    invoke-static {v6}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v6

    :cond_3
    const-string v10, ""

    invoke-virtual {v6, v10}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v6, v10}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    sget-object v10, Lmis;->a:Lzoa;

    invoke-static {v9, v6}, Laaaq;->M(Lcom/google/googlex/gcam/ShotMetadata;[B)V

    const/4 v6, 0x5

    if-ne v4, v6, :cond_4

    check-cast v0, Lniz;

    invoke-virtual {v0}, Lniz;->close()V

    goto/16 :goto_9

    :cond_4
    iget-object v6, v5, Lptj;->t:Ltse;

    iget-object v6, v6, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v6}, Lqrg;->al()Z

    move-result v6

    if-eqz v6, :cond_b

    move-object v6, v0

    check-cast v6, Lniz;

    iget-object v6, v6, Lniz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    iget v12, v5, Lnia;->e:I

    invoke-static {v12}, Laaaq;->I(I)Lznn;

    move-result-object v12

    sget-object v13, Lznn;->b:Lznn;

    if-eq v12, v13, :cond_6

    sget-object v13, Lznn;->d:Lznn;

    if-ne v12, v13, :cond_5

    goto :goto_1

    :cond_5
    const/4 v13, 0x0

    goto :goto_2

    :cond_6
    :goto_1
    move v13, v11

    :goto_2
    sget-object v15, Lznn;->i:Lznn;

    if-eq v12, v15, :cond_8

    sget-object v15, Lznn;->g:Lznn;

    if-ne v12, v15, :cond_7

    goto :goto_3

    :cond_7
    const/4 v12, 0x0

    goto :goto_4

    :cond_8
    :goto_3
    move v12, v11

    :goto_4
    if-nez v13, :cond_9

    if-eqz v12, :cond_c

    :cond_9
    new-instance v12, Lcom/google/googlex/gcam/InterleavedImageU8;

    invoke-virtual {v6}, Lcom/google/googlex/gcam/InterleavedImageU8;->d()I

    move-result v15

    invoke-virtual {v6}, Lcom/google/googlex/gcam/InterleavedImageU8;->b()I

    move-result v10

    invoke-virtual {v6}, Lcom/google/googlex/gcam/InterleavedImageU8;->a()I

    move-result v11

    invoke-direct {v12, v15, v10, v11}, Lcom/google/googlex/gcam/InterleavedImageU8;-><init>(III)V

    invoke-virtual {v6}, Lcom/google/googlex/gcam/InterleavedImageU8;->f()Lcom/google/googlex/gcam/InterleavedReadViewU8;

    move-result-object v6

    if-eqz v13, :cond_a

    sget-object v10, Lznn;->c:Lznn;

    goto :goto_5

    :cond_a
    sget-object v10, Lznn;->e:Lznn;

    :goto_5
    invoke-virtual {v12}, Lcom/google/googlex/gcam/InterleavedImageU8;->g()Lcom/google/googlex/gcam/InterleavedWriteViewU8;

    move-result-object v11

    invoke-static {v6, v10, v11}, Lcom/google/googlex/gcam/imageproc/Resample;->b(Lcom/google/googlex/gcam/InterleavedReadViewU8;Lznn;Lcom/google/googlex/gcam/InterleavedWriteViewU8;)V

    move-object v6, v12

    goto :goto_6

    :cond_b
    move-object v6, v0

    check-cast v6, Lniz;

    iget-object v6, v6, Lniz;->a:Lcom/google/googlex/gcam/InterleavedImageU8;

    :cond_c
    :goto_6
    iget-object v2, v2, Lnil;->c:Lmof;

    move-object v10, v0

    check-cast v10, Lniz;

    iget-object v10, v10, Lniz;->c:Lpwy;

    add-int/lit8 v4, v4, -0x1

    const/4 v11, 0x1

    if-eq v4, v11, :cond_d

    const/16 v12, 0x64

    goto :goto_7

    :cond_d
    const/4 v12, 0x0

    :goto_7
    if-eq v4, v11, :cond_e

    sget-object v4, Lmoe;->b:Lmoe;

    goto :goto_8

    :cond_e
    sget-object v4, Lmoe;->a:Lmoe;

    :goto_8
    move-object v13, v4

    iget-object v15, v5, Lnia;->f:Ljava/util/UUID;

    invoke-static {v6}, Lwww;->ag(Ljava/lang/Object;)Lwww;

    move-result-object v4

    iget-object v6, v2, Lmof;->f:Lklm;

    sget-object v11, Lkjl;->ba:Lkiz;

    invoke-virtual {v6, v11}, Lklm;->q(Lkiz;)Z

    move-result v6

    sget-object v17, Lxuz;->a:Lxuz;

    move-object/from16 v16, v9

    move v11, v12

    move-object v9, v4

    move v12, v6

    move-object v6, v2

    invoke-virtual/range {v6 .. v17}, Lmof;->a(JLwww;Lpwy;IZLmoe;Lqrg;Ljava/util/UUID;Lcom/google/googlex/gcam/ShotMetadata;Lxwg;)Lzfe;

    move-result-object v2

    new-instance v4, Lmvu;

    check-cast v0, Lniz;

    const/4 v6, 0x3

    invoke-direct {v4, v0, v5, v6}, Lmvu;-><init>(Lniz;Lnia;I)V

    sget-object v0, Lzdy;->a:Lzdy;

    invoke-static {v2, v4, v0}, Laaaq;->ar(Lzfe;Lzer;Ljava/util/concurrent/Executor;)V

    goto :goto_9

    :cond_f
    sget-object v2, Lnil;->a:Lykq;

    invoke-virtual {v2}, Lykh;->c()Lyld;

    move-result-object v2

    const/16 v4, 0xf3f

    invoke-interface {v2, v4}, Lyko;->O(I)Lyld;

    move-result-object v2

    check-cast v2, Lyko;

    invoke-static {v0}, Lzuc;->d(I)Ljava/lang/String;

    move-result-object v0

    const-string v4, "Motion Blur result %s was received, but ignored because it was invalid."

    invoke-interface {v2, v4, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v5}, Lnia;->e()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_9

    :catch_0
    move-exception v0

    sget-object v2, Lnij;->a:Lykq;

    invoke-virtual {v2}, Lykh;->c()Lyld;

    move-result-object v2

    invoke-interface {v2, v0}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const/16 v2, 0xf1e

    invoke-interface {v0, v2}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v2, "Error saving the image for shot %s."

    move/from16 v4, p1

    invoke-interface {v0, v2, v4}, Lyko;->t(Ljava/lang/String;I)V

    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {v3}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lniz;

    invoke-virtual {v0}, Lniz;->close()V

    :cond_10
    :goto_9
    iget-object v0, v1, Lnij;->e:Lulx;

    invoke-interface {v0}, Lulx;->g()V

    return-void

    :cond_11
    const/4 v0, 0x0

    throw v0
.end method

.method public final synthetic onFinalStatusNative(IILjava/lang/String;[B)V
    .locals 1

    const-string v0, "CAM_LASAGNA"

    invoke-static {v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1, p2, p3, p4}, Lzuc;->$default$onFinalStatusNative(Lcom/google/googlex/gcam/lasagna/LasagnaCallbacks;IILjava/lang/String;[B)V

    return-void
.end method

.method public final synthetic onImageNative(IJILjava/lang/String;J)V
    .locals 2

    const-string v0, "CAM_LASAGNA"

    const-string v1, "onImageNative called! MotionBlur image successfully generated!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static/range {p0 .. p7}, Lzuc;->$default$onImageNative(Lcom/google/googlex/gcam/lasagna/LasagnaCallbacks;IJILjava/lang/String;J)V

    return-void
.end method

.method public final onProgress(IF)V
    .locals 0

    iget-object p0, p0, Lnij;->h:Lmnk;

    if-eqz p0, :cond_0

    iget-object p0, p0, Lmnk;->G:Ltse;

    iget-object p0, p0, Ltse;->b:Ljava/lang/Object;

    sget-object p1, Lniw;->u:Lssh;

    invoke-interface {p0, p1, p2}, Lozx;->a(Lssh;F)V

    return-void

    :cond_0
    sget-object p0, Lnij;->a:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p1, 0xf20

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "Shot has been aborted."

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    return-void
.end method

.method public final onPslRequest(IZFF)V
    .locals 7

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "onPslRequest / isNeeded = %s, duration = %s, frameRate = %s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    iget-object v1, p0, Lnij;->l:Lnhk;

    if-eqz v1, :cond_3

    iget-object p2, p0, Lnij;->q:Lzfr;

    invoke-virtual {p2}, Lzfr;->isDone()Z

    move-result p2

    if-nez p2, :cond_3

    :try_start_0
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/high16 p2, 0x447a0000    # 1000.0f

    mul-float/2addr p2, p3

    iget-object v2, p0, Lnij;->r:Lozw;

    float-to-long v3, p2

    invoke-interface {v2}, Lozw;->d()Lozv;

    move-result-object p2

    const/4 v5, 0x2

    invoke-interface {p2, v5}, Lozv;->e(I)V

    invoke-interface {v2}, Lozw;->d()Lozv;

    move-result-object p2

    invoke-interface {p2, v3, v4}, Lozv;->g(J)V

    invoke-interface {v2}, Lozw;->d()Lozv;

    move-result-object p2

    invoke-interface {p2}, Lozv;->h()V

    invoke-interface {v2}, Lozw;->d()Lozv;

    move-result-object p2

    invoke-interface {p2, v0}, Lozv;->a(Ljava/lang/Object;)V

    iget-object p2, p0, Lnij;->g:Lqrg;

    invoke-interface {p2, v3, v4}, Lqrg;->ae(J)V

    iget-object p2, p0, Lnij;->f:Lzfr;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    invoke-virtual {p2, v2, v3, v0}, Lzcx;->s(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    move v2, p1

    move v3, p3

    move v4, p4

    invoke-virtual/range {v1 .. v6}, Lnhk;->e(IFFJ)V

    iget-object p1, p0, Lnij;->n:Lgxt;

    iget-object p1, p1, Lgxt;->a:Ljava/lang/Object;

    move-object p2, p1

    check-cast p2, Laaxk;

    iget-object p2, p2, Laaxk;->b:Laaxp;

    invoke-virtual {p2}, Laaxp;->T()Z

    move-result p2

    if-nez p2, :cond_0

    move-object p2, p1

    check-cast p2, Laaxk;

    invoke-virtual {p2}, Laaxk;->o()V

    :cond_0
    move-object p2, p1

    check-cast p2, Laaxk;

    iget-object p2, p2, Laaxk;->b:Laaxp;

    check-cast p2, Lyxu;

    sget-object p3, Lyxu;->a:Lyxu;

    iget p3, p2, Lyxu;->b:I

    or-int/lit8 p3, p3, 0x10

    iput p3, p2, Lyxu;->b:I

    iput v3, p2, Lyxu;->f:F

    move-object p2, p1

    check-cast p2, Laaxk;

    iget-object p2, p2, Laaxk;->b:Laaxp;

    invoke-virtual {p2}, Laaxp;->T()Z

    move-result p2

    if-nez p2, :cond_1

    move-object p2, p1

    check-cast p2, Laaxk;

    invoke-virtual {p2}, Laaxk;->o()V

    :cond_1
    check-cast p1, Laaxk;

    iget-object p1, p1, Laaxk;->b:Laaxp;

    check-cast p1, Lyxu;

    iget p2, p1, Lyxu;->b:I

    or-int/lit16 p2, p2, 0x100

    iput p2, p1, Lyxu;->b:I

    iput v4, p1, Lyxu;->j:F
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    instance-of p2, p1, Ljava/lang/InterruptedException;

    if-eqz p2, :cond_2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->interrupt()V

    :cond_2
    const-string p2, "Error collecting PSL frames."

    invoke-direct {p0, p2, p1}, Lnij;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lnij;->c()V

    return-void

    :cond_3
    iget-object p1, p0, Lnij;->r:Lozw;

    invoke-interface {p1}, Lozw;->d()Lozv;

    move-result-object p2

    const/4 p3, 0x0

    invoke-interface {p2, p3}, Lozv;->e(I)V

    invoke-interface {p1}, Lozw;->d()Lozv;

    move-result-object p1

    invoke-interface {p1}, Lozv;->h()V

    iget-object p1, p0, Lnij;->q:Lzfr;

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p1, p2}, Lzfr;->d(Ljava/lang/Object;)Z

    const-string p1, "No PSL frames to collect."

    invoke-direct {p0, p1, v0}, Lnij;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lnij;->c()V

    return-void
.end method
