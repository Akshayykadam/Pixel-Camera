.class public final synthetic Lisu;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field private final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .locals 0

    iput p2, p0, Lisu;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lisu;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;I[B)V
    .locals 0

    .line 8
    iput p2, p0, Lisu;->b:I

    iput-object p1, p0, Lisu;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    iget v0, p0, Lisu;->b:I

    const-string v1, "https://support.google.com/photos/answer/10694388"

    const-string v2, "android.intent.action.VIEW"

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_0

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Ltbo;

    iget-object v0, p0, Ltbo;->f:Ljava/lang/String;

    iget-object v1, p0, Ltbo;->b:Landroid/content/Context;

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "pref_open_setting_page"

    const-string v1, "pref_category_boba_jelly"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Ltbo;->j:Lqom;

    invoke-virtual {p0, p1}, Lqom;->c(Landroid/content/Intent;)V

    return-void

    :pswitch_0
    new-instance p1, Landroid/content/Intent;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_1
    new-instance p1, Landroid/content/Intent;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_2
    iget-object p1, p0, Lisu;->a:Ljava/lang/Object;

    instance-of v0, p1, Lbe;

    if-eqz v0, :cond_orig_tips

    check-cast p1, Lbe;

    invoke-virtual {p1}, Lbe;->gt()Lbx;

    move-result-object v0

    if-eqz v0, :cond_orig_tips

    new-instance p1, Lqls;

    invoke-direct {p1}, Lqls;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "initial_sauce_type"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p1, v1}, Lbb;->X(Landroid/os/Bundle;)V

    const-string v1, "SauceOnboarding"

    invoke-virtual {p1, v0, v1}, Lar;->m(Lbx;Ljava/lang/String;)V

    return-void

    :cond_orig_tips
    new-instance p1, Landroid/content/Intent;

    const-string v0, "https://g.co/pixeltips/tips_camera_looks"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_3
    sget p1, Lcom/google/android/apps/camera/optionsbar/view/OptionsEntryButtonBc25Impl;->l:I

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_4
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lpfe;

    iget-object p1, p0, Lpfe;->i:Lpfq;

    invoke-interface {p1}, Lpfq;->a()V

    iget-object p0, p0, Lpfe;->z:Lpfg;

    iput-boolean v3, p0, Lpfg;->a:Z

    return-void

    :pswitch_5
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lnsg;

    invoke-virtual {p0}, Lnsg;->x()Lyeh;

    move-result-object p1

    invoke-static {p1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lnrv;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lnrv;-><init>(I)V

    invoke-interface {p1, v0}, Lj$/util/stream/Stream;->map(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object p1

    new-instance v0, Llug;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Llug;-><init>(I)V

    invoke-interface {p1, v0}, Lj$/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    sget-object p1, Lytb;->a:Lytb;

    invoke-virtual {p1}, Laaxp;->D()Laaxk;

    move-result-object p1

    iget-object v0, p1, Laaxk;->b:Laaxp;

    invoke-virtual {v0}, Laaxp;->T()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Laaxk;->o()V

    :cond_0
    iget-object v0, p0, Lnsg;->n:Ltbe;

    iget-object v1, p1, Laaxk;->b:Laaxp;

    check-cast v1, Lytb;

    const/16 v2, 0x4f

    iput v2, v1, Lytb;->f:I

    iget v2, v1, Lytb;->b:I

    or-int/2addr v2, v3

    iput v2, v1, Lytb;->b:I

    iget-object v0, v0, Ltbe;->a:Ljava/lang/Object;

    check-cast v0, Lnqj;

    iget-object v0, v0, Lnqj;->r:Lrex;

    invoke-virtual {v0, p1}, Lrex;->O(Laaxk;)V

    iget-object p0, p0, Lnsg;->m:Lacku;

    invoke-virtual {p0}, Lacku;->d()V

    return-void

    :pswitch_6
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Ljui;

    iget-object p1, p0, Ljui;->f:Lxwg;

    invoke-virtual {p1}, Lxwg;->h()Z

    move-result p1

    invoke-static {p1}, Lyny;->bl(Z)V

    iget-object p1, p0, Ljui;->b:Ljuk;

    invoke-virtual {p1}, Ljuk;->a()V

    iget-object p0, p0, Ljui;->f:Lxwg;

    invoke-virtual {p0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lksy;

    invoke-virtual {p0}, Lksy;->a()V

    return-void

    :pswitch_7
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Ljui;

    iget-object v0, p0, Ljui;->a:Landroid/content/Context;

    const-string v1, "com.google.android.apps.camera.settings.activity.CameraGm3SettingsActivity"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Ljui;->f:Lxwg;

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lksy;

    invoke-virtual {v0}, Lksy;->a()V

    iget-object p0, p0, Ljui;->g:Lqom;

    invoke-virtual {p0, p1}, Lqom;->c(Landroid/content/Intent;)V

    return-void

    :pswitch_8
    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/apps/camera/bottombar/ThumbnailView;

    iget-object v0, p0, Lcom/google/android/apps/camera/bottombar/ThumbnailView;->a:Lxwg;

    invoke-virtual {v0}, Lxwg;->h()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/apps/camera/bottombar/ThumbnailView;->a:Lxwg;

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxiy;

    iget-object v0, v0, Lxiy;->a:Ljava/lang/Object;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    check-cast v0, Lrql;

    iput-object v1, v0, Lrql;->c:Ljava/lang/Long;

    invoke-virtual {v0, v3}, Lrql;->e(Z)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/apps/camera/bottombar/ThumbnailView;->b:Lxwg;

    invoke-virtual {v0}, Lxwg;->h()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object p0, p0, Lcom/google/android/apps/camera/bottombar/ThumbnailView;->b:Lxwg;

    invoke-virtual {p0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View$OnClickListener;

    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lcom/google/android/apps/camera/bottombar/CameraSwitchButton;

    invoke-virtual {v0}, Lcom/google/android/apps/camera/bottombar/CameraSwitchButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Animatable;

    iput-object v1, v0, Lcom/google/android/apps/camera/bottombar/CameraSwitchButton;->a:Landroid/graphics/drawable/Animatable;

    iget-object v1, v0, Lcom/google/android/apps/camera/bottombar/CameraSwitchButton;->b:Landroid/view/View$OnClickListener;

    if-eqz v1, :cond_3

    invoke-interface {v1, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_3
    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Lacku;->h(Landroid/view/View;)V

    iget-object p0, v0, Lcom/google/android/apps/camera/bottombar/CameraSwitchButton;->a:Landroid/graphics/drawable/Animatable;

    if-eqz p0, :cond_4

    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    :cond_4
    :goto_0
    return-void

    :pswitch_a
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->d()V

    return-void

    :pswitch_b
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->d()V

    return-void

    :pswitch_c
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->i()V

    return-void

    :pswitch_d
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->m()V

    return-void

    :pswitch_e
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->e()V

    return-void

    :pswitch_f
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->l()V

    return-void

    :pswitch_10
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->c()V

    return-void

    :pswitch_11
    iget-object p0, p0, Lisu;->a:Ljava/lang/Object;

    check-cast p0, Lita;

    iget-object p0, p0, Lita;->y:Lglf;

    invoke-virtual {p0}, Lglf;->n()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
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
