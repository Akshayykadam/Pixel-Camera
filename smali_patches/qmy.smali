.class public final Lqmy;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lqms;
.implements Lnno;
.implements Lnnp;
.implements Lnmd;
.implements Lnnq;


# instance fields
.field public final a:Lnnb;

.field public final b:Ladsh;

.field public final c:Lklm;

.field public final d:Lrex;

.field private final e:Lufv;

.field private final f:Lufv;

.field private g:Z

.field private final h:Ljava/util/List;

.field private final i:Ladca;

.field private final j:Ladca;

.field private final k:Lqtd;


# direct methods
.method public constructor <init>(Lqtd;Lqtd;Leis;Lnnb;Lhze;Lklm;Lufv;Lssw;Lrex;Lufv;Luer;)V
    .locals 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqmy;->k:Lqtd;

    iput-object p4, p0, Lqmy;->a:Lnnb;

    iput-object p6, p0, Lqmy;->c:Lklm;

    iput-object p7, p0, Lqmy;->e:Lufv;

    iput-object p9, p0, Lqmy;->d:Lrex;

    iput-object p10, p0, Lqmy;->f:Lufv;

    new-instance p2, Laddu;

    const/4 p4, 0x0

    invoke-direct {p2, p4}, Laddu;-><init>([B)V

    sget-object p6, Lqkx;->a:Lqkx;

    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p6, Lqlf;->a:Lqlf;

    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p6, Lqlc;->a:Lqlc;

    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p6, Lqkw;->a:Lqkw;

    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p6, Lqku;->a:Lqku;

    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p6, Lqky;->a:Lqky;

    invoke-interface {p2, p6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object p6, Lkjq;->a:Lkiy;

    invoke-virtual {p2}, Laddu;->f()Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lqmy;->h:Ljava/util/List;

    new-instance p2, Lkcp;

    const/16 p6, 0xd

    invoke-direct {p2, p0, p1, p6}, Lkcp;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    new-instance p6, Ladch;

    invoke-direct {p6, p2}, Ladch;-><init>(Ladfx;)V

    iput-object p6, p0, Lqmy;->i:Ladca;

    new-instance p2, Lqhh;

    const/4 p6, 0x5

    invoke-direct {p2, p1, p6}, Lqhh;-><init>(Ljava/lang/Object;I)V

    new-instance p1, Ladch;

    invoke-direct {p1, p2}, Ladch;-><init>(Ladfx;)V

    iput-object p1, p0, Lqmy;->j:Ladca;

    invoke-direct {p0}, Lqmy;->i()V

    new-instance p1, Lqly;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lqly;-><init>(Ljava/lang/Object;I)V

    invoke-interface {p10, p1, p11}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object p1

    invoke-virtual {p5}, Lhze;->h()Luep;

    move-result-object p9

    invoke-virtual {p9, p1}, Luep;->e(Lula;)V

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object p1

    invoke-static {p1}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object p1

    invoke-direct {p0}, Lqmy;->e()Lugh;

    move-result-object p9

    invoke-static {p9}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object p9

    invoke-static {p7}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object p10

    new-instance v0, Lqmx;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p4, v1}, Lqmx;-><init>(Lqmy;Ladel;I)V

    invoke-static {p1, p9, p10, v0}, Ladhh;->y(Ladqc;Ladqc;Ladqc;Ladgo;)Ladqc;

    move-result-object p1

    invoke-static {p1}, Ladqj;->a(Ladqc;)Ladqc;

    move-result-object p1

    new-instance p9, Ldzr;

    invoke-direct {p9, p4, p2, p4}, Ldzr;-><init>(Ladel;I[I)V

    new-instance p4, Ladqn;

    invoke-direct {p4, p1, p9, p2}, Ladqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-static {p3}, Ldwc;->d(Leis;)Leit;

    move-result-object p1

    sget-object p2, Ladsb;->a:Ladsc;

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object p3

    invoke-interface {p3}, Lugh;->d()Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p3, Lqlh;

    invoke-direct {p0}, Lqmy;->e()Lugh;

    move-result-object p9

    invoke-interface {p9}, Lugh;->d()Ljava/lang/Object;

    move-result-object p9

    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p9, Lqlh;

    invoke-interface {p7}, Lufv;->d()Ljava/lang/Object;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p7, Lsql;

    invoke-virtual {p0, p3, p9, p7}, Lqmy;->d(Lqlh;Lqlh;Lsql;)Lqnq;

    move-result-object p3

    invoke-static {p4, p1, p2, p3}, Ladhh;->C(Ladqc;Ladlm;Ladsc;Ljava/lang/Object;)Ladsh;

    move-result-object p1

    iput-object p1, p0, Lqmy;->b:Ladsh;

    invoke-virtual {p5}, Lhze;->h()Luep;

    move-result-object p1

    new-instance p2, Likv;

    const/16 p3, 0x8

    invoke-direct {p2, p0, p3}, Likv;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p8, p2}, Lssw;->a(Ljava/util/function/Supplier;)Lula;

    move-result-object p2

    invoke-virtual {p1, p2}, Luep;->e(Lula;)V

    new-instance p1, Lqcd;

    invoke-direct {p1, p0, p6}, Lqcd;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p11, p1}, Luer;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method private final e()Lugh;
    .locals 0

    iget-object p0, p0, Lqmy;->j:Ladca;

    invoke-interface {p0}, Ladca;->a()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lugh;

    return-object p0
