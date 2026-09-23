.class public final Lkfw;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lrai;
.implements Lnnq;
.implements Lnmd;
.implements Lkfy;
.implements Ljwh;
.implements Lsbk;


# static fields
.field public static final a:Lykq;

.field private static final an:Ljava/util/List;


# instance fields
.field public final A:Lssd;

.field public final B:Lbyw;

.field public final C:Lbyw;

.field public final D:Lbyw;

.field public final E:Lbyw;

.field public F:Ljava/lang/Integer;

.field public final G:Lbyw;

.field public final H:Lbyw;

.field public final I:Lbyw;

.field public final J:Lbyw;

.field public K:Z

.field public L:F

.field public M:Z

.field public N:Z

.field public O:Ljava/lang/Float;

.field public final P:Lcgz;

.field public final Q:Ljava/util/List;

.field public final R:Ljava/util/Set;

.field public final S:Lbyw;

.field public final T:Lejf;

.field public final U:Lejf;

.field public final V:Lbyw;

.field public final W:Lbyw;

.field public final X:Ladfx;

.field public final Y:Ladfx;

.field public final Z:Ladgi;

.field private final aA:Lufv;

.field private final aB:Lufv;

.field private final aC:Lufv;

.field private final aD:Lufv;

.field private final aE:Lj$/util/Optional;

.field private final aF:Z

.field private final aG:Lbyw;

.field private final aH:Lbyw;

.field private final aI:Lbyw;

.field private aJ:F

.field private final aK:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private aL:F

.field private aM:Z

.field private final aN:Ljava/util/List;

.field private final aO:Lbyw;

.field private final aP:Lufv;

.field private final aQ:Lkotlinx/coroutines/CoroutineExceptionHandler;

.field private final aR:Lcak;

.field private final aS:Lxwy;

.field public final aa:Lpvz;

.field public final ab:Lcak;

.field public final ac:Lcak;

.field public final ad:Ladsj;

.field public final ae:Lklm;

.field public final af:Lrex;

.field public final ag:Lqhb;

.field public final ah:Ltp;

.field public ai:Ltit;

.field public final aj:Lrdw;

.field public final ak:Ltit;

.field public final al:Lwxs;

.field public final am:Ladvz;

.field private final ao:Landroid/content/Context;

.field private final ap:Lufv;

.field private final aq:Lufv;

.field private final ar:Lufv;

.field private final as:Lugh;

.field private final at:Lufv;

.field private final au:Lufv;

.field private final av:Lufv;

.field private final aw:Lufv;

.field private final ax:Lugh;

.field private final ay:Lufv;

.field private final az:Lufv;

.field public final b:Lnnb;

.field public final c:Leis;

.field public final d:Lkdw;

.field public final e:Lufv;

.field public final f:Lufv;

.field public final g:Lufv;

.field public final h:Lugh;

.field public final i:Lufv;

.field public final j:Lugh;

.field public final k:Ljava/util/Set;

.field public final l:Lufv;

.field public final m:Lxwg;

.field public final n:Lugh;

.field public final o:Lugh;

.field public final p:Lugh;

.field public final q:Lj$/util/Optional;

.field public final r:Lkex;

.field public final s:Lufv;

.field public final t:Z

.field public final u:Z

.field public v:Landroid/view/animation/Interpolator;

.field public final w:Landroid/content/res/Resources;

.field public x:Landroid/animation/ValueAnimator;

.field public y:Ljava/lang/Float;

