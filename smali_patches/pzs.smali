.class public final Lpzs;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laccc;


# instance fields
.field private final a:Laccg;

.field private final b:Laccg;

.field private final c:Laccg;

.field private final synthetic d:I


# direct methods
.method public constructor <init>(Laccg;Laccg;Laccg;I)V
    .locals 0

    iput p4, p0, Lpzs;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpzs;->a:Laccg;

    iput-object p2, p0, Lpzs;->b:Laccg;

    iput-object p3, p0, Lpzs;->c:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;Laccg;I[B)V
    .locals 0

    .line 12
    iput p4, p0, Lpzs;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpzs;->b:Laccg;

    iput-object p2, p0, Lpzs;->c:Laccg;

    iput-object p3, p0, Lpzs;->a:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;Laccg;I[C)V
    .locals 0

    .line 13
    iput p4, p0, Lpzs;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpzs;->b:Laccg;

    iput-object p2, p0, Lpzs;->a:Laccg;

    iput-object p3, p0, Lpzs;->c:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;Laccg;I[Z)V
    .locals 0

    .line 14
    iput p4, p0, Lpzs;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpzs;->c:Laccg;

    iput-object p2, p0, Lpzs;->b:Laccg;

    iput-object p3, p0, Lpzs;->a:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;Laccg;I[[C)V
    .locals 0

    .line 15
    iput p4, p0, Lpzs;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpzs;->c:Laccg;

    iput-object p2, p0, Lpzs;->a:Laccg;

    iput-object p3, p0, Lpzs;->b:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;Laccg;I[[F)V
    .locals 0

    .line 16
    iput p4, p0, Lpzs;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpzs;->a:Laccg;

    iput-object p2, p0, Lpzs;->c:Laccg;

    iput-object p3, p0, Lpzs;->b:Laccg;

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 12

    iget v0, p0, Lpzs;->d:I

    const/4 v1, 0x6

    const/4 v2, 0x0

    const/4 v3, 0x4

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lpzs;->b:Laccg;

    check-cast v0, Lmzh;

    invoke-virtual {v0}, Lmzh;->b()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lpzs;->a:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lklm;

    iget-object p0, p0, Lpzs;->c:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lulx;

    new-instance v2, Lrcq;

    invoke-direct {v2, v0, v1, p0}, Lrcq;-><init>(Landroid/content/Context;Lklm;Lulx;)V

    return-object v2

    :pswitch_0
    iget-object v0, p0, Lpzs;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    iget-object v1, p0, Lpzs;->a:Laccg;

    iget-object p0, p0, Lpzs;->c:Laccg;

    check-cast p0, Lrdg;

    invoke-virtual {p0}, Lrdg;->b()Lrdf;

    move-result-object p0

    check-cast v1, Lrdc;

    invoke-virtual {v1}, Lrdc;->b()Lrdb;

    move-result-object v1

    sget-object v2, Lkkt;->e:Lkiz;

    invoke-virtual {v0, v2}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eq v4, v0, :cond_0

    return-object p0

    :cond_0
    return-object v1

    :pswitch_1
    iget-object v0, p0, Lpzs;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwww;

    iget-object v1, p0, Lpzs;->a:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqte;

    iget-object p0, p0, Lpzs;->c:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtd;

    new-instance v1, Lrbs;

    invoke-direct {v1, v0, p0}, Lrbs;-><init>(Lwww;Lqtd;)V

    return-object v1

    :pswitch_2
    iget-object v0, p0, Lpzs;->c:Laccg;

    iget-object v1, p0, Lpzs;->b:Laccg;

    check-cast v1, Lmzl;

    invoke-virtual {v1}, Lmzl;->b()Lbe;

    move-result-object v1

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrbv;

    iget-object p0, p0, Lpzs;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzeb;

    new-instance p0, Lrbk;

    invoke-direct {p0, v1}, Lrbk;-><init>(Lbe;)V

    return-object p0

    :pswitch_3
    iget-object v0, p0, Lpzs;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object v1, p0, Lpzs;->c:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltbe;

    iget-object p0, p0, Lpzs;->a:Laccg;

    check-cast p0, Lqjd;

    invoke-virtual {p0}, Lqjd;->b()Lxwg;

    move-result-object p0

    if-nez v0, :cond_1

    sget-object p0, Lyiu;->a:Lyiu;

    goto :goto_0

    :cond_1
    new-instance v0, Lyfk;

    invoke-direct {v0}, Lyfk;-><init>()V

    new-instance v2, Ljma;

    invoke-direct {v2, v1, p0, v3}, Ljma;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v0, v2}, Lyfk;->j(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lyfk;->g()Lyfm;

    move-result-object p0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_4
    iget-object v0, p0, Lpzs;->c:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luty;

    iget-object v1, p0, Lpzs;->a:Laccg;

    iget-object p0, p0, Lpzs;->b:Laccg;

    check-cast p0, Lkvt;

    invoke-virtual {p0}, Lkvt;->b()Lrdw;

    move-result-object p0

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loui;

    new-instance v4, Lpji;

    invoke-direct {v4, p0, v0, v1, v3}, Lpji;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const-string p0, "smarts"

    new-instance v0, Lipi;

    invoke-direct {v0, v4, p0, v2}, Lipi;-><init>(Ljava/lang/Runnable;Ljava/lang/String;I)V

    return-object v0

    :pswitch_5
    iget-object v0, p0, Lpzs;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqxl;

    iget-object v2, p0, Lpzs;->c:Laccg;

    invoke-interface {v2}, Laccg;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lufv;

    iget-object p0, p0, Lpzs;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lofi;

    iget-boolean v0, v0, Lqxl;->a:Z

    if-eqz v0, :cond_2

    iget-object p0, p0, Lofi;->g:Lj$/util/Optional;

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lpud;

    const/16 v3, 0xc

    invoke-direct {v0, v3}, Lpud;-><init>(I)V

    new-instance v3, Lufy;

    invoke-direct {v3, v2, v0, v2}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {v3}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/hardware/camera2/CaptureRequest$Key;

    new-instance v2, Lnqx;

    invoke-direct {v2, p0, v1}, Lnqx;-><init>(Ljava/lang/Object;I)V

    new-instance p0, Lufy;

    invoke-direct {p0, v0, v2, v0}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {p0}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    new-instance v0, Lnrq;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lnrq;-><init>(I)V

    new-instance v1, Lufy;

    invoke-direct {v1, p0, v0, p0}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    new-instance v0, Lyjh;

    invoke-direct {v0, p0}, Lyjh;-><init>(Ljava/lang/Object;)V

    return-object v0

    :cond_2
    new-instance p0, Lowf;

    sget-object v0, Lyiu;->a:Lyiu;

    invoke-direct {p0, v0}, Lowf;-><init>(Ljava/util/Set;)V

    new-instance v0, Lufz;

    invoke-direct {v0, p0}, Lufz;-><init>(Ljava/lang/Object;)V

    new-instance p0, Lyjh;

    invoke-direct {p0, v0}, Lyjh;-><init>(Ljava/lang/Object;)V

    return-object p0

    :pswitch_6
    iget-object v0, p0, Lpzs;->c:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrex;

    new-instance v1, Lvbu;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget-object v2, p0, Lpzs;->b:Laccg;

    invoke-interface {v2}, Laccg;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lksv;

    iget-object p0, p0, Lpzs;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtd;

    new-instance v3, Lqwy;

    invoke-direct {v3, v0, v1, v2, p0}, Lqwy;-><init>(Lrex;Lvbu;Lksv;Lqtd;)V

    return-object v3

    :pswitch_7
    iget-object v0, p0, Lpzs;->c:Laccg;

    iget-object v1, p0, Lpzs;->a:Laccg;

    check-cast v1, Lmzi;

    invoke-virtual {v1}, Lmzi;->b()Landroid/app/Activity;

    move-result-object v1

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luer;

    iget-object p0, p0, Lpzs;->b:Laccg;

    check-cast p0, Lhyq;

    invoke-virtual {p0}, Lhyq;->b()Lnnb;

    move-result-object p0

    new-instance v2, Lqwp;

    invoke-direct {v2, v1, v0, p0}, Lqwp;-><init>(Landroid/app/Activity;Luer;Lnnb;)V

    return-object v2

    :pswitch_8
    iget-object v0, p0, Lpzs;->a:Laccg;

    iget-object v1, p0, Lpzs;->b:Laccg;

    check-cast v1, Luxb;

    invoke-virtual {v1}, Luxb;->b()Landroid/hardware/camera2/CameraManager;

    move-result-object v1

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lpzs;->c:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v2, Lqwo;

    invoke-direct {v2, v1, v0, p0}, Lqwo;-><init>(Landroid/hardware/camera2/CameraManager;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v2

    :pswitch_9
    iget-object v0, p0, Lpzs;->c:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luer;

    iget-object v1, p0, Lpzs;->b:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqqc;

    iget-object p0, p0, Lpzs;->a:Laccg;

    invoke-static {p0}, Laccb;->b(Laccg;)Lacbr;

    move-result-object p0

    new-instance v2, Lqrd;

    invoke-direct {v2, v0, v1, p0}, Lqrd;-><init>(Luer;Lqqc;Lacbr;)V

    return-object v2

    :pswitch_a
    iget-object v0, p0, Lpzs;->a:Laccg;

    iget-object v1, p0, Lpzs;->c:Laccg;

    check-cast v1, Lqqf;

    invoke-virtual {v1}, Lqqf;->b()Lqrf;

    move-result-object v1

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luer;

    iget-object p0, p0, Lpzs;->b:Laccg;

    check-cast p0, Laccd;

    iget-object p0, p0, Laccd;->a:Ljava/lang/Object;

    check-cast p0, Lpec;

    new-instance v2, Lqqc;

    invoke-direct {v2, v1, v0, p0}, Lqqc;-><init>(Lqrf;Luer;Lpec;)V

    return-object v2

    :pswitch_b
    iget-object v0, p0, Lpzs;->c:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ltbe;

    iget-object v0, p0, Lpzs;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lqpc;

    iget-object p0, p0, Lpzs;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lklm;

    new-instance v1, Ljtn;

    const/16 v5, 0x8

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Ljtn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I[C)V

    return-object v1

    :pswitch_c
    iget-object v0, p0, Lpzs;->a:Laccg;

    iget-object v1, p0, Lpzs;->b:Laccg;

    check-cast v1, Lmzh;

    invoke-virtual {v1}, Lmzh;->b()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liab;

    iget-object p0, p0, Lpzs;->c:Laccg;

    check-cast p0, Lkrg;

    invoke-virtual {p0}, Lkrg;->b()Lulm;

    move-result-object p0

    new-instance v2, Lqoi;

    invoke-direct {v2, v1, v0, p0}, Lqoi;-><init>(Landroid/content/Context;Liab;Lulm;)V

    return-object v2

    :pswitch_d
    iget-object v0, p0, Lpzs;->a:Laccg;

    iget-object v1, p0, Lpzs;->b:Laccg;

    check-cast v1, Ljob;

    invoke-virtual {v1}, Ljob;->b()Lufv;

    move-result-object v1

    check-cast v0, Llqu;

    invoke-virtual {v0}, Llqu;->b()Landroid/content/res/Resources;

    move-result-object v0

    iget-object p0, p0, Lpzs;->c:Laccg;

    new-instance v2, Lqmn;

    invoke-direct {v2, v1, p0, v0}, Lqmn;-><init>(Lufv;Ladbv;Landroid/content/res/Resources;)V

    return-object v2

    :pswitch_e
    iget-object v0, p0, Lpzs;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    iget-object v1, p0, Lpzs;->a:Laccg;

    check-cast v1, Linh;

    invoke-virtual {v1}, Linh;->b()Lj$/util/Optional;

    move-result-object v1

    iget-object p0, p0, Lpzs;->c:Laccg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    check-cast p0, Lqnw;

    invoke-virtual {p0}, Lqnw;->b()Lqnv;

    move-result-object p0

    return-object p0

    :pswitch_f
    iget-object v0, p0, Lpzs;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lqcf;

    iget-object v0, p0, Lpzs;->c:Laccg;

    iget-object p0, p0, Lpzs;->a:Laccg;

    check-cast p0, Llqu;

    invoke-virtual {p0}, Llqu;->b()Landroid/content/res/Resources;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lulx;

    const v0, 0x7f070c1f

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    const-string p0, "BckndCritEx"

    const-string v0, "BckndFastEx"

    const-string v1, "BckndAvgEx"

    const-string v2, "BckndSlowEx"

    move-object v3, v1

    new-instance v1, Lqcq;

    const/4 v4, -0x8

    invoke-static {p0, v4}, Ltqz;->eQ(Ljava/lang/String;I)Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    const/16 v4, 0x8

    invoke-static {v0, v4}, Ltqz;->eQ(Ljava/lang/String;I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    const/16 v4, 0xb

    invoke-static {v3, v4}, Ltqz;->eQ(Ljava/lang/String;I)Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    const/16 v3, 0x9

    invoke-static {v2, v3}, Ltqz;->eQ(Ljava/lang/String;I)Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    new-instance v6, Luxj;

    const/4 v2, 0x2

    invoke-direct {v6, v2}, Luxr;-><init>(I)V

    move-object v2, p0

    move-object v3, v0

    invoke-direct/range {v1 .. v9}, Lqcq;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ExecutorService;Luxo;Lqci;Lulx;I)V

    return-object v1

    :pswitch_10
    iget-object v0, p0, Lpzs;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnsz;

    iget-object v3, p0, Lpzs;->b:Laccg;

    invoke-interface {v3}, Laccg;->a()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvxb;

    iget-object p0, p0, Lpzs;->c:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqcf;

    new-instance v5, Lqbz;

    invoke-direct {v5, v0, v3, p0}, Lqbz;-><init>(Lnsz;Lvxb;Lqci;)V

    iget-object p0, v5, Lqbz;->b:Lnsz;

    new-instance v0, Ltbe;

    invoke-direct {v0, v5}, Ltbe;-><init>(Ljava/lang/Object;)V

    iget-object v3, p0, Lnsz;->a:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    iget-object v6, p0, Lnsz;->c:Ljava/util/EnumMap;

    sget-object v7, Lnsw;->b:Lnsw;

    invoke-virtual {v6, v7}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-virtual {v7}, Lnsw;->name()Ljava/lang/String;

    monitor-exit v3

    goto :goto_1

    :cond_4
    invoke-virtual {v7}, Lnsw;->name()Ljava/lang/String;

    new-instance v8, Lufn;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v8, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ltbe;->g()Lufv;

    move-result-object v2

    new-instance v9, Liwf;

    invoke-direct {v9, p0, v1}, Liwf;-><init>(Ljava/lang/Object;I)V

    iget-object v1, p0, Lnsz;->b:Ljava/util/concurrent/Executor;

    invoke-interface {v2, v9, v1}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v0}, Ltbe;->f()Lufv;

    move-result-object v9

    new-instance v10, Liwf;

    const/4 v11, 0x7

    invoke-direct {v10, p0, v11}, Liwf;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v9, v10, v1}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    new-instance v9, Lqjb;

    invoke-static {v2, v1}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v1

    invoke-direct {v9, v0, v8, v1, v4}, Lqjb;-><init>(Ltbe;Lufn;Ljava/util/Collection;I)V

    invoke-virtual {v6, v7, v9}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lnsz;->a()V

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_1
    iget-object p0, v5, Lqbz;->b:Lnsz;

    iget-object v1, p0, Lnsz;->a:Ljava/lang/Object;

    sget-object v0, Lnsw;->b:Lnsw;

    monitor-enter v1

    :try_start_1
    iget-object p0, p0, Lnsz;->c:Ljava/util/EnumMap;

    invoke-virtual {p0, v0}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0, v0}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqjb;

    iget-object p0, p0, Lqjb;->b:Ljava/lang/Object;

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iput-object p0, v5, Lqbz;->d:Lufv;

    iget-object p0, v5, Lqbz;->d:Lufv;

    new-instance v0, Lqly;

    invoke-direct {v0, v5, v4}, Lqly;-><init>(Ljava/lang/Object;I)V

    new-instance v1, Lzdz;

    invoke-direct {v1}, Lzdz;-><init>()V

    invoke-interface {p0, v0, v1}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    new-instance p0, Lqbx;

    invoke-direct {p0, v5}, Lqbx;-><init>(Lqbz;)V

    iput-object p0, v5, Lqbz;->e:Lukp;

    return-object v5

    :cond_5
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v2, "Feature not registered: "

    invoke-static {v0, v2}, La;->bR(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_1
    move-exception v0

    move-object p0, v0

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0

    :pswitch_11
    iget-object v0, p0, Lpzs;->b:Laccg;

    check-cast v0, Lmzh;

    invoke-virtual {v0}, Lmzh;->b()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lpzs;->a:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Executor;

    new-instance v2, Lipk;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lpzs;->c:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lulx;

    new-instance v3, Lpvt;

    const/16 v4, 0x13

    invoke-direct {v3, v0, v4}, Lpvt;-><init>(Ljava/lang/Object;I)V

    new-instance v0, Lqcf;

    invoke-direct {v0, v3, v1, v2, p0}, Lqcf;-><init>(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;Lvbw;Lulx;)V

    return-object v0

    :pswitch_12
    iget-object v0, p0, Lpzs;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrpm;

    iget-object v1, p0, Lpzs;->c:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqtd;

    iget-object p0, p0, Lpzs;->a:Laccg;

    check-cast p0, Lmzh;

    invoke-virtual {p0}, Lmzh;->b()Landroid/content/Context;

    move-result-object p0

    new-instance v2, Lpys;

    invoke-direct {v2, v0, v1, p0}, Lpys;-><init>(Lrpm;Lqtd;Landroid/content/Context;)V

    return-object v2

    :pswitch_13
    iget-object v0, p0, Lpzs;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    iget-object v1, p0, Lpzs;->c:Laccg;

    iget-object p0, p0, Lpzs;->b:Laccg;

    check-cast p0, Lmzh;

    invoke-virtual {p0}, Lmzh;->b()Landroid/content/Context;

    move-result-object p0

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqgu;

    new-instance v1, Lsoz;

    invoke-direct {v1, v0, p0}, Lsoz;-><init>(Lklm;Landroid/content/Context;)V

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
