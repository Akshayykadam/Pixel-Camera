.class public Lnrd;
.super Lqhr;
.source "PG"

# interfaces
.implements Lpyx;


# static fields
.field public static final c:Lykq;


# instance fields
.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final e:Lejf;

.field public final f:Lugh;

.field public final g:Lugh;

.field public final h:Lugh;

.field public final i:Lnqt;

.field public final j:Lufv;

.field public final k:Lugh;

.field public l:F

.field public m:Luep;

.field public final n:Lnrf;

.field public final o:Lhze;

.field public final p:Lrex;

.field public final q:Lrdw;

.field private r:Landroid/view/View;

.field private s:Landroid/view/View;

.field public final t:Lppn;

.field private final u:Luer;

.field private v:Z

.field private w:Z

.field public final x:Lufn;

.field public rst:Lsmq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "nrd"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lnrd;->c:Lykq;

    return-void
.end method

.method public constructor <init>(Losw;Lnrf;Lppn;Lugh;Luer;Lufv;Lnqt;Lhze;Lrex;Lrdw;)V
    .locals 3

    invoke-direct {p0}, Lqhr;-><init>()V

    new-instance v0, Lufn;

    const-string v1, ""

    invoke-direct {v0, v1}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnrd;->x:Lufn;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lnrd;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lejf;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnrd;->e:Lejf;

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lnrd;->l:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrd;->v:Z

    iput-boolean v1, p0, Lnrd;->w:Z

    iput-object p2, p0, Lnrd;->n:Lnrf;

    iput-object p3, p0, Lnrd;->t:Lppn;

    iput-object p4, p0, Lnrd;->k:Lugh;

    iput-object p5, p0, Lnrd;->u:Luer;

    iget-object p2, p1, Losw;->d:Lugh;

    iput-object p2, p0, Lnrd;->f:Lugh;

    iget-object p2, p1, Losw;->c:Lugh;

    iput-object p2, p0, Lnrd;->g:Lugh;

    iget-object p1, p1, Losw;->a:Lugh;

    iput-object p1, p0, Lnrd;->h:Lugh;

    iput-object p6, p0, Lnrd;->j:Lufv;

    iput-object p7, p0, Lnrd;->i:Lnqt;

    iput-object p8, p0, Lnrd;->o:Lhze;

    iput-object p9, p0, Lnrd;->p:Lrex;

    iput-object p10, p0, Lnrd;->q:Lrdw;

    return-void
.end method

.method public static k(F)F
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v0, v1}, Laaaq;->aH(FFF)F

    move-result p0

    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lula;
    .locals 3

    iget-object v0, p0, Lnrd;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object p1, p0, Lnrd;->r:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a01a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lnrd;->s:Landroid/view/View;

    new-instance p1, Luep;

    invoke-direct {p1}, Luep;-><init>()V

    iput-object p1, p0, Lnrd;->m:Luep;

    iget-object v0, p0, Lnrd;->h:Lugh;

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v1, Lnrb;

    invoke-direct {v1, p0, v2}, Lnrb;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lnrd;->u:Luer;

    invoke-interface {v0, v1, v2}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {p1, v0}, Luep;->e(Lula;)V

    new-instance p1, Lnht;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lnht;-><init>(Ljava/lang/Object;I)V

    return-object p1

    :cond_0
    new-instance p1, Lnht;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lnht;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method

