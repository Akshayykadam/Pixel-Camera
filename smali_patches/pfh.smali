.class public final synthetic Lpfh;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lule;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field private final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .locals 0

    iput p2, p0, Lpfh;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpfh;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 5

    iget v0, p0, Lpfh;->b:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpzi;

    invoke-virtual {p0, p1}, Lpzi;->v(Z)V

    return-void

    :pswitch_0
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpzi;

    invoke-virtual {p0, p1}, Lpzi;->r(Z)V

    return-void

    :pswitch_1
    check-cast p1, Luep;

    new-instance v0, Louo;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Louo;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1, v0}, Luep;->e(Lula;)V

    return-void

    :pswitch_2
    check-cast p1, Lpzq;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpzi;

    invoke-virtual {p0, p1}, Lpzi;->w(Lpzq;)V

    return-void

    :pswitch_3
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eq v1, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    invoke-interface {p0}, Luoi;->c()Lunu;

    move-result-object p1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    check-cast p1, Lush;

    iput-object v0, p1, Lush;->g:Ljava/lang/Integer;

    new-instance v0, Lusg;

    invoke-direct {v0, p1}, Lusg;-><init>(Lush;)V

    invoke-interface {p0, v0}, Luoi;->y(Lunv;)V

    return-void

    :pswitch_4
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-interface {p0}, Luoi;->c()Lunu;

    move-result-object v0

    check-cast v0, Lush;

    iput-object p1, v0, Lush;->f:Ljava/lang/Integer;

    new-instance p1, Lusg;

    invoke-direct {p1, v0}, Lusg;-><init>(Lush;)V

    invoke-interface {p0, p1}, Luoi;->y(Lunv;)V

    return-void

    :pswitch_5
    check-cast p1, Lrny;

    invoke-virtual {p1}, Lrny;->c()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p1, Lrny;->b:Lrnq;

    sget-object v3, Lrnq;->a:Lrnq;

    if-eq v0, v3, :cond_6

    iget-object v3, p1, Lrny;->a:Lrob;

    sget-object v4, Lrob;->a:Lrob;

    if-eq v3, v4, :cond_6

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpkx;

    iget-object v3, p0, Lpkx;->r:Lrdw;

    invoke-virtual {v3}, Lrdw;->v()Z

    move-result v3

    if-eqz v3, :cond_1

    goto/16 :goto_3

    :cond_1
    iget-object v3, p0, Lpkx;->u:Lrdw;

    iget-object v3, v3, Lrdw;->a:Ljava/lang/Object;

    check-cast v3, Lufn;

    iget-object v3, v3, Lufn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_6

    sget-object v3, Lrnq;->c:Lrnq;

    if-eq v0, v3, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    invoke-virtual {p0, p1}, Lpkx;->b(Lrny;)Landroid/graphics/PointF;

    move-result-object p1

    iget-object v3, p0, Lpkx;->d:Losw;

    iget-object v3, v3, Losw;->a:Lugh;

    check-cast v3, Lufn;

    iget-object v3, v3, Lufn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    xor-int/2addr v1, v3

    invoke-virtual {p0, p1, v1, v0, v2}, Lpkx;->e(Landroid/graphics/PointF;ZZZ)V

    return-void

    :pswitch_6
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    if-eqz p1, :cond_3

    check-cast p0, Lpkq;

    iget-object p0, p0, Lpkq;->b:Lufd;

    invoke-virtual {p0}, Lufd;->b()V

    return-void

    :cond_3
    check-cast p0, Lpkq;

    invoke-virtual {p0}, Lpkq;->c()V

    return-void

    :pswitch_7
    check-cast p1, Lqsh;

    sget-object v0, Lqsh;->a:Lqsh;

    if-ne p1, v0, :cond_4

    sget-object p1, Lqfz;->e:Lqfz;

    goto :goto_2

    :cond_4
    sget-object p1, Lqfz;->a:Lqfz;

    :goto_2
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lufn;

    invoke-virtual {p0, p1}, Lufn;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_8
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpjo;

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_skip_pfh

    iget-object p0, p0, Lpjo;->b:Luoi;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lpjo;->a(I)Lupd;

    move-result-object p1

    invoke-interface {p0, p1}, Luoi;->r(Lupd;)V

    :cond_skip_pfh
    return-void

    :pswitch_9
    check-cast p1, Ljava/lang/Boolean;

    sget-object p1, Lphb;->a:Lykq;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->h:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_a
    check-cast p1, Ljava/lang/Boolean;

    sget-object p1, Lphb;->a:Lykq;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->f:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_b
    check-cast p1, Ljava/lang/Boolean;

    sget-object p1, Lphb;->a:Lykq;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->n:Lpfo;

    invoke-interface {p0, v1, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_c
    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->D:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->D:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_e
    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->L:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_f
    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->L:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_10
    check-cast p1, Lrwd;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->K:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_11
    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    sget-object p1, Lpfo;->K:Lpfo;

    invoke-interface {p0, v2, p1}, Lpfr;->q(ZLpfo;)V

    return-void

    :pswitch_12
    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p1, Lqsn;

    check-cast p0, Lpfj;

    iget-object v0, p0, Lpfj;->k:Lybb;

    check-cast v0, Lyik;

    iget-object v0, v0, Lyik;->d:Lyik;

    invoke-interface {v0, p1}, Lybb;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpfw;

    if-eqz p1, :cond_6

    iget-object p0, p0, Lpfj;->l:Lphm;

    invoke-virtual {p0, p1}, Lphm;->l(Lpfw;)V

    :cond_6
    :goto_3
    return-void

    :pswitch_13
    check-cast p1, Lkgm;

    iget-object p0, p0, Lpfh;->a:Ljava/lang/Object;

    check-cast p0, Lpfj;

    invoke-virtual {p0, v1}, Lpfj;->f(Z)V

    return-void

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
