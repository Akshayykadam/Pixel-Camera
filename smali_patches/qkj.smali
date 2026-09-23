.class public Lqkj;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field private static volatile a:Lacnb;

.field private static volatile b:Lacnb;

.field public static volatile d:Lacog;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static A(Lqnz;Lcio;Ljava/lang/String;Lbxb;II)V
    .locals 27

    move-object/from16 v1, p0

    move/from16 v6, p4

    and-int/lit8 v0, v6, 0x6

    const v2, -0x59cf530d

    move-object/from16 v3, p3

    invoke-interface {v3, v2}, Lbxb;->b(I)Lbxb;

    move-result-object v11

    const/4 v14, 0x4

    const/4 v15, 0x1

    if-nez v0, :cond_1

    invoke-interface {v11, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v15, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    move v0, v14

    :goto_0
    or-int/2addr v0, v6

    goto :goto_1

    :cond_1
    move v0, v6

    :goto_1
    and-int/lit8 v2, p5, 0x2

    const/16 v16, 0x20

    if-eqz v2, :cond_2

    or-int/lit8 v0, v0, 0x30

    goto :goto_3

    :cond_2
    and-int/lit8 v3, v6, 0x30

    if-nez v3, :cond_4

    move-object/from16 v3, p1

    invoke-interface {v11, v3}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v4

    if-eq v15, v4, :cond_3

    const/16 v4, 0x10

    goto :goto_2

    :cond_3
    move/from16 v4, v16

    :goto_2
    or-int/2addr v0, v4

    goto :goto_4

    :cond_4
    :goto_3
    move-object/from16 v3, p1

    :goto_4
    and-int/lit8 v4, p5, 0x4

    if-eqz v4, :cond_5

    or-int/lit16 v0, v0, 0x180

    goto :goto_6

    :cond_5
    and-int/lit16 v5, v6, 0x180

    if-nez v5, :cond_7

    move-object/from16 v5, p2

    invoke-interface {v11, v5}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    if-eq v15, v7, :cond_6

    const/16 v7, 0x80

    goto :goto_5

    :cond_6
    const/16 v7, 0x100

    :goto_5
    or-int/2addr v0, v7

    goto :goto_7

    :cond_7
    :goto_6
    move-object/from16 v5, p2

    :goto_7
    and-int/lit16 v7, v0, 0x93

    const/16 v8, 0x92

    const/4 v9, 0x0

    if-eq v7, v8, :cond_8

    move v7, v15

    goto :goto_8

    :cond_8
    move v7, v9

    :goto_8
    and-int/lit8 v8, v0, 0x1

    invoke-interface {v11, v7, v8}, Lbxb;->J(ZI)Z

    move-result v7

    if-eqz v7, :cond_23

    if-eqz v2, :cond_9

    sget-object v2, Lcio;->e:Lcil;

    goto :goto_9

    :cond_9
    move-object v2, v3

    :goto_9
    const/4 v3, 0x0

    if-eqz v4, :cond_a

    move-object v5, v3

    :cond_a
    and-int/lit8 v4, v0, 0xe

    move-object v7, v11

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v8

    if-eq v4, v14, :cond_b

    sget-object v10, Lbxa;->a:Ljava/lang/Object;

    if-ne v8, v10, :cond_c

    :cond_b
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    sget-object v10, Lbzw;->c:Lbzw;

    new-instance v12, Lbzg;

    invoke-direct {v12, v8, v10}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    invoke-virtual {v7, v12}, Lbyb;->ad(Ljava/lang/Object;)V

    move-object v8, v12

    :cond_c
    move-object/from16 v17, v8

    check-cast v17, Lbyw;

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v8

    if-eq v4, v14, :cond_d

    sget-object v10, Lbxa;->a:Ljava/lang/Object;

    if-ne v8, v10, :cond_f

    :cond_d
    instance-of v8, v1, Lqny;

    if-eqz v8, :cond_e

    move-object v8, v1

    check-cast v8, Lqny;

    iget-object v8, v8, Lqny;->a:Lqlh;

    goto :goto_a

    :cond_e
    instance-of v8, v1, Lqnx;

    if-eqz v8, :cond_22

    move-object v8, v1

    check-cast v8, Lqnx;

    iget-object v10, v8, Lqnx;->b:Lyeh;

    iget v8, v8, Lqnx;->a:I

    invoke-virtual {v10, v8}, Lyeh;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v8, Lqlh;

    :goto_a
    sget-object v10, Lbzw;->c:Lbzw;

    new-instance v12, Lbzg;

    invoke-direct {v12, v8, v10}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    invoke-virtual {v7, v12}, Lbyb;->ad(Ljava/lang/Object;)V

    move-object v8, v12

    :cond_f
    move-object/from16 v18, v8

    check-cast v18, Lbyw;

    sget-object v8, Ldcy;->d:Lbxj;

    invoke-interface {v11, v8}, Lbxb;->e(Lbxj;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ldnm;

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v10

    sget-object v12, Lbxa;->a:Ljava/lang/Object;

    const/4 v13, 0x0

    if-ne v10, v12, :cond_10

    new-instance v10, Ldnp;

    invoke-direct {v10, v13}, Ldnp;-><init>(F)V

    sget-object v13, Lbzw;->c:Lbzw;

    new-instance v14, Lbzg;

    invoke-direct {v14, v10, v13}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    invoke-virtual {v7, v14}, Lbyb;->ad(Ljava/lang/Object;)V

    move-object v10, v14

    :cond_10
    move-object v14, v10

    check-cast v14, Lbyw;

    invoke-interface {v11, v8}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v10

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v10, :cond_11

    if-ne v13, v12, :cond_12

    :cond_11
    new-instance v13, Llaf;

    const/16 v10, 0xf

    invoke-direct {v13, v8, v14, v10, v3}, Llaf;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    invoke-virtual {v7, v13}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_12
    check-cast v13, Ladgi;

    invoke-static {v2, v13}, Lctz;->v(Lcio;Ladgi;)Lcio;

    move-result-object v3

    sget-object v8, Lcib;->b:Lcid;

    invoke-static {v8, v9}, Laty;->b(Lcid;Z)Lcvu;

    move-result-object v8

    invoke-static {v11}, Ldbz;->ai(Lbxb;)J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, La;->e(J)I

    move-result v10

    invoke-virtual {v7}, Lbyb;->ah()Lcfh;

    move-result-object v13

    invoke-static {v11, v3}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v3

    sget-object v9, Lcyc;->a:Ladfx;

    invoke-interface {v11}, Lbxb;->x()V

    iget-boolean v15, v7, Lbyb;->t:Z

    if-eqz v15, :cond_13

    invoke-interface {v11, v9}, Lbxb;->j(Ladfx;)V

    goto :goto_b

    :cond_13
    invoke-interface {v11}, Lbxb;->z()V

    :goto_b
    sget-object v15, Lcyc;->e:Ladgm;

    invoke-static {v11, v8, v15}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v8, Lcyc;->d:Ladgm;

    invoke-static {v11, v13, v8}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    sget-object v13, Lcyc;->f:Ladgm;

    invoke-static {v11, v10, v13}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v10, Lcyc;->g:Ladgi;

    invoke-static {v11, v10}, Lcay;->b(Lbxb;Ladgi;)V

    move/from16 v21, v0

    sget-object v0, Lcyc;->c:Ladgm;

    invoke-static {v11, v3, v0}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-wide v22, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    const/high16 v22, 0x40000000    # 2.0f

    invoke-static/range {v22 .. v22}, Lats;->e(F)Latm;

    move-result-object v3

    move-object/from16 v23, v2

    sget-object v2, Lcio;->e:Lcil;

    move/from16 p2, v4

    sget-object v4, Lcib;->m:Lcih;

    move-object/from16 v24, v5

    const/4 v5, 0x6

    invoke-static {v3, v4, v11, v5}, Lavs;->a(Latl;Lcih;Lbxb;I)Lcvu;

    move-result-object v3

    invoke-static {v11}, Ldbz;->ai(Lbxb;)J

    move-result-wide v25

    invoke-static/range {v25 .. v26}, La;->e(J)I

    move-result v4

    invoke-virtual {v7}, Lbyb;->ah()Lcfh;

    move-result-object v5

    invoke-static {v11, v2}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v2

    invoke-interface {v11}, Lbxb;->x()V

    move/from16 v26, v4

    iget-boolean v4, v7, Lbyb;->t:Z

    if-eqz v4, :cond_14

    invoke-interface {v11, v9}, Lbxb;->j(Ladfx;)V

    goto :goto_c

    :cond_14
    invoke-interface {v11}, Lbxb;->z()V

    :goto_c
    invoke-static {v11, v3, v15}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v11, v5, v8}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v11, v3, v13}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v11, v10}, Lcay;->b(Lbxb;Ladgi;)V

    invoke-static {v11, v2, v0}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    instance-of v0, v1, Lqnx;

    if-eqz v0, :cond_15

    const v2, -0x71a619f2

    invoke-interface {v11, v2}, Lbxb;->w(I)V

    invoke-virtual {v7}, Lbyb;->X()V

    move-object v2, v1

    check-cast v2, Lqnx;

    iget-object v2, v2, Lqnx;->c:Ljava/lang/String;

    goto :goto_d

    :cond_15
    instance-of v2, v1, Lqny;

    if-eqz v2, :cond_21

    const v2, -0x71a6146a

    invoke-interface {v11, v2}, Lbxb;->w(I)V

    move-object v2, v1

    check-cast v2, Lqny;

    iget-object v2, v2, Lqny;->a:Lqlh;

    invoke-static {v2, v11}, Lqkj;->K(Lqlh;Lbxb;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7}, Lbyb;->X()V

    :goto_d
    if-nez v2, :cond_16

    const v2, -0x30084b59

    invoke-interface {v11, v2}, Lbxb;->w(I)V

    invoke-virtual {v7}, Lbyb;->X()V

    move-object v2, v7

    move-object v3, v12

    const/4 v15, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    goto :goto_f

    :cond_16
    const v3, -0x30084b58

    invoke-interface {v11, v3}, Lbxb;->w(I)V

    instance-of v3, v1, Lqny;

    const/high16 v4, 0x41a00000    # 20.0f

    const/4 v15, 0x1

    if-eq v15, v3, :cond_17

    const/high16 v3, 0x40800000    # 4.0f

    goto :goto_e

    :cond_17
    move v3, v4

    :goto_e
    invoke-static {v4, v3, v3, v4}, Lbcc;->c(FFFF)Lbca;

    move-result-object v8

    move-object v3, v12

    const/4 v12, 0x0

    const/16 v13, 0xc

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v19, v7

    move-object v7, v2

    move-object/from16 v2, v19

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v7 .. v13}, Lqkj;->z(Ljava/lang/String;Lcnc;Lcio;Ladfx;Lbxb;II)V

    invoke-virtual {v2}, Lbyb;->X()V

    :goto_f
    const/16 v7, 0xe

    if-eqz v0, :cond_18

    const v0, -0x30007efe

    invoke-interface {v11, v0}, Lbxb;->w(I)V

    new-instance v0, Lbgl;

    const/16 v4, 0x8

    const/4 v5, 0x0

    move/from16 v8, p2

    move-object v9, v2

    move-object v10, v3

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v12, v24

    const/16 v25, 0x6

    invoke-direct/range {v0 .. v5}, Lbgl;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I[B)V

    const v1, 0x2c6f0dc9

    invoke-static {v1, v0, v11}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v0

    shr-int/lit8 v1, v21, 0x6

    and-int/2addr v1, v7

    or-int/lit8 v1, v1, 0x30

    invoke-static {v12, v0, v11, v1}, Lqkj;->B(Ljava/lang/String;Ladgm;Lbxb;I)V

    invoke-virtual {v9}, Lbyb;->X()V

    move v0, v15

    goto :goto_10

    :cond_18
    move/from16 v8, p2

    move-object v9, v2

    move-object v10, v3

    move-object/from16 v2, v17

    move-object/from16 v3, v18

    move-object/from16 v12, v24

    const v0, -0x2ff55dc7

    invoke-interface {v11, v0}, Lbxb;->w(I)V

    invoke-virtual {v9}, Lbyb;->X()V

    move/from16 v0, v19

    :goto_10
    invoke-interface {v11}, Lbxb;->n()V

    if-eqz v0, :cond_20

    const v0, 0x64a08663

    invoke-interface {v11, v0}, Lbxb;->w(I)V

    invoke-interface {v14}, Lcau;->fr()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldnp;

    iget v0, v0, Ldnp;->a:F

    sget v1, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->c:F

    sub-float/2addr v0, v1

    add-float v0, v0, v20

    div-float v0, v0, v22

    add-float v0, v0, v20

    sget v1, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->d:F

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v4, v0

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v13, v0

    shl-long v16, v4, v16

    invoke-static {v2}, Lwqz;->r(Lbyw;)Z

    move-result v18

    invoke-interface {v11, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v9}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v0, :cond_19

    if-ne v1, v10, :cond_1a

    :cond_19
    new-instance v1, Lqhh;

    const/4 v0, 0x7

    invoke-direct {v1, v2, v0}, Lqhh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v9, v1}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_1a
    move-object/from16 v20, v1

    check-cast v20, Ladfx;

    move-object/from16 v0, p0

    check-cast v0, Lqnx;

    iget-object v0, v0, Lqnx;->b:Lyeh;

    move-object/from16 v24, v12

    new-instance v12, Lbts;

    invoke-direct {v12, v7}, Lbts;-><init>(I)V

    invoke-interface {v11, v3}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v9}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v1, :cond_1b

    if-ne v4, v10, :cond_1c

    :cond_1b
    new-instance v4, Lqba;

    const/16 v1, 0xd

    invoke-direct {v4, v3, v1}, Lqba;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v9, v4}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_1c
    const/4 v1, 0x4

    if-ne v8, v1, :cond_1d

    goto :goto_11

    :cond_1d
    move/from16 v15, v19

    :goto_11
    move-object v7, v4

    check-cast v7, Ladgi;

    invoke-interface {v11, v3}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v1, v15

    invoke-interface {v11, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v1, v4

    invoke-virtual {v9}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v4

    if-nez v1, :cond_1f

    if-ne v4, v10, :cond_1e

    goto :goto_12

    :cond_1e
    move-object v8, v0

    goto :goto_13

    :cond_1f
    :goto_12
    move-object v1, v0

    new-instance v0, Llhn;

    const/4 v4, 0x5

    const/4 v5, 0x0

    move-object v8, v3

    move-object v3, v2

    move-object v2, v8

    move-object v8, v1

    move-object/from16 v1, p0

    invoke-direct/range {v0 .. v5}, Llhn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I[S)V

    invoke-virtual {v9, v0}, Lbyb;->ad(Ljava/lang/Object;)V

    move-object v4, v0

    :goto_13
    const-wide v0, 0xffffffffL

    and-long/2addr v0, v13

    or-long v0, v16, v0

    move-object v14, v4

    check-cast v14, Ladgi;

    const/16 v16, 0x0

    move-object v13, v7

    move-object v2, v9

    move-object v15, v11

    move/from16 v7, v18

    move-object/from16 v10, v20

    move-object v11, v8

    move-wide v8, v0

    invoke-static/range {v7 .. v16}, Lqkj;->F(ZJLadfx;Lyeh;Ladgn;Ladgi;Ladgi;Lbxb;I)V

    move-object v11, v15

    invoke-virtual {v2}, Lbyb;->X()V

    goto :goto_14

    :cond_20
    move-object v2, v9

    move-object/from16 v24, v12

    const v0, 0x64ac8515

    invoke-interface {v11, v0}, Lbxb;->w(I)V

    invoke-virtual {v2}, Lbyb;->X()V

    :goto_14
    invoke-interface {v11}, Lbxb;->n()V

    move-object/from16 v2, v23

    move-object/from16 v3, v24

    goto :goto_15

    :cond_21
    move-object v2, v7

    const v0, -0x71a61eef

    invoke-interface {v11, v0}, Lbxb;->w(I)V

    invoke-virtual {v2}, Lbyb;->X()V

    new-instance v0, Ladcb;

    invoke-direct {v0}, Ladcb;-><init>()V

    throw v0

    :cond_22
    new-instance v0, Ladcb;

    invoke-direct {v0}, Ladcb;-><init>()V

    throw v0

    :cond_23
    invoke-interface {v11}, Lbxb;->s()V

    move-object v2, v3

    move-object v3, v5

    :goto_15
    invoke-interface {v11}, Lbxb;->K()Lbzo;

    move-result-object v7

    if-eqz v7, :cond_24

    new-instance v0, Layq;

    const/4 v6, 0x4

    move-object/from16 v1, p0

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-direct/range {v0 .. v6}, Layq;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;III)V

    iput-object v0, v7, Lbzo;->c:Ladgm;

    :cond_24
    return-void
.end method

