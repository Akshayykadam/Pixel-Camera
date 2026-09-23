.class public final Lcom/google/android/apps/camera/app/CameraApp;
.super Lnnu;
.source "PG"

# interfaces
.implements Lacbx;
.implements Lnaf;
.implements Lion;
.implements Liqv;
.implements Lwnb;
.implements Lgia;


# static fields
.field private static final o:Lykq;

.field private static final p:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static sAppContext:Landroid/content/Context;


# instance fields
.field public a:Landroid/app/NotificationManager;

.field public b:Ladbv;

.field public c:Ladbv;

.field public d:Lwct;

.field public e:Lwsz;

.field public f:Lgjn;

.field public g:Lioh;

.field public h:Lulp;

.field public i:Liod;

.field public j:Lklm;

.field public k:Lovu;

.field public l:Ladvz;

.field private final q:Linm;

.field private final r:Ladca;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    sget-object v0, Lwkd;->a:Lwkd;

    iget-object v1, v0, Lwkd;->b:Lwgq;

    if-nez v1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    new-instance v5, Lwgq;

    invoke-direct {v5, v1, v2, v3, v4}, Lwgq;-><init>(JJ)V

    iput-object v5, v0, Lwkd;->b:Lwgq;

    :cond_0
    sget-wide v0, Lnnu;->m:J

    invoke-static {v0, v1}, Lrfi;->e(J)V

    sget-object v0, Lncw;->a:Lyeh;

    sget-object v1, Lulg;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    invoke-virtual {v0}, Lyeh;->C()Lykf;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    const-string v3, "gcastartup"

    sget-object v4, Lulg;->c:Ljava/util/Map;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_2

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/UnsatisfiedLinkError;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not register "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ". It was previously registered with: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_1
    sget-object v4, Lulg;->b:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lulf;

    if-nez v4, :cond_3

    sget-object v2, Lulg;->b:Ljava/util/Map;

    new-instance v4, Lulf;

    invoke-direct {v4, v3}, Lulf;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    invoke-virtual {v4}, Lulf;->a()Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_0

    :cond_4
    new-instance v0, Ljava/lang/UnsatisfiedLinkError;

    const-string v4, "Registering \"%s\" after \"%s\" was loaded is racy."

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v3, v4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "com.google.android.apps.camera.app.CameraApp"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lcom/google/android/apps/camera/app/CameraApp;->o:Lykq;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/google/android/apps/camera/app/CameraApp;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lnnu;-><init>()V

    new-instance v0, Linm;

    invoke-direct {v0}, Linm;-><init>()V

    iput-object v0, p0, Lcom/google/android/apps/camera/app/CameraApp;->q:Linm;

    new-instance v0, Lilr;

    invoke-direct {v0, p0}, Lilr;-><init>(Lcom/google/android/apps/camera/app/CameraApp;)V

    new-instance v1, Ladch;

    invoke-direct {v1, v0}, Ladch;-><init>(Ladfx;)V

    iput-object v1, p0, Lcom/google/android/apps/camera/app/CameraApp;->r:Ladca;

    return-void
.end method

.method private final i()Limi;
    .locals 0

    iget-object p0, p0, Lcom/google/android/apps/camera/app/CameraApp;->r:Ladca;

    invoke-interface {p0}, Ladca;->a()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Limi;

    return-object p0
.end method

