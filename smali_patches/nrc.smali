.class public final synthetic Lnrc;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lsnx;


# instance fields
.field public final synthetic a:Lnqu;

.field private final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lnqu;I)V
    .locals 0

    iput p2, p0, Lnrc;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnrc;->a:Lnqu;

    return-void
.end method

.method public constructor <init>(Lnqu;I[B)V
    .locals 0

    .line 8
    iput p2, p0, Lnrc;->b:I

    iput-object p1, p0, Lnrc;->a:Lnqu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(FZLsnw;)V
    .locals 5

    iget v0, p0, Lnrc;->b:I

    const/4 v1, 0x0

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    packed-switch v0, :pswitch_data_0

    if-nez p2, :cond_8

    goto/16 :goto_0

    :pswitch_0
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lqbb;

    invoke-virtual {p0, p1}, Lqbb;->t(F)J

    move-result-wide v0

    invoke-static {v0, v1}, Lqgu;->i(J)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lqbb;->l:Lsmy;

    invoke-virtual {v2, p1}, Lsmy;->f(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1, p2, p3}, Lqbb;->v(JZLsnw;)V

    return-void

    :pswitch_1
    iget-object p0, p0, Lnrc;->a:Lnqu;

    move-object v0, p0

    check-cast v0, Lqaa;

    invoke-virtual {v0, p1}, Lqaa;->t(F)I

    move-result p1

    iget-object p0, p0, Lnqu;->a:Lsmy;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "%d"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lsmy;->f(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2, p3}, Lqaa;->v(IZLsnw;)V

    return-void

    :pswitch_2
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnrn;

    invoke-virtual {p0, p1, p2, p3}, Lnrn;->t(FZLsnw;)V

    return-void

    :pswitch_3
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnrm;

    invoke-virtual {p0, p1, p2, p3}, Lnrm;->s(FZLsnw;)V

    return-void

    :pswitch_4
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnrj;

    invoke-virtual {p0, p1, p2, p3}, Lnrj;->t(FZLsnw;)V

    return-void

    :pswitch_5
    iget-object p0, p0, Lnrc;->a:Lnqu;

    invoke-static {p1}, Lobf;->p(F)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_3

    invoke-virtual {v1, v0}, Lsmy;->f(Ljava/lang/String;)V

    :cond_3
    check-cast p0, Lnrh;

    iget-object v1, p0, Lnrh;->e:Lufn;

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2, p3}, Lnrh;->r(FZLsnw;)V

    return-void

    :pswitch_6
    iget-object p0, p0, Lnrc;->a:Lnqu;

    move-object v0, p0

    check-cast v0, Lnre;

    iget-object v1, v0, Lnre;->h:Landroid/util/Pair;

    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {p1, v2, v1}, Lobf;->n(FII)Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lnqu;->a:Lsmy;

    if-eqz p0, :cond_4

    invoke-virtual {p0, v1}, Lsmy;->f(Ljava/lang/String;)V

    :cond_4
    iget-object p0, v0, Lnre;->g:Lufn;

    invoke-virtual {p0, v1}, Lufn;->a(Ljava/lang/Object;)V

    invoke-virtual {v0, p1, p2, p3}, Lnre;->r(FZLsnw;)V

    return-void

    :pswitch_7
    if-nez p2, :cond_5

    goto/16 :goto_0

    :cond_5
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnra;

    iget p2, p0, Lnra;->g:F

    cmpl-float p2, p1, p2

    if-eqz p2, :cond_6

    move v1, v3

    :cond_6
    iget-object p2, p0, Lnra;->d:Lejf;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p2, v0}, Lejf;->i(Ljava/lang/Object;)V

    invoke-static {p1}, Lnra;->k(F)F

    move-result p1

    iget-object p2, p0, Lnra;->e:Lugh;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnql;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    iput-object v1, v0, Lnql;->j:Lj$/util/Optional;

    invoke-interface {p2, v0}, Lugh;->a(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lnra;->l()V

    float-to-double p1, p1

    iget-object p0, p0, Lnra;->i:Lrex;

    const/16 v0, 0xb

    invoke-virtual {p0, p3, v0, p1, p2}, Lrex;->E(Lsnw;ID)V

    return-void

    :pswitch_8
    iget-object p0, p0, Lnrc;->a:Lnqu;

    check-cast p0, Lnrd;

    invoke-virtual {p0, p1, p2, p3}, Lnrd;->s(FZLsnw;)V

    return-void

    :cond_8
    iget-object p0, p0, Lnrc;->a:Lnqu;

    move-object p2, p0

    check-cast p2, Lqmf;

    invoke-virtual {p2, p1}, Lqmf;->o(F)F

    move-result v0

    sget-object v2, Lsnw;->b:Lsnw;

    if-eq p3, v2, :cond_9

    move v1, v3

    :cond_9
    invoke-virtual {p2, v0, v1}, Lqmf;->n(FZ)V

    invoke-virtual {p2}, Lqmf;->r()F

    move-result v2

    invoke-virtual {p2}, Lqmf;->t()F

    move-result v3

    sub-float/2addr v2, v3

    mul-float/2addr p1, v2

    iget-object p0, p0, Lnqu;->a:Lsmy;

    if-eqz p0, :cond_b

    iget-object v2, p2, Lqmf;->e:Landroid/view/View;

    if-nez v2, :cond_a

    const-string v2, "controlUi"

    invoke-static {v2}, Ladhh;->c(Ljava/lang/String;)V

    const/4 v2, 0x0

    :cond_a
    add-float/2addr v3, p1

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2, p1, v3}, Lqmf;->D(Landroid/content/res/Resources;F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lsmy;->f(Ljava/lang/String;)V

    :cond_b
    iget-object p0, p2, Lqmf;->d:Lejf;

    invoke-virtual {p0, v4}, Lejf;->i(Ljava/lang/Object;)V

    invoke-virtual {p2}, Lqmf;->E()V

    if-eqz v1, :cond_c

    iget-object p0, p2, Lqmf;->h:Lrex;

    invoke-virtual {p2}, Lqmf;->H()I

    move-result p1

    float-to-double v0, v0

    invoke-virtual {p0, p3, p1, v0, v1}, Lrex;->E(Lsnw;ID)V

    :cond_c
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
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
