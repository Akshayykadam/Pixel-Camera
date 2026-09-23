.class public Lsdo;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lseb;


# static fields
.field static final a:Lyeh;

.field public static final b:Lyeh;

.field public static final c:Lyfm;

.field private static final s:Lykq;


# instance fields
.field private final A:Lulx;

.field private final B:Z

.field private final C:Lrfp;

.field private final D:Lpfr;

.field private final E:Z

.field private final F:Z

.field private final G:Z

.field private final H:Z

.field private final I:Z

.field private final J:Z

.field private final K:Z

.field private final L:Z

.field private final M:Z

.field private final N:Ljava/util/ArrayList;

.field private final O:Lxxd;

.field private final P:Lbe;

.field private final Q:Z

.field private final R:Z

.field private final S:Ljava/util/Map;

.field private final T:Lqjp;

.field private final U:Ladbv;

.field private final V:Ljvy;

.field private final W:Ladbv;

.field private final X:Lufv;

.field private final Y:Lufv;

.field private final Z:Lugh;

.field private final aa:Lufv;

.field private ab:Z

.field private ac:Z

.field private ad:Lcom/google/android/apps/camera/ui/views/ViewfinderCover;

.field private final ae:Lufn;

.field private final af:Lhze;

.field private final ag:Lkhp;

.field private final ah:Lqtd;

.field private final ai:Lrex;

.field private final aj:Lklm;

.field private final ak:Lvao;

.field private final al:Lpec;

.field public d:Z

.field public e:Ljava/util/ArrayList;

.field public f:Lsql;

.field public g:Lsqm;

.field public final h:Lsjs;

.field public final i:Lj$/util/concurrent/ConcurrentHashMap;

.field public final j:Lufv;

.field public final k:Lufv;

.field public final l:Lufv;

.field public final m:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public n:Lsbi;

.field public o:Lhyk;

.field public final p:Lsdq;

.field public final q:Lsek;

.field public final r:Lxwy;

.field private final t:Lita;

.field private final u:Lsia;

.field private final v:Lnga;

.field private final w:Landroid/view/WindowManager;

.field private x:I

.field private y:Lsql;