.method public final d()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnrd;->w:Z

    iget-object v0, p0, Lnrd;->r:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lnrd;->s:Landroid/view/View;

    if-eqz p0, :cond_0

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public final e()V
    .locals 5

    iget-object v0, p0, Lnrd;->e:Lejf;

    if-eqz v0, :cond_rst_btn_d

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_rst_btn_d
    iget-object v0, p0, Lnrd;->x:Lufn;

    if-eqz v0, :cond_rst_x

    const-string v1, ""

    invoke-virtual {v0, v1}, Lufn;->a(Ljava/lang/Object;)V

    :cond_rst_x
    iget-object v0, p0, Lnqu;->a:Lsmy;

    if-eqz v0, :cond_skip_smy_d

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-static {v0, v1}, Lsmy;->i(Lsmy;F)V

    const-string v1, ""

    invoke-virtual {v0, v1}, Lsmy;->f(Ljava/lang/String;)V

    :cond_skip_smy_d
    iget-object v0, p0, Lnrd;->g:Lugh;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrd;->t:Lppn;

    if-eqz v0, :cond_skip_ev_rst_d

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_skip_ev_rst_d

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrd;->f:Lugh;

    if-eqz v2, :cond_get_s_rst_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_s_rst_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_s_rst_done

    move v1, v2

    :cond_get_s_rst_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v1, v2

    const/high16 v2, 0x41400000    # 12.0f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    :cond_skip_ev_rst_d
    iget-object v0, p0, Lnrd;->n:Lnrf;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnrf;->c(Z)V

    iget-object v0, p0, Lnrd;->k:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnql;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v2

    iput-object v2, v1, Lnql;->b:Lj$/util/Optional;

    invoke-interface {v0, v1}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final g()V
    .locals 5

    invoke-virtual {p0}, Lnqu;->j()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrd;->w:Z

    iget-object v1, p0, Lnrd;->n:Lnrf;

    invoke-virtual {v1}, Lnrf;->b()V

    iget-object v1, p0, Lnrd;->s:Landroid/view/View;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lnrd;->s:Landroid/view/View;

    const v3, 0x7f1300fa

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v3, 0x7f1300f4

    const v4, 0x7f1300f9

    invoke-static {v2, v3, v4, v1}, Lobf;->x(Landroid/view/View;IILjava/lang/String;)V

    iput-object v2, p0, Lnrd;->s:Landroid/view/View;

    :cond_0
    iget-object v1, p0, Lnrd;->j:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnqm;

    iget-object v1, v1, Lnqm;->b:Lj$/util/Optional;

    iget-object v2, p0, Lnqu;->a:Lsmy;

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Lnrd;->k(F)F

    move-result v1

    invoke-static {v2, v1}, Lsmy;->i(Lsmy;F)V

    :cond_1
    iget-object v1, p0, Lnrd;->r:Landroid/view/View;

    iget-boolean v2, p0, Lnrd;->v:Z

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eq v0, v2, :cond_2

    move v2, v3

    goto :goto_0

    :cond_2
    move v2, v4

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lnrd;->s:Landroid/view/View;

    if-eqz v1, :cond_4

    iget-boolean v2, p0, Lnrd;->v:Z

    if-eq v0, v2, :cond_3

    move v3, v4

    :cond_3
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    iget-boolean v0, p0, Lnrd;->v:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lnrd;->f:Lugh;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_5

    iget-object v0, p0, Lnrd;->t:Lppn;

    invoke-virtual {v0}, Lppn;->g()V

    invoke-virtual {v0}, Lppn;->e()Lzfe;

    move-result-object v0

    new-instance v1, Livd;

    const/4 v2, 0x7

    invoke-direct {v1, p0, v2}, Livd;-><init>(Ljava/lang/Object;I)V

    sget-object v2, Luer;->a:Lues;

    invoke-static {v0, v1, v2}, Laaaq;->ar(Lzfe;Lzer;Ljava/util/concurrent/Executor;)V

    invoke-virtual {p0}, Lnrd;->e()V

    :cond_5
    return-void
.end method