.method public static B(Ljava/lang/String;Ladgm;Lbxb;I)V
    .locals 10

    and-int/lit8 v0, p3, 0x6

    const v1, -0x509a2ea8

    invoke-interface {p2, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v8

    const/4 p2, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-interface {v8, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v1, v0, :cond_0

    move v0, p2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, p3

    goto :goto_1

    :cond_1
    move v0, p3

    :goto_1
    and-int/lit8 v2, p3, 0x30

    if-nez v2, :cond_3

    invoke-interface {v8, p1}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_2

    const/16 v2, 0x10

    goto :goto_2

    :cond_2
    const/16 v2, 0x20

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit8 v2, v0, 0x13

    const/16 v3, 0x12

    const/4 v4, 0x0

    if-eq v2, v3, :cond_4

    move v2, v1

    goto :goto_3

    :cond_4
    move v2, v4

    :goto_3
    and-int/lit8 v3, v0, 0x1

    invoke-interface {v8, v2, v3}, Lbxb;->J(ZI)Z

    move-result v2

    if-eqz v2, :cond_6

    if-nez p0, :cond_5

    const p0, 0x39a6454c

    invoke-interface {v8, p0}, Lbxb;->w(I)V

    shr-int/lit8 p0, v0, 0x3

    and-int/lit8 p0, p0, 0xe

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, v8, p0}, Ladgm;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object p0, v8

    check-cast p0, Lbyb;

    invoke-virtual {p0}, Lbyb;->X()V

    invoke-interface {v8}, Lbxb;->K()Lbzo;

    move-result-object p0

    if-eqz p0, :cond_7

    new-instance p2, Lkml;

    const/16 v0, 0xf

    invoke-direct {p2, p1, p3, v0}, Lkml;-><init>(Ljava/lang/Object;II)V

    iput-object p2, p0, Lbzo;->c:Ladgm;

    return-void

    :cond_5
    const v0, 0x39a6b5ea

    invoke-interface {v8, v0}, Lbxb;->w(I)V

    move-object v0, v8

    check-cast v0, Lbyb;

    invoke-virtual {v0}, Lbyb;->X()V

    sget v0, Lvdy;->a:I

    sget v0, Lbtf;->a:F

    const/high16 v0, 0x41980000    # 19.0f

    const/16 v2, 0x1b0

    invoke-static {p2, v0, v8, v2, v4}, Lbtf;->a(IFLbxb;II)Ldpp;

    move-result-object v2

    const/4 p2, 0x6

    invoke-static {v1, v8, p2}, Lbtn;->e(ZLbxb;I)Lzeb;

    move-result-object v4

    new-instance p2, Lkoy;

    const/4 v0, 0x7

    invoke-direct {p2, p0, v0}, Lkoy;-><init>(Ljava/lang/Object;I)V

    const v0, -0x3964bcf3

    invoke-static {v0, p2, v8}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v3

    new-instance p2, Lquz;

    invoke-direct {p2, p1, v1}, Lquz;-><init>(Ljava/lang/Object;I)V

    const v0, -0x2d271e0b

    invoke-static {v0, p2, v8}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v7

    const v9, 0x6000030

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v9}, Lvcr;->u(Ldpp;Ladgn;Lzeb;Lcio;ZLadgm;Lbxb;I)V

    goto :goto_4

    :cond_6
    invoke-interface {v8}, Lbxb;->s()V

    :goto_4
    invoke-interface {v8}, Lbxb;->K()Lbzo;

    move-result-object p2

    if-eqz p2, :cond_7

    new-instance v0, Lkch;

    const/16 v4, 0x8

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lkch;-><init>(Ljava/lang/Object;Ljava/lang/Object;II[B)V

    iput-object v0, p2, Lbzo;->c:Ladgm;

    :cond_7
    return-void
.end method

.method public static C(Lbbb;ZLavm;Lcid;Lcio;Lcov;ZLbxb;I)V
    .locals 23

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p8

    and-int/lit8 v0, v8, 0x6

    const v5, 0x2e969f85

    move-object/from16 v9, p7

    invoke-interface {v9, v5}, Lbxb;->b(I)Lbxb;

    move-result-object v15

    const/4 v10, 0x1

    if-nez v0, :cond_1

    invoke-interface {v15, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v10, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v8

    goto :goto_1

    :cond_1
    move v0, v8

    :goto_1
    and-int/lit8 v11, v8, 0x30

    if-nez v11, :cond_3

    invoke-interface {v15, v2}, Lbxb;->E(Z)Z

    move-result v11

    if-eq v10, v11, :cond_2

    const/16 v11, 0x10

    goto :goto_2

    :cond_2
    const/16 v11, 0x20

    :goto_2
    or-int/2addr v0, v11

    :cond_3
    and-int/lit16 v11, v8, 0x180

    if-nez v11, :cond_5

    invoke-interface {v15, v3}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v11

    if-eq v10, v11, :cond_4

    const/16 v11, 0x80

    goto :goto_3

    :cond_4
    const/16 v11, 0x100

    :goto_3
    or-int/2addr v0, v11

    :cond_5
    and-int/lit16 v11, v8, 0xc00

    if-nez v11, :cond_7

    invoke-interface {v15, v4}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v11

    if-eq v10, v11, :cond_6

    const/16 v11, 0x400

    goto :goto_4

    :cond_6
    const/16 v11, 0x800

    :goto_4
    or-int/2addr v0, v11

    :cond_7
    and-int/lit16 v11, v8, 0x6000

    if-nez v11, :cond_9

    move-object/from16 v11, p4

    invoke-interface {v15, v11}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v13

    if-eq v10, v13, :cond_8

    const/16 v13, 0x2000

    goto :goto_5

    :cond_8
    const/16 v13, 0x4000

    :goto_5
    or-int/2addr v0, v13

    goto :goto_6

    :cond_9
    move-object/from16 v11, p4

    :goto_6
    const/high16 v13, 0x30000

    and-int/2addr v13, v8

    if-nez v13, :cond_c

    const/high16 v13, 0x40000

    and-int/2addr v13, v8

    if-nez v13, :cond_a

    invoke-interface {v15, v6}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v13

    goto :goto_7

    :cond_a
    invoke-interface {v15, v6}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v13

    :goto_7
    if-eq v10, v13, :cond_b

    const/high16 v13, 0x10000

    goto :goto_8

    :cond_b
    const/high16 v13, 0x20000

    :goto_8
    or-int/2addr v0, v13

    :cond_c
    const/high16 v13, 0x180000

    and-int/2addr v13, v8

    if-nez v13, :cond_e

    invoke-interface {v15, v7}, Lbxb;->E(Z)Z

    move-result v13

    if-eq v10, v13, :cond_d

    const/high16 v13, 0x80000

    goto :goto_9

    :cond_d
    const/high16 v13, 0x100000

    :goto_9
    or-int/2addr v0, v13

    :cond_e
    const v13, 0x92493

    and-int/2addr v13, v0

    const v14, 0x92492

    if-eq v13, v14, :cond_f

    const/4 v13, 0x1

    goto :goto_a

    :cond_f
    const/4 v13, 0x0

    :goto_a
    and-int/lit8 v14, v0, 0x1

    invoke-interface {v15, v13, v14}, Lbxb;->J(ZI)Z

    move-result v13

    if-eqz v13, :cond_1d

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Lbbb;->o()I

    move-result v13

    invoke-virtual {v1}, Lbbb;->b()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    if-ge v13, v14, :cond_11

    goto :goto_b

    :cond_10
    invoke-virtual {v1}, Lbbb;->o()I

    move-result v13

    if-lez v13, :cond_11

    :goto_b
    const/16 v19, 0x1

    goto :goto_c

    :cond_11
    const/16 v19, 0x0

    :goto_c
    if-eqz v2, :cond_12

    const v13, 0x7f130840

    goto :goto_d

    :cond_12
    const v13, 0x7f130841

    :goto_d
    invoke-static {v13, v15}, Ldcm;->d(ILbxb;)Ljava/lang/String;

    move-result-object v13

    move-object v14, v15

    check-cast v14, Lbyb;

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v9

    sget-object v5, Lbxa;->a:Ljava/lang/Object;

    if-ne v9, v5, :cond_13

    sget-object v9, Ladeq;->a:Ladeq;

    invoke-static {v9, v15}, Lbxw;->a(Ladep;Lbxb;)Ladlm;

    move-result-object v9

    invoke-virtual {v14, v9}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_13
    check-cast v9, Ladlm;

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v12

    const/4 v10, 0x0

    if-ne v12, v5, :cond_14

    new-instance v12, Lejq;

    invoke-direct {v12, v10, v10}, Lejq;-><init>([B[C)V

    invoke-virtual {v14, v12}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_14
    check-cast v12, Lejq;

    new-instance v10, Ldfr;

    move/from16 v18, v0

    const/4 v0, 0x0

    invoke-direct {v10, v0}, Ldfr;-><init>(I)V

    invoke-interface {v15, v9}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v0

    move/from16 v20, v0

    and-int/lit8 v0, v18, 0x70

    const/16 v7, 0x20

    if-ne v0, v7, :cond_15

    const/4 v0, 0x1

    goto :goto_e

    :cond_15
    const/4 v0, 0x0

    :goto_e
    or-int v0, v20, v0

    and-int/lit8 v7, v18, 0xe

    move/from16 v17, v0

    const/4 v0, 0x4

    if-ne v7, v0, :cond_16

    const/4 v0, 0x1

    goto :goto_f

    :cond_16
    const/4 v0, 0x0

    :goto_f
    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v7

    or-int v0, v17, v0

    if-nez v0, :cond_17

    if-ne v7, v5, :cond_18

    :cond_17
    new-instance v7, Lqhg;

    const/4 v0, 0x2

    invoke-direct {v7, v9, v2, v1, v0}, Lqhg;-><init>(Ladlm;ZLbbb;I)V

    invoke-virtual {v14, v7}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_18
    move-object/from16 v21, v7

    check-cast v21, Ladfx;

    const/16 v22, 0x8

    const/16 v18, 0x0

    move-object/from16 v20, v10

    move-object/from16 v16, v11

    move-object/from16 v17, v12

    invoke-static/range {v16 .. v22}, Lvz;->aZ(Lcio;Lejq;Lala;ZLdfr;Ladfx;I)Lcio;

    move-result-object v0

    invoke-interface {v15, v13}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v9

    if-nez v7, :cond_19

    if-ne v9, v5, :cond_1a

    :cond_19
    new-instance v9, Lqba;

    const/16 v5, 0xf

    invoke-direct {v9, v13, v5}, Lqba;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v14, v9}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_1a
    check-cast v9, Ladgi;

    invoke-static {v0, v9}, Ldfw;->b(Lcio;Ladgi;)Lcio;

    move-result-object v0

    const/4 v5, 0x0

    invoke-static {v4, v5}, Laty;->b(Lcid;Z)Lcvu;

    move-result-object v7

    invoke-static {v15}, Ldbz;->ai(Lbxb;)J

    move-result-wide v9

    invoke-static {v9, v10}, La;->e(J)I

    move-result v9

    invoke-virtual {v14}, Lbyb;->ah()Lcfh;

    move-result-object v10

    invoke-static {v15, v0}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v0

    sget-object v11, Lcyc;->a:Ladfx;

    invoke-interface {v15}, Lbxb;->x()V

    iget-boolean v12, v14, Lbyb;->t:Z

    if-eqz v12, :cond_1b

    invoke-interface {v15, v11}, Lbxb;->j(Ladfx;)V

    goto :goto_10

    :cond_1b
    invoke-interface {v15}, Lbxb;->z()V

    :goto_10
    sget-object v11, Lcyc;->e:Ladgm;

    invoke-static {v15, v7, v11}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v7, Lcyc;->d:Ladgm;

    invoke-static {v15, v10, v7}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v9, Lcyc;->f:Ladgm;

    invoke-static {v15, v7, v9}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v7, Lcyc;->g:Ladgi;

    invoke-static {v15, v7}, Lcay;->b(Lbxb;Ladgi;)V

    sget-object v7, Lcyc;->c:Ladgm;

    invoke-static {v15, v0, v7}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    if-eqz v19, :cond_1c

    if-eqz p6, :cond_1c

    const/4 v9, 0x1

    goto :goto_11

    :cond_1c
    move v9, v5

    :goto_11
    invoke-static {v15}, Ldbz;->at(Lbxb;)Lbqc;

    move-result-object v0

    invoke-interface {v0}, Lbqc;->a()Lafk;

    move-result-object v0

    const/4 v5, 0x2

    invoke-static {v0, v5}, Ladj;->g(Lafk;I)Ladm;

    move-result-object v11

    invoke-static {v15}, Ldbz;->at(Lbxb;)Lbqc;

    move-result-object v0

    invoke-interface {v0}, Lbqc;->a()Lafk;

    move-result-object v0

    invoke-static {v0, v5}, Ladj;->h(Lafk;I)Ladn;

    move-result-object v12

    new-instance v0, Laml;

    const/16 v5, 0xd

    const/4 v7, 0x0

    invoke-direct {v0, v3, v6, v5, v7}, Laml;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    const v5, 0x39a0f4e3    # 3.0700033E-4f

    invoke-static {v5, v0, v15}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v14

    const/high16 v16, 0x30000

    const/16 v17, 0x12

    const/4 v10, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v17}, Lvz;->aO(ZLcio;Ladm;Ladn;Ljava/lang/String;Ladgn;Lbxb;II)V

    invoke-interface {v15}, Lbxb;->n()V

    goto :goto_12

    :cond_1d
    invoke-interface {v15}, Lbxb;->s()V

    :goto_12
    invoke-interface {v15}, Lbxb;->K()Lbzo;

    move-result-object v10

    if-eqz v10, :cond_1e

    new-instance v0, Lqnd;

    const/4 v9, 0x0

    move-object/from16 v5, p4

    move/from16 v7, p6

    invoke-direct/range {v0 .. v9}, Lqnd;-><init>(Lbbb;ZLavm;Lcid;Lcio;Lcov;ZII)V

    iput-object v0, v10, Lbzo;->c:Ladgm;

    :cond_1e
    return-void
.end method

.method public static D(Lauc;Lbbb;ZZLbxb;I)V
    .locals 17

    move-object/from16 v1, p0

    move/from16 v3, p2

    move/from16 v5, p5

    and-int/lit8 v0, v5, 0x6

    const v2, 0x4ac2996f    # 6376631.5f

    move-object/from16 v4, p4

    invoke-interface {v4, v2}, Lbxb;->b(I)Lbxb;

    move-result-object v13

    const/4 v2, 0x2

    const/4 v4, 0x1

    if-nez v0, :cond_1

    invoke-interface {v13, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v4, v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v5

    goto :goto_1

    :cond_1
    move v0, v5

    :goto_1
    and-int/lit8 v6, v5, 0x30

    if-nez v6, :cond_3

    move-object/from16 v6, p1

    invoke-interface {v13, v6}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    if-eq v4, v7, :cond_2

    const/16 v7, 0x10

    goto :goto_2

    :cond_2
    const/16 v7, 0x20

    :goto_2
    or-int/2addr v0, v7

    goto :goto_3

    :cond_3
    move-object/from16 v6, p1

    :goto_3
    and-int/lit16 v7, v5, 0x180

    if-nez v7, :cond_5

    invoke-interface {v13, v3}, Lbxb;->E(Z)Z

    move-result v7

    if-eq v4, v7, :cond_4

    const/16 v7, 0x80

    goto :goto_4

    :cond_4
    const/16 v7, 0x100

    :goto_4
    or-int/2addr v0, v7

    :cond_5
    and-int/lit16 v7, v5, 0xc00

    move/from16 v12, p3

    if-nez v7, :cond_7

    invoke-interface {v13, v12}, Lbxb;->E(Z)Z

    move-result v7

    if-eq v4, v7, :cond_6

    const/16 v7, 0x400

    goto :goto_5

    :cond_6
    const/16 v7, 0x800

    :goto_5
    or-int/2addr v0, v7

    :cond_7
    and-int/lit16 v7, v0, 0x493

    const/16 v8, 0x492

    const/4 v9, 0x0

    if-eq v7, v8, :cond_8

    move v7, v4

    goto :goto_6

    :cond_8
    move v7, v9

    :goto_6
    and-int/lit8 v8, v0, 0x1

    invoke-interface {v13, v7, v8}, Lbxb;->J(ZI)Z

    move-result v7

    if-eqz v7, :cond_a

    const/high16 v7, 0x40800000    # 4.0f

    const/high16 v8, 0x42400000    # 48.0f

    const/high16 v10, 0x42700000    # 60.0f

    const/4 v11, 0x0

    if-eqz v3, :cond_9

    const v14, -0x143da0f7

    invoke-interface {v13, v14}, Lbxb;->w(I)V

    sget-object v14, Lcio;->e:Lcil;

    sget-wide v15, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    invoke-static {v14, v11, v10, v4}, Lvz;->ac(Lcio;FFI)Lcio;

    move-result-object v4

    invoke-static {v4}, Lavw;->g(Lcio;)Lcio;

    move-result-object v4

    invoke-static {v4, v8}, Lavw;->f(Lcio;F)Lcio;

    move-result-object v4

    sget-object v8, Lcib;->f:Lcid;

    sget-object v10, Lcib;->d:Lcid;

    const v14, 0x7f080318

    invoke-static {v14, v13, v9}, Ldbz;->i(ILbxb;I)Lcov;

    move-result-object v14

    const v15, 0x7f080317

    invoke-static {v15, v13, v9}, Ldbz;->i(ILbxb;I)Lcov;

    move-result-object v9

    invoke-static {v7, v11, v2}, Lvz;->ab(FFI)Lavm;

    move-result-object v2

    move-object v7, v13

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->X()V

    move-object v11, v8

    move-object v8, v2

    move-object v2, v9

    move-object v9, v11

    goto :goto_7

    :cond_9
    const v14, -0x1435a335

    invoke-interface {v13, v14}, Lbxb;->w(I)V

    sget-object v14, Lcio;->e:Lcil;

    sget-wide v15, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    invoke-static {v14, v10, v11, v2}, Lvz;->ac(Lcio;FFI)Lcio;

    move-result-object v2

    invoke-static {v2}, Lavw;->i(Lcio;)Lcio;

    move-result-object v2

    invoke-static {v2, v8}, Lavw;->a(Lcio;F)Lcio;

    move-result-object v2

    sget-object v8, Lcib;->h:Lcid;

    sget-object v10, Lcib;->b:Lcid;

    const v14, 0x7f080315

    invoke-static {v14, v13, v9}, Ldbz;->i(ILbxb;I)Lcov;

    move-result-object v14

    const v15, 0x7f080319

    invoke-static {v15, v13, v9}, Ldbz;->i(ILbxb;I)Lcov;

    move-result-object v9

    invoke-static {v11, v7, v4}, Lvz;->ab(FFI)Lavm;

    move-result-object v4

    move-object v7, v13

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->X()V

    move-object v11, v4

    move-object v4, v2

    move-object v2, v9

    move-object v9, v8

    move-object v8, v11

    :goto_7
    move-object v15, v10

    move-object v11, v14

    sget-object v7, Lcio;->e:Lcil;

    invoke-interface {v1, v7, v9}, Lauc;->a(Lcio;Lcid;)Lcio;

    move-result-object v10

    invoke-interface {v10, v4}, Lcio;->a(Lcio;)Lcio;

    move-result-object v10

    shr-int/lit8 v14, v0, 0x3

    shl-int/lit8 v0, v0, 0x9

    and-int/lit8 v14, v14, 0xe

    const v16, 0x40030

    or-int v14, v14, v16

    const/high16 v16, 0x380000

    and-int v0, v0, v16

    or-int/2addr v14, v0

    move-object v0, v7

    const/4 v7, 0x1

    invoke-static/range {v6 .. v14}, Lqkj;->C(Lbbb;ZLavm;Lcid;Lcio;Lcov;ZLbxb;I)V

    invoke-interface {v1, v0, v15}, Lauc;->a(Lcio;Lcid;)Lcio;

    move-result-object v0

    invoke-interface {v0, v4}, Lcio;->a(Lcio;)Lcio;

    move-result-object v10

    const/4 v7, 0x0

    move-object/from16 v6, p1

    move/from16 v12, p3

    move-object v11, v2

    move-object v9, v15

    invoke-static/range {v6 .. v14}, Lqkj;->C(Lbbb;ZLavm;Lcid;Lcio;Lcov;ZLbxb;I)V

    goto :goto_8

    :cond_a
    invoke-interface {v13}, Lbxb;->s()V

    :goto_8
    invoke-interface {v13}, Lbxb;->K()Lbzo;

    move-result-object v7

    if-eqz v7, :cond_b

    new-instance v0, Lknb;

    const/4 v6, 0x2

    move-object/from16 v2, p1

    move/from16 v4, p3

    invoke-direct/range {v0 .. v6}, Lknb;-><init>(Lauc;Lbbb;ZZII)V

    iput-object v0, v7, Lbzo;->c:Ladgm;

    :cond_b
    return-void
.end method

.method public static E(Lbbb;IZLadgn;Lbxb;I)V
    .locals 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 v0, p5, 0x6

    const v1, -0x428f79b0

    invoke-interface {p4, v1}, Lbxb;->b(I)Lbxb;

    move-result-object p4

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-nez v0, :cond_1

    invoke-interface {p4, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v2, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    or-int/2addr v0, p5

    goto :goto_1

    :cond_1
    move v0, p5

    :goto_1
    and-int/lit8 v3, p5, 0x30

    const/16 v4, 0x20

    if-nez v3, :cond_3

    invoke-interface {p4, p1}, Lbxb;->B(I)Z

    move-result v3

    if-eq v2, v3, :cond_2

    const/16 v3, 0x10

    goto :goto_2

    :cond_2
    move v3, v4

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit16 v3, p5, 0x180

    const/16 v5, 0x100

    if-nez v3, :cond_5

    invoke-interface {p4, p2}, Lbxb;->E(Z)Z

    move-result v3

    if-eq v2, v3, :cond_4

    const/16 v3, 0x80

    goto :goto_3

    :cond_4
    move v3, v5

    :goto_3
    or-int/2addr v0, v3

    :cond_5
    and-int/lit16 v3, p5, 0xc00

    const/16 v6, 0x800

    if-nez v3, :cond_7

    invoke-interface {p4, p3}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_6

    const/16 v3, 0x400

    goto :goto_4

    :cond_6
    move v3, v6

    :goto_4
    or-int/2addr v0, v3

    :cond_7
    and-int/lit16 v3, v0, 0x493

    const/16 v7, 0x492

    const/4 v8, 0x0

    if-eq v3, v7, :cond_8

    move v3, v2

    goto :goto_5

    :cond_8
    move v3, v8

    :goto_5
    and-int/lit8 v7, v0, 0x1

    invoke-interface {p4, v3, v7}, Lbxb;->J(ZI)Z

    move-result v3

    if-eqz v3, :cond_f

    sget-object v3, Lcio;->e:Lcil;

    invoke-static {v3}, Lavw;->h(Lcio;)Lcio;

    move-result-object v3

    and-int/lit8 v7, v0, 0x70

    if-ne v7, v4, :cond_9

    move v4, v2

    goto :goto_6

    :cond_9
    move v4, v8

    :goto_6
    and-int/lit8 v7, v0, 0xe

    if-ne v7, v1, :cond_a

    move v1, v2

    goto :goto_7

    :cond_a
    move v1, v8

    :goto_7
    and-int/lit16 v7, v0, 0x380

    if-ne v7, v5, :cond_b

    move v5, v2

    goto :goto_8

    :cond_b
    move v5, v8

    :goto_8
    and-int/lit16 v0, v0, 0x1c00

    if-ne v0, v6, :cond_c

    goto :goto_9

    :cond_c
    move v2, v8

    :goto_9
    move-object v0, p4

    check-cast v0, Lbyb;

    invoke-virtual {v0}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v6

    or-int/2addr v1, v4

    or-int/2addr v1, v5

    or-int/2addr v1, v2

    if-nez v1, :cond_d

    sget-object v1, Lbxa;->a:Ljava/lang/Object;

    if-ne v6, v1, :cond_e

    :cond_d
    new-instance v6, Lqng;

    invoke-direct {v6, p1, p0, p2, p3}, Lqng;-><init>(ILbbb;ZLadgn;)V

    invoke-virtual {v0, v6}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_e
    check-cast v6, Ladgi;

    const/4 v0, 0x6

    invoke-static {v3, v6, p4, v0}, Lc;->n(Lcio;Ladgi;Lbxb;I)V

    goto :goto_a

    :cond_f
    invoke-interface {p4}, Lbxb;->s()V

    :goto_a
    invoke-interface {p4}, Lbxb;->K()Lbzo;

    move-result-object p4

    if-eqz p4, :cond_10

    new-instance v0, Lqni;

    const/4 v6, 0x1

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lqni;-><init>(Lbbb;IZLjava/lang/Object;II)V

    iput-object v0, p4, Lbzo;->c:Ladgm;

    :cond_10
    return-void
.end method

.method public static F(ZJLadfx;Lyeh;Ladgn;Ladgi;Ladgi;Lbxb;I)V
    .locals 24

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move/from16 v9, p9

    and-int/lit8 v0, v9, 0x6

    const v1, -0x711ced97

    move-object/from16 v2, p8

    invoke-interface {v2, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v1

    const/4 v2, 0x1

    move/from16 v10, p0

    if-nez v0, :cond_1

    invoke-interface {v1, v10}, Lbxb;->E(Z)Z

    move-result v0

    if-eq v2, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v9

    goto :goto_1

    :cond_1
    move v0, v9

    :goto_1
    and-int/lit8 v3, v9, 0x30

    move-wide/from16 v13, p1

    if-nez v3, :cond_3

    invoke-interface {v1, v13, v14}, Lbxb;->C(J)Z

    move-result v3

    if-eq v2, v3, :cond_2

    const/16 v3, 0x10

    goto :goto_2

    :cond_2
    const/16 v3, 0x20

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit16 v3, v9, 0x180

    move-object/from16 v11, p3

    if-nez v3, :cond_5

    invoke-interface {v1, v11}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_4

    const/16 v3, 0x80

    goto :goto_3

    :cond_4
    const/16 v3, 0x100

    :goto_3
    or-int/2addr v0, v3

    :cond_5
    and-int/lit16 v3, v9, 0xc00

    if-nez v3, :cond_8

    and-int/lit16 v3, v9, 0x1000

    if-nez v3, :cond_6

    invoke-interface {v1, v5}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_4

    :cond_6
    invoke-interface {v1, v5}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v3

    :goto_4
    if-eq v2, v3, :cond_7

    const/16 v3, 0x400

    goto :goto_5

    :cond_7
    const/16 v3, 0x800

    :goto_5
    or-int/2addr v0, v3

    :cond_8
    and-int/lit16 v3, v9, 0x6000

    if-nez v3, :cond_a

    invoke-interface {v1, v6}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_9

    const/16 v3, 0x2000

    goto :goto_6

    :cond_9
    const/16 v3, 0x4000

    :goto_6
    or-int/2addr v0, v3

    :cond_a
    const/high16 v3, 0x30000

    and-int/2addr v3, v9

    if-nez v3, :cond_c

    invoke-interface {v1, v7}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_b

    const/high16 v3, 0x10000

    goto :goto_7

    :cond_b
    const/high16 v3, 0x20000

    :goto_7
    or-int/2addr v0, v3

    :cond_c
    const/high16 v3, 0x180000

    and-int/2addr v3, v9

    if-nez v3, :cond_e

    invoke-interface {v1, v8}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_d

    const/high16 v3, 0x80000

    goto :goto_8

    :cond_d
    const/high16 v3, 0x100000

    :goto_8
    or-int/2addr v0, v3

    :cond_e
    const v3, 0x92493

    and-int/2addr v3, v0

    const v4, 0x92492

    if-eq v3, v4, :cond_f

    goto :goto_9

    :cond_f
    const/4 v2, 0x0

    :goto_9
    and-int/lit8 v3, v0, 0x1

    invoke-interface {v1, v2, v3}, Lbxb;->J(ZI)Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-static {v1}, Ldbz;->au(Lbxb;)Lbqx;

    move-result-object v2

    iget-object v2, v2, Lbqx;->d:Lbbv;

    sget-wide v18, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    sget-object v3, Lcio;->e:Lcil;

    sget v4, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->c:F

    invoke-static {v3, v4}, Lavw;->f(Lcio;F)Lcio;

    move-result-object v12

    new-instance v3, Lqna;

    invoke-direct {v3, v5, v7, v6, v8}, Lqna;-><init>(Lyeh;Ladgi;Ladgn;Ladgi;)V

    const v4, -0x1efa3c9c

    invoke-static {v4, v3, v1}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v20

    and-int/lit8 v3, v0, 0xe

    shr-int/lit8 v4, v0, 0x3

    shl-int/lit8 v0, v0, 0x6

    const v15, 0x30c00180

    or-int/2addr v3, v15

    and-int/lit8 v4, v4, 0x70

    or-int/2addr v3, v4

    and-int/lit16 v0, v0, 0x1c00

    or-int v22, v3, v0

    const/16 v23, 0x30

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v21, v1

    move-object/from16 v17, v2

    invoke-static/range {v10 .. v23}, Lvcr;->r(ZLadfx;Lcio;JLalw;Ldpq;Lcnc;JLadgn;Lbxb;II)V

    goto :goto_a

    :cond_10
    move-object/from16 v21, v1

    invoke-interface/range {v21 .. v21}, Lbxb;->s()V

    :goto_a
    invoke-interface/range {v21 .. v21}, Lbxb;->K()Lbzo;

    move-result-object v11

    if-eqz v11, :cond_11

    new-instance v0, Lsjh;

    const/4 v10, 0x1

    move/from16 v1, p0

    move-wide/from16 v2, p1

    move-object/from16 v4, p3

    invoke-direct/range {v0 .. v10}, Lsjh;-><init>(ZJLadfx;Lyeh;Ladgn;Ladgi;Ladgi;II)V

    iput-object v0, v11, Lbzo;->c:Ladgm;

    :cond_11
    return-void
.end method

.method public static G(Ladsh;Lbxb;I)V
    .locals 11

    and-int/lit8 v0, p2, 0x6

    const v1, -0x4ff662a4

    invoke-interface {p1, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v8

    const/4 p1, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_2

    and-int/lit8 v0, p2, 0x8

    if-nez v0, :cond_0

    invoke-interface {v8, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_0
    invoke-interface {v8, p0}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    if-eq v1, v0, :cond_1

    move v0, p1

    goto :goto_1

    :cond_1
    const/4 v0, 0x4

    :goto_1
    or-int/2addr v0, p2

    goto :goto_2

    :cond_2
    move v0, p2

    :goto_2
    and-int/lit8 v2, v0, 0x3

    if-eq v2, p1, :cond_3

    move p1, v1

    goto :goto_3

    :cond_3
    const/4 p1, 0x0

    :goto_3
    and-int/2addr v0, v1

    invoke-interface {v8, p1, v0}, Lbxb;->J(ZI)Z

    move-result p1

    if-eqz p1, :cond_6

    if-nez p0, :cond_4

    invoke-interface {v8}, Lbxb;->K()Lbzo;

    move-result-object p0

    if-eqz p0, :cond_7

    new-instance p1, Lkng;

    const/4 v0, 0x3

    invoke-direct {p1, p2, v0}, Lkng;-><init>(II)V

    iput-object p1, p0, Lbzo;->c:Ladgm;

    return-void

    :cond_4
    invoke-static {p0, v8}, Ldxl;->f(Ladsh;Lbxb;)Lcau;

    move-result-object p1

    sget-object v0, Ldcy;->g:Lbxj;

    invoke-interface {v8, v0}, Lbxb;->e(Lbxj;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lovu;

    invoke-static {p1}, Lqkj;->y(Lcau;)Lqnu;

    move-result-object v1

    iget-object v1, v1, Lqnu;->b:Lyeh;

    invoke-virtual {v1}, Lyeh;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v8}, Lbxb;->K()Lbzo;

    move-result-object p1

    if-eqz p1, :cond_7

    new-instance v0, Lkml;

    const/16 v1, 0xd

    invoke-direct {v0, p0, p2, v1}, Lkml;-><init>(Ljava/lang/Object;II)V

    iput-object v0, p1, Lbzo;->c:Ladgm;

    return-void

    :cond_5
    invoke-static {p1}, Lqkj;->y(Lcau;)Lqnu;

    move-result-object v1

    iget-boolean v2, v1, Lqnu;->d:Z

    sget-object v4, Ladm;->a:Ladm;

    sget-object v5, Ladn;->a:Ladn;

    new-instance v1, Lqnc;

    invoke-direct {v1, p1, v0}, Lqnc;-><init>(Lcau;Lovu;)V

    const p1, 0x7c86c234

    invoke-static {p1, v1, v8}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v7

    const/high16 v9, 0x30000

    const/16 v10, 0x12

    const/4 v3, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v10}, Lvz;->aO(ZLcio;Ladm;Ladn;Ljava/lang/String;Ladgn;Lbxb;II)V

    goto :goto_4

    :cond_6
    invoke-interface {v8}, Lbxb;->s()V

    :goto_4
    invoke-interface {v8}, Lbxb;->K()Lbzo;

    move-result-object p1

    if-eqz p1, :cond_7

    new-instance v0, Lkml;

    const/16 v1, 0xe

    invoke-direct {v0, p0, p2, v1}, Lkml;-><init>(Ljava/lang/Object;II)V

    iput-object v0, p1, Lbzo;->c:Ladgm;

    :cond_7
    return-void
.end method

.method public static H(Lbbb;IZLadfx;Lbxb;I)V
    .locals 12

    move/from16 v5, p5

    and-int/lit8 v0, v5, 0x6

    const v1, -0x1ae76d8d

    move-object/from16 v2, p4

    invoke-interface {v2, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v10

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-interface {v10, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v1, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v5

    goto :goto_1

    :cond_1
    move v0, v5

    :goto_1
    and-int/lit8 v2, v5, 0x30

    if-nez v2, :cond_3

    invoke-interface {v10, p1}, Lbxb;->B(I)Z

    move-result v2

    if-eq v1, v2, :cond_2

    const/16 v2, 0x10

    goto :goto_2

    :cond_2
    const/16 v2, 0x20

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit16 v2, v5, 0x180

    if-nez v2, :cond_5

    invoke-interface {v10, p2}, Lbxb;->E(Z)Z

    move-result v2

    if-eq v1, v2, :cond_4

    const/16 v2, 0x80

    goto :goto_3

    :cond_4
    const/16 v2, 0x100

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v5, 0xc00

    const/16 v3, 0x800

    if-nez v2, :cond_7

    invoke-interface {v10, p3}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_6

    const/16 v2, 0x400

    goto :goto_4

    :cond_6
    move v2, v3

    :goto_4
    or-int/2addr v0, v2

    :cond_7
    and-int/lit16 v2, v0, 0x493

    const/16 v4, 0x492

    if-eq v2, v4, :cond_8

    goto :goto_5

    :cond_8
    const/4 v1, 0x0

    :goto_5
    and-int/lit8 v2, v0, 0x1

    invoke-interface {v10, v1, v2}, Lbxb;->J(ZI)Z

    move-result v1

    if-eqz v1, :cond_b

    and-int/lit16 v1, v0, 0x1c00

    move-object v2, v10

    check-cast v2, Lbyb;

    invoke-virtual {v2}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v4

    if-eq v1, v3, :cond_9

    sget-object v1, Lbxa;->a:Ljava/lang/Object;

    if-ne v4, v1, :cond_a

    :cond_9
    new-instance v4, Lkoy;

    const/16 v1, 0x8

    invoke-direct {v4, p3, v1}, Lkoy;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2, v4}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_a
    and-int/lit16 v11, v0, 0x3fe

    move-object v9, v4

    check-cast v9, Ladgn;

    move-object v6, p0

    move v7, p1

    move v8, p2

    invoke-static/range {v6 .. v11}, Lqkj;->E(Lbbb;IZLadgn;Lbxb;I)V

    goto :goto_6

    :cond_b
    invoke-interface {v10}, Lbxb;->s()V

    :goto_6
    invoke-interface {v10}, Lbxb;->K()Lbzo;

    move-result-object v7

    if-eqz v7, :cond_c

    new-instance v0, Lqni;

    const/4 v6, 0x0

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Lqni;-><init>(Lbbb;IZLjava/lang/Object;II)V

    iput-object v0, v7, Lbzo;->c:Ladgm;

    :cond_c
    return-void
.end method

.method public static I(Lbbb;ZLcio;Ladfx;ZLadgo;Lbxb;I)V
    .locals 22

    move/from16 v7, p7

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p5 .. p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 v0, v7, 0x6

    const v1, 0x20be61fc

    move-object/from16 v2, p6

    invoke-interface {v2, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v13

    const/4 v1, 0x1

    if-nez v0, :cond_1

    move-object/from16 v0, p0

    invoke-interface {v13, v0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v2, 0x4

    :goto_0
    or-int/2addr v2, v7

    goto :goto_1

    :cond_1
    move-object/from16 v0, p0

    move v2, v7

    :goto_1
    and-int/lit8 v3, v7, 0x30

    if-nez v3, :cond_3

    move/from16 v3, p1

    invoke-interface {v13, v3}, Lbxb;->E(Z)Z

    move-result v4

    if-eq v1, v4, :cond_2

    const/16 v4, 0x10

    goto :goto_2

    :cond_2
    const/16 v4, 0x20

    :goto_2
    or-int/2addr v2, v4

    goto :goto_3

    :cond_3
    move/from16 v3, p1

    :goto_3
    and-int/lit16 v4, v7, 0x180

    if-nez v4, :cond_5

    move-object/from16 v4, p2

    invoke-interface {v13, v4}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v5

    if-eq v1, v5, :cond_4

    const/16 v5, 0x80

    goto :goto_4

    :cond_4
    const/16 v5, 0x100

    :goto_4
    or-int/2addr v2, v5

    goto :goto_5

    :cond_5
    move-object/from16 v4, p2

    :goto_5
    and-int/lit16 v5, v7, 0xc00

    if-nez v5, :cond_7

    move-object/from16 v5, p3

    invoke-interface {v13, v5}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v6

    if-eq v1, v6, :cond_6

    const/16 v6, 0x400

    goto :goto_6

    :cond_6
    const/16 v6, 0x800

    :goto_6
    or-int/2addr v2, v6

    goto :goto_7

    :cond_7
    move-object/from16 v5, p3

    :goto_7
    and-int/lit16 v6, v7, 0x6000

    if-nez v6, :cond_9

    move/from16 v6, p4

    invoke-interface {v13, v6}, Lbxb;->E(Z)Z

    move-result v8

    if-eq v1, v8, :cond_8

    const/16 v8, 0x2000

    goto :goto_8

    :cond_8
    const/16 v8, 0x4000

    :goto_8
    or-int/2addr v2, v8

    goto :goto_9

    :cond_9
    move/from16 v6, p4

    :goto_9
    const/high16 v8, 0x30000

    and-int/2addr v8, v7

    if-nez v8, :cond_b

    move-object/from16 v8, p5

    invoke-interface {v13, v8}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v9

    if-eq v1, v9, :cond_a

    const/high16 v9, 0x10000

    goto :goto_a

    :cond_a
    const/high16 v9, 0x20000

    :goto_a
    or-int/2addr v2, v9

    goto :goto_b

    :cond_b
    move-object/from16 v8, p5

    :goto_b
    const v9, 0x12493

    and-int/2addr v9, v2

    const v10, 0x12492

    if-eq v9, v10, :cond_c

    goto :goto_c

    :cond_c
    const/4 v1, 0x0

    :goto_c
    and-int/lit8 v9, v2, 0x1

    invoke-interface {v13, v1, v9}, Lbxb;->J(ZI)Z

    move-result v1

    if-eqz v1, :cond_d

    sget-object v1, Lcio;->e:Lcil;

    invoke-static {v1}, Lavw;->h(Lcio;)Lcio;

    move-result-object v14

    const/16 v20, 0x1

    const v21, 0xeffff

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v14 .. v21}, Lcbf;->J(Lcio;FFFLcnc;ZII)Lcio;

    move-result-object v1

    sget-wide v9, Lclz;->a:J

    invoke-static {v1, v9, v10}, Lvz;->an(Lcio;J)Lcio;

    move-result-object v15

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    new-instance v14, Lqne;

    move-object/from16 v19, p5

    move-object/from16 v18, v0

    move/from16 v20, v3

    move-object/from16 v16, v4

    move-object/from16 v17, v5

    move/from16 v21, v6

    invoke-direct/range {v14 .. v21}, Lqne;-><init>(Lcio;Lcio;Ladfx;Lbbb;Ladgo;ZZ)V

    const v0, 0x1e6ed5fb

    invoke-static {v0, v14, v13}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v12

    shr-int/lit8 v0, v2, 0x3

    and-int/lit8 v0, v0, 0xe

    or-int/lit16 v14, v0, 0x6000

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v8 .. v14}, La;->aF(Ljava/lang/Object;Lcio;Lafk;Ljava/lang/String;Ladgn;Lbxb;I)V

    goto :goto_d

    :cond_d
    invoke-interface {v13}, Lbxb;->s()V

    :goto_d
    invoke-interface {v13}, Lbxb;->K()Lbzo;

    move-result-object v9

    if-eqz v9, :cond_e

    new-instance v0, Lqnf;

    const/4 v8, 0x0

    move-object/from16 v1, p0

    move/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    invoke-direct/range {v0 .. v8}, Lqnf;-><init>(Lbbb;ZLcio;Ladfx;ZLadgo;II)V

    iput-object v0, v9, Lbzo;->c:Ladgm;

    :cond_e
    return-void
.end method

.method public static J(Lbbb;ZLadfx;Ladfx;Lcio;ZLbxb;I)V
    .locals 14

    move-object/from16 v8, p3

    move/from16 v9, p7

    and-int/lit8 v2, v9, 0x6

    const v3, -0x276b9264

    move-object/from16 v4, p6

    invoke-interface {v4, v3}, Lbxb;->b(I)Lbxb;

    move-result-object v6

    const/4 v3, 0x1

    if-nez v2, :cond_1

    invoke-interface {v6, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v2

    if-eq v3, v2, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v2, 0x4

    :goto_0
    or-int/2addr v2, v9

    goto :goto_1

    :cond_1
    move v2, v9

    :goto_1
    and-int/lit8 v4, v9, 0x30

    if-nez v4, :cond_3

    invoke-interface {v6, p1}, Lbxb;->E(Z)Z

    move-result v4

    if-eq v3, v4, :cond_2

    const/16 v4, 0x10

    goto :goto_2

    :cond_2
    const/16 v4, 0x20

    :goto_2
    or-int/2addr v2, v4

    :cond_3
    and-int/lit16 v4, v9, 0x180

    if-nez v4, :cond_5

    move-object/from16 v4, p2

    invoke-interface {v6, v4}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v5

    if-eq v3, v5, :cond_4

    const/16 v5, 0x80

    goto :goto_3

    :cond_4
    const/16 v5, 0x100

    :goto_3
    or-int/2addr v2, v5

    goto :goto_4

    :cond_5
    move-object/from16 v4, p2

    :goto_4
    and-int/lit16 v5, v9, 0xc00

    if-nez v5, :cond_7

    invoke-interface {v6, v8}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v5

    if-eq v3, v5, :cond_6

    const/16 v5, 0x400

    goto :goto_5

    :cond_6
    const/16 v5, 0x800

    :goto_5
    or-int/2addr v2, v5

    :cond_7
    and-int/lit16 v5, v9, 0x6000

    if-nez v5, :cond_9

    move-object/from16 v5, p4

    invoke-interface {v6, v5}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    if-eq v3, v7, :cond_8

    const/16 v7, 0x2000

    goto :goto_6

    :cond_8
    const/16 v7, 0x4000

    :goto_6
    or-int/2addr v2, v7

    goto :goto_7

    :cond_9
    move-object/from16 v5, p4

    :goto_7
    const/high16 v7, 0x30000

    and-int v10, v9, v7

    if-nez v10, :cond_b

    move/from16 v10, p5

    invoke-interface {v6, v10}, Lbxb;->E(Z)Z

    move-result v11

    if-eq v3, v11, :cond_a

    const/high16 v11, 0x10000

    goto :goto_8

    :cond_a
    const/high16 v11, 0x20000

    :goto_8
    or-int/2addr v2, v11

    goto :goto_9

    :cond_b
    move/from16 v10, p5

    :goto_9
    const v11, 0x12493

    and-int/2addr v11, v2

    const v12, 0x12492

    if-eq v11, v12, :cond_c

    goto :goto_a

    :cond_c
    const/4 v3, 0x0

    :goto_a
    and-int/lit8 v11, v2, 0x1

    invoke-interface {v6, v3, v11}, Lbxb;->J(ZI)Z

    move-result v3

    if-eqz v3, :cond_d

    new-instance v3, Lqnj;

    invoke-direct {v3, p0, p1, v8}, Lqnj;-><init>(Lbbb;ZLadfx;)V

    const v11, 0x506d6579

    invoke-static {v11, v3, v6}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v3

    and-int/lit8 v11, v2, 0xe

    or-int/2addr v7, v11

    and-int/lit8 v11, v2, 0x70

    shr-int/lit8 v12, v2, 0x6

    shl-int/lit8 v13, v2, 0x3

    shr-int/lit8 v2, v2, 0x3

    or-int/2addr v7, v11

    and-int/lit16 v11, v12, 0x380

    or-int/2addr v7, v11

    and-int/lit16 v11, v13, 0x1c00

    or-int/2addr v7, v11

    const v11, 0xe000

    and-int/2addr v2, v11

    or-int/2addr v7, v2

    move-object v0, p0

    move v1, p1

    move-object v2, v5

    move-object v5, v3

    move-object v3, v4

    move v4, v10

    invoke-static/range {v0 .. v7}, Lqkj;->I(Lbbb;ZLcio;Ladfx;ZLadgo;Lbxb;I)V

    goto :goto_b

    :cond_d
    invoke-interface {v6}, Lbxb;->s()V

    :goto_b
    invoke-interface {v6}, Lbxb;->K()Lbzo;

    move-result-object v10

    if-eqz v10, :cond_e

    new-instance v0, Lqnf;

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move v7, v9

    invoke-direct/range {v0 .. v8}, Lqnf;-><init>(Lbbb;ZLadfx;Ladfx;Lcio;ZII)V

    iput-object v0, v10, Lbzo;->c:Ladgm;

    :cond_e
    return-void
.end method

.method public static K(Lqlh;Lbxb;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lqkj;->O(Lqlh;)I

    move-result p0

    invoke-static {p0, p1}, Ldcm;->d(ILbxb;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static L(Lags;Lbxb;)Lafk;
    .locals 1

    invoke-interface {p0}, Lags;->c()Ljava/lang/Object;

    move-result-object p0

    sget-object v0, Ladd;->b:Ladd;

    if-ne p0, v0, :cond_0

    const p0, 0x607763aa

    invoke-interface {p1, p0}, Lbxb;->w(I)V

    invoke-static {p1}, Ldbz;->at(Lbxb;)Lbqc;

    move-result-object p0

    invoke-interface {p0}, Lbqc;->b()Lafk;

    move-result-object p0

    invoke-interface {p1}, Lbxb;->o()V

    return-object p0

    :cond_0
    const p0, 0x60785e73

    invoke-interface {p1, p0}, Lbxb;->w(I)V

    invoke-interface {p1}, Lbxb;->o()V

    sget-object p0, Lbqb;->b:Lagj;

    return-object p0
.end method

.method public static M(Lqlh;)F
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lqlc;->a:Lqlc;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lqkx;->a:Lqkx;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lqlf;->a:Lqlf;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method

.method public static N(Lqlh;)F
    .locals 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lqkz;->a:Lqkz;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const v1, 0x3f333333    # 0.7f

    if-eqz v0, :cond_0

    return v1

    :cond_0
    sget-object v0, Lqky;->a:Lqky;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 p0, 0x3e800000    # 0.25f

    return p0

    :cond_1
    sget-object v0, Lqld;->a:Lqld;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const v2, 0x3f4ccccd    # 0.8f

    if-eqz v0, :cond_2

    return v2

    :cond_2
    sget-object v0, Lqla;->a:Lqla;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v1

    :cond_3
    sget-object v0, Lqkw;->a:Lqkw;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/high16 p0, 0x3f000000    # 0.5f

    return p0

    :cond_4
    sget-object v0, Lqku;->a:Lqku;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    return v2

    :cond_5
    sget-object v0, Lqlc;->a:Lqlc;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const p0, 0x3eb33333    # 0.35f

    return p0

    :cond_6
    sget-object v0, Lqlf;->a:Lqlf;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_7
    const p0, 0x3f19999a    # 0.6f

    return p0
.end method

.method public static O(Lqlh;)I
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lqkv;->a:Lqkv;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const p0, 0x7f13082b

    return p0

    :cond_0
    sget-object v0, Lqkz;->a:Lqkz;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const p0, 0x7f13083a

    return p0

    :cond_1
    sget-object v0, Lqky;->a:Lqky;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const p0, 0x7f130838

    return p0

    :cond_2
    sget-object v0, Lqld;->a:Lqld;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const p0, 0x7f130846

    return p0

    :cond_3
    sget-object v0, Lqla;->a:Lqla;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const p0, 0x7f13083f

    return p0

    :cond_4
    sget-object v0, Lqkw;->a:Lqkw;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const p0, 0x7f13082d

    return p0

    :cond_5
    sget-object v0, Lqku;->a:Lqku;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const p0, 0x7f130829

    return p0

    :cond_6
    sget-object v0, Lqlg;->a:Lqlg;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const p0, 0x7f13084a

    return p0

    :cond_7
    sget-object v0, Lqle;->a:Lqle;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const p0, 0x7f130847

    return p0

    :cond_8
    sget-object v0, Lqlb;->a:Lqlb;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const p0, 0x7f130842

    return p0

    :cond_9
    sget-object v0, Lqlc;->a:Lqlc;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const p0, 0x7f130844

    return p0

    :cond_a
    sget-object v0, Lqkx;->a:Lqkx;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const p0, 0x7f130835

    return p0

    :cond_b
    sget-object v0, Lqlf;->a:Lqlf;

    invoke-static {p0, v0}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    const p0, 0x7f130849

    return p0

    :cond_c
    new-instance p0, Ladcb;

    invoke-direct {p0}, Ladcb;-><init>()V

    throw p0
.end method

.method public static P(Lbyw;)Lqlh;
    .locals 0

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqlh;

    return-object p0
.end method

.method public static Q(Lbxb;I)V
    .locals 11

    const v0, 0x19edcc88

    invoke-interface {p0, v0}, Lbxb;->b(I)Lbxb;

    move-result-object v7

    const/4 p0, 0x1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    move v1, p0

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    and-int/lit8 v2, p1, 0x1

    invoke-interface {v7, v1, v2}, Lbxb;->J(ZI)Z

    move-result v1

    const/4 v10, 0x2

    if-eqz v1, :cond_3

    sget-object v1, Lcio;->e:Lcil;

    invoke-static {v1}, Lavw;->h(Lcio;)Lcio;

    move-result-object v1

    sget-wide v2, Lclz;->g:J

    invoke-static {v1, v2, v3}, Lvz;->an(Lcio;J)Lcio;

    move-result-object v1

    sget-object v2, Lcib;->e:Lcid;

    invoke-static {v2, v0}, Laty;->b(Lcid;Z)Lcvu;

    move-result-object v2

    invoke-static {v7}, Ldbz;->ai(Lbxb;)J

    move-result-wide v3

    invoke-static {v3, v4}, La;->e(J)I

    move-result v3

    move-object v4, v7

    check-cast v4, Lbyb;

    invoke-virtual {v4}, Lbyb;->ah()Lcfh;

    move-result-object v5

    invoke-static {v7, v1}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v1

    sget-object v6, Lcyc;->a:Ladfx;

    invoke-interface {v7}, Lbxb;->x()V

    iget-boolean v8, v4, Lbyb;->t:Z

    if-eqz v8, :cond_1

    invoke-interface {v7, v6}, Lbxb;->j(Ladfx;)V

    goto :goto_1

    :cond_1
    invoke-interface {v7}, Lbxb;->z()V

    :goto_1
    sget-object v6, Lcyc;->e:Ladgm;

    invoke-static {v7, v2, v6}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v2, Lcyc;->d:Ladgm;

    invoke-static {v7, v5, v2}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lcyc;->f:Ladgm;

    invoke-static {v7, v2, v3}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v2, Lcyc;->g:Ladgi;

    invoke-static {v7, v2}, Lcay;->b(Lbxb;Ladgi;)V

    sget-object v2, Lcyc;->c:Ladgm;

    invoke-static {v7, v1, v2}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-virtual {v4}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lbxa;->a:Ljava/lang/Object;

    if-ne v1, v2, :cond_2

    new-instance v1, Lagb;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v1, v2}, Lagb;-><init>(Ljava/lang/Object;)V

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Lagb;->d(Ljava/lang/Object;)V

    invoke-virtual {v4, v1}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_2
    check-cast v1, Lagb;

    const/16 p0, 0xc8

    const/4 v2, 0x5

    const/4 v3, 0x0

    invoke-static {v0, p0, v3, v2}, Lvz;->aK(IILafh;I)Lahd;

    move-result-object p0

    invoke-static {p0, v10}, Ladj;->g(Lafk;I)Ladm;

    move-result-object p0

    const/4 v0, 0x3

    invoke-static {v3, v0}, Ladj;->h(Lafk;I)Ladn;

    move-result-object v4

    sget-object v6, Lqlj;->c:Ladgn;

    const v8, 0x30d80

    const/16 v9, 0x12

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v3, p0

    invoke-static/range {v1 .. v9}, Lvz;->aN(Lagb;Lcio;Ladm;Ladn;Ljava/lang/String;Ladgn;Lbxb;II)V

    invoke-interface {v7}, Lbxb;->n()V

    goto :goto_2

    :cond_3
    invoke-interface {v7}, Lbxb;->s()V

    :goto_2
    invoke-interface {v7}, Lbxb;->K()Lbzo;

    move-result-object p0

    if-eqz p0, :cond_4

    new-instance v0, Lkng;

    invoke-direct {v0, p1, v10}, Lkng;-><init>(II)V

    iput-object v0, p0, Lbzo;->c:Ladgm;

    :cond_4
    return-void
.end method

.method public static R(ZLadgi;Lbxb;I)V
    .locals 13

    move/from16 v12, p3

    and-int/lit8 v0, v12, 0x6

    const v1, -0x67bd288b

    move-object v2, p2

    invoke-interface {p2, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v9

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-interface {v9, p0}, Lbxb;->E(Z)Z

    move-result v0

    if-eq v1, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v12

    goto :goto_1

    :cond_1
    move v0, v12

    :goto_1
    and-int/lit8 v2, v12, 0x30

    if-nez v2, :cond_3

    invoke-interface {v9, p1}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_2

    const/16 v2, 0x10

    goto :goto_2

    :cond_2
    const/16 v2, 0x20

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit8 v2, v0, 0x13

    const/16 v3, 0x12

    if-eq v2, v3, :cond_4

    goto :goto_3

    :cond_4
    const/4 v1, 0x0

    :goto_3
    and-int/lit8 v2, v0, 0x1

    invoke-interface {v9, v1, v2}, Lbxb;->J(ZI)Z

    move-result v1

    if-eqz v1, :cond_6

    shl-int/lit8 v0, v0, 0x18

    invoke-static {v9}, Laxn;->a(Lbxb;)Laxl;

    move-result-object v1

    const/high16 v2, 0x70000000

    and-int/2addr v0, v2

    or-int/lit16 v10, v0, 0x6000

    const/high16 v0, 0x41000000    # 8.0f

    if-eqz p0, :cond_5

    const v2, -0x358eefdb

    invoke-interface {v9, v2}, Lbxb;->w(I)V

    invoke-static {v0}, Lats;->e(F)Latm;

    move-result-object v3

    const/4 v7, 0x0

    const/16 v11, 0x1ed

    const/4 v0, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v8, p1

    invoke-static/range {v0 .. v11}, Lvz;->N(Lcio;Laxl;Lavm;Latl;Lcih;Lapm;ZLajr;Ladgi;Lbxb;II)V

    move-object v0, v9

    check-cast v0, Lbyb;

    invoke-virtual {v0}, Lbyb;->X()V

    goto :goto_4

    :cond_5
    const v2, -0x358cc97c    # -3984801.0f

    invoke-interface {v9, v2}, Lbxb;->w(I)V

    invoke-static {v0}, Lats;->e(F)Latm;

    move-result-object v3

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v0, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v8, p1

    invoke-static/range {v0 .. v10}, Lvz;->O(Lcio;Laxl;Lavm;Latr;Lcic;Lapm;ZLajr;Ladgi;Lbxb;I)V

    move-object v0, v9

    check-cast v0, Lbyb;

    invoke-virtual {v0}, Lbyb;->X()V

    goto :goto_4

    :cond_6
    invoke-interface {v9}, Lbxb;->s()V

    :goto_4
    invoke-interface {v9}, Lbxb;->K()Lbzo;

    move-result-object v0

    if-eqz v0, :cond_7

    new-instance v1, Lbdl;

    const/4 v2, 0x5

    invoke-direct {v1, p0, p1, v12, v2}, Lbdl;-><init>(ZLjava/lang/Object;II)V

    iput-object v1, v0, Lbzo;->c:Ladgm;

    :cond_7
    return-void
.end method

.method public static S(Lqlh;Ladfx;Ladgi;Lbxb;I)V
    .locals 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 v0, p4, 0x6

    const v1, -0x6624469a

    invoke-interface {p3, v1}, Lbxb;->b(I)Lbxb;

    move-result-object p3

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-interface {p3, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v1, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, p4

    goto :goto_1

    :cond_1
    move v0, p4

    :goto_1
    and-int/lit8 v2, p4, 0x30

    if-nez v2, :cond_3

    invoke-interface {p3, p1}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_2

    const/16 v2, 0x10

    goto :goto_2

    :cond_2
    const/16 v2, 0x20

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit16 v2, p4, 0x180

    if-nez v2, :cond_5

    invoke-interface {p3, p2}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_4

    const/16 v2, 0x80

    goto :goto_3

    :cond_4
    const/16 v2, 0x100

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v0, 0x93

    const/16 v3, 0x92

    if-eq v2, v3, :cond_6

    move v2, v1

    goto :goto_4

    :cond_6
    const/4 v2, 0x0

    :goto_4
    and-int/2addr v0, v1

    invoke-interface {p3, v2, v0}, Lbxb;->J(ZI)Z

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Lbgl;

    const/4 v1, 0x7

    invoke-direct {v0, p0, p1, p2, v1}, Lbgl;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    const v1, -0x1a70b6c4

    invoke-static {v1, v0, p3}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v0, p3, v1}, Lkbo;->a(Ladgm;Lbxb;I)V

    goto :goto_5

    :cond_7
    invoke-interface {p3}, Lbxb;->s()V

    :goto_5
    invoke-interface {p3}, Lbxb;->K()Lbzo;

    move-result-object p3

    if-eqz p3, :cond_8

    new-instance v0, Lamm;

    const/16 v5, 0x14

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v6}, Lamm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II[B)V

    iput-object v0, p3, Lbzo;->c:Ladgm;

    :cond_8
    return-void
.end method

.method public static T(Lbyw;Lqlh;)V
    .locals 0

    invoke-interface {p0, p1}, Lbyw;->h(Ljava/lang/Object;)V

    return-void
.end method

.method public static U(Lqlh;ZLbxb;I)V
    .locals 24

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p3

    and-int/lit8 v3, v2, 0x6

    const v4, -0x5b28b32b

    move-object/from16 v5, p2

    invoke-interface {v5, v4}, Lbxb;->b(I)Lbxb;

    move-result-object v4

    const/4 v6, 0x1

    if-nez v3, :cond_1

    invoke-interface {v4, v0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v3

    if-eq v6, v3, :cond_0

    const/4 v3, 0x2

    goto :goto_0

    :cond_0
    const/4 v3, 0x4

    :goto_0
    or-int/2addr v3, v2

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    and-int/lit8 v7, v2, 0x30

    const/16 v8, 0x20

    if-nez v7, :cond_3

    invoke-interface {v4, v1}, Lbxb;->E(Z)Z

    move-result v7

    if-eq v6, v7, :cond_2

    const/16 v7, 0x10

    goto :goto_2

    :cond_2
    move v7, v8

    :goto_2
    or-int/2addr v3, v7

    :cond_3
    and-int/lit8 v7, v3, 0x13

    const/16 v9, 0x12

    if-eq v7, v9, :cond_4

    move v7, v6

    goto :goto_3

    :cond_4
    const/4 v7, 0x0

    :goto_3
    and-int/lit8 v9, v3, 0x1

    invoke-interface {v4, v7, v9}, Lbxb;->J(ZI)Z

    move-result v7

    if-eqz v7, :cond_10

    sget-object v7, Lqlk;->a:Lyeh;

    sget-object v7, Lqlk;->a:Lyeh;

    sget-wide v15, Lqlk;->b:J

    const-wide v11, 0xffffffffL

    and-long/2addr v11, v15

    shr-long v8, v15, v8

    const/4 v13, 0x3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object v14, v4

    check-cast v14, Lbyb;

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v6

    sget-object v10, Lbxa;->a:Ljava/lang/Object;

    if-ne v6, v10, :cond_5

    new-instance v6, Lqli;

    invoke-direct {v6, v13}, Lqli;-><init>(I)V

    invoke-virtual {v14, v6}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_5
    move-object/from16 v19, v6

    check-cast v19, Ladgm;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide/from16 v20, v11

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v12

    invoke-interface {v4, v7}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v11

    const/4 v5, 0x0

    if-nez v6, :cond_6

    if-ne v11, v10, :cond_7

    :cond_6
    new-instance v11, Ldqk;

    const/16 v6, 0x8

    invoke-direct {v11, v7, v6, v5}, Ldqk;-><init>(Ljava/lang/Object;I[[C)V

    invoke-virtual {v14, v11}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_7
    check-cast v11, Ladgi;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v6, -0x2cf621e

    invoke-interface {v4, v6}, Lbxb;->w(I)V

    sget-object v6, Ldca;->b:Lbxj;

    invoke-interface {v4, v6}, Lbxb;->e(Lbxj;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    invoke-interface {v4, v6}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v7, :cond_8

    if-ne v13, v10, :cond_9

    :cond_8
    invoke-static {v6}, Lhdw;->c(Landroid/content/Context;)Lhew;

    move-result-object v13

    invoke-virtual {v14, v13}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_9
    move-object v6, v13

    check-cast v6, Lhew;

    invoke-virtual {v14}, Lbyb;->X()V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v4, v6}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    invoke-interface {v4, v12}, Lbxb;->B(I)Z

    move-result v13

    or-int/2addr v7, v13

    invoke-interface {v4, v11}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v7, v13

    invoke-virtual {v14}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v7, :cond_b

    if-ne v13, v10, :cond_a

    goto :goto_4

    :cond_a
    move-object v7, v14

    move-wide/from16 v22, v20

    const/16 v20, 0x3

    move/from16 v21, v3

    goto :goto_5

    :cond_b
    :goto_4
    move-object v13, v11

    new-instance v11, Lhft;

    move-object v7, v14

    move-object/from16 v14, v19

    move-wide/from16 v22, v20

    const/16 v20, 0x3

    invoke-direct/range {v11 .. v16}, Lhft;-><init>(ILadgi;Ladgm;J)V

    move/from16 v21, v3

    new-instance v3, Lhek;

    move/from16 v18, v12

    new-instance v12, Ljgb;

    invoke-direct {v12, v6, v11, v5}, Ljgb;-><init>(Ljava/lang/Object;Ljava/lang/Object;[B)V

    new-instance v5, Lhfv;

    invoke-direct {v5, v11}, Lhfv;-><init>(Ljava/lang/Object;)V

    invoke-direct {v3, v6, v12, v5}, Lhek;-><init>(Lhew;Ljgb;Lhfv;)V

    new-instance v11, Lhfs;

    move/from16 v12, v18

    move-object/from16 v18, v3

    move-object v14, v6

    invoke-direct/range {v11 .. v19}, Lhfs;-><init>(ILadgi;Lhew;JLjava/lang/Integer;Lhek;Ladgm;)V

    invoke-virtual {v7, v11}, Lbyb;->ad(Ljava/lang/Object;)V

    move-object v13, v11

    :goto_5
    long-to-int v3, v8

    move-wide/from16 v5, v22

    long-to-int v5, v5

    check-cast v13, Lhfs;

    if-eqz v1, :cond_c

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    div-float/2addr v3, v5

    goto :goto_6

    :cond_c
    invoke-static {v5}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v5

    invoke-static {v3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v3

    div-float v3, v5, v3

    :goto_6
    and-int/lit8 v5, v21, 0xe

    const/4 v6, 0x4

    if-ne v5, v6, :cond_d

    const/4 v6, 0x1

    goto :goto_7

    :cond_d
    const/4 v6, 0x0

    :goto_7
    invoke-interface {v4, v13}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v5

    or-int/2addr v5, v6

    invoke-interface {v4, v3}, Lbxb;->A(F)Z

    move-result v6

    or-int/2addr v5, v6

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v6

    if-nez v5, :cond_e

    if-ne v6, v10, :cond_f

    :cond_e
    new-instance v6, Lbda;

    const/4 v5, 0x6

    invoke-direct {v6, v0, v13, v3, v5}, Lbda;-><init>(Ljava/lang/Object;Ljava/lang/Object;FI)V

    invoke-virtual {v7, v6}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_f
    shr-int/lit8 v3, v21, 0x3

    and-int/lit8 v3, v3, 0xe

    check-cast v6, Ladgi;

    invoke-static {v1, v6, v4, v3}, Lqkj;->R(ZLadgi;Lbxb;I)V

    goto :goto_8

    :cond_10
    invoke-interface {v4}, Lbxb;->s()V

    :goto_8
    invoke-interface {v4}, Lbxb;->K()Lbzo;

    move-result-object v3

    if-eqz v3, :cond_11

    new-instance v4, Lbdl;

    const/4 v6, 0x4

    invoke-direct {v4, v0, v1, v2, v6}, Lbdl;-><init>(Ljava/lang/Object;ZII)V

    iput-object v4, v3, Lbzo;->c:Ladgm;

    :cond_11
    return-void
.end method

.method public static V(Ladfx;Lcio;Lbxb;I)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v9, p1

    move/from16 v10, p3

    and-int/lit8 v1, v10, 0x6

    const v2, 0x20ba5d26

    move-object/from16 v3, p2

    invoke-interface {v3, v2}, Lbxb;->b(I)Lbxb;

    move-result-object v6

    const/4 v2, 0x1

    if-nez v1, :cond_1

    invoke-interface {v6, v0}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v1

    if-eq v2, v1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    :goto_0
    or-int/2addr v1, v10

    goto :goto_1

    :cond_1
    move v1, v10

    :goto_1
    and-int/lit8 v3, v10, 0x30

    if-nez v3, :cond_3

    invoke-interface {v6, v9}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v3

    if-eq v2, v3, :cond_2

    const/16 v3, 0x10

    goto :goto_2

    :cond_2
    const/16 v3, 0x20

    :goto_2
    or-int/2addr v1, v3

    :cond_3
    and-int/lit8 v3, v1, 0x13

    const/16 v4, 0x12

    if-eq v3, v4, :cond_4

    goto :goto_3

    :cond_4
    const/4 v2, 0x0

    :goto_3
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v6, v2, v3}, Lbxb;->J(ZI)Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v4, Lbcc;->a:Lbca;

    sget-wide v14, Lclz;->c:J

    sget-wide v2, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    sget-wide v7, Lclz;->h:J

    const/16 v16, 0x0

    const/16 v17, 0xe

    const v13, 0x3ec28f5c    # 0.38f

    move-wide v11, v14

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static/range {v11 .. v17}, Lclz;->h(JFFFFI)J

    move-result-wide v18

    invoke-static {v6}, Ldbz;->as(Lbxb;)Lbno;

    move-result-object v5

    sget-object v13, Lbnt;->a:Lbxj;

    invoke-interface {v6, v13}, Lbxb;->e(Lbxj;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lclz;

    iget-wide v13, v13, Lclz;->i:J

    invoke-static {v5, v13, v14}, Ldbz;->aA(Lbno;J)Lbog;

    move-result-object v5

    move-wide/from16 v16, v7

    move-wide v14, v11

    move-wide v12, v2

    move-object v11, v5

    invoke-virtual/range {v11 .. v19}, Lbog;->c(JJJJ)Lbog;

    move-result-object v3

    const-string v2, "SauceOnboardingCloseButton"

    invoke-static {v9, v2}, Ldco;->b(Lcio;Ljava/lang/String;)Lcio;

    move-result-object v2

    and-int/lit8 v1, v1, 0xe

    const/high16 v5, 0x180000

    or-int v7, v1, v5

    sget-object v5, Lqlj;->d:Ladgm;

    const/16 v8, 0x14

    move-object v1, v2

    const/4 v2, 0x0

    invoke-static/range {v0 .. v8}, Ldbz;->aw(Ladfx;Lcio;ZLbog;Lcnc;Ladgm;Lbxb;II)V

    goto :goto_4

    :cond_5
    invoke-interface {v6}, Lbxb;->s()V

    :goto_4
    invoke-interface {v6}, Lbxb;->K()Lbzo;

    move-result-object v1

    if-eqz v1, :cond_6

    new-instance v2, Lkch;

    const/4 v3, 0x6

    invoke-direct {v2, v0, v9, v10, v3}, Lkch;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v2, v1, Lbzo;->c:Ladgm;

    :cond_6
    return-void
.end method

.method public static W(Lqlh;Lcio;Ladgi;Ladfx;ZLbxb;I)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p6

    and-int/lit8 v0, v6, 0x6

    const v7, 0x6d1fd3b6

    move-object/from16 v8, p5

    invoke-interface {v8, v7}, Lbxb;->b(I)Lbxb;

    move-result-object v11

    const/4 v7, 0x1

    if-nez v0, :cond_1

    invoke-interface {v11, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v7, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v6

    goto :goto_1

    :cond_1
    move v0, v6

    :goto_1
    and-int/lit8 v8, v6, 0x30

    if-nez v8, :cond_3

    invoke-interface {v11, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v8

    if-eq v7, v8, :cond_2

    const/16 v8, 0x10

    goto :goto_2

    :cond_2
    const/16 v8, 0x20

    :goto_2
    or-int/2addr v0, v8

    :cond_3
    and-int/lit16 v8, v6, 0x180

    if-nez v8, :cond_5

    invoke-interface {v11, v3}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v8

    if-eq v7, v8, :cond_4

    const/16 v8, 0x80

    goto :goto_3

    :cond_4
    const/16 v8, 0x100

    :goto_3
    or-int/2addr v0, v8

    :cond_5
    and-int/lit16 v8, v6, 0xc00

    if-nez v8, :cond_7

    invoke-interface {v11, v4}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v8

    if-eq v7, v8, :cond_6

    const/16 v8, 0x400

    goto :goto_4

    :cond_6
    const/16 v8, 0x800

    :goto_4
    or-int/2addr v0, v8

    :cond_7
    and-int/lit16 v8, v6, 0x6000

    if-nez v8, :cond_9

    invoke-interface {v11, v5}, Lbxb;->E(Z)Z

    move-result v8

    if-eq v7, v8, :cond_8

    const/16 v8, 0x2000

    goto :goto_5

    :cond_8
    const/16 v8, 0x4000

    :goto_5
    or-int/2addr v0, v8

    :cond_9
    and-int/lit16 v8, v0, 0x2493

    const/16 v9, 0x2492

    const/4 v10, 0x0

    if-eq v8, v9, :cond_a

    goto :goto_6

    :cond_a
    move v7, v10

    :goto_6
    and-int/lit8 v8, v0, 0x1

    invoke-interface {v11, v7, v8}, Lbxb;->J(ZI)Z

    move-result v7

    if-eqz v7, :cond_c

    sget-object v7, Lcib;->b:Lcid;

    invoke-static {v7, v10}, Laty;->b(Lcid;Z)Lcvu;

    move-result-object v7

    invoke-static {v11}, Ldbz;->ai(Lbxb;)J

    move-result-wide v8

    invoke-static {v8, v9}, La;->e(J)I

    move-result v8

    move-object v9, v11

    check-cast v9, Lbyb;

    invoke-virtual {v9}, Lbyb;->ah()Lcfh;

    move-result-object v10

    invoke-static {v11, v2}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v12

    sget-object v13, Lcyc;->a:Ladfx;

    invoke-interface {v11}, Lbxb;->x()V

    iget-boolean v9, v9, Lbyb;->t:Z

    if-eqz v9, :cond_b

    invoke-interface {v11, v13}, Lbxb;->j(Ladfx;)V

    goto :goto_7

    :cond_b
    invoke-interface {v11}, Lbxb;->z()V

    :goto_7
    sget-object v9, Lcyc;->e:Ladgm;

    invoke-static {v11, v7, v9}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v7, Lcyc;->d:Ladgm;

    invoke-static {v11, v10, v7}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    sget-object v8, Lcyc;->f:Ladgm;

    invoke-static {v11, v7, v8}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v7, Lcyc;->g:Ladgi;

    invoke-static {v11, v7}, Lcay;->b(Lbxb;Ladgi;)V

    sget-object v7, Lcyc;->c:Ladgm;

    invoke-static {v11, v12, v7}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v7, Laud;->a:Laud;

    new-instance v8, Lqnx;

    invoke-static {}, Lqjm;->e()Lyeh;

    move-result-object v9

    invoke-virtual {v9, v1}, Lyeh;->indexOf(Ljava/lang/Object;)I

    move-result v9

    invoke-static {}, Lqjm;->e()Lyeh;

    move-result-object v10

    const/4 v12, 0x0

    invoke-direct {v8, v9, v10, v12, v3}, Lqnx;-><init>(ILyeh;Ljava/lang/String;Ladgi;)V

    and-int/lit8 v9, v0, 0xe

    shr-int/lit8 v0, v0, 0x9

    and-int/lit8 v10, v0, 0x70

    or-int/2addr v9, v10

    invoke-static {v1, v5, v11, v9}, Lqkj;->U(Lqlh;ZLbxb;I)V

    sget-object v14, Lcio;->e:Lcil;

    const-string v9, "SauceOnboardingLabel"

    invoke-static {v14, v9}, Ldco;->b(Lcio;Ljava/lang/String;)Lcio;

    move-result-object v9

    const/high16 v10, 0x42400000    # 48.0f

    invoke-static {v9, v10}, Lavw;->j(Lcio;F)Lcio;

    move-result-object v15

    const/16 v19, 0x0

    const/16 v20, 0xd

    const/16 v16, 0x0

    const/high16 v17, 0x41400000    # 12.0f

    const/16 v18, 0x0

    invoke-static/range {v15 .. v20}, Lvz;->ad(Lcio;FFFFI)Lcio;

    move-result-object v9

    const v10, 0x7f13083d

    invoke-static {v10, v11}, Ldcm;->d(ILbxb;)Ljava/lang/String;

    move-result-object v10

    const/16 v12, 0x30

    const/4 v13, 0x0

    invoke-static/range {v8 .. v13}, Lqkj;->A(Lqnz;Lcio;Ljava/lang/String;Lbxb;II)V

    sget-object v8, Lcib;->a:Lcid;

    invoke-interface {v7, v14, v8}, Lauc;->a(Lcio;Lcid;)Lcio;

    move-result-object v15

    const/16 v20, 0xc

    const/high16 v16, 0x41800000    # 16.0f

    move/from16 v17, v16

    invoke-static/range {v15 .. v20}, Lvz;->ad(Lcio;FFFFI)Lcio;

    move-result-object v7

    const/high16 v8, 0x42200000    # 40.0f

    invoke-static {v7, v8}, Lavw;->c(Lcio;F)Lcio;

    move-result-object v7

    and-int/lit8 v0, v0, 0xe

    invoke-static {v4, v7, v11, v0}, Lqkj;->V(Ladfx;Lcio;Lbxb;I)V

    invoke-interface {v11}, Lbxb;->n()V

    goto :goto_8

    :cond_c
    invoke-interface {v11}, Lbxb;->s()V

    :goto_8
    invoke-interface {v11}, Lbxb;->K()Lbzo;

    move-result-object v8

    if-eqz v8, :cond_d

    new-instance v0, Lqln;

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lqln;-><init>(Lqlh;Lcio;Ladgi;Ladfx;ZII)V

    iput-object v0, v8, Lbzo;->c:Ladgm;

    :cond_d
    return-void
.end method

.method public static X(Lqlh;Lcio;Lbxb;I)V
    .locals 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    and-int/lit8 v3, v2, 0x6

    const v4, -0x4eef3aef

    move-object/from16 v5, p2

    invoke-interface {v5, v4}, Lbxb;->b(I)Lbxb;

    move-result-object v4

    const/4 v5, 0x1

    if-nez v3, :cond_1

    invoke-interface {v4, v0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v3

    if-eq v5, v3, :cond_0

    const/4 v3, 0x2

    goto :goto_0

    :cond_0
    const/4 v3, 0x4

    :goto_0
    or-int/2addr v3, v2

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    and-int/lit8 v6, v2, 0x30

    if-nez v6, :cond_3

    invoke-interface {v4, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v6

    if-eq v5, v6, :cond_2

    const/16 v6, 0x10

    goto :goto_2

    :cond_2
    const/16 v6, 0x20

    :goto_2
    or-int/2addr v3, v6

    :cond_3
    and-int/lit8 v6, v3, 0x13

    const/16 v7, 0x12

    const/4 v8, 0x0

    if-eq v6, v7, :cond_4

    move v6, v5

    goto :goto_3

    :cond_4
    move v6, v8

    :goto_3
    and-int/2addr v3, v5

    invoke-interface {v4, v6, v3}, Lbxb;->J(ZI)Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-static {v4}, Ldbz;->as(Lbxb;)Lbno;

    move-result-object v3

    iget-wide v5, v3, Lbno;->F:J

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {v3}, Lbcc;->b(F)Lbca;

    move-result-object v7

    invoke-static {v1, v5, v6, v7}, Lvz;->am(Lcio;JLcnc;)Lcio;

    move-result-object v5

    const/high16 v6, 0x41800000    # 16.0f

    invoke-static {v5, v3, v3, v3, v6}, Lvz;->aa(Lcio;FFFF)Lcio;

    move-result-object v3

    sget-object v5, Lcib;->k:Lcic;

    sget-object v6, Lats;->c:Latr;

    const/16 v7, 0x30

    invoke-static {v6, v5, v4, v7}, Lauf;->a(Latr;Lcic;Lbxb;I)Lcvu;

    move-result-object v5

    invoke-static {v4}, Ldbz;->ai(Lbxb;)J

    move-result-wide v6

    invoke-static {v6, v7}, La;->e(J)I

    move-result v6

    move-object v7, v4

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->ah()Lcfh;

    move-result-object v9

    invoke-static {v4, v3}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v3

    sget-object v10, Lcyc;->a:Ladfx;

    invoke-interface {v4}, Lbxb;->x()V

    iget-boolean v7, v7, Lbyb;->t:Z

    if-eqz v7, :cond_5

    invoke-interface {v4, v10}, Lbxb;->j(Ladfx;)V

    goto :goto_4

    :cond_5
    invoke-interface {v4}, Lbxb;->z()V

    :goto_4
    sget-object v7, Lcyc;->e:Ladgm;

    invoke-static {v4, v5, v7}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v5, Lcyc;->d:Ladgm;

    invoke-static {v4, v9, v5}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, Lcyc;->f:Ladgm;

    invoke-static {v4, v5, v6}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v5, Lcyc;->g:Ladgi;

    invoke-static {v4, v5}, Lcay;->b(Lbxb;Ladgi;)V

    sget-object v5, Lcyc;->c:Ladgm;

    invoke-static {v4, v3, v5}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v0}, Lqkj;->O(Lqlh;)I

    move-result v3

    invoke-static {v3, v4}, Ldcm;->d(ILbxb;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4}, Ldbz;->av(Lbxb;)Lbtq;

    move-result-object v3

    iget-object v3, v3, Lbtq;->v:Ldic;

    invoke-static {v4}, Ldbz;->as(Lbxb;)Lbno;

    move-result-object v6

    iget-wide v6, v6, Lbno;->u:J

    sget-object v9, Lcio;->e:Lcil;

    const-string v10, "SauceOnboardingDescriptionTitle"

    invoke-static {v9, v10}, Ldco;->b(Lcio;Ljava/lang/String;)Lcio;

    move-result-object v10

    const/16 v23, 0x0

    const v24, 0x1fff8

    move v12, v8

    move-object v11, v9

    move-wide v7, v6

    move-object v6, v10

    const-wide/16 v9, 0x0

    move-object v13, v11

    move v14, v12

    const-wide/16 v11, 0x0

    move-object v15, v13

    const/4 v13, 0x0

    move/from16 v17, v14

    move-object/from16 v16, v15

    const-wide/16 v14, 0x0

    move-object/from16 v18, v16

    const/16 v16, 0x0

    move/from16 v19, v17

    const/16 v17, 0x0

    move-object/from16 v20, v18

    const/16 v18, 0x0

    move/from16 v21, v19

    const/16 v19, 0x0

    const/16 v22, 0x30

    move-object/from16 v25, v20

    move-object/from16 v20, v3

    move-object/from16 v3, v25

    move/from16 v25, v21

    move-object/from16 v21, v4

    move/from16 v4, v25

    invoke-static/range {v5 .. v24}, Lbsx;->b(Ljava/lang/String;Lcio;JJJLdmx;JIZIILdic;Lbxb;III)V

    move-object/from16 v5, v21

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lqkv;->a:Lqkv;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const v6, 0x7f13082a

    goto/16 :goto_5

    :cond_6
    sget-object v6, Lqkz;->a:Lqkz;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    const v6, 0x7f130839

    goto/16 :goto_5

    :cond_7
    sget-object v6, Lqky;->a:Lqky;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    const v6, 0x7f130837

    goto/16 :goto_5

    :cond_8
    sget-object v6, Lqld;->a:Lqld;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    const v6, 0x7f130845

    goto :goto_5

    :cond_9
    sget-object v6, Lqla;->a:Lqla;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    const v6, 0x7f13083e

    goto :goto_5

    :cond_a
    sget-object v6, Lqkw;->a:Lqkw;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    const v6, 0x7f13082c

    goto :goto_5

    :cond_b
    sget-object v6, Lqku;->a:Lqku;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    const v6, 0x7f130828

    goto :goto_5

    :cond_c
    sget-object v6, Lqlg;->a:Lqlg;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    sget-object v6, Lqle;->a:Lqle;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    sget-object v6, Lqlb;->a:Lqlb;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_10

    sget-object v6, Lqlc;->a:Lqlc;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    const v6, 0x7f130843

    goto :goto_5

    :cond_d
    sget-object v6, Lqkx;->a:Lqkx;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e

    const v6, 0x7f130834

    goto :goto_5

    :cond_e
    sget-object v6, Lqlf;->a:Lqlf;

    invoke-static {v0, v6}, Ladhh;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    const v6, 0x7f130848

    :goto_5
    invoke-static {v6, v5}, Ldcm;->d(ILbxb;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5}, Ldbz;->av(Lbxb;)Lbtq;

    move-result-object v7

    iget-object v7, v7, Lbtq;->j:Ldic;

    invoke-static {v5}, Ldbz;->as(Lbxb;)Lbno;

    move-result-object v8

    iget-wide v8, v8, Lbno;->q:J

    const-string v10, "SauceOnboardingDescription"

    invoke-static {v3, v10}, Ldco;->b(Lcio;Ljava/lang/String;)Lcio;

    move-result-object v3

    invoke-static {v3}, Laws;->k(Lcio;)Lcio;

    move-result-object v3

    invoke-static {v5}, Ljy;->C(Lbxb;)Lalw;

    move-result-object v10

    const/16 v11, 0xe

    invoke-static {v3, v10, v4, v11}, Ljy;->D(Lcio;Lalw;ZI)Lcio;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v10, 0x3

    invoke-static {v3, v4, v10}, Lavw;->o(Lcio;Lcid;I)Lcio;

    move-result-object v3

    new-instance v13, Ldmx;

    invoke-direct {v13, v10}, Ldmx;-><init>(I)V

    const/16 v23, 0x0

    const v24, 0x1fbf8

    move-object/from16 v20, v7

    move-wide v7, v8

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v22, 0x0

    move-object/from16 v21, v5

    move-object v5, v6

    move-object v6, v3

    invoke-static/range {v5 .. v24}, Lbsx;->b(Ljava/lang/String;Lcio;JJJLdmx;JIZIILdic;Lbxb;III)V

    invoke-interface/range {v21 .. v21}, Lbxb;->n()V

    goto :goto_6

    :cond_f
    new-instance v0, Ladcb;

    invoke-direct {v0}, Ladcb;-><init>()V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    :cond_11
    move-object/from16 v21, v4

    invoke-interface/range {v21 .. v21}, Lbxb;->s()V

    :goto_6
    invoke-interface/range {v21 .. v21}, Lbxb;->K()Lbzo;

    move-result-object v3

    if-eqz v3, :cond_12

    new-instance v4, Lkch;

    const/4 v5, 0x7

    invoke-direct {v4, v0, v1, v2, v5}, Lkch;-><init>(Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v4, v3, Lbzo;->c:Ladgm;

    :cond_12
    return-void
.end method

.method public static Y(Lqlh;Ladfx;Lcio;Lbxb;I)V
    .locals 17

    move-object/from16 v1, p0

    move-object/from16 v3, p2

    move/from16 v4, p4

    and-int/lit8 v0, v4, 0x6

    const v2, 0x345177c1

    move-object/from16 v5, p3

    invoke-interface {v5, v2}, Lbxb;->b(I)Lbxb;

    move-result-object v14

    const/4 v2, 0x1

    if-nez v0, :cond_1

    invoke-interface {v14, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v2, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v4

    goto :goto_1

    :cond_1
    move v0, v4

    :goto_1
    and-int/lit8 v5, v4, 0x30

    if-nez v5, :cond_3

    move-object/from16 v5, p1

    invoke-interface {v14, v5}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v6

    if-eq v2, v6, :cond_2

    const/16 v6, 0x10

    goto :goto_2

    :cond_2
    const/16 v6, 0x20

    :goto_2
    or-int/2addr v0, v6

    goto :goto_3

    :cond_3
    move-object/from16 v5, p1

    :goto_3
    and-int/lit16 v6, v4, 0x180

    if-nez v6, :cond_5

    invoke-interface {v14, v3}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v6

    if-eq v2, v6, :cond_4

    const/16 v6, 0x80

    goto :goto_4

    :cond_4
    const/16 v6, 0x100

    :goto_4
    or-int/2addr v0, v6

    :cond_5
    and-int/lit16 v6, v0, 0x93

    const/16 v7, 0x92

    if-eq v6, v7, :cond_6

    goto :goto_5

    :cond_6
    const/4 v2, 0x0

    :goto_5
    and-int/lit8 v6, v0, 0x1

    invoke-interface {v14, v2, v6}, Lbxb;->J(ZI)Z

    move-result v2

    if-eqz v2, :cond_7

    sget-object v2, Lbnd;->a:Lavm;

    sget v2, Lbnd;->d:F

    invoke-static {v3, v2}, Lavw;->j(Lcio;F)Lcio;

    move-result-object v6

    invoke-static {v2}, Lbnd;->e(F)Lavm;

    move-result-object v12

    new-instance v7, Lqlp;

    invoke-direct {v7, v1, v2}, Lqlp;-><init>(Lqlh;F)V

    const v2, 0x45fc7dd1

    invoke-static {v2, v7, v14}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v13

    shr-int/lit8 v0, v0, 0x3

    and-int/lit8 v0, v0, 0xe

    const/high16 v2, 0x30000000

    or-int v15, v0, v2

    const/16 v16, 0x17c

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v5 .. v16}, Ldbz;->aE(Ladfx;Lcio;ZLcnc;Lbnc;Lbnf;Lakc;Lavm;Ladgn;Lbxb;II)V

    goto :goto_6

    :cond_7
    invoke-interface {v14}, Lbxb;->s()V

    :goto_6
    invoke-interface {v14}, Lbxb;->K()Lbzo;

    move-result-object v6

    if-eqz v6, :cond_8

    new-instance v0, Lqve;

    const/4 v5, 0x1

    move-object/from16 v2, p1

    invoke-direct/range {v0 .. v5}, Lqve;-><init>(Lqlh;Ladfx;Lcio;II)V

    iput-object v0, v6, Lbzo;->c:Ladgm;

    :cond_8
    return-void
.end method

.method public static Z(Lost;)Laavt;
    .locals 11

    iget-object v0, p0, Lost;->p:Lxwg;

    invoke-virtual {v0}, Lxwg;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqlh;

    if-nez v0, :cond_check_fallback

    invoke-static {}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getLastSelectedLook()Lqlh;

    move-result-object v0

    :cond_check_fallback
    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    sget-object v2, Laavt;->a:Laavt;

    invoke-virtual {v2}, Laaxp;->D()Laaxk;

    move-result-object v2

    check-cast v2, Laavs;

    iget-object v3, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v3}, Laaxp;->T()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_1
    iget v0, v0, Lqlh;->d:I

    iget-object v3, v2, Laavs;->b:Laaxp;

    check-cast v3, Laavt;

    iget v4, v3, Laavt;->b:I

    const/4 v5, 0x1

    or-int/2addr v4, v5

    iput v4, v3, Laavt;->b:I

    iput v0, v3, Laavt;->c:I

    iget-object v0, v2, Laaxk;->b:Laaxp;

    invoke-virtual {v0}, Laaxp;->T()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v2}, Laaxk;->o()V

    :cond_2
    iget-object v0, v2, Laavs;->b:Laaxp;

    check-cast v0, Laavt;

    iget v3, v0, Laavt;->b:I

    or-int/lit8 v3, v3, 0x2

    iput v3, v0, Laavt;->b:I

    iput v5, v0, Laavt;->d:I

    iget-object p0, p0, Lost;->q:Lxwg;

    invoke-virtual {p0}, Lxwg;->f()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqmc;

    if-eqz p0, :cond_b

    iget-object v0, p0, Lqmc;->a:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v4, 0xb

    invoke-direct {v3, v2, v4, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[Z)V

    new-instance v6, Lpzz;

    const/4 v7, 0x6

    invoke-direct {v6, v3, v7}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_3

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v6, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iget-object v0, p0, Lqmc;->b:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v6, 0xc

    invoke-direct {v3, v2, v6, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[F)V

    new-instance v7, Lpzz;

    const/4 v8, 0x7

    invoke-direct {v7, v3, v8}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_4

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v7, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    iget-object v0, p0, Lqmc;->c:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v7, 0xd

    invoke-direct {v3, v2, v7, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[[B)V

    new-instance v8, Lpzz;

    const/16 v9, 0x8

    invoke-direct {v8, v3, v9}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_5

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v8, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    iget-object v0, p0, Lqmc;->d:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v8, 0xe

    invoke-direct {v3, v2, v8, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[[C)V

    new-instance v9, Lpzz;

    const/16 v10, 0x9

    invoke-direct {v9, v3, v10}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_6

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v9, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    iget-object v0, p0, Lqmc;->e:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v9, 0xf

    invoke-direct {v3, v2, v9, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[[S)V

    new-instance v9, Lpzz;

    const/16 v10, 0xa

    invoke-direct {v9, v3, v10}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_7

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v9, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    iget-object v0, p0, Lqmc;->f:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v9, 0x10

    invoke-direct {v3, v2, v9, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[[I)V

    new-instance v9, Lpzz;

    invoke-direct {v9, v3, v4}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_8

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v9, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    iget-object v0, p0, Lqmc;->g:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v4, 0x11

    invoke-direct {v3, v2, v4, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[[Z)V

    new-instance v4, Lpzz;

    invoke-direct {v4, v3, v6}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_9

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v4, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    iget-object v0, p0, Lqmc;->h:Lj$/util/Optional;

    new-instance v3, Ldqk;

    const/16 v4, 0x12

    invoke-direct {v3, v2, v4, v1}, Ldqk;-><init>(Ljava/lang/Object;I[[[F)V

    new-instance v4, Lpzz;

    invoke-direct {v4, v3, v7}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-ne v5, v3, :cond_a

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v3, v4, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v3, v0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    iget-object p0, p0, Lqmc;->i:Lj$/util/Optional;

    new-instance v0, Ldqk;

    const/16 v3, 0x13

    invoke-direct {v0, v2, v3, v1, v1}, Ldqk;-><init>(Ljava/lang/Object;I[B[B)V

    new-instance v1, Lpzz;

    invoke-direct {v1, v0, v8}, Lpzz;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v0

    if-ne v5, v0, :cond_b

    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    iget-object v0, v1, Lpzz;->a:Ljava/lang/Object;

    invoke-interface {v0, p0}, Ladgi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    invoke-virtual {v2}, Laaxk;->i()Laaxp;

    move-result-object p0

    check-cast p0, Laavt;

    return-object p0
.end method

.method public static a()Lacnb;
    .locals 4

    sget-object v0, Lqkj;->a:Lacnb;

    if-nez v0, :cond_1

    const-class v1, Lqkj;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lqkj;->a:Lacnb;

    if-nez v0, :cond_0

    invoke-static {}, Lacnb;->a()Lacmy;

    move-result-object v0

    sget-object v2, Lacna;->a:Lacna;

    iput-object v2, v0, Lacmy;->c:Lacna;

    const-string v2, "com.google.android.apps.camera.retaildemo.proto.RetailDemoService"

    const-string v3, "DownloadModel"

    invoke-static {v2, v3}, Lacnb;->c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lacmy;->d:Ljava/lang/String;

    invoke-virtual {v0}, Lacmy;->b()V

    sget-object v2, Lqkd;->a:Lqkd;

    sget-object v3, Ladbh;->a:Laaxe;

    new-instance v3, Ladbg;

    invoke-direct {v3, v2}, Ladbg;-><init>(Laays;)V

    iput-object v3, v0, Lacmy;->a:Lacmz;

    sget-object v2, Lqke;->a:Lqke;

    new-instance v3, Ladbg;

    invoke-direct {v3, v2}, Ladbg;-><init>(Laays;)V

    iput-object v3, v0, Lacmy;->b:Lacmz;

    invoke-virtual {v0}, Lacmy;->a()Lacnb;

    move-result-object v0

    sput-object v0, Lqkj;->a:Lacnb;

    :cond_0
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    return-object v0
.end method

.method private static aA(JI)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2}, Lyny;->aY(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static aa(FFFF)Landroid/util/Pair;
    .locals 3

    const/4 v0, 0x0

    cmpl-float v1, p0, v0

    if-lez v1, :cond_1

    cmpg-float p2, p3, v0

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    div-float/2addr p0, p3

    goto :goto_1

    :cond_1
    cmpg-float v1, p2, v0

    if-nez v1, :cond_2

    :goto_0
    move p0, v0

    goto :goto_1

    :cond_2
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    div-float/2addr p0, p2

    :goto_1
    cmpg-float p2, p1, v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-gez p2, :cond_4

    cmpg-float p2, p0, v0

    if-gez p2, :cond_3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    sub-float/2addr v1, p1

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    mul-float/2addr v1, p0

    add-float/2addr p1, v1

    neg-float p1, p1

    move p0, p1

    move p1, v0

    goto :goto_2

    :cond_3
    move v2, p1

    move p1, p0

    move p0, v2

    goto :goto_2

    :cond_4
    cmpl-float p2, p0, v0

    if-lez p2, :cond_5

    sub-float/2addr v1, p1

    mul-float/2addr v1, p0

    add-float/2addr p1, v1

    move p0, v0

    :cond_5
    :goto_2
    mul-float/2addr p1, p3

    new-instance p2, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-direct {p2, p1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p2
.end method

.method public static ab(Luyk;)Ljava/lang/String;
    .locals 12

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    instance-of v0, p0, Luyi;

    if-eqz v0, :cond_1

    check-cast p0, Luyi;

    iget-wide v0, p0, Luyi;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    instance-of v0, p0, Luyj;

    if-eqz v0, :cond_2

    check-cast p0, Luyj;

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    iget-wide v1, p0, Luyj;->a:D

    double-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-wide v1, p0, Luyj;->b:D

    invoke-static {v1, v2}, Lqkj;->az(D)Ljava/lang/String;

    move-result-object v4

    iget-wide v1, p0, Luyj;->c:D

    invoke-static {v1, v2}, Lqkj;->az(D)Ljava/lang/String;

    move-result-object v5

    iget-wide v1, p0, Luyj;->d:D

    invoke-static {v1, v2}, Lqkj;->az(D)Ljava/lang/String;

    move-result-object v6

    iget-wide v1, p0, Luyj;->e:D

    invoke-static {v1, v2}, Lqkj;->az(D)Ljava/lang/String;

    move-result-object v7

    iget-object v1, p0, Luyj;->f:[D

    const/4 v2, 0x0

    aget-wide v1, v1, v2

    double-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    iget-object v1, p0, Luyj;->f:[D

    const/4 v2, 0x1

    aget-wide v1, v1, v2

    double-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    iget-object v1, p0, Luyj;->f:[D

    const/4 v2, 0x2

    aget-wide v1, v1, v2

    double-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    iget-object p0, p0, Luyj;->f:[D

    const/4 v1, 0x3

    aget-wide v1, p0, v1

    double-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    filled-new-array/range {v3 .. v11}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "n: %6.6s, min: %12.12s, max: %12.12s, mean: %12.12s, last: %12.12s, n25: %6.6s, n50: %6.6s, n75: %6.6s, n100: %6.6s"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_0
    const-string p0, "-"

    return-object p0
.end method

.method public static ac([BI)F
    .locals 0

    invoke-static {p0, p1}, Lqkj;->ad([BI)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p0

    return p0
.end method

.method public static ad([BI)I
    .locals 3

    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p1, v1, 0x8

    or-int/2addr p1, v0

    shl-int/lit8 v0, v2, 0x10

    or-int/2addr p1, v0

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, p1

    return p0
.end method

.method public static ae([BI)J
    .locals 2

    add-int/lit8 p1, p1, 0xc

    invoke-static {p0, p1}, Lqkj;->ad([BI)I

    move-result p0

    int-to-long p0, p0

    const-wide v0, 0xffffffffL

    and-long/2addr p0, v0

    return-wide p0
.end method

.method public static af([BI)J
    .locals 16

    add-int/lit8 v0, p1, 0x10

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x11

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p1, 0x12

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    add-int/lit8 v3, p1, 0x13

    aget-byte v3, p0, v3

    and-int/lit16 v3, v3, 0xff

    add-int/lit8 v4, p1, 0x14

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p1, 0x15

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    add-int/lit8 v6, p1, 0x16

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    add-int/lit8 v7, p1, 0x17

    aget-byte v7, p0, v7

    and-int/lit16 v7, v7, 0xff

    int-to-long v8, v1

    int-to-long v1, v2

    int-to-long v10, v3

    int-to-long v3, v4

    int-to-long v12, v5

    int-to-long v5, v6

    int-to-long v14, v7

    move-wide/from16 p0, v1

    int-to-long v0, v0

    const/16 v2, 0x8

    shl-long v7, v8, v2

    add-long/2addr v0, v7

    const/16 v2, 0x10

    shl-long v7, p0, v2

    add-long/2addr v0, v7

    const/16 v2, 0x18

    shl-long v7, v10, v2

    add-long/2addr v0, v7

    const/16 v2, 0x20

    shl-long v2, v3, v2

    add-long/2addr v0, v2

    const/16 v2, 0x28

    shl-long v2, v12, v2

    add-long/2addr v0, v2

    const/16 v2, 0x30

    shl-long v2, v5, v2

    add-long/2addr v0, v2

    const/16 v2, 0x38

    shl-long v2, v14, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public static synthetic ag(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map$Entry;
    .locals 1

    new-instance v0, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p0, p1}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static ah(Luyy;)Ljava/lang/Object;
    .locals 0

    invoke-interface {p0}, Luyy;->k()Lhfv;

    move-result-object p0

    iget-object p0, p0, Lhfv;->a:Ljava/lang/Object;

    return-object p0
.end method

.method public static ai(J)Lqu;
    .locals 2

    const-wide/16 v0, -0x1

    cmp-long v0, p0, v0

    if-eqz v0, :cond_0

    new-instance v0, Lqu;

    invoke-direct {v0, p0, p1}, Lqu;-><init>(J)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static aj(Lupn;)Lqw;
    .locals 1

    invoke-virtual {p0}, Lupn;->ordinal()I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    sget-object p0, Lqw;->a:Lqw;

    return-object p0

    :cond_0
    sget-object p0, Lqw;->a:Lqw;

    return-object p0

    :cond_1
    sget-object p0, Lqw;->b:Lqw;

    return-object p0

    :cond_2
    sget-object p0, Lqw;->c:Lqw;

    return-object p0
.end method

.method public static ak(J)Lqy;
    .locals 2

    const-wide/16 v0, -0x1

    cmp-long v0, p0, v0

    if-eqz v0, :cond_0

    new-instance v0, Lqy;

    invoke-direct {v0, p0, p1}, Lqy;-><init>(J)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static al(I)Ljava/util/List;
    .locals 1

    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    new-instance v0, Lqx;

    invoke-direct {v0, p0}, Lqx;-><init>(I)V

    invoke-static {v0}, Laaax;->aY(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    sget-object p0, Laddh;->a:Laddh;

    return-object p0
.end method

.method public static am(I)Lqz;
    .locals 0

    add-int/lit8 p0, p0, -0x1

    if-eqz p0, :cond_0

    new-instance p0, Lqz;

    invoke-direct {p0}, Lqz;-><init>()V

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static an(S)Z
    .locals 2

    and-int/lit8 v0, p0, -0x10

    const/16 v1, -0x40

    if-ne v0, v1, :cond_0

    const/16 v0, -0x3c

    if-eq p0, v0, :cond_0

    const/16 v0, -0x38

    if-eq p0, v0, :cond_0

    const/16 v0, -0x34

    if-eq p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static ao(J)Ljava/lang/String;
    .locals 2

    const-wide/16 v0, 0x3e8

    rem-long/2addr p0, v0

    const/4 v0, 0x3

    invoke-static {p0, p1, v0}, Lqkj;->aA(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static ap(J)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    invoke-static {p0, p1, v0}, Lqkj;->aA(JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic aq(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const-string p0, "null"

    return-object p0

    :cond_0
    const-string p0, "PAUSED"

    return-object p0

    :cond_1
    const-string p0, "CLOSED"

    return-object p0

    :cond_2
    const-string p0, "STARTED"

    return-object p0

    :cond_3
    const-string p0, "READY"

    return-object p0
.end method

.method public static synthetic ar(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const-string p0, "null"

    return-object p0

    :cond_0
    const-string p0, "CLOSED"

    return-object p0

    :cond_1
    const-string p0, "PAUSED"

    return-object p0

    :cond_2
    const-string p0, "STARTED"

    return-object p0

    :cond_3
    const-string p0, "READY"

    return-object p0
.end method

.method public static synthetic as(I)Ljava/lang/String;
    .locals 0

    packed-switch p0, :pswitch_data_0

    const-string p0, "null"

    return-object p0

    :pswitch_0
    const-string p0, "CLOSED"

    return-object p0

    :pswitch_1
    const-string p0, "STOPPED"

    return-object p0

    :pswitch_2
    const-string p0, "STOPPING"

    return-object p0

    :pswitch_3
    const-string p0, "PAUSED"

    return-object p0

    :pswitch_4
    const-string p0, "STARTED"

    return-object p0

    :pswitch_5
    const-string p0, "READY"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic at(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    const-string p0, "null"

    return-object p0

    :cond_0
    const-string p0, "CLOSED"

    return-object p0

    :cond_1
    const-string p0, "STOPPED"

    return-object p0

    :cond_2
    const-string p0, "STARTED"

    return-object p0

    :cond_3
    const-string p0, "READY"

    return-object p0
.end method

.method public static au(ILuhd;)Lxwg;
    .locals 8

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    iget v0, p1, Luhd;->e:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/16 v0, 0xc

    goto :goto_0

    :cond_0
    const/16 v0, 0x10

    :goto_0
    move v5, v0

    iget v4, p1, Luhd;->d:I

    invoke-static {v4, v5, v1}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result p1

    mul-int/lit8 v7, p1, 0xa

    :try_start_0
    new-instance v2, Landroid/media/AudioRecord;

    add-int/lit8 v3, p0, -0x1

    if-eqz p0, :cond_2

    const/4 v6, 0x2

    invoke-direct/range {v2 .. v7}, Landroid/media/AudioRecord;-><init>(IIIII)V

    invoke-virtual {v2}, Landroid/media/AudioRecord;->getState()I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    invoke-static {p1}, Lyny;->bl(Z)V

    invoke-static {v2}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    throw p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    move-object p0, v0

    const-string p1, "AudioRecordFactory"

    const-string v0, "Could not create AudioRecord"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0
.end method

.method public static synthetic av(I)Ljava/lang/String;
    .locals 1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0x14

    if-eq p0, v0, :cond_0

    const-string p0, "null"

    return-object p0

    :cond_0
    const-string p0, "AUDIO_1"

    return-object p0

    :cond_1
    const-string p0, "VIDEO_1"

    return-object p0
.end method

.method public static synthetic aw(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const-string p0, "FORBIDDEN"

    return-object p0

    :cond_0
    const-string p0, "OPTIONAL"

    return-object p0

    :cond_1
    const-string p0, "REQUIRED"

    return-object p0
.end method

.method public static synthetic ax(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const-string p0, "VIDEO"

    return-object p0

    :cond_0
    const-string p0, "AUDIO"

    return-object p0
.end method

.method private static ay(Lsmu;ZLbxb;)Lsmu;
    .locals 3

    const v0, -0x339d0303    # -5.9503604E7f

    invoke-interface {p2, v0}, Lbxb;->w(I)V

    const/4 v0, 0x0

    if-nez p0, :cond_0

    check-cast p2, Lbyb;

    invoke-virtual {p2}, Lbyb;->X()V

    return-object v0

    :cond_0
    if-eqz p1, :cond_1

    const p1, -0x4c9e5c57

    invoke-interface {p2, p1}, Lbxb;->w(I)V

    const p1, 0x7f060a83

    invoke-static {p1, p2}, Ldcr;->b(ILbxb;)J

    move-result-wide v1

    move-object p1, p2

    check-cast p1, Lbyb;

    invoke-virtual {p1}, Lbyb;->X()V

    goto :goto_0

    :cond_1
    const p1, -0x4c9d5b80

    invoke-interface {p2, p1}, Lbxb;->w(I)V

    const p1, 0x7f060a84

    invoke-static {p1, p2}, Ldcr;->b(ILbxb;)J

    move-result-wide v1

    move-object p1, p2

    check-cast p1, Lbyb;

    invoke-virtual {p1}, Lbyb;->X()V

    :goto_0
    invoke-static {v1, v2}, Lcbf;->M(J)I

    move-result p1

    const/16 v1, 0x17

    invoke-static {p0, v0, p1, v1}, Lsmu;->a(Lsmu;Ljava/lang/String;II)Lsmu;

    move-result-object p0

    check-cast p2, Lbyb;

    invoke-virtual {p2}, Lbyb;->X()V

    return-object p0
.end method

.method private static az(D)Ljava/lang/String;
    .locals 2

    const-wide v0, 0x4202a05f1ff80000L    # 9.999999999E9

    cmpl-double v0, p0, v0

    if-gtz v0, :cond_1

    const-wide v0, -0x3e32329b00800000L    # -9.99999999E8

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%.4f"

    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%.6e"

    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static b()Lacnb;
    .locals 4

    sget-object v0, Lqkj;->b:Lacnb;

    if-nez v0, :cond_1

    const-class v1, Lqkj;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lqkj;->b:Lacnb;

    if-nez v0, :cond_0

    invoke-static {}, Lacnb;->a()Lacmy;

    move-result-object v0

    sget-object v2, Lacna;->a:Lacna;

    iput-object v2, v0, Lacmy;->c:Lacna;

    const-string v2, "com.google.android.apps.camera.retaildemo.proto.RetailDemoService"

    const-string v3, "PerformCameraAppReset"

    invoke-static {v2, v3}, Lacnb;->c(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lacmy;->d:Ljava/lang/String;

    invoke-virtual {v0}, Lacmy;->b()V

    sget-object v2, Lqkf;->a:Lqkf;

    sget-object v3, Ladbh;->a:Laaxe;

    new-instance v3, Ladbg;

    invoke-direct {v3, v2}, Ladbg;-><init>(Laays;)V

    iput-object v3, v0, Lacmy;->a:Lacmz;

    sget-object v2, Lqkg;->a:Lqkg;

    new-instance v3, Ladbg;

    invoke-direct {v3, v2}, Ladbg;-><init>(Laays;)V

    iput-object v3, v0, Lacmy;->b:Lacmz;

    invoke-virtual {v0}, Lacmy;->a()Lacnb;

    move-result-object v0

    sput-object v0, Lqkj;->b:Lacnb;

    :cond_0
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    return-object v0
.end method

.method public static synthetic c(Laaxk;)Lqke;
    .locals 0

    invoke-virtual {p0}, Laaxk;->i()Laaxp;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lqke;

    return-object p0
.end method

.method public static d(ZLaaxk;)V
    .locals 1

    iget-object v0, p1, Laaxk;->b:Laaxp;

    invoke-virtual {v0}, Laaxp;->T()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Laaxk;->o()V

    :cond_0
    iget-object p1, p1, Laaxk;->b:Laaxp;

    check-cast p1, Lqke;

    sget-object v0, Lqke;->a:Lqke;

    iget v0, p1, Lqke;->b:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p1, Lqke;->b:I

    iput-boolean p0, p1, Lqke;->c:Z

    return-void
.end method

.method public static e(Lcau;)Lqhq;
    .locals 0

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqhq;

    return-object p0
.end method

.method public static f(Lcth;Ladgi;Ladgi;Ladfx;Ladel;)Ljava/lang/Object;
    .locals 10

    instance-of v0, p4, Lqig;

    if-eqz v0, :cond_0

    move-object v0, p4

    check-cast v0, Lqig;

    iget v1, v0, Lqig;->b:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lqig;->b:I

    goto :goto_0

    :cond_0
    new-instance v0, Lqig;

    invoke-direct {v0, p4}, Ladfb;-><init>(Ladel;)V

    :goto_0
    iget-object p4, v0, Lqig;->a:Ljava/lang/Object;

    sget-object v1, Lades;->a:Lades;

    iget v2, v0, Lqig;->b:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    if-ne v2, v3, :cond_1

    iget-object p3, v0, Lqig;->c:Lkcp;

    :try_start_0
    invoke-static {p4}, Laaax;->ac(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_3

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p4}, Laaax;->ac(Ljava/lang/Object;)V

    :try_start_1
    new-instance v4, Lqih;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    :try_start_2
    invoke-direct/range {v4 .. v9}, Lqih;-><init>(Ladgi;Ladgi;Ladfx;Ladel;I)V

    move-object p3, v7

    check-cast p3, Lkcp;

    iput-object p3, v0, Lqig;->c:Lkcp;

    iput v3, v0, Lqig;->b:I

    invoke-static {p0, v4, v0}, La;->br(Lcth;Ladgm;Ladel;)Ljava/lang/Object;

    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-ne p0, v1, :cond_3

    return-object v1

    :cond_3
    move-object p3, v7

    :goto_1
    invoke-interface {p3}, Ladfx;->a()Ljava/lang/Object;

    sget-object p0, Ladcp;->a:Ladcp;

    return-object p0

    :catchall_1
    move-exception v0

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object v7, p3

    :goto_2
    move-object p0, v0

    move-object p3, v7

    :goto_3
    invoke-interface {p3}, Ladfx;->a()Ljava/lang/Object;

    throw p0
.end method

.method public static g(Lqhq;Lbxb;I)V
    .locals 20

    move-object/from16 v6, p0

    move/from16 v8, p2

    and-int/lit8 v0, v8, 0x6

    const v1, 0x29675d07

    move-object/from16 v2, p1

    invoke-interface {v2, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v9

    const/4 v1, 0x4

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-nez v0, :cond_1

    invoke-interface {v9, v6}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v3, v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    or-int/2addr v0, v8

    goto :goto_1

    :cond_1
    move v0, v8

    :goto_1
    and-int/lit8 v4, v0, 0x3

    const/4 v5, 0x0

    if-eq v4, v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    move v2, v5

    :goto_2
    and-int/lit8 v4, v0, 0x1

    invoke-interface {v9, v2, v4}, Lbxb;->J(ZI)Z

    move-result v2

    if-eqz v2, :cond_18

    sget-object v2, Ldca;->f:Lbxj;

    invoke-interface {v9, v2}, Lbxb;->e(Lbxj;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget-object v4, v6, Lqhq;->g:Lnqq;

    invoke-interface {v9, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    const/4 v10, -0x1

    if-nez v4, :cond_3

    move v11, v10

    goto :goto_3

    :cond_3
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v11

    :goto_3
    invoke-interface {v9, v11}, Lbxb;->B(I)Z

    move-result v11

    or-int/2addr v7, v11

    move-object v11, v9

    check-cast v11, Lbyb;

    invoke-virtual {v11}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v12

    if-nez v7, :cond_4

    sget-object v7, Lbxa;->a:Ljava/lang/Object;

    if-ne v12, v7, :cond_5

    :cond_4
    invoke-virtual {v2}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    const v7, 0x7f0a01a7

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v11, v12}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_5
    check-cast v12, Landroid/view/View;

    if-nez v12, :cond_6

    invoke-interface {v9}, Lbxb;->K()Lbzo;

    move-result-object v0

    if-eqz v0, :cond_19

    new-instance v1, Lkml;

    const/16 v2, 0x9

    invoke-direct {v1, v6, v8, v2}, Lkml;-><init>(Ljava/lang/Object;II)V

    :goto_4
    iput-object v1, v0, Lbzo;->c:Ladgm;

    return-void

    :cond_6
    iget-object v2, v6, Lqhq;->a:Lyeh;

    iget-object v7, v6, Lqhq;->b:Lyeh;

    const/4 v13, 0x0

    if-nez v4, :cond_7

    move-object v15, v13

    goto :goto_5

    :cond_7
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v10

    move-object v15, v4

    :goto_5
    invoke-interface {v9, v10}, Lbxb;->B(I)Z

    move-result v4

    invoke-interface {v9, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v10

    or-int/2addr v4, v10

    invoke-interface {v9, v7}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v10

    or-int/2addr v4, v10

    invoke-virtual {v11}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v10

    if-nez v4, :cond_8

    sget-object v4, Lbxa;->a:Ljava/lang/Object;

    if-ne v10, v4, :cond_f

    :cond_8
    if-nez v15, :cond_9

    move-object v10, v13

    goto :goto_8

    :cond_9
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lqho;

    iget-object v10, v10, Lqho;->a:Lnqq;

    if-ne v10, v15, :cond_a

    goto :goto_6

    :cond_b
    move-object v4, v13

    :goto_6
    check-cast v4, Lqho;

    if-nez v4, :cond_e

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lqho;

    iget-object v7, v7, Lqho;->a:Lnqq;

    if-ne v7, v15, :cond_c

    goto :goto_7

    :cond_d
    move-object v4, v13

    :goto_7
    check-cast v4, Lqho;

    :cond_e
    move-object v10, v4

    :goto_8
    invoke-virtual {v11, v10}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_f
    check-cast v10, Lqho;

    if-eqz v10, :cond_10

    iget-object v2, v10, Lqho;->f:Ljava/lang/Integer;

    move-object/from16 v16, v2

    goto :goto_9

    :cond_10
    move-object/from16 v16, v13

    :goto_9
    if-eqz v10, :cond_11

    iget-object v2, v10, Lqho;->g:Ljava/lang/Integer;

    move-object/from16 v17, v2

    goto :goto_a

    :cond_11
    move-object/from16 v17, v13

    :goto_a
    if-eqz v10, :cond_12

    iget-object v2, v10, Lqho;->h:Ljava/lang/Integer;

    goto :goto_b

    :cond_12
    move-object v2, v13

    :goto_b
    if-nez v2, :cond_13

    const v2, 0x338fd460

    invoke-interface {v9, v2}, Lbxb;->w(I)V

    goto :goto_c

    :cond_13
    const v4, 0x338fd461

    invoke-interface {v9, v4}, Lbxb;->w(I)V

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-static {v2, v9}, Ldcm;->d(ILbxb;)Ljava/lang/String;

    move-result-object v13

    :goto_c
    invoke-virtual {v11}, Lbyb;->X()V

    move-object/from16 v18, v13

    iget-boolean v2, v6, Lqhq;->c:Z

    if-eqz v2, :cond_14

    if-eqz v15, :cond_14

    move v2, v3

    goto :goto_d

    :cond_14
    move v2, v5

    :goto_d
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    iget-object v4, v6, Lqhq;->i:Ladfx;

    move-object/from16 v19, v4

    filled-new-array/range {v14 .. v19}, [Ljava/lang/Object;

    move-result-object v10

    move v7, v3

    move-object/from16 v13, v16

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    invoke-interface {v9, v2}, Lbxb;->E(Z)Z

    move-result v14

    invoke-interface {v9, v13}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v14, v15

    invoke-interface {v9, v3}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v14, v15

    invoke-interface {v9, v4}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v14, v15

    invoke-interface {v9, v12}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v14, v15

    and-int/lit8 v0, v0, 0xe

    if-ne v0, v1, :cond_15

    move v5, v7

    :cond_15
    invoke-virtual {v11}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v0

    or-int v1, v14, v5

    if-nez v1, :cond_16

    sget-object v1, Lbxa;->a:Ljava/lang/Object;

    if-ne v0, v1, :cond_17

    :cond_16
    new-instance v0, Lqhy;

    const/4 v7, 0x0

    move v1, v2

    move-object v5, v12

    move-object v2, v13

    invoke-direct/range {v0 .. v7}, Lqhy;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Landroid/view/View;Lqhq;I)V

    invoke-virtual {v11, v0}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_17
    check-cast v0, Ladgi;

    invoke-static {v10, v0, v9}, Lbxw;->e([Ljava/lang/Object;Ladgi;Lbxb;)V

    goto :goto_e

    :cond_18
    invoke-interface {v9}, Lbxb;->s()V

    :goto_e
    invoke-interface {v9}, Lbxb;->K()Lbzo;

    move-result-object v0

    if-eqz v0, :cond_19

    new-instance v1, Lkml;

    const/16 v2, 0xa

    invoke-direct {v1, v6, v8, v2}, Lkml;-><init>(Ljava/lang/Object;II)V

    goto/16 :goto_4

    :cond_19
    return-void
.end method

.method public static h(Ladsh;Lbxb;I)V
    .locals 11

    and-int/lit8 v0, p2, 0x6

    const v1, 0x62f9b5a7

    invoke-interface {p1, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v8

    const/4 p1, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_2

    and-int/lit8 v0, p2, 0x8

    if-nez v0, :cond_0

    invoke-interface {v8, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_0
    invoke-interface {v8, p0}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    if-eq v1, v0, :cond_1

    move v0, p1

    goto :goto_1

    :cond_1
    const/4 v0, 0x4

    :goto_1
    or-int/2addr v0, p2

    goto :goto_2

    :cond_2
    move v0, p2

    :goto_2
    and-int/lit8 v2, v0, 0x3

    const/4 v3, 0x0

    if-eq v2, p1, :cond_3

    move p1, v1

    goto :goto_3

    :cond_3
    move p1, v3

    :goto_3
    and-int/2addr v0, v1

    invoke-interface {v8, p1, v0}, Lbxb;->J(ZI)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {p0, v8}, Ldxl;->f(Ladsh;Lbxb;)Lcau;

    move-result-object p1

    sget-object v0, Ldca;->f:Lbxj;

    invoke-interface {v8, v0}, Lbxb;->e(Lbxj;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {p1}, Lqkj;->e(Lcau;)Lqhq;

    move-result-object v2

    iget-boolean v2, v2, Lqhq;->d:Z

    invoke-virtual {v0, v2}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    move-object v0, v8

    check-cast v0, Lbyb;

    invoke-virtual {v0}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v2

    sget-object v4, Lbxa;->a:Ljava/lang/Object;

    if-ne v2, v4, :cond_4

    new-instance v2, Lbzc;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Lcai;-><init>(F)V

    invoke-virtual {v0, v2}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_4
    check-cast v2, Lbyv;

    invoke-interface {v2}, Lbxx;->d()F

    move-result v0

    invoke-static {p1}, Lqkj;->e(Lcau;)Lqhq;

    move-result-object v4

    iget-object v4, v4, Lqhq;->f:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    sub-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    sget-wide v4, Lqhw;->a:J

    sget v4, Lqhw;->b:F

    cmpg-float v0, v0, v4

    if-gtz v0, :cond_5

    goto :goto_4

    :cond_5
    move v1, v3

    :goto_4
    invoke-static {p1}, Lqkj;->e(Lcau;)Lqhq;

    move-result-object v0

    invoke-static {v0, v8, v3}, Lqkj;->g(Lqhq;Lbxb;I)V

    invoke-static {p1}, Lqkj;->e(Lcau;)Lqhq;

    move-result-object v0

    iget-boolean v0, v0, Lqhq;->c:Z

    new-instance v4, Lqhz;

    invoke-direct {v4, p1, v2, v1, v3}, Lqhz;-><init>(Lcau;Lbyv;ZI)V

    const p1, 0x4c1047f

    invoke-static {p1, v4, v8}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v7

    const/high16 v9, 0x30000

    const/16 v10, 0x1e

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v2, v0

    invoke-static/range {v2 .. v10}, Lvz;->aO(ZLcio;Ladm;Ladn;Ljava/lang/String;Ladgn;Lbxb;II)V

    goto :goto_5

    :cond_6
    invoke-interface {v8}, Lbxb;->s()V

    :goto_5
    invoke-interface {v8}, Lbxb;->K()Lbzo;

    move-result-object p1

    if-eqz p1, :cond_7

    new-instance v0, Lkml;

    const/16 v1, 0xb

    invoke-direct {v0, p0, p2, v1}, Lkml;-><init>(Ljava/lang/Object;II)V

    iput-object v0, p1, Lbzo;->c:Ladgm;

    :cond_7
    return-void
.end method

.method public static i(Lsbl;Lqho;ZLbyw;ZZLadgi;Lbxb;I)V
    .locals 31

    move-object/from16 v2, p1

    move/from16 v8, p2

    move/from16 v9, p4

    move/from16 v1, p5

    move/from16 v10, p8

    and-int/lit8 v0, v10, 0x6

    const v3, -0x3ef5d49b

    move-object/from16 v4, p7

    invoke-interface {v4, v3}, Lbxb;->b(I)Lbxb;

    move-result-object v14

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-nez v0, :cond_1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-interface {v14, v0}, Lbxb;->B(I)Z

    move-result v0

    if-eq v4, v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v10

    goto :goto_1

    :cond_1
    move v0, v10

    :goto_1
    and-int/lit8 v5, v10, 0x30

    if-nez v5, :cond_3

    invoke-interface {v14, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v5

    if-eq v4, v5, :cond_2

    const/16 v5, 0x10

    goto :goto_2

    :cond_2
    const/16 v5, 0x20

    :goto_2
    or-int/2addr v0, v5

    :cond_3
    and-int/lit16 v5, v10, 0x180

    if-nez v5, :cond_5

    invoke-interface {v14, v8}, Lbxb;->E(Z)Z

    move-result v5

    if-eq v4, v5, :cond_4

    const/16 v5, 0x80

    goto :goto_3

    :cond_4
    const/16 v5, 0x100

    :goto_3
    or-int/2addr v0, v5

    :cond_5
    and-int/lit16 v5, v10, 0xc00

    if-nez v5, :cond_7

    move-object/from16 v5, p3

    invoke-interface {v14, v5}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v11

    if-eq v4, v11, :cond_6

    const/16 v11, 0x400

    goto :goto_4

    :cond_6
    const/16 v11, 0x800

    :goto_4
    or-int/2addr v0, v11

    goto :goto_5

    :cond_7
    move-object/from16 v5, p3

    :goto_5
    and-int/lit16 v11, v10, 0x6000

    if-nez v11, :cond_9

    invoke-interface {v14, v9}, Lbxb;->E(Z)Z

    move-result v11

    if-eq v4, v11, :cond_8

    const/16 v11, 0x2000

    goto :goto_6

    :cond_8
    const/16 v11, 0x4000

    :goto_6
    or-int/2addr v0, v11

    :cond_9
    const/high16 v11, 0x30000

    and-int/2addr v11, v10

    const/high16 v12, 0x20000

    if-nez v11, :cond_b

    invoke-interface {v14, v1}, Lbxb;->E(Z)Z

    move-result v11

    if-eq v4, v11, :cond_a

    const/high16 v11, 0x10000

    goto :goto_7

    :cond_a
    move v11, v12

    :goto_7
    or-int/2addr v0, v11

    :cond_b
    const/high16 v11, 0x180000

    and-int/2addr v11, v10

    const/high16 v13, 0x100000

    if-nez v11, :cond_d

    move-object/from16 v11, p6

    invoke-interface {v14, v11}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v15

    if-eq v4, v15, :cond_c

    const/high16 v15, 0x80000

    goto :goto_8

    :cond_c
    move v15, v13

    :goto_8
    or-int/2addr v0, v15

    goto :goto_9

    :cond_d
    move-object/from16 v11, p6

    :goto_9
    const v15, 0x92493

    and-int/2addr v15, v0

    const v4, 0x92492

    if-eq v15, v4, :cond_e

    const/4 v4, 0x1

    goto :goto_a

    :cond_e
    const/4 v4, 0x0

    :goto_a
    and-int/lit8 v15, v0, 0x1

    invoke-interface {v14, v4, v15}, Lbxb;->J(ZI)Z

    move-result v4

    if-eqz v4, :cond_26

    iget-object v4, v2, Lqho;->e:Ladsh;

    invoke-static {v4, v14}, Ldxl;->f(Ladsh;Lbxb;)Lcau;

    move-result-object v4

    invoke-static {v4}, Lwqz;->t(Lcau;)Z

    move-result v15

    const/high16 v16, 0x42400000    # 48.0f

    const/4 v7, 0x3

    if-nez v15, :cond_f

    sget-wide v19, Lsna;->a:J

    goto :goto_b

    :cond_f
    iget v15, v2, Lqho;->j:I

    if-ne v15, v3, :cond_10

    sget-wide v19, Lsna;->a:J

    goto :goto_b

    :cond_10
    if-ne v15, v7, :cond_11

    sget-wide v15, Lqhw;->a:J

    const/high16 v16, 0x43850000    # 266.0f

    goto :goto_b

    :cond_11
    sget-wide v15, Lqhw;->a:J

    const/high16 v16, 0x43200000    # 160.0f

    :goto_b
    const/16 v15, 0x180

    move/from16 v11, v16

    const/16 v16, 0xa

    move/from16 v19, v12

    const/4 v12, 0x0

    move/from16 v20, v13

    const-string v13, "SliderWidth"

    move/from16 v6, v19

    move/from16 v3, v20

    invoke-static/range {v11 .. v16}, Laeo;->a(FLaes;Ljava/lang/String;Lbxb;II)Lcau;

    move-result-object v21

    iget v11, v2, Lqho;->j:I

    if-ne v11, v7, :cond_12

    const/4 v13, 0x1

    goto :goto_c

    :cond_12
    const/4 v13, 0x0

    :goto_c
    iget-object v7, v2, Lqho;->d:Ladsh;

    invoke-static {v7, v14}, Ldxl;->f(Ladsh;Lbxb;)Lcau;

    move-result-object v7

    invoke-static {v7}, Lwqz;->t(Lcau;)Z

    move-result v7

    invoke-static {v4}, Lwqz;->t(Lcau;)Z

    move-result v12

    if-nez v8, :cond_14

    if-eqz v13, :cond_13

    if-eqz v7, :cond_13

    goto :goto_d

    :cond_13
    const/4 v15, 0x0

    goto :goto_e

    :cond_14
    :goto_d
    const/4 v15, 0x1

    :goto_e
    if-eqz v8, :cond_16

    if-eqz v13, :cond_15

    if-eqz v7, :cond_15

    goto :goto_f

    :cond_15
    const/4 v7, 0x0

    goto :goto_10

    :cond_16
    :goto_f
    const/4 v7, 0x1

    :goto_10
    const v3, -0x578d783e

    invoke-interface {v14, v3}, Lbxb;->w(I)V

    iget-object v3, v2, Lqho;->b:Lsmv;

    if-eqz v15, :cond_17

    const v15, -0x28809122

    invoke-interface {v14, v15}, Lbxb;->w(I)V

    iget-object v15, v3, Lsmv;->g:Lsmu;

    invoke-static {v15, v12, v14}, Lqkj;->ay(Lsmu;ZLbxb;)Lsmu;

    move-result-object v15

    move-object/from16 v16, v14

    check-cast v16, Lbyb;

    invoke-virtual/range {v16 .. v16}, Lbyb;->X()V

    move-object/from16 v27, v15

    goto :goto_11

    :cond_17
    const v15, 0x186f97a0

    invoke-interface {v14, v15}, Lbxb;->w(I)V

    move-object v15, v14

    check-cast v15, Lbyb;

    invoke-virtual {v15}, Lbyb;->X()V

    const/16 v27, 0x0

    :goto_11
    if-eqz v7, :cond_18

    const v7, -0x28808021

    invoke-interface {v14, v7}, Lbxb;->w(I)V

    iget-object v7, v3, Lsmv;->h:Lsmu;

    invoke-static {v7, v12, v14}, Lqkj;->ay(Lsmu;ZLbxb;)Lsmu;

    move-result-object v7

    move-object v12, v14

    check-cast v12, Lbyb;

    invoke-virtual {v12}, Lbyb;->X()V

    move-object/from16 v28, v7

    goto :goto_12

    :cond_18
    const v7, 0x1871aa80

    invoke-interface {v14, v7}, Lbxb;->w(I)V

    move-object v7, v14

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->X()V

    const/16 v28, 0x0

    :goto_12
    const/16 v29, 0x0

    const/16 v30, 0x1e7f

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v23, v3

    invoke-static/range {v23 .. v30}, Lsmv;->a(Lsmv;Ljava/util/Set;ILjava/util/List;Lsmu;Lsmu;II)Lsmv;

    move-result-object v3

    move-object v7, v14

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->X()V

    invoke-static {v3, v14}, Lcbf;->c(Ljava/lang/Object;Lbxb;)Lcau;

    move-result-object v12

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v15

    sget-object v6, Lbxa;->a:Ljava/lang/Object;

    if-ne v15, v6, :cond_19

    sget-object v15, Lbzw;->c:Lbzw;

    new-instance v1, Lbzg;

    move-object/from16 v23, v3

    const/4 v3, 0x0

    invoke-direct {v1, v3, v15}, Lcao;-><init>(Ljava/lang/Object;Lcap;)V

    invoke-virtual {v7, v1}, Lbyb;->ad(Ljava/lang/Object;)V

    move-object v15, v1

    goto :goto_13

    :cond_19
    move-object/from16 v23, v3

    :goto_13
    move-object v1, v15

    check-cast v1, Lbyw;

    sget-object v3, Lcib;->k:Lcic;

    sget-object v15, Lats;->d:Latr;

    move-object/from16 v24, v1

    sget-object v1, Lcio;->e:Lcil;

    const/16 v5, 0x36

    invoke-static {v15, v3, v14, v5}, Lauf;->a(Latr;Lcic;Lbxb;I)Lcvu;

    move-result-object v3

    invoke-static {v14}, Ldbz;->ai(Lbxb;)J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, La;->e(J)I

    move-result v5

    invoke-virtual {v7}, Lbyb;->ah()Lcfh;

    move-result-object v15

    move/from16 v16, v5

    invoke-static {v14, v1}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v5

    sget-object v8, Lcyc;->a:Ladfx;

    invoke-interface {v14}, Lbxb;->x()V

    iget-boolean v9, v7, Lbyb;->t:Z

    if-eqz v9, :cond_1a

    invoke-interface {v14, v8}, Lbxb;->j(Ladfx;)V

    goto :goto_14

    :cond_1a
    invoke-interface {v14}, Lbxb;->z()V

    :goto_14
    sget-object v9, Lcyc;->e:Ladgm;

    invoke-static {v14, v3, v9}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v3, Lcyc;->d:Ladgm;

    invoke-static {v14, v15, v3}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    sget-object v10, Lcyc;->f:Ladgm;

    invoke-static {v14, v15, v10}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v15, Lcyc;->g:Ladgi;

    invoke-static {v14, v15}, Lcay;->b(Lbxb;Ladgi;)V

    move-object/from16 v25, v10

    sget-object v10, Lcyc;->c:Ladgm;

    invoke-static {v14, v5, v10}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    iget-object v5, v2, Lqho;->c:Ladsh;

    invoke-static {v5, v14}, Ldxl;->f(Ladsh;Lbxb;)Lcau;

    move-result-object v5

    invoke-interface {v5}, Lcau;->fr()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    shl-int/lit8 v16, v0, 0x3

    and-int/lit8 v16, v16, 0x70

    move-object/from16 v26, v15

    move/from16 v15, v16

    const/16 v16, 0x0

    move/from16 v27, v11

    move-object v11, v5

    move/from16 v5, v27

    move-object/from16 v27, v10

    move-object/from16 v10, v26

    move-object/from16 v26, v7

    move-object v7, v12

    move-object/from16 v12, p0

    invoke-static/range {v11 .. v16}, Ltqz;->bT(Ljava/lang/String;Lsbl;ZLbxb;II)V

    iget-object v11, v2, Lqho;->a:Lnqq;

    invoke-static {v11}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "slider_"

    invoke-virtual {v13, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v1, v12}, Ldco;->b(Lcio;Ljava/lang/String;)Lcio;

    move-result-object v1

    sget-wide v12, Lqhw;->a:J

    const/4 v12, 0x0

    const/high16 v13, 0x41a00000    # 20.0f

    if-eqz p4, :cond_1b

    move v15, v12

    goto :goto_15

    :cond_1b
    move v15, v13

    :goto_15
    if-eqz p4, :cond_1c

    goto :goto_16

    :cond_1c
    move v12, v13

    :goto_16
    invoke-static {v13, v13, v12, v15}, Lbcc;->c(FFFF)Lbca;

    move-result-object v12

    invoke-static {v1, v12}, Ldbz;->K(Lcio;Lcnc;)Lcio;

    move-result-object v1

    const v12, 0x7f060056

    invoke-static {v12, v14}, Ldcr;->b(ILbxb;)J

    move-result-wide v12

    invoke-static {v1, v12, v13}, Lvz;->an(Lcio;J)Lcio;

    move-result-object v1

    const/high16 v12, 0x42280000    # 42.0f

    invoke-static {v1, v12}, Lavw;->a(Lcio;F)Lcio;

    move-result-object v1

    invoke-static {v1}, Lavw;->q(Lcio;)Lcio;

    move-result-object v12

    invoke-static/range {p5 .. p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v4}, Lwqz;->t(Lcau;)Z

    move-result v13

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    filled-new-array {v11, v1, v13}, [Ljava/lang/Object;

    move-result-object v11

    const/high16 v1, 0x70000

    and-int/2addr v1, v0

    const/high16 v13, 0x20000

    if-ne v1, v13, :cond_1d

    const/4 v1, 0x1

    goto :goto_17

    :cond_1d
    const/4 v1, 0x0

    :goto_17
    invoke-interface {v14, v4}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v13

    or-int/2addr v1, v13

    const/high16 v13, 0x380000

    and-int/2addr v13, v0

    const/high16 v15, 0x100000

    if-ne v13, v15, :cond_1e

    const/4 v13, 0x1

    goto :goto_18

    :cond_1e
    const/4 v13, 0x0

    :goto_18
    and-int/lit8 v15, v0, 0x70

    move/from16 v16, v1

    const/16 v1, 0x20

    if-ne v15, v1, :cond_1f

    const/4 v1, 0x1

    goto :goto_19

    :cond_1f
    const/4 v1, 0x0

    :goto_19
    and-int/lit16 v0, v0, 0x1c00

    const/16 v15, 0x800

    if-ne v0, v15, :cond_20

    const/4 v0, 0x1

    goto :goto_1a

    :cond_20
    const/4 v0, 0x0

    :goto_1a
    invoke-interface {v14, v7}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v15

    or-int v13, v16, v13

    or-int/2addr v1, v13

    or-int/2addr v0, v1

    or-int/2addr v0, v15

    invoke-virtual/range {v26 .. v26}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v1

    if-nez v0, :cond_22

    if-ne v1, v6, :cond_21

    goto :goto_1b

    :cond_21
    move-object v0, v1

    move-object v15, v3

    move-object v1, v4

    move/from16 v16, v5

    move-object/from16 v13, v26

    move-object/from16 v26, v10

    const/4 v10, 0x0

    goto :goto_1c

    :cond_22
    :goto_1b
    new-instance v0, Lqic;

    move-object v1, v4

    move-object v4, v2

    move-object v2, v1

    move/from16 v1, p5

    move-object v15, v3

    move/from16 v16, v5

    move-object/from16 v6, v24

    move-object/from16 v13, v26

    move-object/from16 v5, p3

    move-object/from16 v3, p6

    move-object/from16 v26, v10

    const/4 v10, 0x0

    invoke-direct/range {v0 .. v7}, Lqic;-><init>(ZLcau;Ladgi;Lqho;Lbyw;Lbyw;Lcau;)V

    move-object v1, v2

    move-object v2, v4

    invoke-virtual {v13, v0}, Lbyb;->ad(Ljava/lang/Object;)V

    :goto_1c
    check-cast v0, Landroidx/compose/ui/input/pointer/PointerInputEventHandler;

    invoke-static {v12, v11, v0}, Lctq;->b(Lcio;[Ljava/lang/Object;Landroidx/compose/ui/input/pointer/PointerInputEventHandler;)Lcio;

    move-result-object v0

    sget-object v3, Lcib;->a:Lcid;

    invoke-static {v3, v10}, Laty;->b(Lcid;Z)Lcvu;

    move-result-object v3

    invoke-static {v14}, Ldbz;->ai(Lbxb;)J

    move-result-wide v4

    invoke-static {v4, v5}, La;->e(J)I

    move-result v4

    invoke-virtual {v13}, Lbyb;->ah()Lcfh;

    move-result-object v5

    invoke-static {v14, v0}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v0

    invoke-interface {v14}, Lbxb;->x()V

    iget-boolean v6, v13, Lbyb;->t:Z

    if-eqz v6, :cond_23

    invoke-interface {v14, v8}, Lbxb;->j(Ladfx;)V

    goto :goto_1d

    :cond_23
    invoke-interface {v14}, Lbxb;->z()V

    :goto_1d
    invoke-static {v14, v3, v9}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v14, v5, v15}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v4, v25

    invoke-static {v14, v3, v4}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    move-object/from16 v3, v26

    invoke-static {v14, v3}, Lcay;->b(Lbxb;Ladgi;)V

    move-object/from16 v3, v27

    invoke-static {v14, v0, v3}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    iget-object v12, v2, Lqho;->k:Lwxs;

    invoke-static/range {v21 .. v21}, Lwqz;->B(Lcau;)F

    move-result v0

    invoke-virtual/range {p0 .. p0}, Lsbl;->b()Lsbl;

    move-result-object v3

    iget v3, v3, Lsbl;->e:I

    int-to-float v13, v3

    invoke-static {v1}, Lwqz;->t(Lcau;)Z

    move-result v3

    if-eqz v3, :cond_24

    move/from16 v5, v16

    const/4 v3, 0x2

    if-eq v5, v3, :cond_24

    const/16 v19, 0x1

    goto :goto_1e

    :cond_24
    move/from16 v19, v10

    :goto_1e
    if-eqz p5, :cond_25

    invoke-static {v1}, Lwqz;->t(Lcau;)Z

    move-result v1

    if-eqz v1, :cond_25

    move-object/from16 v11, v23

    const/16 v20, 0x1

    goto :goto_1f

    :cond_25
    move/from16 v20, v10

    move-object/from16 v11, v23

    :goto_1f
    const/16 v23, 0x0

    move-object/from16 v18, v24

    const/16 v24, 0x160

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const v22, 0xc06008

    move-object/from16 v21, v14

    move v14, v0

    invoke-static/range {v11 .. v24}, Ltqz;->cI(Lsmv;Lwxs;FFFLbyw;Lbyw;Lbyw;ZZLbxb;III)V

    move-object/from16 v14, v21

    invoke-interface {v14}, Lbxb;->n()V

    invoke-interface {v14}, Lbxb;->n()V

    goto :goto_20

    :cond_26
    invoke-interface {v14}, Lbxb;->s()V

    :goto_20
    invoke-interface {v14}, Lbxb;->K()Lbzo;

    move-result-object v9

    if-eqz v9, :cond_27

    new-instance v0, Lqhx;

    move-object/from16 v1, p0

    move/from16 v3, p2

    move-object/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lqhx;-><init>(Lsbl;Lqho;ZLbyw;ZZLadgi;I)V

    iput-object v0, v9, Lbzo;->c:Ladgm;

    :cond_27
    return-void
.end method

.method public static j(Lcio;Lyeh;ZLsbl;Lcic;Ladgi;ZZLadgi;Lbxb;I)V
    .locals 19

    move-object/from16 v1, p0

    move-object/from16 v5, p4

    move/from16 v10, p10

    and-int/lit8 v0, v10, 0x6

    const v2, 0x2d7668b7

    move-object/from16 v3, p9

    invoke-interface {v3, v2}, Lbxb;->b(I)Lbxb;

    move-result-object v2

    const/4 v3, 0x1

    if-nez v0, :cond_1

    invoke-interface {v2, v1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v3, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v10

    goto :goto_1

    :cond_1
    move v0, v10

    :goto_1
    and-int/lit8 v4, v10, 0x30

    move-object/from16 v12, p1

    if-nez v4, :cond_3

    invoke-interface {v2, v12}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v4

    if-eq v3, v4, :cond_2

    const/16 v4, 0x10

    goto :goto_2

    :cond_2
    const/16 v4, 0x20

    :goto_2
    or-int/2addr v0, v4

    :cond_3
    and-int/lit16 v4, v10, 0x180

    move/from16 v14, p2

    if-nez v4, :cond_5

    invoke-interface {v2, v14}, Lbxb;->E(Z)Z

    move-result v4

    if-eq v3, v4, :cond_4

    const/16 v4, 0x80

    goto :goto_3

    :cond_4
    const/16 v4, 0x100

    :goto_3
    or-int/2addr v0, v4

    :cond_5
    and-int/lit16 v4, v10, 0xc00

    if-nez v4, :cond_7

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    invoke-interface {v2, v4}, Lbxb;->B(I)Z

    move-result v4

    if-eq v3, v4, :cond_6

    const/16 v4, 0x400

    goto :goto_4

    :cond_6
    const/16 v4, 0x800

    :goto_4
    or-int/2addr v0, v4

    :cond_7
    and-int/lit16 v4, v10, 0x6000

    if-nez v4, :cond_9

    invoke-interface {v2, v5}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v4

    if-eq v3, v4, :cond_8

    const/16 v4, 0x2000

    goto :goto_5

    :cond_8
    const/16 v4, 0x4000

    :goto_5
    or-int/2addr v0, v4

    :cond_9
    const/high16 v4, 0x30000

    and-int/2addr v4, v10

    move-object/from16 v6, p5

    if-nez v4, :cond_b

    invoke-interface {v2, v6}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v4

    if-eq v3, v4, :cond_a

    const/high16 v4, 0x10000

    goto :goto_6

    :cond_a
    const/high16 v4, 0x20000

    :goto_6
    or-int/2addr v0, v4

    :cond_b
    const/high16 v4, 0x180000

    and-int/2addr v4, v10

    move/from16 v7, p6

    if-nez v4, :cond_d

    invoke-interface {v2, v7}, Lbxb;->E(Z)Z

    move-result v4

    if-eq v3, v4, :cond_c

    const/high16 v4, 0x80000

    goto :goto_7

    :cond_c
    const/high16 v4, 0x100000

    :goto_7
    or-int/2addr v0, v4

    :cond_d
    const/high16 v4, 0xc00000

    and-int/2addr v4, v10

    move/from16 v8, p7

    if-nez v4, :cond_f

    invoke-interface {v2, v8}, Lbxb;->E(Z)Z

    move-result v4

    if-eq v3, v4, :cond_e

    const/high16 v4, 0x400000

    goto :goto_8

    :cond_e
    const/high16 v4, 0x800000

    :goto_8
    or-int/2addr v0, v4

    :cond_f
    const/high16 v4, 0x6000000

    and-int/2addr v4, v10

    move-object/from16 v9, p8

    if-nez v4, :cond_11

    invoke-interface {v2, v9}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v4

    if-eq v3, v4, :cond_10

    const/high16 v4, 0x2000000

    goto :goto_9

    :cond_10
    const/high16 v4, 0x4000000

    :goto_9
    or-int/2addr v0, v4

    :cond_11
    const v4, 0x2492493

    and-int/2addr v4, v0

    const v11, 0x2492492

    if-eq v4, v11, :cond_12

    goto :goto_a

    :cond_12
    const/4 v3, 0x0

    :goto_a
    and-int/lit8 v4, v0, 0x1

    invoke-interface {v2, v3, v4}, Lbxb;->J(ZI)Z

    move-result v3

    if-eqz v3, :cond_13

    new-instance v11, Lqia;

    move-object/from16 v15, p3

    move-object v13, v6

    move/from16 v16, v7

    move/from16 v17, v8

    move-object/from16 v18, v9

    invoke-direct/range {v11 .. v18}, Lqia;-><init>(Lyeh;Ladgi;ZLsbl;ZZLadgi;)V

    const v3, -0x10d3a6da

    invoke-static {v3, v11, v2}, Ldbz;->R(ILjava/lang/Object;Lbxb;)Lcfd;

    move-result-object v3

    and-int/lit8 v4, v0, 0xe

    or-int/lit16 v4, v4, 0x180

    shr-int/lit8 v0, v0, 0x9

    and-int/lit8 v0, v0, 0x70

    or-int/2addr v0, v4

    invoke-static {v1, v5, v3, v2, v0}, Lqkj;->k(Lcio;Lcic;Ladgm;Lbxb;I)V

    goto :goto_b

    :cond_13
    invoke-interface {v2}, Lbxb;->s()V

    :goto_b
    invoke-interface {v2}, Lbxb;->K()Lbzo;

    move-result-object v12

    if-eqz v12, :cond_14

    new-instance v0, Lkni;

    const/4 v11, 0x2

    move-object/from16 v2, p1

    move/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v11}, Lkni;-><init>(Lcio;Lyeh;ZLsbl;Lcic;Ladgi;ZZLadgi;II)V

    iput-object v0, v12, Lbzo;->c:Ladgm;

    :cond_14
    return-void
.end method

.method public static k(Lcio;Lcic;Ladgm;Lbxb;I)V
    .locals 7

    and-int/lit8 v0, p4, 0x6

    const v1, 0xe9c91de

    invoke-interface {p3, v1}, Lbxb;->b(I)Lbxb;

    move-result-object p3

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-interface {p3, p0}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v1, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, p4

    goto :goto_1

    :cond_1
    move v0, p4

    :goto_1
    and-int/lit8 v2, p4, 0x30

    const/16 v3, 0x20

    if-nez v2, :cond_3

    invoke-interface {p3, p1}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_2

    const/16 v2, 0x10

    goto :goto_2

    :cond_2
    move v2, v3

    :goto_2
    or-int/2addr v0, v2

    :cond_3
    and-int/lit16 v2, p4, 0x180

    if-nez v2, :cond_5

    invoke-interface {p3, p2}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v2

    if-eq v1, v2, :cond_4

    const/16 v2, 0x80

    goto :goto_3

    :cond_4
    const/16 v2, 0x100

    :goto_3
    or-int/2addr v0, v2

    :cond_5
    and-int/lit16 v2, v0, 0x93

    const/16 v4, 0x92

    const/4 v5, 0x0

    if-eq v2, v4, :cond_6

    goto :goto_4

    :cond_6
    move v1, v5

    :goto_4
    and-int/lit8 v2, v0, 0x1

    invoke-interface {p3, v1, v2}, Lbxb;->J(ZI)Z

    move-result v1

    if-eqz v1, :cond_a

    and-int/lit8 v1, v0, 0x70

    move-object v2, p3

    check-cast v2, Lbyb;

    invoke-virtual {v2}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v4

    if-eq v1, v3, :cond_7

    sget-object v1, Lbxa;->a:Ljava/lang/Object;

    if-ne v4, v1, :cond_8

    :cond_7
    new-instance v4, Lqif;

    invoke-direct {v4, p1, v5}, Lqif;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2, v4}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_8
    shr-int/lit8 v1, v0, 0x6

    shl-int/lit8 v0, v0, 0x3

    and-int/lit8 v1, v1, 0xe

    and-int/lit8 v0, v0, 0x70

    check-cast v4, Lcvu;

    invoke-static {p3}, Ldbz;->ai(Lbxb;)J

    move-result-wide v5

    invoke-static {v5, v6}, La;->e(J)I

    move-result v3

    invoke-virtual {v2}, Lbyb;->ah()Lcfh;

    move-result-object v5

    invoke-static {p3, p0}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v6

    or-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x6

    and-int/lit16 v0, v0, 0x380

    or-int/lit8 v0, v0, 0x6

    sget-object v1, Lcyc;->a:Ladfx;

    invoke-interface {p3}, Lbxb;->x()V

    iget-boolean v2, v2, Lbyb;->t:Z

    if-eqz v2, :cond_9

    invoke-interface {p3, v1}, Lbxb;->j(Ladfx;)V

    goto :goto_5

    :cond_9
    invoke-interface {p3}, Lbxb;->z()V

    :goto_5
    sget-object v1, Lcyc;->e:Ladgm;

    invoke-static {p3, v4, v1}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v1, Lcyc;->d:Ladgm;

    invoke-static {p3, v5, v1}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lcyc;->f:Ladgm;

    invoke-static {p3, v1, v2}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v1, Lcyc;->g:Ladgi;

    invoke-static {p3, v1}, Lcay;->b(Lbxb;Ladgi;)V

    sget-object v1, Lcyc;->c:Ladgm;

    invoke-static {p3, v6, v1}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    shr-int/lit8 v0, v0, 0x6

    and-int/lit8 v0, v0, 0xe

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p2, p3, v0}, Ladgm;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p3}, Lbxb;->n()V

    goto :goto_6

    :cond_a
    invoke-interface {p3}, Lbxb;->s()V

    :goto_6
    invoke-interface {p3}, Lbxb;->K()Lbzo;

    move-result-object p3

    if-eqz p3, :cond_b

    new-instance v0, Lamm;

    const/16 v5, 0x13

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lamm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;II)V

    iput-object v0, p3, Lbzo;->c:Ladgm;

    :cond_b
    return-void
.end method

.method public static l(Lxwg;J)Lxwg;
    .locals 0

    check-cast p0, Lxwm;

    iget-object p0, p0, Lxwm;->a:Ljava/lang/Object;

    check-cast p0, Llny;

    invoke-interface {p0, p1, p2}, Llny;->e(J)Llnu;

    move-result-object p0

    invoke-virtual {p0}, Llnu;->d()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0

    :cond_0
    invoke-static {p0}, Lnze;->a(Llnu;)Lnze;

    move-result-object p0

    invoke-static {p0}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object p0

    return-object p0
.end method

.method public static m(Lxwg;J)Lxwg;
    .locals 0

    check-cast p0, Lxwm;

    iget-object p0, p0, Lxwm;->a:Ljava/lang/Object;

    check-cast p0, Llny;

    invoke-interface {p0, p1, p2}, Llny;->e(J)Llnu;

    move-result-object p0

    invoke-virtual {p0}, Llnu;->d()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p0, Lxuz;->a:Lxuz;

    return-object p0

    :cond_0
    iget-object p0, p0, Llnu;->a:[F

    new-instance p1, Lnzg;

    invoke-direct {p1, p0}, Lnzg;-><init>([F)V

    invoke-static {p1}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n(I)I
    .locals 1

    const/high16 v0, -0x80000000

    xor-int/2addr p0, v0

    const v0, -0x7ffffffe

    invoke-static {p0, v0}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method public static o([B)Ljava/util/List;
    .locals 50

    move-object/from16 v0, p0

    array-length v1, v0

    int-to-long v1, v1

    const-wide/16 v3, 0x18

    cmp-long v1, v1, v3

    if-gtz v1, :cond_0

    goto/16 :goto_9

    :cond_0
    const/4 v1, 0x2

    const-wide/16 v2, 0xa

    invoke-static {v1, v0, v2, v3, v1}, Lobf;->t(I[BJI)J

    move-result-wide v4

    const-wide/16 v6, 0x4d4d

    cmp-long v4, v4, v6

    const-wide/16 v5, 0x2a

    const/4 v7, 0x1

    const-wide/16 v8, 0xc

    if-nez v4, :cond_1

    invoke-static {v1, v0, v8, v9, v1}, Lobf;->t(I[BJI)J

    move-result-wide v10

    cmp-long v4, v10, v5

    if-nez v4, :cond_1

    move v4, v1

    goto :goto_0

    :cond_1
    const/4 v4, 0x3

    invoke-static {v4, v0, v2, v3, v1}, Lobf;->t(I[BJI)J

    move-result-wide v10

    const-wide/16 v12, 0x4949

    cmp-long v10, v10, v12

    if-nez v10, :cond_2

    invoke-static {v4, v0, v8, v9, v1}, Lobf;->t(I[BJI)J

    move-result-wide v10

    cmp-long v5, v10, v5

    if-nez v5, :cond_2

    goto :goto_0

    :cond_2
    move v4, v7

    :goto_0
    if-eq v4, v7, :cond_13

    :try_start_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const-wide/16 v6, 0xe

    const/4 v10, 0x4

    invoke-static {v4, v0, v6, v7, v10}, Lobf;->t(I[BJI)J

    move-result-wide v6

    add-long/2addr v6, v2

    :goto_1
    cmp-long v11, v6, v2

    if-eqz v11, :cond_12

    invoke-static {v4, v0, v6, v7, v1}, Lobf;->t(I[BJI)J

    move-result-wide v11

    mul-long/2addr v11, v8

    const-wide/16 v13, 0x2

    add-long/2addr v11, v13

    invoke-static {v11, v12}, Ladhc;->q(J)Ladip;

    move-result-object v15

    invoke-static {v15}, Ladhc;->p(Ladio;)Ladio;

    move-result-object v15

    move-wide/from16 v16, v2

    iget-wide v2, v15, Ladio;->a:J

    move-wide/from16 v18, v8

    iget-wide v8, v15, Ladio;->b:J

    move-wide/from16 v20, v13

    iget-wide v13, v15, Ladio;->c:J

    const-wide/16 v22, 0x0

    cmp-long v15, v13, v22

    if-lez v15, :cond_3

    cmp-long v24, v2, v8

    if-lez v24, :cond_4

    :cond_3
    if-gez v15, :cond_10

    cmp-long v15, v8, v2

    if-gtz v15, :cond_10

    :cond_4
    move-wide/from16 v24, v11

    :goto_2
    add-long v10, v6, v2

    invoke-static {v4, v0, v10, v11, v1}, Lobf;->t(I[BJI)J

    move-result-wide v26

    const-wide/32 v28, 0x8825

    cmp-long v12, v26, v28

    if-nez v12, :cond_f

    const-wide/16 v26, 0x8

    add-long v10, v10, v26

    const/4 v15, 0x4

    invoke-static {v4, v0, v10, v11, v15}, Lobf;->t(I[BJI)J

    move-result-wide v10

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    add-long v10, v10, v16

    :goto_3
    cmp-long v28, v10, v16

    if-eqz v28, :cond_e

    invoke-static {v4, v0, v10, v11, v1}, Lobf;->t(I[BJI)J

    move-result-wide v28

    mul-long v28, v28, v18

    add-long v28, v28, v20

    invoke-static/range {v28 .. v29}, Ladhc;->q(J)Ladip;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Ladhc;->p(Ladio;)Ladio;

    move-result-object v15

    move-wide/from16 v32, v2

    iget-wide v1, v15, Ladio;->a:J

    move-wide/from16 v34, v1

    iget-wide v1, v15, Ladio;->b:J

    move-wide/from16 v36, v1

    iget-wide v1, v15, Ladio;->c:J

    cmp-long v3, v1, v22

    if-lez v3, :cond_5

    cmp-long v15, v34, v36

    if-lez v15, :cond_6

    :cond_5
    if-gez v3, :cond_c

    cmp-long v3, v36, v34

    if-gtz v3, :cond_c

    :cond_6
    :goto_4
    add-long v38, v10, v34

    move-wide/from16 v40, v1

    add-long v1, v38, v20

    const/4 v3, 0x2

    invoke-static {v4, v0, v1, v2, v3}, Lobf;->t(I[BJI)J

    move-result-wide v1

    const-wide/16 v42, 0x4

    move-wide/from16 v44, v1

    add-long v1, v38, v42

    const/4 v15, 0x4

    invoke-static {v4, v0, v1, v2, v15}, Lobf;->t(I[BJI)J

    move-result-wide v1

    move-wide/from16 v30, v1

    add-long v1, v38, v26

    invoke-static {v4, v0, v1, v2, v15}, Lobf;->t(I[BJI)J

    move-result-wide v38

    invoke-static {}, Lqem;->values()[Lqem;

    move-result-object v3

    array-length v15, v3

    const/16 v46, 0x0

    move-object/from16 v47, v3

    move/from16 v3, v46

    :goto_5
    if-ge v3, v15, :cond_8

    move/from16 v46, v3

    aget-object v3, v47, v46

    move-wide/from16 v48, v6

    iget-wide v6, v3, Lqem;->n:J

    cmp-long v6, v6, v44

    if-nez v6, :cond_7

    goto :goto_6

    :cond_7
    add-int/lit8 v3, v46, 0x1

    move-wide/from16 v6, v48

    goto :goto_5

    :cond_8
    move-wide/from16 v48, v6

    const/4 v3, 0x0

    :goto_6
    if-nez v3, :cond_9

    sget-object v3, Lqem;->a:Lqem;

    :cond_9
    iget-wide v6, v3, Lqem;->o:J

    mul-long v6, v6, v30

    cmp-long v3, v6, v42

    if-lez v3, :cond_a

    add-long v1, v38, v16

    new-instance v3, Lvqh;

    invoke-direct {v3, v1, v2, v6, v7}, Lvqh;-><init>(JJ)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_a
    cmp-long v3, v6, v22

    if-lez v3, :cond_b

    new-instance v3, Lvqh;

    invoke-direct {v3, v1, v2, v6, v7}, Lvqh;-><init>(JJ)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b
    :goto_7
    cmp-long v1, v34, v36

    if-eqz v1, :cond_d

    add-long v34, v34, v40

    move-wide/from16 v1, v40

    move-wide/from16 v6, v48

    goto :goto_4

    :cond_c
    move-wide/from16 v48, v6

    :cond_d
    add-long v10, v10, v28

    const/4 v15, 0x4

    invoke-static {v4, v0, v10, v11, v15}, Lobf;->t(I[BJI)J

    move-result-wide v1

    add-long v10, v1, v16

    move-wide/from16 v2, v32

    move-wide/from16 v6, v48

    const/4 v1, 0x2

    goto/16 :goto_3

    :cond_e
    move-wide/from16 v32, v2

    move-wide/from16 v48, v6

    invoke-interface {v5, v12}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_8

    :cond_f
    move-wide/from16 v32, v2

    move-wide/from16 v48, v6

    :goto_8
    cmp-long v1, v32, v8

    if-eqz v1, :cond_11

    add-long v2, v32, v13

    move-wide/from16 v6, v48

    const/4 v1, 0x2

    goto/16 :goto_2

    :cond_10
    move-wide/from16 v48, v6

    move-wide/from16 v24, v11

    :cond_11
    add-long v6, v48, v24

    const/4 v15, 0x4

    invoke-static {v4, v0, v6, v7, v15}, Lobf;->t(I[BJI)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    add-long v6, v1, v16

    move v10, v15

    move-wide/from16 v2, v16

    move-wide/from16 v8, v18

    const/4 v1, 0x2

    goto/16 :goto_1

    :cond_12
    return-object v5

    :catch_0
    :cond_13
    :goto_9
    sget-object v0, Laddh;->a:Laddh;

    return-object v0
.end method

.method public static synthetic p(Lqtw;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lqtw;->k(ILjava/lang/Long;)V

    return-void
.end method

.method public static q(Lqrg;)V
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lqrg;->ag(Ljava/lang/Integer;)V

    return-void
.end method

.method public static r()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only used by Burst and Photosphere sessions"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static s()Lzfe;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported for CaptureSessions unless overridden"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static t()Lzfe;
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported for CaptureSessions unless overridden"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static u()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported for CaptureSessions unless overridden"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static v()V
    .locals 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not supported for CaptureSessions unless overridden"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static w(Luky;)Z
    .locals 1

    sget-object v0, Luky;->b:Luky;

    if-eq p0, v0, :cond_1

    sget-object v0, Luky;->d:Luky;

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

.method public static x(Lbyw;)Lqlh;
    .locals 0

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqlh;

    return-object p0
.end method

.method public static y(Lcau;)Lqnu;
    .locals 0

    invoke-interface {p0}, Lcau;->fr()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqnu;

    return-object p0
.end method

.method public static z(Ljava/lang/String;Lcnc;Lcio;Ladfx;Lbxb;II)V
    .locals 28

    move-object/from16 v2, p1

    move/from16 v5, p5

    and-int/lit8 v0, v5, 0x6

    const v1, 0x7e69f044

    move-object/from16 v3, p4

    invoke-interface {v3, v1}, Lbxb;->b(I)Lbxb;

    move-result-object v11

    const/4 v1, 0x1

    move-object/from16 v6, p0

    if-nez v0, :cond_1

    invoke-interface {v11, v6}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v0

    if-eq v1, v0, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    or-int/2addr v0, v5

    goto :goto_1

    :cond_1
    move v0, v5

    :goto_1
    and-int/lit8 v3, v5, 0x30

    if-nez v3, :cond_3

    invoke-interface {v11, v2}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v3

    if-eq v1, v3, :cond_2

    const/16 v3, 0x10

    goto :goto_2

    :cond_2
    const/16 v3, 0x20

    :goto_2
    or-int/2addr v0, v3

    :cond_3
    and-int/lit8 v3, p6, 0x4

    if-eqz v3, :cond_4

    or-int/lit16 v0, v0, 0x180

    goto :goto_4

    :cond_4
    and-int/lit16 v4, v5, 0x180

    if-nez v4, :cond_6

    move-object/from16 v4, p2

    invoke-interface {v11, v4}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v7

    if-eq v1, v7, :cond_5

    const/16 v7, 0x80

    goto :goto_3

    :cond_5
    const/16 v7, 0x100

    :goto_3
    or-int/2addr v0, v7

    goto :goto_5

    :cond_6
    :goto_4
    move-object/from16 v4, p2

    :goto_5
    and-int/lit8 v7, p6, 0x8

    const/16 v8, 0x800

    if-eqz v7, :cond_7

    or-int/lit16 v0, v0, 0xc00

    goto :goto_7

    :cond_7
    and-int/lit16 v9, v5, 0xc00

    if-nez v9, :cond_9

    move-object/from16 v9, p3

    invoke-interface {v11, v9}, Lbxb;->F(Ljava/lang/Object;)Z

    move-result v10

    if-eq v1, v10, :cond_8

    const/16 v10, 0x400

    goto :goto_6

    :cond_8
    move v10, v8

    :goto_6
    or-int/2addr v0, v10

    goto :goto_8

    :cond_9
    :goto_7
    move-object/from16 v9, p3

    :goto_8
    and-int/lit16 v10, v0, 0x493

    const/16 v12, 0x492

    const/4 v13, 0x0

    if-eq v10, v12, :cond_a

    goto :goto_9

    :cond_a
    move v1, v13

    :goto_9
    and-int/lit8 v10, v0, 0x1

    invoke-interface {v11, v1, v10}, Lbxb;->J(ZI)Z

    move-result v1

    if-eqz v1, :cond_16

    if-eqz v3, :cond_b

    sget-object v1, Lcio;->e:Lcil;

    goto :goto_a

    :cond_b
    move-object v1, v4

    :goto_a
    if-eqz v7, :cond_c

    const/4 v3, 0x0

    goto :goto_b

    :cond_c
    move-object v3, v9

    :goto_b
    const v4, -0x7450d2c4

    invoke-interface {v11, v4}, Lbxb;->w(I)V

    invoke-static {v1}, Lbop;->a(Lcio;)Lcio;

    move-result-object v4

    sget-wide v9, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    const/high16 v7, 0x42200000    # 40.0f

    const/4 v9, 0x0

    const/16 v10, 0xd

    invoke-static {v4, v9, v7, v9, v10}, Lavw;->l(Lcio;FFFI)Lcio;

    move-result-object v4

    invoke-static {v4, v2}, Ldbz;->K(Lcio;Lcnc;)Lcio;

    move-result-object v4

    sget-wide v14, Lcom/google/android/apps/camera/sauce/viewfinder/SauceSelectionOverlay;->b:J

    invoke-static {v4, v14, v15}, Lvz;->an(Lcio;J)Lcio;

    move-result-object v4

    if-eqz v3, :cond_f

    sget-object v14, Lcio;->e:Lcil;

    new-instance v7, Ldfr;

    invoke-direct {v7, v13}, Ldfr;-><init>(I)V

    and-int/lit16 v9, v0, 0x1c00

    move-object v12, v11

    check-cast v12, Lbyb;

    invoke-virtual {v12}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v15

    if-eq v9, v8, :cond_d

    sget-object v8, Lbxa;->a:Ljava/lang/Object;

    if-ne v15, v8, :cond_e

    :cond_d
    new-instance v15, Lqhh;

    const/4 v8, 0x6

    invoke-direct {v15, v3, v8}, Lqhh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v12, v15}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_e
    move-object/from16 v18, v15

    check-cast v18, Ladfx;

    const/16 v19, 0xb

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v17, v7

    invoke-static/range {v14 .. v19}, Lvz;->ak(Lcio;ZLjava/lang/String;Ldfr;Ladfx;I)Lcio;

    move-result-object v7

    invoke-interface {v4, v7}, Lcio;->a(Lcio;)Lcio;

    move-result-object v4

    :cond_f
    move-object v7, v11

    check-cast v7, Lbyb;

    invoke-virtual {v7}, Lbyb;->X()V

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v8

    sget-object v9, Lbxa;->a:Ljava/lang/Object;

    if-ne v8, v9, :cond_10

    new-instance v8, Lmbc;

    invoke-direct {v8, v10}, Lmbc;-><init>(I)V

    invoke-virtual {v7, v8}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_10
    check-cast v8, Ladgi;

    invoke-static {v4, v8}, Ldfw;->c(Lcio;Ladgi;)Lcio;

    move-result-object v4

    const/high16 v8, 0x41200000    # 10.0f

    const/high16 v10, 0x41800000    # 16.0f

    if-eqz v3, :cond_11

    move v12, v8

    goto :goto_c

    :cond_11
    move v12, v10

    :goto_c
    invoke-static {v4, v10, v8, v12, v8}, Lvz;->aa(Lcio;FFFF)Lcio;

    move-result-object v4

    sget-object v8, Lcib;->n:Lcih;

    sget-object v10, Lats;->e:Latm;

    const/16 v12, 0x36

    invoke-static {v10, v8, v11, v12}, Lavs;->a(Latl;Lcih;Lbxb;I)Lcvu;

    move-result-object v8

    invoke-static {v11}, Ldbz;->ai(Lbxb;)J

    move-result-wide v14

    invoke-static {v14, v15}, La;->e(J)I

    move-result v10

    invoke-virtual {v7}, Lbyb;->ah()Lcfh;

    move-result-object v12

    invoke-static {v11, v4}, Lcbq;->l(Lbxb;Lcio;)Lcio;

    move-result-object v4

    sget-object v14, Lcyc;->a:Ladfx;

    invoke-interface {v11}, Lbxb;->x()V

    iget-boolean v15, v7, Lbyb;->t:Z

    if-eqz v15, :cond_12

    invoke-interface {v11, v14}, Lbxb;->j(Ladfx;)V

    goto :goto_d

    :cond_12
    invoke-interface {v11}, Lbxb;->z()V

    :goto_d
    sget-object v14, Lcyc;->e:Ladgm;

    invoke-static {v11, v8, v14}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v8, Lcyc;->d:Ladgm;

    invoke-static {v11, v12, v8}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v10, Lcyc;->f:Ladgm;

    invoke-static {v11, v8, v10}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    sget-object v8, Lcyc;->g:Ladgi;

    invoke-static {v11, v8}, Lcay;->b(Lbxb;Ladgi;)V

    sget-object v8, Lcyc;->c:Ladgm;

    invoke-static {v11, v4, v8}, Lcay;->c(Lbxb;Ljava/lang/Object;Ladgm;)V

    const v4, 0x7f130836

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v4, v8, v11}, Ldcm;->e(I[Ljava/lang/Object;Lbxb;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v11}, Ldbz;->av(Lbxb;)Lbtq;

    move-result-object v8

    iget-object v8, v8, Lbtq;->o:Ldic;

    sget-wide v14, Lclz;->c:J

    sget-object v10, Lcio;->e:Lcil;

    invoke-interface {v11, v4}, Lbxb;->D(Ljava/lang/Object;)Z

    move-result v12

    invoke-virtual {v7}, Lbyb;->S()Ljava/lang/Object;

    move-result-object v13

    if-nez v12, :cond_13

    if-ne v13, v9, :cond_14

    :cond_13
    new-instance v13, Lqba;

    const/16 v9, 0xc

    invoke-direct {v13, v4, v9}, Lqba;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v7, v13}, Lbyb;->ad(Ljava/lang/Object;)V

    :cond_14
    check-cast v13, Ladgi;

    invoke-static {v10, v13}, Ldfw;->b(Lcio;Ladgi;)Lcio;

    move-result-object v4

    and-int/lit8 v0, v0, 0xe

    or-int/lit16 v0, v0, 0x180

    const/16 v24, 0x0

    const v25, 0x1fff8

    move-object v9, v10

    move-object/from16 v22, v11

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    move-object/from16 v21, v8

    move-wide/from16 v26, v14

    move-object v15, v9

    move-wide/from16 v8, v26

    const/4 v14, 0x0

    move-object/from16 v17, v15

    const-wide/16 v15, 0x0

    move-object/from16 v18, v17

    const/16 v17, 0x0

    move-object/from16 v19, v18

    const/16 v18, 0x0

    move-object/from16 v20, v19

    const/16 v19, 0x0

    move-object/from16 v23, v20

    const/16 v20, 0x0

    move-object/from16 p2, v7

    move-object v7, v4

    move-object/from16 v4, v23

    move/from16 v23, v0

    const/4 v0, 0x0

    invoke-static/range {v6 .. v25}, Lbsx;->b(Ljava/lang/String;Lcio;JJJLdmx;JIZIILdic;Lbxb;III)V

    move-object/from16 v11, v22

    if-eqz v3, :cond_15

    const v6, -0x2696ad82

    invoke-interface {v11, v6}, Lbxb;->w(I)V

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v4, v6}, Lavw;->f(Lcio;F)Lcio;

    move-result-object v4

    invoke-static {v4, v11}, Laws;->h(Lcio;Lbxb;)V

    const v4, 0x7f080314

    invoke-static {v4, v11, v0}, Ldbz;->i(ILbxb;I)Lcov;

    move-result-object v6

    const/16 v12, 0xc38

    const/4 v13, 0x4

    const/4 v7, 0x0

    move-wide v9, v8

    const/4 v8, 0x0

    invoke-static/range {v6 .. v13}, Lbok;->a(Lcov;Ljava/lang/String;Lcio;JLbxb;II)V

    invoke-virtual/range {p2 .. p2}, Lbyb;->X()V

    goto :goto_e

    :cond_15
    const v0, -0x2692fb86

    invoke-interface {v11, v0}, Lbxb;->w(I)V

    invoke-virtual/range {p2 .. p2}, Lbyb;->X()V

    :goto_e
    invoke-interface {v11}, Lbxb;->n()V

    move-object v4, v3

    move-object v3, v1

    goto :goto_f

    :cond_16
    invoke-interface {v11}, Lbxb;->s()V

    move-object v3, v4

    move-object v4, v9

    :goto_f
    invoke-interface {v11}, Lbxb;->K()Lbzo;

    move-result-object v8

    if-eqz v8, :cond_17

    new-instance v0, Lqnb;

    const/4 v7, 0x0

    move-object/from16 v1, p0

    move/from16 v6, p6

    invoke-direct/range {v0 .. v7}, Lqnb;-><init>(Ljava/lang/String;Lcnc;Lcio;Ladfx;III)V

    iput-object v0, v8, Lbzo;->c:Ladgm;

    :cond_17
    return-void
.end method