.field private final z:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const-string v0, "sdo"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lsdo;->s:Lykq;

    sget-object v1, Lsql;->b:Lsql;

    sget-object v2, Lsql;->c:Lsql;

    sget-object v3, Lsql;->m:Lsql;

    sget-object v4, Lsql;->p:Lsql;

    sget-object v5, Lsql;->g:Lsql;

    sget-object v6, Lsql;->j:Lsql;

    invoke-static/range {v1 .. v6}, Lyeh;->q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v0

    sput-object v0, Lsdo;->a:Lyeh;

    sget-object v0, Lsql;->r:Lsql;

    sget-object v1, Lsql;->d:Lsql;

    sget-object v2, Lsql;->e:Lsql;

    sget-object v3, Lsql;->q:Lsql;

    invoke-static {v0, v1, v2, v3}, Lyeh;->o(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object v0

    sput-object v0, Lsdo;->b:Lyeh;

    sget-object v0, Lsqm;->d:Lsqm;

    new-instance v1, Lyjh;

    invoke-direct {v1, v0}, Lyjh;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lsdo;->c:Lyfm;

    return-void
.end method

.method public constructor <init>(Landroid/view/WindowManager;Lrex;Lita;Lhze;Lsia;Lnga;Lsek;ZLulx;Landroid/content/Context;Lpec;Locr;Lrfp;Lpfr;Lklm;Lxxd;Lbe;Lj$/util/concurrent/ConcurrentHashMap;Lnjn;Lqjp;Ladbv;Lufv;Lufv;Lsjs;Lkhp;Lufv;Ljvy;Ladbv;Lxwy;Lufv;Lufv;Lugh;Lkxm;Lvao;Lqtd;Lufv;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p10

    move-object/from16 v3, p15

    move-object/from16 v4, p19

    move-object/from16 v5, p35

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v6, Lsql;->b:Lsql;

    iput-object v6, v0, Lsdo;->f:Lsql;

    sget-object v7, Lsql;->a:Lsql;

    iput-object v7, v0, Lsdo;->y:Lsql;

    sget-object v8, Lsqm;->b:Lsqm;

    iput-object v8, v0, Lsdo;->g:Lsqm;

    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v9, v0, Lsdo;->S:Ljava/util/Map;

    new-instance v10, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v10, v0, Lsdo;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v10, 0x0

    iput-object v10, v0, Lsdo;->n:Lsbi;

    iput-boolean v11, v0, Lsdo;->ac:Z

    new-instance v10, Lufn;

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    invoke-direct {v10, v12}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v10, v0, Lsdo;->ae:Lufn;

    iput-object v1, v0, Lsdo;->w:Landroid/view/WindowManager;

    move-object/from16 v13, p3

    iput-object v13, v0, Lsdo;->t:Lita;

    move-object/from16 v13, p4

    iput-object v13, v0, Lsdo;->af:Lhze;

    move-object/from16 v13, p5

    iput-object v13, v0, Lsdo;->u:Lsia;

    move-object/from16 v13, p6

    iput-object v13, v0, Lsdo;->v:Lnga;

    move-object/from16 v13, p7

    iput-object v13, v0, Lsdo;->q:Lsek;

    iput-object v2, v0, Lsdo;->z:Landroid/content/Context;

    move-object/from16 v13, p17

    iput-object v13, v0, Lsdo;->P:Lbe;

    move-object/from16 v13, p9

    iput-object v13, v0, Lsdo;->A:Lulx;

    move-object/from16 v13, p11

    iput-object v13, v0, Lsdo;->al:Lpec;

    move/from16 v14, p8

    iput-boolean v14, v0, Lsdo;->B:Z

    move-object/from16 v14, p2

    iput-object v14, v0, Lsdo;->ai:Lrex;

    move-object/from16 v14, p13

    iput-object v14, v0, Lsdo;->C:Lrfp;

    move-object/from16 v14, p14

    iput-object v14, v0, Lsdo;->D:Lpfr;

    iput-object v3, v0, Lsdo;->aj:Lklm;

    move-object/from16 v14, p16

    iput-object v14, v0, Lsdo;->O:Lxxd;

    move-object/from16 v14, p18

    iput-object v14, v0, Lsdo;->i:Lj$/util/concurrent/ConcurrentHashMap;

    move-object/from16 v14, p20

    iput-object v14, v0, Lsdo;->T:Lqjp;

    move-object/from16 v14, p21

    iput-object v14, v0, Lsdo;->U:Ladbv;

    move-object/from16 v14, p22

    iput-object v14, v0, Lsdo;->j:Lufv;

    move-object/from16 v14, p23

    iput-object v14, v0, Lsdo;->k:Lufv;

    move-object/from16 v14, p24

    iput-object v14, v0, Lsdo;->h:Lsjs;

    move-object/from16 v14, p25

    iput-object v14, v0, Lsdo;->ag:Lkhp;

    move-object/from16 v14, p27

    iput-object v14, v0, Lsdo;->V:Ljvy;

    move-object/from16 v14, p26

    iput-object v14, v0, Lsdo;->l:Lufv;

    move-object/from16 v14, p28

    iput-object v14, v0, Lsdo;->W:Ladbv;

    move-object/from16 v14, p29

    iput-object v14, v0, Lsdo;->r:Lxwy;

    move-object/from16 v14, p30

    iput-object v14, v0, Lsdo;->X:Lufv;

    move-object/from16 v14, p31

    iput-object v14, v0, Lsdo;->Y:Lufv;

    move-object/from16 v14, p32

    iput-object v14, v0, Lsdo;->Z:Lugh;

    move-object/from16 v14, p34

    iput-object v14, v0, Lsdo;->ak:Lvao;

    iput-object v5, v0, Lsdo;->ah:Lqtd;

    move-object/from16 v14, p36

    iput-object v14, v0, Lsdo;->aa:Lufv;

    new-instance v14, Lsdq;

    invoke-direct {v14, v0, v1, v2}, Lsdq;-><init>(Lsec;Landroid/view/WindowManager;Landroid/content/Context;)V

    iput-object v14, v0, Lsdo;->p:Lsdq;

    sget-object v1, Lkhy;->af:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->E:Z

    sget-object v1, Lkjl;->aB:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->Q:Z

    sget-object v1, Lkky;->f:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->R:Z

    sget-object v1, Lkhy;->I:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->G:Z

    sget-object v1, Lkhy;->R:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->F:Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v2, v4, Lnjn;->a:Z

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean v2, v4, Lnjn;->b:Z

    if-eqz v2, :cond_1

    sget-object v2, Lsql;->p:Lsql;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-boolean v2, v4, Lnjn;->c:Z

    if-eqz v2, :cond_2

    sget-object v2, Lsql;->o:Lsql;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    iput-object v1, v0, Lsdo;->N:Ljava/util/ArrayList;

    sget-object v1, Lkkj;->b:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->H:Z

    sget-object v1, Lkjm;->m:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->I:Z

    sget-object v1, Lkhu;->M:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->x(Lkiz;)Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->J:Z

    invoke-interface/range {p33 .. p33}, Lkxm;->O()Z

    move-result v1

    iput-boolean v1, v0, Lsdo;->K:Z

    invoke-static {v3}, Lkla;->c(Lklm;)Z

    move-result v2

    iput-boolean v2, v0, Lsdo;->L:Z

    invoke-static {v3}, Lkjj;->b(Lklm;)Z

    move-result v2

    iput-boolean v2, v0, Lsdo;->M:Z

    new-instance v2, Ljava/util/ArrayList;

    sget v4, Lyeh;->d:I

    sget-object v4, Lyil;->a:Lyeh;

    invoke-virtual {v0, v4}, Lsdo;->b(Lyeh;)Ljava/util/List;

    move-result-object v14

    invoke-direct {v2, v14}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v14, Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Lsdo;->c(Lyeh;)Ljava/util/List;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v15, Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Lsdo;->a(Lyeh;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v15, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v11, Ljava/util/ArrayList;

    move/from16 p1, v1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1, v4}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    invoke-direct {v11, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v9, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lsqm;->c:Lsqm;

    invoke-interface {v9, v1, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_3

    sget-object v1, Lsqm;->d:Lsqm;

    invoke-interface {v9, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-virtual {v13}, Lpec;->w()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1, v3, v5}, Lhzb;->o(Landroid/content/Intent;Lklm;Lqtd;)Lsql;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsdo;->A(Lsql;)Z

    move-result v2

    const/4 v4, 0x1

    if-eq v4, v2, :cond_4

    goto :goto_1

    :cond_4
    move-object v6, v1

    :goto_1
    invoke-direct {v0, v6}, Lsdo;->I(Lsql;)Lsqm;

    move-result-object v1

    iput-object v1, v0, Lsdo;->g:Lsqm;

    sget-object v1, Lkkh;->a:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v1, Lqsy;->bD:Lqto;

    invoke-virtual {v5, v1}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lsqm;->a(I)Lsqm;

    move-result-object v1

    sget-object v2, Lsqm;->a:Lsqm;

    if-eq v1, v2, :cond_5

    invoke-interface {v9, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iput-object v1, v0, Lsdo;->g:Lsqm;

    :cond_5
    iget-object v1, v0, Lsdo;->g:Lsqm;

    invoke-interface {v9, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v1, v0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-direct {v0, v6}, Lsdo;->O(Lsql;)V

    iput-object v7, v0, Lsdo;->y:Lsql;

    invoke-virtual {v10, v12}, Lufn;->a(Ljava/lang/Object;)V

    move-object/from16 v1, p12

    invoke-interface {v1, v0}, Locr;->a(Lseb;)V

    return-void
.end method

.method private final I(Lsql;)Lsqm;
    .locals 3

    new-instance v0, Ljava/util/PriorityQueue;

    new-instance v1, Lfzv;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Lfzv;-><init>(I)V

    invoke-direct {v0, v1}, Ljava/util/PriorityQueue;-><init>(Ljava/util/Comparator;)V

    iget-object p0, p0, Lsdo;->S:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/PriorityQueue;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsqm;

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    sget-object p0, Lsqm;->a:Lsqm;

    return-object p0
.end method

.method private final J(Lsql;Z)Lsqm;
    .locals 2

    iget-object v0, p0, Lsdo;->S:Ljava/util/Map;

    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    iget-object p0, p0, Lsdo;->g:Lsqm;

    return-object p0

    :cond_0
    invoke-direct {p0, p1}, Lsdo;->I(Lsql;)Lsqm;

    move-result-object p0

    sget-object p1, Lsqm;->a:Lsqm;

    if-ne p0, p1, :cond_1

    sget-object p0, Lsqm;->b:Lsqm;

    :cond_1
    return-object p0
.end method

.method private final K()V
    .locals 3

    iget-object v0, p0, Lsdo;->t:Lita;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lita;->n(Z)V

    iget-object v0, p0, Lsdo;->u:Lsia;

    sget-object v2, Lshz;->e:Lshz;

    invoke-interface {v0, v1, v2}, Lsia;->Z(ZLshz;)V

    iget-object p0, p0, Lsdo;->v:Lnga;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lnga;->i(I)V

    return-void
.end method

.method private final L()V
    .locals 10

    iget-object v0, p0, Lsdo;->g:Lsqm;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lsdo;->c:Lyfm;

    invoke-virtual {v1, v0}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lsdo;->q:Lsek;

    invoke-virtual {p0}, Lsek;->e()V

    return-void

    :cond_0
    iget-object v0, p0, Lsdo;->S:Ljava/util/Map;

    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lsqm;->b:Lsqm;

    iput-object v1, p0, Lsdo;->g:Lsqm;

    :cond_1
    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lsql;

    iget-object v6, p0, Lsdo;->q:Lsek;

    iget-object v7, v6, Lsek;->b:Ljava/util/EnumMap;

    iget-object v8, v6, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    invoke-virtual {v7, v5, v8}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Luer;->d()Z

    move-result v7

    const-string v9, "Not main thread."

    invoke-static {v7, v9}, Lyny;->bm(ZLjava/lang/Object;)V

    sget-object v7, Lsql;->a:Lsql;

    if-eq v5, v7, :cond_3

    const/4 v7, 0x1

    goto :goto_1

    :cond_3
    move v7, v3

    :goto_1
    const-string v9, "Cannot set up UNINITIALIZED mode"

    invoke-static {v7, v9}, Lyny;->ba(ZLjava/lang/Object;)V

    iget-object v7, v8, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->b:Lsef;

    invoke-virtual {v7, v5}, Lsef;->a(Lsql;)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v8, v7, v5}, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->j(Landroid/view/View;Lsql;)V

    iget-object v6, v6, Lsek;->f:Ljava/util/Map;

    invoke-interface {v6, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lsdo;->g:Lsqm;

    invoke-direct {p0, v0}, Lsdo;->N(Lsqm;)V

    iget-object v0, p0, Lsdo;->q:Lsek;

    iget-object v1, p0, Lsdo;->g:Lsqm;

    iget-object v2, p0, Lsdo;->f:Lsql;

    iget-boolean p0, p0, Lsdo;->ab:Z

    invoke-virtual {v0, v1, v2, p0}, Lsek;->d(Lsqm;Lsql;Z)V

    return-void
.end method

.method private final M(Z)V
    .locals 1

    iget-object v0, p0, Lsdo;->p:Lsdq;

    iput-boolean p1, v0, Lsdq;->a:Z

    iget-object v0, p0, Lsdo;->q:Lsek;

    invoke-virtual {v0, p1}, Lsek;->g(Z)V

    iget-object p0, p0, Lsdo;->h:Lsjs;

    check-cast p0, Lsjr;

    iget-object p0, p0, Lsjr;->d:Lbyw;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method private final N(Lsqm;)V
    .locals 10

    sget-object v0, Lsdo;->c:Lyfm;

    invoke-virtual {v0, p1}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    :cond_0
    iget-object v0, p0, Lsdo;->S:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 v0, 0x1c35

    invoke-interface {p0, v0}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string v0, "No configuration available for supermode: %s. Keeping previous mode chips."

    invoke-interface {p0, v0, p1}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object p0, p0, Lsdo;->q:Lsek;

    invoke-virtual {p0}, Lsek;->c()V

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_7

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lsql;

    iget-object v4, p0, Lsek;->f:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    const-string v6, "Cannot append UNINITIALIZED mode"

    const-string v7, "Not main thread."

    const/4 v8, 0x1

    if-eqz v5, :cond_3

    iget-object v5, p0, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-static {}, Luer;->d()Z

    move-result v9

    invoke-static {v9, v7}, Lyny;->bm(ZLjava/lang/Object;)V

    sget-object v7, Lsql;->a:Lsql;

    if-eq v3, v7, :cond_2

    move v7, v8

    goto :goto_1

    :cond_2
    move v7, v1

    :goto_1
    invoke-static {v7, v6}, Lyny;->ba(ZLjava/lang/Object;)V

    iget-object v5, v5, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->b:Lsef;

    invoke-virtual {v5, v4, v3}, Lsef;->d(Landroid/view/View;Lsql;)V

    goto :goto_3

    :cond_3
    iget-object v4, p0, Lsek;->b:Ljava/util/EnumMap;

    iget-object v5, p0, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    invoke-virtual {v4, v3, v5}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Luer;->d()Z

    move-result v4

    invoke-static {v4, v7}, Lyny;->bm(ZLjava/lang/Object;)V

    sget-object v4, Lsql;->a:Lsql;

    if-eq v3, v4, :cond_4

    move v4, v8

    goto :goto_2

    :cond_4
    move v4, v1

    :goto_2
    invoke-static {v4, v6}, Lyny;->ba(ZLjava/lang/Object;)V

    iget-object v4, v5, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->b:Lsef;

    invoke-static {}, Luer;->d()Z

    move-result v6

    invoke-static {v6, v7}, Lyny;->bm(ZLjava/lang/Object;)V

    invoke-virtual {v4, v3}, Lsef;->a(Lsql;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v4, v6, v3}, Lsef;->d(Landroid/view/View;Lsql;)V

    invoke-virtual {v5, v6, v3}, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->j(Landroid/view/View;Lsql;)V

    :goto_3
    iget-object v4, p0, Lsek;->a:Lyeo;

    invoke-virtual {v4, v3}, Lyeo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lufv;

    iget-object v6, p0, Lsek;->b:Ljava/util/EnumMap;

    invoke-virtual {v6, v3}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    if-eqz v5, :cond_6

    if-eqz v6, :cond_6

    invoke-virtual {v4, v3}, Lyeo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lufv;

    if-eqz v4, :cond_5

    invoke-interface {v4}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_4

    :cond_5
    move v8, v1

    :goto_4
    invoke-virtual {v6, v3, v8}, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->k(Lsql;Z)V

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_7
    :goto_5
    return-void
.end method

.method private final O(Lsql;)V
    .locals 4

    iget-object v0, p0, Lsdo;->f:Lsql;

    iput-object v0, p0, Lsdo;->y:Lsql;

    iput-object p1, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->setCurrentMode(I)V

    iget-object v0, p0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    iput p1, p0, Lsdo;->x:I

    iget-object p1, p0, Lsdo;->i:Lj$/util/concurrent/ConcurrentHashMap;

    iget-object v0, p0, Lsdo;->g:Lsqm;

    iget-object v1, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1, v0, v1}, Lj$/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lsdo;->y:Lsql;

    iget-object v0, p0, Lsdo;->f:Lsql;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lsdo;->ae:Lufn;

    sget-object v3, Lsql;->a:Lsql;

    if-eq p1, v3, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    move p1, v2

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, p1}, Lufn;->a(Ljava/lang/Object;)V

    :cond_1
    iget-object p1, p0, Lsdo;->Z:Lugh;

    iget-object p0, p0, Lsdo;->g:Lsqm;

    sget-object v0, Lsqm;->e:Lsqm;

    if-ne p0, v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {p1, p0}, Lugh;->a(Ljava/lang/Object;)V

    return-void
.end method

.method private final P(I)Z
    .locals 5

    iget-object v0, p0, Lsdo;->aa:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lsbi;->d:Lsbi;

    const/4 v3, 0x0

    if-eq v1, v2, :cond_8

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lsbi;->e:Lsbi;

    if-ne v0, v1, :cond_0

    goto :goto_3

    :cond_0
    const/4 v0, 0x2

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    iget-object p0, p0, Lsdo;->D:Lpfr;

    invoke-interface {p0, v0}, Lpfr;->O(I)V

    return v1

    :cond_1
    iget-object p1, p0, Lsdo;->U:Ladbv;

    invoke-interface {p1}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnqj;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p0, Lsdo;->D:Lpfr;

    invoke-interface {v2}, Lpfr;->G()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2, v0}, Lpfr;->M(I)V

    return v1

    :cond_2
    iget-object p0, p0, Lsdo;->ag:Lkhp;

    iget-boolean v0, p0, Lkhp;->b:Z

    if-nez v0, :cond_3

    goto :goto_2

    :cond_3
    iget-object p0, p0, Lkhp;->a:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    move v0, v3

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkfs;

    if-nez v0, :cond_5

    iget-object v0, v2, Lkfs;->b:Lkfw;

    iget-object v2, v0, Lkfw;->D:Lbyw;

    invoke-interface {v2}, Lbyw;->fr()Ljava/lang/Object;

    move-result-object v2

    sget-object v4, Lkgm;->a:Lkgm;

    if-ne v2, v4, :cond_4

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Lkfw;->j()V

    :cond_5
    move v0, v1

    goto :goto_1

    :cond_6
    if-eqz v0, :cond_7

    return v1

    :cond_7
    :goto_2
    invoke-virtual {p1}, Lnqj;->H()Z

    move-result p0

    if-eqz p0, :cond_8

    invoke-virtual {p1}, Lnqj;->n()V

    return v1

    :cond_8
    :goto_3
    return v3
.end method


# virtual methods
.method public final A(Lsql;)Z
    .locals 0

    invoke-direct {p0, p1}, Lsdo;->I(Lsql;)Lsqm;

    move-result-object p0

    sget-object p1, Lsqm;->a:Lsqm;

    if-eq p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final B()Lsdq;
    .locals 0

    iget-object p0, p0, Lsdo;->p:Lsdq;

    return-object p0
.end method

.method public final C(Lhyk;)V
    .locals 0

    iput-object p1, p0, Lsdo;->o:Lhyk;

    return-void
.end method

.method public final D(Z)V
    .locals 1

    iget-object v0, p0, Lsdo;->l:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lsdo;->h:Lsjs;

    const/4 v0, 0x1

    invoke-interface {p0, p1, v0}, Lsjs;->i(ZZ)V

    :cond_0
    return-void
.end method

.method public final E(Lsql;)V
    .locals 3

    iget-object v0, p0, Lsdo;->f:Lsql;

    if-eq v0, p1, :cond_4

    iget-boolean v0, p0, Lsdo;->d:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lsdo;->A(Lsql;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lsql;->k:Lsql;

    invoke-virtual {p1, v0}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lsql;->f:Lsql;

    invoke-virtual {p1, v0}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    sget-object p1, Lsql;->c:Lsql;

    :cond_2
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lsdo;->J(Lsql;Z)Lsqm;

    move-result-object v0

    iget-object v1, p0, Lsdo;->g:Lsqm;

    const/4 v2, 0x1

    if-eq v0, v1, :cond_3

    invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p1

    invoke-virtual {p0, v0, p1, v2}, Lsdo;->k(Lsqm;Lj$/util/Optional;Z)V

    return-void

    :cond_3
    sget-object v0, Lsdo;->c:Lyfm;

    invoke-virtual {v0, v1}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0, p1}, Lsdo;->O(Lsql;)V

    iget-object p1, p0, Lsdo;->q:Lsek;

    iget-object p0, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1, p0, v2}, Lsek;->f(Lsql;Z)V

    :cond_4
    :goto_0
    return-void
.end method

.method public final F(IZ)V
    .locals 9

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-nez p2, :cond_1

    if-ne p1, v1, :cond_0

    invoke-virtual {p0}, Lsdo;->w()Z

    move-result v2

    if-nez v2, :cond_11

    :cond_0
    if-ne p1, v0, :cond_1

    invoke-virtual {p0}, Lsdo;->x()Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_6

    :cond_1
    iget-object v2, p0, Lsdo;->O:Lxxd;

    invoke-interface {v2}, Lxxd;->iz()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsbw;

    iget-object v2, v2, Lsbw;->a:Lsbv;

    iget-object v2, v2, Lsbv;->j:Lsbi;

    sget-object v3, Lsbi;->d:Lsbi;

    invoke-virtual {v2, v3}, Lsbi;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_11

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    if-eqz p2, :cond_d

    iget-object v5, p0, Lsdo;->T:Lqjp;

    iget-boolean v5, v5, Lqjp;->a:Z

    if-eqz v5, :cond_6

    sget-object v5, Lsdo;->a:Lyeh;

    iget-object v6, p0, Lsdo;->f:Lsql;

    invoke-virtual {v5, v6}, Lyeh;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-ne v6, v4, :cond_2

    sget-object v6, Lsql;->b:Lsql;

    invoke-virtual {v5, v6}, Lyeh;->indexOf(Ljava/lang/Object;)I

    move-result v6

    :cond_2
    if-ne p1, v0, :cond_3

    add-int/2addr v6, v1

    goto :goto_0

    :cond_3
    add-int/2addr v6, v4

    :goto_0
    if-gez v6, :cond_4

    move-object p1, v5

    check-cast p1, Lyil;

    iget p1, p1, Lyil;->c:I

    add-int/lit8 v6, p1, -0x1

    goto :goto_1

    :cond_4
    move-object p1, v5

    check-cast p1, Lyil;

    iget p1, p1, Lyil;->c:I

    if-lt v6, p1, :cond_5

    move v6, v3

    :cond_5
    :goto_1
    invoke-virtual {v5, v6}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsql;

    goto :goto_4

    :cond_6
    iget-object v5, p0, Lsdo;->S:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-static {v6}, Lyeh;->j(Ljava/util/Collection;)Lyeh;

    move-result-object v6

    iget v7, p0, Lsdo;->x:I

    if-ne p1, v0, :cond_7

    add-int/2addr v7, v1

    goto :goto_2

    :cond_7
    add-int/2addr v7, v4

    :goto_2
    iget-object p1, p0, Lsdo;->e:Ljava/util/ArrayList;

    iget-object v8, p0, Lsdo;->g:Lsqm;

    invoke-virtual {v6, v8}, Lyeh;->indexOf(Ljava/lang/Object;)I

    move-result v8

    if-gez v7, :cond_9

    add-int/2addr v8, v4

    if-gez v8, :cond_8

    invoke-virtual {v6}, Lyeh;->size()I

    move-result p1

    add-int/lit8 v8, p1, -0x1

    :cond_8
    invoke-virtual {v6, v8}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsqm;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v7, v5, -0x1

    goto :goto_3

    :cond_9
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v7, v4, :cond_b

    add-int/2addr v8, v1

    invoke-virtual {v6}, Lyeh;->size()I

    move-result p1

    if-lt v8, p1, :cond_a

    move v8, v3

    :cond_a
    invoke-virtual {v6, v8}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsqm;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move v7, v3

    :cond_b
    :goto_3
    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsql;

    :goto_4
    iget-object v4, p0, Lsdo;->f:Lsql;

    if-ne p1, v4, :cond_c

    goto :goto_5

    :cond_c
    move-object v2, p1

    goto :goto_5

    :cond_d
    if-ne p1, v0, :cond_e

    invoke-virtual {p0}, Lsdo;->x()Z

    move-result v5

    if-nez v5, :cond_e

    iget-object p1, p0, Lsdo;->e:Ljava/util/ArrayList;

    iget v2, p0, Lsdo;->x:I

    add-int/2addr v2, v1

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lsql;

    goto :goto_5

    :cond_e
    if-ne p1, v1, :cond_f

    invoke-virtual {p0}, Lsdo;->w()Z

    move-result p1

    if-nez p1, :cond_f

    iget-object p1, p0, Lsdo;->e:Ljava/util/ArrayList;

    iget v2, p0, Lsdo;->x:I

    add-int/2addr v2, v4

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lsql;

    :cond_f
    :goto_5
    if-eqz v2, :cond_11

    iget-object p1, p0, Lsdo;->f:Lsql;

    new-instance v4, Lseo;

    invoke-direct {v4, p1, v2, v0}, Lseo;-><init>(Lsql;Lsql;I)V

    invoke-virtual {p0, v4}, Lsdo;->l(Lseo;)V

    if-eqz p2, :cond_10

    invoke-direct {p0, v2, v1}, Lsdo;->J(Lsql;Z)Lsqm;

    move-result-object p1

    iget-object p2, p0, Lsdo;->g:Lsqm;

    if-eq p1, p2, :cond_10

    invoke-static {v2}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p2

    invoke-virtual {p0, p1, p2, v3}, Lsdo;->k(Lsqm;Lj$/util/Optional;Z)V

    return-void

    :cond_10
    invoke-virtual {p0, v2, v1}, Lsdo;->s(Lsql;Z)V

    :cond_11
    :goto_6
    return-void
.end method

.method public final G(IZ)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eqz p2, :cond_2

    if-ne p1, v2, :cond_1

    invoke-direct {p0, v2}, Lsdo;->P(I)Z

    move-result p1

    if-nez p1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    :goto_0
    invoke-virtual {p0, v1, v0}, Lsdo;->F(IZ)V

    return v0

    :cond_2
    invoke-direct {p0, p1}, Lsdo;->P(I)Z

    move-result p2

    if-eqz p2, :cond_3

    return v1

    :cond_3
    iget-object p2, p0, Lsdo;->W:Ladbv;

    invoke-interface {p2}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-interface {p2}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lrxz;

    invoke-virtual {p2, p1, v2}, Lrxz;->T(II)Z

    move-result p2

    if-eqz p2, :cond_4

    return v1

    :cond_4
    iget-boolean p2, p0, Lsdo;->M:Z

    if-eqz p2, :cond_5

    iget-object p2, p0, Lsdo;->X:Lufv;

    invoke-interface {p2}, Lufv;->d()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_5

    iget-object p2, p0, Lsdo;->l:Lufv;

    invoke-interface {p2}, Lufv;->d()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_5

    if-ne p1, v2, :cond_5

    iget-object p0, p0, Lsdo;->V:Ljvy;

    invoke-interface {p0}, Ljvy;->a()V

    return v1

    :cond_5
    return v0
.end method

.method public final H(Lsql;)V
    .locals 2

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "requested mode is null"

    invoke-static {v0, v1}, Lyny;->ba(ZLjava/lang/Object;)V

    iget-object v0, p0, Lsdo;->f:Lsql;

    if-ne v0, p1, :cond_1

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p1, 0x1c2e

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "requested mode is currently active"

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_1
    iget-boolean v0, p0, Lsdo;->d:Z

    if-eqz v0, :cond_2

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->b()Lyld;

    move-result-object p0

    const/16 p1, 0x1c2d

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "scroll is currently in progress; don\'t know what to do with this."

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_2
    iget-boolean v0, p0, Lsdo;->ab:Z

    if-nez v0, :cond_3

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p1, 0x1c2c

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "mode switch requested when switcher is disabled. Ignoring."

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {p0, p1}, Lsdo;->A(Lsql;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0, p1}, Lsdo;->n(Lsql;)V

    :cond_4
    return-void
.end method

.method public final a(Lyeh;)Ljava/util/List;
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean p0, p0, Lsdo;->K:Z

    if-eqz p0, :cond_0

    sget-object p0, Lsql;->t:Lsql;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public final b(Lyeh;)Ljava/util/List;
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lsdo;->N:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-boolean v1, p0, Lsdo;->J:Z

    if-eqz v1, :cond_0

    sget-object v1, Lsql;->r:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-boolean v1, p0, Lsdo;->B:Z

    if-eqz v1, :cond_1

    sget-object v1, Lsql;->g:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    sget-object v1, Lsql;->b:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v1, Lsql;->j:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v1, p0, Lsdo;->I:Z

    if-eqz v1, :cond_2

    sget-object v1, Lsql;->q:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    sget-object v1, Lsql;->d:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    iget-boolean p0, p0, Lsdo;->H:Z

    if-eqz p0, :cond_3

    sget-object p0, Lsql;->e:Lsql;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public final c(Lyeh;)Ljava/util/List;
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v1, p0, Lsdo;->F:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lsdo;->G:Z

    if-eqz v1, :cond_0

    sget-object v1, Lsql;->n:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-boolean v1, p0, Lsdo;->E:Z

    if-eqz v1, :cond_1

    sget-object v1, Lsql;->m:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    sget-object v1, Lsql;->c:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v1, p0, Lsdo;->L:Z

    if-eqz v1, :cond_2

    sget-object v1, Lsql;->s:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    iget-boolean v1, p0, Lsdo;->Q:Z

    if-eqz v1, :cond_3

    sget-object v1, Lsql;->f:Lsql;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    iget-boolean p0, p0, Lsdo;->R:Z

    if-eqz p0, :cond_4

    sget-object p0, Lsql;->k:Lsql;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public final d()V
    .locals 4

    sget-object v0, Lsql;->b:Lsql;

    iget-object v1, p0, Lsdo;->f:Lsql;

    if-ne v1, v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, v0}, Lsdo;->I(Lsql;)Lsqm;

    move-result-object v1

    iget-object v2, p0, Lsdo;->g:Lsqm;

    const/4 v3, 0x0

    if-eq v2, v1, :cond_1

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {p0, v1, v0, v3}, Lsdo;->k(Lsqm;Lj$/util/Optional;Z)V

    return-void

    :cond_1
    iget-object v1, p0, Lsdo;->q:Lsek;

    invoke-virtual {v1, v0, v3}, Lsek;->f(Lsql;Z)V

    invoke-virtual {p0, v0, v3}, Lsdo;->s(Lsql;Z)V

    return-void
.end method

.method public final e()V
    .locals 2

    sget-object v0, Lsql;->a:Lsql;

    iput-object v0, p0, Lsdo;->y:Lsql;

    iget-object v0, p0, Lsdo;->ae:Lufn;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lufn;->a(Ljava/lang/Object;)V

    iget-object p0, p0, Lsdo;->i:Lj$/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Lj$/util/concurrent/ConcurrentHashMap;->clear()V

    return-void
.end method

.method public final f(Lyeh;)V
    .locals 4

    iget-object v0, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1, v0}, Lyeh;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lsdo;->g:Lsqm;

    sget-object v1, Lsqm;->c:Lsqm;

    if-ne v0, v1, :cond_0

    sget-object v0, Lsql;->c:Lsql;

    goto :goto_0

    :cond_0
    sget-object v0, Lsql;->b:Lsql;

    :goto_0
    iget-object v1, p0, Lsdo;->q:Lsek;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lsek;->f(Lsql;Z)V

    invoke-virtual {p0, v0, v2}, Lsdo;->s(Lsql;Z)V

    :cond_1
    iget-object v0, p0, Lsdo;->q:Lsek;

    invoke-virtual {v0}, Lsek;->c()V

    invoke-virtual {v0}, Lsek;->j()V

    iget-object v0, p0, Lsdo;->S:Ljava/util/Map;

    sget-object v1, Lsqm;->b:Lsqm;

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lsdo;->b(Lyeh;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lsqm;->c:Lsqm;

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lsdo;->c(Lyeh;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v1, p0, Lsdo;->K:Z

    if-eqz v1, :cond_2

    sget-object v1, Lsqm;->d:Lsqm;

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lsdo;->a(Lyeh;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v0, p0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-direct {p0}, Lsdo;->L()V

    iget-object v0, p0, Lsdo;->e:Ljava/util/ArrayList;

    iget-object v1, p0, Lsdo;->f:Lsql;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lsdo;->x:I

    iget-object v0, p0, Lsdo;->y:Lsql;

    invoke-virtual {p1, v0}, Lyeh;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lsql;->a:Lsql;

    iput-object v0, p0, Lsdo;->y:Lsql;

    :cond_3
    new-instance v0, Lpet;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lpet;-><init>(Ljava/lang/Object;I)V

    invoke-static {p1, v0}, Lj$/lang/Iterable$-EL;->forEach(Ljava/lang/Iterable;Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final g()V
    .locals 3

    iget-object v0, p0, Lsdo;->t:Lita;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lita;->n(Z)V

    iget-object v0, p0, Lsdo;->u:Lsia;

    sget-object v2, Lshz;->e:Lshz;

    invoke-interface {v0, v1, v2}, Lsia;->Z(ZLshz;)V

    iget-object p0, p0, Lsdo;->v:Lnga;

    invoke-virtual {p0, v1}, Lnga;->i(I)V

    return-void
.end method

.method public final synthetic h()V
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p0, v0, v0, v0}, Lseb;->u(ZZZ)V

    return-void
.end method

.method public final synthetic i()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-interface {p0, v0, v0, v1}, Lseb;->u(ZZZ)V

    return-void
.end method

.method public final j(Lslo;)V
    .locals 7

    iget-object v0, p1, Lslo;->e:Lcom/google/android/apps/camera/ui/views/ViewfinderCover;

    iput-object v0, p0, Lsdo;->ad:Lcom/google/android/apps/camera/ui/views/ViewfinderCover;

    iget-object p1, p1, Lslo;->c:Lcom/google/android/apps/camera/ui/layout/MainActivityLayout;

    new-instance v0, Lsdm;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lsdm;-><init>(Lsdo;Lcom/google/android/apps/camera/ui/layout/MainActivityLayout;I)V

    invoke-virtual {p1, v0}, Lcom/google/android/apps/camera/ui/layout/MainActivityLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p1, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lsdo;->A:Lulx;

    const-string v0, "ModeSwitchCtrl#init"

    invoke-interface {p1, v0}, Lulx;->f(Ljava/lang/String;)V

    iget-object v0, p0, Lsdo;->q:Lsek;

    iget-object v0, v0, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    iget-object v2, p0, Lsdo;->af:Lhze;

    invoke-virtual {v2}, Lhze;->h()Luep;

    move-result-object v3

    iget-object v0, v0, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->g:Lugh;

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v4, Lsag;

    const/4 v5, 0x2

    invoke-direct {v4, p0, v5}, Lsag;-><init>(Ljava/lang/Object;I)V

    sget-object v5, Lzdy;->a:Lzdy;

    invoke-interface {v0, v4, v5}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {v3, v0}, Luep;->e(Lula;)V

    invoke-direct {p0}, Lsdo;->L()V

    new-instance v0, Lsdj;

    invoke-direct {v0, p0, v1}, Lsdj;-><init>(Ljava/lang/Object;I)V

    iget-object v3, p0, Lsdo;->h:Lsjs;

    move-object v4, v3

    check-cast v4, Lsjr;

    iget-object v4, v4, Lsjr;->c:Lejf;

    iget-object v5, p0, Lsdo;->P:Lbe;

    invoke-virtual {v4, v5, v0}, Leje;->d(Leix;Lejg;)V

    iget-object v0, p0, Lsdo;->g:Lsqm;

    invoke-interface {v3, v0, v1}, Lsjs;->d(Lsqm;Z)V

    new-instance v0, Lqmu;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lqmu;-><init>(I)V

    new-instance v1, Lufy;

    iget-object v3, p0, Lsdo;->k:Lufv;

    invoke-direct {v1, v3, v0, v3}, Lufy;-><init>(Lufv;Lxvv;Lufv;)V

    invoke-static {v1}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    invoke-virtual {v2}, Lhze;->h()Luep;

    move-result-object v1

    new-instance v3, Lria;

    const/4 v4, 0x4

    invoke-direct {v3, p0, v4}, Lria;-><init>(Lsdo;I)V

    sget-object v4, Luer;->a:Lues;

    invoke-interface {v0, v3, v4}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {v1, v0}, Luep;->e(Lula;)V

    invoke-virtual {v2}, Lhze;->h()Luep;

    move-result-object v0

    new-instance v1, Lria;

    const/4 v3, 0x5

    const/4 v5, 0x0

    invoke-direct {v1, p0, v3, v5}, Lria;-><init>(Lsdo;I[B)V

    iget-object v3, p0, Lsdo;->j:Lufv;

    invoke-interface {v3, v1, v4}, Lufv;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v1

    invoke-virtual {v0, v1}, Luep;->e(Lula;)V

    iget-object v0, p0, Lsdo;->l:Lufv;

    invoke-virtual {v2}, Lhze;->h()Luep;

    move-result-object v1

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v5, Lsag;

    const/4 v6, 0x3

    invoke-direct {v5, p0, v6}, Lsag;-><init>(Ljava/lang/Object;I)V

    invoke-static {v0, v5, v4}, Lugc;->j(Lufv;Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {v1, v0}, Luep;->e(Lula;)V

    iget-object v0, p0, Lsdo;->Y:Lufv;

    invoke-virtual {v2}, Lhze;->h()Luep;

    move-result-object v1

    invoke-static {v0}, Lufr;->a(Lufv;)Lufv;

    move-result-object v0

    new-instance v5, Lruj;

    const/16 v6, 0x8

    invoke-direct {v5, p0, v6}, Lruj;-><init>(Ljava/lang/Object;I)V

    invoke-static {v0, v5, v4}, Lugc;->j(Lufv;Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {v1, v0}, Luep;->e(Lula;)V

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lsdo;->t(Z)V

    invoke-virtual {v2}, Lhze;->h()Luep;

    move-result-object v0

    new-instance v1, Lrnj;

    const/16 v2, 0xe

    invoke-direct {v1, p0, v2}, Lrnj;-><init>(Ljava/lang/Object;I)V

    iget-object v2, p0, Lsdo;->ae:Lufn;

    iget-object p0, p0, Lsdo;->ak:Lvao;

    invoke-virtual {p0, v0, v2, v1}, Lvao;->t(Luep;Lufv;Ljava/lang/Runnable;)V

    invoke-interface {p1}, Lulx;->g()V

    return-void
.end method

.method final k(Lsqm;Lj$/util/Optional;Z)V
    .locals 4

    iget-object v0, p0, Lsdo;->g:Lsqm;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lsdo;->o:Lhyk;

    if-nez v0, :cond_1

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p1, 0x1c2a

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "CameraModeController not ready; cannot perform supermode switch."

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v0, p0, Lsdo;->af:Lhze;

    invoke-virtual {v0}, Lhze;->c()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p3, :cond_2

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p1, 0x1c29

    invoke-interface {p0, p1}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p1, "Activity lifetime closed, blocking supermode switch."

    invoke-interface {p0, p1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_2
    iget-object p3, p0, Lsdo;->S:Ljava/util/Map;

    invoke-interface {p3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object p0, Lsdo;->s:Lykq;

    invoke-virtual {p0}, Lykh;->c()Lyld;

    move-result-object p0

    const/16 p2, 0x1c28

    invoke-interface {p0, p2}, Lyko;->O(I)Lyld;

    move-result-object p0

    check-cast p0, Lyko;

    const-string p2, "No configuration available for supermode: %s"

    invoke-interface {p0, p2, p1}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_3
    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/ArrayList;

    iput-object p3, p0, Lsdo;->e:Ljava/util/ArrayList;

    iput-object p1, p0, Lsdo;->g:Lsqm;

    invoke-direct {p0}, Lsdo;->K()V

    iget-object p3, p0, Lsdo;->h:Lsjs;

    iget-object v1, p0, Lsdo;->g:Lsqm;

    const/4 v2, 0x0

    invoke-interface {p3, v1, v2}, Lsjs;->d(Lsqm;Z)V

    sget-object p3, Lsdo;->c:Lyfm;

    invoke-virtual {p3, p1}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lsdo;->q:Lsek;

    invoke-virtual {v1}, Lsek;->j()V

    invoke-direct {p0, p1}, Lsdo;->N(Lsqm;)V

    :cond_4
    invoke-virtual {p2}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-virtual {p2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lsql;

    invoke-direct {p0, p2}, Lsdo;->O(Lsql;)V

    goto :goto_1

    :cond_5
    iget-object p2, p0, Lsdo;->i:Lj$/util/concurrent/ConcurrentHashMap;

    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-virtual {p2, v1}, Lj$/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lsdo;->g:Lsqm;

    invoke-virtual {p2, v1}, Lj$/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lsql;

    invoke-direct {p0, p2}, Lsdo;->O(Lsql;)V

    goto :goto_1

    :cond_6
    sget-object p2, Lsqm;->a:Lsqm;

    iget-object p2, p0, Lsdo;->g:Lsqm;

    invoke-virtual {p2}, Lsqm;->ordinal()I

    move-result p2

    const/4 v1, 0x2

    if-eq p2, v1, :cond_8

    const/4 v1, 0x3

    if-eq p2, v1, :cond_7

    sget-object p2, Lsql;->b:Lsql;

    goto :goto_0

    :cond_7
    sget-object p2, Lsql;->t:Lsql;

    goto :goto_0

    :cond_8
    sget-object p2, Lsql;->c:Lsql;

    :goto_0
    invoke-direct {p0, p2}, Lsdo;->O(Lsql;)V

    :goto_1
    invoke-virtual {p3, p1}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    iget-object p1, p0, Lsdo;->q:Lsek;

    iget-object p2, p0, Lsdo;->g:Lsqm;

    iget-object p3, p0, Lsdo;->f:Lsql;

    iget-boolean v1, p0, Lsdo;->ab:Z

    invoke-virtual {p1, p2, p3, v1}, Lsek;->d(Lsqm;Lsql;Z)V

    iget-object p2, p0, Lsdo;->f:Lsql;

    invoke-virtual {p1, p2, v2}, Lsek;->f(Lsql;Z)V

    :cond_9
    if-nez v0, :cond_a

    iget-object p1, p0, Lsdo;->ad:Lcom/google/android/apps/camera/ui/views/ViewfinderCover;

    iget-object p2, p0, Lsdo;->f:Lsql;

    new-instance p3, Lsdi;

    invoke-direct {p3, p0}, Lsdi;-><init>(Lsdo;)V

    new-instance v0, Lrnj;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lrnj;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p1, p2, p3, v0}, Lcom/google/android/apps/camera/ui/views/ViewfinderCover;->n(Lsql;Lsmp;Ljava/lang/Runnable;)V

    return-void

    :cond_a
    invoke-virtual {p0}, Lsdo;->g()V

    return-void
.end method

.method public final l(Lseo;)V
    .locals 7

    iget v0, p1, Lseo;->c:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object p0, p0, Lsdo;->ai:Lrex;

    iget-object v2, p1, Lseo;->a:Lsql;

    invoke-virtual {v2}, Lsql;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object p1, p1, Lseo;->b:Lsql;

    invoke-virtual {p1}, Lsql;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v3, Lytb;->a:Lytb;

    invoke-virtual {v3}, Laaxp;->D()Laaxk;

    move-result-object v3

    iget-object v4, v3, Laaxk;->b:Laaxp;

    invoke-virtual {v4}, Laaxp;->T()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_1
    iget-object v4, v3, Laaxk;->b:Laaxp;

    check-cast v4, Lytb;

    const/16 v5, 0x27

    iput v5, v4, Lytb;->f:I

    iget v5, v4, Lytb;->b:I

    or-int/2addr v5, v1

    iput v5, v4, Lytb;->b:I

    sget-object v4, Lyxr;->a:Lyxr;

    invoke-virtual {v4}, Laaxp;->D()Laaxk;

    move-result-object v4

    iget-object v5, v4, Laaxk;->b:Laaxp;

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v4}, Laaxk;->o()V

    :cond_2
    iget-object v5, v4, Laaxk;->b:Laaxp;

    move-object v6, v5

    check-cast v6, Lyxr;

    add-int/lit8 v0, v0, -0x1

    iput v0, v6, Lyxr;->c:I

    iget v0, v6, Lyxr;->b:I

    or-int/2addr v0, v1

    iput v0, v6, Lyxr;->b:I

    invoke-virtual {v5}, Laaxp;->T()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {v4}, Laaxk;->o()V

    :cond_3
    iget-object v0, v4, Laaxk;->b:Laaxp;

    move-object v1, v0

    check-cast v1, Lyxr;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v5, v1, Lyxr;->b:I

    or-int/lit8 v5, v5, 0x4

    iput v5, v1, Lyxr;->b:I

    iput-object v2, v1, Lyxr;->e:Ljava/lang/String;

    invoke-virtual {v0}, Laaxp;->T()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {v4}, Laaxk;->o()V

    :cond_4
    iget-object v0, v4, Laaxk;->b:Laaxp;

    check-cast v0, Lyxr;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v0, Lyxr;->b:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v0, Lyxr;->b:I

    iput-object p1, v0, Lyxr;->d:Ljava/lang/String;

    iget-object p1, v3, Laaxk;->b:Laaxp;

    invoke-virtual {p1}, Laaxp;->T()Z

    move-result p1

    if-nez p1, :cond_5

    invoke-virtual {v3}, Laaxk;->o()V

    :cond_5
    iget-object p1, v3, Laaxk;->b:Laaxp;

    check-cast p1, Lytb;

    invoke-virtual {v4}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Lyxr;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v0, p1, Lytb;->G:Lyxr;

    iget v0, p1, Lytb;->c:I

    or-int/lit16 v0, v0, 0x400

    iput v0, p1, Lytb;->c:I

    invoke-virtual {p0, v3}, Lrex;->O(Laaxk;)V

    return-void
.end method

.method public final m()V
    .locals 0

    invoke-virtual {p0}, Lsdo;->g()V

    return-void
.end method

.method public final n(Lsql;)V
    .locals 3

    iget-object v0, p0, Lsdo;->f:Lsql;

    if-eq v0, p1, :cond_2

    iget-boolean v0, p0, Lsdo;->ab:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lsdo;->J(Lsql;Z)Lsqm;

    move-result-object v0

    iget-object v1, p0, Lsdo;->g:Lsqm;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    invoke-static {p1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p1

    invoke-virtual {p0, v0, p1, v2}, Lsdo;->k(Lsqm;Lj$/util/Optional;Z)V

    return-void

    :cond_1
    invoke-virtual {p0, p1, v2}, Lsdo;->s(Lsql;Z)V

    invoke-virtual {p0, p1}, Lsdo;->E(Lsql;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public final o(Z)V
    .locals 0

    invoke-static {}, Luer;->a()V

    iput-boolean p1, p0, Lsdo;->ac:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lsdo;->ab:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lsdo;->M(Z)V

    :cond_0
    return-void

    :cond_1
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lsdo;->M(Z)V

    return-void
.end method

.method public final p(Z)V
    .locals 2

    invoke-static {}, Luer;->d()Z

    move-result v0

    const-string v1, "Not main thread."

    invoke-static {v0, v1}, Lyny;->bm(ZLjava/lang/Object;)V

    iput-boolean p1, p0, Lsdo;->ab:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lsdo;->ac:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lsdo;->M(Z)V

    :cond_0
    return-void

    :cond_1
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lsdo;->M(Z)V

    return-void
.end method

.method public final synthetic q()V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-interface {p0, v0, v0, v1}, Lseb;->u(ZZZ)V

    return-void
.end method

.method public final synthetic r()V
    .locals 1

    const/4 v0, 0x1

    invoke-interface {p0, v0, v0, v0}, Lseb;->u(ZZZ)V

    return-void
.end method

.method public final s(Lsql;Z)V
    .locals 7

    iget-object v0, p0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0}, Lsdo;->K()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lsdo;->d:Z

    iget-object v1, p0, Lsdo;->C:Lrfp;

    invoke-interface {v1}, Lrfp;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrfu;

    iget-object v2, p0, Lsdo;->f:Lsql;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v2, p0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    const/4 v4, 0x2

    if-ne v2, v3, :cond_0

    goto :goto_1

    :cond_0
    iget v3, p0, Lsdo;->x:I

    if-ge v2, v3, :cond_1

    goto :goto_0

    :cond_1
    if-le v2, v3, :cond_3

    move v0, v4

    :goto_0
    const/16 v2, 0xfa

    const/4 v3, 0x0

    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v2

    const-wide/16 v5, 0xfa

    invoke-virtual {v2, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    if-eqz p2, :cond_2

    new-instance p2, Lsdk;

    invoke-direct {p2, p0, v0}, Lsdk;-><init>(Lsdo;I)V

    invoke-virtual {v2, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_2
    new-instance p2, Lsdn;

    invoke-direct {p2, p0}, Lsdn;-><init>(Lsdo;)V

    invoke-virtual {v2, p2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    :cond_3
    :goto_1
    iget-object p2, p0, Lsdo;->o:Lhyk;

    if-eqz p2, :cond_5

    iget-object p2, p0, Lsdo;->af:Lhze;

    invoke-virtual {p2}, Lhze;->c()Z

    move-result p2

    if-eqz p2, :cond_4

    goto :goto_2

    :cond_4
    iget-object p2, p0, Lsdo;->f:Lsql;

    if-eq p2, p1, :cond_5

    invoke-direct {p0, p1}, Lsdo;->O(Lsql;)V

    iget-object p2, p0, Lsdo;->ad:Lcom/google/android/apps/camera/ui/views/ViewfinderCover;

    new-instance v0, Lsdl;

    invoke-direct {v0, p0}, Lsdl;-><init>(Lsdo;)V

    new-instance p0, Lscy;

    invoke-direct {p0, v1, v4}, Lscy;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p2, p1, v0, p0}, Lcom/google/android/apps/camera/ui/views/ViewfinderCover;->n(Lsql;Lsmp;Ljava/lang/Runnable;)V

    return-void

    :cond_5
    invoke-virtual {v1}, Lrfu;->hR()V

    :cond_6
    :goto_2
    return-void
.end method

.method public final t(Z)V
    .locals 4

    iget-object v0, p0, Lsdo;->O:Lxxd;

    invoke-interface {v0}, Lxxd;->iz()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    check-cast v0, Lsbw;

    iget-object v0, v0, Lsbw;->a:Lsbv;

    iget-object v0, v0, Lsbv;->j:Lsbi;

    invoke-virtual {v0}, Lsbi;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iget-object v3, p0, Lsdo;->h:Lsjs;

    iget-boolean p0, p0, Lsdo;->K:Z

    if-eqz p0, :cond_1

    if-nez v0, :cond_1

    if-nez p1, :cond_1

    move p0, v1

    goto :goto_1

    :cond_1
    move p0, v2

    :goto_1
    const/4 p1, 0x4

    new-array p1, p1, [Lsqm;

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    sget-object p0, Lsqm;->d:Lsqm;

    goto :goto_2

    :cond_2
    move-object p0, v0

    :goto_2
    aput-object p0, p1, v2

    sget-object p0, Lsqm;->b:Lsqm;

    aput-object p0, p1, v1

    const/4 p0, 0x2

    sget-object v1, Lsqm;->c:Lsqm;

    aput-object v1, p1, p0

    const/4 p0, 0x3

    aput-object v0, p1, p0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, p0}, Laaax;->S([Ljava/lang/Object;Ljava/util/Collection;)V

    check-cast v3, Lsjr;

    iget-object p1, v3, Lsjr;->a:Lejf;

    invoke-virtual {p1}, Leje;->a()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1, p0}, Lejf;->i(Ljava/lang/Object;)V

    :cond_3
    return-void
.end method

.method public final u(ZZZ)V
    .locals 5

    iget-object v0, p0, Lsdo;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lsdo;->aa:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lsbi;->e:Lsbi;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p1, :cond_0

    iget-object v4, p0, Lsdo;->l:Lufv;

    invoke-interface {v4}, Lufv;->d()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lsdo;->h:Lsjs;

    invoke-interface {v4, v3, p3}, Lsjs;->i(ZZ)V

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lsdo;->h:Lsjs;

    invoke-interface {v4, v2, p3}, Lsjs;->i(ZZ)V

    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    if-eq v0, v1, :cond_2

    move v0, v3

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    if-eqz p3, :cond_8

    if-eqz p1, :cond_4

    if-nez p2, :cond_4

    iget-object p0, p0, Lsdo;->q:Lsek;

    iget-object p0, p0, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0, v2}, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->f(Z)V

    return-void

    :cond_4
    iget-object p0, p0, Lsdo;->q:Lsek;

    if-eqz v0, :cond_7

    iget-object p1, p0, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    if-eqz p1, :cond_6

    iget-boolean p2, p1, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->f:Z

    if-nez p2, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {p1, v3}, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->f(Z)V

    return-void

    :cond_6
    :goto_2
    move v2, v3

    :cond_7
    iget-object p0, p0, Lsek;->c:Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;

    invoke-virtual {p0, v2, v3}, Lcom/google/android/apps/camera/ui/modeswitcher/ModeSwitcher;->e(ZZ)V

    return-void

    :cond_8
    iget-object p0, p0, Lsdo;->q:Lsek;

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lsek;->i()V

    return-void

    :cond_9
    invoke-virtual {p0}, Lsek;->e()V

    return-void
.end method

.method public final v()Z
    .locals 3

    iget-object v0, p0, Lsdo;->y:Lsql;

    sget-object v1, Lsql;->a:Lsql;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    iget-object v0, p0, Lsdo;->y:Lsql;

    invoke-virtual {p0, v0}, Lsdo;->n(Lsql;)V

    iput-object v1, p0, Lsdo;->y:Lsql;

    iget-object p0, p0, Lsdo;->ae:Lufn;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lufn;->a(Ljava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final w()Z
    .locals 0

    iget p0, p0, Lsdo;->x:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final x()Z
    .locals 1

    iget v0, p0, Lsdo;->x:I

    iget-object p0, p0, Lsdo;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    if-ne v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final y()Z
    .locals 0

    iget-boolean p0, p0, Lsdo;->ab:Z

    return p0
.end method

.method public final z()Z
    .locals 0

    iget-object p0, p0, Lsdo;->p:Lsdq;

    iget-boolean p0, p0, Lsdq;->a:Z

    return p0
.end method
