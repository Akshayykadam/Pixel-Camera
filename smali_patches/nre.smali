.class public Lnre;
.super Lqhr;
.source "PG"

# interfaces
.implements Lpyx;


# static fields
.field public static final c:Lykq;


# instance fields
.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public final g:Lufn;

.field public final h:Landroid/util/Pair;

.field public i:Luep;

.field public j:Z

.field public final k:Lrdw;

.field private final l:Lugh;

.field private final m:Lufv;

.field private final n:Lugh;

.field private final o:Lejf;

.field private p:Lsmq;

.field private final q:Lugh;

.field private final r:F

.field private final s:Lufn;

.field private t:Luep;

.field private final u:Lrex;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "nre"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnre;->c:Lykq;

    return-void
.end method

.method public constructor <init>(Losw;Lugh;Lufv;Lrex;Lrdw;Lklm;Lugh;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Lqhr;-><init>()V

    iput-object p2, p0, Lnre;->l:Lugh;

    iput-object p3, p0, Lnre;->m:Lufv;

    iput-object p4, p0, Lnre;->u:Lrex;

    iput-object p5, p0, Lnre;->k:Lrdw;

    iput-object p7, p0, Lnre;->n:Lugh;

    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p2, p0, Lnre;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance p2, Lejf;

    const/4 p3, 0x0

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-direct {p2, p3}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lnre;->o:Lejf;

    iget-object p1, p1, Losw;->f:Lugh;

    iput-object p1, p0, Lnre;->q:Lugh;

    new-instance p1, Lufn;

    const-string p2, ""

    invoke-direct {p1, p2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnre;->g:Lufn;

    invoke-static {p6}, Lnbw;->p(Lklm;)Landroid/util/Pair;

    move-result-object p1

    iput-object p1, p0, Lnre;->h:Landroid/util/Pair;

    invoke-static {p1}, Lnbw;->o(Landroid/util/Pair;)F

    move-result p1

    iput p1, p0, Lnre;->r:F

    new-instance p1, Lufn;

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnre;->s:Lufn;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lula;
    .locals 3

    iget-object v0, p0, Lnre;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_already_bound

    iput-object p1, p0, Lnre;->e:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a01a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lnre;->f:Landroid/view/View;

    new-instance p1, Luep;

    invoke-direct {p1}, Luep;-><init>()V

    iput-object p1, p0, Lnre;->i:Luep;

    :cond_already_bound
    new-instance p1, Lmmf;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, Lmmf;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method

.method public final declared-synchronized d()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnre;->t:Luep;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Luep;->close()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lnre;->t:Luep;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final e()V
    .locals 5

    iget-object v0, p0, Lnre;->o:Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->i(Ljava/lang/Object;)V

    iget v0, p0, Lnre;->r:F

    iget-object v1, p0, Lnre;->q:Lugh;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lnre;->l:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v3

    iput-object v3, v2, Lnql;->d:Lj$/util/Optional;

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lnre;->n:Lugh;

    new-instance v2, Lnqn;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnqn;

    iget-boolean v3, v3, Lnqn;->b:Z

    const/4 v4, 0x1

    invoke-direct {v2, v4, v3}, Lnqn;-><init>(ZZ)V

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lnqu;->a:Lsmy;

    if-eqz p0, :cond_0

    invoke-static {p0, v0}, Lsmy;->i(Lsmy;F)V

    :cond_0
    return-void
.end method

.method public final declared-synchronized g()V
    .locals 8

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lnqu;->j()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnre;->j:Z

    iget-object v1, p0, Lnre;->s:Lufn;

    iget-object v1, v1, Lufn;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, p0, Lnre;->e:Landroid/view/View;

    if-eqz v2, :cond_8

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-eq v0, v3, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lnre;->f:Landroid/view/View;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lnre;->f:Landroid/view/View;

    const v6, 0x7f130897

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v6, 0x7f130894

    const v7, 0x7f130896

    invoke-static {v3, v6, v7, v2}, Lobf;->x(Landroid/view/View;IILjava/lang/String;)V

    iput-object v3, p0, Lnre;->f:Landroid/view/View;

    if-eqz v3, :cond_2

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v0, v1, :cond_1

    move v4, v5

    :cond_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Required value was null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_1
    iget-object v1, p0, Lnre;->t:Luep;

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lnre;->k()F

    move-result v2

    invoke-static {v1, v2}, Lsmy;->i(Lsmy;F)V

    iget-object v1, p0, Lnre;->o:Lejf;

    iget-object v2, p0, Lnre;->n:Lugh;

    invoke-interface {v2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnqn;

    iget-boolean v2, v2, Lnqn;->a:Z

    xor-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v1, v0}, Lejf;->i(Ljava/lang/Object;)V

    iget-object v0, p0, Lnre;->i:Luep;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Luep;->d()Luep;

    move-result-object v0

    iput-object v0, p0, Lnre;->t:Luep;

    if-eqz v0, :cond_5

    new-instance v1, Lnht;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lnht;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_5
    :goto_2
    monitor-exit p0

    return-void

    :cond_6
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Required value was null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Required value was null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Required value was null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public final h()Lsmq;
    .locals 0

    iget-object p0, p0, Lnre;->p:Lsmq;

    return-object p0
.end method

.method protected final i()Lsmy;
    .locals 25

    move-object/from16 v0, p0

    iget-object v1, v0, Lnre;->e:Landroid/view/View;

    const-string v2, "Required value was null."

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lsmq;

    const v4, 0x7f1300be

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lmcc;

    const/4 v6, 0x7

    invoke-direct {v5, v0, v6}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v7, v0, Lnre;->o:Lejf;

    const/4 v8, 0x0

    invoke-direct {v3, v4, v5, v7, v8}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;[B)V

    iput-object v3, v0, Lnre;->p:Lsmq;

    new-instance v9, Lsmy;

    iget-object v3, v0, Lnre;->e:Landroid/view/View;

    if-eqz v3, :cond_3

    const v4, 0x7f0a00d2

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, v0, Lnre;->h:Landroid/util/Pair;

    move-object v10, v3

    check-cast v10, Landroidx/compose/ui/platform/ComposeView;

    iget-object v3, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    sub-int/2addr v3, v5

    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    new-instance v7, Ladil;

    const/4 v11, 0x0

    const/4 v12, -0x1

    invoke-direct {v7, v5, v11, v12}, Ladil;-><init>(III)V

    const/4 v11, 0x4

    invoke-static {v7, v11}, Ladhc;->m(Ladil;I)Ladil;

    move-result-object v7

    invoke-static {v7}, Laaax;->bG(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v7

    invoke-static {v7}, Laaax;->bC(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v7

    add-int/2addr v5, v11

    new-instance v12, Ladin;

    invoke-direct {v12, v5, v3}, Ladin;-><init>(II)V

    invoke-static {v12, v11}, Ladhc;->m(Ladil;I)Ladil;

    move-result-object v5

    invoke-static {v5}, Laaax;->bG(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v5

    invoke-static {v7, v5}, Laaax;->bA(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Laaax;->bK(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v13

    new-instance v5, Ljava/util/ArrayList;

    const/16 v7, 0xa

    invoke-static {v13, v7}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    const/4 v12, 0x1

    if-eqz v11, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    int-to-float v11, v11

    int-to-float v14, v3

    iget-object v15, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    move-result v15

    iget-object v8, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    div-float/2addr v11, v14

    invoke-static {v11, v15, v8}, Lobf;->o(FII)F

    move-result v8

    invoke-static {v8}, Ladia;->s(F)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8, v12}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v8

    const-string v11, "%d"

    invoke-static {v6, v11, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v5, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/4 v6, 0x7

    const/4 v8, 0x0

    goto :goto_0

    :cond_0
    add-int/2addr v12, v3

    const v3, 0x7f070925

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v14

    iget-object v3, v0, Lnre;->e:Landroid/view/View;

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v6, 0x7f0709b9

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    new-instance v17, Lsmu;

    const v7, 0x7f1301c9

    invoke-virtual {v3, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v19

    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v4, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v4, v0, Lnre;->e:Landroid/view/View;

    invoke-static {v4}, Ltqz;->bj(Landroid/view/View;)I

    move-result v21

    const/16 v22, 0x0

    const v18, 0x7f0802ee

    move-object/from16 v20, v3

    invoke-direct/range {v17 .. v22}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I[B)V

    iget-object v3, v0, Lnre;->e:Landroid/view/View;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    new-instance v18, Lsmu;

    const v4, 0x7f1303c3

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, v3, v3}, Landroid/util/Size;-><init>(II)V

    iget-object v3, v0, Lnre;->e:Landroid/view/View;

    invoke-static {v3}, Ltqz;->bj(Landroid/view/View;)I

    move-result v22

    const/16 v23, 0x0

    const v19, 0x7f0802b7

    move-object/from16 v21, v2

    invoke-direct/range {v18 .. v23}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I[B)V

    new-instance v11, Lsmv;

    new-instance v2, Lndq;

    const/4 v3, 0x7

    invoke-direct {v2, v0, v3}, Lndq;-><init>(Ljava/lang/Object;I)V

    new-instance v3, Lndq;

    const/16 v4, 0x8

    invoke-direct {v3, v1, v4}, Lndq;-><init>(Ljava/lang/Object;I)V

    const/16 v24, 0xc08

    const/4 v15, 0x0

    const/16 v16, 0x3

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v20, v2

    move-object/from16 v23, v3

    move-object/from16 v19, v18

    move-object/from16 v18, v17

    move-object/from16 v17, v5

    invoke-direct/range {v11 .. v24}, Lsmv;-><init>(ILjava/util/Set;FFILjava/util/List;Lsmu;Lsmu;Ladgi;ZILadgi;I)V

    iget-object v12, v0, Lnre;->p:Lsmq;

    iget-object v13, v0, Lnqu;->b:Lsbl;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v15, 0x0

    const/16 v16, 0x30

    const/4 v14, 0x0

    invoke-direct/range {v9 .. v16}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;Lsmq;Ljava/lang/Float;I)V

    new-instance v1, Lnrc;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Lnrc;-><init>(Lnqu;I[B)V

    invoke-virtual {v9, v1}, Lsmy;->e(Lsnx;)V

    return-object v9

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final k()F
    .locals 1

    iget-object v0, p0, Lnre;->m:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnqm;

    iget-object v0, v0, Lnqm;->d:Lj$/util/Optional;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p0, p0, Lnre;->r:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-static {v0, p0}, Ladht;->g(Lj$/util/Optional;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result p0

    return p0
.end method

.method public final l(Z)V
    .locals 1

    iget-object v0, p0, Lnre;->s:Lufn;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p1}, Lufn;->a(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lnre;->j:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnqu;->g()V

    :cond_0
    return-void
.end method

.method public final m()Lufv;
    .locals 0

    iget-object p0, p0, Lnre;->s:Lufn;

    return-object p0
.end method

.method public final n()Lufv;
    .locals 0

    iget-object p0, p0, Lnre;->g:Lufn;

    return-object p0
.end method

.method public final o()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f130894

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final p()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f130897

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final q()Ljava/lang/Integer;
    .locals 0

    const p0, 0x7f130896

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final r(FZLsnw;)V
    .locals 4

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lnre;->q:Lugh;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p2, v0}, Lugh;->a(Ljava/lang/Object;)V

    sget-object p2, Lsnw;->b:Lsnw;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p3, p2, :cond_1

    iget p2, p0, Lnre;->r:F

    cmpg-float p2, p1, p2

    if-nez p2, :cond_1

    move v2, v1

    :cond_1
    iget-object p2, p0, Lnre;->l:Lugh;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnql;

    if-eqz v2, :cond_2

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    :goto_0
    iput-object v0, v3, Lnql;->d:Lj$/util/Optional;

    invoke-interface {p2, v3}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p2, p0, Lnre;->n:Lugh;

    new-instance v0, Lnqn;

    invoke-interface {p2}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnqn;

    iget-boolean v3, v3, Lnqn;->b:Z

    invoke-direct {v0, v2, v3}, Lnqn;-><init>(ZZ)V

    invoke-interface {p2, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object p2, p0, Lnre;->o:Lejf;

    xor-int/lit8 v0, v2, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p2, v0}, Lejf;->i(Ljava/lang/Object;)V

    iget-object p0, p0, Lnre;->u:Lrex;

    const/16 p2, 0x10

    float-to-double v0, p1

    invoke-virtual {p0, p3, p2, v0, v1}, Lrex;->E(Lsnw;ID)V

    return-void
.end method

.method public final s(FZLsnw;)V
    .locals 2

    iget-object v0, p0, Lnre;->h:Landroid/util/Pair;

    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-static {p1, v1, v0}, Lobf;->n(FII)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnre;->g:Lufn;

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2, p3}, Lnre;->r(FZLsnw;)V

    return-void
.end method
