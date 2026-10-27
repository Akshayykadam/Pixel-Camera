.class public final synthetic Lguh;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Ladsd;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field private final synthetic b:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    iput p1, p0, Lguh;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "Select COUNT(*) FROM workspec WHERE LENGTH(content_uri_triggers)<>0 AND state NOT IN (2, 3, 5)"

    iput-object p1, p0, Lguh;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I[B)V
    .locals 0

    .line 10
    iput p1, p0, Lguh;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "DELETE FROM WorkProgress"

    iput-object p1, p0, Lguh;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I[C)V
    .locals 0

    .line 11
    iput p1, p0, Lguh;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "SELECT COUNT(*) > 0 FROM workspec WHERE state NOT IN (2, 3, 5) LIMIT 1"

    iput-object p1, p0, Lguh;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I[S)V
    .locals 0

    .line 12
    iput p1, p0, Lguh;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 AND LENGTH(content_uri_triggers)<>0 ORDER BY last_enqueue_time"

    iput-object p1, p0, Lguh;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .locals 0

    .line 13
    iput p2, p0, Lguh;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lguh;->a:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    iget v0, p0, Lguh;->b:I

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const-wide v4, 0xffffffffL

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v0, :pswitch_data_0

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ltmu;

    invoke-virtual {p0}, Ltmu;->a()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f1307b2

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_0
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/apps/camera/ui/supermodeswitcher/SupermodeSwitcher;

    iget-object p1, p0, Lcom/google/android/apps/camera/ui/supermodeswitcher/SupermodeSwitcher;->c:Lslz;

    iget-object v0, p0, Lcom/google/android/apps/camera/ui/supermodeswitcher/SupermodeSwitcher;->d:Lsmc;

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lslz;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/apps/camera/ui/supermodeswitcher/SupermodeSwitcher;->hx(Lslz;Lsmc;)V

    :cond_0
    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_1
    check-cast p1, Lurt;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lqjs;

    iget-object v2, v0, Lqjs;->m:Luqn;

    if-nez v2, :cond_1

    const-string v2, "boundLifetime"

    invoke-static {v2}, Ladtc;->c(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    invoke-static {p1}, Lurp;->a(Lurt;)Lurt;

    move-result-object p1

    iget-object v0, v0, Lqjs;->f:Luqp;

    new-instance v2, Lqja;

    const/16 v3, 0x8

    invoke-direct {v2, p0, v3}, Lqja;-><init>(Ljava/lang/Object;I)V

    invoke-interface {p1, v0, v2}, Lurt;->gp(Ljava/util/concurrent/Executor;Luxa;)Luww;

    move-result-object p0

    invoke-virtual {v1, p0}, Luqn;->e(Luww;)V

    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_2
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/apps/camera/optionsbar/view/OptionsTabBar;

    iget-object p0, p0, Lcom/google/android/apps/camera/optionsbar/view/OptionsTabBar;->c:Lekk;

    invoke-virtual {p0, p1}, Lekk;->i(Ljava/lang/Object;)V

    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_3
    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    return-object p0

    :pswitch_4
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ltz p1, :cond_3

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lkmo;

    iget-object p0, v0, Lkmo;->S:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    if-ge p1, v1, :cond_3

    iget-object v1, v0, Lkmo;->k:Ljava/util/Set;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkmr;

    invoke-interface {v2, p1}, Lkmr;->a(I)V

    goto :goto_1

    :cond_2
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget-object p0, v0, Lkmo;->h:Lusf;

    invoke-interface {p0}, Lusf;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Float;

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v1, v2, v1

    if-nez v1, :cond_std_zoom_guh

    if-nez p0, :cond_check_cur_zoom_guh

    const/high16 v2, 0x3f800000    # 1.0f

    goto :cond_apply_focal_zoom_guh

    :cond_check_cur_zoom_guh
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const v3, 0x3f733333    # 0.95f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_check_1_0x_guh

    const/high16 v2, 0x3f800000    # 1.0f

    goto :cond_apply_focal_zoom_guh

    :cond_focal_check_1_0x_guh
    const v3, 0x3f933333    # 1.15f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_check_1_2x_guh

    const v2, 0x3f99999a    # 1.2f (28mm)

    goto :cond_apply_focal_zoom_guh

    :cond_focal_check_1_2x_guh
    const v3, 0x3faccccd    # 1.35f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_check_1_5x_guh

    const/high16 v2, 0x3fc00000    # 1.5f (35mm)

    goto :cond_apply_focal_zoom_guh

    :cond_focal_check_1_5x_guh
    const v3, 0x3feccccd    # 1.85f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_focal_outside_guh

    const/high16 v2, 0x3f800000    # 1.0f (24mm)

    goto :cond_apply_focal_zoom_guh

    :cond_focal_outside_guh
    const/high16 v2, 0x3f800000    # 1.0f

    :cond_apply_focal_zoom_guh
    invoke-static {p0, v2}, Ladtc;->e(Ljava/lang/Float;F)Z

    move-result p1

    if-nez p1, :cond_3

    goto :cond_exec_zoom_guh

    :cond_std_zoom_guh
    invoke-static {p0, v2}, Ladtc;->e(Ljava/lang/Float;F)Z

    move-result p1

    if-nez p1, :cond_3

    :cond_exec_zoom_guh

    iget-object v1, v0, Lkmo;->g:Lnyx;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, v0, Lkmo;->f:Lurt;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {p1}, Lurt;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljut;

    invoke-virtual {p1}, Ljut;->a()Lvhd;

    move-result-object v5

    sget-object v6, Lnyo;->a:Lnyo;

    const/16 v7, 0x10

    move v4, v2

    const/16 v2, 0x14

    invoke-static/range {v1 .. v7}, Lnyx;->c(Lnyx;IFFLvhd;Lnyo;I)V

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/4 v5, 0x0

    const/16 v6, 0x1c

    const/4 v3, 0x0

    move v2, v4

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkmo;->H(Lkmo;FFILadrs;Landroid/animation/ValueAnimator$AnimatorUpdateListener;I)V

    :cond_3
    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_5
    check-cast p1, Ldop;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    invoke-interface {p0}, Lcbt;->fk()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    int-to-long p0, p0

    new-instance v0, Ldox;

    and-long/2addr p0, v4

    invoke-direct {v0, p0, p1}, Ldox;-><init>(J)V

    return-object v0

    :pswitch_6
    check-cast p1, Lcaj;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lahs;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Lahs;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :pswitch_7
    check-cast p1, Ldop;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    invoke-interface {p0}, Lcbt;->fk()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldox;

    iget-wide p0, p0, Ldox;->a:J

    new-instance v0, Ldox;

    invoke-direct {v0, p0, p1}, Ldox;-><init>(J)V

    return-object v0

    :pswitch_8
    check-cast p1, Lcwa;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1, v2, v3}, Lcwa;->j(J)J

    move-result-wide v0

    const/16 v2, 0x20

    shr-long v6, v0, v2

    and-long/2addr v0, v4

    long-to-int v0, v0

    long-to-int v1, v6

    new-instance v3, Landroid/graphics/RectF;

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v6

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v7

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    invoke-interface {p1}, Lcwa;->h()J

    move-result-wide v8

    shr-long/2addr v8, v2

    long-to-int v2, v8

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    invoke-interface {p1}, Lcwa;->h()J

    move-result-wide v8

    and-long/2addr v4, v8

    long-to-int p1, v4

    int-to-float p1, p1

    add-float/2addr v0, p1

    invoke-direct {v3, v6, v7, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    invoke-interface {p0, v3}, Lbzu;->h(Ljava/lang/Object;)V

    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_9
    check-cast p1, Ldhi;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0, p1}, Lvon;->v(Ljava/lang/String;Ldhi;)Ladok;

    move-result-object p0

    return-object p0

    :pswitch_a
    check-cast p1, Ldhi;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ldhf;->a:Ldhh;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ldhi;->a(Ldhh;Ljava/lang/Object;)V

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    if-eqz p0, :cond_4

    sget-object v0, Ldhe;->a:Ldhh;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1, v0, p0}, Ldhi;->a(Ldhh;Ljava/lang/Object;)V

    :cond_4
    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_b
    check-cast p1, Lcwa;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1, v2, v3}, Lcwa;->l(J)J

    move-result-wide v0

    new-instance p1, Lcmg;

    invoke-direct {p1, v0, v1}, Lcmg;-><init>(J)V

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    invoke-interface {p0, p1}, Lbzu;->h(Ljava/lang/Object;)V

    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_c
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/apps/camera/coach/gemini/ui/GeminiCoachPip;

    iget-object p0, p0, Lcom/google/android/apps/camera/coach/gemini/ui/GeminiCoachPip;->f:Lkev;

    if-eqz p0, :cond_6

    iget v0, p0, Lkev;->e:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lkev;->d:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Labjo;

    if-eqz p0, :cond_6

    if-nez p1, :cond_5

    iget-object p1, p0, Labjo;->b:Labjt;

    check-cast p1, Lzer;

    iget p1, p1, Lzer;->i:I

    add-int/2addr p1, v7

    invoke-virtual {p0}, Labjo;->n()V

    iget-object p0, p0, Labjo;->b:Labjt;

    check-cast p0, Lzer;

    iget v0, p0, Lzer;->a:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lzer;->a:I

    iput p1, p0, Lzer;->i:I

    goto :goto_2

    :cond_5
    iget-object p1, p0, Labjo;->b:Labjt;

    check-cast p1, Lzer;

    iget p1, p1, Lzer;->j:I

    add-int/2addr p1, v7

    invoke-virtual {p0}, Labjo;->n()V

    iget-object p0, p0, Labjo;->b:Labjt;

    check-cast p0, Lzer;

    iget v0, p0, Lzer;->a:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lzer;->a:I

    iput p1, p0, Lzer;->j:I

    :cond_6
    :goto_2
    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :pswitch_d
    check-cast p1, Lghd;

    const-string v0, "UPDATE FatalErrorCounts SET failuresBeforeRebootDuringOpen = 0 , failuresAfterRebootDuringOpen = 0 WHERE cameraId = ?"

    invoke-virtual {p1, v0}, Lghd;->a(Ljava/lang/String;)Lggl;

    move-result-object p1

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    if-nez p0, :cond_7

    :try_start_0
    invoke-interface {p1, v7}, Lggl;->h(I)V

    goto :goto_3

    :cond_7
    check-cast p0, Ljava/lang/String;

    invoke-interface {p1, v7, p0}, Lggl;->i(ILjava/lang/String;)V

    :goto_3
    invoke-interface {p1}, Lggl;->l()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1}, Lggl;->close()V

    return-object v1

    :catchall_0
    move-exception v0

    move-object p0, v0

    invoke-interface {p1}, Lggl;->close()V

    throw p0

    :pswitch_e
    check-cast p1, Landroid/graphics/Rect;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_f
    check-cast p1, Landroidx/work/impl/WorkDatabase;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lgud;->b:Lor;

    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->D()Lgue;

    move-result-object p1

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-interface {p1, p0}, Lgue;->m(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Lor;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :pswitch_10
    check-cast p1, Lghd;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0, p1}, Ljmz;->F(Ljava/lang/String;Lghd;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_11
    check-cast p1, Lghd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1, p0}, Lghd;->a(Ljava/lang/String;)Lggl;

    move-result-object p0

    :try_start_1
    invoke-interface {p0}, Lggl;->l()Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-interface {p0, v6}, Lggl;->b(I)J

    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    long-to-int p1, v0

    if-eqz p1, :cond_8

    move v6, v7

    :cond_8
    invoke-interface {p0}, Lggl;->close()V

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :catchall_1
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Lggl;->close()V

    throw p1

    :pswitch_12
    check-cast p1, Lghd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1, p0}, Lghd;->a(Ljava/lang/String;)Lggl;

    move-result-object p0

    :try_start_2
    invoke-interface {p0}, Lggl;->l()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    invoke-interface {p0}, Lggl;->close()V

    sget-object p0, Ladok;->a:Ladok;

    return-object p0

    :catchall_2
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Lggl;->close()V

    throw p1

    :pswitch_13
    check-cast p1, Lghd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lguh;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1, p0}, Lghd;->a(Ljava/lang/String;)Lggl;

    move-result-object p0

    :try_start_3
    invoke-interface {p0}, Lggl;->l()Z

    move-result p1

    if-eqz p1, :cond_9

    invoke-interface {p0, v6}, Lggl;->b(I)J

    move-result-wide v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    long-to-int v6, v0

    :cond_9
    invoke-interface {p0}, Lggl;->close()V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :catchall_3
    move-exception v0

    move-object p1, v0

    invoke-interface {p0}, Lggl;->close()V

    throw p1

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
