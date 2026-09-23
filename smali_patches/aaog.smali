.class public final Laaog;
.super Ljava/lang/Object;
.source "PG"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Laaqv;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Laaqv;->a:Ljava/lang/Object;

    iput-object v0, p0, Laaog;->a:Ljava/lang/Object;

    iget-object v0, p1, Laaqv;->b:Ljava/lang/Object;

    iput-object v0, p0, Laaog;->b:Ljava/lang/Object;

    iget-object p1, p1, Laaqv;->c:Ljava/lang/Object;

    iput-object p1, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ladbv;Ladbv;Ladbv;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Laaog;->a:Ljava/lang/Object;

    .line 49
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p2, p0, Laaog;->b:Ljava/lang/Object;

    .line 50
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p3, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ladbv;Ladbv;Ladbv;[B)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Laaog;->a:Ljava/lang/Object;

    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p2, p0, Laaog;->b:Ljava/lang/Object;

    .line 39
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p3, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/app/NotificationManager;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    new-instance p1, Lmcc;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lmcc;-><init>(Ljava/lang/Object;I)V

    new-instance p2, Ladch;

    invoke-direct {p2, p1}, Ladch;-><init>(Ladfx;)V

    iput-object p2, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Luer;Liab;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->c:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgxu;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->c:Ljava/lang/Object;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Laaog;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lhgo;Lhhb;)V
    .locals 1

    .line 41
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-static {p1}, Lhpq;->o(Ljava/lang/Object;)V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    .line 43
    invoke-static {v0}, Lhpq;->o(Ljava/lang/Object;)V

    iput-object v0, p0, Laaog;->c:Ljava/lang/Object;

    .line 44
    invoke-static {p2}, Lhpq;->o(Ljava/lang/Object;)V

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Lhow;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->a:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->c:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->c:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[B)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->c:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lklm;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    sget-object p2, Lkkb;->d:Lkiz;

    invoke-virtual {p1, p2}, Lklm;->h(Lkiz;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p2, p0, Laaog;->b:Ljava/lang/Object;

    sget-object p2, Lkkb;->e:Lkiz;

    invoke-virtual {p1, p2}, Lklm;->h(Lkiz;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Loui;Lgxu;Loxy;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrex;Lufv;Liwp;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->a:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxgo;Landroid/view/View;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lxgr;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p1, p0, Laaog;->c:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxly;Lxmk;Landroid/content/Context;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Laaog;->c:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxwg;Lklm;Liwp;)V
    .locals 0

    .line 47
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->a:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzsl;Lulx;Lxwg;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laaog;->a:Ljava/lang/Object;

    iput-object p2, p0, Laaog;->b:Ljava/lang/Object;

    iput-object p3, p0, Laaog;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    iget-object v0, p0, Laaog;->b:Ljava/lang/Object;

    check-cast v0, Lxgp;

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {v0, p0}, Lxgp;->c(Landroid/view/View;)V

    return-void
.end method

.method public final declared-synchronized b(Ltbe;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Laaog;->b:Ljava/lang/Object;

    check-cast v0, Lxmk;

    invoke-virtual {v0, p1}, Lxmk;->b(Ltbe;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final declared-synchronized c(Ltbe;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Laaog;->b:Ljava/lang/Object;

    check-cast v0, Lxmk;

    invoke-virtual {v0, p1}, Lxmk;->c(Ltbe;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final d(J)Loym;
    .locals 1

    iget-object v0, p0, Laaog;->c:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p0, Loym;

    invoke-direct {p0}, Loym;-><init>()V

    monitor-exit v0

    return-object p0

    :cond_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Loym;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final e()Z
    .locals 6

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->EDGE_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v4, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lyfm;->J(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyfm;

    move-result-object v4

    new-instance v5, Lyjh;

    invoke-direct {v5, v1}, Lyjh;-><init>(Ljava/lang/Object;)V

    const-class v1, Ljava/lang/Integer;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Laaog;->i(Ljava/lang/Class;Landroid/hardware/camera2/CaptureResult$Key;Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;)Z

    move-result p0

    return p0
.end method

.method public final f()Z
    .locals 3

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Lgxu;

    invoke-virtual {p0}, Lgxu;->J()Lgxu;

    move-result-object p0

    sget-object v0, Landroid/hardware/camera2/CaptureResult;->FLASH_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lgxu;->u(Landroid/hardware/camera2/CaptureResult$Key;[Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final g()Z
    .locals 1

    iget-object p0, p0, Laaog;->c:Ljava/lang/Object;

    check-cast p0, Loxy;

    iget-object p0, p0, Loxy;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final h()Z
    .locals 6

    sget-object v2, Landroid/hardware/camera2/CaptureResult;->NOISE_REDUCTION_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v4, 0x4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lyfm;->J(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyfm;

    move-result-object v4

    new-instance v5, Lyjh;

    invoke-direct {v5, v0}, Lyjh;-><init>(Ljava/lang/Object;)V

    const-class v1, Ljava/lang/Integer;

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Laaog;->i(Ljava/lang/Class;Landroid/hardware/camera2/CaptureResult$Key;Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;)Z

    move-result p0

    return p0
.end method

.method public final i(Ljava/lang/Class;Landroid/hardware/camera2/CaptureResult$Key;Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;)Z
    .locals 5

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Lgxu;

    invoke-virtual {p0}, Lgxu;->K()Lgxu;

    move-result-object v0

    iget-object v0, v0, Lgxu;->a:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lgxu;->J()Lgxu;

    move-result-object v3

    invoke-static {p4, p1}, Lyny;->as(Ljava/lang/Iterable;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, p2, v4}, Lgxu;->u(Landroid/hardware/camera2/CaptureResult$Key;[Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    if-nez v0, :cond_2

    invoke-virtual {p0}, Lgxu;->J()Lgxu;

    move-result-object v4

    invoke-virtual {v4, p2, p3}, Lgxu;->t(Landroid/hardware/camera2/CaptureResult$Key;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p0}, Lgxu;->K()Lgxu;

    move-result-object v4

    invoke-static {p5, p1}, Lyny;->as(Ljava/lang/Iterable;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p5

    invoke-virtual {v4, p2, p5}, Lgxu;->u(Landroid/hardware/camera2/CaptureResult$Key;[Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_2

    move p5, v1

    goto :goto_2

    :cond_2
    move p5, v2

    :goto_2
    if-nez v0, :cond_3

    invoke-virtual {p0}, Lgxu;->J()Lgxu;

    move-result-object v0

    invoke-static {p4, p1}, Lyny;->as(Ljava/lang/Iterable;Ljava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lgxu;->u(Landroid/hardware/camera2/CaptureResult$Key;[Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lgxu;->K()Lgxu;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Lgxu;->t(Landroid/hardware/camera2/CaptureResult$Key;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    move p0, v1

    goto :goto_3

    :cond_3
    move p0, v2

    :goto_3
    if-nez v3, :cond_5

    if-nez p5, :cond_5

    if-eqz p0, :cond_4

    goto :goto_4

    :cond_4
    return v2

    :cond_5
    :goto_4
    return v1
.end method

.method public final varargs j([Loyb;)Z
    .locals 0

    iget-object p0, p0, Laaog;->c:Ljava/lang/Object;

    check-cast p0, Loxy;

    iget-object p0, p0, Loxy;->a:Loyb;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final varargs k([Ljava/lang/Integer;)Z
    .locals 1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    iget-object p0, p0, Laaog;->b:Ljava/lang/Object;

    check-cast p0, Luvf;

    invoke-virtual {p0, v0}, Luvf;->m(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final l(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 2

    # Log what model is being requested
    const-string v0, "CAM_LASAGNA"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "openAsset: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v0, "CAM_LASAGNA"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p0

    return-object p0
.end method

.method public final m()I
    .locals 1

    sget-object v0, Lkhy;->s:Lkiz;

    iget-object p0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast p0, Lklm;

    invoke-virtual {p0, v0}, Lklm;->q(Lkiz;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x3

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public final n(Ljava/lang/Class;Ljava/lang/Class;)Z
    .locals 1

    iget-object v0, p0, Laaog;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Laaog;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Class;

    invoke-virtual {p2, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final o(Ljava/lang/Class;)Z
    .locals 0

    iget-object p0, p0, Laaog;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Class;

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method
