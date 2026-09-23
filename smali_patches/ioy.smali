.class public final Lioy;
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

    iput p3, p0, Lioy;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lioy;->a:Laccg;

    iput-object p2, p0, Lioy;->b:Laccg;

    return-void
.end method

.method public constructor <init>(Laccg;Laccg;I[C)V
    .locals 0

    .line 10
    iput p3, p0, Lioy;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lioy;->b:Laccg;

    iput-object p2, p0, Lioy;->a:Laccg;

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 5

    iget v0, p0, Lioy;->c:I

    const-string v1, "com.google.android.apps.pixel.dcservice"

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lacov;

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Lmzh;

    invoke-virtual {p0}, Lmzh;->b()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "DcService"

    invoke-static {v2}, Ltqz;->eM(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-static {v0, p0}, Lackz;->k(Lacov;Landroid/content/Context;)Lackz;

    move-result-object v0

    new-instance v3, Lyjh;

    invoke-direct {v3, v1}, Lyjh;-><init>(Ljava/lang/Object;)V

    invoke-static {p0, v3, v2}, Laaaq;->S(Landroid/content/Context;Lyfm;Ljava/util/concurrent/Executor;)Lacox;

    move-result-object p0

    invoke-virtual {v0, p0}, Lackz;->l(Lacpe;)V

    invoke-virtual {v0}, Lacky;->i()Lacmm;

    move-result-object p0

    return-object p0

    :pswitch_0
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Lstg;

    invoke-virtual {p0}, Lstg;->b()Lstf;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lkhv;->b:Lkiz;

    invoke-virtual {v0, v3}, Lklm;->x(Lkiz;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_7

    sget-object v3, Lkhv;->a:Lkiz;

    invoke-virtual {v0, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    if-nez v3, :cond_0

    goto/16 :goto_4

    :cond_0
    sget-object v3, Lkhy;->X:Lkiz;

    invoke-virtual {v0, v3}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_7

    :try_start_0
    iget-object v0, p0, Lstf;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v0, :cond_1

    if-eq v0, v2, :cond_1

    goto/16 :goto_3

    :cond_1
    :try_start_1
    iget-object p0, p0, Lstf;->b:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p0, v1, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sget-object v0, Lstf;->a:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    invoke-interface {v0, p0}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object p0

    const/16 v0, 0x1d5d

    invoke-interface {p0, v0}, Lyld;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string v0, "DcService app package not found."

    invoke-interface {p0, v0}, Lyko;->s(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_0
    const-string v0, "26.17"

    if-nez p0, :cond_3

    :cond_2
    :goto_1
    move v2, v4

    goto :goto_2

    :cond_3
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-nez p0, :cond_4

    goto :goto_1

    :cond_4
    const/16 v1, 0x5f

    invoke-static {p0, v1, v4}, Ladht;->C(Ljava/lang/CharSequence;CI)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_5

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_5
    :try_start_2
    new-instance v1, Lsth;

    invoke-direct {v1, p0}, Lsth;-><init>(Ljava/lang/String;)V

    new-instance v3, Lsth;

    invoke-direct {v3, v0}, Lsth;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lsth;->a(Lsth;)I

    move-result p0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    if-ltz p0, :cond_2

    goto :goto_2

    :catch_1
    move-exception v1

    sget-object v2, Lstf;->a:Lykq;

    invoke-virtual {v2}, Lykh;->b()Lyld;

    move-result-object v2

    invoke-interface {v2, v1}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v1

    const/16 v2, 0x1d5f

    invoke-interface {v1, v2}, Lyld;->O(I)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    const-string v2, "Fail to check the version between %s and %s"

    invoke-interface {v1, v2, p0, v0}, Lyko;->E(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    :goto_2
    if-nez v2, :cond_6

    sget-object p0, Lixd;->a:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 v1, 0x2e0

    invoke-interface {p0, v1}, Lyld;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string v1, "Nixie is enabled by config but DcService min version %s is not installed."

    invoke-interface {p0, v1, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6
    move v4, v2

    goto :goto_4

    :catch_2
    move-exception p0

    sget-object v0, Lstf;->a:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    invoke-interface {v0, p0}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object p0

    const/16 v0, 0x1d5e

    invoke-interface {p0, v0}, Lyld;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string v0, "DcService app package not found or enabled."

    invoke-interface {p0, v0}, Lyko;->s(Ljava/lang/String;)V

    :goto_3
    sget-object p0, Lixd;->a:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 v0, 0x2e1

    invoke-interface {p0, v0}, Lyld;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string v0, "Nixie is enabled by config but DcService is disabled."

    invoke-interface {p0, v0}, Lyko;->s(Ljava/lang/String;)V

    :cond_7
    :goto_4
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lljg;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lizf;

    new-instance p0, Lits;

    invoke-direct {p0, v0}, Lits;-><init>(Lljg;)V

    return-object p0

    :pswitch_2
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lulx;

    iget-object p0, p0, Lioy;->b:Laccg;

    new-instance v1, Ljoc;

    invoke-direct {v1, v0, p0, v2}, Ljoc;-><init>(Ljava/lang/Object;Ladbv;I)V

    return-object v1

    :pswitch_3
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lufv;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lklm;

    new-instance v1, Lisk;

    invoke-direct {v1, v0, p0}, Lisk;-><init>(Lufv;Lklm;)V

    return-object v1

    :pswitch_4
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lugh;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lugh;

    invoke-interface {p0}, Lugh;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_8

    new-instance p0, Lufn;

    sget-object v0, Lrvi;->a:Lrvi;

    invoke-direct {p0, v0}, Lufn;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_8
    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Lisl;->a:Lisl;

    if-ne p0, v0, :cond_9

    new-instance p0, Lufn;

    sget-object v0, Lrvi;->b:Lrvi;

    invoke-direct {p0, v0}, Lufn;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_9
    new-instance p0, Lufn;

    sget-object v0, Lrvi;->c:Lrvi;

    invoke-direct {p0, v0}, Lufn;-><init>(Ljava/lang/Object;)V

    return-object p0

    :pswitch_5
    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :pswitch_6
    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :pswitch_7
    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Ling;

    invoke-virtual {p0}, Ling;->b()Lxwg;

    move-result-object p0

    return-object p0

    :pswitch_8
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Liqy;

    invoke-direct {v1, v0, p0}, Liqy;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v1

    :pswitch_9
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnfb;

    invoke-virtual {p0, v0}, Lnfb;->e(Ljava/util/concurrent/Executor;)Liqz;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object v0, p0, Lioy;->a:Laccg;

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Liqc;

    invoke-virtual {p0}, Liqc;->b()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnfb;

    invoke-virtual {v0, p0}, Lnfb;->e(Ljava/util/concurrent/Executor;)Liqz;

    move-result-object p0

    return-object p0

    :pswitch_b
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lulx;

    iget-object p0, p0, Lioy;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lnfb;

    invoke-direct {v1, v0, p0}, Lnfb;-><init>(Lulx;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v1

    :pswitch_c
    iget-object v0, p0, Lioy;->a:Laccg;

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Liqc;

    invoke-virtual {p0}, Liqc;->b()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lulx;

    new-instance v1, Lumc;

    const-string v2, "IOTask"

    invoke-direct {v1, p0, v0, v2}, Lumc;-><init>(Ljava/util/concurrent/Executor;Lulx;Ljava/lang/String;)V

    return-object v1

    :pswitch_d
    iget-object v0, p0, Lioy;->a:Laccg;

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Liqc;

    invoke-virtual {p0}, Liqc;->b()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzfe;

    new-instance v1, Liqx;

    invoke-direct {v1, p0, v0}, Liqx;-><init>(Ljava/util/concurrent/Executor;Lzfe;)V

    return-object v1

    :pswitch_e
    iget-object v0, p0, Lioy;->a:Laccg;

    iget-object p0, p0, Lioy;->b:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnfb;

    check-cast p0, Liqt;

    iget-object p0, p0, Liqt;->e:Lzfe;

    invoke-virtual {v0}, Lnfb;->f()Lula;

    move-result-object v0

    new-instance v1, Lhyf;

    const/16 v2, 0xa

    invoke-direct {v1, v0, v2}, Lhyf;-><init>(Ljava/lang/Object;I)V

    sget-object v0, Lzdy;->a:Lzdy;

    invoke-interface {p0, v1, v0}, Lzfe;->c(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-object p0

    :pswitch_f
    iget-object v0, p0, Lioy;->a:Laccg;

    iget-object p0, p0, Lioy;->b:Laccg;

    check-cast p0, Liqc;

    invoke-virtual {p0}, Liqc;->b()Ljava/util/concurrent/Executor;

    move-result-object p0

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzfe;

    new-instance v1, Liqx;

    invoke-direct {v1, p0, v0}, Liqx;-><init>(Ljava/util/concurrent/Executor;Lzfe;)V

    return-object v1

    :pswitch_10
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzfe;

    new-instance v1, Liqx;

    invoke-direct {v1, v0, p0}, Liqx;-><init>(Ljava/util/concurrent/Executor;Lzfe;)V

    return-object v1

    :pswitch_11
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzfr;

    iget-object p0, p0, Lioy;->a:Laccg;

    invoke-interface {p0}, Laccg;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhze;

    new-instance v1, Liqt;

    invoke-direct {v1, v0, p0}, Liqt;-><init>(Lzfr;Lhze;)V

    return-object v1

    :pswitch_12
    iget-object v0, p0, Lioy;->a:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lklm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lioy;->b:Laccg;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lkjl;->a:Lkiy;

    sget-object p0, Laddj;->a:Laddj;

    return-object p0

    :pswitch_13
    iget-object v0, p0, Lioy;->b:Laccg;

    invoke-interface {v0}, Laccg;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrdw;

    iget-object p0, p0, Lioy;->a:Laccg;

    new-instance v1, Locv;

    check-cast p0, Lslq;

    invoke-virtual {p0}, Lslq;->b()Lslo;

    move-result-object p0

    iget-object p0, p0, Lslo;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {v1, p0, v0}, Locv;-><init>(Landroid/view/View;Lrdw;)V

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