.method private final j()Lzmc;
    .locals 11

    invoke-virtual {p0}, Lcom/google/android/apps/camera/app/CameraApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lxiy;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lxiy;-><init>(Ljava/lang/Object;[B)V

    new-instance p0, Lhzw;

    const/16 v3, 0x8

    invoke-direct {p0, v1, v3}, Lhzw;-><init>(Ljava/lang/Object;I)V

    new-instance v1, Lzma;

    invoke-direct {v1, v0, p0}, Lzma;-><init>(Landroid/content/Context;Ladbv;)V

    iget-object v4, v1, Lzma;->b:Landroid/content/Context;

    new-instance v3, Lzmc;

    new-instance v5, Laaaq;

    invoke-direct {v5, v2}, Laaaq;-><init>([B)V

    iget-object v8, v1, Lzma;->c:Ladbv;

    sget-object v6, Lzma;->a:Lwlo;

    sget-object v7, Lzdy;->a:Lzdy;

    new-instance v9, Lhzw;

    const/16 p0, 0x9

    invoke-direct {v9, v1, p0}, Lhzw;-><init>(Ljava/lang/Object;I)V

    const/4 v10, 0x1

    invoke-direct/range {v3 .. v10}, Lzmc;-><init>(Landroid/content/Context;Laaaq;Lwlo;Ljava/util/concurrent/Executor;Ladbv;Ladbv;I)V

    return-object v3
.end method


# virtual methods
.method public final a()Lgib;
    .locals 2

    new-instance v0, Lghz;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, p0, Lcom/google/android/apps/camera/app/CameraApp;->f:Lgjn;

    if-nez v1, :cond_0

    const-string v1, "workerFactory"

    invoke-static {v1}, Ladhh;->c(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v1, v0, Lghz;->a:Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/apps/camera/app/CameraApp;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p0}, Lghz;->b(Ljava/lang/String;)V

    new-instance p0, Lgib;

    invoke-direct {p0, v0}, Lgib;-><init>(Lghz;)V

    return-object p0
.end method

.method public final b()Lioh;
    .locals 0

    iget-object p0, p0, Lcom/google/android/apps/camera/app/CameraApp;->g:Lioh;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const-string p0, "uncaughtExceptionListeners"

    invoke-static {p0}, Ladhh;->c(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Ljava/lang/Class;)Lnah;
    .locals 0

    invoke-direct {p0}, Lcom/google/android/apps/camera/app/CameraApp;->i()Limi;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    check-cast p0, Lnah;

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Required value was null."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final d()Lulp;
    .locals 0

    iget-object p0, p0, Lcom/google/android/apps/camera/app/CameraApp;->h:Lulp;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const-string p0, "mainThreadThrowingLogHandler"

    invoke-static {p0}, Ladhh;->c(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()Lwct;
    .locals 0

    iget-object p0, p0, Lcom/google/android/apps/camera/app/CameraApp;->d:Lwct;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const-string p0, "primes"

    invoke-static {p0}, Ladhh;->c(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final f()Lxwg;
    .locals 1

    sget-object v0, Lwnc;->a:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lwvv;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Lwvv;->f:Ljava/lang/Object;

    invoke-virtual {v0}, Lwvv;->a()Lwnc;

    move-result-object p0

    new-instance v0, Lxwm;

    invoke-direct {v0, p0}, Lxwm;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final g()Lzfe;
    .locals 0

    iget-object p0, p0, Lcom/google/android/apps/camera/app/CameraApp;->q:Linm;

    invoke-virtual {p0}, Linm;->a()Lzfe;

    move-result-object p0

    return-object p0
.end method

.method public final gA()Ladvz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/camera/app/CameraApp;->q:Linm;

    invoke-virtual {v0, p0}, Linm;->b(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/google/android/apps/camera/app/CameraApp;->i()Limi;

    move-result-object p0

    invoke-virtual {p0}, Limi;->gA()Ladvz;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public final h()Lacbt;
    .locals 4

    invoke-direct {p0}, Lcom/google/android/apps/camera/app/CameraApp;->i()Limi;

    move-result-object p0

    sget-object v0, Lyiq;->b:Lyeo;

    iget-object v1, p0, Limi;->pu:Laccg;

    iget-object p0, p0, Limi;->pv:Laccg;

    const-string v2, "com.google.android.libraries.mdi.download.foreground.dagger.NotificationReusingForegroundService"

    const-string v3, "vjy"

    invoke-static {v3, v1, v2, p0}, Lyeo;->l(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeo;

    move-result-object p0

    new-instance v1, Lacbw;

    invoke-direct {v1, v0, p0}, Lacbw;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    return-object v1
.end method

.method public final onCreate()V
    .locals 19

    sput-object p0, Lcom/google/android/apps/camera/app/CameraApp;->sAppContext:Landroid/content/Context;

    move-object/from16 v0, p0

    sget-object v1, Lxiw;->m:Ljava/lang/Boolean;

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v1, :cond_7

    invoke-static {}, Landroid/os/Process;->isIsolated()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    move v1, v4

    goto :goto_5

    :cond_0
    sget-object v1, Lxiw;->l:Ljava/lang/String;

    if-nez v1, :cond_3

    invoke-static {}, Lxiw;->au()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    move-object v1, v2

    goto :goto_2

    :cond_1
    const/16 v6, 0x3a

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ne v6, v3, :cond_2

    const-string v1, ""

    sput-object v1, Lxiw;->l:Ljava/lang/String;

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lxiw;->l:Ljava/lang/String;

    :goto_1
    sget-object v1, Lxiw;->l:Ljava/lang/String;

    :cond_3
    :goto_2
    if-nez v1, :cond_5

    :cond_4
    move v1, v5

    goto :goto_5

    :cond_5
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    goto :goto_4

    :sswitch_0
    const-string v6, ":leakcanary"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_3

    :sswitch_1
    const-string v6, ":train"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_3

    :sswitch_2
    const-string v6, ":learning_bg"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_3

    :sswitch_3
    const-string v6, ":primes_lifeboat"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    :goto_3
    goto :goto_0

    :cond_6
    :goto_4
    const-string v6, ":privileged_process"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    :goto_5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lxiw;->m:Ljava/lang/Boolean;

    :cond_7
    sget-object v1, Lxiw;->m:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-super {v0}, Lnnu;->onCreate()V

    return-void

    :cond_8
    const-string v1, "GCA_App#onCreate"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    invoke-static {}, Lrfi;->d()Lrfi;

    move-result-object v1

    sget-object v6, Lrfh;->a:Lrfh;

    invoke-virtual {v1, v6}, Lrfu;->k(Ljava/lang/Enum;)V

    const-string v6, "ProcessStablePhInit#onCreate"

    invoke-static {v6}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    invoke-static {v0}, Lwnc;->b(Landroid/content/Context;)V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    sget-object v6, Lklg;->d:Lklg;

    sget-object v7, Lklg;->c:Lklg;

    invoke-virtual {v6, v7}, Lklg;->a(Lklg;)Z

    move-result v6

    const/4 v7, 0x2

    if-eqz v6, :cond_9

    sget-object v6, Lcom/google/android/apps/camera/app/CameraApp;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-nez v6, :cond_c

    const-string v6, "#floggerConfig"

    invoke-static {v6}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    new-instance v6, Lzmc;

    new-array v7, v7, [Lynd;

    sget-object v8, Lyno;->c:Lynm;

    iget-boolean v11, v8, Lynm;->b:Z

    iget v9, v8, Lynm;->g:I

    iget-object v13, v8, Lynm;->c:Ljava/util/logging/Level;

    iget-boolean v14, v8, Lynm;->d:Z

    iget-object v15, v8, Lynm;->e:Ljava/util/Set;

    iget-object v8, v8, Lynm;->f:Lyml;

    new-instance v9, Lynm;

    const-string v10, "CAM_"

    const/4 v12, 0x2

    move-object/from16 v16, v8

    invoke-direct/range {v9 .. v16}, Lynm;-><init>(Ljava/lang/String;ZILjava/util/logging/Level;ZLjava/util/Set;Lyml;)V

    iget-object v11, v9, Lynm;->a:Ljava/lang/String;

    iget-boolean v12, v9, Lynm;->b:Z

    iget-object v14, v9, Lynm;->c:Ljava/util/logging/Level;

    iget-object v8, v9, Lynm;->e:Ljava/util/Set;

    iget-object v9, v9, Lynm;->f:Lyml;

    new-instance v10, Lynm;

    const/4 v13, 0x2

    const/4 v15, 0x1

    move-object/from16 v16, v8

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lynm;-><init>(Ljava/lang/String;ZILjava/util/logging/Level;ZLjava/util/Set;Lyml;)V

    iget-object v12, v10, Lynm;->a:Ljava/lang/String;

    iget-object v15, v10, Lynm;->c:Ljava/util/logging/Level;

    iget-boolean v8, v10, Lynm;->d:Z

    iget-object v9, v10, Lynm;->e:Ljava/util/Set;

    iget-object v10, v10, Lynm;->f:Lyml;

    new-instance v11, Lynm;

    const/4 v13, 0x0

    const/4 v14, 0x2

    move/from16 v16, v8

    move-object/from16 v17, v9

    move-object/from16 v18, v10

    invoke-direct/range {v11 .. v18}, Lynm;-><init>(Ljava/lang/String;ZILjava/util/logging/Level;ZLjava/util/Set;Lyml;)V

    aput-object v11, v7, v5

    invoke-direct {v0}, Lcom/google/android/apps/camera/app/CameraApp;->j()Lzmc;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-direct {v6, v7, v5}, Lzmc;-><init>([Lynd;I)V

    invoke-static {}, Lyne;->b()V

    invoke-static {v6}, Lyne;->a(Lynd;)V

    sget-object v4, Lynl;->a:Lynl;

    invoke-virtual {v4}, Lynl;->c()V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    goto/16 :goto_7

    :cond_9
    sget-object v6, Lcom/google/android/apps/camera/app/CameraApp;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-nez v6, :cond_a

    const-string v6, "#floggerConfig"

    invoke-static {v6}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    new-instance v6, Lzmc;

    new-array v8, v7, [Lynd;

    new-instance v9, Lync;

    invoke-direct {v9}, Lync;-><init>()V

    iget-boolean v9, v9, Lync;->b:Z

    new-instance v10, Lync;

    const-string v11, "CAM_"

    invoke-direct {v10, v11, v9, v7}, Lync;-><init>(Ljava/lang/String;ZI)V

    iget-object v9, v10, Lync;->a:Ljava/lang/String;

    new-instance v10, Lync;

    invoke-direct {v10, v9, v5, v7}, Lync;-><init>(Ljava/lang/String;ZI)V

    aput-object v10, v8, v5

    invoke-direct {v0}, Lcom/google/android/apps/camera/app/CameraApp;->j()Lzmc;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-direct {v6, v8, v5}, Lzmc;-><init>([Lynd;I)V

    invoke-static {}, Lyne;->b()V

    invoke-static {v6}, Lyne;->a(Lynd;)V

    sget-object v6, Lynl;->a:Lynl;

    invoke-virtual {v6}, Lynl;->c()V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    :cond_a
    const-string v6, "HierarchySnapshot#init"

    invoke-static {v6}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    new-instance v9, Lwzl;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    invoke-interface {v6, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v9, Lwzu;

    invoke-direct {v9, v4}, Lwzu;-><init>(I)V

    invoke-interface {v6, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v4, Lwzr;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v4, Lwzu;

    invoke-direct {v4, v5}, Lwzu;-><init>(I)V

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v4, Lwzx;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v4, Lwzu;

    invoke-direct {v4, v7}, Lwzu;-><init>(I)V

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v4, Lwzy;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-interface {v6, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v4, Lwzs;->b:Lwzs;

    invoke-interface {v8, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v4, Lwzs;->a:Lwzs;

    invoke-interface {v8, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v4, Lwyn;

    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_16

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lwyi;

    new-instance v11, Lwyu;

    invoke-direct {v11, v10}, Lwyu;-><init>(Lwyi;)V

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    :cond_b
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v6, Lwyt;

    invoke-direct {v6, v9}, Lwyt;-><init>(Ljava/util/List;)V

    invoke-direct {v4, v6}, Lwyn;-><init>(Lwyt;)V

    new-instance v6, Landroid/content/IntentFilter;

    invoke-direct {v6}, Landroid/content/IntentFilter;-><init>()V

    const-string v8, "com.google.android.libraries.snapshot.action.CAPTURE_SNAPSHOT"

    invoke-virtual {v6, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v8, "com.google.android.libraries.snapshot.action.GET_SNAPSHOTTER_INFO"

    invoke-virtual {v6, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v8, "com.google.android.libraries.snapshot.action.RESET_COUNTERS"

    invoke-virtual {v6, v8}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {v6, v5}, Landroid/content/IntentFilter;->setPriority(I)V

    invoke-virtual {v0, v4, v6, v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    invoke-static {}, Landroid/os/Trace;->endSection()V

    :cond_c
    :goto_7
    new-instance v4, Lioo;

    new-instance v6, Lils;

    invoke-direct {v6, v0}, Lils;-><init>(Lcom/google/android/apps/camera/app/CameraApp;)V

    invoke-direct {v4, v6}, Lioo;-><init>(Lion;)V

    invoke-virtual {v0, v4}, Lcom/google/android/apps/camera/app/CameraApp;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    invoke-super {v0}, Lnnu;->onCreate()V

    sget v4, Ldf;->a:I

    if-eq v4, v3, :cond_f

    sput v3, Ldf;->a:I

    sget-object v3, Ldf;->d:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    sget-object v4, Ldf;->c:Laac;

    new-instance v6, Laab;

    invoke-direct {v6, v4}, Laab;-><init>(Laac;)V

    :cond_d
    :goto_8
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldf;

    if-eqz v4, :cond_d

    invoke-virtual {v4}, Ldf;->o()V

    goto :goto_8

    :cond_e
    monitor-exit v3

    goto :goto_9

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_f
    :goto_9
    const-string v3, "uimode"

    invoke-virtual {v0, v3}, Lcom/google/android/apps/camera/app/CameraApp;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/UiModeManager;

    if-eqz v3, :cond_10

    invoke-virtual {v3, v5}, Landroid/app/UiModeManager;->setApplicationNightMode(I)V

    :cond_10
    invoke-direct {v0}, Lcom/google/android/apps/camera/app/CameraApp;->i()Limi;

    sget-object v3, Lwkd;->a:Lwkd;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-static {v4}, Lwvs;->d(Ljava/lang/Thread;)Z

    move-result v4

    if-eqz v4, :cond_11

    iget-object v4, v3, Lwkd;->c:Lwgq;

    if-nez v4, :cond_11

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    new-instance v4, Lwgq;

    invoke-direct {v4, v6, v7, v8, v9}, Lwgq;-><init>(JJ)V

    iput-object v4, v3, Lwkd;->c:Lwgq;

    new-instance v4, Lstv;

    const/16 v6, 0x14

    invoke-direct {v4, v3, v6}, Lstv;-><init>(Ljava/lang/Object;I)V

    invoke-static {}, Lwvs;->a()Landroid/os/Handler;

    move-result-object v6

    invoke-virtual {v6, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    new-instance v4, Lwkc;

    invoke-direct {v4, v3, v0}, Lwkc;-><init>(Lwkd;Landroid/app/Application;)V

    invoke-virtual {v0, v4}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_11
    iget-object v0, v0, Lcom/google/android/apps/camera/app/CameraApp;->e:Lwsz;

    if-nez v0, :cond_12

    const-string v0, "processInitializerRunner"

    invoke-static {v0}, Ladhh;->c(Ljava/lang/String;)V

    move-object v0, v2

    :cond_12
    iget-boolean v3, v0, Lwsz;->a:Z

    if-eqz v3, :cond_13

    invoke-static {}, Lwvs;->c()V

    :cond_13
    iget-object v3, v0, Lwsz;->b:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lwsx;->values()[Lwsx;

    move-result-object v3

    array-length v4, v3

    :goto_a
    if-ge v5, v4, :cond_15

    aget-object v6, v3, v5

    iget-object v7, v0, Lwsz;->b:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwsy;

    if-eqz v6, :cond_14

    invoke-interface {v6}, Lwsy;->a()V

    :cond_14
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    :cond_15
    iput-object v2, v0, Lwsz;->b:Ljava/util/Map;

    sget-object v0, Lrfh;->b:Lrfh;

    invoke-virtual {v1, v0}, Lrfu;->k(Ljava/lang/Enum;)V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No AttributeGenerators were registered. Try calling withCommonAttributeGenerators()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_data_0
    .sparse-switch
        -0x2bf9cf33 -> :sswitch_3
        -0x2bbec774 -> :sswitch_2
        0x6991060e -> :sswitch_1
        0x70d2f175 -> :sswitch_0
    .end sparse-switch
.end method
