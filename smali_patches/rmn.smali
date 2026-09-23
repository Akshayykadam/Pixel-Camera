.class public final Lrmn;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lnnq;
.implements Lnne;
.implements Lnno;
.implements Lnnm;
.implements Lnnp;
.implements Lnmd;
.implements Lnmc;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Lugh;

.field public final c:Lpfr;

.field public final d:Lobb;

.field public e:Ldc;

.field public f:Z

.field public final g:Lpgd;

.field public final h:Lhyk;

.field public final i:Lhzl;

.field public final j:Lqtd;

.field public final k:Lrms;

.field public final l:Lklm;

.field private final m:Z

.field private final n:Luer;

.field private final o:Lqjp;

.field private final p:Z

.field private final q:Lqtd;

.field private final r:Lqty;

.field private final s:Ltit;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lhyk;Lqty;Lugh;Lnnb;ZLklm;Luer;Lpfr;Lhzl;Lqtd;Lqtd;Lobb;Lqjp;Ltit;Lrms;Lj$/util/Optional;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lrmn;->f:Z

    new-instance v1, Lrmm;

    invoke-direct {v1, p0}, Lrmm;-><init>(Lrmn;)V

    iput-object v1, p0, Lrmn;->g:Lpgd;

    iput-object p1, p0, Lrmn;->a:Landroid/app/Activity;

    iput-object p2, p0, Lrmn;->h:Lhyk;

    iput-object p3, p0, Lrmn;->r:Lqty;

    iput-object p4, p0, Lrmn;->b:Lugh;

    iput-boolean p6, p0, Lrmn;->m:Z

    iput-object p7, p0, Lrmn;->l:Lklm;

    iput-object p8, p0, Lrmn;->n:Luer;

    iput-object p9, p0, Lrmn;->c:Lpfr;

    iput-object p10, p0, Lrmn;->i:Lhzl;

    iput-object p11, p0, Lrmn;->j:Lqtd;

    iput-object p12, p0, Lrmn;->q:Lqtd;

    iput-object p13, p0, Lrmn;->d:Lobb;

    move-object/from16 p1, p14

    iput-object p1, p0, Lrmn;->o:Lqjp;

    move-object/from16 p1, p15

    iput-object p1, p0, Lrmn;->s:Ltit;

    move-object/from16 p1, p16

    iput-object p1, p0, Lrmn;->k:Lrms;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    move-object/from16 p2, p17

    invoke-virtual {p2, p1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrmn;->p:Z

    new-instance p1, Lqzr;

    const/16 p2, 0xc

    const/4 p3, 0x0

    invoke-direct {p1, p0, p5, p2, p3}, Lqzr;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    invoke-virtual {p8, p1}, Luer;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method private final c()V
    .locals 13

    iget-object v0, p0, Lrmn;->l:Lklm;

    sget-object v1, Lkjl;->aM:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_8

    sget-object v1, Lkjl;->aJ:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v1, p0, Lrmn;->o:Lqjp;

    iget-boolean v1, v1, Lqjp;->a:Z

    if-nez v1, :cond_8

    iget-object v1, p0, Lrmn;->s:Ltit;

    invoke-virtual {v1}, Ltit;->m()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v1, p0, Lrmn;->a:Landroid/app/Activity;

    iget-object v2, p0, Lrmn;->j:Lqtd;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    sget-object v3, Lqsy;->k:Lqto;

    invoke-virtual {v2, v3}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sget-object v4, Lkjl;->v:Lkiy;

    invoke-virtual {v0, v4}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v2, v4, :cond_7

    invoke-static {v1}, Lhzb;->g(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto/16 :goto_2

    :cond_1
    const/4 v0, -0x1

    add-int/2addr v4, v0

    const/4 v1, 0x1

    if-ne v2, v4, :cond_6

    iget-object v4, p0, Lrmn;->r:Lqty;

    invoke-static {}, Luer;->a()V

    invoke-static {}, Luer;->a()V

    iget-object v4, v4, Lqty;->a:Ljava/lang/Object;

    move-object v5, v4

    check-cast v5, Lrmo;

    iget-object v6, v5, Lrmo;->f:Landroid/view/View;

    if-nez v6, :cond_5

    new-instance v6, Landroid/widget/FrameLayout;

    iget-object v7, v5, Lrmo;->b:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v8, 0x7f0d007f

    invoke-static {v7, v8, v6}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    const v8, 0x7f0a0258

    invoke-virtual {v6, v8}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    new-instance v9, Lpen;

    const/16 v10, 0xf

    invoke-direct {v9, v4, v10}, Lpen;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v5, Lrmo;->d:Luyv;

    invoke-virtual {v4}, Luyv;->n()Z

    move-result v4

    if-eq v1, v4, :cond_2

    const v4, 0x7f120033

    goto :goto_0

    :cond_2
    const v4, 0x7f120034

    :goto_0
    invoke-static {v7, v4}, Lgtl;->d(Landroid/content/Context;I)Lgtx;

    move-result-object v4

    iget-object v4, v4, Lgtx;->a:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v8, v5, Lrmo;->e:Lgtr;

    check-cast v4, Lgti;

    invoke-virtual {v8, v4}, Lgtr;->y(Lgti;)Z

    invoke-virtual {v8, v0}, Lgtr;->v(I)V

    const v0, 0x7f0a00c6

    invoke-virtual {v6, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const v4, 0x7f0a00c5

    invoke-virtual {v6, v4}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/google/android/apps/camera/ui/eduimageview/EduImageView;

    invoke-virtual {v4}, Lcom/google/android/apps/camera/ui/eduimageview/EduImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v10, v5, Lrmo;->c:Landroid/util/DisplayMetrics;

    iget v11, v10, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v11, v12

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v11, v12

    iget v10, v10, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v10, v12

    iget v12, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v10, v12

    iget v12, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v12, v12

    int-to-float v11, v11

    cmpl-float v12, v12, v11

    if-lez v12, :cond_3

    iget v0, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v0, v0

    iget v10, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v10, v10

    div-float/2addr v0, v10

    mul-float/2addr v0, v11

    float-to-int v10, v11

    iput v10, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    float-to-int v0, v0

    iput v0, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, v9}, Lcom/google/android/apps/camera/ui/eduimageview/EduImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_3
    int-to-float v10, v10

    iget v11, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v11, v11

    cmpl-float v11, v11, v10

    if-lez v11, :cond_4

    iget v11, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v11, v11

    iget v12, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v12, v12

    div-float/2addr v11, v12

    mul-float/2addr v11, v10

    float-to-int v11, v11

    iput v11, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    float-to-int v10, v10

    iput v10, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {v4, v9}, Lcom/google/android/apps/camera/ui/eduimageview/EduImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4
    :goto_1
    const v0, 0x7f130206

    invoke-virtual {v7, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v8, v0}, Lcom/google/android/apps/camera/ui/eduimageview/EduImageView;->b(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    iput-object v6, v5, Lrmo;->f:Landroid/view/View;

    :cond_5
    iget-object v0, v5, Lrmo;->e:Lgtr;

    invoke-virtual {v0}, Lgtr;->p()V

    iget-object v0, v5, Lrmo;->a:Lrpm;

    iget-object v4, v5, Lrmo;->f:Landroid/view/View;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0x8

    const v6, 0x7f130207

    invoke-virtual {v0, v5, v6, v4}, Lrpm;->o(IILandroid/view/View;)V

    :cond_6
    iget-object p0, p0, Lrmn;->q:Lqtd;

    add-int/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lqtd;->e(Lqsw;Ljava/lang/Object;)V

    return-void

    :cond_7
    :goto_2
    iget-object p0, p0, Lrmn;->q:Lqtd;

    invoke-virtual {p0, v3, v0}, Lqtd;->e(Lqsw;Ljava/lang/Object;)V

    :cond_8
    :goto_3
    return-void
.end method


# virtual methods
.method public final E()V
    .locals 0

    invoke-direct {p0}, Lrmn;->c()V

    return-void
.end method

.method public final a()V
    .locals 1

    iget-object v0, p0, Lrmn;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lrmn;->e:Ldc;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ldc;->show()V

    :cond_0
    return-void
.end method

.method public final b()V
    .locals 4

    iget-object v0, p0, Lrmn;->l:Lklm;

    sget-object v1, Lkjl;->aJ:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_6

    iget-boolean v1, p0, Lrmn;->m:Z

    if-eqz v1, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v1, p0, Lrmn;->h:Lhyk;

    iget-object v1, v1, Lhyk;->p:Lsql;

    if-eqz v1, :cond_5

    sget-object v3, Lsql;->h:Lsql;

    invoke-virtual {v1, v3}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    sget-object v3, Lsql;->i:Lsql;

    invoke-virtual {v1, v3}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    sget-object v1, Lkjl;->br:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lrmn;->p:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    sget-object v1, Lkjq;->bn:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    move v2, v3

    :goto_0
    iget-object v0, p0, Lrmn;->j:Lqtd;

    sget-object v1, Lqsy;->bz:Lqtm;

    invoke-virtual {v0, v1}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    sget-object v3, Lqsy;->by:Lqtm;

    invoke-virtual {v0, v3}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz v2, :cond_5

    if-nez v1, :cond_5

    :cond_3
    iget-object v0, p0, Lrmn;->n:Luer;

    new-instance v1, Lrlt;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Lrlt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luer;->c(Ljava/lang/Runnable;)V

    return-void

    :cond_4
    iget-object v0, p0, Lrmn;->b:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lrmn;->n:Luer;

    new-instance v1, Lrlt;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lrlt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luer;->c(Ljava/lang/Runnable;)V

    :cond_5
    :goto_1
    return-void

    :cond_6
    :goto_2
    iget-object v0, p0, Lrmn;->b:Lugh;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lrmn;->q:Lqtd;

    sget-object v0, Lqsy;->by:Lqtm;

    invoke-virtual {p0, v0, v1}, Lqtd;->e(Lqsw;Ljava/lang/Object;)V

    sget-object v0, Lqsy;->bz:Lqtm;

    invoke-virtual {p0, v0, v1}, Lqtd;->e(Lqsw;Ljava/lang/Object;)V

    return-void
.end method

.method public final m(Landroid/content/res/Configuration;)V
    .locals 0

    iget-object p1, p0, Lrmn;->e:Ldc;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ldw;->dismiss()V

    const/4 p1, 0x0

    iput-object p1, p0, Lrmn;->e:Ldc;

    invoke-virtual {p0}, Lrmn;->b()V

    :cond_0
    return-void
.end method

.method public final p(Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0}, Lrmn;->c()V

    return-void
.end method

.method public final r()V
    .locals 1

    iget-boolean v0, p0, Lrmn;->f:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lrmn;->b()V

    :cond_0
    return-void
.end method

.method public final t()V
    .locals 1

    iget-object v0, p0, Lrmn;->e:Ldc;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lrmn;->b()V

    :cond_0
    return-void
.end method

.method public final u()V
    .locals 2

    iget-object v0, p0, Lrmn;->e:Ldc;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ldw;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lrmn;->e:Ldc;

    :cond_0
    iget-object v0, p0, Lrmn;->l:Lklm;

    sget-object v1, Lkjl;->br:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lrmn;->k:Lrms;

    invoke-virtual {v0}, Lrms;->a()Lrmv;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Lrms;->a()Lrmv;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lar;->c()V

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrmn;->f:Z

    :cond_2
    iget-object p0, p0, Lrmn;->r:Lqty;

    invoke-static {}, Luer;->a()V

    iget-object p0, p0, Lqty;->a:Ljava/lang/Object;

    check-cast p0, Lrmo;

    invoke-virtual {p0}, Lrmo;->a()V

    return-void
.end method