.end method

.method private final f()Lugh;
    .locals 0

    iget-object p0, p0, Lqmy;->i:Ladca;

    invoke-interface {p0}, Ladca;->a()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lugh;

    return-object p0
.end method

.method private final g(Lqlh;)V
    .locals 2

    if-eqz p1, :cond_skip_notify

    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->onLookObjectSelected(Lqlh;)V

    :cond_skip_notify
    iget v0, p1, Lqlh;->d:I

    iget-object v1, p0, Lqmy;->d:Lrex;

    iget-object v1, v1, Lrex;->y:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-direct {p0, p1}, Lqmy;->h(Lqlh;)V

    return-void
.end method

.method private final h(Lqlh;)V
    .locals 1

    sget-object v0, Lqkv;->a:Lqkv;

    invoke-static {p1, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lqmy;->g:Z

    if-nez p1, :cond_0

    const/4 p1, 0x6

    invoke-static {p1}, Lqgu;->u(I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqmy;->g:Z

    :cond_0
    return-void
.end method

.method private final i()V
    .locals 2

    iget-object v0, p0, Lqmy;->k:Lqtd;

    sget-object v1, Lqsy;->bA:Lqtm;

    invoke-virtual {v0, v1}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lkjq;->a:Lkiy;

    const-string v0, ""

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lqmy;->e()Lugh;

    move-result-object v0

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqlh;

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object p0

    invoke-interface {p0, v0}, Lugh;->a(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private static final j(Lsql;)Z
    .locals 2

    sget-object v0, Lsql;->a:Lsql;

    invoke-virtual {p0}, Lsql;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 v1, 0x6

    if-eq p0, v1, :cond_0

    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    const/16 v1, 0x13

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    :cond_0
    :pswitch_0
    return v0

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static final k(Lsql;)Z
    .locals 2

    invoke-static {p0}, Lqmy;->j(Lsql;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lsql;->a:Lsql;

    invoke-virtual {p0}, Lsql;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 v1, 0x6

    if-eq p0, v1, :cond_0

    const/16 v1, 0x9

    if-eq p0, v1, :cond_0

    packed-switch p0, :pswitch_data_0

    goto :goto_0

    :cond_0
    :pswitch_0
    return v0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final a()Ladsh;
    .locals 0

    iget-object p0, p0, Lqmy;->b:Ladsh;

    return-object p0
.end method

.method public final b(Lqlh;)V
    .locals 1

    iget-object v0, p0, Lqmy;->e:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsql;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lqmy;->j(Lsql;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lqmy;->e()Lugh;

    move-result-object v0

    invoke-interface {v0, p1}, Lugh;->a(Ljava/lang/Object;)V

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object v0

    invoke-interface {v0, p1}, Lugh;->a(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lqmy;->g(Lqlh;)V

    return-void
.end method

.method public final c(Lqlh;)V
    .locals 1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object v0

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lqmy;->e:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsql;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lqmy;->k(Lsql;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object v0

    invoke-interface {v0, p1}, Lugh;->a(Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lqmy;->g(Lqlh;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final d(Lqlh;Lqlh;Lsql;)Lqnq;
    .locals 2

    sget-object v0, Lkjq;->a:Lkiy;

    invoke-static {p3}, Lqmy;->j(Lsql;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lqjm;->e()Lyeh;

    move-result-object v0

    goto :goto_0

    :cond_0
    sget-object v0, Lqkv;->a:Lqkv;

    invoke-static {v0}, Laaax;->aY(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_0
    invoke-static {p3}, Lqmy;->k(Lsql;)Z

    move-result p3

    if-nez p3, :cond_1

    sget-object p0, Laddh;->a:Laddh;

    goto :goto_1

    :cond_1
    iget-object p0, p0, Lqmy;->h:Ljava/util/List;

    :goto_1
    const/4 p3, 0x1

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eq p3, v1, :cond_2

    const/4 p2, 0x0

    :cond_2
    if-nez p2, :cond_3

    sget-object p2, Lqkv;->a:Lqkv;

    :cond_3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    move-object p1, p2

    goto :goto_2

    :cond_4
    sget-object p1, Lqkv;->a:Lqkv;

    :cond_5
    :goto_2
    new-instance p3, Lqnq;

    invoke-direct {p3, p1, p2, v0, p0}, Lqnq;-><init>(Lqlh;Lqlh;Ljava/util/List;Ljava/util/List;)V

    return-object p3
.end method

.method public final p(Landroid/content/Intent;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Lqmy;->i()V

    return-void
.end method

.method public final t()V
    .locals 3

    invoke-direct {p0}, Lqmy;->f()Lugh;

    move-result-object v0

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqlh;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p0, Lqmy;->d:Lrex;

    iget-object v2, v1, Lrex;->x:Ljava/lang/Integer;

    if-nez v2, :cond_0

    iget v2, v0, Lqlh;->d:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, v1, Lrex;->x:Ljava/lang/Integer;

    :cond_0
    invoke-direct {p0, v0}, Lqmy;->h(Lqlh;)V

    return-void
.end method

.method public final u()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lqmy;->g:Z

    return-void
.end method
