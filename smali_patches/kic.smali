.class public final Lkic;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field private static final a:Ljava/lang/Float;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const v0, 0x409ae148    # 4.84f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lkic;->a:Ljava/lang/Float;

    return-void
.end method

.method public static a(Lklm;Lklm;Luyv;Lklg;)V
    .locals 11

    sget-object v0, Lkjl;->aO:Lkiz;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    iget-boolean v0, p2, Luyv;->L:Z

    const/16 v2, 0x5dc

    if-eq v1, v0, :cond_0

    const/16 v3, 0x640

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    sget-object v4, Lkjl;->p:Lkiy;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v4, v3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object v3, Lkjl;->bw:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->v(Lkiz;Z)V

    sget-object v3, Lkjl;->bk:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjl;->am:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjl;->ai:Lkiz;

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjl;->bz:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->v(Lkiz;Z)V

    sget-object v3, Lkjl;->bB:Lkiz;

    invoke-virtual {p0, v3, v0}, Lklm;->v(Lkiz;Z)V

    sget-object v3, Lkjl;->br:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjl;->aW:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    iget-boolean p2, p2, Luyv;->M:Z

    if-eq v1, p2, :cond_1

    const v3, 0x3f0c8fbe

    goto :goto_1

    :cond_1
    const v3, 0x3efd2c38

    :goto_1
    sget-object v5, Lkle;->t:Lkiz;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p0, v5, v3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkle;->v:Lkiz;

    const/high16 v5, 0x40a00000    # 5.0f

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    if-eq v1, p2, :cond_2

    const/high16 v3, 0x41000000    # 8.0f

    goto :goto_2

    :cond_2
    const/high16 v3, 0x41200000    # 10.0f

    :goto_2
    sget-object v6, Lkle;->s:Lkiz;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p0, v6, v3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkle;->h:Lkiz;

    invoke-virtual {p0, v3, v0}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjl;->V:Lkiz;

    const-string v6, "3840x2736"

    invoke-virtual {p0, v3, v6}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkhs;->g:Lkiz;

    const v6, 0x3f204189    # 0.626f

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-virtual {p0, v3, v6}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkhs;->h:Lkiz;

    const v6, 0x3f4f5c29    # 0.81f

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-virtual {p0, v3, v6}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkhs;->a:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkhs;->e:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkhs;->c:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkhs;->d:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkiv;->f:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkiv;->q:Lkiz;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-virtual {p0, v3, v6}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkiv;->g:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkiv;->j:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkiv;->m:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkis;->b:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkis;->c:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkis;->d:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkim;->d:Lkiz;

    invoke-virtual {p0, v3, v0}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkim;->e:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->B:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->ab:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->ac:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->N:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->I:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->O:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->Q:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->R:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->T:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->U:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->V:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->ad:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    if-eq v1, p2, :cond_3

    const/high16 v0, 0x40e00000    # 7.0f

    goto :goto_3

    :cond_3
    const/high16 v0, 0x41a00000    # 20.0f

    :goto_3
    sget-object v3, Lkhy;->av:Lkiz;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkhy;->aw:Lkiz;

    invoke-virtual {p0, v3, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkhy;->au:Lkiz;

    invoke-virtual {p0, v3, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v0, Lkhy;->v:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkjl;->Z:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkjr;->b:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->af:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->W:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->F:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->Y:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->w:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->S:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->am:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->k:Lkiy;

    if-eqz p2, :cond_4

    const/16 v3, 0xa1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_4

    :cond_4
    const/16 v3, 0xb5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_4
    invoke-virtual {p0, v0, v3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object v0, Lkhy;->ah:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->an:Lkiz;

    invoke-virtual {p0, v0, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkhy;->E:Lkiz;

    invoke-virtual {p0, v0, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v0, Lkla;->p:Lkiz;

    invoke-virtual {p0, v0, p2}, Lklm;->v(Lkiz;Z)V

    sget-object v0, Lkla;->s:Lkiz;

    if-eqz p2, :cond_5

    sget-object v3, Lklg;->c:Lklg;

    invoke-virtual {p3, v3}, Lklg;->b(Lklg;)Z

    move-result v3

    if-eqz v3, :cond_5

    move v3, v1

    goto :goto_5

    :cond_5
    move v3, v4

    :goto_5
    invoke-virtual {p0, v0, v3}, Lklm;->v(Lkiz;Z)V

    sget-object v0, Lklg;->c:Lklg;

    invoke-virtual {p3, v0}, Lklg;->b(Lklg;)Z

    sget-object v3, Lkla;->t:Lkiz;

    if-eqz p2, :cond_6

    invoke-virtual {p3, v0}, Lklg;->b(Lklg;)Z

    move-result v7

    if-eqz v7, :cond_6

    move v7, v1

    goto :goto_6

    :cond_6
    move v7, v4

    :goto_6
    invoke-virtual {p0, v3, v7}, Lklm;->v(Lkiz;Z)V

    sget-object v3, Lkkt;->a:Lkiz;

    const-string v7, "avenh-model0-rio.tflite.uncompressed"

    invoke-virtual {p0, v3, v7}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkif;->b:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkio;->e:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkio;->h:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkio;->g:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkio;->i:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkio;->c:Lkiz;

    const-string v7, "deeprestore_face_float32_512x512_v13_rc2_float-graph-custom_op_p23.tflite.uncompressed"

    invoke-virtual {p0, v3, v7}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkio;->a:Lkiy;

    const/4 v7, 0x4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {p0, v3, v7}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object v3, Lkio;->j:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkv;->c:Lkiz;

    const-string v7, "siamese_fe_darwinn_custom_op_rio_a0.tflite.uncompressed"

    invoke-virtual {p0, v3, v7}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkkv;->d:Lkiz;

    const-string v7, "siamese_end2end_darwinn_custom_op_rio_a0.tflite.uncompressed"

    invoke-virtual {p0, v3, v7}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkit;->n:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->B:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->x:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->f:Lkiy;

    const/16 v7, 0x800

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {p0, v3, v7}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object v3, Lkit;->C:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->K:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->L:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->l:Lkiz;

    new-instance v7, Lxwc;

    const-string v8, ","

    invoke-direct {v7, v8}, Lxwc;-><init>(Ljava/lang/String;)V

    sget-object v8, Lsql;->b:Lsql;

    iget v8, v8, Lsql;->v:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    sget-object v9, Lsql;->j:Lsql;

    iget v9, v9, Lsql;->v:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    new-array v10, v4, [Ljava/lang/Object;

    invoke-virtual {v7, v8, v9, v10}, Lxwc;->c(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v3, v7}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkit;->M:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->D:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->N:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkit;->U:Lkiz;

    const/high16 v7, 0x3f000000    # 0.5f

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {p0, v3, v7}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkit;->V:Lkiz;

    const/high16 v8, -0x40800000    # -1.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {p0, v3, v8}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkit;->k:Lkiz;

    const-string v8, "hawk_full_fov_custom-op-p23.tflite.uncompressed"

    invoke-virtual {p0, v3, v8}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkjq;->aq:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjq;->aE:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjq;->ba:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjq;->aC:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkc;->y:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkc;->q:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkc;->p:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjq;->ar:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkc;->G:Lkiz;

    invoke-virtual {p0, v3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkc;->V:Lkiz;

    const v8, -0x3f59999a    # -5.2f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {p0, v3, v8}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkkc;->W:Lkiz;

    const/high16 v8, -0x3f600000    # -5.0f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {p0, v3, v8}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkkc;->X:Lkiz;

    const/high16 v8, -0x3f700000    # -4.5f

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {p0, v3, v8}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object v3, Lkjq;->ao:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkc;->D:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkb;->f:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkb;->g:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkb;->h:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkb;->i:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkb;->j:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkkb;->d:Lkiz;

    const-string v8, "motion-custom_op-p23.tflite.uncompressed"

    invoke-virtual {p0, v3, v8}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkkb;->e:Lkiz;

    const-string v8, "saliency-custom_op-p23.tflite.uncompressed"

    invoke-virtual {p0, v3, v8}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object v3, Lkiv;->h:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjz;->G:Lkiz;

    invoke-virtual {p0, v3, v4}, Lklm;->v(Lkiz;Z)V

    sget-object v3, Lkjz;->w:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjz;->v:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkjz;->E:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->z:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->aa:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->W:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->ab:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->B:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->Y:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->d:Lkiy;

    sget-object v8, Lklg;->a:Lklg;

    invoke-virtual {p3, v8}, Lklg;->b(Lklg;)Z

    move-result v9

    const/4 v10, 0x5

    if-eq v1, v9, :cond_7

    move v9, v10

    goto :goto_7

    :cond_7
    const/16 v9, 0xa

    :goto_7
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {p0, v3, v9}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object v3, Lkjl;->aP:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->x:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->y:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->o:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->q:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->D:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkka;->Z:Lkiz;

    invoke-virtual {p0, v3, v1}, Lklm;->n(Lkiz;Z)V

    sget-object v3, Lkke;->b:Lkiy;

    sget-object v9, Lkke;->c:Lkiy;

    invoke-virtual {p1, v9}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p1

    invoke-virtual {p1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    mul-int/2addr p1, v10

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkke;->a:Lkiy;

    const/16 v3, 0x12c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkke;->k:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkke;->l:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkke;->z:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkq;->d:Lkiz;

    invoke-virtual {p0, p1, p2}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkq;->e:Lkiz;

    invoke-virtual {p0, p1, p2}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkq;->z:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkkq;->q:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->i:Lkiz;

    sget-object v3, Lkkm;->c:Lkkm;

    iget-object v3, v3, Lkkm;->g:Ljava/lang/String;

    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->aY:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkkn;->S:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->R:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ac:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ad:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->aO:Lkiz;

    const v3, 0x3fc2339c    # 1.5172f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkkn;->aP:Lkiz;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkkn;->at:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->aS:Lkiz;

    const/high16 v3, 0x40400000    # 3.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkkn;->M:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->N:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->X:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->aj:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ak:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ax:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->aA:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->m:Lkiz;

    invoke-virtual {p3, v8}, Lklg;->b(Lklg;)Z

    move-result v3

    const-string v9, ""

    if-eq v1, v3, :cond_8

    move-object v3, v9

    goto :goto_8

    :cond_8
    const-string v3, ""

    :goto_8
    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->l:Lkiz;

    const-string v3, ""

    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->p:Lkiz;

    const-string v3, ""

    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->t:Lkiz;

    invoke-virtual {p3, v8}, Lklg;->b(Lklg;)Z

    move-result v3

    if-eq v1, v3, :cond_9

    goto :goto_9

    :cond_9
    const-string v9, ""

    :goto_9
    invoke-virtual {p0, p1, v9}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->u:Lkiz;

    const-string v3, "ec36a8881739470eaba348da266e4f8c/ec36a8881739470eaba348da266e4f8c.uncompressed"

    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->v:Lkiz;

    const-string v3, "cac29f5597f5453bbabb54f6f2080e39/cac29f5597f5453bbabb54f6f2080e39.uncompressed"

    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkkn;->w:Lkiz;

    const-string v3, "a7ab2018912b4f958760b7763b36256a/a7ab2018912b4f958760b7763b36256a.uncompressed"

    invoke-virtual {p0, p1, v3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    if-eq v1, p2, :cond_a

    const/16 p1, 0x7e0

    goto :goto_a

    :cond_a
    const/16 p1, 0x7d0

    :goto_a
    sget-object v3, Lkhw;->b:Lkiy;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    if-eq v1, p2, :cond_b

    const/16 v2, 0x5e4

    :cond_b
    sget-object p1, Lkhw;->c:Lkiy;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhw;->a:Lkiy;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkkn;->P:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->Q:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->j:Lkiz;

    const-string v2, "P23"

    invoke-virtual {p0, p1, v2}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkjq;->aV:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkky;->k:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkky;->l:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkky;->z:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkky;->t:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->ae:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->ag:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->af:Lkiz;

    invoke-virtual {p0, p1, p2}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkw;->a:Lkiy;

    sget-object p1, Lkin;->j:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjx;->f:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjx;->g:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjx;->m:Lkiz;

    sget-object v2, Lkic;->a:Ljava/lang/Float;

    invoke-virtual {p0, p1, v2}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkjq;->ai:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->aj:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->G:Lkiz;

    const-string v2, "lancet_alpha_v2-p23.tflite.uncompressed"

    invoke-virtual {p0, p1, v2}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkjq;->aF:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->L:Lkiz;

    const-string v2, "pecan-p23-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p1, v2}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkjq;->aK:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->M:Lkiz;

    const-string v2, "pecan-p23-luma-hybrid-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p1, v2}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkjq;->P:Lkiz;

    const-string v2, "walnut-p23-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p1, v2}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkjq;->aU:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkiv;->c:Lkiz;

    invoke-virtual {p0, p1, p2}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhz;->f:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkka;->w:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkka;->ai:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjz;->F:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhq;->d:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkj;->b:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->ad:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->ae:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->p:Lkiy;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkke;->y:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkko;->o:Lkiz;

    invoke-virtual {p0, p1, p2}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkhr;->d:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhr;->e:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhr;->f:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhr;->c:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkko;->i:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkko;->j:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkko;->k:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkko;->l:Lkiz;

    invoke-virtual {p0, p1, v5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkko;->m:Lkiz;

    invoke-virtual {p0, p1, v5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkko;->n:Lkiz;

    const/high16 p2, 0x41f00000    # 30.0f

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkjm;->m:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjm;->q:Lkiz;

    invoke-virtual {p3, v0}, Lklg;->b(Lklg;)Z

    move-result p2

    invoke-virtual {p0, p1, p2}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjm;->r:Lkiz;

    invoke-virtual {p0, p1, v1}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjm;->s:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjm;->A:Lkiz;

    const/high16 p2, 0x3f400000    # 0.75f

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkjj;->G:Lkiz;

    invoke-virtual {p0, p1, v4}, Lklm;->v(Lkiz;Z)V

    return-void
.end method
