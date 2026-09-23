.class public final Lpil;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laccc;


# instance fields
.field private final a:Laccg;

.field private final b:Laccg;

.field private final synthetic c:I


# direct methods
.method public constructor <init>(Laccg;Laccg;I)V
    .locals 0

    iput p3, p0, Lpil;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpil;->a:Laccg;

    iput-object p2, p0, Lpil;->b:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;I[C)V
    .locals 0

    .line 10
    iput p3, p0, Lpil;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpil;->b:Laccg;

    iput-object p2, p0, Lpil;->a:Laccg;

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 6

    iget v0, p0, Lpil;->c:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpqn;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-static {p0}, Laccb;->b(Laccg;)Lacbr;

    move-result-object p0

    new-instance v1, Lyek;

    invoke-direct {v1}, Lyek;-><init>()V

    invoke-virtual {v0}, Lpqn;->b()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {p0}, Lacbr;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    goto/16 :goto_3

    :pswitch_0
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object p0, p0, Lpil;->b:Laccg;

    check-cast p0, Lkvt;

    invoke-virtual {p0}, Lkvt;->b()Lrdw;

    move-result-object p0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lrdw;->a:Ljava/lang/Object;

    sget-object v0, Lkjw;->j:Lkiz;

    check-cast p0, Lklm;

    invoke-virtual {p0, v0}, Lklm;->q(Lkiz;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luus;

    sget-object v1, Lpru;->a:Landroid/os/Handler;

    sget-object v1, Louj;->h:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v1, p0}, Lppi;->l(Landroid/hardware/camera2/CaptureRequest$Key;Luus;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lovs;

    sget-object v2, Lovs;->c:Lovs;

    invoke-virtual {p0, v2}, Lovs;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/lit8 v2, p0, 0x1

    if-nez p0, :cond_1

    sget-object p0, Lpru;->a:Landroid/os/Handler;

    new-instance v3, Lpap;

    const/4 v4, 0x7

    invoke-direct {v3, v0, v4}, Lpap;-><init>(Ljava/lang/Object;I)V

    const-wide/16 v4, 0x1f4

    invoke-virtual {p0, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    new-instance v0, Lupd;

    invoke-direct {v0, v1, p0}, Lupd;-><init>(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    new-instance p0, Lowf;

    new-instance v1, Lyjh;

    invoke-direct {v1, v0}, Lyjh;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v1}, Lowf;-><init>(Ljava/util/Set;)V

    return-object p0

    :cond_2
    new-instance p0, Lowf;

    sget-object v0, Lyiu;->a:Lyiu;

    invoke-direct {p0, v0}, Lowf;-><init>(Ljava/util/Set;)V

    return-object p0

    :pswitch_2
    iget-object v0, p0, Lpil;->b:Laccg;

    iget-object p0, p0, Lpil;->a:Laccg;

    check-cast p0, Lprt;

    invoke-virtual {p0}, Lprt;->b()Lprl;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luep;

    invoke-virtual {v0, p0}, Luep;->e(Lula;)V

    return-object p0

    :pswitch_3
    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luoi;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxwg;

    new-instance v1, Lnqx;

    const/16 v2, 0xd

    invoke-direct {v1, v0, v2}, Lnqx;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0, v1}, Lxwg;->b(Lxvv;)Lxwg;

    move-result-object p0

    return-object p0

    :pswitch_4
    iget-object v0, p0, Lpil;->a:Laccg;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-static {p0}, Laccb;->b(Laccg;)Lacbr;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpsw;

    goto :goto_0

    :cond_3
    invoke-interface {p0}, Lacbr;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpsw;

    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_5
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpwz;

    new-instance v2, Lrdw;

    invoke-direct {v2, v0, p0, v1}, Lrdw;-><init>(Ljava/lang/Object;Ljava/lang/Object;[C)V

    return-object v2

    :pswitch_6
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpwz;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    sget-object v0, Lpsz;->k:Lpsz;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lrdw;

    invoke-direct {v0, v2, p0, v1}, Lrdw;-><init>(Ljava/lang/Object;Ljava/lang/Object;[C)V

    return-object v0

    :pswitch_7
    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lppu;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_8
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lufv;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyeo;

    new-instance v1, Lnqx;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Lnqx;-><init>(Ljava/lang/Object;I)V

    new-instance p0, Lufy;

    invoke-direct {p0, v0, v1, v0}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {p0}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_9
    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lufv;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyeo;

    new-instance v1, Lnqx;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Lnqx;-><init>(Ljava/lang/Object;I)V

    new-instance p0, Lufy;

    invoke-direct {p0, v0, v1, v0}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {p0}, Lufr;->a(Lufv;)Lufv;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_a
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrex;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Executor;

    new-instance v1, Lpox;

    invoke-direct {v1, v0, p0}, Lpox;-><init>(Lrex;Ljava/util/concurrent/Executor;)V

    return-object v1

    :pswitch_b
    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luoi;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxwg;

    invoke-virtual {p0}, Lxwg;->h()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lupi;

    invoke-interface {v0, p0}, Luoi;->i(Lupi;)Luoo;

    move-result-object p0

    invoke-static {p0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object p0

    return-object p0

    :cond_5
    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0

    :pswitch_c
    iget-object v0, p0, Lpil;->b:Laccg;

    check-cast v0, Lkuk;

    invoke-virtual {v0}, Lkuk;->b()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhxf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v0, :cond_6

    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :cond_6
    sget-object p0, Laddj;->a:Laddj;

    return-object p0

    :pswitch_d
    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lppn;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpjo;

    invoke-virtual {v0}, Lppn;->f()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lpap;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lpap;-><init>(Ljava/lang/Object;I)V

    new-instance p0, Lipi;

    const-string v1, "3aexcomp"

    invoke-direct {p0, v0, v1, v2}, Lipi;-><init>(Ljava/lang/Runnable;Ljava/lang/String;I)V

    return-object p0

    :pswitch_e
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    iget-object p0, p0, Lpil;->b:Laccg;

    check-cast p0, Lovw;

    invoke-virtual {p0}, Lovw;->b()Loui;

    move-result-object p0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p0}, Luus;->B()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_7
    new-instance p0, Lyfk;

    invoke-direct {p0}, Lyfk;-><init>()V

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lupd;

    iget-object v3, v2, Lupd;->a:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v3}, Landroid/hardware/camera2/CaptureRequest$Key;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {p0, v2}, Lyfk;->j(Ljava/lang/Object;)V

    goto :goto_2

    :cond_9
    invoke-virtual {p0}, Lyfk;->g()Lyfm;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_f
    iget-object v0, p0, Lpil;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqtd;

    new-instance v1, Lrdw;

    invoke-direct {v1, v0, p0}, Lrdw;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :pswitch_10
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    sget-object v1, Lkki;->c:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object p0, p0, Lpil;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :cond_a
    new-instance p0, Lpip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object p0

    return-object p0

    :pswitch_11
    iget-object v0, p0, Lpil;->b:Laccg;

    check-cast v0, Laccd;

    iget-object v0, v0, Laccd;->a:Ljava/lang/Object;

    check-cast v0, Lovu;

    iget-object p0, p0, Lpil;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Luep;

    sget-object v1, Lpis;->a:Lpis;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p0, v1}, Lovu;->d(Luep;Lpis;)Lpim;

    move-result-object p0

    return-object p0

    :pswitch_12
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lulx;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lklm;

    new-instance v1, Lpij;

    invoke-direct {v1, v0, p0}, Lpij;-><init>(Lulx;Lklm;)V

    return-object v1

    :pswitch_13
    iget-object v0, p0, Lpil;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpij;

    iget-object p0, p0, Lpil;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Executor;

    new-instance v1, Lpik;

    invoke-direct {v1, v0, p0, v2}, Lpik;-><init>(Lpij;Ljava/util/concurrent/Executor;I)V

    return-object v1

    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ladbv;

    invoke-interface {v2}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lupk;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    iget-object v3, v2, Lupk;->b:Lxwg;

    iget-object v2, v2, Lupk;->d:Lulc;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpsz;

    invoke-static {}, Lupm;->a()Lwzf;

    move-result-object v4

    invoke-virtual {v4, v3}, Lwzf;->f(Lxwg;)V

    invoke-virtual {v4, v2}, Lwzf;->g(Lulc;)V

    invoke-virtual {v4}, Lwzf;->e()Lupm;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lyek;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    :cond_b
    invoke-virtual {v1}, Lyek;->b()Lyeo;

    move-result-object p0

    return-object p0

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
