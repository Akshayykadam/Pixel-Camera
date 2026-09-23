.class public final Lklm;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field public static final a:Lklg;


# instance fields
.field private final b:Ljava/util/Map;

.field private final c:Lklk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lklg;->d:Lklg;

    sput-object v0, Lklm;->a:Lklg;

    return-void
.end method

.method public constructor <init>(Luyv;Luyu;Lqxe;Lacku;Lklk;)V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lklm;->b:Ljava/util/Map;

    iput-object p5, p0, Lklm;->c:Lklk;

    move-object p5, p4

    sget-object p4, Lklm;->a:Lklg;

    iget-object v0, p5, Lacku;->b:Ljava/lang/Object;

    const-string v1, "ProcessStablePhInit#GcaConfig"

    invoke-static {v1}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lwnc;->b(Landroid/content/Context;)V

    invoke-static {}, Landroid/os/Trace;->endSection()V

    invoke-static {p1, p0, p0, p4, p2}, Lacku;->j(Luyv;Lklm;Lklm;Lklg;Luyu;)V

    move-object v0, p4

    iget-boolean p4, p5, Lacku;->a:Z

    invoke-virtual {p1}, Luyv;->k()Z

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x4

    const/4 v4, 0x3

    if-eqz v1, :cond_0

    invoke-static {p0, p0, p1, v0, p3}, Lhpq;->aY(Lklm;Lklm;Luyv;Lklg;Lqxe;)V

    :goto_0
    move-object p2, p1

    goto/16 :goto_2

    :cond_0
    iget-boolean v1, p1, Luyv;->D:Z

    if-eqz v1, :cond_1

    invoke-static {p0, p0, v0, p3}, Lhpq;->bf(Lklm;Lklm;Lklg;Lqxe;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Luyv;->o()Z

    move-result v1

    const/16 v5, 0x3e8

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v1, :cond_3

    sget-object p2, Lkjl;->p:Lkiy;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {p0, p2, p4}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p2, Lkjl;->bw:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkjl;->bk:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->ai:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->aR:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->aS:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->br:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->ad:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->aW:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->bi:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkiv;->f:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkiv;->g:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkiv;->m:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkim;->e:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkld;->b:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkis;->b:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkis;->c:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkis;->d:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->y:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->B:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->C:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->E:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->ag:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->ai:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->ab:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->ac:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->N:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->T:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->U:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->V:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->Z:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhy;->W:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkio;->e:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkio;->h:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkio;->g:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkio;->c:Lkiz;

    const-string p4, "deeprestore_face_float32_512x512_v13_rc2_float-graph-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p2, p4}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkio;->j:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkv;->c:Lkiz;

    const-string p4, "siamese_fe_darwinn_custom_op_janeiro_a0.tflite.uncompressed"

    invoke-virtual {p0, p2, p4}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkv;->d:Lkiz;

    const-string p4, "siamese_end2end_darwinn_custom_op_janeiro_a0.tflite.uncompressed"

    invoke-virtual {p0, p2, p4}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkv;->e:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aq:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aE:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->bO:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkjq;->ba:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aC:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkiv;->h:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    const-wide/32 p4, 0x66b6d7e

    invoke-virtual {p3, p4, p5}, Lqxe;->b(J)Z

    move-result p2

    sget-object p3, Lkjz;->G:Lkiz;

    invoke-virtual {p0, p3, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p3, Lkjz;->w:Lkiz;

    invoke-virtual {p0, p3, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p3, Lkjz;->v:Lkiz;

    invoke-virtual {p0, p3, p2}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->z:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->aa:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->W:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->ab:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->B:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->Y:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->o:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->q:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->D:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->Z:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkke;->b:Lkiy;

    sget-object p3, Lkke;->c:Lkiy;

    invoke-virtual {p0, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    invoke-virtual {p3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    mul-int/2addr p3, v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p2, p3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p2, Lkke;->k:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkke;->l:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkf;->a:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkn;->E:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkn;->R:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkn;->M:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lklg;->b:Lklg;

    invoke-virtual {v0, p2}, Lklg;->b(Lklg;)Z

    move-result p2

    if-eqz p2, :cond_2

    sget-object p2, Lkkn;->ah:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    :cond_2
    sget-object p2, Lkkn;->l:Lkiz;

    const-string p3, "92f5e8432ca24f838c3fd894a2ff8b0b/92f5e8432ca24f838c3fd894a2ff8b0b.uncompressed"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkn;->Q:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkn;->j:Lkiz;

    const-string p3, "P22"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkn;->P:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aV:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkky;->t:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkle;->a:Lkiy;

    sget-object p2, Lkkb;->f:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkb;->g:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkb;->h:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkb;->i:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkb;->j:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkb;->d:Lkiz;

    const-string p3, "motion-custom_op-p23.tflite.uncompressed"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkb;->e:Lkiz;

    const-string p3, "saliency-custom_op-p23.tflite.uncompressed"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkt;->a:Lkiz;

    const-string p3, "avenh-model0-janeiro.tflite.uncompressed"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkjq;->ai:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->G:Lkiz;

    const-string p3, "lancet-p22.tflite.uncompressed"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkkc;->y:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->ao:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aF:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->L:Lkiz;

    const-string p3, "pecan-p22-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p2, p3}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p2, Lkjq;->aO:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aU:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkin;->j:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->aB:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjl;->bd:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkc;->C:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkkc;->H:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhz;->f:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkka;->w:Lkiz;

    invoke-virtual {p0, p2, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjq;->aX:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkhx;->e:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p2, Lkjj;->G:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkid;->h:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkid;->n:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkid;->m:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkid;->j:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p2, Lkid;->l:Lkiz;

    invoke-virtual {p0, p2, v6}, Lklm;->v(Lkiz;Z)V

    goto/16 :goto_0

    :cond_3
    invoke-virtual {p1}, Luyv;->c()Z

    move-result v1

    if-eqz v1, :cond_4

    move-object p5, p3

    move-object p3, p2

    move-object p2, p1

    move-object p1, p0

    move-object p4, v0

    invoke-static/range {p0 .. p5}, Lhpq;->be(Lklm;Lklm;Luyv;Luyu;Lklg;Lqxe;)V

    goto/16 :goto_2

    :cond_4
    move-object p2, p1

    move-object p1, p5

    move-object p5, p3

    move-object p3, v0

    iget-boolean v0, p2, Luyv;->J:Z

    if-eqz v0, :cond_5

    invoke-static {p0, p0, p3, p5}, Lhpq;->aZ(Lklm;Lklm;Lklg;Lqxe;)V

    goto/16 :goto_2

    :cond_5
    iget-boolean v0, p2, Luyv;->K:Z

    if-eqz v0, :cond_6

    invoke-static {p0, p0, p5}, Lhpq;->bc(Lklm;Lklm;Lqxe;)V

    goto/16 :goto_2

    :cond_6
    invoke-virtual {p2}, Luyv;->r()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {p0, p0, p2, p3}, Lkic;->a(Lklm;Lklm;Luyv;Lklg;)V

    goto/16 :goto_2

    :cond_7
    iget-boolean v0, p2, Luyv;->N:Z

    if-eqz v0, :cond_8

    invoke-static {p0, p0, p3, p5}, Lhpq;->bg(Lklm;Lklm;Lklg;Lqxe;)V

    goto/16 :goto_2

    :cond_8
    invoke-virtual {p2}, Luyv;->h()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {p0, p0, p2, p3}, Lhpq;->ba(Lklm;Lklm;Luyv;Lklg;)V

    goto/16 :goto_2

    :cond_9
    iget-boolean v0, p2, Luyv;->R:Z

    if-eqz v0, :cond_a

    invoke-static {p0, p0, p3, p5}, Lhpq;->bd(Lklm;Lklm;Lklg;Lqxe;)V

    goto/16 :goto_2

    :cond_a
    iget-boolean v0, p2, Luyv;->S:Z

    if-eqz v0, :cond_b

    invoke-static {p0, p0, p3, p5}, Lhpq;->aV(Lklm;Lklm;Lklg;Lqxe;)V

    goto/16 :goto_2

    :cond_b
    invoke-virtual {p2}, Luyv;->e()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {p0, p0, p2, p3, p5}, Lejn;->i(Lklm;Lklm;Luyv;Lklg;Lqxe;)V

    goto/16 :goto_2

    :cond_c
    iget-boolean p5, p2, Luyv;->a:Z

    if-eqz p5, :cond_d

    sget-object p1, Lkjl;->aO:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->aW:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->bi:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->by:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkiv;->f:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkiv;->m:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkis;->b:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->I:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->R:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->Z:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->ay:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->am:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->an:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->ap:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkb;->f:Lkiz;

    sget-object p4, Lklg;->a:Lklg;

    invoke-virtual {p3, p4}, Lklg;->b(Lklg;)Z

    move-result p3

    invoke-virtual {p0, p1, p3}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->a:Lkiy;

    sget-object p3, Lkjp;->a:Lkjp;

    invoke-virtual {p3}, Lkjp;->ordinal()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkjq;->aB:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->b:Lkiy;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkjq;->ah:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ab:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkc;->K:Lkiz;

    const p3, 0x4bd1a308    # 2.747752E7f

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkkc;->L:Lkiz;

    const p3, 0x4c3c7d59    # 4.9411428E7f

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkjz;->G:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkka;->aa:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkka;->W:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkka;->B:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkka;->C:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkka;->D:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkke;->b:Lkiy;

    sget-object p3, Lkke;->c:Lkiy;

    invoke-virtual {p0, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    invoke-virtual {p3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    mul-int/2addr p3, v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p0, p1, p3}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkkn;->J:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->K:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->R:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->N:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ah:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->ai:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkit;->B:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkn;->P:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->aX:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkif;->b:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkld;->a:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sput v4, Lvyk;->a:I

    sget-object p1, Lkjj;->G:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkjl;->bn:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    goto/16 :goto_2

    :cond_d
    iget-boolean p5, p2, Luyv;->b:Z

    if-eqz p5, :cond_e

    sget-object p1, Lkjl;->ax:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->aS:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjm;->m:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjj;->G:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->v(Lkiz;Z)V

    goto/16 :goto_2

    :cond_e
    iget-boolean p5, p2, Luyv;->W:Z

    if-eqz p5, :cond_f

    invoke-static {p0, p0, p3}, Lhpq;->aX(Lklm;Lklm;Lklg;)V

    goto/16 :goto_2

    :cond_f
    iget-boolean p5, p2, Luyv;->X:Z

    if-eqz p5, :cond_10

    invoke-static {p0, p0, p3}, Lhpq;->aW(Lklm;Lklm;Lklg;)V

    goto/16 :goto_2

    :cond_10
    invoke-virtual {p2}, Luyv;->g()Z

    move-result p5

    if-eqz p5, :cond_11

    iget-object p1, p1, Lacku;->b:Ljava/lang/Object;

    move-object p5, p1

    check-cast p5, Landroid/content/Context;

    move-object p1, p0

    invoke-static/range {p0 .. p5}, Lhpq;->bb(Lklm;Lklm;Luyv;Lklg;ZLandroid/content/Context;)V

    goto/16 :goto_2

    :cond_11
    iget-boolean p1, p2, Luyv;->ab:Z

    if-eqz p1, :cond_13

    sget-object p1, Lkjl;->aO:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->p:Lkiy;

    const/16 p5, 0x640

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkjl;->bw:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkjl;->bk:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->aR:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->aW:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->ai:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->V:Lkiz;

    const-string p5, "3736x2800"

    invoke-virtual {p0, p1, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p1, Lkle;->v:Lkiz;

    const/high16 p5, 0x40a00000    # 5.0f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkle;->t:Lkiz;

    const p5, 0x3f0181cf

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkle;->h:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkle;->s:Lkiz;

    const/high16 p5, 0x41000000    # 8.0f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkle;->o:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkle;->r:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkle;->b:Lkiy;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhs;->a:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhs;->g:Lkiz;

    const p5, 0x3f204189    # 0.626f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhs;->h:Lkiz;

    const p5, 0x3f4f5c29    # 0.81f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhs;->e:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhs;->c:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhs;->d:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhs;->f:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhs;->k:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkhs;->l:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p1, Lkhq;->f:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhq;->h:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhq;->g:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhq;->k:Lkiz;

    const p5, 0x3f27ae14    # 0.655f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhq;->p:Lkiz;

    const p5, 0x3f333333    # 0.7f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhq;->q:Lkiz;

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkiv;->f:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkiv;->g:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkiv;->j:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkiv;->m:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkiv;->o:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkis;->b:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkis;->c:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkis;->d:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkim;->f:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->B:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->ab:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->ac:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->N:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->I:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->O:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->Q:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->R:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->T:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->U:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->V:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->ad:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->av:Lkiz;

    const/high16 p5, 0x41a00000    # 20.0f

    invoke-static {p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhy;->aw:Lkiz;

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhy;->au:Lkiz;

    invoke-virtual {p0, p1, p5}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p1, Lkhy;->v:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjl;->Z:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjr;->b:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->W:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->F:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjr;->c:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->Y:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->k:Lkiy;

    const/16 p5, 0xa1

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhy;->l:Lkiy;

    const/16 p5, 0xab

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {p0, p1, p5}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkhy;->am:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->E:Lkiz;

    invoke-virtual {p0, p1, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->q:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkhy;->w:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lklg;->c:Lklg;

    invoke-virtual {p3, p1}, Lklg;->b(Lklg;)Z

    invoke-virtual {p3, p1}, Lklg;->b(Lklg;)Z

    sget-object p5, Lkkv;->i:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjr;->d:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkhy;->A:Lkiz;

    invoke-virtual {p3, p1}, Lklg;->b(Lklg;)Z

    move-result v0

    invoke-virtual {p0, p5, v0}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkla;->p:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    invoke-virtual {p3, p1}, Lklg;->b(Lklg;)Z

    sget-object p5, Lkla;->s:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkkt;->a:Lkiz;

    const-string v0, "avenh-model0-p26.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkhv;->b:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkif;->b:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkio;->e:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkio;->h:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkio;->g:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkio;->i:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkio;->a:Lkiy;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkio;->c:Lkiz;

    const-string v0, "0115a2a237b64cbeacef7c535f949bbe.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkio;->j:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkio;->k:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkki;->a:Lkiz;

    const-string v0, "a1b2c3d4e5f67890a1b2c3d4e5f67890.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkki;->b:Lkiz;

    const-string v0, "09071335e3914c00ac0a00f29193b4c7.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkv;->c:Lkiz;

    const-string v0, "siamese_fe_darwinn_custom_op_yooto_a0.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkv;->d:Lkiz;

    const-string v0, "siamese_end2end_darwinn_custom_op_yooto_a0.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkit;->n:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->B:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->x:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->f:Lkiy;

    const/16 v0, 0x800

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkit;->C:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->K:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->L:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->l:Lkiz;

    new-instance v0, Lxwc;

    const-string v1, ","

    invoke-direct {v0, v1}, Lxwc;-><init>(Ljava/lang/String;)V

    sget-object v1, Lsql;->b:Lsql;

    iget v1, v1, Lsql;->v:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v5, Lsql;->j:Lsql;

    iget v5, v5, Lsql;->v:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-array v8, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v5, v8}, Lxwc;->c(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkit;->M:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->D:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->N:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->U:Lkiz;

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkit;->V:Lkiz;

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkit;->q:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->p:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkit;->R:Lkiz;

    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkit;->j:Lkiz;

    const-string v1, "cyclops_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->bF:Lkiz;

    invoke-virtual {p0, p5, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkjq;->au:Lkiz;

    invoke-virtual {p3, p1}, Lklg;->b(Lklg;)Z

    move-result v0

    invoke-virtual {p0, p5, v0}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->bb:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->bo:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->bp:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->aq:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->aE:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->bO:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkjq;->bi:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->aZ:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->ay:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->az:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->q:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->p:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->ar:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->G:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->S:Lkiz;

    const/high16 v0, -0x40200000    # -1.75f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkkc;->T:Lkiz;

    const v0, -0x402ccccd    # -1.65f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkkc;->J:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->r:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->D:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkc;->F:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkb;->f:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkb;->g:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkb;->h:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkb;->i:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkb;->j:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkb;->d:Lkiz;

    const-string v0, "motion-custom_op-p23.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkb;->e:Lkiz;

    const-string v0, "saliency-custom_op-p23.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkiv;->h:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->g:Lkiy;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p5, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkiq;->o:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkiq;->i:Lkiz;

    const-string v1, "ceftazidime_ce20c8b29c994d5d8c37d6a20c32a6c8.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkiq;->n:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkiq;->g:Lkiz;

    const-string v1, "ceftazidime_7fcb8e1d8163426d9747e2f5aa6deb90.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkiq;->h:Lkiz;

    const-string v1, "ceftazidime_57ce8e2c684749ab82b73a87723c1e03.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkiq;->j:Lkiz;

    const-string v1, "ceftazidime_b331b58aa3fd4b1c9e2a59b01439d754.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkiq;->l:Lkiz;

    const-string v1, "ceftazidime_26ef120c712c4548b5fd6196b4f18069.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkiq;->p:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjz;->G:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkjz;->w:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjz;->v:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjz;->E:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjz;->r:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->z:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->aa:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->W:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->ab:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->B:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->Y:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->d:Lkiy;

    sget-object v1, Lklg;->a:Lklg;

    invoke-virtual {p3, v1}, Lklg;->b(Lklg;)Z

    move-result v1

    const/4 v5, 0x5

    const/16 v8, 0xa

    if-eq v7, v1, :cond_12

    move v1, v5

    goto :goto_1

    :cond_12
    move v1, v8

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkka;->o:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->q:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->D:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->Z:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->ai:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjz;->F:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkke;->b:Lkiy;

    sget-object v1, Lkke;->c:Lkiy;

    invoke-virtual {p0, v1}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/2addr v1, v5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkke;->a:Lkiy;

    const/16 v1, 0x12c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkke;->k:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkke;->l:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkke;->z:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkke;->B:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkke;->A:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkke;->v:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkke;->x:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aO:Lkiz;

    const v1, 0x3fbe7a10    # 1.4881f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkkn;->aP:Lkiz;

    invoke-virtual {p0, p5, v1}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkkn;->at:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aS:Lkiz;

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkkn;->ax:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->a:Lkiy;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkkn;->aN:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aA:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->R:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aG:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->ac:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->ae:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->af:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkhw;->b:Lkiy;

    const/16 v1, 0x7e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkhw;->c:Lkiy;

    const/16 v1, 0x5e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkhw;->a:Lkiy;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkkn;->S:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->W:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aj:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->l:Lkiz;

    const-string v1, ""

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->aX:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkkn;->U:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->X:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->n:Lkiz;

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->M:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->am:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->k:Lkiz;

    const-string v1, "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->aE:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aF:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->al:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->c:Lkiz;

    const-string v1, ""

    invoke-virtual {p0, p5, v1}, Lklm;->d(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->d:Lkiz;

    const-string v1, ""

    invoke-virtual {p0, p5, v1}, Lklm;->d(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->e:Lkiz;

    const-string v1, ""

    invoke-virtual {p0, p5, v1}, Lklm;->d(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->h:Lkiz;

    const-string v1, "5397da9fd78f46d495d4bafdacd96bf4/5397da9fd78f46d495d4bafdacd96bf4.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->d(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->f:Lkiz;

    const-string v1, "893021f4dda34da5a348ff85c8d55512/893021f4dda34da5a348ff85c8d55512.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->d(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->g:Lkiz;

    const-string v1, "54040636d6a44e47864dab5e554166c5/54040636d6a44e47864dab5e554166c5.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->d(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->ar:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aB:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aM:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->aC:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->P:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->Q:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkn;->j:Lkiz;

    const-string v1, "P26"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkkn;->aa:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->b:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->c:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->d:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->e:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->f:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->g:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->s:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->p:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->q:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->r:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->h:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->t:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->u:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->v:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->l:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->m:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->n:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->o:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkir;->x:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkp;->c:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->aV:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkky;->k:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkky;->l:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkky;->m:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkky;->p:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkky;->o:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkky;->q:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjl;->ae:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjl;->af:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkw;->a:Lkiy;

    sget-object p5, Lkin;->j:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjx;->f:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjx;->g:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjx;->k:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjx;->i:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->ai:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->aj:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->G:Lkiz;

    const-string v1, "lancet_alpha_v2-p26.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->ak:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->i:Lkiy;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkjq;->J:Lkiz;

    const-string v1, "kepler_v3/p26"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->by:Lkiz;

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkjq;->bz:Lkiz;

    invoke-virtual {p0, p5, v1}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkjq;->aF:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->L:Lkiz;

    const-string v1, "pecan-p26-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->aK:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->n:Lkiy;

    invoke-virtual {p0, p5, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkjq;->M:Lkiz;

    const-string v1, "pecan-p26-light-v2-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->N:Lkiz;

    const-string v1, "pecan-p26-pie-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->aI:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->O:Lkiz;

    const-string v1, "pecan-p26-v2-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->aL:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->aO:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->P:Lkiz;

    const-string v1, "walnut-p26-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p5, v1}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkjq;->bj:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkhz;->f:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkka;->w:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkkj;->b:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkko;->o:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkko;->p:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkko;->q:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkko;->r:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkko;->s:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkko;->n:Lkiz;

    const/high16 v1, 0x41f00000    # 30.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, p5, v1}, Lklm;->s(Lkiz;Ljava/lang/Float;)V

    sget-object p5, Lkjl;->bB:Lkiz;

    invoke-virtual {p0, p5, v6}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkjq;->p:Lkiy;

    invoke-virtual {p0, p5, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p5, Lkjn;->f:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjn;->g:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjn;->h:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjn;->t:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p5, Lkjn;->l:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjv;->a:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkhq;->d:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkhq;->e:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    xor-int/2addr p4, v7

    sget-object p5, Lkhu;->M:Lkiz;

    invoke-virtual {p0, p5, p4}, Lklm;->v(Lkiz;Z)V

    sget-object p4, Lkhu;->j:Lkiz;

    const-string p5, "fssd_custom-op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->m:Lkiz;

    const-string p5, "raid_person_segmenter_from_face_detection_with_occlusions-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->o:Lkiz;

    const-string p5, "matting_v2_768_custom-op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->k:Lkiz;

    const-string p5, "0680c23659714ea69b96a519bbf99fe0/0680c23659714ea69b96a519bbf99fe0.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->l:Lkiz;

    const-string p5, "e09259c9e604495a94f7e76eaad2df6a/e09259c9e604495a94f7e76eaad2df6a.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->n:Lkiz;

    const-string p5, "raid_foreground_mosaic_512_qat_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->p:Lkiz;

    const-string p5, "shadow_segmenter_finetuned_ptq_Dec2024_batch1-graph-custom_op_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->q:Lkiz;

    const-string p5, "raid_instance_segmenter_with_objects_no_people-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->r:Lkiz;

    const-string p5, "hoi_classifier_256x256_rgb_and_boxes-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->s:Lkiz;

    const-string p5, "mobile_raid_v26_640_qat_u8_attached_objects_trained_no_post-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->t:Lkiz;

    const-string p5, "movenet_256_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->u:Lkiz;

    const-string p5, "midasnet_mobilenetv2_dptmqn_dec256_sep_082421_384_384_fp16_opt-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->v:Lkiz;

    const-string p5, "all_in_film_si_768x768-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->x:Lkiz;

    const-string p5, "panoptic_segmenter_61586074_fp16_custom-op_tpu_26_meta.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->y:Lkiz;

    const-string p5, "pssd_large_8bit_v2_300x300-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->z:Lkiz;

    const-string p5, "mobile_raid_v21_640_qat_u8-graph-custom_op_tpu_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->w:Lkiz;

    const-string p5, "looknet_v2.1_custom-op_26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkhu;->f:Lkiy;

    sget-object p5, Lzrq;->d:Lzrq;

    invoke-virtual {p5}, Lzrq;->a()I

    move-result p5

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {p0, p4, p5}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p4, Lkjq;->aU:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkjq;->aQ:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkjq;->S:Lkiz;

    const-string p5, "almond-p24-custom_op-transformed.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkjq;->aS:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkjq;->T:Lkiz;

    const-string p5, "almond-p26-v2-custom_op.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkjm;->m:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkjq;->ad:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkjq;->ae:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkld;->e:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkld;->f:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkld;->c:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkld;->d:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lklc;->c:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkil;->V:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p4, Lkil;->an:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p4, Lkil;->ai:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p4, Lkil;->W:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->v(Lkiz;Z)V

    sget-object p4, Lkil;->B:Lkiz;

    const-string p5, "mnv4_embedding_v0_4-graph-custom_op_half_p26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkil;->C:Lkiz;

    const-string p5, "tcn_scoring_v0_4-graph-custom_op_half_p26.tflite.uncompressed"

    invoke-virtual {p0, p4, p5}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p4, Lkil;->v:Lkiy;

    sget-object p5, Lkil;->b:Lulc;

    iget v0, p5, Lulc;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p4, v0}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p4, Lkil;->u:Lkiy;

    iget p5, p5, Lulc;->b:I

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {p0, p4, p5}, Lklm;->c(Lkiy;Ljava/lang/Integer;)V

    sget-object p4, Lkka;->am:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p4, Lkjq;->ac:Lkiz;

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p5, Lkjq;->V:Lkiz;

    const-string v0, "3cdbac706c98421a96e16fdbfd97a35f.tflite.uncompressed"

    invoke-virtual {p0, p5, v0}, Lklm;->i(Lkiz;Ljava/lang/String;)V

    sget-object p5, Lkhy;->G:Lkiz;

    invoke-virtual {p0, p5, v7}, Lklm;->n(Lkiz;Z)V

    invoke-virtual {p3, p1}, Lklg;->b(Lklg;)Z

    sget-object p1, Lkjl;->be:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjq;->bl:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkh;->c:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkkh;->b:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    sget-object p1, Lkjt;->n:Lkiz;

    invoke-virtual {p0, p1, v7}, Lklm;->n(Lkiz;Z)V

    invoke-virtual {p0, p4, v7}, Lklm;->n(Lkiz;Z)V

    goto :goto_2

    :cond_13
    sget-object p1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object p3, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sget-object p4, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-static {p1, p3, p4}, Luyv;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Luyv;

    move-result-object p1

    invoke-virtual {p1}, Luyv;->p()Z

    move-result p1

    if-eqz p1, :cond_18

    :goto_2
    sget-object p1, Lkjl;->s:Lkiy;

    sget-object p3, Lkjl;->ax:Lkiz;

    invoke-virtual {p0, p3}, Lklm;->q(Lkiz;)Z

    move-result p3

    if-nez p3, :cond_14

    const/4 v2, -0x1

    goto :goto_3

    :cond_14
    invoke-virtual {p2}, Luyv;->l()Z

    move-result p3

    if-eqz p3, :cond_15

    move v2, v3

    goto :goto_3

    :cond_15
    invoke-virtual {p2}, Luyv;->k()Z

    move-result p3

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->y:Z

    if-nez p3, :cond_16

    invoke-virtual {p2}, Luyv;->c()Z

    move-result p3

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->J:Z

    if-nez p3, :cond_16

    invoke-virtual {p2}, Luyv;->o()Z

    move-result p3

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->K:Z

    if-nez p3, :cond_16

    invoke-virtual {p2}, Luyv;->r()Z

    move-result p3

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->N:Z

    if-nez p3, :cond_16

    invoke-virtual {p2}, Luyv;->h()Z

    move-result p3

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->R:Z

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->S:Z

    if-nez p3, :cond_16

    invoke-virtual {p2}, Luyv;->e()Z

    move-result p3

    if-nez p3, :cond_16

    iget-boolean p3, p2, Luyv;->W:Z

    if-nez p3, :cond_16

    iget-boolean p2, p2, Luyv;->X:Z

    if-eqz p2, :cond_17

    :cond_16
    move v2, v4

    :cond_17
    :goto_3
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lklm;->e(Lkiy;Ljava/lang/Integer;)V

    return-void

    :cond_18
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Device is not recognized or not supported"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final y(Lkix;Ljava/lang/Boolean;)V
    .locals 1

    invoke-static {p1, p2}, Lklk;->b(Lkix;Ljava/lang/Object;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lkiy;)Lj$/util/Optional;
    .locals 7

    if-eqz p1, :cond_check_orig_a

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_a

    const-string v1, "camera.centaur_focus_detection_override"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_check_orig_a

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_orig_a
    iget-object v0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_check_binned_fallbacks

    check-cast v0, Lovu;

    iget-object v1, v0, Lovu;->a:Ljava/lang/Object;

    if-nez v1, :cond_proceed_orig_a

    :cond_check_binned_fallbacks
    iget-object v1, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v1, :cond_return_empty_a

    const-string v2, "camera.wide_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_wbrh

    const/16 v0, 0x7f0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_wbrh
    const-string v2, "camera.wide_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_tbrw

    const/16 v0, 0x600

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_tbrw
    const-string v2, "camera.tele_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_tbrh

    const/16 v0, 0x7e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_tbrh
    const-string v2, "camera.tele_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_ubrw

    const/16 v0, 0x5e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_ubrw
    const-string v2, "camera.uw_binned_raw_width"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_ubrh

    const/16 v0, 0x7e0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_ubrh
    const-string v2, "camera.uw_binned_raw_height"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_check_brs

    const/16 v0, 0x5e8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_brs
    const-string v2, "camera.binned_row_start"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_return_empty_a

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_return_empty_a
    if-nez v0, :cond_proceed_orig_a

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_proceed_orig_a
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {p1}, Lkix;->a()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p1, Lkix;->b:Ljava/util/function/Supplier;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    :cond_0
    iget-object p0, p0, Lklm;->c:Lklk;

    iget-object v2, p1, Lkix;->a:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lklk;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v5

    sget-object v6, Lklk;->a:Lykq;

    invoke-virtual {v6}, Lykh;->c()Lyld;

    move-result-object v6

    invoke-interface {v6, v5}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v5

    check-cast v5, Lyko;

    const/16 v6, 0x5aa

    invoke-interface {v5, v6}, Lyko;->O(I)Lyld;

    move-result-object v5

    check-cast v5, Lyko;

    const-string v6, "getAdbOrGserviceIntValue: adbName=%s value=%s"

    invoke-interface {v5, v6, v2, v3}, Lyko;->E(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    :goto_0
    if-nez v4, :cond_2

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v4

    :cond_2
    if-nez v4, :cond_3

    iget-object p0, p0, Lklk;->b:Lkli;

    invoke-virtual {p0, v2}, Lkli;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3

    :try_start_1
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    sget-object v3, Lklk;->a:Lykq;

    invoke-virtual {v3}, Lykh;->c()Lyld;

    move-result-object v3

    invoke-interface {v3, v1}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    const/16 v3, 0x5a9

    invoke-interface {v1, v3}, Lyko;->O(I)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    const-string v3, "getAdbOrGserviceIntValue: gservicesName=%s value=%s"

    invoke-interface {v1, v3, v2, p0}, Lyko;->E(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3
    :goto_1
    if-nez v4, :cond_4

    check-cast v0, Lovu;

    iget-object p0, v0, Lovu;->a:Ljava/lang/Object;

    move-object v4, p0

    check-cast v4, Ljava/lang/Integer;

    :cond_4
    if-eqz v4, :cond_8

    move-object p0, v4

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/high16 v0, -0x80000000

    if-ne p0, v0, :cond_5

    goto :goto_3

    :cond_5
    iget-object p0, p1, Lkiy;->c:Lyfm;

    invoke-virtual {p0}, Lyfm;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_7

    invoke-virtual {p0, v4}, Lyfm;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_2

    :cond_6
    const/4 v1, 0x0

    :cond_7
    :goto_2
    iget-object p1, p1, Lkix;->a:Ljava/lang/String;

    const-string v0, "%s must be one of: %s"

    invoke-static {v1, v0, p1, p0}, Lyny;->br(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v4}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    goto :goto_4

    :cond_8
    :goto_3
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p0

    :goto_4
    return-object p0
.end method

.method public final b(Lkiz;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lovu;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lovu;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final c(Lkiy;Ljava/lang/Integer;)V
    .locals 1

    invoke-static {p1}, Lklk;->c(Lkix;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final d(Lkiz;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lklk;->c(Lkix;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final e(Lkiy;Ljava/lang/Integer;)V
    .locals 1

    invoke-static {p1, p2}, Lklk;->b(Lkix;Ljava/lang/Object;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final f(Lkiz;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1, p2}, Lklk;->b(Lkix;Ljava/lang/Object;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(Lkiy;)V
    .locals 1

    invoke-static {p1}, Lklk;->d(Lkix;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lklm;->e(Lkiy;Ljava/lang/Integer;)V

    return-void
.end method

.method public final h(Lkiz;)Ljava/lang/String;
    .locals 3

    if-eqz p1, :cond_check_orig_h

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_h

    const-string v1, "camera.gouda.portrait_segmenter_model_name"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_rear_pdl

    const-string v0, "1c33c30c31a74d99b66f54c22014a27a/1c33c30c31a74d99b66f54c22014a27a.uncompressed"

    return-object v0

    :cond_check_rear_pdl
    const-string v1, "camera.gouda.rear_pdlearned"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_front_pdl

    const-string v0, ""

    return-object v0

    :cond_check_front_pdl
    const-string v1, "camera.gouda.front_pdlearned"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_pdstereo

    const-string v0, ""

    return-object v0

    :cond_check_pdstereo
    const-string v1, "camera.gouda.pdstereo"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_physeter

    const-string v0, ""

    return-object v0

    :cond_check_physeter
    const-string v1, "camera.gouda.physeter"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna_motion_model

    const-string v0, ""

    return-object v0

    :cond_check_lasagna_motion_model
    const-string v1, "camera.lasagna.motion_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna_saliency_model

    const-string v0, "motion-custom_op-p23.tflite.uncompressed"

    return-object v0

    :cond_check_lasagna_saliency_model
    const-string v1, "camera.lasagna.saliency_model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_orig_h

    const-string v0, "saliency-custom_op-p23.tflite.uncompressed"

    return-object v0

    :cond_check_orig_h
    iget-object v0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lovu;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {p1}, Lkix;->a()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p1, Lkix;->b:Ljava/util/function/Supplier;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    :cond_0
    iget-object p0, p0, Lklm;->c:Lklk;

    iget-object p1, p1, Lkix;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lklk;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    return-object v2

    :cond_1
    iget-object p0, p0, Lklk;->c:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    invoke-interface {p0, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    return-object p0

    :cond_3
    :goto_0
    iget-object p0, v0, Lovu;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v1, p0}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final i(Lkiz;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lklk;->c(Lkix;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final j(Lkiz;Ljava/lang/String;)V
    .locals 1

    invoke-static {p1, p2}, Lklk;->b(Lkix;Ljava/lang/Object;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final k(Lkiz;)V
    .locals 1

    invoke-static {p1}, Lklk;->d(Lkix;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lklm;->j(Lkiz;Ljava/lang/String;)V

    return-void
.end method

.method public final l(Lkiz;)Lj$/util/Optional;
    .locals 6

    iget-object v0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lovu;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {p1}, Lkix;->a()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p1, Lkix;->b:Ljava/util/function/Supplier;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Long;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    :cond_0
    iget-object p0, p0, Lklm;->c:Lklk;

    iget-object p1, p1, Lkix;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lklk;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    sget-object v5, Lklk;->a:Lykq;

    invoke-virtual {v5}, Lykh;->c()Lyld;

    move-result-object v5

    invoke-interface {v5, v4}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v4

    check-cast v4, Lyko;

    const/16 v5, 0x5ac

    invoke-interface {v4, v5}, Lyko;->O(I)Lyld;

    move-result-object v4

    check-cast v4, Lyko;

    const-string v5, "getAdbOrPreferenceLongValue: adbName=%s value=%s"

    invoke-interface {v4, v5, p1, v2}, Lyko;->E(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    :goto_0
    const-wide/high16 v4, -0x8000000000000000L

    if-nez v3, :cond_2

    iget-object p0, p0, Lklk;->c:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p0, p1, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    :cond_2
    if-nez v3, :cond_3

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    :cond_3
    if-nez v3, :cond_4

    iget-object p0, v0, Lovu;->a:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Ljava/lang/Long;

    :cond_4
    if-eqz v3, :cond_6

    move-object p0, v3

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    cmp-long p0, p0, v4

    if-nez p0, :cond_5

    goto :goto_1

    :cond_5
    invoke-static {v3}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    goto :goto_2

    :cond_6
    :goto_1
    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object p0

    :goto_2
    return-object p0
.end method

.method public final m(Lkiz;Ljava/lang/Long;)V
    .locals 1

    invoke-static {p1, p2}, Lklk;->b(Lkix;Ljava/lang/Object;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final n(Lkiz;Z)V
    .locals 0

    invoke-static {p1}, Lklk;->c(Lkix;)V

    invoke-virtual {p0, p1, p2}, Lklm;->o(Lkiz;Z)V

    return-void
.end method

.method public final o(Lkiz;Z)V
    .locals 0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lklm;->y(Lkix;Ljava/lang/Boolean;)V

    return-void
.end method

.method public final p(Lkiz;)V
    .locals 1

    invoke-static {p1}, Lklk;->d(Lkix;)V

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lklm;->y(Lkix;Ljava/lang/Boolean;)V

    return-void
.end method

.method public final q(Lkiz;)Z
    .locals 3

    if-eqz p1, :cond_check_orig

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig

    const-string v1, "camera.lasagna"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_use_eclipse

    const/4 v0, 0x0

    return v0

    :cond_check_use_eclipse
    const-string v1, "camera.use_eclipse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_sauce

    const/4 v0, 0x0

    return v0

    :cond_check_sauce
    const-string v1, "camera.sauce"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_qa

    const/4 v0, 0x1

    return v0

    :cond_check_qa
    const-string v1, "camera.quick_access"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_gs

    const/4 v0, 0x1

    return v0

    :cond_check_gs
    const-string v1, "camera.getting_started_enabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_granite

    const/4 v0, 0x1

    return v0

    :cond_check_creator_granite
    const-string v1, "camera.enable_granite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_biotite

    const/4 v0, 0x1

    return v0

    :cond_check_creator_biotite
    const-string v1, "camera.enable_biotite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_mica

    const/4 v0, 0x1

    return v0

    :cond_check_creator_mica
    const-string v1, "camera.enable_mica"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_slate

    const/4 v0, 0x1

    return v0

    :cond_check_creator_slate
    const-string v1, "camera.enable_slate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_basalt

    const/4 v0, 0x1

    return v0

    :cond_check_creator_basalt
    const-string v1, "camera.enable_basalt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_autoscroll

    const/4 v0, 0x1

    return v0

    :cond_check_creator_autoscroll
    const-string v1, "camera.biotite_auto_scroll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_cpu_seg

    const/4 v0, 0x1

    return v0

    :cond_check_cpu_seg
    const-string v1, "segmenter_force_cpu_inference"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_tpu_del

    const/4 v0, 0x1

    return v0

    :cond_check_tpu_del
    const-string v1, "segmenter_use_darwinn_tpu_delegate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_almond_tpu

    const/4 v0, 0x0

    return v0

    :cond_check_almond_tpu
    const-string v1, "camera.almond_use_tpu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_cyclops_tpu

    const/4 v0, 0x0

    return v0

    :cond_check_cyclops_tpu
    const-string v1, "camera.cyclops_use_tpu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_offline_comp

    const/4 v0, 0x0

    return v0

    :cond_check_offline_comp
    const-string v1, "camera.gouda.use_darwinn_offline_compilation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_fg_color_tpu

    const/4 v0, 0x0

    return v0

    :cond_check_fg_color_tpu
    const-string v1, "camera.gouda.foreground_color_estimator_use_tpu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_macro_badging

    const/4 v0, 0x0

    return v0

    :cond_check_macro_badging
    const-string v1, "camera.enable_macro_focus_badging"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_centaur_setting

    const/4 v0, 0x1

    return v0

    :cond_check_centaur_setting
    const-string v1, "camera.enable_centaur"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_jelly

    const/4 v0, 0x0

    return v0

    :cond_check_boba_jelly
    const-string v1, "camera.enable_boba_jelly"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_eligible

    const/4 v0, 0x1

    return v0

    :cond_check_boba_eligible
    const-string v1, "camera.boba_jelly_eligible"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_lasagna_darwinn

    const/4 v0, 0x1

    return v0

    :cond_check_lasagna_darwinn
    const-string v1, "camera.lasagna.use_darwinn"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_ark_lens

    const/4 v0, 0x0

    return v0

    :cond_check_ark_lens
    const-string v1, "camera.ark_lens_selector"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ark

    const/4 v0, 0x0

    return v0

    :cond_check_ark
    const-string v1, "camera.ark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_orig

    const/4 v0, 0x1

    return v0

    :cond_check_orig
    iget-object v0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lovu;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {p1}, Lkix;->a()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p1, Lkix;->b:Ljava/util/function/Supplier;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Boolean;

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    :cond_0
    iget-object p0, p0, Lklm;->c:Lklk;

    iget-object p1, p1, Lkix;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lklk;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v2}, Lkku;->a(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_1
    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_2
    iget-object p0, p0, Lklk;->b:Lkli;

    invoke-virtual {p0, p1}, Lkli;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_3

    invoke-static {p0}, Lkku;->a(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_3
    iget-object p0, v0, Lovu;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    invoke-static {p0}, Lklk;->e(Ljava/lang/Boolean;)Z

    move-result p0

    return p0
.end method

.method public final r(Lkiz;)Lj$/util/Optional;
    .locals 6

    if-eqz p1, :cond_check_orig_r

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_r

    const-string v1, "camera.boba_jelly_min_active_area_ratio"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_thresh

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_boba_thresh
    const-string v1, "camera.boba_jelly_threshold"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_boba_ext

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_boba_ext
    const-string v1, "camera.boba_jelly_ext_threshold"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_orig_r

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    return-object v0

    :cond_check_orig_r
    iget-object v0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lovu;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v1

    invoke-virtual {p1}, Lkix;->a()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v1, p1, Lkix;->b:Ljava/util/function/Supplier;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v1

    :cond_0
    iget-object p0, p0, Lklm;->c:Lklk;

    iget-object p1, p1, Lkix;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lklk;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    :try_start_0
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    sget-object v5, Lklk;->a:Lykq;

    invoke-virtual {v5}, Lykh;->c()Lyld;

    move-result-object v5

    invoke-interface {v5, v4}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v4

    check-cast v4, Lyko;

    const/16 v5, 0x5ab

    invoke-interface {v4, v5}, Lyko;->O(I)Lyld;

    move-result-object v4

    check-cast v4, Lyko;

    const-string v5, "getAdbOrPreferenceFloatValue: adbName=%s value=%s"

    invoke-interface {v4, v5, p1, v2}, Lyko;->E(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    :goto_0
    const/4 v2, 0x1

    if-nez v3, :cond_2

    iget-object p0, p0, Lklk;->c:Landroid/content/SharedPreferences;

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {p0, p1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    :cond_2
    if-nez v3, :cond_3

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    :cond_3
    if-eqz v3, :cond_4

    move-object p0, v3

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    cmpl-float p0, p0, v2

    if-nez p0, :cond_5

    :cond_4
    iget-object p0, v0, Lovu;->a:Ljava/lang/Object;

    move-object v3, p0

    check-cast v3, Ljava/lang/Float;

    :cond_5
    invoke-static {v3}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object p0

    return-object p0
.end method

.method public final s(Lkiz;Ljava/lang/Float;)V
    .locals 1

    invoke-static {p1}, Lklk;->c(Lkix;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final t(Lkiz;Ljava/lang/Float;)V
    .locals 1

    invoke-static {p1, p2}, Lklk;->b(Lkix;Ljava/lang/Object;)V

    new-instance v0, Lovu;

    invoke-direct {v0, p2}, Lovu;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final u(Lkiz;)V
    .locals 1

    invoke-static {p1}, Lklk;->d(Lkix;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lklm;->t(Lkiz;Ljava/lang/Float;)V

    return-void
.end method

.method public final v(Lkiz;Z)V
    .locals 0

    invoke-static {p1}, Lklk;->c(Lkix;)V

    invoke-virtual {p0, p1, p2}, Lklm;->w(Lkiz;Z)V

    return-void
.end method

.method public final w(Lkiz;Z)V
    .locals 0

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lklm;->y(Lkix;Ljava/lang/Boolean;)V

    return-void
.end method

.method public final x(Lkiz;)Z
    .locals 3

    if-eqz p1, :cond_check_orig_x

    iget-object v0, p1, Lkix;->a:Ljava/lang/String;

    if-eqz v0, :cond_check_orig_x

    const-string v1, "camera.lasagna"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_use_eclipse_x

    const/4 v0, 0x0

    return v0

    :cond_check_use_eclipse_x
    const-string v1, "camera.use_eclipse"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ark_lens_x

    const/4 v0, 0x0

    return v0

    :cond_check_ark_lens_x
    const-string v1, "camera.ark_lens_selector"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_ark_x

    const/4 v0, 0x0

    return v0

    :cond_check_ark_x
    const-string v1, "camera.ark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_0

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_0
    const-string v1, "camera.enable_granite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_1

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_1
    const-string v1, "camera.enable_biotite"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_2

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_2
    const-string v1, "camera.enable_mica"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_3

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_3
    const-string v1, "camera.enable_slate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_4

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_4
    const-string v1, "camera.enable_basalt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_5

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_5
    const-string v1, "camera.biotite_auto_scroll"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_6

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_6
    const-string v1, "camera.enable_macro_focus_badging"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_7

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_7
    const-string v1, "camera.enable_boba_jelly"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_8

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_8
    const-string v1, "camera.boba_jelly_eligible"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_9

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_9
    const-string v1, "camera.ark_enabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_10

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_10
    const-string v1, "camera.ark_focus_available"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_11

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_11
    const-string v1, "camera.ark_edge_hex"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_12

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_12
    const-string v1, "camera.ark_shutter_speed_available"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_creator_x_13

    const/4 v0, 0x1

    return v0

    :cond_check_creator_x_13
    const-string v1, "camera.ark_ISO_available"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_check_orig_x

    const/4 v0, 0x1

    return v0

    :cond_check_orig_x
iget-object p0, p0, Lklm;->b:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lovu;

    if-nez p0, :cond_not_null_x

    const/4 v0, 0x1

    return v0

    :cond_not_null_x
    iget-object p0, p0, Lovu;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    invoke-static {p0}, Lklk;->e(Ljava/lang/Boolean;)Z

    move-result p0

    return p0
.end method

.method public static isPixel8Series()Z
    .locals 2

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    if-nez v0, :cond_check_p8

    const/4 v0, 0x0

    return v0

    :cond_check_p8
    const-string v1, "husky"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_shiba

    const/4 v0, 0x1

    return v0

    :cond_shiba
    const-string v1, "shiba"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_akita

    const/4 v0, 0x1

    return v0

    :cond_akita
    const-string v1, "akita"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_false

    const/4 v0, 0x1

    return v0

    :cond_false
    const/4 v0, 0x0

    return v0
.end method
