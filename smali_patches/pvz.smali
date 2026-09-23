.class public Lpvz;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field private static final G:Lykq;


# instance fields
.field public final A:Z

.field public final B:Z

.field public final C:Z

.field public final D:Z

.field public final E:I

.field public final F:I

.field private final H:Z

.field private final I:Z

.field private final J:Z

.field private final K:Z

.field private final L:Z

.field private final M:Z

.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:Z

.field public final h:F

.field public final i:Z

.field public final j:F

.field public final k:F

.field public final l:Z

.field public final m:Z

.field public final n:Z

.field public final o:Z

.field public final p:Z

.field public final q:Z

.field public final r:Z

.field public final s:Z

.field public final t:Z

.field public final u:Z

.field public final v:Z

.field public final w:Z

.field public final x:Z

.field public final y:Z

.field public final z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "pvz"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lpvz;->G:Lykq;

    return-void
.end method

.method public constructor <init>(Lklm;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lkkn;->D:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->a:Z

    sget-object v0, Lkkn;->E:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->b:Z

    sget-object v0, Lkkn;->aL:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->c:Z

    sget-object v0, Lkkn;->aM:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->d:Z

    sget-object v0, Lkkn;->aw:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->e:Z

    sget-object v0, Lkkn;->au:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->f:Z

    sget-object v0, Lkkn;->av:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->g:Z

    sget-object v0, Lkkn;->aT:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lpvz;->h:F

    sget-object v0, Lkkn;->S:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->H:Z

    sget-object v0, Lkkn;->T:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->I:Z

    sget-object v0, Lkkn;->W:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->i:Z

    sget-object v0, Lkkn;->aW:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->J:Z

    sget-object v0, Lkkn;->aD:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->K:Z

    sget-object v0, Lkkn;->aY:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->L:Z

    sget-object v0, Lkkn;->aJ:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->M:Z

    sget-object v0, Lkkn;->aU:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lpvz;->j:F

    sget-object v0, Lkkn;->aV:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lpvz;->k:F

    sget-object v0, Lkkn;->aa:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->l:Z

    sget-object v0, Lkkn;->N:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->m:Z

    sget-object v0, Lkkn;->aj:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->n:Z

    sget-object v0, Lkkn;->ak:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->o:Z

    sget-object v0, Lkkn;->am:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->p:Z

    sget-object v0, Lkkn;->al:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->q:Z

    sget-object v0, Lkkn;->ar:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->r:Z

    sget-object v0, Lkkn;->ac:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->s:Z

    sget-object v0, Lkkn;->ad:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->t:Z

    sget-object v0, Lkkn;->ae:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->u:Z

    sget-object v0, Lkkn;->aE:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->v:Z

    sget-object v0, Lkkn;->aF:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->w:Z

    sget-object v0, Lkkn;->aG:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->x:Z

    sget-object v0, Lkkn;->aH:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->y:Z

    sget-object v0, Lkkn;->aK:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->z:Z

    sget-object v0, Lkkn;->aA:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->A:Z

    sget-object v0, Lkkn;->ai:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->B:Z

    sget-object v0, Lkkn;->ah:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->C:Z

    sget-object v0, Lkkn;->X:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Lpvz;->D:Z

    sget-object v0, Lkkn;->a:Lkiy;

    invoke-virtual {p1, v0}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lpvz;->E:I

    sget-object v0, Lkkq;->c:Lkiy;

    invoke-virtual {p1, v0}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p1

    invoke-virtual {p1, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lpvz;->F:I

    return-void
.end method

.method private static final i(ZZ)I
    .locals 0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    if-eqz p1, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const/4 p0, 0x3

    return p0
.end method


# virtual methods
.method public final a(Z)Lpwz;
    .locals 0

    invoke-virtual {p0, p1}, Lpvz;->d(Z)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lpwz;->c:Lpwz;

    return-object p0

    :cond_0
    sget-object p0, Lpwz;->b:Lpwz;

    return-object p0
.end method

.method public final b(FZ)Lpwz;
    .locals 1

    invoke-virtual {p0, p2}, Lpvz;->e(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lpvz;->h:F

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_0

    sget-object p0, Lpwz;->d:Lpwz;

    return-object p0

    :cond_0
    invoke-virtual {p0, p2}, Lpvz;->a(Z)Lpwz;

    move-result-object p0

    return-object p0
.end method

.method public final c()Z
    .locals 1

    iget-boolean v0, p0, Lpvz;->L:Z

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Lpvz;->M:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final d(Z)Z
    .locals 0

    if-nez p1, :cond_0

    iget-boolean p0, p0, Lpvz;->e:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final e(Z)Z
    .locals 0

    if-eqz p1, :cond_0

    iget-boolean p0, p0, Lpvz;->g:Z

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public final f()Z
    .locals 1

    iget-boolean v0, p0, Lpvz;->J:Z

    iget-boolean p0, p0, Lpvz;->K:Z

    if-nez v0, :cond_0

    if-eqz p0, :cond_1

    sget-object p0, Lpvz;->G:Lykq;

    invoke-virtual {p0}, Lykh;->b()Lyld;

    move-result-object p0

    const/16 v0, 0x16a7

    invoke-interface {p0, v0}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string v0, "UNBINNED_CROP is not supported, but it is enabled. Disabling UNBINNED_CROP."

    invoke-interface {p0, v0}, Lyko;->s(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method public final g(Lpwz;)Z
    .locals 1

    sget-object v0, Lpwz;->d:Lpwz;

    if-ne p1, v0, :cond_0

    iget-boolean p0, p0, Lpvz;->I:Z

    return p0

    :cond_0
    iget-boolean p0, p0, Lpvz;->H:Z

    return p0
.end method

.method public final h(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const/4 p0, 0x0

    invoke-static {p0, p0}, Lpvz;->i(ZZ)I

    move-result p0

    return p0

    :cond_0
    iget-boolean p1, p0, Lpvz;->d:Z

    iget-boolean p0, p0, Lpvz;->c:Z

    invoke-static {p1, p0}, Lpvz;->i(ZZ)I

    move-result p0

    return p0
.end method
