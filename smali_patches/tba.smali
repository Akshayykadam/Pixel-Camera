.class public final Ltba;
.super Ljava/lang/Object;
.source "PG"


# instance fields
.field public final a:Z

.field public final b:F

.field public final c:F

.field public final d:Z

.field public final e:Z

.field public final f:Z

.field public final g:I

.field private final h:Z

.field private final i:Z

.field private final j:Z

.field private final k:F

.field private final l:Z

.field private final m:Z

.field private final n:Z


# direct methods
.method public constructor <init>(Lklm;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lklf;->d:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->i:Z

    sget-object v0, Lklf;->i:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->h:Z

    sget-object v0, Lklf;->l:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->a:Z

    sget-object v0, Lklf;->k:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->j:Z

    sget-object v0, Lklf;->f:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Ltba;->b:F

    sget-object v0, Lklf;->g:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Ltba;->c:F

    sget-object v0, Lklf;->e:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    sget-object v0, Lklf;->m:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->l:Z

    sget-object v0, Lklf;->n:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->d:Z

    sget-object v0, Lkjl;->aJ:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->e:Z

    sget-object v0, Lklf;->o:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    sget-object v0, Lklf;->p:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->m:Z

    sget-object v0, Lklf;->q:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->f:Z

    sget-object v0, Lklf;->b:Lkiy;

    invoke-virtual {p1, v0}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Ltba;->g:I

    sget-object v0, Lklf;->j:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->x(Lkiz;)Z

    move-result v0

    iput-boolean v0, p0, Ltba;->n:Z

    sget-object v0, Lklf;->h:Lkiz;

    invoke-virtual {p1, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object p1

    const/high16 v0, 0x42f00000    # 120.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p1, v0}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Ltba;->k:F

    return-void
.end method


# virtual methods
.method public final a()F
    .locals 1

    iget-boolean v0, p0, Ltba;->n:Z

    if-eqz v0, :cond_0

    iget p0, p0, Ltba;->k:F

    return p0

    :cond_0
    iget p0, p0, Ltba;->c:F

    return p0
.end method

.method public final b()Z
    .locals 1

    iget-boolean v0, p0, Ltba;->i:Z

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Ltba;->h:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final c()Z
    .locals 1

    invoke-virtual {p0}, Ltba;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Ltba;->m:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final d()Z
    .locals 1

    invoke-virtual {p0}, Ltba;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Ltba;->l:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final e()Z
    .locals 1

    invoke-virtual {p0}, Ltba;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean p0, p0, Ltba;->j:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