.field public final z:Legh;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    const-string v0, "kfw"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lkfw;->a:Lykq;

    const v0, 0x10c0002

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v0, 0x10c0006

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/high16 v0, 0x10c0000

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const v0, 0x10c0004

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const v0, 0x10c0003

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const v0, 0x10c0001

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const v0, 0x10c0005

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const v0, 0x10c001a

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const v0, 0x10c000d

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const v0, 0x10c000f

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const v0, 0x10c000b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const v0, 0x10c000e

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    filled-new-array/range {v1 .. v12}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Laaax;->k([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lkfw;->an:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lhze;Lnnb;Leis;Lklm;Ltp;Ladvz;Lkdw;Lufv;Lufv;Lufv;Lrex;Lufv;Lufv;Lmja;Lugh;Lufv;Lufv;Lufv;Lufv;Luer;Lugh;Lkhp;Lufv;Lufv;Lufv;Lufv;Lugh;Lugh;Ljava/util/Set;Lufv;Lxwg;Lugh;Lugh;Lugh;Ltit;Lufv;Lufv;Lufv;Lufv;Lrdw;Lufv;Lufv;Lick;Lufv;Lxwy;Lufv;Lqtd;Ljava/util/Deque;Lufv;Lacku;Lj$/util/Optional;Lpvz;Lj$/util/Optional;Lj$/util/Optional;)V
    .locals 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v6, p11

    move-object/from16 v7, p13

    move-object/from16 v8, p16

    move-object/from16 v9, p18

    move-object/from16 v12, p24

    move-object/from16 v13, p25

    move-object/from16 v14, p27

    move-object/from16 v15, p31

    move-object/from16 v11, p32

    move-object/from16 v10, p36

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p8 .. p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p12 .. p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p14 .. p14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p15 .. p15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p17 .. p17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p19 .. p19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p20 .. p20}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p21 .. p21}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p22 .. p22}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p23 .. p23}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p26 .. p26}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p28 .. p28}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p29 .. p29}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p30 .. p30}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p33 .. p33}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p34 .. p34}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p35 .. p35}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p37 .. p37}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p38 .. p38}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p39 .. p39}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p40 .. p40}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p41 .. p41}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p42 .. p42}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p43 .. p43}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p44 .. p44}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p45 .. p45}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p46 .. p46}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p47 .. p47}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p48 .. p48}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p49 .. p49}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p50 .. p50}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p51 .. p51}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p53 .. p53}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p55 .. p55}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lkfw;->ao:Landroid/content/Context;

    move-object/from16 v1, p3

    iput-object v1, v0, Lkfw;->b:Lnnb;

    move-object/from16 v1, p4

    iput-object v1, v0, Lkfw;->c:Leis;

    iput-object v2, v0, Lkfw;->ae:Lklm;

    iput-object v3, v0, Lkfw;->ah:Ltp;

    move-object/from16 v1, p7

    iput-object v1, v0, Lkfw;->am:Ladvz;

    move-object/from16 v1, p8

    iput-object v1, v0, Lkfw;->d:Lkdw;

    iput-object v4, v0, Lkfw;->ap:Lufv;

    iput-object v5, v0, Lkfw;->e:Lufv;

    iput-object v6, v0, Lkfw;->f:Lufv;

    move-object/from16 v1, p12

    iput-object v1, v0, Lkfw;->af:Lrex;

    iput-object v7, v0, Lkfw;->aq:Lufv;

    move-object/from16 v1, p14

    iput-object v1, v0, Lkfw;->ar:Lufv;

    iput-object v8, v0, Lkfw;->as:Lugh;

    move-object/from16 v1, p17

    iput-object v1, v0, Lkfw;->g:Lufv;

    iput-object v9, v0, Lkfw;->at:Lufv;

    move-object/from16 v1, p22

    iput-object v1, v0, Lkfw;->h:Lugh;

    iput-object v12, v0, Lkfw;->i:Lufv;

    iput-object v13, v0, Lkfw;->au:Lufv;

    move-object/from16 v1, p26

    iput-object v1, v0, Lkfw;->av:Lufv;

    iput-object v14, v0, Lkfw;->aw:Lufv;

    move-object/from16 v1, p28

    iput-object v1, v0, Lkfw;->j:Lugh;

    move-object/from16 v1, p29

    iput-object v1, v0, Lkfw;->ax:Lugh;

    move-object/from16 v1, p30

    iput-object v1, v0, Lkfw;->k:Ljava/util/Set;

    iput-object v15, v0, Lkfw;->l:Lufv;

    iput-object v11, v0, Lkfw;->m:Lxwg;

    move-object/from16 v1, p33

    iput-object v1, v0, Lkfw;->n:Lugh;

    move-object/from16 v1, p34

    iput-object v1, v0, Lkfw;->o:Lugh;

    move-object/from16 v1, p35

    iput-object v1, v0, Lkfw;->p:Lugh;

    iput-object v10, v0, Lkfw;->ak:Ltit;

    move-object/from16 v1, p37

    iput-object v1, v0, Lkfw;->ay:Lufv;

    move-object/from16 v4, p39

    iput-object v4, v0, Lkfw;->az:Lufv;

    move-object/from16 v4, p40

    iput-object v4, v0, Lkfw;->aA:Lufv;

    move-object/from16 v5, p41

    iput-object v5, v0, Lkfw;->aj:Lrdw;

    move-object/from16 v5, p42

    iput-object v5, v0, Lkfw;->aB:Lufv;

    move-object/from16 v6, p45

    iput-object v6, v0, Lkfw;->aC:Lufv;

    move-object/from16 v7, p46

    iput-object v7, v0, Lkfw;->aS:Lxwy;

    move-object/from16 v8, p50

    iput-object v8, v0, Lkfw;->aD:Lufv;

    move-object/from16 v8, p52

    iput-object v8, v0, Lkfw;->q:Lj$/util/Optional;

    move-object/from16 v8, p53

    iput-object v8, v0, Lkfw;->aa:Lpvz;

    move-object/from16 v8, p55

    iput-object v8, v0, Lkfw;->aE:Lj$/util/Optional;

    sget-object v8, Lkle;->k:Lkiz;

    invoke-virtual {v2, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    iput-boolean v8, v0, Lkfw;->aF:Z

    new-instance v8, Lkex;

    sget-object v13, Lkjl;->af:Lkiz;

    invoke-virtual {v2, v13}, Lklm;->q(Lkiz;)Z

    move-result v13

    sget-object v14, Lkle;->h:Lkiz;

    invoke-virtual {v2, v14}, Lklm;->q(Lkiz;)Z

    move-result v14

    sget-object v15, Lkle;->s:Lkiz;

    invoke-virtual {v2, v15}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v15

    invoke-virtual {v15}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->floatValue()F

    move-result v15

    invoke-direct {v8, v13, v14, v15}, Lkex;-><init>(ZZF)V

    iput-object v8, v0, Lkfw;->r:Lkex;

    invoke-static/range {p22 .. p22}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object v8

    iget-object v13, v3, Ltp;->d:Ljava/lang/Object;

    invoke-static/range {p13 .. p13}, Ltqz;->eF(Lufv;)Ladqc;

    move-result-object v14

    new-instance v15, Lkfr;

    const/4 v5, 0x0

    invoke-direct {v15, v0, v5}, Lkfr;-><init>(Lkfw;Ladel;)V

    invoke-static {v8, v13, v14, v15}, Ladhh;->y(Ladqc;Ladqc;Ladqc;Ladgo;)Ladqc;

    move-result-object v8

    invoke-static {v8}, Ltqz;->eD(Ladqc;)Lufv;

    move-result-object v8

    iput-object v8, v0, Lkfw;->s:Lufv;

    sget-object v8, Lkle;->i:Lkiz;

    invoke-virtual {v2, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    iput-boolean v8, v0, Lkfw;->t:Z

    invoke-virtual/range {p44 .. p44}, Lick;->c()Z

    move-result v8

    iput-boolean v8, v0, Lkfw;->u:Z

    new-instance v13, Leib;

    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    iput-object v13, v0, Lkfw;->v:Landroid/view/animation/Interpolator;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    iput-object v13, v0, Lkfw;->w:Landroid/content/res/Resources;

    new-instance v13, Lqhb;

    invoke-interface/range {p22 .. p22}, Lugh;->d()Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v14, Ljava/lang/Number;

    invoke-virtual {v14}, Ljava/lang/Number;->floatValue()F

    move-result v14

    invoke-direct {v13, v14}, Lqhb;-><init>(F)V

    iput-object v13, v0, Lkfw;->ag:Lqhb;

    new-instance v14, Legh;

    invoke-direct {v14, v13}, Legh;-><init>(Lqhb;)V

    const v13, 0x3a83126f    # 0.001f

    invoke-virtual {v14, v13}, Legd;->l(F)V

    new-instance v13, Legi;

    invoke-direct {v13}, Legi;-><init>()V

    const/high16 v15, 0x43480000    # 200.0f

    invoke-virtual {v13, v15}, Legi;->e(F)V

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v13, v15}, Legi;->c(F)V

    iput-object v13, v14, Legh;->s:Legi;

    new-instance v13, Lkez;

    const/4 v15, 0x0

    invoke-direct {v13, v0, v15}, Lkez;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v14, v13}, Legd;->k(Legb;)V

    new-instance v13, Lkfc;

    invoke-direct {v13, v0, v15}, Lkfc;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v14, v13}, Legd;->j(Lega;)V

    iput-object v14, v0, Lkfw;->z:Legh;

    new-instance v13, Lssd;

    sget-object v14, Ladke;->a:Ladke;

    sget-object v5, Lkle;->A:Lkiz;

    invoke-virtual {v2, v5}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v5}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->floatValue()F

    move-result v5

    move/from16 p7, v15

    sget-object v15, Lkle;->z:Lkiz;

    invoke-virtual {v2, v15}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v15

    invoke-virtual {v15}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->floatValue()F

    move-result v15

    move/from16 p8, v8

    sget-object v8, Lkle;->B:Lkiz;

    invoke-virtual {v2, v8}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v8

    invoke-virtual {v8}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->floatValue()F

    move-result v8

    invoke-direct {v13, v14, v5, v15, v8}, Lssd;-><init>(Ladkf;FFF)V

    iput-object v13, v0, Lkfw;->A:Lssd;

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    sget-object v13, Lbzw;->c:Lbzw;

    new-instance v14, Lbzg;

    invoke-direct {v14, v8, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v14, v0, Lkfw;->aG:Lbyw;

    sget-object v14, Lsbl;->a:Lsbl;

    new-instance v15, Lbzg;

    invoke-direct {v15, v14, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v15, v0, Lkfw;->aH:Lbyw;

    new-instance v15, Lbzg;

    invoke-direct {v15, v14, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v15, v0, Lkfw;->B:Lbyw;

    invoke-static/range {p7 .. p7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    new-instance v15, Lbzg;

    invoke-direct {v15, v14, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v15, v0, Lkfw;->C:Lbyw;

    sget-object v15, Lkfn;->c:Lkfn;

    new-instance v5, Lbzg;

    invoke-direct {v5, v15, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v5, v0, Lkfw;->aI:Lbyw;

    sget-object v5, Lkgm;->a:Lkgm;

    new-instance v15, Lbzg;

    invoke-direct {v15, v5, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v15, v0, Lkfw;->D:Lbyw;

    new-instance v5, Lbzg;

    invoke-direct {v5, v8, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v5, v0, Lkfw;->E:Lbyw;

    new-instance v5, Lbzd;

    move/from16 v8, p7

    invoke-direct {v5, v8}, Lcak;-><init>(I)V

    iput-object v5, v0, Lkfw;->ab:Lcak;

    new-instance v5, Lbzd;

    invoke-direct {v5, v8}, Lcak;-><init>(I)V

    iput-object v5, v0, Lkfw;->ac:Lcak;

    invoke-interface/range {p47 .. p47}, Lufv;->d()Ljava/lang/Object;

    move-result-object v5

    new-instance v8, Lbzg;

    invoke-direct {v8, v5, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v8, v0, Lkfw;->G:Lbyw;

    sget-object v5, Lqsy;->M:Lqtm;

    move-object/from16 v8, p48

    invoke-virtual {v8, v5}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v15

    new-instance v1, Lbzg;

    invoke-direct {v1, v15, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v1, v0, Lkfw;->H:Lbyw;

    new-instance v1, Lbzg;

    invoke-direct {v1, v14, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v1, v0, Lkfw;->I:Lbyw;

    invoke-virtual {v10}, Ltit;->A()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    new-instance v15, Lbzg;

    invoke-direct {v15, v1, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v15, v0, Lkfw;->J:Lbyw;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lkfw;->K:Z

    iget-object v1, v3, Ltp;->d:Ljava/lang/Object;

    invoke-interface {v1}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkdz;

    if-eqz v1, :cond_0

    iget v3, v1, Lkdz;->b:F

    iget v1, v1, Lkdz;->c:F

    div-float v15, v3, v1

    goto :goto_0

    :cond_0
    const/high16 v15, 0x3f800000    # 1.0f

    :goto_0
    iput v15, v0, Lkfw;->aJ:F

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {v1}, Ladsk;->a(Ljava/lang/Object;)Ladsj;

    move-result-object v1

    iput-object v1, v0, Lkfw;->ad:Ladsj;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, v0, Lkfw;->aK:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lkfw;->aM:Z

    iput-boolean v1, v0, Lkfw;->M:Z

    new-instance v1, Lcgz;

    invoke-direct {v1}, Lcgz;-><init>()V

    iput-object v1, v0, Lkfw;->P:Lcgz;

    new-instance v1, Lbzd;

    invoke-direct {v1, v3}, Lcak;-><init>(I)V

    iput-object v1, v0, Lkfw;->aR:Lcak;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lkfw;->Q:Ljava/util/List;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, v0, Lkfw;->R:Ljava/util/Set;

    new-instance v15, Lwxs;

    new-instance v1, Lkft;

    invoke-direct {v1, v0, v3}, Lkft;-><init>(Ljava/lang/Object;I)V

    sget-wide v16, Lsna;->a:J

    sget-object v3, Lkle;->x:Lkiz;

    invoke-virtual {v2, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    move-object/from16 v18, v1

    const/4 v1, 0x0

    invoke-virtual {v3, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_1

    :cond_1
    const/high16 v3, 0x447a0000    # 1000.0f

    :goto_1
    move-object/from16 p3, v15

    sget-object v15, Lkle;->y:Lkiz;

    invoke-virtual {v2, v15}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v15

    invoke-virtual {v15, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Float;

    if-eqz v15, :cond_2

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_2

    :cond_2
    const/high16 v1, 0x42c80000    # 100.0f

    :goto_2
    new-instance v15, Lsmz;

    invoke-direct {v15, v1, v3}, Lsmz;-><init>(FF)V

    const/16 v20, 0x3

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v19, v15

    move-object/from16 v15, p3

    invoke-direct/range {v15 .. v20}, Lwxs;-><init>(FLsnv;Ladgn;Lsmz;I)V

    iput-object v15, v0, Lkfw;->al:Lwxs;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lkfw;->aN:Ljava/util/List;

    new-instance v1, Lbzg;

    const/4 v3, 0x0

    invoke-direct {v1, v3, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v1, v0, Lkfw;->aO:Lbyw;

    new-instance v1, Lbzg;

    const-string v3, ""

    invoke-direct {v1, v3, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v1, v0, Lkfw;->S:Lbyw;

    new-instance v1, Lejf;

    invoke-direct {v1, v14}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lkfw;->T:Lejf;

    new-instance v1, Lejf;

    invoke-direct {v1, v14}, Leje;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lkfw;->U:Lejf;

    new-instance v1, Lbzg;

    invoke-direct {v1, v14, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v1, v0, Lkfw;->V:Lbyw;

    new-instance v1, Lufz;

    invoke-direct {v1, v14}, Lufz;-><init>(Ljava/lang/Object;)V

    move-object/from16 v3, p54

    invoke-static {v3, v1}, Ladht;->g(Lj$/util/Optional;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lufv;

    iput-object v1, v0, Lkfw;->aP:Lufv;

    new-instance v3, Lbzg;

    invoke-direct {v3, v14, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    iput-object v3, v0, Lkfw;->W:Lbyw;

    sget-object v3, Lkotlinx/coroutines/CoroutineExceptionHandler;->c:Lbyn;

    new-instance v13, Lkfu;

    const/4 v14, 0x0

    invoke-direct {v13, v3, v14}, Lkfu;-><init>(Lbyn;I)V

    iput-object v13, v0, Lkfw;->aQ:Lkotlinx/coroutines/CoroutineExceptionHandler;

    invoke-virtual/range {p2 .. p2}, Lhze;->h()Luep;

    move-result-object v3

    sget-object v13, Lkle;->f:Lkiz;

    invoke-virtual {v2, v13}, Lklm;->h(Lkiz;)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lkle;->c:Lkiy;

    invoke-virtual {v2, v14}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v2

    const/4 v15, 0x2

    if-eqz v13, :cond_7

    const-string v2, ":"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v13, v2}, Ladht;->I(Ljava/lang/CharSequence;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_6

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v13

    if-le v13, v15, :cond_3

    goto/16 :goto_4

    :cond_3
    invoke-static {v2}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v2

    new-instance v13, Lkfh;

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Lkfh;-><init>(I)V

    new-instance v15, Lkfi;

    invoke-direct {v15, v13, v14}, Lkfi;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v15}, Lj$/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object v2

    new-instance v13, Lkfh;

    const/4 v14, 0x2

    invoke-direct {v13, v14}, Lkfh;-><init>(I)V

    new-instance v15, Lkfi;

    invoke-direct {v15, v13, v14}, Lkfi;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v15}, Lj$/util/stream/Stream;->map(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object v2

    invoke-interface {v2}, Lj$/util/stream/Stream;->toList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v13

    if-eq v13, v14, :cond_5

    const/4 v14, 0x4

    if-eq v13, v14, :cond_4

    move-object/from16 p6, v1

    goto/16 :goto_5

    :cond_4
    new-instance v13, Landroid/view/animation/PathInterpolator;

    const/4 v14, 0x0

    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->floatValue()F

    move-result v14

    const/4 v15, 0x1

    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v16, Ljava/lang/Number;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Number;->floatValue()F

    move-result v15

    move-object/from16 p6, v1

    const/4 v1, 0x2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v16, Ljava/lang/Number;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Number;->floatValue()F

    move-result v1

    const/4 v10, 0x3

    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-direct {v13, v14, v15, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    goto :goto_3

    :cond_5
    move-object/from16 p6, v1

    new-instance v13, Landroid/view/animation/PathInterpolator;

    const/4 v14, 0x0

    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    const/4 v15, 0x1

    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-direct {v13, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FF)V

    :goto_3
    iput-object v13, v0, Lkfw;->v:Landroid/view/animation/Interpolator;

    goto :goto_5

    :cond_6
    :goto_4
    move-object/from16 p6, v1

    sget-object v1, Lkfw;->a:Lykq;

    invoke-virtual {v1}, Lykh;->c()Lyld;

    move-result-object v1

    const/16 v10, 0x599

    invoke-interface {v1, v10}, Lyld;->O(I)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const-string v10, "Invalid zoom animation curve specification: %d control points but must be 1 or 2"

    invoke-interface {v1, v10, v2}, Lyko;->t(Ljava/lang/String;I)V

    goto :goto_5

    :cond_7
    move-object/from16 p6, v1

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    if-ltz v1, :cond_8

    sget-object v2, Lkfw;->an:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    if-ge v1, v10, :cond_8

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v1, v0, Lkfw;->v:Landroid/view/animation/Interpolator;

    goto :goto_5

    :cond_8
    sget-object v1, Lkfw;->a:Lykq;

    invoke-virtual {v1}, Lykh;->c()Lyld;

    move-result-object v1

    const/16 v2, 0x597

    invoke-interface {v1, v2}, Lyld;->O(I)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    sget-object v2, Lkfw;->an:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const-string v10, "Invalid zoom animation curve specification: must choose an existing preset curve from 0 to %d"

    invoke-interface {v1, v10, v2}, Lyko;->t(Ljava/lang/String;I)V

    :cond_9
    :goto_5
    const/4 v1, 0x5

    if-eqz p8, :cond_a

    new-instance v2, Lkfa;

    invoke-direct {v2, v1}, Lkfa;-><init>(I)V

    move-object/from16 v10, p43

    invoke-static {v10, v2}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v10, Lkfd;

    const/16 v13, 0x8

    invoke-direct {v10, v0, v13}, Lkfd;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v13, p21

    invoke-interface {v2, v10, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    goto :goto_6

    :cond_a
    move-object/from16 v13, p21

    :goto_6
    new-instance v2, Ljul;

    const/16 v10, 0xc

    invoke-direct {v2, v0, v10}, Ljul;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v14, p47

    invoke-interface {v14, v2, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-virtual {v8, v5}, Lqtd;->a(Lqsw;)Lugh;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Lkfd;

    const/16 v8, 0x9

    invoke-direct {v5, v0, v8}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-static/range {p10 .. p10}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Ljul;

    const/16 v14, 0xd

    invoke-direct {v5, v0, v14}, Ljul;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-static/range {p11 .. p11}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Lkfd;

    const/16 v15, 0xa

    invoke-direct {v5, v0, v15}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    const/4 v2, 0x3

    new-array v5, v2, [Lufv;

    const/4 v2, 0x0

    aput-object p10, v5, v2

    const/4 v2, 0x1

    aput-object p11, v5, v2

    const/4 v2, 0x2

    aput-object p31, v5, v2

    invoke-static {v5}, Lugc;->a([Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Ljul;

    const/16 v14, 0xe

    invoke-direct {v5, v0, v14}, Ljul;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-static/range {p39 .. p39}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Ljul;

    const/16 v14, 0xf

    invoke-direct {v5, v0, v14}, Ljul;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-static/range {p13 .. p13}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Licz;

    const/16 v14, 0x10

    invoke-direct {v5, v0, v14}, Licz;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v5, v7, Lxwy;->a:Z

    if-eqz v5, :cond_b

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b
    invoke-virtual/range {p55 .. p55}, Lj$/util/Optional;->isPresent()Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-virtual/range {p55 .. p55}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_c
    invoke-static {v2}, Lugc;->f(Ljava/util/Collection;)Lufv;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Licz;

    const/16 v6, 0x11

    invoke-direct {v5, v0, v6}, Licz;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-virtual/range {p52 .. p52}, Lj$/util/Optional;->isPresent()Z

    invoke-virtual/range {p52 .. p52}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lufv;

    new-instance v5, Licz;

    const/16 v7, 0x12

    invoke-direct {v5, v0, v7}, Licz;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    const/4 v14, 0x2

    new-array v2, v14, [Lufv;

    const/4 v5, 0x0

    aput-object p19, v2, v5

    new-array v12, v14, [Lufv;

    aput-object p38, v12, v5

    new-instance v6, Lkfa;

    invoke-direct {v6, v5}, Lkfa;-><init>(I)V

    invoke-static {v4, v6}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v6

    const/16 v16, 0x1

    aput-object v6, v12, v16

    invoke-static {v12}, Lugc;->b([Lufv;)Lufv;

    move-result-object v6

    aput-object v6, v2, v16

    invoke-static {v2}, Lugc;->a([Lufv;)Lufv;

    move-result-object v2

    new-instance v6, Liwf;

    invoke-direct {v6, v0, v14}, Liwf;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v6, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-array v2, v14, [Lufv;

    aput-object p10, v2, v5

    aput-object v4, v2, v16

    invoke-static {v2}, Lugc;->a([Lufv;)Lufv;

    move-result-object v2

    new-instance v5, Licz;

    const/16 v6, 0x13

    invoke-direct {v5, v0, v6}, Licz;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-instance v2, Lkfa;

    invoke-direct {v2, v14}, Lkfa;-><init>(I)V

    invoke-static {v4, v2}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v2

    new-instance v5, Licz;

    const/16 v12, 0x14

    invoke-direct {v5, v0, v12}, Licz;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v5, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    const/4 v14, 0x4

    new-array v2, v14, [Lufv;

    const/4 v14, 0x0

    aput-object p25, v2, v14

    const/4 v5, 0x1

    aput-object p27, v2, v5

    new-instance v12, Lhzz;

    invoke-direct {v12, v0, v8}, Lhzz;-><init>(Ljava/lang/Object;I)V

    invoke-static {v9, v12}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v9

    const/4 v14, 0x2

    aput-object v9, v2, v14

    const/4 v9, 0x3

    aput-object p50, v2, v9

    invoke-static {v2}, Lugc;->g([Lufv;)Lufv;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v9, Lkfd;

    invoke-direct {v9, v0, v5}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v9, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-instance v2, Lkfs;

    invoke-direct {v2, v0}, Lkfs;-><init>(Lkfw;)V

    move-object/from16 v5, p23

    iget-object v9, v5, Lkhp;->a:Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v9, Lkal;

    const/4 v12, 0x0

    invoke-direct {v9, v5, v2, v1, v12}, Lkal;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    invoke-virtual {v3, v9}, Luep;->e(Lula;)V

    invoke-virtual {v11}, Lxwg;->h()Z

    move-result v2

    const/4 v5, 0x6

    if-nez v2, :cond_d

    new-instance v2, Licm;

    invoke-direct {v2, v5}, Licm;-><init>(I)V

    goto :goto_7

    :cond_d
    invoke-virtual {v11}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrag;

    iget-object v2, v2, Lrag;->j:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v2, Libt;

    const/4 v12, 0x0

    invoke-direct {v2, v11, v0, v8, v12}, Libt;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    :goto_7
    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-instance v2, Lkfe;

    const/4 v14, 0x0

    invoke-direct {v2, v0, v14}, Lkfe;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v8, p36

    invoke-virtual {v8, v2}, Ltit;->w(Landroid/view/accessibility/AccessibilityManager$TouchExplorationStateChangeListener;)V

    new-instance v9, Ladhr;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    new-instance v11, Lkfg;

    invoke-direct {v11, v0}, Lkfg;-><init>(Lkfw;)V

    iput-object v11, v9, Ladhr;->a:Ljava/lang/Object;

    iget-object v11, v9, Ladhr;->a:Ljava/lang/Object;

    check-cast v11, Landroid/view/accessibility/AccessibilityManager$AccessibilityServicesStateChangeListener;

    invoke-virtual {v8, v11}, Ltit;->v(Landroid/view/accessibility/AccessibilityManager$AccessibilityServicesStateChangeListener;)V

    new-instance v8, Llnm;

    const/4 v11, 0x1

    invoke-direct {v8, v9, v0, v2, v11}, Llnm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-virtual {v3, v8}, Luep;->e(Lula;)V

    const/4 v14, 0x2

    new-array v2, v14, [Lufv;

    const/4 v14, 0x0

    aput-object p9, v2, v14

    invoke-virtual/range {p15 .. p15}, Lmja;->e()Lufv;

    move-result-object v8

    new-instance v9, Lhzz;

    invoke-direct {v9, v0, v15}, Lhzz;-><init>(Ljava/lang/Object;I)V

    invoke-static {v8, v9}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v8

    aput-object v8, v2, v11

    invoke-static {v2}, Lugc;->a([Lufv;)Lufv;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v8, Liwf;

    const/4 v9, 0x3

    invoke-direct {v8, v0, v9}, Liwf;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v8, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-static/range {p16 .. p16}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v8, Lkfd;

    const/4 v14, 0x0

    invoke-direct {v8, v0, v14}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v8, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-array v2, v1, [Lufv;

    aput-object p10, v2, v14

    const/4 v15, 0x1

    aput-object p9, v2, v15

    const/4 v14, 0x2

    aput-object p13, v2, v14

    invoke-virtual/range {p15 .. p15}, Lmja;->e()Lufv;

    move-result-object v8

    new-instance v9, Lhzz;

    const/16 v11, 0xb

    invoke-direct {v9, v0, v11}, Lhzz;-><init>(Ljava/lang/Object;I)V

    invoke-static {v8, v9}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v8

    const/4 v9, 0x3

    aput-object v8, v2, v9

    const/4 v8, 0x4

    aput-object p16, v2, v8

    invoke-static {v2}, Lugc;->a([Lufv;)Lufv;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v8, Lkfd;

    invoke-direct {v8, v0, v14}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v8, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-array v2, v1, [Lufv;

    const/4 v8, 0x0

    aput-object p10, v2, v8

    const/4 v15, 0x1

    aput-object p9, v2, v15

    aput-object p13, v2, v14

    const/4 v9, 0x3

    aput-object p16, v2, v9

    invoke-virtual/range {p15 .. p15}, Lmja;->e()Lufv;

    move-result-object v8

    new-instance v11, Lhzz;

    invoke-direct {v11, v0, v10}, Lhzz;-><init>(Ljava/lang/Object;I)V

    invoke-static {v8, v11}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v8

    const/4 v14, 0x4

    aput-object v8, v2, v14

    invoke-static {v2}, Lugc;->a([Lufv;)Lufv;

    move-result-object v2

    invoke-static {v2}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v8, Lkfd;

    invoke-direct {v8, v0, v9}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v8, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    invoke-static/range {p17 .. p17}, Lufr;->a(Lufv;)Lufv;

    move-result-object v2

    new-instance v8, Lkfd;

    invoke-direct {v8, v0, v14}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v2, v8, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v2

    invoke-virtual {v3, v2}, Luep;->e(Lula;)V

    new-instance v2, Lkfd;

    invoke-direct {v2, v0, v1}, Lkfd;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v1, p37

    invoke-interface {v1, v2, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v3, v1}, Luep;->e(Lula;)V

    invoke-static/range {p26 .. p26}, Lufr;->a(Lufv;)Lufv;

    move-result-object v1

    new-instance v2, Lllo;

    const/4 v15, 0x1

    invoke-direct {v2, v0, v15}, Lllo;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v2, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v3, v1}, Luep;->e(Lula;)V

    new-instance v1, Lkfd;

    invoke-direct {v1, v0, v5}, Lkfd;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v5, p42

    invoke-interface {v5, v1, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v3, v1}, Luep;->e(Lula;)V

    const/4 v9, 0x3

    new-array v1, v9, [Lufv;

    const/4 v14, 0x0

    aput-object p6, v1, v14

    new-instance v2, Lkfa;

    invoke-direct {v2, v9}, Lkfa;-><init>(I)V

    invoke-static {v4, v2}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v2

    const/4 v15, 0x1

    aput-object v2, v1, v15

    new-instance v2, Lkfa;

    const/4 v14, 0x4

    invoke-direct {v2, v14}, Lkfa;-><init>(I)V

    move-object/from16 v4, p20

    invoke-static {v4, v2}, Lugc;->h(Lufv;Lxvv;)Lufv;

    move-result-object v2

    const/4 v14, 0x2

    aput-object v2, v1, v14

    invoke-static {v1}, Lugc;->b([Lufv;)Lufv;

    move-result-object v1

    new-instance v2, Lkfd;

    const/4 v4, 0x7

    invoke-direct {v2, v0, v4}, Lkfd;-><init>(Ljava/lang/Object;I)V

    invoke-interface {v1, v2, v13}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v3, v1}, Luep;->e(Lula;)V

    new-instance v1, Lkff;

    const/4 v14, 0x0

    invoke-direct {v1, v0, v14}, Lkff;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v13, v1}, Luer;->c(Ljava/lang/Runnable;)V

    new-instance v1, Lkfm;

    invoke-interface/range {p22 .. p22}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    const-string v3, "reconfigureCustomizations"

    const/4 v14, 0x4

    invoke-direct {v1, v3, v2, v14}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;I)V

    new-instance v2, Liud;

    const/16 v3, 0xd

    const/4 v12, 0x0

    invoke-direct {v2, v0, v12, v3}, Liud;-><init>(Lkfw;Ladel;I)V

    invoke-direct {v0, v1, v2}, Lkfw;->N(Ladep;Ladgm;)V

    new-instance v1, Lkfm;

    invoke-interface/range {p22 .. p22}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    const-string v3, "zoomProvider.reconfigureZoomUiConfig"

    invoke-direct {v1, v3, v2, v14}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;I)V

    new-instance v2, Lsk;

    invoke-direct {v2, v0, v12, v7}, Lsk;-><init>(Lkfw;Ladel;I)V

    invoke-direct {v0, v1, v2}, Lkfw;->N(Ladep;Ladgm;)V

    new-instance v1, Lkfm;

    invoke-interface/range {p22 .. p22}, Lugh;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    const-string v3, "reconfigureZoom"

    invoke-direct {v1, v3, v2, v14}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;I)V

    new-instance v2, Lsk;

    invoke-direct {v2, v0, v12, v6, v12}, Lsk;-><init>(Lkfw;Ladel;I[B)V

    invoke-direct {v0, v1, v2}, Lkfw;->N(Ladep;Ladgm;)V

    new-instance v1, Lkdb;

    const/4 v14, 0x2

    invoke-direct {v1, v0, v14}, Lkdb;-><init>(Ljava/lang/Object;I)V

    iput-object v1, v0, Lkfw;->X:Ladfx;

    new-instance v1, Lkdb;

    const/4 v9, 0x3

    invoke-direct {v1, v0, v9}, Lkdb;-><init>(Ljava/lang/Object;I)V

    iput-object v1, v0, Lkfw;->Y:Ladfx;

    new-instance v1, Lgno;

    const/16 v2, 0x11

    invoke-direct {v1, v0, v2}, Lgno;-><init>(Ljava/lang/Object;I)V

    iput-object v1, v0, Lkfw;->Z:Ladgi;

    return-void
.end method

.method public static final D(Lsnw;)Z
    .locals 1

    sget-object v0, Lsnw;->b:Lsnw;

    if-eq p0, v0, :cond_1

    sget-object v0, Lsnw;->c:Lsnw;

    if-eq p0, v0, :cond_1

    sget-object v0, Lsnw;->f:Lsnw;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public static synthetic E(Lkfw;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkfw;->l(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic F(Lkfw;FLsnw;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lkfw;->x(FLjava/lang/Float;Lsnw;)V

    return-void
.end method

.method public static synthetic G(Lkfw;F)V
    .locals 13

    iget-object v0, p0, Lkfw;->ah:Ltp;

    iget-object v0, v0, Ltp;->d:Ljava/lang/Object;

    invoke-interface {v0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkdz;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, v1, Lkdz;->a:Lkhn;

    iget v1, v1, Lkhn;->g:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    iget-object v3, p0, Lkfw;->ar:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x1

    if-eqz v4, :cond_5

    iget-object v1, p0, Lkfw;->aq:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqaw;

    if-nez v1, :cond_2

    :cond_1
    :goto_1
    move v1, v8

    goto/16 :goto_5

    :cond_2
    invoke-virtual {v1}, Lqaw;->ordinal()I

    move-result v1

    if-eq v1, v8, :cond_4

    if-eq v1, v6, :cond_1

    if-eq v1, v7, :cond_3

    goto :goto_1

    :cond_3
    move v1, v6

    goto/16 :goto_5

    :cond_4
    const/4 v1, 0x0

    goto/16 :goto_5

    :cond_5
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v4

    const/4 v9, 0x0

    invoke-static {v4, v9}, Ljava/lang/Float;->compare(FF)I

    move-result v4

    if-nez v4, :cond_6

    move-object v1, v2

    :cond_6
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_2

    :cond_7
    move v1, v5

    :goto_2
    iget-object v4, p0, Lkfw;->Q:Ljava/util/List;

    iget-object v9, p0, Lkfw;->r:Lkex;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    div-float v10, p1, v1

    invoke-static {v10, v9}, Lejn;->D(FLkex;)F

    move-result v10

    new-instance v11, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v4, v12}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Number;

    invoke-virtual {v12}, Ljava/lang/Number;->floatValue()F

    move-result v12

    div-float/2addr v12, v1

    invoke-static {v12, v9}, Lejn;->D(FLkex;)F

    move-result v12

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_8
    invoke-static {v11}, Laaax;->be(Ljava/util/Collection;)Ladin;

    move-result-object v1

    invoke-virtual {v1}, Ladil;->a()Laddn;

    move-result-object v1

    :cond_9
    move-object v4, v1

    check-cast v4, Ladim;

    iget-boolean v4, v4, Ladim;->a:Z

    if-eqz v4, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    if-eq v9, v12, :cond_b

    add-int/lit8 v9, v9, 0x1

    invoke-interface {v11, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    cmpg-float v9, v10, v9

    if-gez v9, :cond_9

    goto :goto_4

    :cond_a
    move-object v4, v2

    :cond_b
    :goto_4
    check-cast v4, Ljava/lang/Integer;

    if-eqz v4, :cond_c

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_5

    :cond_c
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_5
    invoke-interface {v0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkdz;

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v4

    iget-object v0, v0, Lkdz;->a:Lkhn;

    if-eq v4, v1, :cond_f

    iget-object v4, p0, Lkfw;->P:Lcgz;

    invoke-virtual {v4}, Lcgz;->d()I

    move-result v9

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v10

    if-ltz v10, :cond_f

    if-ge v10, v9, :cond_f

    iget-object v9, v0, Lkhn;->i:Laaye;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_e

    iget-object v9, v0, Lkhn;->i:Laaye;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v9

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v10

    if-ltz v10, :cond_f

    if-ge v10, v9, :cond_f

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v9

    iget-object v10, v0, Lkhn;->i:Laaye;

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v11

    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lkhm;

    iget-object v11, v10, Lkhm;->d:Ljava/lang/String;

    invoke-static {v11}, Ladht;->v(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_d

    iget v11, v10, Lkhm;->c:F

    invoke-virtual {p0, v11, v7}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v11

    :cond_d
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v10, v10, Lkhm;->f:Ljava/lang/String;

    new-instance v12, Lkds;

    invoke-direct {v12, v11, v10}, Lkds;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v9, v12}, Lcgz;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_e
    iget-object v9, p0, Lkfw;->Q:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v10

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v11

    if-ltz v11, :cond_f

    if-ge v11, v10, :cond_f

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v10

    new-instance v11, Lkds;

    invoke-virtual {p0}, Lkfw;->e()I

    move-result v12

    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->floatValue()F

    move-result v9

    invoke-virtual {p0, v9, v7}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v11, v9}, Lkds;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v10, v11}, Lcgz;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_f
    :goto_6
    if-ltz v1, :cond_1b

    iget-object v4, p0, Lkfw;->P:Lcgz;

    invoke-virtual {v4}, Lcgz;->d()I

    move-result v9

    if-ge v1, v9, :cond_1b

    iget-object v0, v0, Lkhn;->i:Laaye;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lkhm;

    iget v9, v9, Lkhm;->e:I

    invoke-static {v9}, La;->T(I)I

    move-result v9

    if-nez v9, :cond_11

    move v9, v8

    :cond_11
    iget-object v10, p0, Lkfw;->aq:Lufv;

    invoke-interface {v10}, Lufv;->d()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lqaw;

    invoke-virtual {v10}, Lqaw;->a()I

    move-result v10

    if-ne v9, v10, :cond_10

    goto :goto_7

    :cond_12
    move-object v3, v2

    :goto_7
    check-cast v3, Lkhm;

    if-eqz v3, :cond_13

    iget-object v0, p0, Lkfw;->r:Lkex;

    invoke-static {p1, v0}, Lejn;->D(FLkex;)F

    move-result v0

    invoke-static {v0, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_13

    new-instance p1, Lkds;

    iget-object v0, v3, Lkhm;->d:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v3, Lkhm;->f:Ljava/lang/String;

    invoke-direct {p1, v0, v2}, Lkds;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    :cond_13
    iget-boolean v0, p0, Lkfw;->aF:Z

    if-eq v8, v0, :cond_14

    goto :goto_8

    :cond_14
    move v6, v7

    :goto_8
    new-instance v0, Lkds;

    invoke-virtual {p0, p1, v6}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, v2}, Lkds;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object p1, v0

    goto :goto_c

    :cond_15
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lkhm;

    iget-object v9, p0, Lkfw;->r:Lkex;

    invoke-static {p1, v9}, Lejn;->D(FLkex;)F

    move-result v10

    iget v5, v5, Lkhm;->c:F

    invoke-static {v5, v9}, Lejn;->D(FLkex;)F

    move-result v5

    invoke-static {v10, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v5

    if-nez v5, :cond_16

    goto :goto_9

    :cond_17
    move-object v3, v2

    :goto_9
    check-cast v3, Lkhm;

    if-eqz v3, :cond_19

    iget-object v0, v3, Lkhm;->d:Ljava/lang/String;

    if-eqz v0, :cond_19

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-gtz v3, :cond_18

    move-object v0, v2

    :cond_18
    if-eqz v0, :cond_19

    goto :goto_b

    :cond_19
    iget-boolean v0, p0, Lkfw;->aF:Z

    if-eq v8, v0, :cond_1a

    goto :goto_a

    :cond_1a
    move v6, v7

    :goto_a
    invoke-virtual {p0, p1, v6}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v0

    :goto_b
    new-instance p1, Lkds;

    invoke-direct {p1, v0, v2}, Lkds;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :goto_c
    invoke-virtual {v4, v1, p1}, Lcgz;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lkfw;->aR:Lcak;

    invoke-virtual {p0, v1}, Lcak;->e(I)V

    :cond_1b
    return-void
.end method

.method public static synthetic H(Lkfw;)V
    .locals 1

    iget-object v0, p0, Lkfw;->h:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0}, Lkfw;->z(F)V

    return-void
.end method

.method public static synthetic J(Lkfw;FFILadfx;Landroid/animation/ValueAnimator$AnimatorUpdateListener;I)V
    .locals 9

    and-int/lit8 v0, p6, 0x8

    if-eqz v0, :cond_0

    new-instance p4, Ldhr;

    const/16 v0, 0x9

    invoke-direct {p4, v0}, Ldhr;-><init>(I)V

    :cond_0
    move-object v6, p4

    and-int/lit8 p4, p6, 0x4

    if-eqz p4, :cond_1

    const/4 p3, 0x2

    :cond_1
    move v5, p3

    and-int/lit8 p3, p6, 0x10

    const/4 p4, 0x0

    if-eqz p3, :cond_2

    move-object v7, p4

    goto :goto_0

    :cond_2
    move-object v7, p5

    :goto_0
    if-eqz v5, :cond_3

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p3, Lkfm;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p4

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    const-string p6, "zoomTo"

    invoke-direct {p3, p6, p4, p5}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;)V

    new-instance v1, Lkfv;

    const/4 v8, 0x0

    move-object v2, p0

    move v3, p1

    move v4, p2

    invoke-direct/range {v1 .. v8}, Lkfv;-><init>(Lkfw;FFILadfx;Landroid/animation/ValueAnimator$AnimatorUpdateListener;Ladel;)V

    invoke-direct {v2, p3, v1}, Lkfw;->M(Ladep;Ladgm;)V

    return-void

    :cond_3
    throw p4
.end method

.method private final M(Ladep;Ladgm;)V
    .locals 3

    iget-object v0, p0, Lkfw;->c:Leis;

    invoke-static {v0}, Ldwc;->d(Leis;)Leit;

    move-result-object v0

    iget-object p0, p0, Lkfw;->aQ:Lkotlinx/coroutines/CoroutineExceptionHandler;

    invoke-interface {p1, p0}, Ladep;->plus(Ladep;)Ladep;

    move-result-object p0

    new-instance p1, Leji;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p1, p2, v1, v2, v1}, Leji;-><init>(Ladgm;Ladel;I[B)V

    const/4 p2, 0x0

    invoke-static {v0, p0, p2, p1, v2}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    return-void
.end method

.method private final N(Ladep;Ladgm;)V
    .locals 4

    iget-object v0, p0, Lkfw;->c:Leis;

    invoke-static {v0}, Ldwc;->d(Leis;)Leit;

    move-result-object v0

    iget-object v1, p0, Lkfw;->aQ:Lkotlinx/coroutines/CoroutineExceptionHandler;

    invoke-interface {p1, v1}, Ladep;->plus(Ladep;)Ladep;

    move-result-object p1

    new-instance v1, Lasv;

    const/4 v2, 0x0

    const/16 v3, 0xe

    invoke-direct {v1, p0, p2, v2, v3}, Lasv;-><init>(Lkfw;Ladgm;Ladel;I)V

    const/4 p0, 0x2

    const/4 p2, 0x0

    invoke-static {v0, p1, p2, v1, p0}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    return-void
.end method

.method private final O(Ljava/lang/Float;)V
    .locals 2

    invoke-virtual {p0}, Lkfw;->i()Lsmv;

    move-result-object v0

    iget-object v1, p0, Lkfw;->D:Lbyw;

    if-nez v0, :cond_0

    invoke-interface {v1}, Lbyw;->fr()Ljava/lang/Object;

    move-result-object p1

    sget-object v0, Lkgm;->a:Lkgm;

    if-eq p1, v0, :cond_1

    invoke-virtual {p0}, Lkfw;->j()V

    return-void

    :cond_0
    invoke-interface {v1}, Lbyw;->fr()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lkgm;->b:Lkgm;

    if-ne v0, v1, :cond_1

    invoke-virtual {p0, p1}, Lkfw;->l(Ljava/lang/Float;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public final A(F)V
    .locals 8

    iget-object v0, p0, Lkfw;->C:Lbyw;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lbyw;->h(Ljava/lang/Object;)V

    iget-object v0, p0, Lkfw;->h:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v2

    new-instance v5, Lkcs;

    const/4 v0, 0x6

    invoke-direct {v5, p0, v0}, Lkcs;-><init>(Ljava/lang/Object;I)V

    new-instance v6, Lkfb;

    const/4 v0, 0x0

    invoke-direct {v6, p0, v0}, Lkfb;-><init>(Ljava/lang/Object;I)V

    const/16 v7, 0x20

    const/4 v4, 0x3

    move-object v1, p0

    move v3, p1

    invoke-static/range {v1 .. v7}, Lkfw;->J(Lkfw;FFILadfx;Landroid/animation/ValueAnimator$AnimatorUpdateListener;I)V

    return-void
.end method

.method public final B()Z
    .locals 0

    iget-object p0, p0, Lkfw;->U:Lejf;

    invoke-virtual {p0}, Leje;->a()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final C()Z
    .locals 0

    iget-object p0, p0, Lkfw;->aG:Lbyw;

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final I(FI)Ljava/lang/String;
    .locals 9

    iget-object v0, p0, Lkfw;->ah:Ltp;

    iget-object v0, v0, Ltp;->d:Ljava/lang/Object;

    invoke-interface {v0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkdz;

    if-nez v0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    iget-object v1, p0, Lkfw;->w:Landroid/content/res/Resources;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v6, p0, Lkfw;->r:Lkex;

    iget-object v2, p0, Lkfw;->aq:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v7, v2

    check-cast v7, Lqaw;

    invoke-virtual {p0}, Lkfw;->f()Landroid/util/Range;

    move-result-object v8

    add-int/lit8 p2, p2, -0x1

    iget v5, v0, Lkdz;->c:F

    iget v4, v0, Lkdz;->e:F

    iget v3, v0, Lkdz;->d:F

    move v2, p1

    invoke-static/range {v2 .. v8}, Lejn;->u(FFFFLkex;Lqaw;Landroid/util/Range;)F

    move-result p0

    invoke-static {p0, v6}, Lejn;->A(FLkex;)Z

    move-result p1

    const/4 v0, 0x2

    const/4 v2, 0x1

    if-eqz p1, :cond_3

    float-to-int p0, p0

    if-eq p2, v2, :cond_2

    if-eq p2, v0, :cond_1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f130ac4

    invoke-virtual {v1, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :cond_1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%d"

    invoke-static {p1, p0}, Lejn;->w(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f130ac6

    invoke-virtual {v1, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :cond_3
    const/4 p1, 0x0

    const/16 v3, 0x30

    if-eq p2, v2, :cond_5

    if-eq p2, v0, :cond_4

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f130ac3

    invoke-virtual {v1, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0

    :cond_4
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p2, "%.1f"

    invoke-static {p2, p0}, Lejn;->w(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-array p2, v2, [C

    aput-char v3, p2, p1

    invoke-static {p0, p2}, Ladht;->s(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p2, 0x7f130ac5

    invoke-virtual {v1, p2, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-array p2, v2, [C

    aput-char v3, p2, p1

    invoke-static {p0, p2}, Ladht;->s(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final K(Lxiy;)V
    .locals 0

    iget-object p0, p0, Lkfw;->R:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final L(Lxiy;)V
    .locals 0

    iget-object p0, p0, Lkfw;->R:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Lsbl;)V
    .locals 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lkfw;->B:Lbyw;

    invoke-virtual {p0}, Lkfw;->h()Lsbl;

    move-result-object v1

    invoke-interface {v0, v1}, Lbyw;->h(Ljava/lang/Object;)V

    iget-object p0, p0, Lkfw;->aH:Lbyw;

    invoke-interface {p0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method public final d(F)F
    .locals 2

    iget-object p0, p0, Lkfw;->ah:Ltp;

    iget-object p0, p0, Ltp;->d:Ljava/lang/Object;

    invoke-interface {p0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkdz;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget v0, v0, Lkdz;->d:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    invoke-interface {p0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkdz;

    if-eqz p0, :cond_1

    iget p0, p0, Lkdz;->e:F

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    cmpg-float p0, p1, p0

    if-gez p0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    const/high16 p1, 0x40000000    # 2.0f

    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0

    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result p0

    cmpl-float p0, p1, p0

    if-lez p0, :cond_3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result p0

    return p0

    :cond_3
    return p1
.end method

.method public final e()I
    .locals 0

    iget-object p0, p0, Lkfw;->aR:Lcak;

    invoke-virtual {p0}, Lcak;->d()I

    move-result p0

    return p0
.end method

.method public final f()Landroid/util/Range;
    .locals 3

    iget-object v0, p0, Lkfw;->aq:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqaw;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    :goto_0
    move-object p0, v1

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lqaw;->ordinal()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object p0, p0, Lkfw;->d:Lkdw;

    invoke-virtual {p0}, Lkdw;->a()Ljava/util/List;

    move-result-object p0

    goto :goto_1

    :cond_2
    iget-object p0, p0, Lkfw;->d:Lkdw;

    invoke-virtual {p0}, Lkdw;->c()Ljava/util/List;

    move-result-object p0

    goto :goto_1

    :cond_3
    iget-object p0, p0, Lkfw;->d:Lkdw;

    invoke-virtual {p0}, Lkdw;->b()Ljava/util/List;

    move-result-object p0

    :goto_1
    if-eqz p0, :cond_4

    invoke-static {p0}, Lejn;->C(Ljava/util/List;)Landroid/util/Range;

    move-result-object p0

    return-object p0

    :cond_4
    return-object v1
.end method

.method public final g()Lkfn;
    .locals 0

    iget-object p0, p0, Lkfw;->aI:Lbyw;

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkfn;

    return-object p0
.end method

.method public final h()Lsbl;
    .locals 0

    iget-object p0, p0, Lkfw;->aH:Lbyw;

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsbl;

    return-object p0
.end method

.method public final synthetic hH(Lsbi;Lsbl;)V
    .locals 0

    return-void
.end method

.method public final synthetic hZ(Ljwb;)Z
    .locals 6

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lkfw;->r(Z)V

    new-instance v1, Lkfm;

    const/4 v2, 0x6

    const-string v3, "zoomGuidance"

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4, v2}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;I)V

    iget-object v2, p1, Ljwb;->a:Luep;

    invoke-static {v2, v1}, Ltqz;->eR(Luep;Ladep;)Ladlm;

    move-result-object v1

    new-instance v3, Lgma;

    check-cast p1, Ljwg;

    const/16 v5, 0x8

    invoke-direct {v3, p0, p1, v4, v5}, Lgma;-><init>(Lkfw;Ljwg;Ladel;I)V

    const/4 p1, 0x3

    const/4 v5, 0x0

    invoke-static {v1, v4, v5, v3, p1}, Ladhh;->x(Ladlm;Ladep;ILadgm;I)Ladmv;

    new-instance p1, Ljum;

    const/16 v1, 0xe

    invoke-direct {p1, p0, v1}, Ljum;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2, p1}, Luep;->e(Lula;)V

    return v0
.end method

.method public final i()Lsmv;
    .locals 0

    iget-object p0, p0, Lkfw;->aO:Lbyw;

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsmv;

    return-object p0
.end method

.method public final j()V
    .locals 2

    iget-object v0, p0, Lkfw;->Y:Ladfx;

    invoke-interface {v0}, Ladfx;->a()Ljava/lang/Object;

    iget-object v0, p0, Lkfw;->D:Lbyw;

    sget-object v1, Lkgm;->a:Lkgm;

    invoke-interface {v0, v1}, Lbyw;->h(Ljava/lang/Object;)V

    iget-object p0, p0, Lkfw;->C:Lbyw;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(F)V
    .locals 7

    iget-boolean v0, p0, Lkfw;->K:Z

    iget-object v1, p0, Lkfw;->af:Lrex;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lkfw;->h:Lugh;

    invoke-interface {v0}, Lugh;->d()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v3

    iget-object p0, p0, Lkfw;->f:Lufv;

    invoke-interface {p0}, Lufv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljnz;

    invoke-virtual {p0}, Ljnz;->a()Luve;

    move-result-object v5

    sget-object v6, Lnps;->a:Lnps;

    const/4 v2, 0x2

    move v4, p1

    invoke-virtual/range {v1 .. v6}, Lrex;->R(IFFLuve;Lnps;)V

    const/4 p0, 0x2

    invoke-virtual {v1, p0, v4}, Lrex;->A(IF)V

    return-void

    :cond_0
    move v4, p1

    iget-object p1, p0, Lkfw;->h:Lugh;

    invoke-interface {p1}, Lugh;->d()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v3

    iget-object p0, p0, Lkfw;->f:Lufv;

    invoke-interface {p0}, Lufv;->d()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljnz;

    invoke-virtual {p0}, Ljnz;->a()Luve;

    move-result-object v5

    sget-object v6, Lnps;->a:Lnps;

    const/4 v2, 0x3

    invoke-virtual/range {v1 .. v6}, Lrex;->R(IFFLuve;Lnps;)V

    const/4 p0, 0x3

    invoke-virtual {v1, p0, v4}, Lrex;->A(IF)V

    return-void
.end method

.method public final l(Ljava/lang/Float;)V
    .locals 2

    if-nez p1, :cond_0

    iget-object p1, p0, Lkfw;->y:Ljava/lang/Float;

    if-nez p1, :cond_0

    iget-object p1, p0, Lkfw;->h:Lugh;

    invoke-interface {p1}, Lugh;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget-object v1, p0, Lkfw;->ai:Ltit;

    invoke-static {v0, v1}, Lejn;->M(FLtit;)Ljava/lang/Float;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0}, Lkfw;->t(F)V

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/4 v0, 0x1

    iget-boolean v1, p0, Lkfw;->aF:Z

    if-eq v0, v1, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    const/4 v0, 0x3

    :goto_0
    invoke-virtual {p0, p1, v0}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lkfw;->s(Ljava/lang/String;)V

    iget-object p0, p0, Lkfw;->j:Lugh;

    sget-object p1, Lkgm;->b:Lkgm;

    invoke-interface {p0, p1}, Lugh;->a(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public final m(Lxwg;)V
    .locals 4

    iget-object v0, p0, Lkfw;->ah:Ltp;

    iget-object v0, v0, Ltp;->d:Ljava/lang/Object;

    invoke-interface {v0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkdz;

    if-nez v0, :cond_0

    return-void

    :cond_0
    check-cast p1, Lxwm;

    iget-object p1, p1, Lxwm;->a:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget v3, v0, Lkdz;->d:F

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    const v2, 0x3f99999a    # 1.2f

    invoke-static {v1, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v1

    if-gtz v1, :cond_1

    iget p1, v0, Lkdz;->b:F

    add-float/2addr p1, p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    :cond_1
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Lkfw;->d(F)F

    move-result p1

    iget-object v1, p0, Lkfw;->m:Lxwg;

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrag;

    invoke-virtual {v2, p1}, Lrag;->f(F)V

    invoke-virtual {v1}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrag;

    iget v0, v0, Lkdz;->b:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    iput-object v0, v1, Lrag;->c:Lxwg;

    :cond_2
    invoke-virtual {p0, p1}, Lkfw;->k(F)V

    invoke-virtual {p0, p1}, Lkfw;->A(F)V

    return-void
.end method

.method public final n(Lkhn;)V
    .locals 1

    iget-object v0, p0, Lkfw;->d:Lkdw;

    invoke-virtual {v0}, Lkdw;->e()V

    iget-object p0, p0, Lkfw;->ah:Ltp;

    iget-object p0, p0, Ltp;->d:Ljava/lang/Object;

    invoke-interface {p0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkdz;

    if-eqz p0, :cond_0

    iget p0, p0, Lkdz;->d:F

    invoke-virtual {v0, p0}, Lkdw;->d(F)V

    :cond_0
    invoke-virtual {v0, p1}, Lkdw;->f(Lkhn;)V

    return-void
.end method

.method public final o(Lkdz;)V
    .locals 32

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    const/4 v9, 0x0

    if-eqz v7, :cond_1e

    iget-object v10, v7, Lkdz;->a:Lkhn;

    iget-object v1, v10, Lkhn;->e:Laaxu;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v10, Lkhn;->i:Laaye;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v10, Lkhn;->f:Laaxu;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1e

    :cond_0
    iget-object v1, v0, Lkfw;->ar:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v11, 0x2

    const/4 v12, 0x3

    const/4 v13, 0x1

    if-nez v1, :cond_1

    iput-boolean v13, v0, Lkfw;->aM:Z

    const/4 v1, 0x0

    goto/16 :goto_2

    :cond_1
    iget-boolean v1, v0, Lkfw;->aM:Z

    if-nez v1, :cond_2

    iget-object v1, v0, Lkfw;->av:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_2

    iput-boolean v13, v0, Lkfw;->K:Z

    iget v1, v7, Lkdz;->b:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_2

    :cond_2
    iput-boolean v9, v0, Lkfw;->aM:Z

    iget v1, v0, Lkfw;->aJ:F

    iget v2, v7, Lkdz;->d:F

    iget v3, v7, Lkdz;->e:F

    new-instance v4, Landroid/util/Range;

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    iget-object v14, v0, Lkfw;->aq:Lufv;

    invoke-interface {v14}, Lufv;->d()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lqaw;

    if-nez v14, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {v14}, Lqaw;->ordinal()I

    move-result v14

    if-eq v14, v13, :cond_6

    if-eq v14, v11, :cond_5

    if-eq v14, v12, :cond_4

    :goto_0
    new-instance v14, Landroid/util/Range;

    invoke-direct {v14, v5, v6}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    goto :goto_1

    :cond_4
    iget-object v5, v0, Lkfw;->d:Lkdw;

    invoke-virtual {v5}, Lkdw;->a()Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lejn;->C(Ljava/util/List;)Landroid/util/Range;

    move-result-object v14

    goto :goto_1

    :cond_5
    iget-object v5, v0, Lkfw;->d:Lkdw;

    invoke-virtual {v5}, Lkdw;->c()Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lejn;->C(Ljava/util/List;)Landroid/util/Range;

    move-result-object v14

    goto :goto_1

    :cond_6
    iget-object v5, v0, Lkfw;->d:Lkdw;

    invoke-virtual {v5}, Lkdw;->b()Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lejn;->C(Ljava/util/List;)Landroid/util/Range;

    move-result-object v14

    :goto_1
    invoke-static {v1, v14, v4}, Lejn;->y(FLandroid/util/Range;Landroid/util/Range;)F

    move-result v1

    invoke-static {v1, v2, v3}, Ladhc;->f(FFF)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    :goto_2
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    :goto_3
    move v2, v1

    goto :goto_5

    :cond_7
    iget-boolean v1, v7, Lkdz;->f:Z

    if-nez v1, :cond_9

    iget-boolean v1, v0, Lkfw;->K:Z

    if-eqz v1, :cond_8

    goto :goto_4

    :cond_8
    iget v1, v0, Lkfw;->aJ:F

    iget v2, v7, Lkdz;->c:F

    mul-float/2addr v1, v2

    iget v2, v7, Lkdz;->d:F

    iget v3, v7, Lkdz;->e:F

    invoke-static {v1, v2, v3}, Ladhc;->f(FFF)F

    move-result v1

    goto :goto_3

    :cond_9
    :goto_4
    iput-boolean v13, v0, Lkfw;->K:Z

    iget v1, v7, Lkdz;->b:F

    goto :goto_3

    :goto_5
    iget-boolean v1, v7, Lkdz;->f:Z

    iget-object v3, v0, Lkfw;->h:Lugh;

    invoke-interface {v3}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    if-nez v1, :cond_a

    iget-boolean v1, v0, Lkfw;->M:Z

    if-eqz v1, :cond_a

    move v1, v13

    goto :goto_6

    :cond_a
    move v1, v9

    :goto_6
    iget-object v4, v0, Lkfw;->Q:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    iget-object v5, v0, Lkfw;->P:Lcgz;

    invoke-virtual {v5}, Lcgz;->clear()V

    iget-object v6, v10, Lkhn;->i:Laaye;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    const/16 v14, 0xa

    if-nez v6, :cond_e

    iget-object v6, v10, Lkhn;->i:Laaye;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v15, Ljava/util/ArrayList;

    invoke-static {v6, v14}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v15, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lkhm;

    iget-object v8, v9, Lkhm;->d:Ljava/lang/String;

    invoke-static {v8}, Ladht;->v(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_b

    iget v8, v9, Lkhm;->c:F

    invoke-virtual {v0, v8, v12}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v8

    :cond_b
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v9, v9, Lkhm;->f:Ljava/lang/String;

    new-instance v11, Lkds;

    invoke-direct {v11, v8, v9}, Lkds;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v15, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/4 v11, 0x2

    goto :goto_7

    :cond_c
    invoke-virtual {v5, v15}, Lcgz;->addAll(Ljava/util/Collection;)Z

    iget-object v5, v10, Lkhn;->i:Laaye;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Ljava/util/ArrayList;

    invoke-static {v5, v14}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkhm;

    iget v8, v8, Lkhm;->c:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_d
    invoke-interface {v4, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_a

    :cond_e
    iget-object v6, v10, Lkhn;->e:Laaxu;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ljava/util/ArrayList;

    invoke-static {v6, v14}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_9
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_f

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    new-instance v11, Lkds;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v0, v9, v12}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v11, v9}, Lkds;-><init>(Ljava/lang/String;)V

    invoke-interface {v8, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_f
    invoke-virtual {v5, v8}, Lcgz;->addAll(Ljava/util/Collection;)Z

    iget-object v5, v10, Lkhn;->e:Laaxu;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_a
    iget-object v6, v0, Lkfw;->Q:Ljava/util/List;

    const/high16 v8, 0x40a00000    # 5.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_skip_10x_kfw

    const/high16 v8, 0x41200000    # 10.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_skip_10x_kfw

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v6, Lkds;

    const-string v8, "10"

    invoke-direct {v6, v8}, Lkds;-><init>(Ljava/lang/String;)V

    iget-object v8, v0, Lkfw;->P:Lcgz;

    invoke-virtual {v8, v6}, Lcgz;->add(Ljava/lang/Object;)Z

    :cond_skip_10x_kfw
    if-eq v13, v1, :cond_10

    move v1, v3

    move v3, v13

    goto :goto_b

    :cond_10
    move v1, v3

    const/4 v3, 0x2

    :goto_b
    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkfw;->J(Lkfw;FFILadfx;Landroid/animation/ValueAnimator$AnimatorUpdateListener;I)V

    iget v1, v7, Lkdz;->d:F

    iget v3, v7, Lkdz;->e:F

    iget-object v4, v0, Lkfw;->aN:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    iget-object v5, v10, Lkhn;->f:Laaxu;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const/16 v6, 0x9

    const/16 v7, 0x8

    if-nez v5, :cond_17

    cmpg-float v5, v1, v3

    if-nez v5, :cond_11

    goto/16 :goto_10

    :cond_11
    iget-object v5, v10, Lkhn;->f:Laaxu;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v4, v10, Lkhn;->f:Laaxu;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v4, v14}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v5, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_12

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-virtual {v0, v11, v12}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v5, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_12
    div-float/2addr v3, v1

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    sget-wide v18, Ladhz;->a:D

    div-double v3, v3, v18

    iget-object v11, v0, Lkfw;->aq:Lufv;

    invoke-interface {v11}, Lufv;->d()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lqaw;

    if-nez v11, :cond_13

    :goto_d
    const/4 v11, 0x5

    goto :goto_e

    :cond_13
    invoke-virtual {v11}, Lqaw;->ordinal()I

    move-result v11

    if-eq v11, v13, :cond_15

    const/4 v15, 0x2

    if-eq v11, v15, :cond_14

    if-eq v11, v12, :cond_14

    goto :goto_d

    :cond_14
    const/4 v11, 0x7

    goto :goto_e

    :cond_15
    move v11, v14

    :goto_e
    double-to-float v3, v3

    int-to-float v4, v11

    mul-float/2addr v4, v3

    invoke-static {v4}, Ladia;->s(F)I

    move-result v4

    move-wide/from16 v11, v18

    add-int/lit8 v19, v4, 0x1

    iget-object v15, v10, Lkhn;->f:Laaxu;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ljava/util/ArrayList;

    invoke-static {v15, v14}, Laaax;->bh(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_16

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Float;

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v15

    div-float/2addr v15, v1

    float-to-double v14, v15

    invoke-static {v14, v15}, Ljava/lang/Math;->log(D)D

    move-result-wide v14

    div-double/2addr v14, v11

    double-to-float v14, v14

    div-float/2addr v14, v3

    int-to-float v15, v4

    mul-float/2addr v14, v15

    invoke-static {v14}, Ladia;->s(F)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v8, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/16 v14, 0xa

    goto :goto_f

    :cond_16
    invoke-static {v8}, Laaax;->bK(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v20

    iget-object v1, v0, Lkfw;->w:Landroid/content/res/Resources;

    const v3, 0x7f070cba

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    new-instance v3, Lajm;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v7, v4}, Lajm;-><init>(Ljava/lang/Object;I[[C)V

    new-instance v8, Lajm;

    invoke-direct {v8, v0, v6, v4}, Lajm;-><init>(Ljava/lang/Object;I[[S)V

    new-instance v18, Lsmv;

    const/16 v29, 0x2

    const/16 v31, 0x1a8

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v28, 0x1

    move/from16 v21, v1

    move-object/from16 v30, v3

    move-object/from16 v24, v5

    move-object/from16 v27, v8

    invoke-direct/range {v18 .. v31}, Lsmv;-><init>(ILjava/util/Set;FFILjava/util/List;Lsmu;Lsmu;Ladgi;ZILadgi;I)V

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lkfw;->u(Lsmv;)V

    const/4 v4, 0x0

    goto :goto_11

    :cond_17
    :goto_10
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lkfw;->u(Lsmv;)V

    :goto_11
    iget-object v1, v10, Lkhn;->f:Laaxu;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-ne v13, v3, :cond_18

    move-object/from16 v16, v4

    goto :goto_12

    :cond_18
    move-object/from16 v16, v1

    :goto_12
    if-eqz v16, :cond_1d

    invoke-virtual {v0}, Lkfw;->i()Lsmv;

    move-result-object v1

    if-nez v1, :cond_19

    iput-object v4, v0, Lkfw;->ai:Ltit;

    goto/16 :goto_15

    :cond_19
    iget-object v3, v1, Lsmv;->b:Ljava/util/Set;

    invoke-static {v3}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v3

    invoke-static/range {v16 .. v16}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v4

    new-instance v5, Lyqz;

    invoke-direct {v5, v3, v4}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v3, Lkfj;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Lkfj;-><init>(Ljava/lang/Object;I)V

    new-instance v1, Lkey;

    invoke-direct {v1, v3}, Lkey;-><init>(Ladgm;)V

    invoke-virtual {v5, v1}, Lyra;->d(Ljava/util/function/BiFunction;)Lj$/util/stream/Stream;

    move-result-object v1

    sget v3, Lyeh;->d:I

    sget-object v3, Lybh;->a:Lj$/util/stream/Collector;

    invoke-interface {v1, v3}, Lj$/util/stream/Stream;->collect(Lj$/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Lyeh;

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v1

    new-instance v4, Lpnd;

    const/16 v5, 0xa

    invoke-direct {v4, v5}, Lpnd;-><init>(I)V

    invoke-interface {v1, v4}, Lj$/util/stream/Stream;->map(Ljava/util/function/Function;)Lj$/util/stream/Stream;

    move-result-object v1

    invoke-interface {v1, v3}, Lj$/util/stream/Stream;->collect(Lj$/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyeh;

    new-instance v3, Ltit;

    invoke-virtual {v1}, Lyeh;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1c

    invoke-virtual {v1}, Lyeh;->size()I

    move-result v4

    if-ne v4, v13, :cond_1a

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ladbw;

    iget-wide v4, v1, Ladbw;->a:D

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    iget-wide v5, v1, Ladbw;->a:D

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v4

    iget-wide v5, v1, Ladbw;->b:D

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    iget-wide v6, v1, Ladbw;->b:D

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v5

    new-instance v6, Ladbw;

    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    iget-wide v9, v1, Ladbw;->b:D

    invoke-direct {v6, v7, v8, v9, v10}, Ladbw;-><init>(DD)V

    new-instance v1, Lsnz;

    invoke-direct {v1, v4, v5, v6}, Lsnz;-><init>(Landroid/util/Range;Landroid/util/Range;Ladbw;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, v13}, Lyny;->H([Ljava/lang/Object;I)V

    new-instance v4, Lyil;

    invoke-direct {v4, v1, v13}, Lyil;-><init>([Ljava/lang/Object;I)V

    goto/16 :goto_14

    :cond_1a
    invoke-virtual {v1, v13}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ladbw;

    iget-wide v4, v4, Ladbw;->a:D

    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ladbw;

    iget-wide v8, v9, Ladbw;->a:D

    sub-double/2addr v4, v8

    const-wide/16 v8, 0x0

    cmpl-double v4, v4, v8

    if-lez v4, :cond_1b

    move v9, v13

    goto :goto_13

    :cond_1b
    const/4 v9, 0x0

    :goto_13
    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v4

    const-wide/16 v10, 0x1

    invoke-interface {v4, v10, v11}, Lj$/util/stream/Stream;->skip(J)Lj$/util/stream/Stream;

    move-result-object v4

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v5

    const-wide/16 v14, 0x2

    invoke-interface {v5, v14, v15}, Lj$/util/stream/Stream;->skip(J)Lj$/util/stream/Stream;

    move-result-object v5

    new-instance v8, Lyqz;

    invoke-direct {v8, v4, v5}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v4, Lsoa;

    invoke-direct {v4, v9, v13}, Lsoa;-><init>(ZI)V

    invoke-virtual {v8, v4}, Lyqz;->f(Ljava/util/function/BiConsumer;)V

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v4

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v5

    invoke-interface {v5, v10, v11}, Lj$/util/stream/Stream;->skip(J)Lj$/util/stream/Stream;

    move-result-object v5

    new-instance v8, Lyqz;

    invoke-direct {v8, v4, v5}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v4, Lpdy;

    invoke-direct {v4, v6}, Lpdy;-><init>(I)V

    invoke-virtual {v8, v4}, Lyra;->g(Ljava/util/function/BiFunction;)Lyeh;

    move-result-object v4

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v5

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v6

    invoke-interface {v6, v10, v11}, Lj$/util/stream/Stream;->skip(J)Lj$/util/stream/Stream;

    move-result-object v6

    new-instance v8, Lyqz;

    invoke-direct {v8, v5, v6}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v5, Lpdy;

    const/4 v6, 0x5

    invoke-direct {v5, v6}, Lpdy;-><init>(I)V

    invoke-virtual {v8, v5}, Lyra;->g(Ljava/util/function/BiFunction;)Lyeh;

    move-result-object v5

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v6

    invoke-static {v1}, Lj$/util/Collection$-EL;->stream(Ljava/util/Collection;)Lj$/util/stream/Stream;

    move-result-object v1

    invoke-interface {v1, v10, v11}, Lj$/util/stream/Stream;->skip(J)Lj$/util/stream/Stream;

    move-result-object v1

    new-instance v8, Lyqz;

    invoke-direct {v8, v6, v1}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v1, Lpdy;

    const/4 v6, 0x6

    invoke-direct {v1, v6}, Lpdy;-><init>(I)V

    invoke-virtual {v8, v1}, Lyra;->g(Ljava/util/function/BiFunction;)Lyeh;

    move-result-object v1

    invoke-static {v5}, Lyra;->n(Ljava/lang/Iterable;)Lj$/util/stream/Stream;

    move-result-object v5

    invoke-static {v1}, Lyra;->n(Ljava/lang/Iterable;)Lj$/util/stream/Stream;

    move-result-object v1

    new-instance v6, Lyqz;

    invoke-direct {v6, v5, v1}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v1, Lpdy;

    const/4 v5, 0x7

    invoke-direct {v1, v5}, Lpdy;-><init>(I)V

    invoke-virtual {v6, v1}, Lyra;->g(Ljava/util/function/BiFunction;)Lyeh;

    move-result-object v1

    invoke-static {v1}, Lyra;->n(Ljava/lang/Iterable;)Lj$/util/stream/Stream;

    move-result-object v1

    invoke-static {v4}, Lyra;->n(Ljava/lang/Iterable;)Lj$/util/stream/Stream;

    move-result-object v4

    new-instance v5, Lyqz;

    invoke-direct {v5, v1, v4}, Lyqz;-><init>(Lj$/util/stream/Stream;Lj$/util/stream/Stream;)V

    new-instance v1, Lpdy;

    invoke-direct {v1, v7}, Lpdy;-><init>(I)V

    invoke-virtual {v5, v1}, Lyra;->g(Ljava/util/function/BiFunction;)Lyeh;

    move-result-object v4

    :goto_14
    invoke-direct {v3, v4}, Ltit;-><init>(Ljava/lang/Object;)V

    iput-object v3, v0, Lkfw;->ai:Ltit;

    goto :goto_15

    :cond_1c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No points to interpolate."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    :goto_15
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-direct {v0, v1}, Lkfw;->O(Ljava/lang/Float;)V

    sget-object v1, Lkfn;->b:Lkfn;

    invoke-virtual {v0, v1}, Lkfw;->y(Lkfn;)V

    iput-boolean v13, v0, Lkfw;->M:Z

    return-void

    :cond_1e
    iget-object v1, v0, Lkfw;->ax:Lugh;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lugh;->a(Ljava/lang/Object;)V

    sget-object v1, Lkfn;->b:Lkfn;

    invoke-virtual {v0, v4, v1}, Lkfw;->v(ZLkfn;)V

    iget-object v1, v0, Lkfw;->Q:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, v0, Lkfw;->aN:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, v0, Lkfw;->P:Lcgz;

    invoke-virtual {v1}, Lcgz;->clear()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lkfw;->u(Lsmv;)V

    iput-object v4, v0, Lkfw;->ai:Ltit;

    iget-object v1, v0, Lkfw;->h:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lkfw;->J(Lkfw;FFILadfx;Landroid/animation/ValueAnimator$AnimatorUpdateListener;I)V

    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lkfw;->O(Ljava/lang/Float;)V

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    return-void
.end method

.method public final p(Landroid/content/Intent;)V
    .locals 7

    iget-object p1, p0, Lkfw;->h:Lugh;

    invoke-interface {p1}, Lugh;->d()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    iget-object p1, p0, Lkfw;->ah:Ltp;

    iget-object p1, p1, Ltp;->d:Ljava/lang/Object;

    invoke-interface {p1}, Ladsh;->c()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkdz;

    if-eqz p1, :cond_0

    iget v2, p1, Lkdz;->b:F

    iget v3, p1, Lkdz;->c:F

    iget v4, p1, Lkdz;->d:F

    iget v5, p1, Lkdz;->e:F

    new-instance v0, Lkdz;

    iget-object v1, p1, Lkdz;->a:Lkhn;

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Lkdz;-><init>(Lkhn;FFFFZ)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lkfw;->o(Lkdz;)V

    return-void
.end method

.method public final q()V
    .locals 2

    iget-object v0, p0, Lkfw;->ae:Lklm;

    sget-object v1, Lkle;->q:Lkiz;

    invoke-virtual {v0, v1}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lkfw;->A:Lssd;

    const/4 v0, 0x0

    iput-object v0, p0, Lssd;->g:Ladkd;

    const/4 v1, 0x0

    iput v1, p0, Lssd;->e:F

    iput-object v0, p0, Lssd;->f:Ljava/lang/Float;

    :cond_0
    return-void
.end method

.method public final r(Z)V
    .locals 0

    iget-object p0, p0, Lkfw;->V:Lbyw;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method public final s(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lkfw;->S:Lbyw;

    invoke-interface {p0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method public final t(F)V
    .locals 0

    iget-object p0, p0, Lkfw;->al:Lwxs;

    invoke-virtual {p0, p1}, Lwxs;->j(F)V

    return-void
.end method

.method public final u(Lsmv;)V
    .locals 1

    iget-object v0, p0, Lkfw;->aO:Lbyw;

    invoke-interface {v0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    new-instance v0, Lsnv;

    invoke-direct {v0, p1}, Lsnv;-><init>(Lsmv;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lsnv;

    const/4 p1, 0x0

    invoke-direct {v0, p1}, Lsnv;-><init>([B)V

    :goto_0
    iget-object p0, p0, Lkfw;->al:Lwxs;

    invoke-virtual {p0, v0}, Lwxs;->i(Lsnv;)V

    return-void
.end method

.method public final v(ZLkfn;)V
    .locals 1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lkfw;->aI:Lbyw;

    invoke-interface {v0, p2}, Lbyw;->h(Ljava/lang/Object;)V

    iget-object p0, p0, Lkfw;->aG:Lbyw;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method public final w()V
    .locals 3

    iget-object v0, p0, Lkfw;->ak:Ltit;

    invoke-virtual {v0}, Ltit;->A()Z

    move-result v0

    iget-object v1, p0, Lkfw;->J:Lbyw;

    invoke-interface {v1}, Lbyw;->fr()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-ne v2, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v2}, Lbyw;->h(Ljava/lang/Object;)V

    if-nez v0, :cond_1

    iget-object v0, p0, Lkfw;->D:Lbyw;

    invoke-interface {v0}, Lbyw;->fr()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lkgm;->a:Lkgm;

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lkfw;->j()V

    :cond_1
    :goto_0
    return-void
.end method

.method public final x(FLjava/lang/Float;Lsnw;)V
    .locals 12

    move-object v7, p3

    new-instance v8, Ladho;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput p1, v8, Ladho;->a:F

    iget-object v2, p0, Lkfw;->e:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lsql;->g:Lsql;

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-ne v2, v3, :cond_5

    iget-object v2, p0, Lkfw;->q:Lj$/util/Optional;

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    iget-object v2, p0, Lkfw;->aa:Lpvz;

    iget-object v3, p0, Lkfw;->O:Ljava/lang/Float;

    iget v2, v2, Lpvz;->h:F

    if-eqz v3, :cond_0

    goto :goto_3

    :cond_0
    iget-object v3, p0, Lkfw;->h:Lugh;

    invoke-interface {v3}, Lugh;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_1

    cmpl-float v4, p1, v2

    if-ltz v4, :cond_1

    move v4, v9

    goto :goto_0

    :cond_1
    move v4, v10

    :goto_0
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpl-float v3, v3, v2

    if-ltz v3, :cond_2

    const v3, -0x42333333    # -0.1f

    add-float/2addr v3, v2

    cmpg-float v1, p1, v3

    if-gez v1, :cond_2

    move v1, v9

    goto :goto_1

    :cond_2
    move v1, v10

    :goto_1
    if-nez v4, :cond_3

    if-eqz v1, :cond_4

    const v1, -0x43dc28f6    # -0.01f

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_2

    :cond_3
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    :goto_2
    iput-object v1, p0, Lkfw;->O:Ljava/lang/Float;

    new-instance v1, Lkfm;

    const-string v3, "thresholdLockTimeout"

    const/4 v4, 0x6

    const/4 v5, 0x0

    invoke-direct {v1, v3, v5, v4}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;I)V

    new-instance v3, Liud;

    const/16 v4, 0xe

    invoke-direct {v3, p0, v5, v4, v5}, Liud;-><init>(Lkfw;Ladel;I[B)V

    invoke-direct {p0, v1, v3}, Lkfw;->M(Ladep;Ladgm;)V

    :cond_4
    :goto_3
    iget-object v1, p0, Lkfw;->O:Ljava/lang/Float;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    iput v1, v8, Ladho;->a:F

    iget-object v1, p0, Lkfw;->ai:Ltit;

    invoke-static {v2, v1}, Lejn;->M(FLtit;)Ljava/lang/Float;

    move-result-object v1

    goto :goto_4

    :cond_5
    move-object v1, p2

    :goto_4
    if-eqz v1, :cond_6

    :goto_5
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    goto :goto_6

    :cond_6
    iget v1, v8, Ladho;->a:F

    iget-object v2, p0, Lkfw;->ai:Ltit;

    invoke-static {v1, v2}, Lejn;->M(FLtit;)Ljava/lang/Float;

    move-result-object v1

    if-eqz v1, :cond_a

    goto :goto_5

    :goto_6
    invoke-virtual {p0, v1}, Lkfw;->t(F)V

    iget-object v1, p0, Lkfw;->h:Lugh;

    invoke-interface {v1}, Lugh;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    iget-object v11, p0, Lkfw;->aK:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v11, v10, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, p0, Lkfw;->aL:F

    :cond_7
    sget-object v2, Lsnw;->d:Lsnw;

    if-ne v7, v2, :cond_8

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget v2, v8, Ladho;->a:F

    const/4 v5, 0x0

    const/16 v6, 0x3c

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lkfw;->J(Lkfw;FFILadfx;Landroid/animation/ValueAnimator$AnimatorUpdateListener;I)V

    move-object v2, v7

    move-object v3, v8

    goto :goto_7

    :cond_8
    new-instance v6, Lkfm;

    iget v0, v8, Ladho;->a:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v2, "updateSliderForZoomValue"

    invoke-direct {v6, v2, v1, v0}, Lkfm;-><init>(Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;)V

    new-instance v0, Llxo;

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v1, p0

    move-object v2, v7

    move-object v3, v8

    invoke-direct/range {v0 .. v5}, Llxo;-><init>(Lkfw;Lsnw;Ladho;Ladel;I)V

    move-object v1, v0

    invoke-direct {p0, v6, v1}, Lkfw;->M(Ladep;Ladgm;)V

    :goto_7
    iget v1, v3, Ladho;->a:F

    iget-boolean v4, p0, Lkfw;->aF:Z

    if-eq v9, v4, :cond_9

    const/4 v4, 0x2

    goto :goto_8

    :cond_9
    const/4 v4, 0x3

    :goto_8
    invoke-virtual {p0, v1, v4}, Lkfw;->I(FI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lkfw;->s(Ljava/lang/String;)V

    sget-object v1, Lsnw;->c:Lsnw;

    if-ne v2, v1, :cond_a

    iget-object v4, p0, Lkfw;->af:Lrex;

    iget v6, p0, Lkfw;->aL:F

    iget v7, v3, Ladho;->a:F

    iget-object v0, p0, Lkfw;->f:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljnz;

    invoke-virtual {v0}, Ljnz;->a()Luve;

    move-result-object v8

    sget-object v9, Lnps;->a:Lnps;

    const/4 v5, 0x5

    invoke-virtual/range {v4 .. v9}, Lrex;->R(IFFLuve;Lnps;)V

    invoke-virtual {v11, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_a
    return-void
.end method

.method public final y(Lkfn;)V
    .locals 4

    iget-object v0, p0, Lkfw;->i:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkfw;->au:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkfw;->aw:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkfw;->at:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Liwq;

    invoke-virtual {v2}, Liwq;->a()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lkfw;->e:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lsql;->k:Lsql;

    if-eq v2, v3, :cond_3

    :cond_0
    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    sget-object v2, Liwq;->c:Liwq;

    if-eq v0, v2, :cond_3

    iget-object v0, p0, Lkfw;->aD:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkfw;->ay:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkfw;->aA:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsbi;

    invoke-virtual {v0}, Lsbi;->a()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lkfw;->aS:Lxwy;

    iget-boolean v0, v0, Lxwy;->a:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lkfw;->aC:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_1
    iget-object v0, p0, Lkfw;->aE:Lj$/util/Optional;

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    move v1, v3

    :cond_3
    :goto_0
    invoke-virtual {p0, v1, p1}, Lkfw;->v(ZLkfn;)V

    return-void
.end method

.method public final z(F)V
    .locals 8

    iget-object v0, p0, Lkfw;->ah:Ltp;

    iget-object v0, v0, Ltp;->d:Ljava/lang/Object;

    invoke-interface {v0}, Ladsh;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkdz;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lkfw;->ar:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {p0}, Lkfw;->f()Landroid/util/Range;

    move-result-object v7

    iget v3, v0, Lkdz;->d:F

    iget v4, v0, Lkdz;->e:F

    iget v5, v0, Lkdz;->c:F

    move v2, p1

    invoke-static/range {v2 .. v7}, Lejn;->z(FFFFZLandroid/util/Range;)F

    move-result p1

    iput p1, p0, Lkfw;->aJ:F

    iget-object p1, p0, Lkfw;->ad:Ladsj;

    :cond_1
    invoke-virtual {p1}, Ladsj;->c()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    iget v3, p0, Lkfw;->aJ:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Ladsj;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget p1, v0, Lkdz;->b:F

    invoke-static {v2, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p1

    if-nez p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lkfw;->K:Z

    return-void
.end method