.method protected final i()Lsmy;
    .locals 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lnrd;->r:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v2, Lsmy;

    iget-object v3, v0, Lnrd;->r:Landroid/view/View;

    const v4, 0x7f0a00d1

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/compose/ui/platform/ComposeView;

    new-instance v4, Lsmv;

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/16 v8, 0x8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/16 v9, 0xc

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/16 v10, 0x10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/16 v11, 0x14

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/16 v12, 0x18

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v13, 0x1c

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/16 v14, 0x20

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v15, 0x24

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v16, 0x28

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v12, v13, v14, v15, v5}, [Ljava/lang/Integer;

    move-result-object v12

    invoke-static/range {v6 .. v12}, Lyfm;->M(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lyfm;

    move-result-object v6

    const v5, 0x7f070925

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    int-to-float v7, v5

    sget v5, Lyeh;->d:I

    sget-object v11, Lyil;->a:Lyeh;

    const v5, 0x7f07011b

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    new-instance v12, Lsmu;

    const v9, 0x7f1301bc

    invoke-virtual {v1, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v10, Landroid/util/Size;

    invoke-direct {v10, v8, v8}, Landroid/util/Size;-><init>(II)V

    iget-object v8, v0, Lnrd;->r:Landroid/view/View;

    invoke-static {v8}, Ltqz;->bj(Landroid/view/View;)I

    move-result v8

    const v13, 0x7f0802be

    invoke-direct {v12, v13, v9, v10, v8}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    new-instance v13, Lsmu;

    const v8, 0x7f1303b6

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Landroid/util/Size;

    invoke-direct {v9, v5, v5}, Landroid/util/Size;-><init>(II)V

    iget-object v5, v0, Lnrd;->r:Landroid/view/View;

    invoke-static {v5}, Ltqz;->bj(Landroid/view/View;)I

    move-result v5

    const v10, 0x7f0802c0

    invoke-direct {v13, v10, v8, v9, v5}, Lsmu;-><init>(ILjava/lang/String;Landroid/util/Size;I)V

    new-instance v14, Lndq;

    const/4 v5, 0x5

    invoke-direct {v14, v0, v5}, Lndq;-><init>(Ljava/lang/Object;I)V

    new-instance v5, Lndq;

    const/4 v8, 0x6

    invoke-direct {v5, v1, v8}, Lndq;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v17, v5

    const/4 v9, 0x0

    const/16 v5, 0x29

    move v10, v8

    const/high16 v8, 0x3f000000    # 0.5f

    move v15, v9

    const/4 v9, 0x0

    move/from16 v16, v10

    const/4 v10, 0x3

    move/from16 v18, v15

    const/4 v15, 0x0

    move/from16 v19, v16

    const/16 v16, 0x1

    move-object/from16 v18, v2

    move/from16 v2, v19

    invoke-direct/range {v4 .. v17}, Lsmv;-><init>(ILjava/util/Set;FFZILjava/util/List;Lsmu;Lsmu;Ladgi;ZILadgi;)V

    new-instance v5, Lsmq;

    const v6, 0x7f1300a5

    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v6, Lmcc;

    invoke-direct {v6, v0, v2}, Lmcc;-><init>(Ljava/lang/Object;I)V

    iget-object v2, v0, Lnrd;->e:Lejf;

    invoke-direct {v5, v1, v6, v2}, Lsmq;-><init>(Ljava/lang/String;Ladfx;Lejf;)V

    iput-object v5, v0, Lnrd;->rst:Lsmq;

    iget-object v1, v0, Lnqu;->b:Lsbl;

    move-object/from16 v2, v18

    invoke-direct {v2, v3, v4, v5, v1}, Lsmy;-><init>(Landroidx/compose/ui/platform/ComposeView;Lsmv;Lsmq;Lsbl;)V

    new-instance v1, Lnrc;

    const/4 v15, 0x0

    invoke-direct {v1, v0, v15}, Lnrc;-><init>(Lnqu;I)V

    invoke-virtual {v2, v1}, Lsmy;->e(Lsnx;)V

    return-object v2
.end method

.method public final l(Z)V
    .locals 0

    iput-boolean p1, p0, Lnrd;->v:Z

    iget-boolean p1, p0, Lnrd;->w:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lnqu;->g()V

    :cond_0
    return-void
.end method

.method public final k()F
    .locals 1

    const/high16 v0, 0x3f000000    # 0.5f

    return v0
.end method

.method public final n()Lufv;
    .locals 1

    iget-object v0, p0, Lnrd;->x:Lufn;

    return-object v0
.end method

.method public final o()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f1300f4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final p()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f1300fa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final q()Ljava/lang/Integer;
    .locals 1

    const v0, 0x7f1300f9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public final s(FZLsnw;)V
    .locals 8

    invoke-static {p1}, Lobf;->p(F)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lnrd;->x:Lufn;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lufn;->a(Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lnqu;->a:Lsmy;

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Lsmy;->f(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lnrd;->e:Lejf;

    if-eqz v0, :cond_skip_rst

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_rst_off

    const/4 v1, 0x1

    goto :goto_rst

    :cond_rst_off
    const/4 v1, 0x0

    :goto_rst
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lejf;->j(Ljava/lang/Object;)V

    :cond_skip_rst
    iget-object v0, p0, Lnrd;->t:Lppn;

    if-eqz v0, :cond_ppn

    iget-object v1, v0, Lppn;->u:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, v0, Lppn;->f:Losw;

    if-eqz v0, :cond_ppn

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget-object v2, v0, Losw;->g:Lugh;

    invoke-interface {v2, v1}, Lugh;->a(Ljava/lang/Object;)V

    const/high16 v1, 0x3f000000    # 0.5f

    iget-object v2, p0, Lnrd;->f:Lugh;

    if-eqz v2, :cond_get_s_done

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    if-eqz v2, :cond_get_s_done

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v3, v2, v3

    if-ltz v3, :cond_get_s_done

    move v1, v2

    :cond_get_s_done
    const/high16 v2, 0x3f000000    # 0.5f

    sub-float v3, p1, v2

    const/high16 v4, 0x41c00000    # 24.0f

    mul-float/2addr v3, v4

    sub-float v2, v1, v2

    const/high16 v4, 0x41400000    # 12.0f

    mul-float/2addr v2, v4

    add-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    const/16 v3, 0x18

    if-le v2, v3, :cond_clamp_high_b

    move v2, v3

    :cond_clamp_high_b
    const/16 v3, -0x18

    if-ge v2, v3, :cond_clamp_low_b

    move v2, v3

    :cond_clamp_low_b
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v0, v0, Losw;->b:Lugh;

    invoke-interface {v0, v2}, Lugh;->a(Ljava/lang/Object;)V

    :cond_ppn
    const/4 v0, 0x1

    iget-object v1, p0, Lnrd;->n:Lnrf;

    invoke-virtual {v1, v0}, Lnrf;->c(Z)V

    iget-object v1, p0, Lnrd;->h:Lugh;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-object v1, p0, Lnrd;->g:Lugh;

    invoke-interface {v1, v0}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v1, p0, Lnrd;->f:Lugh;

    move-object v2, v1

    check-cast v2, Lufn;

    iget-object v3, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    :cond_3
    iget-object v1, p0, Lnrd;->k:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnql;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->b:Lj$/util/Optional;

    iget-object v0, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    iput-object v0, v3, Lnql;->e:Lj$/util/Optional;

    invoke-interface {v1, v3}, Lugh;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lnrd;->p:Lrex;

    const/16 v1, 0x8

    float-to-double v2, p1

    invoke-virtual {v0, p3, v1, v2, v3}, Lrex;->E(Lsnw;ID)V

    return-void
.end method


.method public final h()Lsmq;
    .locals 1

    iget-object v0, p0, Lnrd;->rst:Lsmq;

    return-object v0
.end method
