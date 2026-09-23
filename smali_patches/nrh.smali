.class public Lnrh;
.super Lqhr;
.source "PG"

# interfaces
.implements Lpyx;


# static fields
.field public static final c:Lykq;


# instance fields
.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final e:Lufn;

.field public final f:Lrdw;

.field private final g:Lugh;

.field private final h:Lufv;

.field private final i:Lugh;

.field private j:Landroid/view/View;

.field private k:Landroid/view/View;

.field private l:Lsmq;

.field private final m:Lejf;

.field private final n:Lugh;

.field private final o:Lufn;

.field private p:Z

.field private final q:Lrex;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "nrh"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnrh;->c:Lykq;

    return-void
.end method

.method public constructor <init>(Losw;Lugh;Lufv;Lrex;Lrdw;Lugh;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Lqhr;-><init>()V

    iput-object p2, p0, Lnrh;->g:Lugh;

    iput-object p3, p0, Lnrh;->h:Lufv;

    iput-object p4, p0, Lnrh;->q:Lrex;

    iput-object p5, p0, Lnrh;->f:Lrdw;

    iput-object p6, p0, Lnrh;->i:Lugh;

    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p2, p0, Lnrh;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p2, Lejf;

    const/4 p3, 0x0

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-direct {p2, p3}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lnrh;->m:Lejf;

    iget-object p1, p1, Losw;->g:Lugh;

    iput-object p1, p0, Lnrh;->n:Lugh;

    new-instance p1, Lufn;

    const-string p2, ""

    invoke-direct {p1, p2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnrh;->e:Lufn;

    new-instance p1, Lufn;

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnrh;->o:Lufn;

    return-void
.end method

.method private static final t(F)F
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v0, v1}, Ladhc;->f(FFF)F

    move-result p0

    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lula;
    .locals 3

    iget-object v0, p0, Lnrh;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_already_bound

    iput-object p1, p0, Lnrh;->j:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a01a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lnrh;->k:Landroid/view/View;

    :cond_already_bound
    new-instance p1, Lmmf;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v0}, Lmmf;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method

