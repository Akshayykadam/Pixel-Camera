.class public final Lqau;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laccc;


# instance fields
.field private final a:Laccg;

.field private final synthetic b:I


# direct methods
.method public constructor <init>(Laccg;I)V
    .locals 0

    iput p2, p0, Lqau;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqau;->a:Laccg;

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 4

    iget v0, p0, Lqau;->b:I

    const/4 v1, 0x7

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_0

    iget-object p0, p0, Lqau;->a:Laccg;

    check-cast p0, Lqoq;

    invoke-virtual {p0}, Lqoq;->b()Lqjm;

    new-instance p0, Lnce;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpec;

    invoke-direct {v0, p0}, Lpec;-><init>(Ljava/lang/Object;)V

    return-object v0

    :pswitch_0
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lklm;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqnt;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lqnt;->b:Ladsh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_2
    iget-object p0, p0, Lqau;->a:Laccg;

    check-cast p0, Linh;

    invoke-virtual {p0}, Linh;->b()Lj$/util/Optional;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    new-instance p0, Lqlu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :cond_1
    new-instance p0, Lqlt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-object p0

    :pswitch_3
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzfg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ladmo;

    invoke-direct {v0, p0}, Ladmo;-><init>(Ljava/util/concurrent/Executor;)V

    invoke-static {v0}, Ladht;->S(Ladep;)Ladlm;

    move-result-object p0

    return-object p0

    :pswitch_4
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrex;

    invoke-static {}, Lipn;->b()Lzcl;

    new-instance v0, Lqjb;

    invoke-direct {v0, p0, v2}, Lqjb;-><init>(Lrex;I)V

    return-object v0

    :pswitch_5
    iget-object p0, p0, Lqau;->a:Laccg;

    check-cast p0, Laccd;

    iget-object p0, p0, Laccd;->a:Ljava/lang/Object;

    check-cast p0, Lpec;

    new-instance v0, Lqit;

    invoke-direct {v0, p0}, Lqit;-><init>(Lpec;)V

    return-object v0

    :pswitch_6
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj$/util/Optional;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ldlx;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Ldlx;-><init>(I)V

    new-instance v1, Lpph;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lpph;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v0

    if-eq v3, v0, :cond_2

    return-object p0

    :cond_2
    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    iget-object v0, v1, Lpph;->a:Ljava/lang/Object;

    invoke-interface {v0, p0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    return-object p0

    :pswitch_7
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj$/util/Optional;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lmbc;

    invoke-direct {v0, v1}, Lmbc;-><init>(I)V

    new-instance v1, Lqhs;

    invoke-direct {v1, v0, v3}, Lqhs;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v0

    if-eq v3, v0, :cond_3

    return-object p0

    :cond_3
    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    iget-object v0, v1, Lqhs;->a:Ljava/lang/Object;

    invoke-interface {v0, p0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj$/util/Optional;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ldlx;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Ldlx;-><init>(I)V

    new-instance v1, Lpph;

    const/4 v2, 0x3

    invoke-direct {v1, v0, v2}, Lpph;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v0

    if-eq v3, v0, :cond_4

    return-object p0

    :cond_4
    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    iget-object v0, v1, Lpph;->a:Ljava/lang/Object;

    invoke-interface {v0, p0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    return-object p0

    :pswitch_9
    iget-object p0, p0, Lqau;->a:Laccg;

    check-cast p0, Linh;

    invoke-virtual {p0}, Linh;->b()Lj$/util/Optional;

    move-result-object p0

    new-instance v0, Lrdw;

    invoke-direct {v0, p0}, Lrdw;-><init>(Lj$/util/Optional;)V

    return-object v0

    :pswitch_a
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnzm;

    new-instance v0, Lqgs;

    invoke-direct {v0, p0}, Lqgs;-><init>(Lnzm;)V

    return-object v0

    :pswitch_b
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqgl;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v0, Lqgm;

    const-wide/32 v1, 0x7a120

    invoke-direct {v0, p0, v1, v2}, Lqgm;-><init>(Lqgl;J)V

    return-object v0

    :pswitch_c
    iget-object p0, p0, Lqau;->a:Laccg;

    check-cast p0, Lqfp;

    invoke-virtual {p0}, Lqfp;->b()Lgxu;

    move-result-object p0

    return-object p0

    :pswitch_d
    new-instance v0, Lqdr;

    invoke-direct {v0}, Lqdr;-><init>()V

    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lklm;

    sget-object p0, Lkjl;->a:Lkiy;

    new-instance p0, Lqdr;

    invoke-direct {p0}, Lqdr;-><init>()V

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lugh;

    invoke-static {p0}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_f
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtd;

    sget-object v0, Lqbq;->a:Lqto;

    invoke-virtual {p0, v0}, Lqtd;->a(Lqsw;)Lugh;

    move-result-object p0

    new-instance v0, Lpud;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lpud;-><init>(I)V

    new-instance v1, Lufy;

    invoke-direct {v1, p0, v0, p0}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_10
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lugh;

    invoke-static {p0}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_11
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lufv;

    new-instance v0, Lpud;

    invoke-direct {v0, v1}, Lpud;-><init>(I)V

    new-instance v1, Lufy;

    invoke-direct {v1, p0, v0, p0}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_12
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lugh;

    new-instance v0, Lqar;

    invoke-direct {v0, p0}, Lqar;-><init>(Lugh;)V

    return-object v0

    :pswitch_13
    iget-object p0, p0, Lqau;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lugh;

    invoke-static {p0}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    nop

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
