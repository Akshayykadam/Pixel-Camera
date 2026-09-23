.class public Lmuh;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field private static final a:Lykq;


# instance fields
.field private final b:Lacbr;

.field private final c:Lacbr;

.field private final d:Lj$/util/Optional;

.field private final e:Lulx;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "muh"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lmuh;->a:Lykq;

    return-void
.end method

.method public constructor <init>(Lacbr;Lacbr;Lj$/util/Optional;Lulx;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmuh;->b:Lacbr;

    iput-object p2, p0, Lmuh;->c:Lacbr;

    iput-object p3, p0, Lmuh;->d:Lj$/util/Optional;

    iput-object p4, p0, Lmuh;->e:Lulx;

    return-void
.end method


# virtual methods
.method public final a(Lcom/google/googlex/gcam/InterleavedWriteViewU8;Lcom/google/googlex/gcam/ShotMetadata;)V
    .locals 9

    const-string v0, "PATCH_LOOKS"

    const-string v1, "muh.a: Executing TomteImageFinalizer..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lmuh;->e:Lulx;

    const-string v1, "TomteImageFinalizer#finalize"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    iget-object v1, p0, Lmuh;->c:Lacbr;

    invoke-interface {v1}, Lacbr;->a()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/google/android/apps/camera/hdrplus/postprocessing/finalizer/FilmGrainJni;

    iget-object p0, p0, Lmuh;->b:Lacbr;

    invoke-interface {p0}, Lacbr;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/googlex/gcam/Gcam;

    invoke-static {p0}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->initTomteGrain(J)V

    invoke-static {p1}, Lcom/google/googlex/gcam/InterleavedWriteViewU8;->a(Lcom/google/googlex/gcam/InterleavedWriteViewU8;)J

    move-result-wide v5

    invoke-static {p2}, Lcom/google/googlex/gcam/ShotMetadata;->a(Lcom/google/googlex/gcam/ShotMetadata;)J

    move-result-wide v7

    invoke-virtual/range {v2 .. v8}, Lcom/google/android/apps/camera/hdrplus/postprocessing/finalizer/FilmGrainJni;->applyTomteImageFinalizer(JJJ)Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lmuh;->a:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p1, 0xd77

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "Failed to apply finalizer effect."

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    :cond_1
    invoke-interface {v0}, Lulx;->g()V

    return-void
.end method