.method public final d()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnrh;->p:Z

    iget-object v0, p0, Lnrh;->j:Landroid/view/View;

    if-eqz v0, :cond_1

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lnrh;->k:Landroid/view/View;

    if-eqz p0, :cond_0

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Required value was null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final e()V
    .locals 3

    iget-object v0, p0, Lnrh;->m:Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->i(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrh;->n:Lugh;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnqu;->a:Lsmy;

    if-nez v0, :cond_0

    sget-object v0, Lnrh;->c:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    const/16 v1, 0xfeb

    invoke-interface {v0, v1}, Lyld;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "Evc slider not found"

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {v1}, Lnrh;->t(F)F

    move-result v1

    invoke-static {v0, v1}, Lsmy;->i(Lsmy;F)V

    :goto_0
    iget-object v0, p0, Lnrh;->g:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    iput-object v2, v1, Lnql;->c:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lnrh;->i:Lugh;

    new-instance v0, Lnqn;

    invoke-interface {p0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnqn;

    iget-boolean v1, v1, Lnqn;->a:Z

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lnqn;-><init>(ZZ)V

    invoke-interface {p0, v0}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final g()V
    .locals 6

    invoke-virtual {p0}, Lnqu;->j()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrh;->p:Z

    iget-object v1, p0, Lnrh;->k:Landroid/view/View;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lnrh;->k:Landroid/view/View;

    const v3, 0x7f130244

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f13023f

    const v4, 0x7f130243

    invoke-static {v2, v3, v4, v1}, Lobf;->x(Landroid/view/View;IILjava/lang/String;)V

    iput-object v2, p0, Lnrh;->k:Landroid/view/View;

    :cond_0
    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lnrh;->k()F

    move-result v2

    invoke-static {v1, v2}, Lsmy;->i(Lsmy;F)V

    :cond_1
    iget-object v1, p0, Lnrh;->m:Lejf;

    iget-object v2, p0, Lnrh;->i:Lugh;

    invoke-interface {v2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnqn;

    iget-boolean v2, v2, Lnqn;->b:Z

    xor-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Lejf;->i(Ljava/lang/Object;)V

    iget-object v1, p0, Lnrh;->o:Lufn;

    iget-object v1, v1, Lufn;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, p0, Lnrh;->j:Landroid/view/View;

    if-eqz v2, :cond_5

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-eq v0, v3, :cond_2

    move v3, v4

    goto :goto_0

    :cond_2
    move v3, v5

    :goto_0
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lnrh;->k:Landroid/view/View;

    if-eqz p0, :cond_4

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_3

    move v4, v5

    :cond_3
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    return-void

    :cond_5
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Required value was null."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final h()Lsmq;
    .locals 0

    iget-object p0, p0, Lnrh;->l:Lsmq;

    return-object p0
.end method

.method protected final i()Lsmy;
    .locals 24

    move-object/from16 v0, p0

    iget-object v1, v0, Lnrh;->j:Landroid/view/View;

    const-string v2, "Required value was null."

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lsmq;

    const v4, 0x7f1300b4

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lmcc;

    const/16 v6, 0x8

    invoke-direct {v5, v0, v6}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v6, v0, Lnrh;->m:Lejf;

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;[B)V

    iput-object v3, v0, Lnrh;->l:Lsmq;

    new-instance v8, Lsmy;

    iget-object v3, v0, Lnrh;->j:Landroid/view/View;

    if-eqz v3, :cond_1

    const v2, 0x7f0a01e8

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v9, v2

    check-cast v9, Landroidx/compose/ui/platform/ComposeView;

    new-instance v2, Ladin;

    const/4 v3, 0x0

    const/16 v4, 0x50

    invoke-direct {v2, v3, v4}, Ladin;-><init>(II)V

    const/4 v3, 0x4

    invoke-static {v2, v3}, Ladhc;->m(Ladil;I)Ladil;

    move-result-object v2

    invoke-static {v2}, Laaax;->bK(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v12

    const v2, 0x7f070925

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v13

    new-instance v2, Ladin;

    const/16 v3, -0xa

    const/16 v4, 0xa

    invoke-direct {v2, v3, v4}, Ladin;-><init>(II)V

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {v2, v4}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ladil;->a()Laddn;

    move-result-object v2

    :goto_0
    move-object v5, v2

    check-cast v5, Ladim;

    iget-boolean v5, v5, Ladim;->a:Z

    if-eqz v5, :cond_0

    invoke-virtual {v2}, Laddn;->a()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const v2, 0x7f070218

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    new-instance v17, Lsmu;

    const v6, 0x7f1301c1

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v16

    new-instance v6, Landroid/util/Size;

    invoke-direct {v6, v5, v5}, Landroid/util/Size;-><init>(II)V

    iget-object v5, v0, Lnrh;->j:Landroid/view/View;

    invoke-static {v5}, Ltqz;->bj(Landroid/view/View;)I

    move-result v18

    const/16 v19, 0x0

    const v15, 0x7f0802be

    move-object/from16 v14, v17

    move-object/from16 v17, v6

    invoke-direct/range {v14 .. v19}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I[B)V

    move-object/from16 v17, v14

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    new-instance v18, Lsmu;

    const v5, 0x7f1303bb

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v20

    new-instance v5, Landroid/util/Size;

    invoke-direct {v5, v2, v2}, Landroid/util/Size;-><init>(II)V

    iget-object v2, v0, Lnrh;->j:Landroid/view/View;

    invoke-static {v2}, Ltqz;->bj(Landroid/view/View;)I

    move-result v22

    const/16 v23, 0x0

    const v19, 0x7f0802bb

    move-object/from16 v21, v5

    invoke-direct/range {v18 .. v23}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I[B)V

    new-instance v2, Lndq;

    const/16 v5, 0x9

    invoke-direct {v2, v0, v5}, Lndq;-><init>(Ljava/lang/Object;I)V

    new-instance v5, Lndq;

    invoke-direct {v5, v1, v4}, Lndq;-><init>(Ljava/lang/Object;I)V

    new-instance v10, Lsmv;

    const/16 v21, 0x0

    const/16 v23, 0xc08

    const/16 v11, 0x51

    const/4 v14, 0x0

    const/4 v15, 0x3

    const/16 v20, 0x0

    move-object/from16 v19, v2

    move-object/from16 v16, v3

    move-object/from16 v22, v5

    invoke-direct/range {v10 .. v23}, Lsmv;-><init>(ILjava/util/Set;FFILjava/util/List;Lsmu;Lsmu;Ladgi;ZILadgi;I)V

    iget-object v11, v0, Lnrh;->l:Lsmq;

    iget-object v12, v0, Lnqu;->b:Lsbl;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v14, 0x0

    const/16 v15, 0x30

    const/4 v13, 0x0

    invoke-direct/range {v8 .. v15}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;Lsmq;Ljava/lang/Float;I)V

    new-instance v1, Lnrc;

    const/4 v2, 0x3

    invoke-direct {v1, v0, v2, v7}, Lnrc;-><init>(Lnqu;I[B)V

    invoke-virtual {v8, v1}, Lsmy;->e(Lsnx;)V

    return-object v8

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final k()F
    .locals 1

    iget-object p0, p0, Lnrh;->h:Lufv;

    invoke-interface {p0}, Lufv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnqm;

    iget-object p0, p0, Lnqm;->c:Lj$/util/Optional;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {p0, v0}, Ladht;->g(Lj$/util/Optional;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    invoke-static {p0}, Lnrh;->t(F)F

    move-result p0

    return p0
.end method

.method public final l(Z)V
    .locals 1

    iget-object v0, p0, Lnrh;->o:Lufn;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p1}, Lufn;->a(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lnrh;->p:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnqu;->g()V

    :cond_0
    return-void
.end method

.method public final m()Lufv;
    .locals 0

    iget-object p0, p0, Lnrh;->o:Lufn;

    return-object p0
.end method

.method public final n()Lufv;
    .locals 0

    iget-object p0, p0, Lnrh;->e:Lufn;

    return-object p0
.end method

.method public final o()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f13023f

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final p()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f130244

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final q()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f130243

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final r(FZLsnw;)V
    .locals 3

    if-nez p2, :cond_0

    return-void

    :cond_0
    sget-object p2, Lsnw;->b:Lsnw;

    const/4 v0, 0x0

    if-eq p3, p2, :cond_1

    const/high16 p2, 0x3f000000    # 0.5f

    cmpg-float p2, p1, p2

    if-nez p2, :cond_1

    const/4 v0, 0x1

    :cond_1
    iget-object p2, p0, Lnrh;->i:Lugh;

    new-instance v1, Lnqn;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnqn;

    iget-boolean v2, v2, Lnqn;->a:Z

    invoke-direct {v1, v2, v0}, Lnqn;-><init>(ZZ)V

    invoke-interface {p2, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p2, p0, Lnrh;->m:Lejf;

    xor-int/lit8 v1, v0, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p2, v1}, Lejf;->i(Ljava/lang/Object;)V

    iget-object p2, p0, Lnrh;->n:Lugh;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {p2, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p2, p0, Lnrh;->g:Lugh;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnql;

    if-eqz v0, :cond_2

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    :goto_0
    iput-object v0, v2, Lnql;->c:Lj$/util/Optional;

    invoke-interface {p2, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lnrh;->q:Lrex;

    const/16 p2, 0xf

    float-to-double v0, p1

    invoke-virtual {p0, p3, p2, v0, v1}, Lrex;->E(Lsnw;ID)V

    return-void
.end method

.method public final s(FZLsnw;)V
    .locals 2

    iget-object v0, p0, Lnrh;->e:Lufn;

    invoke-static {p1}, Lobf;->p(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lufn;->a(Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2, p3}, Lnrh;->r(FZLsnw;)V

    return-void
.end method
