.class public final Lpsk;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laccc;


# instance fields
.field private final a:Laccg;

.field private final b:Laccg;

.field private final c:Laccg;

.field private final d:Laccg;

.field private final e:Laccg;

.field private final f:Laccg;

.field private final g:Laccg;

.field private final h:Laccg;

.field private final i:Laccg;

.field private final j:Laccg;

.field private final k:Laccg;

.field private final l:Laccg;

.field private final m:Laccg;

.field private final n:Laccg;

.field private final o:Laccg;

.field private final p:Laccg;

.field private final q:Laccg;


# direct methods
.method public constructor <init>(Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;Laccg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpsk;->a:Laccg;

    iput-object p2, p0, Lpsk;->b:Laccg;

    iput-object p3, p0, Lpsk;->c:Laccg;

    iput-object p4, p0, Lpsk;->d:Laccg;

    iput-object p5, p0, Lpsk;->e:Laccg;

    iput-object p6, p0, Lpsk;->f:Laccg;

    iput-object p7, p0, Lpsk;->g:Laccg;

    iput-object p8, p0, Lpsk;->h:Laccg;

    iput-object p9, p0, Lpsk;->i:Laccg;

    iput-object p10, p0, Lpsk;->j:Laccg;

    iput-object p11, p0, Lpsk;->k:Laccg;

    iput-object p12, p0, Lpsk;->l:Laccg;

    iput-object p13, p0, Lpsk;->m:Laccg;

    iput-object p14, p0, Lpsk;->n:Laccg;

    iput-object p15, p0, Lpsk;->o:Laccg;

    move-object/from16 p1, p16

    iput-object p1, p0, Lpsk;->p:Laccg;

    move-object/from16 p1, p17

    iput-object p1, p0, Lpsk;->q:Laccg;

    return-void
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 22

    move-object/from16 v0, p0

    iget-object v1, v0, Lpsk;->a:Laccg;

    invoke-interface {v1}, Laccg;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsql;

    iget-object v2, v0, Lpsk;->d:Laccg;

    invoke-interface {v2}, Laccg;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Loui;

    iget-object v3, v0, Lpsk;->e:Laccg;

    invoke-interface {v3}, Laccg;->a()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lklm;

    iget-object v4, v0, Lpsk;->f:Laccg;

    invoke-interface {v4}, Laccg;->a()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lufv;

    iget-object v5, v0, Lpsk;->g:Laccg;

    invoke-interface {v5}, Laccg;->a()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqaw;

    iget-object v6, v0, Lpsk;->h:Laccg;

    invoke-interface {v6}, Laccg;->a()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lxwg;

    iget-object v7, v0, Lpsk;->i:Laccg;

    invoke-interface {v7}, Laccg;->a()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lufv;

    iget-object v8, v0, Lpsk;->j:Laccg;

    check-cast v8, Lpsi;

    invoke-virtual {v8}, Lpsi;->b()Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    iget-object v9, v0, Lpsk;->k:Laccg;

    invoke-interface {v9}, Laccg;->a()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    iget-object v10, v0, Lpsk;->l:Laccg;

    invoke-interface {v10}, Laccg;->a()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lpwz;

    iget-object v11, v0, Lpsk;->m:Laccg;

    invoke-interface {v11}, Laccg;->a()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lpvz;

    iget-object v12, v0, Lpsk;->n:Laccg;

    check-cast v12, Lpsu;

    invoke-virtual {v12}, Lpsu;->b()Lpst;

    move-result-object v12

    iget-object v13, v0, Lpsk;->o:Laccg;

    invoke-interface {v13}, Laccg;->a()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lnoe;

    iget-object v14, v0, Lpsk;->p:Laccg;

    invoke-interface {v14}, Laccg;->a()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lkxm;

    iget-object v15, v0, Lpsk;->q:Laccg;

    invoke-interface {v15}, Laccg;->a()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lpsx;

    move-object/from16 v16, v4

    new-instance v4, Ljava/util/EnumMap;

    move-object/from16 v17, v6

    const-class v6, Lpsz;

    invoke-direct {v4, v6}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v15}, Lpsx;->a()Z

    move-result v6

    if-eqz v6, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v6, v0, Lpsk;->c:Laccg;

    iget-object v0, v0, Lpsk;->b:Laccg;

    invoke-virtual {v13, v1, v9}, Lnoe;->f(Lsql;Z)Z

    move-result v20

    sget-object v13, Lsql;->a:Lsql;

    invoke-virtual {v1}, Lsql;->ordinal()I

    move-result v13

    const/4 v15, 0x6

    move-object/from16 v18, v0

    const/4 v0, 0x0

    if-eq v13, v15, :cond_6

    const/4 v15, 0x7

    if-eq v13, v15, :cond_11

    const/16 v8, 0x13

    if-eq v13, v8, :cond_5

    invoke-interface {v7}, Lufv;->d()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    sget-object v8, Lqaw;->a:Lqaw;

    invoke-virtual {v5, v8}, Lqaw;->equals(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v12}, Lpst;->f()Z

    move-result v8

    sget-object v10, Lkjl;->aO:Lkiz;

    invoke-virtual {v3, v10}, Lklm;->q(Lkiz;)Z

    move-result v10

    if-eqz v10, :cond_1

    if-eqz v5, :cond_1

    if-nez v8, :cond_1

    const/16 v19, 0x1

    goto :goto_0

    :cond_1
    move/from16 v19, v0

    :goto_0
    invoke-virtual {v2}, Luvf;->j()Luuv;

    invoke-virtual {v2}, Luvf;->M()Z

    invoke-virtual {v2}, Luvf;->D()Z

    sget-object v8, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    new-array v0, v0, [I

    invoke-virtual {v2, v8, v0}, Luvf;->n(Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Luvf;->C()Ljava/util/Set;

    invoke-virtual {v2}, Luvf;->l()Luve;

    move-result-object v0

    sget-object v8, Luve;->b:Luve;

    if-ne v0, v8, :cond_2

    if-nez v19, :cond_3

    :cond_2
    invoke-virtual {v2}, Luvf;->l()Luve;

    move-result-object v0

    sget-object v8, Luve;->a:Luve;

    if-ne v0, v8, :cond_4

    invoke-static {v3, v1, v7}, Lppi;->n(Lklm;Lsql;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    invoke-virtual {v2}, Luvf;->M()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v2}, Luvf;->D()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v6}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    new-instance v1, Lisn;

    const/4 v2, 0x6

    invoke-direct {v1, v4, v2}, Lisn;-><init>(Ljava/lang/Object;I)V

    invoke-static {v0, v1}, Lj$/util/Map$-EL;->forEach(Ljava/util/Map;Ljava/util/function/BiConsumer;)V

    return-object v4

    :cond_4
    invoke-interface/range {v18 .. v18}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    iget-object v0, v0, Lupk;->b:Lxwg;

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lpsz;->a:Lpsz;

    invoke-interface/range {v18 .. v18}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lupk;

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v5, :cond_11

    invoke-virtual/range {v17 .. v17}, Lxwg;->h()Z

    move-result v1

    if-eqz v1, :cond_11

    if-eqz v9, :cond_11

    sget-object v1, Lkkq;->k:Lkiz;

    invoke-virtual {v3, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object v1, Lpsz;->d:Lpsz;

    sget-object v2, Lpsz;->h:Lpsz;

    sget-object v3, Lpsz;->b:Lpsz;

    invoke-static {v1, v2, v3}, Lyfm;->J(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lyfm;

    move-result-object v1

    invoke-virtual/range {v17 .. v17}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ladbv;

    invoke-interface {v2}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luus;

    invoke-interface {v2}, Luus;->j()Luuv;

    move-result-object v18

    new-instance v16, Lpsc;

    move-object/from16 v19, v0

    check-cast v19, Luuv;

    move-object/from16 v21, v4

    move-object/from16 v17, v6

    invoke-direct/range {v16 .. v21}, Lpsc;-><init>(Ladbv;Luuv;Luuv;ZLjava/util/Map;)V

    move-object/from16 v0, v16

    invoke-static {v1, v0}, Lj$/lang/Iterable$-EL;->forEach(Ljava/lang/Iterable;Ljava/util/function/Consumer;)V

    return-object v4

    :cond_5
    invoke-interface {v14, v1}, Lkxm;->aA(Lsql;)V

    return-object v4

    :cond_6
    move-object/from16 v17, v6

    invoke-virtual {v11, v10}, Lpvz;->g(Lpwz;)Z

    move-result v1

    invoke-virtual {v2}, Luvf;->M()Z

    move-result v5

    if-eqz v5, :cond_12

    invoke-virtual {v2}, Luvf;->D()Z

    move-result v5

    if-eqz v5, :cond_12

    sget-object v5, Lkjl;->aO:Lkiz;

    invoke-virtual {v3, v5}, Lklm;->q(Lkiz;)Z

    move-result v5

    if-eqz v5, :cond_12

    if-nez v1, :cond_7

    sget-object v5, Lkkn;->aX:Lkiz;

    invoke-virtual {v3, v5}, Lklm;->x(Lkiz;)Z

    move-result v5

    if-nez v5, :cond_7

    sget-object v5, Lpwz;->d:Lpwz;

    if-ne v10, v5, :cond_12

    :cond_7
    invoke-virtual {v2}, Luvf;->l()Luve;

    move-result-object v5

    sget-object v6, Luve;->b:Luve;

    if-ne v5, v6, :cond_12

    sget-object v2, Lpwz;->d:Lpwz;

    if-ne v10, v2, :cond_a

    if-eqz v9, :cond_9

    const/4 v3, 0x1

    invoke-virtual {v11, v3}, Lpvz;->e(Z)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v5, Lpsz;->i:Lpsz;

    invoke-interface {v0, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    if-eqz v0, :cond_8

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    move v9, v3

    goto :goto_1

    :cond_9
    move v9, v0

    :goto_1
    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v3, Lpsz;->h:Lpsz;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_a
    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v3, Lpsz;->d:Lpsz;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    :goto_2
    invoke-interface/range {v16 .. v16}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_e

    if-eqz v1, :cond_e

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v1, Lpsz;->d:Lpsz;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    if-ne v10, v2, :cond_c

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_c
    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v1, Lpsz;->b:Lpsz;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    :goto_3
    sget-object v0, Lpwz;->c:Lpwz;

    if-ne v10, v0, :cond_e

    invoke-virtual {v11, v9}, Lpvz;->d(Z)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v1, Lpsz;->h:Lpsz;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    if-nez v8, :cond_f

    if-eqz v20, :cond_11

    :cond_f
    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v1, Lpsz;->f:Lpsz;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    sget-object v0, Lpwz;->b:Lpwz;

    invoke-virtual {v10, v0}, Lpwz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    sget-object v0, Lpwz;->c:Lpwz;

    invoke-virtual {v10, v0}, Lpwz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_10
    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ladbv;

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lupk;

    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    :goto_4
    return-object v4

    :cond_12
    invoke-virtual {v2}, Luvf;->l()Luve;

    move-result-object v0

    sget-object v1, Luve;->a:Luve;

    if-ne v0, v1, :cond_13

    invoke-virtual {v2}, Luvf;->M()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {v2}, Luvf;->D()Z

    move-result v0

    if-eqz v0, :cond_13

    sget-object v0, Lkir;->b:Lkiz;

    invoke-virtual {v3, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface/range {v17 .. v17}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    new-instance v1, Lisn;

    const/4 v15, 0x7

    invoke-direct {v1, v4, v15}, Lisn;-><init>(Ljava/lang/Object;I)V

    invoke-static {v0, v1}, Lj$/util/Map$-EL;->forEach(Ljava/util/Map;Ljava/util/function/BiConsumer;)V

    return-object v4

    :cond_13
    sget-object v0, Lpsz;->a:Lpsz;

    invoke-interface/range {v18 .. v18}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lupk;

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v4
.end method
