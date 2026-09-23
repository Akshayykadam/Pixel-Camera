.class Lmla;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Lmks;


# static fields
.field public static final b:Lulc;

.field public static final c:Lulc;

.field private static final g:Lykq;


# instance fields
.field private final A:Lmis;

.field private final B:Lmkq;

.field private final C:Lufv;

.field private final D:Loto;

.field private final E:Lmkl;

.field private final F:Ljava/util/concurrent/Executor;

.field private final G:Lqgo;

.field private final H:Lpxa;

.field private final I:Luut;

.field private final J:Lpch;

.field private final K:Lmhr;

.field private final L:Lriq;

.field private final M:Lmpu;

.field private final N:Lmmj;

.field private final O:Lufv;

.field private final P:Z

.field private final Q:Lufv;

.field private final R:Lmmp;

.field private final S:Lsql;

.field private final T:Lmtr;

.field private final U:Lvbw;

.field private final V:Losw;

.field private final W:Lufv;

.field private final X:Lkxm;

.field private final Y:Lmns;

.field private final Z:Lnoe;

.field private final aa:Lqtd;

.field private final ab:Lklm;

.field private final ac:Lpoq;

.field private final ad:Lqep;

.field private final ae:Ljoq;

.field private final af:Lovu;

.field private final ag:Lovu;

.field private final ah:Lovu;

.field private final ai:Lrdw;

.field private final aj:Lrdw;

.field public final d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

.field public final e:Lulx;

.field public final f:Lmjf;

.field private final h:Ljava/lang/String;

.field private final i:Ljava/lang/String;

.field private final j:Lyeo;

.field private final k:Lcom/google/googlex/gcam/Gcam;

.field private final l:Lzsj;

.field private final m:Lmix;

.field private final n:Ladbv;

.field private final o:Lufv;

.field private final p:Lmlt;

.field private final q:Landroid/util/DisplayMetrics;

.field private final r:Lzsl;

.field private final s:Luus;

.field private final t:Lulc;

.field private final u:Ladbv;

.field private final v:Luep;

.field private final w:Lots;

.field private final x:Ladbv;

.field private final y:Lklg;

.field private final z:Lmiy;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "mla"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lmla;->g:Lykq;

    new-instance v0, Lulc;

    const/16 v1, 0x438

    const/16 v2, 0x780

    invoke-direct {v0, v2, v1}, Lulc;-><init>(II)V

    sput-object v0, Lmla;->b:Lulc;

    new-instance v0, Lulc;

    const/16 v1, 0x5a0

    invoke-direct {v0, v2, v1}, Lulc;-><init>(II)V

    sput-object v0, Lmla;->c:Lulc;

    return-void
.end method

.method public constructor <init>(Landroid/util/DisplayMetrics;Lmix;Lovu;Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;Lzsl;Luus;Losw;Lpeb;Lcom/google/googlex/gcam/Gcam;Lzsj;Lmnq;Ladbv;Lklm;Ladbv;Luep;Lots;Lmlt;Ladbv;Ljoq;Lklg;Lrdw;Lmiy;Lmis;Lmkq;Lufv;Lulx;Loto;Lrdw;Lmkl;Ljava/util/concurrent/Executor;Lqgo;Lpxa;Lovu;Luut;Lpch;Lmhr;Lriq;Lmpu;Lnoe;Lmmj;Lufv;Lufv;Lvbw;Lmjf;ZLmmp;Lsql;Lmtr;Lufv;Lkxm;Lqtd;Lmns;Lqep;Lovu;Lpoq;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    move-object/from16 v2, p9

    move-object/from16 v3, p15

    move-object/from16 v4, p30

    move-object/from16 v5, p40

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v6, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v7, 0x0

    invoke-direct {v6, v7, v8}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    move-object/from16 v6, p1

    iput-object v6, v0, Lmla;->q:Landroid/util/DisplayMetrics;

    move-object/from16 v6, p2

    iput-object v6, v0, Lmla;->m:Lmix;

    move-object/from16 v6, p3

    iput-object v6, v0, Lmla;->ah:Lovu;

    move-object/from16 v6, p4

    iput-object v6, v0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    move-object/from16 v6, p5

    iput-object v6, v0, Lmla;->r:Lzsl;

    move-object/from16 v6, p6

    iput-object v6, v0, Lmla;->s:Luus;

    iput-object v2, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    move-object/from16 v6, p10

    iput-object v6, v0, Lmla;->l:Lzsj;

    iget-object v6, v1, Losw;->b:Lugh;

    iput-object v6, v0, Lmla;->o:Lufv;

    move-object/from16 v6, p13

    iput-object v6, v0, Lmla;->ab:Lklm;

    move-object/from16 v6, p14

    iput-object v6, v0, Lmla;->n:Ladbv;

    iput-object v3, v0, Lmla;->v:Luep;

    move-object/from16 v6, p16

    iput-object v6, v0, Lmla;->w:Lots;

    move-object/from16 v6, p17

    iput-object v6, v0, Lmla;->p:Lmlt;

    move-object/from16 v6, p18

    iput-object v6, v0, Lmla;->x:Ladbv;

    move-object/from16 v6, p19

    iput-object v6, v0, Lmla;->ae:Ljoq;

    move-object/from16 v6, p20

    iput-object v6, v0, Lmla;->y:Lklg;

    move-object/from16 v6, p21

    iput-object v6, v0, Lmla;->aj:Lrdw;

    move-object/from16 v6, p22

    iput-object v6, v0, Lmla;->z:Lmiy;

    move-object/from16 v6, p23

    iput-object v6, v0, Lmla;->A:Lmis;

    move-object/from16 v6, p25

    iput-object v6, v0, Lmla;->C:Lufv;

    move-object/from16 v6, p24

    iput-object v6, v0, Lmla;->B:Lmkq;

    move-object/from16 v6, p27

    iput-object v6, v0, Lmla;->D:Loto;

    move-object/from16 v6, p28

    iput-object v6, v0, Lmla;->ai:Lrdw;

    move-object/from16 v6, p29

    iput-object v6, v0, Lmla;->E:Lmkl;

    iput-object v4, v0, Lmla;->F:Ljava/util/concurrent/Executor;

    move-object/from16 v6, p31

    iput-object v6, v0, Lmla;->G:Lqgo;

    move-object/from16 v6, p32

    iput-object v6, v0, Lmla;->H:Lpxa;

    move-object/from16 v6, p34

    iput-object v6, v0, Lmla;->I:Luut;

    move-object/from16 v6, p8

    iget-object v6, v6, Lpeb;->b:Lulc;

    iput-object v6, v0, Lmla;->t:Lulc;

    move-object/from16 v6, p12

    iput-object v6, v0, Lmla;->u:Ladbv;

    move-object/from16 v6, p26

    iput-object v6, v0, Lmla;->e:Lulx;

    invoke-static {}, Lcom/google/googlex/gcam/GcamModuleJNI;->kRequestCameraSecondaryTele_get()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lmla;->h:Ljava/lang/String;

    invoke-static {}, Lcom/google/googlex/gcam/GcamModuleJNI;->kRequestCameraSecondaryWide_get()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lmla;->i:Ljava/lang/String;

    move-object/from16 v6, p33

    iput-object v6, v0, Lmla;->af:Lovu;

    move-object/from16 v6, p35

    iput-object v6, v0, Lmla;->J:Lpch;

    move-object/from16 v6, p36

    iput-object v6, v0, Lmla;->K:Lmhr;

    move-object/from16 v6, p37

    iput-object v6, v0, Lmla;->L:Lriq;

    move-object/from16 v6, p38

    iput-object v6, v0, Lmla;->M:Lmpu;

    move-object/from16 v6, p39

    iput-object v6, v0, Lmla;->Z:Lnoe;

    iput-object v5, v0, Lmla;->N:Lmmj;

    move-object/from16 v6, p41

    iput-object v6, v0, Lmla;->O:Lufv;

    move/from16 v6, p45

    iput-boolean v6, v0, Lmla;->P:Z

    move-object/from16 v6, p42

    iput-object v6, v0, Lmla;->Q:Lufv;

    move-object/from16 v6, p43

    iput-object v6, v0, Lmla;->U:Lvbw;

    move-object/from16 v6, p44

    iput-object v6, v0, Lmla;->f:Lmjf;

    move-object/from16 v6, p46

    iput-object v6, v0, Lmla;->R:Lmmp;

    move-object/from16 v6, p47

    iput-object v6, v0, Lmla;->S:Lsql;

    move-object/from16 v6, p48

    iput-object v6, v0, Lmla;->T:Lmtr;

    iput-object v1, v0, Lmla;->V:Losw;

    move-object/from16 v1, p49

    iput-object v1, v0, Lmla;->W:Lufv;

    move-object/from16 v1, p50

    iput-object v1, v0, Lmla;->X:Lkxm;

    move-object/from16 v1, p51

    iput-object v1, v0, Lmla;->aa:Lqtd;

    move-object/from16 v1, p52

    iput-object v1, v0, Lmla;->Y:Lmns;

    move-object/from16 v1, p53

    iput-object v1, v0, Lmla;->ad:Lqep;

    move-object/from16 v1, p54

    iput-object v1, v0, Lmla;->ag:Lovu;

    move-object/from16 v1, p55

    iput-object v1, v0, Lmla;->ac:Lpoq;

    sget-object v1, Lkjq;->a:Lkiy;

    new-instance v1, Lyek;

    invoke-direct {v1}, Lyek;-><init>()V

    const/4 v6, 0x0

    :goto_0
    iget-wide v9, v2, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v9, v10, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_GetNumCameras(JLcom/google/googlex/gcam/Gcam;)I

    move-result v9

    const/4 v10, 0x0

    if-ge v6, v9, :cond_2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2, v6}, Lcom/google/googlex/gcam/Gcam;->d(I)Lcom/google/googlex/gcam/Tuning;

    move-result-object v11

    iget-wide v12, v11, Lcom/google/googlex/gcam/Tuning;->a:J

    invoke-static {v12, v13, v11}, Lcom/google/googlex/gcam/GcamModuleJNI;->Tuning_physical_stability_params_get(JLcom/google/googlex/gcam/Tuning;)J

    move-result-wide v11

    cmp-long v13, v11, v7

    if-nez v13, :cond_0

    move-object v13, v10

    goto :goto_1

    :cond_0
    new-instance v13, Lcom/google/googlex/gcam/PhysicalStabilityParams;

    invoke-direct {v13, v11, v12}, Lcom/google/googlex/gcam/PhysicalStabilityParams;-><init>(J)V

    :goto_1
    invoke-virtual {v2, v6}, Lcom/google/googlex/gcam/Gcam;->d(I)Lcom/google/googlex/gcam/Tuning;

    move-result-object v11

    iget-wide v14, v11, Lcom/google/googlex/gcam/Tuning;->a:J

    invoke-static {v14, v15, v11}, Lcom/google/googlex/gcam/GcamModuleJNI;->Tuning_post_shutter_af_params_get(JLcom/google/googlex/gcam/Tuning;)J

    move-result-wide v11

    cmp-long v14, v11, v7

    if-nez v14, :cond_1

    goto :goto_2

    :cond_1
    new-instance v10, Lcom/google/googlex/gcam/PostShutterAfParams;

    invoke-direct {v10, v11, v12}, Lcom/google/googlex/gcam/PostShutterAfParams;-><init>(J)V

    :goto_2
    new-instance v11, Lmkz;

    invoke-direct {v11, v13, v10}, Lmkz;-><init>(Lcom/google/googlex/gcam/PhysicalStabilityParams;Lcom/google/googlex/gcam/PostShutterAfParams;)V

    invoke-virtual {v1, v9, v11}, Lyek;->f(Ljava/lang/Object;Ljava/lang/Object;)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Lyek;->b()Lyeo;

    move-result-object v1

    iput-object v1, v0, Lmla;->j:Lyeo;

    new-instance v0, Ljlk;

    const/16 v1, 0xf

    move-object/from16 v6, p11

    invoke-direct {v0, v2, v6, v1, v10}, Ljlk;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    invoke-virtual {v5, v0, v4}, Lugo;->gv(Lule;Ljava/util/concurrent/Executor;)Lula;

    move-result-object v0

    invoke-virtual {v3, v0}, Luep;->e(Lula;)V

    return-void
.end method

.method private final L(FZZ)Lcom/google/googlex/gcam/AeShotParams;
    .locals 4

    new-instance v0, Lcom/google/googlex/gcam/AeShotParams;

    invoke-direct {v0}, Lcom/google/googlex/gcam/AeShotParams;-><init>()V

    iget-object v1, p0, Lmla;->m:Lmix;

    iget-boolean v1, v1, Lmix;->g:Z

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->i(F)V

    if-eqz p3, :cond_0

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lmla;->t:Lulc;

    iget p3, p1, Lulc;->a:I

    invoke-virtual {v0, p3}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    iget p1, p1, Lulc;->b:I

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    :goto_0
    sget-object p1, Lpci;->a:Lpci;

    iget-object p1, p0, Lmla;->p:Lmlt;

    invoke-virtual {p1}, Lmlt;->ordinal()I

    move-result p1

    const/4 p3, 0x1

    if-eqz p1, :cond_4

    if-eq p1, p3, :cond_3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_4

    goto :goto_1

    :cond_1
    sget-object p1, Lzok;->d:Lzok;

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->p(Lzok;)V

    goto :goto_1

    :cond_2
    sget-object p1, Lzok;->c:Lzok;

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->p(Lzok;)V

    goto :goto_1

    :cond_3
    sget-object p1, Lzok;->b:Lzok;

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->p(Lzok;)V

    goto :goto_1

    :cond_4
    sget-object p1, Lzok;->a:Lzok;

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->p(Lzok;)V

    :goto_1
    if-eqz p2, :cond_5

    sget-object p1, Lzmw;->c:Lzmw;

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->g(Lzmw;)V

    goto :goto_3

    :cond_5
    iget-object p1, p0, Lmla;->O:Lufv;

    invoke-interface {p1}, Lufv;->d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_6

    sget-object p1, Lzmw;->d:Lzmw;

    goto :goto_2

    :cond_6
    sget-object p1, Lzmw;->b:Lzmw;

    :goto_2
    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->g(Lzmw;)V

    :goto_3
    iget-object p1, p0, Lmla;->D:Loto;

    invoke-virtual {p1}, Loto;->c()Z

    move-result p1

    if-eqz p1, :cond_7

    sget-object p1, Lzoj;->e:Lzoj;

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/AeShotParams;->o(Lzoj;)V

    :cond_7
    iget-object p1, p0, Lmla;->ab:Lklm;

    sget-object p2, Lkjq;->ba:Lkiz;

    invoke-virtual {p1, p2}, Lklm;->q(Lkiz;)Z

    move-result p2

    iget-wide v1, v0, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {v1, v2, v0, p2}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeShotParams_legacy_pre_slm_processing_set(JLcom/google/googlex/gcam/AeShotParams;Z)V

    sget-object p2, Lkjq;->bb:Lkiz;

    invoke-virtual {p1, p2}, Lklm;->q(Lkiz;)Z

    move-result p2

    iget-wide v1, v0, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {v1, v2, v0, p2}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeShotParams_use_eclipse_set(JLcom/google/googlex/gcam/AeShotParams;Z)V

    sget-object p2, Lkjq;->u:Lkiy;

    invoke-virtual {p1, p2}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p2

    new-instance v1, Llza;

    const/16 v2, 0x10

    invoke-direct {v1, v0, v2}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p2}, Lj$/util/Optional;->isPresent()Z

    move-result v2

    if-ne p3, v2, :cond_8

    invoke-virtual {p2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p2

    iget-object v1, v1, Llza;->a:Ljava/lang/Object;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    check-cast v1, Lcom/google/googlex/gcam/AeShotParams;

    iget-wide v2, v1, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {v2, v3, v1, p2}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeShotParams_eclipse_version_override_set(JLcom/google/googlex/gcam/AeShotParams;I)V

    :cond_8
    iget-object p0, p0, Lmla;->V:Losw;

    iget-object p2, p0, Losw;->f:Lugh;

    check-cast p2, Lufn;

    iget-object v1, p2, Lufn;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sget-object v2, Lkim;->f:Lkiz;

    invoke-virtual {p1, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_9

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_9

    new-instance v1, Lppw;

    iget-object p2, p2, Lufn;->c:Ljava/lang/Object;

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    iget-object p0, p0, Losw;->g:Lugh;

    check-cast p0, Lufn;

    iget-object p0, p0, Lufn;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, p2, p0, v2}, Lppw;-><init>(FFLjava/lang/Float;)V

    invoke-static {p1}, Lnbw;->p(Lklm;)Landroid/util/Pair;

    move-result-object p0

    iget-object p2, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-virtual {v1, p2, p0}, Lppw;->a(II)F

    move-result p0

    invoke-virtual {v0, p0}, Lcom/google/googlex/gcam/AeShotParams;->j(F)V

    :cond_9
    sget-object p0, Lkjq;->bM:Lkiz;

    invoke-virtual {p1, p0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object p0

    new-instance p2, Llza;

    const/16 v1, 0x11

    invoke-direct {p2, v0, v1}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-ne p3, v1, :cond_a

    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    iget-object p2, p2, Llza;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    check-cast p2, Lcom/google/googlex/gcam/AeShotParams;

    iget-wide v1, p2, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {v1, v2, p2, p0}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeShotParams_max_hdr_ratio_override_set(JLcom/google/googlex/gcam/AeShotParams;F)V

    :cond_a
    sget-object p0, Lkjq;->bN:Lkiz;

    invoke-virtual {p1, p0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object p0

    new-instance p1, Llza;

    const/16 p2, 0x12

    invoke-direct {p1, v0, p2}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {p0}, Lj$/util/Optional;->isPresent()Z

    move-result p2

    if-ne p3, p2, :cond_b

    invoke-virtual {p0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object p0

    iget-object p1, p1, Llza;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    check-cast p1, Lcom/google/googlex/gcam/AeShotParams;

    iget-wide p2, p1, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {p2, p3, p1, p0}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeShotParams_max_hdr_portrait_ratio_override_set(JLcom/google/googlex/gcam/AeShotParams;F)V

    :cond_b
    return-object v0
.end method

.method private final M()V
    .locals 1

    iget-object p0, p0, Lmla;->v:Luep;

    invoke-virtual {p0}, Luep;->c()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Lumz;

    const-string v0, "Camera already closed"

    invoke-direct {p0, v0}, Lumz;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static N(Lcom/google/googlex/gcam/AeShotParams;Landroid/graphics/RectF;)V
    .locals 2

    new-instance v0, Lcom/google/googlex/gcam/NormalizedRect;

    invoke-direct {v0}, Lcom/google/googlex/gcam/NormalizedRect;-><init>()V

    iget v1, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0, v1}, Lcom/google/googlex/gcam/NormalizedRect;->c(F)V

    iget v1, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v1}, Lcom/google/googlex/gcam/NormalizedRect;->e(F)V

    iget v1, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {v0, v1}, Lcom/google/googlex/gcam/NormalizedRect;->d(F)V

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, p1}, Lcom/google/googlex/gcam/NormalizedRect;->f(F)V

    invoke-virtual {p0, v0}, Lcom/google/googlex/gcam/AeShotParams;->h(Lcom/google/googlex/gcam/NormalizedRect;)V

    invoke-virtual {p0, v0}, Lcom/google/googlex/gcam/AeShotParams;->k(Lcom/google/googlex/gcam/NormalizedRect;)V

    return-void
.end method

.method private final O()Z
    .locals 1

    iget-object v0, p0, Lmla;->A:Lmis;

    iget-object p0, p0, Lmla;->p:Lmlt;

    invoke-virtual {v0, p0}, Lmis;->e(Lmlt;)Z

    move-result p0

    return p0
.end method

.method private final P(Lrip;Lmqa;)Z
    .locals 1

    invoke-virtual {p2}, Lmqa;->a()Lmpz;

    move-result-object p2

    sget-object v0, Lmpz;->c:Lmpz;

    invoke-virtual {p2, v0}, Lmpz;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p0, p0, Lmla;->L:Lriq;

    invoke-interface {p0}, Lriq;->d()Lrip;

    move-result-object p0

    invoke-virtual {p0, p1}, Lrip;->b(Lrip;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private static Q(Lmqa;)Z
    .locals 2

    iget v0, p0, Lmqa;->c:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lmqa;->a()Lmpz;

    move-result-object p0

    sget-object v0, Lmpz;->g:Lmpz;

    if-ne p0, v0, :cond_0

    return v1

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private final R(ZLpci;)Z
    .locals 2

    iget-object v0, p0, Lmla;->M:Lmpu;

    invoke-interface {v0}, Lmpu;->e()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lmla;->W:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnoj;

    sget-object v1, Lnoj;->c:Lnoj;

    invoke-virtual {v0, v1}, Lnoj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean p0, p0, Lmla;->P:Z

    if-eqz p0, :cond_1

    if-nez p1, :cond_1

    iget p0, p2, Lpci;->e:I

    if-eqz p0, :cond_0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_1

    return p1

    :cond_0
    const/4 p0, 0x0

    throw p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static final S([F)Lcom/google/googlex/gcam/FloatVector;
    .locals 3

    new-instance v0, Lcom/google/googlex/gcam/FloatVector;

    invoke-direct {v0}, Lcom/google/googlex/gcam/FloatVector;-><init>()V

    if-eqz p0, :cond_0

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    aget v2, p0, v1

    invoke-virtual {v0, v2}, Lcom/google/googlex/gcam/FloatVector;->c(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static T(Lzne;)I
    .locals 0

    iget p0, p0, Lzne;->g:I

    invoke-static {p0}, La;->Y(I)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method private final U(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;ZIIZIZLxwg;Lmqa;ZZLmtn;FLxwg;)Lmnk;
    .locals 41

    move-object/from16 v2, p0

    move-object/from16 v14, p1

    move-object/from16 v1, p3

    move-object/from16 v13, p6

    move/from16 v0, p9

    iget-object v3, v2, Lmla;->ai:Lrdw;

    iget-object v3, v3, Lrdw;->b:Ljava/lang/Object;

    move-object/from16 v4, p2

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmnl;

    const/4 v4, 0x0

    if-nez v3, :cond_0

    new-instance v3, Lmnl;

    invoke-direct {v3, v4}, Lmnl;-><init>([B)V

    :cond_0
    iget-object v5, v3, Lmnl;->a:Lyfk;

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->b:Lyfm;

    goto :goto_0

    :cond_1
    iget-object v5, v3, Lmnl;->b:Lyfm;

    if-nez v5, :cond_2

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->b:Lyfm;

    :cond_2
    :goto_0
    iget-object v5, v3, Lmnl;->d:Lyfk;

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->e:Lyfm;

    goto :goto_1

    :cond_3
    iget-object v5, v3, Lmnl;->e:Lyfm;

    if-nez v5, :cond_4

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->e:Lyfm;

    :cond_4
    :goto_1
    iget-object v5, v3, Lmnl;->f:Lyfk;

    if-eqz v5, :cond_5

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->g:Lyfm;

    goto :goto_2

    :cond_5
    iget-object v5, v3, Lmnl;->g:Lyfm;

    if-nez v5, :cond_6

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->g:Lyfm;

    :cond_6
    :goto_2
    iget-object v5, v3, Lmnl;->h:Lyfk;

    if-eqz v5, :cond_7

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->i:Lyfm;

    goto :goto_3

    :cond_7
    iget-object v5, v3, Lmnl;->i:Lyfm;

    if-nez v5, :cond_8

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->i:Lyfm;

    :cond_8
    :goto_3
    iget-object v5, v3, Lmnl;->j:Lyfk;

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->k:Lyfm;

    goto :goto_4

    :cond_9
    iget-object v5, v3, Lmnl;->k:Lyfm;

    if-nez v5, :cond_a

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->k:Lyfm;

    :cond_a
    :goto_4
    iget-object v5, v3, Lmnl;->l:Lyfk;

    if-eqz v5, :cond_b

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->m:Lyfm;

    goto :goto_5

    :cond_b
    iget-object v5, v3, Lmnl;->m:Lyfm;

    if-nez v5, :cond_c

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->m:Lyfm;

    :cond_c
    :goto_5
    iget-object v5, v3, Lmnl;->n:Lyfk;

    if-eqz v5, :cond_d

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->o:Lyfm;

    goto :goto_6

    :cond_d
    iget-object v5, v3, Lmnl;->o:Lyfm;

    if-nez v5, :cond_e

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->o:Lyfm;

    :cond_e
    :goto_6
    iget-object v5, v3, Lmnl;->p:Lyfk;

    if-eqz v5, :cond_f

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->q:Lyfm;

    goto :goto_7

    :cond_f
    iget-object v5, v3, Lmnl;->q:Lyfm;

    if-nez v5, :cond_10

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->q:Lyfm;

    :cond_10
    :goto_7
    iget-object v5, v3, Lmnl;->r:Lyfk;

    if-eqz v5, :cond_11

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->s:Lyfm;

    goto :goto_8

    :cond_11
    iget-object v5, v3, Lmnl;->s:Lyfm;

    if-nez v5, :cond_12

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->s:Lyfm;

    :cond_12
    :goto_8
    iget-object v5, v3, Lmnl;->t:Lyfk;

    if-eqz v5, :cond_13

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->u:Lyfm;

    goto :goto_9

    :cond_13
    iget-object v5, v3, Lmnl;->u:Lyfm;

    if-nez v5, :cond_14

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->u:Lyfm;

    :cond_14
    :goto_9
    iget-object v5, v3, Lmnl;->v:Lyfk;

    if-eqz v5, :cond_15

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->w:Lyfm;

    goto :goto_a

    :cond_15
    iget-object v5, v3, Lmnl;->w:Lyfm;

    if-nez v5, :cond_16

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->w:Lyfm;

    :cond_16
    :goto_a
    iget-object v5, v3, Lmnl;->x:Lyfk;

    if-eqz v5, :cond_17

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->y:Lyfm;

    goto :goto_b

    :cond_17
    iget-object v5, v3, Lmnl;->y:Lyfm;

    if-nez v5, :cond_18

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->y:Lyfm;

    :cond_18
    :goto_b
    iget-object v5, v3, Lmnl;->z:Lyfk;

    if-eqz v5, :cond_19

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->A:Lyfm;

    goto :goto_c

    :cond_19
    iget-object v5, v3, Lmnl;->A:Lyfm;

    if-nez v5, :cond_1a

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->A:Lyfm;

    :cond_1a
    :goto_c
    iget-object v5, v3, Lmnl;->D:Lyfk;

    if-eqz v5, :cond_1b

    invoke-virtual {v5}, Lyfk;->g()Lyfm;

    move-result-object v5

    iput-object v5, v3, Lmnl;->E:Lyfm;

    goto :goto_d

    :cond_1b
    iget-object v5, v3, Lmnl;->E:Lyfm;

    if-nez v5, :cond_1c

    sget-object v5, Lyiu;->a:Lyiu;

    iput-object v5, v3, Lmnl;->E:Lyfm;

    :cond_1c
    :goto_d
    new-instance v15, Lmnm;

    iget-object v5, v3, Lmnl;->b:Lyfm;

    iget-object v6, v3, Lmnl;->c:Lxwg;

    iget-object v7, v3, Lmnl;->e:Lyfm;

    iget-object v8, v3, Lmnl;->g:Lyfm;

    iget-object v9, v3, Lmnl;->i:Lyfm;

    iget-object v10, v3, Lmnl;->k:Lyfm;

    iget-object v11, v3, Lmnl;->m:Lyfm;

    iget-object v12, v3, Lmnl;->o:Lyfm;

    iget-object v4, v3, Lmnl;->q:Lyfm;

    move-object/from16 v24, v4

    iget-object v4, v3, Lmnl;->s:Lyfm;

    move-object/from16 v25, v4

    iget-object v4, v3, Lmnl;->u:Lyfm;

    move-object/from16 v26, v4

    iget-object v4, v3, Lmnl;->w:Lyfm;

    move-object/from16 v27, v4

    iget-object v4, v3, Lmnl;->y:Lyfm;

    move-object/from16 v28, v4

    iget-object v4, v3, Lmnl;->A:Lyfm;

    move-object/from16 v29, v4

    iget-object v4, v3, Lmnl;->B:Lxwg;

    move-object/from16 v30, v4

    iget-object v4, v3, Lmnl;->C:Lxwg;

    iget-object v3, v3, Lmnl;->E:Lyfm;

    move-object/from16 v32, v3

    move-object/from16 v31, v4

    move-object/from16 v16, v5

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    move-object/from16 v19, v8

    move-object/from16 v20, v9

    move-object/from16 v21, v10

    move-object/from16 v22, v11

    move-object/from16 v23, v12

    invoke-direct/range {v15 .. v32}, Lmnm;-><init>(Lyfm;Lxwg;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lyfm;Lxwg;Lxwg;Lyfm;)V

    move-object/from16 v26, v15

    iget-object v3, v2, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    iget-object v4, v2, Lmla;->o:Lufv;

    check-cast v4, Lufn;

    iget-object v4, v4, Lufn;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Lzsn;->a(I)F

    move-result v4

    iget-object v5, v1, Ltse;->c:Ljava/lang/Object;

    move-object v6, v3

    move v3, v4

    invoke-interface {v5}, Lqrg;->f()I

    move-result v4

    if-eqz v5, :cond_1d

    invoke-interface {v5}, Lqrg;->v()Lxwg;

    move-result-object v7

    goto :goto_e

    :cond_1d
    sget-object v7, Lxuz;->a:Lxuz;

    :goto_e
    move-object v10, v7

    invoke-virtual/range {v26 .. v26}, Lmnm;->c()Lxwg;

    move-result-object v7

    invoke-virtual {v7}, Lxwg;->h()Z

    move-result v8

    move-object/from16 v7, p17

    check-cast v7, Lmmk;

    iget-boolean v7, v7, Lmmk;->c:Z

    iget-object v9, v2, Lmla;->e:Lulx;

    const-string v11, "shotParams"

    invoke-interface {v9, v11}, Lulx;->f(Ljava/lang/String;)V

    const-string v11, "create"

    invoke-interface {v9, v11}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v2, v13, v14}, Lmla;->l(Luzj;Luuv;)Lzoi;

    move-result-object v11

    invoke-virtual {v2, v11}, Lmla;->b(Lzoi;)I

    move-result v15

    sget-object v12, Landroid/hardware/camera2/CaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v13, v12}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Long;

    invoke-static {v13}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->E(Luzj;)Lcom/google/googlex/gcam/LiveHdrMetadata;

    move-result-object v2

    move/from16 v16, v3

    move/from16 v17, v4

    iget-wide v3, v2, Lcom/google/googlex/gcam/LiveHdrMetadata;->a:J

    invoke-static {v3, v4, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->LiveHdrMetadata_night_factor_get(JLcom/google/googlex/gcam/LiveHdrMetadata;)F

    move-result v2

    move-object v3, v12

    invoke-virtual/range {p13 .. p13}, Lxwg;->h()Z

    move-result v12

    if-eqz v3, :cond_1e

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    goto :goto_f

    :cond_1e
    const-wide/16 v3, -0x1

    :goto_f
    invoke-interface {v5}, Lqrg;->al()Z

    move-result v21

    invoke-interface {v5}, Lqrg;->am()Z

    move-result v24

    move/from16 v18, v2

    iget-object v2, v1, Ltse;->a:Ljava/lang/Object;

    check-cast v2, Lost;

    iget-object v1, v2, Lost;->p:Lxwg;

    const/16 v19, 0x1

    move/from16 v20, p16

    move-object/from16 v22, p17

    move/from16 v23, p18

    move-object/from16 v25, v1

    move-object/from16 v36, v2

    move-object/from16 v34, v5

    move-object/from16 v33, v6

    move/from16 v27, v7

    move-object v1, v9

    move-object/from16 v35, v11

    move v6, v15

    move-object/from16 v2, p0

    move-object/from16 v5, p5

    move/from16 v7, p7

    move/from16 v11, p10

    move/from16 v9, p12

    move/from16 v38, v18

    move-object/from16 v18, p14

    move-wide/from16 v39, v3

    move/from16 v3, v16

    move-wide/from16 v15, v39

    move/from16 v4, v17

    move/from16 v17, v38

    invoke-virtual/range {v2 .. v25}, Lmla;->K(FILpci;IZZZLxwg;ZZLuzj;Luuv;JFLmqa;ZZZLmtn;FZLxwg;)Lcom/google/googlex/gcam/ShotParams;

    move-result-object v8

    move v9, v7

    move-object v7, v2

    move v2, v9

    move v9, v6

    invoke-virtual/range {p19 .. p19}, Lxwg;->h()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-virtual/range {p19 .. p19}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzny;

    invoke-virtual {v8, v3}, Lcom/google/googlex/gcam/ShotParams;->h(Lzny;)V

    :cond_1f
    const-string v3, "setWb"

    invoke-interface {v1, v3}, Lulx;->h(Ljava/lang/String;)V

    iget-object v3, v7, Lmla;->w:Lots;

    invoke-virtual {v3}, Lugp;->d()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lotr;->a:Lotr;

    if-ne v3, v4, :cond_21

    iget-object v3, v7, Lmla;->Q:Lufv;

    invoke-interface {v3}, Lufv;->d()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnqm;

    iget-object v3, v3, Lnqm;->h:Lj$/util/Optional;

    invoke-virtual {v3}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_20

    goto :goto_10

    :cond_20
    sget-object v3, Lzom;->a:Lzom;

    goto :goto_11

    :cond_21
    :goto_10
    sget-object v3, Lzom;->b:Lzom;

    :goto_11
    iget-wide v4, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget v3, v3, Lzom;->c:I

    invoke-static {v4, v5, v8, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_wb_mode_set(JLcom/google/googlex/gcam/ShotParams;I)V

    const-string v3, "setSuffix"

    invoke-interface {v1, v3}, Lulx;->h(Ljava/lang/String;)V

    const/4 v10, 0x1

    if-eq v10, v2, :cond_22

    const-string v3, "n"

    goto :goto_12

    :cond_22
    const-string v3, "z"

    :goto_12
    sget-object v4, Lpci;->a:Lpci;

    iget-object v12, v7, Lmla;->p:Lmlt;

    invoke-virtual {v12}, Lmlt;->ordinal()I

    move-result v4

    const/4 v11, 0x2

    if-eqz v4, :cond_23

    if-eq v4, v10, :cond_27

    if-eq v4, v11, :cond_26

    const/4 v5, 0x3

    if-eq v4, v5, :cond_25

    const/4 v5, 0x4

    if-ne v4, v5, :cond_24

    :cond_23
    const/4 v4, 0x0

    goto :goto_13

    :cond_24
    new-instance v0, Ljava/lang/RuntimeException;

    const/4 v4, 0x0

    invoke-direct {v0, v4, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_25
    const/4 v4, 0x0

    const-string v5, "m"

    goto :goto_14

    :cond_26
    const/4 v4, 0x0

    const-string v5, "l"

    goto :goto_14

    :cond_27
    const/4 v4, 0x0

    const-string v5, "p"

    goto :goto_14

    :goto_13
    const-string v5, "d"

    :goto_14
    invoke-virtual {v3, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-wide v5, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v5, v6, v8, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_software_suffix_set(JLcom/google/googlex/gcam/ShotParams;Ljava/lang/String;)V

    const-string v3, "setBfIndex"

    invoke-interface {v1, v3}, Lulx;->h(Ljava/lang/String;)V

    const/4 v3, -0x1

    if-lt v0, v3, :cond_28

    move v3, v10

    goto :goto_15

    :cond_28
    const/4 v3, 0x0

    :goto_15
    const-string v5, "Incorrect base frame override."

    invoke-static {v3, v5}, Lyny;->ba(ZLjava/lang/Object;)V

    invoke-virtual {v8, v0}, Lcom/google/googlex/gcam/ShotParams;->e(I)V

    if-eqz v2, :cond_29

    const-string v0, "Incorrect base frame hint."

    invoke-static {v10, v0}, Lyny;->ba(ZLjava/lang/Object;)V

    iget-wide v5, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v0, p8

    invoke-static {v5, v6, v8, v0}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_zsl_base_frame_index_hint_set(JLcom/google/googlex/gcam/ShotParams;I)V

    :cond_29
    const-string v0, "AwbInfo"

    invoke-interface {v1, v0}, Lulx;->h(Ljava/lang/String;)V

    move-object/from16 v0, v33

    invoke-virtual {v0, v13, v14}, Lzsn;->j(Luzj;Luuv;)Luus;

    move-result-object v3

    invoke-static {v13, v3}, Lzsn;->m(Luzj;Luus;)Lcom/google/googlex/gcam/AwbInfo;

    move-result-object v3

    const-string v5, "wb"

    invoke-interface {v1, v5}, Lulx;->h(Ljava/lang/String;)V

    iget-object v5, v7, Lmla;->ab:Lklm;

    sget-object v6, Lkjq;->b:Lkiy;

    invoke-virtual {v5, v6}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v6

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v6, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-nez v2, :cond_2a

    iget-wide v10, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v10, v11, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_GcamAwbDesired(JLcom/google/googlex/gcam/ShotParams;)Z

    move-result v2

    if-nez v2, :cond_2a

    const/4 v2, 0x2

    if-eq v4, v2, :cond_2a

    const/4 v2, 0x1

    goto :goto_16

    :cond_2a
    const/4 v2, 0x0

    :goto_16
    invoke-virtual/range {p13 .. p13}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_2b

    invoke-virtual/range {p13 .. p13}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/googlex/gcam/AwbInfo;

    invoke-virtual {v8, v2}, Lcom/google/googlex/gcam/ShotParams;->f(Lcom/google/googlex/gcam/AwbInfo;)V

    goto :goto_17

    :cond_2b
    if-eqz v2, :cond_2c

    invoke-virtual {v8, v3}, Lcom/google/googlex/gcam/ShotParams;->f(Lcom/google/googlex/gcam/AwbInfo;)V

    :cond_2c
    :goto_17
    if-eqz p15, :cond_34

    sget-object v2, Lkkq;->k:Lkiz;

    invoke-virtual {v5, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-nez v2, :cond_2d

    goto :goto_1c

    :cond_2d
    sget-object v2, Lzoi;->e:Lzoi;

    move-object/from16 v10, v35

    if-ne v10, v2, :cond_2e

    iget-object v2, v7, Lmla;->Z:Lnoe;

    iget-boolean v3, v7, Lmla;->P:Z

    iget-object v4, v7, Lmla;->S:Lsql;

    invoke-virtual {v2, v3, v4}, Lnoe;->i(ZLsql;)Z

    move-result v2

    if-eqz v2, :cond_2e

    const/4 v2, 0x1

    goto :goto_18

    :cond_2e
    const/4 v2, 0x0

    :goto_18
    sget-object v3, Lzoi;->l:Lzoi;

    if-ne v10, v3, :cond_2f

    iget-object v4, v7, Lmla;->Z:Lnoe;

    invoke-virtual {v4}, Lnoe;->g()Z

    move-result v4

    if-eqz v4, :cond_2f

    const/4 v4, 0x1

    goto :goto_19

    :cond_2f
    const/4 v4, 0x0

    :goto_19
    sget-object v6, Lzoi;->q:Lzoi;

    if-ne v10, v6, :cond_30

    iget-object v11, v7, Lmla;->Z:Lnoe;

    invoke-virtual {v11}, Lnoe;->h()Z

    move-result v11

    if-eqz v11, :cond_30

    const/4 v11, 0x1

    goto :goto_1a

    :cond_30
    const/4 v11, 0x0

    :goto_1a
    if-eq v10, v3, :cond_31

    if-ne v10, v6, :cond_32

    :cond_31
    iget-object v3, v7, Lmla;->Z:Lnoe;

    iget-object v6, v7, Lmla;->S:Lsql;

    iget-boolean v15, v7, Lmla;->P:Z

    invoke-virtual {v3, v6, v15}, Lnoe;->f(Lsql;Z)Z

    move-result v3

    if-eqz v3, :cond_32

    const/4 v15, 0x1

    goto :goto_1b

    :cond_32
    const/4 v15, 0x0

    :goto_1b
    if-nez v2, :cond_33

    if-nez v4, :cond_33

    if-nez v11, :cond_33

    if-eqz v15, :cond_35

    :cond_33
    iget-wide v2, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    const/4 v4, 0x1

    invoke-static {v2, v3, v8, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_use_binned_metering_frame_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    goto :goto_1d

    :cond_34
    :goto_1c
    move-object/from16 v10, v35

    :cond_35
    :goto_1d
    move-object/from16 v11, v36

    iget-object v2, v11, Lost;->m:Lxwg;

    iget-object v3, v7, Lmla;->t:Lulc;

    invoke-virtual {v2, v3}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lulc;

    const-string v3, "updateAndGetPhotoSize"

    invoke-interface {v1, v3}, Lulx;->h(Ljava/lang/String;)V

    iget-object v3, v7, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {v3, v9}, Lcom/google/googlex/gcam/Gcam;->c(I)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v4

    sget-object v15, Lmlt;->b:Lmlt;

    invoke-virtual {v12, v15}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_41

    sget-object v3, Lzoi;->b:Lzoi;

    if-eq v4, v3, :cond_37

    sget-object v6, Lzoi;->f:Lzoi;

    if-eq v4, v6, :cond_37

    sget-object v6, Lzoi;->u:Lzoi;

    if-ne v4, v6, :cond_36

    goto :goto_1e

    :cond_36
    move-object/from16 v33, v0

    move/from16 v16, v9

    move-object/from16 v35, v10

    goto :goto_22

    :cond_37
    :goto_1e
    move/from16 v16, v9

    move-object/from16 v35, v10

    iget-wide v9, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v9, v10, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_resampling_method_override_get(JLcom/google/googlex/gcam/ShotParams;)I

    move-result v6

    sget-object v9, Lzog;->h:[Lzog;

    const/4 v10, 0x7

    if-ge v6, v10, :cond_39

    if-ltz v6, :cond_39

    aget-object v10, v9, v6

    move-object/from16 v33, v0

    iget v0, v10, Lzog;->i:I

    if-ne v0, v6, :cond_38

    goto :goto_21

    :cond_38
    const/4 v0, 0x0

    :goto_1f
    const/4 v10, 0x7

    goto :goto_20

    :cond_39
    move-object/from16 v33, v0

    const/4 v0, 0x0

    :goto_20
    if-ge v0, v10, :cond_40

    aget-object v10, v9, v0

    move/from16 v17, v0

    iget v0, v10, Lzog;->i:I

    if-ne v0, v6, :cond_3f

    :goto_21
    sget-object v0, Lzog;->f:Lzog;

    if-eq v10, v0, :cond_3a

    :goto_22
    sget-object v0, Lzog;->a:Lzog;

    invoke-virtual {v8, v0}, Lcom/google/googlex/gcam/ShotParams;->j(Lzog;)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    const/4 v10, 0x0

    invoke-virtual {v0, v10}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    goto :goto_23

    :cond_3a
    const/4 v10, 0x0

    :goto_23
    if-eq v4, v3, :cond_3d

    sget-object v0, Lzoi;->e:Lzoi;

    if-eq v4, v0, :cond_3d

    sget-object v0, Lzoi;->f:Lzoi;

    if-ne v4, v0, :cond_3b

    goto :goto_25

    :cond_3b
    sget-object v0, Lzoi;->u:Lzoi;

    if-ne v4, v0, :cond_3c

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    sget-object v3, Lpww;->c:Lcom/google/googlex/gcam/NormalizedRect;

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->k(Lcom/google/googlex/gcam/NormalizedRect;)V

    sget-object v0, Luko;->b:Luko;

    invoke-static {v2}, Luko;->i(Lulc;)Luko;

    move-result-object v3

    invoke-virtual {v0, v3}, Luko;->l(Luko;)Z

    move-result v0

    if-eqz v0, :cond_3c

    sget-object v2, Lpww;->h:Lulc;

    :cond_3c
    :goto_24
    move-object/from16 v36, v11

    const/4 v9, 0x2

    goto/16 :goto_28

    :cond_3d
    :goto_25
    sget-object v0, Lkkn;->i:Lkiz;

    invoke-virtual {v5, v0}, Lklm;->h(Lkiz;)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lpww;->i:Lyeo;

    invoke-virtual {v3, v0}, Lyeo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/googlex/gcam/NormalizedRect;

    if-eqz v3, :cond_3e

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->k(Lcom/google/googlex/gcam/NormalizedRect;)V

    goto :goto_24

    :cond_3e
    sget-object v3, Lkkm;->a:Lkkm;

    iget-object v3, v3, Lkkm;->g:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    sget-object v3, Lmla;->g:Lykq;

    invoke-virtual {v3}, Lykh;->b()Lyld;

    move-result-object v3

    const/16 v4, 0xc52

    invoke-interface {v3, v4}, Lyko;->O(I)Lyld;

    move-result-object v3

    check-cast v3, Lyko;

    const-string v4, "Merged crop not found for: %s"

    invoke-interface {v3, v4, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_24

    :cond_3f
    const/4 v10, 0x0

    add-int/lit8 v0, v17, 0x1

    goto/16 :goto_1f

    :cond_40
    const-class v0, Lzog;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No enum "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with value "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_41
    move-object/from16 v33, v0

    move/from16 v16, v9

    move-object/from16 v35, v10

    const/4 v10, 0x0

    sget-object v0, Lzoi;->i:Lzoi;

    if-eq v4, v0, :cond_43

    sget-object v0, Lzoi;->k:Lzoi;

    if-ne v4, v0, :cond_42

    goto :goto_26

    :cond_42
    move v4, v10

    goto :goto_27

    :cond_43
    :goto_26
    const/4 v4, 0x1

    :goto_27
    if-eqz p10, :cond_3c

    if-eqz v4, :cond_46

    sget-object v0, Lmlt;->a:Lmlt;

    invoke-virtual {v12, v0}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_44

    sget-object v0, Lmlt;->e:Lmlt;

    invoke-virtual {v12, v0}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    :cond_44
    new-instance v0, Lulc;

    move-object/from16 v36, v11

    iget-wide v10, v3, Lcom/google/googlex/gcam/StaticMetadata;->a:J

    invoke-static {v10, v11, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->StaticMetadata_pixel_array_width_get(JLcom/google/googlex/gcam/StaticMetadata;)I

    move-result v4

    iget-wide v9, v3, Lcom/google/googlex/gcam/StaticMetadata;->a:J

    invoke-static {v9, v10, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->StaticMetadata_pixel_array_height_get(JLcom/google/googlex/gcam/StaticMetadata;)I

    move-result v3

    invoke-direct {v0, v4, v3}, Lulc;-><init>(II)V

    invoke-static {v2}, Luko;->i(Lulc;)Luko;

    move-result-object v2

    invoke-virtual {v2, v0}, Luko;->e(Lulc;)Landroid/graphics/Rect;

    move-result-object v0

    new-instance v2, Lulc;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-direct {v2, v3, v0}, Lulc;-><init>(II)V

    iget-object v0, v7, Lmla;->C:Lufv;

    invoke-interface {v0}, Lufv;->d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sget-object v3, Lkit;->Z:Lkiz;

    invoke-virtual {v5, v3}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v3

    iget-object v4, v7, Lmla;->M:Lmpu;

    invoke-interface {v4}, Lmpu;->g()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-virtual {v3}, Lj$/util/Optional;->isPresent()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-virtual {v3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v6, 0x0

    cmpl-float v4, v4, v6

    if-lez v4, :cond_45

    invoke-virtual {v3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_45

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    iget v3, v2, Lulc;->a:I

    const/4 v9, 0x2

    div-int/2addr v3, v9

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    iget v3, v2, Lulc;->b:I

    div-int/2addr v3, v9

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    goto :goto_28

    :cond_45
    const/4 v9, 0x2

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    iget v3, v2, Lulc;->a:I

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    iget v3, v2, Lulc;->b:I

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    goto :goto_28

    :cond_46
    move-object/from16 v36, v11

    const/4 v9, 0x2

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->l()Z

    move-result v0

    if-eqz v0, :cond_47

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    iget v3, v2, Lulc;->a:I

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    iget v3, v2, Lulc;->b:I

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    :cond_47
    :goto_28
    const-string v0, "updateAe"

    invoke-interface {v1, v0}, Lulx;->h(Ljava/lang/String;)V

    move-object v0, v5

    move-object v5, v2

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v2

    iget-object v3, v7, Lmla;->m:Lmix;

    iget v4, v3, Lmix;->i:F

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->c()Lznw;

    move-result-object v3

    sget-object v6, Lznw;->e:Lznw;

    invoke-virtual {v3, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    move-object v11, v0

    move-object v10, v1

    move-object v3, v13

    move-object v1, v14

    move-object/from16 v0, v33

    const/4 v13, 0x0

    invoke-virtual/range {v0 .. v6}, Lzsn;->F(Luuv;Lcom/google/googlex/gcam/AeShotParams;Luzj;FLulc;Z)V

    if-eqz p10, :cond_4a

    if-eq v12, v15, :cond_49

    sget-object v0, Lmlt;->a:Lmlt;

    if-eq v12, v0, :cond_48

    sget-object v0, Lmlt;->e:Lmlt;

    if-ne v12, v0, :cond_4a

    :cond_48
    iget-object v0, v7, Lmla;->M:Lmpu;

    invoke-interface {v0}, Lmpu;->c()Z

    move-result v0

    if-eqz v0, :cond_4a

    :cond_49
    invoke-virtual/range {p14 .. p14}, Lmqa;->a()Lmpz;

    move-result-object v0

    sget-object v1, Lmpz;->c:Lmpz;

    if-eq v0, v1, :cond_4a

    const-string v0, "disableCrop"

    invoke-interface {v10, v0}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    new-instance v1, Lcom/google/googlex/gcam/NormalizedRect;

    invoke-direct {v1}, Lcom/google/googlex/gcam/NormalizedRect;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/googlex/gcam/AeShotParams;->h(Lcom/google/googlex/gcam/NormalizedRect;)V

    :cond_4a
    move-object/from16 v2, v36

    iget-object v0, v2, Lost;->i:Lxwg;

    invoke-virtual {v0}, Lxwg;->f()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    if-eqz v0, :cond_4b

    const-string v1, "overrideMergedCrop"

    invoke-interface {v10, v1}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v1

    invoke-static {v1, v0}, Lmla;->N(Lcom/google/googlex/gcam/AeShotParams;Landroid/graphics/RectF;)V

    :cond_4b
    invoke-virtual {v12, v15}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    const-string v0, "ShrinkCropIfNecessary"

    invoke-interface {v10, v0}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/googlex/gcam/AeShotParams;->c()Lcom/google/googlex/gcam/NormalizedRect;

    move-result-object v1

    iget-wide v2, v1, Lcom/google/googlex/gcam/NormalizedRect;->a:J

    invoke-static {v2, v3, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->NormalizedRect_IsEmpty(JLcom/google/googlex/gcam/NormalizedRect;)Z

    move-result v1

    if-nez v1, :cond_4c

    invoke-virtual {v0}, Lcom/google/googlex/gcam/AeShotParams;->c()Lcom/google/googlex/gcam/NormalizedRect;

    move-result-object v19

    invoke-virtual {v0}, Lcom/google/googlex/gcam/AeShotParams;->b()Lcom/google/googlex/gcam/NormalizedRect;

    move-result-object v22

    new-instance v3, Lcom/google/googlex/gcam/NormalizedRect;

    invoke-static/range {v19 .. v19}, Lcom/google/googlex/gcam/NormalizedRect;->a(Lcom/google/googlex/gcam/NormalizedRect;)J

    move-result-wide v17

    invoke-static/range {v22 .. v22}, Lcom/google/googlex/gcam/NormalizedRect;->a(Lcom/google/googlex/gcam/NormalizedRect;)J

    move-result-wide v20

    invoke-static/range {v17 .. v22}, Lcom/google/googlex/gcam/GcamModuleJNI;->Intersect(JLcom/google/googlex/gcam/NormalizedRect;JLcom/google/googlex/gcam/NormalizedRect;)J

    move-result-wide v1

    const/4 v14, 0x1

    invoke-direct {v3, v1, v2, v14}, Lcom/google/googlex/gcam/NormalizedRect;-><init>(JZ)V

    invoke-virtual {v0}, Lcom/google/googlex/gcam/AeShotParams;->b()Lcom/google/googlex/gcam/NormalizedRect;

    move-result-object v6

    iget-wide v1, v3, Lcom/google/googlex/gcam/NormalizedRect;->a:J

    invoke-static {v6}, Lcom/google/googlex/gcam/NormalizedRect;->a(Lcom/google/googlex/gcam/NormalizedRect;)J

    move-result-wide v4

    invoke-static/range {v1 .. v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->NormalizedRect_Equals(JLcom/google/googlex/gcam/NormalizedRect;JLcom/google/googlex/gcam/NormalizedRect;)Z

    move-result v1

    if-nez v1, :cond_4d

    sget-object v1, Lmla;->g:Lykq;

    invoke-virtual {v1}, Lykh;->c()Lyld;

    move-result-object v1

    const/16 v2, 0xc49

    invoke-interface {v1, v2}, Lyko;->O(I)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    invoke-virtual {v0}, Lcom/google/googlex/gcam/AeShotParams;->b()Lcom/google/googlex/gcam/NormalizedRect;

    move-result-object v2

    iget-wide v4, v2, Lcom/google/googlex/gcam/NormalizedRect;->a:J

    invoke-static {v4, v5, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->NormalizedRect_ToCompactString(JLcom/google/googlex/gcam/NormalizedRect;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "Merged crop does not contain crop %s"

    invoke-interface {v1, v4, v2}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/AeShotParams;->h(Lcom/google/googlex/gcam/NormalizedRect;)V

    goto :goto_29

    :cond_4c
    const/4 v14, 0x1

    :cond_4d
    :goto_29
    invoke-interface {v10}, Lulx;->g()V

    const-string v0, "createShot"

    invoke-interface {v10, v0}, Lulx;->h(Ljava/lang/String;)V

    iget-object v2, v7, Lmla;->l:Lzsj;

    iget-object v4, v7, Lmla;->q:Landroid/util/DisplayMetrics;

    iget-object v0, v7, Lmla;->ah:Lovu;

    new-instance v1, Lmnk;

    iget-object v0, v0, Lovu;->a:Ljava/lang/Object;

    check-cast v0, Lcom/google/googlex/gcam/InitParams;

    iget-wide v5, v0, Lcom/google/googlex/gcam/InitParams;->a:J

    invoke-static {v5, v6, v0}, Lcom/google/googlex/gcam/GcamModuleJNI;->InitParams_execute_postview_on_get(JLcom/google/googlex/gcam/InitParams;)I

    move-result v3

    invoke-static {v3}, Lzne;->a(I)Lzne;

    move-result-object v3

    invoke-static {v3}, Lmla;->T(Lzne;)I

    move-result v6

    invoke-virtual {v0}, Lcom/google/googlex/gcam/InitParams;->a()Lzne;

    move-result-object v0

    invoke-static {v0}, Lmla;->T(Lzne;)I

    move-result v0

    move-object/from16 v18, v8

    iget-object v8, v7, Lmla;->ae:Ljoq;

    move v3, v9

    iget-object v9, v7, Lmla;->y:Lklg;

    move-object v5, v10

    iget-object v10, v7, Lmla;->aj:Lrdw;

    iget-object v3, v7, Lmla;->L:Lriq;

    iget-object v13, v7, Lmla;->U:Lvbw;

    invoke-interface {v3}, Lriq;->d()Lrip;

    move-result-object v17

    sget-object v3, Lkjm;->u:Lkiz;

    invoke-virtual {v11, v3}, Lklm;->q(Lkiz;)Z

    move-result v19

    xor-int/lit8 v21, p10, 0x1

    move-object/from16 v14, p6

    move v7, v0

    move-object v0, v5

    move-object/from16 v37, v15

    move/from16 v22, v16

    move-object/from16 v11, v18

    move-object/from16 v3, v26

    move-object/from16 v20, v35

    move-object/from16 v16, p1

    move-object/from16 v5, p3

    move-object/from16 v15, p14

    move-object/from16 v18, v13

    move/from16 v13, v27

    invoke-direct/range {v1 .. v21}, Lmnk;-><init>(Lzsj;Lmnm;Landroid/util/DisplayMetrics;Ltse;IILjoq;Lklg;Lrdw;Lcom/google/googlex/gcam/ShotParams;Lmlt;ZLuzj;Lmqa;Luuv;Lrip;Lvbw;ZLzoi;Z)V

    move-object v2, v1

    move-object v15, v3

    move-object v1, v5

    move-object v3, v10

    move-object/from16 v10, v20

    move/from16 v4, v21

    const-string v5, "createShotCallbacks"

    invoke-interface {v0, v5}, Lulx;->h(Ljava/lang/String;)V

    new-instance v5, Lcom/google/googlex/gcam/ShotCallbacks;

    invoke-direct {v5}, Lcom/google/googlex/gcam/ShotCallbacks;-><init>()V

    iget-object v6, v2, Lmnk;->n:Lmnm;

    invoke-virtual {v6}, Lmnm;->i()Lxwg;

    move-result-object v7

    invoke-virtual {v7}, Lxwg;->h()Z

    move-result v7

    if-eqz v7, :cond_4e

    iget-object v7, v2, Lmnk;->h:Lzsj;

    iget-wide v8, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v13, Lmnd;

    invoke-direct {v13, v2}, Lmnd;-><init>(Lmnk;)V

    check-cast v7, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v7, v8, v9, v13}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetProgressCallback(JLcom/google/googlex/gcam/base/function/IntFloatConsumer;)V

    :cond_4e
    iget-object v7, v2, Lmnk;->F:Lxst;

    iget-object v8, v2, Lmnk;->E:Lmnj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lzsv;

    invoke-direct {v9, v8}, Lzsv;-><init>(Lmnj;)V

    move/from16 p1, v4

    new-instance v4, Lzsw;

    invoke-direct {v4, v8}, Lzsw;-><init>(Lmnj;)V

    move-object/from16 v20, v4

    new-instance v4, Lzsx;

    invoke-direct {v4, v8}, Lzsx;-><init>(Lmnj;)V

    iget-object v8, v7, Lxst;->a:Ljava/lang/Object;

    move-object/from16 v16, v8

    check-cast v16, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    move-object/from16 v21, v4

    move-object/from16 v19, v9

    move-wide/from16 v17, v13

    invoke-virtual/range {v16 .. v21}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetShotStatusCallbacks(JLcom/google/googlex/gcam/base/function/IntByteArrayConsumer;Lcom/google/googlex/gcam/base/function/IntStringConsumer;Lcom/google/googlex/gcam/base/function/IntConsumer;)V

    move-object/from16 v8, v16

    iget-object v4, v6, Lmnm;->a:Lxwg;

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_4f

    iget-object v4, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lmng;

    invoke-direct {v9, v2}, Lmng;-><init>(Lmnk;)V

    check-cast v4, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v4, v13, v14, v9}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetFrameRescorerCallback(JLcom/google/googlex/gcam/hdrplus/FrameRescorerCallback;)V

    :cond_4f
    invoke-virtual {v6}, Lmnm;->a()Lxwg;

    move-result-object v4

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_50

    new-instance v4, Lacrn;

    const/4 v9, 0x0

    invoke-direct {v4, v2, v9}, Lacrn;-><init>(Ljava/lang/Object;[B)V

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lzss;

    invoke-direct {v9, v4}, Lzss;-><init>(Lacrn;)V

    invoke-virtual {v8, v13, v14, v9}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetBaseFrameAeCallback(JLcom/google/googlex/gcam/hdrplus/BaseFrameAeCallback;)V

    :cond_50
    invoke-virtual {v6}, Lmnm;->b()Lxwg;

    move-result-object v4

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_51

    iget-object v4, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lmnh;

    invoke-direct {v9, v2}, Lmnh;-><init>(Lmnk;)V

    check-cast v4, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v4, v13, v14, v9}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetBaseFrameCallback(JLcom/google/googlex/gcam/hdrplus/BaseFrameCallback;)V

    :cond_51
    iget-object v4, v2, Lmnk;->i:Lcom/google/googlex/gcam/clientallocator/InterleavedU8ClientAllocator;

    if-nez v4, :cond_52

    iget-object v9, v2, Lmnk;->j:Lzpe;

    if-eqz v9, :cond_55

    :cond_52
    if-eqz v4, :cond_53

    iget-object v9, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetPostviewRgbAllocator(JLcom/google/googlex/gcam/clientallocator/InterleavedU8ClientAllocator;)V

    goto :goto_2a

    :cond_53
    iget-object v4, v2, Lmnk;->j:Lzpe;

    if-eqz v4, :cond_54

    iget-object v9, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetPostviewYuvAllocator(JLcom/google/googlex/gcam/clientallocator/YuvClientAllocator;)V

    :cond_54
    :goto_2a
    new-instance v4, Lmni;

    const/4 v9, 0x1

    invoke-direct {v4, v2, v9}, Lmni;-><init>(Lmnk;I)V

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lzsy;

    invoke-direct {v9, v4}, Lzsy;-><init>(Lzta;)V

    invoke-virtual {v8, v13, v14, v9}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetPostviewCallback(JLcom/google/googlex/gcam/hdrplus/ManagedImageCallback;)V

    :cond_55
    iget-object v4, v2, Lmnk;->k:Lcom/google/googlex/gcam/clientallocator/InterleavedU8ClientAllocator;

    if-nez v4, :cond_56

    iget-object v9, v2, Lmnk;->l:Lzpe;

    if-eqz v9, :cond_59

    :cond_56
    if-eqz v4, :cond_57

    iget-object v9, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetFinalImageRgbAllocator(JLcom/google/googlex/gcam/clientallocator/InterleavedU8ClientAllocator;)V

    :cond_57
    iget-object v4, v2, Lmnk;->l:Lzpe;

    if-eqz v4, :cond_58

    iget-object v9, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetFinalImageYuvAllocator(JLcom/google/googlex/gcam/clientallocator/YuvClientAllocator;)V

    :cond_58
    new-instance v4, Lmni;

    const/4 v9, 0x0

    invoke-direct {v4, v2, v9}, Lmni;-><init>(Lmnk;I)V

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lzsy;

    invoke-direct {v9, v4}, Lzsy;-><init>(Lzta;)V

    invoke-virtual {v8, v13, v14, v9}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetFinalImageCallback(JLcom/google/googlex/gcam/hdrplus/ManagedImageCallback;)V

    :cond_59
    invoke-virtual {v6}, Lmnm;->c()Lxwg;

    move-result-object v4

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_5a

    iget-object v4, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lzsk;

    move-object/from16 v16, v4

    const/4 v4, 0x1

    invoke-direct {v9, v2, v4}, Lzsk;-><init>(Ljava/lang/Object;I)V

    new-instance v4, Lzsk;

    move-object/from16 v26, v15

    const/4 v15, 0x0

    invoke-direct {v4, v9, v15}, Lzsk;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v9, v16

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedDngCallback(JLcom/google/googlex/gcam/hdrplus/EncodedBlobCallback;)V

    goto :goto_2b

    :cond_5a
    move-object/from16 v26, v15

    :goto_2b
    invoke-virtual {v6}, Lmnm;->j()Lxwg;

    move-result-object v4

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_5b

    new-instance v4, Lzpd;

    invoke-direct {v4}, Lzpd;-><init>()V

    iget-object v9, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedRawImageAllocator(JLcom/google/googlex/gcam/clientallocator/RawClientAllocator;)V

    new-instance v9, Ltmv;

    const/4 v13, 0x0

    invoke-direct {v9, v2, v4, v13}, Ltmv;-><init>(Ljava/lang/Object;Ljava/lang/Object;[C)V

    iget-wide v14, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v4, Lzsr;

    invoke-direct {v4, v9}, Lzsr;-><init>(Ltmv;)V

    invoke-virtual {v8, v14, v15, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedRawImageCallback(JLcom/google/googlex/gcam/hdrplus/MergedRawCallback;)V

    goto :goto_2c

    :cond_5b
    const/4 v13, 0x0

    :goto_2c
    invoke-virtual {v6}, Lmnm;->e()Lxwg;

    move-result-object v4

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_5c

    new-instance v4, Lacrn;

    invoke-direct {v4, v2, v13}, Lacrn;-><init>(Ljava/lang/Object;[B)V

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v9, Lzsz;

    invoke-direct {v9, v4}, Lzsz;-><init>(Lacrn;)V

    invoke-virtual {v8, v13, v14, v9}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetPlanarMergedRawCallback(JLcom/google/googlex/gcam/hdrplus/PlanarMergedRawCallback;)V

    :cond_5c
    iget-object v4, v6, Lmnm;->b:Lxwg;

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_5d

    new-instance v4, Lzox;

    invoke-direct {v4}, Lzox;-><init>()V

    iget-object v9, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v9, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v9, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedLumaDenoisedAllocator(JLcom/google/googlex/gcam/clientallocator/GrayS16ClientAllocator;)V

    new-instance v9, Ltmv;

    const/4 v13, 0x0

    invoke-direct {v9, v2, v4, v13}, Ltmv;-><init>(Ljava/lang/Object;Ljava/lang/Object;[B)V

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v4, Lzst;

    invoke-direct {v4, v9}, Lzst;-><init>(Ltmv;)V

    invoke-virtual {v8, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedLumaDenoisedCallback(JLcom/google/googlex/gcam/hdrplus/MergedLumaDenoisedCallback;)V

    :cond_5d
    iget-object v4, v6, Lmnm;->c:Lxwg;

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_5f

    iget-boolean v4, v2, Lmnk;->A:Z

    if-eqz v4, :cond_5e

    new-instance v4, Lzoz;

    invoke-direct {v4}, Lzoz;-><init>()V

    iget-object v8, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v8, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v8, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedChromaDenoisedAllocatorF16(JLcom/google/googlex/gcam/clientallocator/InterleavedF16ClientAllocator;)V

    new-instance v8, Lmne;

    const/4 v14, 0x1

    invoke-direct {v8, v2, v4, v14}, Lmne;-><init>(Lmnk;Ljava/lang/Object;I)V

    invoke-virtual {v7, v5, v8}, Lxst;->c(Lcom/google/googlex/gcam/ShotCallbacks;Lztb;)V

    goto :goto_2d

    :cond_5e
    new-instance v4, Lzpa;

    invoke-direct {v4}, Lzpa;-><init>()V

    iget-object v8, v2, Lmnk;->h:Lzsj;

    iget-wide v13, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    check-cast v8, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v8, v13, v14, v4}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedChromaDenoisedAllocator(JLcom/google/googlex/gcam/clientallocator/InterleavedS16ClientAllocator;)V

    new-instance v8, Lmne;

    const/4 v9, 0x0

    invoke-direct {v8, v2, v4, v9}, Lmne;-><init>(Lmnk;Ljava/lang/Object;I)V

    invoke-virtual {v7, v5, v8}, Lxst;->c(Lcom/google/googlex/gcam/ShotCallbacks;Lztb;)V

    goto :goto_2e

    :cond_5f
    :goto_2d
    const/4 v9, 0x0

    :goto_2e
    invoke-virtual {v6}, Lmnm;->d()Lxwg;

    move-result-object v4

    invoke-virtual {v4}, Lxwg;->h()Z

    move-result v4

    if-eqz v4, :cond_60

    iget-object v4, v2, Lmnk;->h:Lzsj;

    iget-wide v6, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    iget-object v8, v2, Lmnk;->m:Lzpb;

    check-cast v4, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v4, v6, v7, v8}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedPdAllocator(JLcom/google/googlex/gcam/clientallocator/InterleavedU16ClientAllocator;)V

    iget-wide v6, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    new-instance v8, Lmnf;

    invoke-direct {v8, v2}, Lmnf;-><init>(Lmnk;)V

    invoke-virtual {v4, v6, v7, v8}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeSetMergedPdCallback(JLcom/google/googlex/gcam/base/function/IntLongConsumer;)V

    :cond_60
    move-object/from16 v7, p0

    iget-object v4, v7, Lmla;->A:Lmis;

    invoke-virtual {v4, v12}, Lmis;->e(Lmlt;)Z

    move-result v6

    if-eqz v6, :cond_6d

    const-string v6, "slowRawSetup"

    invoke-interface {v0, v6}, Lulx;->h(Ljava/lang/String;)V

    iget-object v0, v7, Lmla;->u:Ladbv;

    check-cast v0, Lnjx;

    invoke-virtual {v0}, Lnjx;->b()Lxwg;

    move-result-object v0

    invoke-virtual {v0}, Lxwg;->h()Z

    move-result v6

    if-eqz v6, :cond_6d

    move-object/from16 v6, v34

    if-eqz v6, :cond_61

    invoke-interface {v6}, Lqrg;->j()J

    move-result-wide v13

    goto :goto_2f

    :cond_61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    :goto_2f
    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getFreeSpace()J

    move-result-wide v15

    const-wide v17, 0x140000000L

    cmp-long v8, v15, v17

    if-gtz v8, :cond_62

    const-string v8, "Storage space is running low, when out of space the app may crash."

    invoke-virtual {v3, v8}, Lrdw;->V(Ljava/lang/String;)V

    :cond_62
    if-eqz p10, :cond_69

    move-object/from16 v3, v37

    :try_start_0
    invoke-virtual {v12, v3}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_63

    sget-object v8, Lmlt;->a:Lmlt;

    invoke-virtual {v12, v8}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_63

    sget-object v8, Lmlt;->e:Lmlt;

    invoke-virtual {v12, v8}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_69

    :cond_63
    invoke-static/range {p14 .. p14}, Lmla;->Q(Lmqa;)Z

    move-result v8

    invoke-virtual {v12, v3}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_65

    sget-object v3, Lzoi;->i:Lzoi;

    if-ne v10, v3, :cond_64

    goto :goto_31

    :cond_64
    :goto_30
    const/4 v10, 0x1

    goto :goto_32

    :cond_65
    :goto_31
    invoke-virtual/range {p14 .. p14}, Lmqa;->a()Lmpz;

    move-result-object v3

    sget-object v10, Lmpz;->b:Lmpz;

    if-ne v3, v10, :cond_66

    goto :goto_30

    :cond_66
    move v10, v9

    :goto_32
    if-eqz v8, :cond_67

    const-string v3, "multires"

    goto :goto_33

    :cond_67
    if-eqz v10, :cond_68

    iget-object v3, v7, Lmla;->i:Ljava/lang/String;

    goto :goto_33

    :cond_68
    iget-object v3, v7, Lmla;->h:Ljava/lang/String;

    :goto_33
    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    const-string v8, "camera_"

    invoke-static {v3, v8}, La;->bQ(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v0, v13, v14, v3}, Lmis;->b(Ljava/io/File;JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_34

    :catch_0
    move-exception v0

    goto :goto_35

    :cond_69
    if-eqz p10, :cond_6a

    sget-object v3, Lmlt;->c:Lmlt;

    invoke-virtual {v12, v3}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6a

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    const-string v3, "camera_kepler_"

    move/from16 v8, p11

    invoke-static {v8, v3}, La;->bA(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v0, v13, v14, v3}, Lmis;->b(Ljava/io/File;JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_34

    :cond_6a
    const-string v3, ""

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v4, v0, v13, v14, v3}, Lmis;->b(Ljava/io/File;JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_34
    iput-object v0, v2, Lmnk;->C:Ljava/lang/String;

    new-instance v3, Lcom/google/googlex/gcam/ImageSaverParams;

    invoke-direct {v3}, Lcom/google/googlex/gcam/ImageSaverParams;-><init>()V

    invoke-virtual {v3, v0}, Lcom/google/googlex/gcam/ImageSaverParams;->b(Ljava/lang/String;)V

    new-instance v4, Lcom/google/googlex/gcam/DebugParams;

    invoke-direct {v4}, Lcom/google/googlex/gcam/DebugParams;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-wide v12, Lmis;->f:J

    invoke-virtual {v4, v12, v13}, Lcom/google/googlex/gcam/DebugParams;->d(J)V

    invoke-virtual {v4, v3}, Lcom/google/googlex/gcam/DebugParams;->c(Lcom/google/googlex/gcam/ImageSaverParams;)V

    if-nez p10, :cond_6c

    if-eqz v6, :cond_6c

    new-instance v3, Lgxt;

    invoke-direct {v3, v0}, Lgxt;-><init>(Ljava/lang/Object;)V

    invoke-interface {v6, v3}, Lqrg;->at(Lgxt;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_38

    :catch_1
    move-exception v0

    goto :goto_36

    :goto_35
    const/4 v4, 0x0

    :goto_36
    sget-object v3, Lmla;->g:Lykq;

    invoke-virtual {v3}, Lykh;->b()Lyld;

    move-result-object v3

    const-string v6, "%s"

    const-string v8, "Failed to create Gcam debug data folder!"

    const/16 v10, 0xc4d

    invoke-static {v6, v8, v10, v3, v0}, La;->bT(Ljava/lang/String;Ljava/lang/Object;CLyko;Ljava/lang/Throwable;)V

    iget-object v3, v7, Lmla;->aj:Lrdw;

    invoke-virtual {v0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6b

    goto :goto_37

    :cond_6b
    move-object v8, v0

    :goto_37
    invoke-virtual {v3, v8}, Lrdw;->V(Ljava/lang/String;)V

    :cond_6c
    :goto_38
    move-object/from16 v24, v4

    goto :goto_39

    :cond_6d
    const/16 v24, 0x0

    :goto_39
    iget-object v0, v7, Lmla;->e:Lulx;

    const-string v3, "getPrimaryOutputFormat"

    invoke-interface {v0, v3}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual/range {v26 .. v26}, Lmnm;->k()Lxwg;

    move-result-object v3

    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v3

    if-eqz v3, :cond_6e

    sget-object v3, Lmis;->b:Lzoa;

    goto :goto_3a

    :cond_6e
    invoke-virtual/range {v26 .. v26}, Lmnm;->l()Lxwg;

    move-result-object v3

    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v3

    if-eqz v3, :cond_6f

    sget-object v3, Lmis;->c:Lzoa;

    goto :goto_3a

    :cond_6f
    invoke-virtual/range {v26 .. v26}, Lmnm;->n()Lxwg;

    move-result-object v3

    invoke-virtual {v3}, Lxwg;->h()Z

    move-result v3

    if-eqz v3, :cond_70

    sget-object v3, Lmis;->d:Lzoa;

    goto :goto_3a

    :cond_70
    sget-object v3, Lzoa;->a:Lzoa;

    :goto_3a
    const-string v4, "Gcam::StartShotCapture"

    invoke-interface {v0, v4}, Lulx;->h(Ljava/lang/String;)V

    iget-wide v12, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    iget v3, v3, Lzoa;->k:I

    invoke-static {v12, v13, v5, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotCallbacks_final_image_pixel_format_set(JLcom/google/googlex/gcam/ShotCallbacks;I)V

    iget-wide v3, v5, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    move-object/from16 v6, p4

    iget-wide v12, v6, Lcom/google/googlex/gcam/PostviewParams;->a:J

    move-wide/from16 p5, v3

    move-object/from16 p7, v5

    move-object/from16 p10, v6

    move-wide/from16 p8, v12

    invoke-static/range {p5 .. p10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotCallbacks_postview_params_set(JLcom/google/googlex/gcam/ShotCallbacks;JLcom/google/googlex/gcam/PostviewParams;)V

    move-object/from16 v3, p7

    iget-object v14, v7, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v12, v14, Lcom/google/googlex/gcam/Gcam;->a:J

    iget-wide v4, v11, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-wide v9, v3, Lcom/google/googlex/gcam/ShotCallbacks;->a:J

    move/from16 v15, v22

    invoke-static/range {v24 .. v24}, Lcom/google/googlex/gcam/DebugParams;->a(Lcom/google/googlex/gcam/DebugParams;)J

    move-result-wide v22

    move-object/from16 v21, v3

    move-wide/from16 v16, v4

    move-wide/from16 v19, v9

    move-object/from16 v18, v11

    invoke-static/range {v12 .. v24}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_StartShotCapture(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/ShotParams;JLcom/google/googlex/gcam/ShotCallbacks;JLcom/google/googlex/gcam/DebugParams;)I

    move-result v3

    invoke-interface {v0}, Lulx;->g()V

    invoke-static {}, Lcom/google/googlex/gcam/GcamModuleJNI;->kInvalidShotId_get()I

    move-result v0

    if-ne v3, v0, :cond_72

    iget-object v0, v7, Lmla;->y:Lklg;

    const-string v1, "Gcam::StartShotCapture() returned an invalid shot id."

    sget-object v2, Lklg;->d:Lklg;

    if-ne v0, v2, :cond_71

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v2, 0xc4c

    invoke-interface {v0, v2}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v2, "%s"

    invoke-interface {v0, v2, v1}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v13, 0x0

    return-object v13

    :cond_71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_72
    iget-object v0, v1, Ltse;->a:Ljava/lang/Object;

    iget-object v4, v7, Lmla;->z:Lmiy;

    new-instance v5, Lxae;

    invoke-direct {v5, v3}, Lxae;-><init>(I)V

    iget-object v6, v4, Lmiy;->a:Ljava/lang/Object;

    monitor-enter v6

    :try_start_2
    iget-object v7, v4, Lmiy;->b:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    check-cast v0, Lost;

    iget-object v0, v0, Lost;->e:Luep;

    new-instance v6, Lmcw;

    const/4 v9, 0x2

    const/4 v13, 0x0

    invoke-direct {v6, v4, v5, v9, v13}, Lmcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;I[B)V

    invoke-virtual {v0, v6}, Luep;->e(Lula;)V

    iget-object v0, v1, Ltse;->c:Ljava/lang/Object;

    if-eqz v0, :cond_73

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static/range {p1 .. p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    filled-new-array {v1, v4}, [Ljava/lang/Object;

    move-result-object v1

    const-string v4, "Created GCAM shot-%s for captureSession, isPrimary=%s"

    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lqrg;->N(Ljava/lang/String;)V

    invoke-virtual/range {p14 .. p14}, Lmqa;->a()Lmpz;

    move-result-object v1

    sget-object v4, Lmpz;->h:Lmpz;

    if-ne v1, v4, :cond_73

    invoke-static {v0}, Lnbw;->g(Lqrg;)V

    :cond_73
    invoke-static {}, Lcom/google/googlex/gcam/GcamModuleJNI;->kInvalidShotId_get()I

    move-result v0

    if-eq v3, v0, :cond_74

    const/4 v10, 0x1

    goto :goto_3b

    :cond_74
    const/4 v10, 0x0

    :goto_3b
    invoke-static {v10}, Lyny;->aZ(Z)V

    iget v0, v2, Lmnk;->d:I

    invoke-static {}, Lcom/google/googlex/gcam/GcamModuleJNI;->kInvalidShotId_get()I

    move-result v1

    if-ne v0, v1, :cond_75

    const/4 v10, 0x1

    goto :goto_3c

    :cond_75
    const/4 v10, 0x0

    :goto_3c
    invoke-static {v10}, Lyny;->bl(Z)V

    iget-object v0, v2, Lmnk;->G:Ltse;

    iget-object v0, v0, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v0}, Lqrg;->t()Lrej;

    move-result-object v0

    check-cast v0, Lrek;

    iget-object v1, v0, Lrek;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    const/4 v14, 0x1

    if-le v1, v14, :cond_76

    iget-object v0, v0, Lrek;->j:Ljava/util/List;

    new-instance v1, Lzfr;

    invoke-direct {v1}, Lzfr;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_76
    iput v3, v2, Lmnk;->d:I

    iget-object v0, v2, Lmnk;->n:Lmnm;

    invoke-virtual {v0}, Lmnm;->m()Lxwg;

    move-result-object v1

    invoke-virtual {v1}, Lxwg;->h()Z

    move-result v1

    if-eqz v1, :cond_77

    invoke-virtual {v0}, Lmnm;->m()Lxwg;

    move-result-object v0

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmlr;

    invoke-interface {v0, v2}, Lmlr;->u(Lmnk;)V

    :cond_77
    return-object v2

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method


# virtual methods
.method public final A(Lmnk;Lcom/google/googlex/gcam/BurstSpec;)Z
    .locals 13

    invoke-virtual {p1}, Lmnk;->a()I

    move-result v3

    const-string v0, "EndPayloadFrames-"

    invoke-static {v3, v0}, La;->bA(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmla;->e:Lulx;

    invoke-interface {v1, v0}, Lulx;->f(Ljava/lang/String;)V

    iget-object v0, p1, Lmnk;->G:Ltse;

    iget-object v0, v0, Ltse;->a:Ljava/lang/Object;

    check-cast v0, Lost;

    iget-boolean v0, v0, Lost;->g:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    const-string v0, "location"

    invoke-interface {v1, v0}, Lulx;->f(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lmla;->n:Ladbv;

    invoke-interface {v0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnoy;

    invoke-interface {v0}, Lnoy;->e()Lxwg;

    move-result-object v0

    invoke-virtual {v0}, Lxwg;->h()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Location;

    new-instance v1, Lcom/google/googlex/gcam/LocationData;

    invoke-direct {v1}, Lcom/google/googlex/gcam/LocationData;-><init>()V

    invoke-virtual {v0}, Landroid/location/Location;->getAltitude()D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/google/googlex/gcam/LocationData;->b(D)V

    invoke-virtual {v0}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v1, v4, v5}, Lcom/google/googlex/gcam/LocationData;->c(D)V

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/google/googlex/gcam/LocationData;->d(D)V

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/google/googlex/gcam/LocationData;->e(D)V

    invoke-virtual {v0}, Landroid/location/Location;->getTime()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-virtual {v1, v4, v5}, Lcom/google/googlex/gcam/LocationData;->g(J)V

    invoke-virtual {v0}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v1, v0}, Lcom/google/googlex/gcam/LocationData;->f(Ljava/lang/String;)V

    :cond_0
    new-instance v0, Lcom/google/googlex/gcam/ClientShotMetadata;

    invoke-direct {v0}, Lcom/google/googlex/gcam/ClientShotMetadata;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/googlex/gcam/ClientShotMetadata;->c(Lcom/google/googlex/gcam/LocationData;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    move-object v0, v2

    :goto_0
    iget-object v1, p0, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    move-object v9, v0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p1, v0

    iget-object p0, p0, Lmla;->e:Lulx;

    invoke-interface {p0}, Lulx;->g()V

    throw p1

    :cond_2
    move-object v9, v2

    :goto_1
    iget-object v0, p0, Lmla;->T:Lmtr;

    iget-object v1, p1, Lmnk;->G:Ltse;

    iget-object v1, v1, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v1}, Lqrg;->t()Lrej;

    move-result-object v4

    invoke-interface {v4}, Lrej;->d()Ljava/lang/Long;

    move-result-object v4

    invoke-static {v4}, Lxwg;->i(Ljava/lang/Object;)Lxwg;

    move-result-object v4

    const-wide/16 v5, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v4, v7}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    iget-boolean v4, p1, Lmnk;->r:Z

    iget-boolean p1, p1, Lmnk;->w:Z

    invoke-interface {v0, v7, v8, v4, p1}, Lmtr;->a(JZZ)Lmtq;

    move-result-object p1

    iget-boolean v0, p1, Lmtq;->a:Z

    if-nez v0, :cond_3

    iget-boolean v4, p1, Lmtq;->b:Z

    if-eqz v4, :cond_4

    :cond_3
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    iget-boolean v8, p1, Lmtq;->b:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v7, v8, v10}, [Ljava/lang/Object;

    move-result-object v7

    const-string v8, "Requested payload caching (processing=%s, recovery=%s) (GCAM shot-%d)"

    invoke-static {v4, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lqrg;->N(Ljava/lang/String;)V

    :cond_4
    new-instance v12, Lcom/google/googlex/gcam/CacheParams;

    invoke-direct {v12}, Lcom/google/googlex/gcam/CacheParams;-><init>()V

    iget-wide v7, v12, Lcom/google/googlex/gcam/CacheParams;->a:J

    invoke-static {v7, v8, v12, v0}, Lcom/google/googlex/gcam/GcamModuleJNI;->CacheParams_cache_for_processing_set(JLcom/google/googlex/gcam/CacheParams;Z)V

    iget-boolean p1, p1, Lmtq;->b:Z

    iget-wide v7, v12, Lcom/google/googlex/gcam/CacheParams;->a:J

    invoke-static {v7, v8, v12, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->CacheParams_cache_for_recovery_set(JLcom/google/googlex/gcam/CacheParams;Z)V

    invoke-interface {v1}, Lqrg;->g()J

    sget-object p1, Lzse;->a:Lzse;

    invoke-virtual {p1}, Laaxp;->D()Laaxk;

    move-result-object p1

    invoke-interface {v1}, Lqrg;->g()J

    move-result-wide v0

    iget-object v4, p1, Laaxk;->b:Laaxp;

    invoke-virtual {v4}, Laaxp;->T()Z

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {p1}, Laaxk;->o()V

    :cond_5
    iget-object v4, p1, Laaxk;->b:Laaxp;

    check-cast v4, Lzse;

    iget v7, v4, Lzse;->b:I

    or-int/lit8 v7, v7, 0x1

    iput v7, v4, Lzse;->b:I

    iput-wide v0, v4, Lzse;->c:J

    invoke-virtual {p1}, Laaxk;->i()Laaxp;

    move-result-object p1

    check-cast p1, Lzse;

    invoke-virtual {p1}, Laawb;->z()[B

    move-result-object p1

    iget-wide v0, v12, Lcom/google/googlex/gcam/CacheParams;->a:J

    invoke-static {v0, v1, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->CacheParams_serialized_capture_session_params_get(JLcom/google/googlex/gcam/CacheParams;)J

    move-result-wide v0

    cmp-long v4, v0, v5

    if-nez v4, :cond_6

    goto :goto_2

    :cond_6
    new-instance v2, Lcom/google/googlex/gcam/Uint8Vector;

    invoke-direct {v2, v0, v1}, Lcom/google/googlex/gcam/Uint8Vector;-><init>(J)V

    :goto_2
    invoke-static {p1, v2}, Lcom/google/googlex/gcam/BufferUtils;->e([BLcom/google/googlex/gcam/Uint8Vector;)V

    iget-object v2, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v0, v2, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {p2}, Lcom/google/googlex/gcam/BurstSpec;->b(Lcom/google/googlex/gcam/BurstSpec;)J

    move-result-wide v4

    invoke-static {v9}, Lcom/google/googlex/gcam/ClientShotMetadata;->a(Lcom/google/googlex/gcam/ClientShotMetadata;)J

    move-result-wide v7

    iget-wide v10, v12, Lcom/google/googlex/gcam/CacheParams;->a:J

    move-object v6, p2

    invoke-static/range {v0 .. v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_EndPayloadFrames(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/BurstSpec;JLcom/google/googlex/gcam/ClientShotMetadata;JLcom/google/googlex/gcam/CacheParams;)Z

    move-result p1

    if-nez p1, :cond_7

    sget-object p2, Lmla;->g:Lykq;

    invoke-virtual {p2}, Lykh;->b()Lyld;

    move-result-object p2

    const/16 v0, 0xc45

    invoke-interface {p2, v0}, Lyko;->O(I)Lyld;

    move-result-object p2

    check-cast p2, Lyko;

    const-string v0, "EndPayloadFrames() failed."

    invoke-interface {p2, v0}, Lyko;->s(Ljava/lang/String;)V

    :cond_7
    invoke-virtual {v12}, Lcom/google/googlex/gcam/CacheParams;->a()V

    invoke-direct {p0}, Lmla;->O()Z

    move-result p2

    if-eqz p2, :cond_8

    iget-object p2, p0, Lmla;->F:Ljava/util/concurrent/Executor;

    new-instance v0, Lmkw;

    invoke-direct {v0, p0, v3}, Lmkw;-><init>(Lmla;I)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_8
    iget-object p0, p0, Lmla;->e:Lulx;

    invoke-interface {p0}, Lulx;->g()V

    return p1
.end method

.method public final B(Lmnk;)Z
    .locals 14

    invoke-virtual {p1}, Lmnk;->a()I

    move-result v0

    const-string v1, "EndShotCapture-"

    invoke-static {v0, v1}, La;->bA(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lmla;->e:Lulx;

    invoke-interface {v2, v1}, Lulx;->f(Ljava/lang/String;)V

    iget-object v1, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v3, v1, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v3, v4, v1, v0}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_EndShotCapture(JLcom/google/googlex/gcam/Gcam;I)Z

    move-result v3

    if-eqz v3, :cond_18

    iget-object v4, p1, Lmnk;->G:Ltse;

    iget-object v4, v4, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v4}, Lqrg;->V()V

    iget-object p1, p1, Lmnk;->o:Lcom/google/googlex/gcam/ShotParams;

    iget-wide v4, p1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v4, v5, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_ghostshark_enabled_get(JLcom/google/googlex/gcam/ShotParams;)Z

    move-result p1

    if-eqz p1, :cond_18

    const-string p1, "loadAssets"

    invoke-interface {v2, p1}, Lulx;->h(Ljava/lang/String;)V

    iget-object p1, p0, Lmla;->ag:Lovu;

    iget-object v2, p0, Lmla;->l:Lzsj;

    invoke-static {v1}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v4

    iget-object p1, p1, Lovu;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    :try_start_0
    const-string v1, "night_sight_p26-encoder_hidden_state.npy.uncompressed"

    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    const-string v6, "night_sight_p26-ildm_config.binarypb.uncompressed"

    invoke-virtual {p1, v6}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    :try_start_2
    const-string v7, "night_sight_p26-base_kepler_config.binarypb.uncompressed"

    invoke-virtual {p1, v7}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    :try_start_3
    const-string v8, "night_sight_p26-denoiser.tflite.uncompressed"

    invoke-virtual {p1, v8}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    sget-object v8, Labaq;->a:Labaq;

    invoke-virtual {v8}, Laaxp;->D()Laaxk;

    move-result-object v8

    iget-object v9, v8, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v8}, Laaxk;->o()V

    :cond_0
    iget-object v9, v8, Laaxk;->b:Laaxp;

    check-cast v9, Labaq;

    iget v10, v9, Labaq;->b:I

    or-int/lit8 v10, v10, 0x1

    iput v10, v9, Labaq;->b:I

    iput v0, v9, Labaq;->c:I

    sget-object v0, Labar;->a:Labar;

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v9

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v10

    invoke-virtual {v10}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v10

    iget-object v11, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v11}, Laaxp;->T()Z

    move-result v11

    if-nez v11, :cond_1

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_1
    iget-object v11, v9, Laaxk;->b:Laaxp;

    check-cast v11, Labar;

    iget v12, v11, Labar;->b:I

    or-int/lit8 v12, v12, 0x1

    iput v12, v11, Labar;->b:I

    iput v10, v11, Labar;->c:I

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v10

    iget-object v12, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v12}, Laaxp;->T()Z

    move-result v12

    if-nez v12, :cond_2

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_2
    iget-object v12, v9, Laaxk;->b:Laaxp;

    check-cast v12, Labar;

    iget v13, v12, Labar;->b:I

    or-int/lit8 v13, v13, 0x2

    iput v13, v12, Labar;->b:I

    iput-wide v10, v12, Labar;->d:J

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v10

    iget-object v12, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v12}, Laaxp;->T()Z

    move-result v12

    if-nez v12, :cond_3

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_3
    iget-object v12, v9, Laaxk;->b:Laaxp;

    check-cast v12, Labar;

    iget v13, v12, Labar;->b:I

    or-int/lit8 v13, v13, 0x4

    iput v13, v12, Labar;->b:I

    iput-wide v10, v12, Labar;->e:J

    iget-object v10, v8, Laaxk;->b:Laaxp;

    invoke-virtual {v10}, Laaxp;->T()Z

    move-result v10

    if-nez v10, :cond_4

    invoke-virtual {v8}, Laaxk;->o()V

    :cond_4
    iget-object v10, v8, Laaxk;->b:Laaxp;

    check-cast v10, Labaq;

    invoke-virtual {v9}, Laaxk;->i()Laaxp;

    move-result-object v9

    check-cast v9, Labar;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v9, v10, Labaq;->d:Labar;

    iget v9, v10, Labaq;->b:I

    or-int/lit8 v9, v9, 0x2

    iput v9, v10, Labaq;->b:I

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v9

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v10

    invoke-virtual {v10}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v10

    iget-object v11, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v11}, Laaxp;->T()Z

    move-result v11

    if-nez v11, :cond_5

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_5
    iget-object v11, v9, Laaxk;->b:Laaxp;

    check-cast v11, Labar;

    iget v12, v11, Labar;->b:I

    or-int/lit8 v12, v12, 0x1

    iput v12, v11, Labar;->b:I

    iput v10, v11, Labar;->c:I

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v10

    iget-object v12, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v12}, Laaxp;->T()Z

    move-result v12

    if-nez v12, :cond_6

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_6
    iget-object v12, v9, Laaxk;->b:Laaxp;

    check-cast v12, Labar;

    iget v13, v12, Labar;->b:I

    or-int/lit8 v13, v13, 0x2

    iput v13, v12, Labar;->b:I

    iput-wide v10, v12, Labar;->d:J

    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v10

    iget-object v12, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v12}, Laaxp;->T()Z

    move-result v12

    if-nez v12, :cond_7

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_7
    iget-object v12, v9, Laaxk;->b:Laaxp;

    check-cast v12, Labar;

    iget v13, v12, Labar;->b:I

    or-int/lit8 v13, v13, 0x4

    iput v13, v12, Labar;->b:I

    iput-wide v10, v12, Labar;->e:J

    iget-object v10, v8, Laaxk;->b:Laaxp;

    invoke-virtual {v10}, Laaxp;->T()Z

    move-result v10

    if-nez v10, :cond_8

    invoke-virtual {v8}, Laaxk;->o()V

    :cond_8
    iget-object v10, v8, Laaxk;->b:Laaxp;

    check-cast v10, Labaq;

    invoke-virtual {v9}, Laaxk;->i()Laaxp;

    move-result-object v9

    check-cast v9, Labar;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v9, v10, Labaq;->e:Labar;

    iget v9, v10, Labaq;->b:I

    or-int/lit8 v9, v9, 0x4

    iput v9, v10, Labaq;->b:I

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v9

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v10

    invoke-virtual {v10}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v10

    iget-object v11, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v11}, Laaxp;->T()Z

    move-result v11

    if-nez v11, :cond_9

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_9
    iget-object v11, v9, Laaxk;->b:Laaxp;

    check-cast v11, Labar;

    iget v12, v11, Labar;->b:I

    or-int/lit8 v12, v12, 0x1

    iput v12, v11, Labar;->b:I

    iput v10, v11, Labar;->c:I

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v10

    iget-object v12, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v12}, Laaxp;->T()Z

    move-result v12

    if-nez v12, :cond_a

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_a
    iget-object v12, v9, Laaxk;->b:Laaxp;

    check-cast v12, Labar;

    iget v13, v12, Labar;->b:I

    or-int/lit8 v13, v13, 0x2

    iput v13, v12, Labar;->b:I

    iput-wide v10, v12, Labar;->d:J

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v10

    iget-object v12, v9, Laaxk;->b:Laaxp;

    invoke-virtual {v12}, Laaxp;->T()Z

    move-result v12

    if-nez v12, :cond_b

    invoke-virtual {v9}, Laaxk;->o()V

    :cond_b
    iget-object v12, v9, Laaxk;->b:Laaxp;

    check-cast v12, Labar;

    iget v13, v12, Labar;->b:I

    or-int/lit8 v13, v13, 0x4

    iput v13, v12, Labar;->b:I

    iput-wide v10, v12, Labar;->e:J

    iget-object v10, v8, Laaxk;->b:Laaxp;

    invoke-virtual {v10}, Laaxp;->T()Z

    move-result v10

    if-nez v10, :cond_c

    invoke-virtual {v8}, Laaxk;->o()V

    :cond_c
    iget-object v10, v8, Laaxk;->b:Laaxp;

    check-cast v10, Labaq;

    invoke-virtual {v9}, Laaxk;->i()Laaxp;

    move-result-object v9

    check-cast v9, Labar;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v9, v10, Labaq;->f:Labar;

    iget v9, v10, Labaq;->b:I

    or-int/lit8 v9, v9, 0x8

    iput v9, v10, Labaq;->b:I

    invoke-virtual {v0}, Laaxp;->D()Laaxk;

    move-result-object v0

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v9

    invoke-virtual {v9}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v9

    iget-object v10, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v10}, Laaxp;->T()Z

    move-result v10

    if-nez v10, :cond_d

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_d
    iget-object v10, v0, Laaxk;->b:Laaxp;

    check-cast v10, Labar;

    iget v11, v10, Labar;->b:I

    or-int/lit8 v11, v11, 0x1

    iput v11, v10, Labar;->b:I

    iput v9, v10, Labar;->c:I

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v9

    iget-object v11, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v11}, Laaxp;->T()Z

    move-result v11

    if-nez v11, :cond_e

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_e
    iget-object v11, v0, Laaxk;->b:Laaxp;

    check-cast v11, Labar;

    iget v12, v11, Labar;->b:I

    or-int/lit8 v12, v12, 0x2

    iput v12, v11, Labar;->b:I

    iput-wide v9, v11, Labar;->d:J

    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v9

    iget-object v11, v0, Laaxk;->b:Laaxp;

    invoke-virtual {v11}, Laaxp;->T()Z

    move-result v11

    if-nez v11, :cond_f

    invoke-virtual {v0}, Laaxk;->o()V

    :cond_f
    iget-object v11, v0, Laaxk;->b:Laaxp;

    check-cast v11, Labar;

    iget v12, v11, Labar;->b:I

    or-int/lit8 v12, v12, 0x4

    iput v12, v11, Labar;->b:I

    iput-wide v9, v11, Labar;->e:J

    iget-object v9, v8, Laaxk;->b:Laaxp;

    invoke-virtual {v9}, Laaxp;->T()Z

    move-result v9

    if-nez v9, :cond_10

    invoke-virtual {v8}, Laaxk;->o()V

    :cond_10
    iget-object v9, v8, Laaxk;->b:Laaxp;

    check-cast v9, Labaq;

    invoke-virtual {v0}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Labar;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v0, v9, Labaq;->g:Labar;

    iget v0, v9, Labaq;->b:I

    or-int/lit8 v0, v0, 0x10

    iput v0, v9, Labaq;->b:I

    invoke-virtual {v8}, Laaxk;->i()Laaxp;

    move-result-object v0

    check-cast v0, Labaq;

    invoke-virtual {v0}, Laawb;->z()[B

    move-result-object v0

    check-cast v2, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual {v2, v0, v4, v5}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeInitializeGhostsharkFromOpenFile([BJ)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz p1, :cond_11

    :try_start_5
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :cond_11
    if-eqz v7, :cond_12

    :try_start_6
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :cond_12
    if-eqz v6, :cond_13

    :try_start_7
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    :cond_13
    if-eqz v1, :cond_18

    :try_start_8
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    goto :goto_4

    :catchall_0
    move-exception v0

    if-eqz p1, :cond_14

    :try_start_9
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :try_start_a
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_14
    :goto_0
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v7, :cond_15

    :try_start_b
    invoke-virtual {v7}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_1

    :catchall_3
    move-exception v0

    :try_start_c
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_15
    :goto_1
    throw p1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :catchall_4
    move-exception p1

    if-eqz v6, :cond_16

    :try_start_d
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    goto :goto_2

    :catchall_5
    move-exception v0

    :try_start_e
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_16
    :goto_2
    throw p1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    :catchall_6
    move-exception p1

    if-eqz v1, :cond_17

    :try_start_f
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_7

    goto :goto_3

    :catchall_7
    move-exception v0

    :try_start_10
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_17
    :goto_3
    throw p1
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    :cond_18
    :goto_4
    iget-object p0, p0, Lmla;->e:Lulx;

    invoke-interface {p0}, Lulx;->g()V

    return v3
.end method

.method public final C(Luzj;Luuv;)Z
    .locals 8

    new-instance v1, Lulw;

    iget-object v0, p0, Lmla;->e:Lulx;

    const-string v2, "HdrPlusSession#lockFrameFromFutureBinning"

    invoke-direct {v1, v0, v2}, Lulw;-><init>(Lulx;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v0, p1, p2}, Lzsn;->r(Luzj;Luuv;)Lcom/google/googlex/gcam/FrameMetadataKey;

    move-result-object v7

    if-nez v7, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v2, v4, Lcom/google/googlex/gcam/Gcam;->a:J

    iget-wide v5, v7, Lcom/google/googlex/gcam/FrameMetadataKey;->a:J

    invoke-static/range {v2 .. v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_LockFrameFromFutureBinning(JLcom/google/googlex/gcam/Gcam;JLcom/google/googlex/gcam/FrameMetadataKey;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    invoke-virtual {v1}, Lulw;->close()V

    return p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    :try_start_1
    invoke-virtual {v1}, Lulw;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p0
.end method

.method public final D(Luuv;Luzj;Luzo;Luzo;Luuv;Luzj;Luzo;)Z
    .locals 33

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    iget-object v7, v0, Lmla;->e:Lulx;

    const-string v8, "LiveTemporalBinning"

    invoke-interface {v7, v8}, Lulx;->f(Ljava/lang/String;)V

    const-string v8, "metadata"

    invoke-interface {v7, v8}, Lulx;->f(Ljava/lang/String;)V

    sget-object v8, Lmis;->a:Lzoa;

    sget-object v8, Landroid/hardware/camera2/CaptureResult;->SENSOR_EXPOSURE_TIME:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v1, v8}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-interface {v1}, Luzj;->e()J

    move-result-wide v10

    const-wide/16 v12, 0x2

    rem-long/2addr v10, v12

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    const/4 v11, 0x1

    const/4 v14, 0x0

    if-eqz v10, :cond_1

    long-to-float v8, v8

    sget v9, Lmis;->e:F

    cmpl-float v8, v8, v9

    if-lez v8, :cond_0

    goto :goto_0

    :cond_0
    move v8, v14

    goto :goto_1

    :cond_1
    :goto_0
    move v8, v11

    :goto_1
    if-eqz v4, :cond_2

    if-eqz v5, :cond_2

    if-eqz v6, :cond_2

    move-object/from16 v9, p1

    goto :goto_2

    :cond_2
    move-object/from16 v9, p1

    move v11, v14

    :goto_2
    invoke-virtual {v0, v1, v9, v8}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v1

    if-eqz v11, :cond_3

    invoke-virtual {v0, v5, v4, v14}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v4

    goto :goto_3

    :cond_3
    new-instance v4, Lcom/google/googlex/gcam/FrameMetadata;

    invoke-direct {v4}, Lcom/google/googlex/gcam/FrameMetadata;-><init>()V

    :goto_3
    const/4 v5, 0x0

    if-eqz v11, :cond_5

    iget-wide v10, v1, Lcom/google/googlex/gcam/FrameMetadata;->a:J

    invoke-static {v10, v11, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->FrameMetadata_gyro_samples_get(JLcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v10

    cmp-long v8, v10, v12

    if-nez v8, :cond_4

    move-object v8, v5

    goto :goto_4

    :cond_4
    new-instance v8, Lcom/google/googlex/gcam/GyroSampleVector;

    invoke-direct {v8, v10, v11, v14}, Lcom/google/googlex/gcam/GyroSampleVector;-><init>(JZ)V

    :goto_4
    invoke-virtual {v4, v8}, Lcom/google/googlex/gcam/FrameMetadata;->G(Lcom/google/googlex/gcam/GyroSampleVector;)V

    :cond_5
    invoke-interface {v7}, Lulx;->g()V

    iget-object v8, v0, Lmla;->r:Lzsl;

    invoke-virtual {v8, v2}, Lzsl;->b(Luzo;)Lcom/google/googlex/gcam/RawWriteView;

    move-result-object v10

    if-nez v3, :cond_6

    new-instance v11, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v11}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    goto :goto_5

    :cond_6
    invoke-virtual {v8, v3}, Lzsl;->a(Luzo;)Lxwg;

    move-result-object v11

    new-instance v12, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v12}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    invoke-virtual {v11, v12}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/googlex/gcam/RawWriteView;

    :goto_5
    const/16 v12, 0x8

    if-eqz v3, :cond_7

    new-instance v13, Lmgw;

    invoke-direct {v13, v3, v12}, Lmgw;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v25, v13

    goto :goto_6

    :cond_7
    move-object/from16 v25, v5

    :goto_6
    if-eqz v6, :cond_8

    invoke-virtual {v8, v6}, Lzsl;->b(Luzo;)Lcom/google/googlex/gcam/RawWriteView;

    move-result-object v3

    goto :goto_7

    :cond_8
    new-instance v3, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v3}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    :goto_7
    if-eqz v6, :cond_9

    new-instance v5, Lmgw;

    invoke-direct {v5, v6, v12}, Lmgw;-><init>(Ljava/lang/Object;I)V

    :cond_9
    move-object/from16 v30, v5

    sget-object v5, Lkjq;->a:Lkiy;

    invoke-virtual/range {p0 .. p1}, Lmla;->a(Luuv;)I

    move-result v17

    iget-object v5, v0, Lmla;->l:Lzsj;

    iget-object v6, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-static {v6}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v15

    invoke-static {v1}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v18

    invoke-static {v10}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v20

    new-instance v6, Lmgw;

    invoke-direct {v6, v2, v12}, Lmgw;-><init>(Ljava/lang/Object;I)V

    invoke-static {v11}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v23

    invoke-static {v4}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v26

    invoke-static {v3}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v28

    iget-object v0, v0, Lmla;->m:Lmix;

    sget-object v2, Lkjq;->k:Lkiy;

    iget-object v0, v0, Lmix;->m:Lklm;

    invoke-virtual {v0, v2}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v8

    invoke-virtual {v8}, Lj$/util/Optional;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_a

    const/4 v0, -0x1

    goto :goto_8

    :cond_a
    invoke-virtual {v0, v2}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_8
    move/from16 v32, v0

    move-object v14, v5

    check-cast v14, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    const/16 v31, 0x0

    move-object/from16 v22, v6

    invoke-virtual/range {v14 .. v32}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeTemporallyBinViewfinderFrame(JIJJLjava/lang/Runnable;JLjava/lang/Runnable;JJLjava/lang/Runnable;ZI)Z

    move-result v0

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-interface {v7}, Lulx;->g()V

    return v0
.end method

.method public final E(Lmnk;Luuv;ILuzj;Lzna;Luzo;)V
    .locals 12

    sget-object v10, Lxuz;->a:Lxuz;

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    invoke-virtual/range {v0 .. v11}, Lmla;->q(Lmnk;Luuv;ILuzj;Lzna;Luzo;Luzo;Luzo;Luzo;Lxwg;Luzj;)V

    return-void
.end method

.method public final F(Luuv;Luzo;Luzj;Ltse;Lpci;Lmtn;Lxwg;Lxwg;Lxwg;)Landroid/graphics/Bitmap;
    .locals 28

    move-object/from16 v1, p0

    move-object/from16 v13, p1

    move-object/from16 v12, p3

    move-object/from16 v0, p4

    new-instance v2, Litk;

    const/16 v3, 0x9

    invoke-direct {v2, v0, v3}, Litk;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v3, p7

    invoke-virtual {v3, v2}, Lxwg;->b(Lxvv;)Lxwg;

    move-result-object v2

    invoke-virtual {v2, v0}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltse;

    invoke-virtual {v1, v12, v13}, Lmla;->c(Luzj;Luuv;)I

    move-result v5

    iget-object v2, v1, Lmla;->o:Lufv;

    check-cast v2, Lufn;

    iget-object v2, v2, Lufn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, v1, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v3, v2}, Lzsn;->a(I)F

    move-result v2

    iget-object v4, v0, Ltse;->c:Ljava/lang/Object;

    iget-object v0, v0, Ltse;->a:Ljava/lang/Object;

    sget-object v9, Lxuz;->a:Lxuz;

    check-cast v0, Lost;

    iget-object v6, v0, Lost;->p:Lxwg;

    sget-object v17, Lmqa;->a:Lmqa;

    const/high16 v22, 0x3f800000    # 1.0f

    invoke-interface {v4}, Lqrg;->am()Z

    move-result v23

    move-object v4, v3

    const/4 v3, 0x0

    move-object/from16 v24, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v14, -0x1

    const/high16 v16, -0x40800000    # -1.0f

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v21, p6

    move-object/from16 v25, v4

    move-object/from16 v4, p5

    invoke-virtual/range {v1 .. v24}, Lmla;->K(FILpci;IZZZLxwg;ZZLuzj;Luuv;JFLmqa;ZZZLmtn;FZLxwg;)Lcom/google/googlex/gcam/ShotParams;

    move-result-object v8

    move-object v7, v1

    move v9, v5

    iget-object v10, v0, Lost;->m:Lxwg;

    iget-object v1, v7, Lmla;->t:Lulc;

    invoke-virtual {v10, v1}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lulc;

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v2

    iget-object v1, v7, Lmla;->m:Lmix;

    iget v4, v1, Lmix;->i:F

    move-object/from16 v1, p1

    move-object/from16 v3, p3

    move-object v11, v0

    move-object/from16 v0, v25

    invoke-virtual/range {v0 .. v6}, Lzsn;->F(Luuv;Lcom/google/googlex/gcam/AeShotParams;Luzj;FLulc;Z)V

    move-object v13, v1

    move-object v12, v3

    iget-object v1, v11, Lost;->i:Lxwg;

    invoke-virtual {v1}, Lxwg;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    if-eqz v1, :cond_0

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v2

    invoke-static {v2, v1}, Lmla;->N(Lcom/google/googlex/gcam/AeShotParams;Landroid/graphics/RectF;)V

    :cond_0
    invoke-virtual {v10}, Lxwg;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lulc;

    if-eqz v1, :cond_1

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v2

    iget v3, v1, Lulc;->a:I

    invoke-virtual {v2, v3}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v2

    iget v1, v1, Lulc;->b:I

    invoke-virtual {v2, v1}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v7, v12, v13, v1}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v11

    iget-object v2, v7, Lmla;->r:Lzsl;

    move-object/from16 v3, p2

    invoke-virtual {v2, v3}, Lzsl;->b(Luzo;)Lcom/google/googlex/gcam/RawWriteView;

    move-result-object v17

    invoke-virtual {v0, v12}, Lzsn;->v(Luzj;)Lcom/google/googlex/gcam/SpatialGainMap;

    move-result-object v14

    new-instance v0, Lcom/google/googlex/gcam/GenerateRgbImageOptions;

    invoke-direct {v0}, Lcom/google/googlex/gcam/GenerateRgbImageOptions;-><init>()V

    invoke-virtual/range {p9 .. p9}, Lxwg;->h()Z

    move-result v2

    if-eqz v2, :cond_2

    move-object/from16 v2, p8

    check-cast v2, Lxwm;

    iget-object v2, v2, Lxwm;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-wide v3, v0, Lcom/google/googlex/gcam/GenerateRgbImageOptions;->a:J

    invoke-static {v3, v4, v0, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->GenerateRgbImageOptions_expected_number_of_frames_set(JLcom/google/googlex/gcam/GenerateRgbImageOptions;I)V

    invoke-virtual/range {p9 .. p9}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-wide v3, v0, Lcom/google/googlex/gcam/GenerateRgbImageOptions;->a:J

    invoke-static {v3, v4, v0, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->GenerateRgbImageOptions_actual_number_of_frames_set(JLcom/google/googlex/gcam/GenerateRgbImageOptions;I)V

    :cond_2
    new-instance v2, Lcom/google/googlex/gcam/DebugParams;

    invoke-direct {v2}, Lcom/google/googlex/gcam/DebugParams;-><init>()V

    iget-wide v3, v0, Lcom/google/googlex/gcam/GenerateRgbImageOptions;->a:J

    invoke-static {v2}, Lcom/google/googlex/gcam/DebugParams;->a(Lcom/google/googlex/gcam/DebugParams;)J

    move-result-wide v5

    move-object/from16 p3, v0

    move-object/from16 p6, v2

    move-wide/from16 p1, v3

    move-wide/from16 p4, v5

    invoke-static/range {p1 .. p6}, Lcom/google/googlex/gcam/GcamModuleJNI;->GenerateRgbImageOptions_debug_params_set(JLcom/google/googlex/gcam/GenerateRgbImageOptions;JLcom/google/googlex/gcam/DebugParams;)V

    move-object/from16 v21, p6

    sget-object v2, Lkjq;->a:Lkiy;

    iget-wide v2, v0, Lcom/google/googlex/gcam/GenerateRgbImageOptions;->a:J

    const/4 v4, 0x0

    invoke-static {v2, v3, v0, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->GenerateRgbImageOptions_verbose_set(JLcom/google/googlex/gcam/GenerateRgbImageOptions;Z)V

    iget-object v4, v7, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    new-instance v2, Lcom/google/googlex/gcam/InterleavedImageU8;

    move-object v5, v2

    iget-wide v2, v4, Lcom/google/googlex/gcam/Gcam;->a:J

    iget-wide v6, v8, Lcom/google/googlex/gcam/ShotParams;->a:J

    move-object v12, v5

    move v5, v9

    invoke-static {v11}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v9

    move-object v15, v12

    invoke-static {v14}, Lcom/google/googlex/gcam/SpatialGainMap;->a(Lcom/google/googlex/gcam/SpatialGainMap;)J

    move-result-wide v12

    move-object/from16 v18, v15

    invoke-static/range {v17 .. v17}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v15

    move-wide/from16 v19, v2

    iget-wide v1, v0, Lcom/google/googlex/gcam/GenerateRgbImageOptions;->a:J

    move-wide/from16 v26, v19

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-wide/from16 v18, v1

    move-wide/from16 v2, v26

    move-object/from16 v1, p0

    invoke-static/range {v2 .. v20}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_GenerateRgbImage(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/ShotParams;JLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/SpatialGainMap;JLcom/google/googlex/gcam/RawWriteView;JLcom/google/googlex/gcam/GenerateRgbImageOptions;)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lcom/google/googlex/gcam/InterleavedImageU8;-><init>(J)V

    invoke-virtual/range {v20 .. v20}, Lcom/google/googlex/gcam/GenerateRgbImageOptions;->a()V

    invoke-virtual/range {v21 .. v21}, Lcom/google/googlex/gcam/DebugParams;->b()V

    invoke-virtual {v11}, Lcom/google/googlex/gcam/FrameMetadata;->x()V

    invoke-virtual {v14}, Lcom/google/googlex/gcam/SpatialGainMap;->b()V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->d()V

    invoke-virtual {v0}, Lcom/google/googlex/gcam/InterleavedImageU8;->i()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v4, v2, :cond_3

    move-object v2, v0

    goto :goto_0

    :cond_3
    move-object v2, v3

    :goto_0
    if-eqz v2, :cond_4

    iget-object v0, v1, Lmla;->af:Lovu;

    invoke-virtual {v0, v2}, Lovu;->q(Lcom/google/googlex/gcam/InterleavedImageU8;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_4
    return-object v3
.end method

.method public final G(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;Lxwg;)Lmnk;
    .locals 22

    move-object/from16 v2, p0

    iget-object v0, v2, Lmla;->e:Lulx;

    const-string v1, "HdrPlus#StartMomentsShotCapture"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    :try_start_0
    sget-object v15, Lxuz;->a:Lxuz;

    sget-object v16, Lmqa;->a:Lmqa;

    iget-object v0, v2, Lmla;->N:Lmmj;

    invoke-static {v0}, Llid;->v(Lmmj;)Lmtn;

    move-result-object v19

    const/high16 v20, 0x3f800000    # 1.0f

    const/4 v9, 0x1

    const/4 v10, -0x1

    const/4 v11, -0x1

    const/4 v12, 0x0

    const/4 v13, -0x1

    const/4 v14, 0x1

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v21, p7

    invoke-direct/range {v2 .. v21}, Lmla;->U(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;ZIIZIZLxwg;Lmqa;ZZLmtn;FLxwg;)Lmnk;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    throw v0
.end method

.method public final H(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;IZ)Lmnk;
    .locals 22

    move-object/from16 v2, p0

    iget-object v0, v2, Lmla;->e:Lulx;

    const-string v1, "HdrPlus#StartNlShotCapture"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    :try_start_0
    sget-object v15, Lxuz;->a:Lxuz;

    sget-object v16, Lmqa;->a:Lmqa;

    iget-object v0, v2, Lmla;->N:Lmmj;

    invoke-static {v0}, Llid;->v(Lmmj;)Lmtn;

    move-result-object v19

    const/16 v17, 0x0

    const/high16 v20, 0x3f800000    # 1.0f

    const/4 v9, 0x1

    const/4 v10, -0x1

    const/4 v12, 0x0

    const/4 v13, -0x1

    const/4 v14, 0x0

    move-object/from16 v21, v15

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move/from16 v11, p7

    move/from16 v18, p8

    invoke-direct/range {v2 .. v21}, Lmla;->U(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;ZIIZIZLxwg;Lmqa;ZZLmtn;FLxwg;)Lmnk;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    throw v0
.end method

.method public final I(Luuv;Ltse;Lcom/google/googlex/gcam/PostviewParams;Luzj;IZILxwg;Lmqa;Lmnv;)Lmnk;
    .locals 22

    move-object/from16 v2, p0

    iget-object v0, v2, Lmla;->e:Lulx;

    const-string v1, "HdrPlus#StartShotCapture"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    move-object/from16 v5, p2

    :try_start_0
    iget-object v0, v5, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v0}, Lqrg;->q()Lqrt;

    move-result-object v4

    if-nez p6, :cond_0

    iget-object v0, v2, Lmla;->E:Lmkl;

    invoke-virtual {v0, v4}, Lmkl;->i(Lqrt;)V

    :cond_0
    move-object/from16 v0, p10

    check-cast v0, Lmio;

    iget-object v7, v0, Lmio;->i:Lpci;

    invoke-interface/range {p10 .. p10}, Lmnv;->c()Z

    move-result v17

    move-object/from16 v0, p10

    check-cast v0, Lmio;

    iget-object v0, v0, Lmio;->k:Lmtn;

    move-object/from16 v1, p10

    check-cast v1, Lmio;

    iget v1, v1, Lmio;->o:F

    sget-object v21, Lxuz;->a:Lxuz;

    const/4 v14, 0x0

    const/16 v18, 0x0

    const/4 v9, 0x0

    const/4 v10, -0x1

    move-object/from16 v3, p1

    move-object/from16 v6, p3

    move-object/from16 v8, p4

    move/from16 v11, p5

    move/from16 v12, p6

    move/from16 v13, p7

    move-object/from16 v15, p8

    move-object/from16 v16, p9

    move-object/from16 v19, v0

    move/from16 v20, v1

    invoke-direct/range {v2 .. v21}, Lmla;->U(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;ZIIZIZLxwg;Lmqa;ZZLmtn;FLxwg;)Lmnk;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    throw v0
.end method

.method public final J(Luuv;Ltse;Lcom/google/googlex/gcam/PostviewParams;Luzj;IIZLmqa;Lmnv;)Lmnk;
    .locals 22

    move-object/from16 v2, p0

    move/from16 v12, p7

    iget-object v0, v2, Lmla;->e:Lulx;

    const-string v1, "HdrPlus#StartZslShotCapture"

    invoke-interface {v0, v1}, Lulx;->f(Ljava/lang/String;)V

    move-object/from16 v5, p2

    :try_start_0
    iget-object v0, v5, Ltse;->c:Ljava/lang/Object;

    invoke-interface {v0}, Lqrg;->q()Lqrt;

    move-result-object v4

    if-nez v12, :cond_0

    iget-object v0, v2, Lmla;->E:Lmkl;

    invoke-virtual {v0, v4}, Lmkl;->i(Lqrt;)V

    :cond_0
    move-object/from16 v0, p9

    check-cast v0, Lmio;

    iget-object v7, v0, Lmio;->i:Lpci;

    const/4 v0, 0x1

    if-eq v0, v12, :cond_1

    const/4 v0, -0x1

    :cond_1
    move v13, v0

    sget-object v15, Lxuz;->a:Lxuz;

    move-object/from16 v0, p9

    check-cast v0, Lmio;

    iget-object v0, v0, Lmio;->k:Lmtn;

    move-object/from16 v1, p9

    check-cast v1, Lmio;

    iget v1, v1, Lmio;->o:F

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/4 v9, 0x1

    const/4 v14, 0x0

    move-object/from16 v21, v15

    move-object/from16 v3, p1

    move-object/from16 v6, p3

    move-object/from16 v8, p4

    move/from16 v10, p5

    move/from16 v11, p6

    move-object/from16 v16, p8

    move-object/from16 v19, v0

    move/from16 v20, v1

    invoke-direct/range {v2 .. v21}, Lmla;->U(Luuv;Lqrt;Ltse;Lcom/google/googlex/gcam/PostviewParams;Lpci;Luzj;ZIIZIZLxwg;Lmqa;ZZLmtn;FLxwg;)Lmnk;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    return-object v0

    :catchall_0
    move-exception v0

    iget-object v1, v2, Lmla;->e:Lulx;

    invoke-interface {v1}, Lulx;->g()V

    throw v0
.end method

.method final K(FILpci;IZZZLxwg;ZZLuzj;Luuv;JFLmqa;ZZZLmtn;FZLxwg;)Lcom/google/googlex/gcam/ShotParams;
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p5

    move-object/from16 v2, p11

    move-wide/from16 v3, p13

    move-object/from16 v5, p16

    iget-object v6, v0, Lmla;->ac:Lpoq;

    invoke-virtual {v6}, Lpoq;->g()Lcom/google/googlex/gcam/ShotParams;

    move-result-object v9

    iget-object v6, v0, Lmla;->e:Lulx;

    const-string v7, "setup"

    invoke-interface {v6, v7}, Lulx;->f(Ljava/lang/String;)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_zsl_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v10, p6

    invoke-static {v7, v8, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_save_merged_dng_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v10, p7

    invoke-static {v7, v8, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_allow_base_frame_reuse_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    invoke-static/range {p2 .. p2}, Laaaq;->I(I)Lznn;

    move-result-object v7

    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget v7, v7, Lznn;->j:I

    invoke-static {v10, v11, v9, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_image_rotation_set(JLcom/google/googlex/gcam/ShotParams;I)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v10, p18

    invoke-static {v7, v8, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_downsample1to2x_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v10, p21

    invoke-static {v7, v8, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_final_jpg_extra_digital_zoom_set(JLcom/google/googlex/gcam/ShotParams;F)V

    iget-object v7, v0, Lmla;->ad:Lqep;

    iget-object v7, v7, Lqep;->f:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ljfu;

    const/16 v10, 0x10

    invoke-direct {v8, v2, v10}, Ljfu;-><init>(Ljava/lang/Object;I)V

    move-object v10, v7

    check-cast v10, Lj$/util/Optional;

    invoke-virtual {v10}, Lj$/util/Optional;->isPresent()Z

    move-result v11

    const/4 v13, 0x1

    if-ne v13, v11, :cond_0

    invoke-virtual {v10}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v7

    iget-object v8, v8, Ljfu;->a:Ljava/lang/Object;

    check-cast v7, Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v8, v7}, Luzc;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-static {v7}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v7

    :cond_0
    move-object v8, v7

    check-cast v8, Lj$/util/Optional;

    invoke-virtual {v8}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    if-ne v13, v10, :cond_1

    invoke-virtual {v8}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    sget-object v10, Lqkv;->a:Lqkv;

    iget v10, v10, Lqlh;->d:I

    if-ne v8, v10, :cond_1

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v7

    :cond_1
    new-instance v8, Lmkx;

    const/4 v14, 0x0

    move-object/from16 v10, p23

    invoke-direct {v8, v10, v14}, Lmkx;-><init>(Ljava/lang/Object;I)V

    check-cast v7, Lj$/util/Optional;

    invoke-virtual {v7}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    const/16 v11, 0xe

    if-eq v13, v10, :cond_2

    iget-object v7, v8, Lmkx;->a:Ljava/lang/Object;

    new-instance v8, Lkqi;

    invoke-direct {v8, v11}, Lkqi;-><init>(I)V

    check-cast v7, Lxwg;

    invoke-virtual {v7, v8}, Lxwg;->b(Lxvv;)Lxwg;

    move-result-object v7

    sget-object v8, Lqkv;->a:Lqkv;

    iget v8, v8, Lqlh;->d:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    goto :goto_0

    :cond_2
    invoke-virtual {v7}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v7

    :goto_0
    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v7}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I

    move-result v7

    iget-wide v11, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v11, v12, v9, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_tomte_type_set(JLcom/google/googlex/gcam/ShotParams;I)V

    if-eqz v7, :cond_skip_tomte_log

    const-string v11, "PATCH_LOOKS"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v15, "ShotParams_tomte_type_set successfully applied type="

    invoke-direct {v12, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_skip_tomte_log

    iget-object v15, v0, Lmla;->s:Luus;

    sget-object v7, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_TIMESTAMP_SOURCE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v15, v7, v8}, Luus;->n(Landroid/hardware/camera2/CameraCharacteristics$Key;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const-wide/16 v10, 0x0

    if-ne v7, v13, :cond_3

    invoke-virtual/range {p8 .. p8}, Lxwg;->h()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual/range {p8 .. p8}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrfr;

    invoke-virtual {v7}, Lrfr;->d()J

    move-result-wide v16

    cmp-long v7, v16, v10

    if-lez v7, :cond_3

    invoke-virtual/range {p8 .. p8}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrfr;

    invoke-virtual {v7}, Lrfr;->e()J

    move-result-wide v16

    cmp-long v7, v16, v10

    if-lez v7, :cond_3

    invoke-virtual/range {p8 .. p8}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrfr;

    move-wide/from16 p6, v10

    invoke-virtual {v7}, Lrfr;->d()J

    move-result-wide v10

    move-object/from16 v16, v15

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v14, v15, v9, v10, v11}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_shutter_press_down_timestamp_ns_set(JLcom/google/googlex/gcam/ShotParams;J)V

    invoke-virtual/range {p8 .. p8}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lrfr;

    invoke-virtual {v7}, Lrfr;->e()J

    move-result-wide v10

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v14, v15, v9, v10, v11}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_shutter_press_up_timestamp_ns_set(JLcom/google/googlex/gcam/ShotParams;J)V

    goto :goto_1

    :cond_3
    move-wide/from16 p6, v10

    move-object/from16 v16, v15

    :goto_1
    cmp-long v7, v3, p6

    if-lez v7, :cond_4

    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v10, v11, v9, v3, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_metering_frame_timestamp_ns_set(JLcom/google/googlex/gcam/ShotParams;J)V

    :cond_4
    iget-wide v3, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v7, p15

    invoke-static {v3, v4, v9, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_metering_frame_night_factor_set(JLcom/google/googlex/gcam/ShotParams;F)V

    iget-boolean v3, v0, Lmla;->P:Z

    const v4, 0x49742400    # 1000000.0f

    if-eqz v3, :cond_6

    iget-object v7, v0, Lmla;->ab:Lklm;

    sget-object v10, Lkkq;->q:Lkiz;

    invoke-virtual {v7, v10}, Lklm;->q(Lkiz;)Z

    move-result v7

    if-eqz v7, :cond_6

    sget-object v7, Landroid/hardware/camera2/CaptureResult;->SENSOR_EXPOSURE_TIME:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v2, v7}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    if-eqz v7, :cond_5

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    long-to-float v7, v10

    div-float/2addr v7, v4

    goto :goto_2

    :cond_5
    const/high16 v7, -0x40800000    # -1.0f

    :goto_2
    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v10, v11, v9, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_min_frame_exposure_time_ms_set(JLcom/google/googlex/gcam/ShotParams;F)V

    :cond_6
    new-instance v12, Lcom/google/googlex/gcam/ArkInfo;

    invoke-static {}, Lcom/google/googlex/gcam/GcamModuleJNI;->new_ArkInfo__SWIG_0()J

    move-result-wide v10

    invoke-direct {v12, v10, v11, v13}, Lcom/google/googlex/gcam/ArkInfo;-><init>(JZ)V

    iget-object v15, v0, Lmla;->Q:Lufv;

    invoke-interface {v15}, Lufv;->d()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnqm;

    sget-object v10, Lznk;->b:Lznk;

    invoke-virtual {v12, v10}, Lcom/google/googlex/gcam/ArkInfo;->h(Lznk;)V

    iget-object v10, v7, Lnqm;->a:Lj$/util/Optional;

    new-instance v11, Lmkt;

    move/from16 p6, v4

    const/4 v4, 0x0

    invoke-direct {v11, v12, v4}, Lmkt;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v10}, Lj$/util/Optional;->isPresent()Z

    move-result v4

    if-ne v13, v4, :cond_7

    invoke-virtual {v10}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v4

    iget-object v10, v11, Lmkt;->a:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    check-cast v10, Lcom/google/googlex/gcam/ArkInfo;

    move-object/from16 v17, v15

    const/high16 p7, -0x40800000    # -1.0f

    iget-wide v14, v10, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v14, v15, v10, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_focus_distance_set(JLcom/google/googlex/gcam/ArkInfo;F)V

    sget-object v4, Lznk;->c:Lznk;

    invoke-virtual {v10, v4}, Lcom/google/googlex/gcam/ArkInfo;->h(Lznk;)V

    goto :goto_3

    :cond_7
    move-object/from16 v17, v15

    const/high16 p7, -0x40800000    # -1.0f

    :goto_3
    sget-object v4, Lznf;->b:Lznf;

    invoke-virtual {v12, v4}, Lcom/google/googlex/gcam/ArkInfo;->g(Lznf;)V

    iget-object v4, v7, Lnqm;->g:Lj$/util/Optional;

    new-instance v10, Llkd;

    const/4 v11, 0x6

    invoke-direct {v10, v12, v7, v11}, Llkd;-><init>(Lcom/google/googlex/gcam/ArkInfo;Lnqm;I)V

    invoke-virtual {v4}, Lj$/util/Optional;->isPresent()Z

    move-result v11

    if-ne v13, v11, :cond_8

    invoke-virtual {v4}, Lj$/util/Optional;->get()Ljava/lang/Object;

    iget-object v11, v10, Llkd;->b:Ljava/lang/Object;

    iget-object v10, v10, Llkd;->a:Ljava/lang/Object;

    sget-object v14, Lznf;->c:Lznf;

    check-cast v11, Lcom/google/googlex/gcam/ArkInfo;

    invoke-virtual {v11, v14}, Lcom/google/googlex/gcam/ArkInfo;->g(Lznf;)V

    check-cast v10, Lnqm;

    iget-object v10, v10, Lnqm;->g:Lj$/util/Optional;

    invoke-virtual {v10}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    long-to-float v10, v14

    div-float v10, v10, p6

    iget-wide v14, v11, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v14, v15, v11, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_exposure_time_ms_set(JLcom/google/googlex/gcam/ArkInfo;F)V

    :cond_8
    iget-object v10, v7, Lnqm;->f:Lj$/util/Optional;

    new-instance v11, Lmku;

    invoke-direct {v11, v0, v12, v2}, Lmku;-><init>(Lmla;Lcom/google/googlex/gcam/ArkInfo;Luzj;)V

    invoke-virtual {v10}, Lj$/util/Optional;->isPresent()Z

    move-result v14

    if-ne v13, v14, :cond_9

    invoke-virtual {v10}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v14

    iget-object v15, v11, Lmku;->a:Lmla;

    iget-object v13, v11, Lmku;->b:Lcom/google/googlex/gcam/ArkInfo;

    iget-object v11, v11, Lmku;->c:Luzj;

    sget-object v1, Lznf;->d:Lznf;

    invoke-virtual {v13, v1}, Lcom/google/googlex/gcam/ArkInfo;->g(Lznf;)V

    iget-object v1, v15, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v1, v11}, Lzsn;->i(Luzj;)Luus;

    move-result-object v1

    sget-object v11, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_INFO_SENSITIVITY_RANGE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {v1, v11}, Luus;->o(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Range;

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    div-int/2addr v11, v1

    int-to-float v1, v11

    iget-wide v14, v13, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v14, v15, v13, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_gain_set(JLcom/google/googlex/gcam/ArkInfo;F)V

    :cond_9
    invoke-virtual {v10}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {v4}, Lj$/util/Optional;->isPresent()Z

    move-result v1

    if-eqz v1, :cond_a

    sget-object v1, Lznf;->e:Lznf;

    invoke-virtual {v12, v1}, Lcom/google/googlex/gcam/ArkInfo;->g(Lznf;)V

    :cond_a
    iget-object v1, v7, Lnqm;->h:Lj$/util/Optional;

    new-instance v4, Llza;

    const/16 v10, 0xd

    invoke-direct {v4, v12, v10}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    const/4 v11, 0x1

    if-ne v11, v10, :cond_b

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    iget-object v4, v4, Llza;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    check-cast v4, Lcom/google/googlex/gcam/ArkInfo;

    iget-wide v10, v4, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v10, v11, v4, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_white_balance_factor_set(JLcom/google/googlex/gcam/ArkInfo;F)V

    :cond_b
    iget-object v1, v7, Lnqm;->b:Lj$/util/Optional;

    new-instance v4, Llza;

    const/16 v10, 0xe

    invoke-direct {v4, v12, v10}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    const/4 v11, 0x1

    if-ne v11, v10, :cond_c

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    iget-object v4, v4, Llza;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    check-cast v4, Lcom/google/googlex/gcam/ArkInfo;

    iget-wide v10, v4, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v10, v11, v4, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_brightness_factor_set(JLcom/google/googlex/gcam/ArkInfo;F)V

    :cond_c
    iget-object v1, v7, Lnqm;->e:Lj$/util/Optional;

    new-instance v4, Llza;

    const/16 v7, 0xf

    invoke-direct {v4, v12, v7}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v1}, Lj$/util/Optional;->isPresent()Z

    move-result v7

    const/4 v11, 0x1

    if-ne v11, v7, :cond_d

    invoke-virtual {v1}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    iget-object v4, v4, Llza;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    check-cast v4, Lcom/google/googlex/gcam/ArkInfo;

    iget-wide v10, v4, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v10, v11, v4, v1}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_shadow_factor_set(JLcom/google/googlex/gcam/ArkInfo;F)V

    :cond_d
    move-object v1, v8

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-wide v10, v12, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static/range {v7 .. v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_ark_info_set(JLcom/google/googlex/gcam/ShotParams;JLcom/google/googlex/gcam/ArkInfo;)V

    const-string v4, "createAeShotParams"

    invoke-interface {v6, v4}, Lulx;->h(Ljava/lang/String;)V

    invoke-interface/range {p20 .. p20}, Lmtn;->l()Z

    move-result v4

    invoke-static {v5}, Lmla;->Q(Lmqa;)Z

    move-result v7

    move/from16 v8, p1

    invoke-direct {v0, v8, v4, v7}, Lmla;->L(FZZ)Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v4

    invoke-virtual {v12}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v7

    sget-object v13, Lznf;->d:Lznf;

    if-eq v7, v13, :cond_11

    invoke-virtual {v12}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v7

    sget-object v8, Lznf;->e:Lznf;

    if-eq v7, v8, :cond_11

    invoke-virtual {v12}, Lcom/google/googlex/gcam/ArkInfo;->d()F

    move-result v7

    cmpl-float v7, v7, p7

    if-nez v7, :cond_11

    invoke-virtual {v12}, Lcom/google/googlex/gcam/ArkInfo;->a()F

    move-result v7

    cmpl-float v7, v7, p7

    if-nez v7, :cond_11

    iget-object v7, v0, Lmla;->ab:Lklm;

    iget-object v8, v0, Lmla;->p:Lmlt;

    iget-object v10, v0, Lmla;->V:Losw;

    sget-object v11, Lkim;->f:Lkiz;

    invoke-virtual {v7, v11}, Lklm;->q(Lkiz;)Z

    move-result v7

    if-nez v7, :cond_f

    :cond_e
    :goto_4
    const/4 v7, 0x0

    goto :goto_5

    :cond_f
    sget-object v7, Lmlt;->e:Lmlt;

    if-eq v8, v7, :cond_10

    goto :goto_4

    :cond_10
    iget-object v7, v10, Losw;->g:Lugh;

    check-cast v7, Lufn;

    iget-object v7, v7, Lufn;->c:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    cmpl-float v7, v7, p7

    if-nez v7, :cond_11

    iget-object v7, v10, Losw;->f:Lugh;

    check-cast v7, Lufn;

    iget-object v7, v7, Lufn;->c:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    cmpl-float v7, v7, p7

    if-eqz v7, :cond_e

    :cond_11
    const/4 v7, 0x1

    :goto_5
    iget-wide v10, v4, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {v10, v11, v4, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeShotParams_manual_tet_from_manual_control_set(JLcom/google/googlex/gcam/AeShotParams;Z)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-wide v10, v4, Lcom/google/googlex/gcam/AeShotParams;->a:J

    move-object v12, v4

    invoke-static/range {v7 .. v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_ae_set(JLcom/google/googlex/gcam/ShotParams;JLcom/google/googlex/gcam/AeShotParams;)V

    const-string v4, "portraitRelighting"

    invoke-interface {v6, v4}, Lulx;->h(Ljava/lang/String;)V

    iget-object v4, v0, Lmla;->p:Lmlt;

    sget-object v7, Lmlt;->b:Lmlt;

    invoke-virtual {v4, v7}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    iget-object v10, v0, Lmla;->H:Lpxa;

    invoke-interface {v10, v8}, Lpxa;->e(Z)Z

    move-result v10

    iget-object v11, v0, Lmla;->ab:Lklm;

    sget-object v14, Lkjq;->aD:Lkiz;

    invoke-virtual {v11, v14}, Lklm;->q(Lkiz;)Z

    move-result v14

    if-eqz v14, :cond_13

    if-nez v8, :cond_12

    sget-object v14, Lmlt;->a:Lmlt;

    invoke-virtual {v4, v14}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_12

    sget-object v14, Lmlt;->c:Lmlt;

    invoke-virtual {v4, v14}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_13

    :cond_12
    const/4 v14, 0x1

    goto :goto_6

    :cond_13
    const/4 v14, 0x0

    :goto_6
    invoke-virtual {v9}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v15

    if-nez v10, :cond_15

    if-eqz v14, :cond_14

    goto :goto_7

    :cond_14
    const/4 v10, 0x0

    goto :goto_8

    :cond_15
    :goto_7
    const/4 v10, 0x1

    :goto_8
    invoke-virtual {v15, v10}, Lcom/google/googlex/gcam/AeShotParams;->l(Z)V

    const-string v10, "flash"

    invoke-interface {v6, v10}, Lulx;->h(Ljava/lang/String;)V

    sget-object v10, Lpci;->a:Lpci;

    invoke-virtual/range {p3 .. p3}, Lpci;->ordinal()I

    move-result v10

    const/4 v14, 0x2

    if-eqz v10, :cond_17

    if-eq v10, v14, :cond_16

    sget-object v10, Lznj;->c:Lznj;

    goto :goto_9

    :cond_16
    sget-object v10, Lznj;->b:Lznj;

    goto :goto_9

    :cond_17
    sget-object v10, Lznj;->a:Lznj;

    :goto_9
    move/from16 p1, v14

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget v10, v10, Lznj;->d:I

    invoke-static {v14, v15, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_flash_mode_set(JLcom/google/googlex/gcam/ShotParams;I)V

    invoke-interface/range {p20 .. p20}, Lmtn;->f()Z

    move-result v10

    invoke-interface/range {p20 .. p20}, Lmtn;->m()Z

    move-result v14

    move-object/from16 p7, v12

    move-object/from16 p2, v13

    iget-wide v12, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v9, v14}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_dual_stage_merge_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v12, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v9, v14}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_strengthen_denoise_for_sky_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    invoke-interface/range {p20 .. p20}, Lmtn;->n()Z

    move-result v12

    move/from16 p8, v14

    iget-wide v13, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v13, v14, v9, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_ghostshark_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    const-string v13, "wbSource"

    invoke-interface {v6, v13}, Lulx;->h(Ljava/lang/String;)V

    sget-object v13, Lkjq;->b:Lkiy;

    invoke-virtual {v11, v13}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    const/4 v14, 0x3

    const/4 v15, 0x4

    move/from16 p13, v8

    move/from16 p14, v10

    const/4 v10, 0x1

    move/from16 v8, p1

    filled-new-array {v10, v8, v14, v15}, [I

    move-result-object v18

    aget v13, v18, v13

    move/from16 p15, v15

    add-int/lit8 v15, v13, -0x1

    if-eqz v13, :cond_81

    if-eqz v15, :cond_1e

    if-eq v15, v10, :cond_1d

    if-eq v15, v8, :cond_1c

    const/4 v8, 0x3

    if-eq v15, v8, :cond_18

    goto :goto_c

    :cond_18
    if-eqz v3, :cond_1b

    if-eqz p14, :cond_1a

    if-nez p10, :cond_19

    const/4 v8, 0x1

    goto :goto_a

    :cond_19
    const/4 v8, 0x0

    :goto_a
    const/4 v10, 0x1

    goto :goto_b

    :cond_1a
    const/4 v8, 0x0

    const/4 v10, 0x0

    goto :goto_b

    :cond_1b
    move/from16 v10, p14

    const/4 v8, 0x0

    :goto_b
    invoke-virtual {v9, v8}, Lcom/google/googlex/gcam/ShotParams;->i(Z)V

    goto :goto_f

    :cond_1c
    const/4 v8, 0x0

    invoke-virtual {v9, v8}, Lcom/google/googlex/gcam/ShotParams;->i(Z)V

    goto :goto_c

    :cond_1d
    invoke-virtual {v9, v10}, Lcom/google/googlex/gcam/ShotParams;->i(Z)V

    :goto_c
    move/from16 v10, p14

    goto :goto_f

    :cond_1e
    if-eqz p14, :cond_20

    if-nez p10, :cond_1f

    const/4 v8, 0x1

    goto :goto_d

    :cond_1f
    const/4 v8, 0x0

    :goto_d
    const/4 v10, 0x1

    goto :goto_e

    :cond_20
    const/4 v8, 0x0

    const/4 v10, 0x0

    :goto_e
    invoke-virtual {v9, v8}, Lcom/google/googlex/gcam/ShotParams;->i(Z)V

    :goto_f
    iget-object v8, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    move/from16 v13, p4

    invoke-virtual {v8, v13}, Lcom/google/googlex/gcam/Gcam;->c(I)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/googlex/gcam/StaticMetadata;->g()Lzoi;

    move-result-object v13

    invoke-interface/range {v16 .. v16}, Luus;->l()Luve;

    move-result-object v15

    sget-object v14, Luve;->b:Luve;

    invoke-virtual {v15, v14}, Luve;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz p13, :cond_21

    if-eqz v14, :cond_21

    if-eqz p5, :cond_21

    sget-object v14, Lkkn;->aZ:Lkiz;

    invoke-virtual {v11, v14}, Lklm;->x(Lkiz;)Z

    move-result v14

    if-eqz v14, :cond_21

    move-object/from16 p23, v7

    move-object/from16 p4, v8

    const/4 v14, 0x1

    goto :goto_10

    :cond_21
    move-object/from16 p23, v7

    move-object/from16 p4, v8

    const/4 v14, 0x0

    :goto_10
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v14}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_skip_pd_data_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    move/from16 v14, p19

    invoke-static {v7, v8, v9, v14}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_flip_dng_horizontally_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    invoke-virtual/range {p4 .. p4}, Lcom/google/googlex/gcam/StaticMetadata;->f()Lcom/google/googlex/gcam/PixelRect;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/googlex/gcam/PixelRect;->f()I

    move-result v7

    invoke-virtual/range {p4 .. p4}, Lcom/google/googlex/gcam/StaticMetadata;->f()Lcom/google/googlex/gcam/PixelRect;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/googlex/gcam/PixelRect;->e()I

    move-result v8

    mul-int/2addr v7, v8

    iget-object v8, v0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    move-object/from16 v14, p12

    invoke-virtual {v8, v2, v14}, Lzsn;->j(Luzj;Luuv;)Luus;

    move-result-object v14

    invoke-interface {v14}, Luus;->j()Luuv;

    move-result-object v14

    iget-object v14, v14, Luuv;->a:Ljava/lang/String;

    invoke-static {v2, v14}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->l(Luzj;Ljava/lang/String;)Luzj;

    move-result-object v2

    invoke-virtual {v8, v2}, Lzsn;->g(Luzj;)Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v8

    const/4 v14, 0x1

    xor-int/2addr v8, v14

    const-string v14, "Invalid scaler crop region: %s"

    invoke-static {v8, v14, v2}, Lyny;->be(ZLjava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v8

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    mul-int/2addr v8, v2

    sget-object v2, Lzoi;->i:Lzoi;

    if-eq v13, v2, :cond_23

    sget-object v14, Lzoi;->k:Lzoi;

    if-eq v13, v14, :cond_23

    sget-object v14, Lzoi;->m:Lzoi;

    if-ne v13, v14, :cond_22

    goto :goto_11

    :cond_22
    const/4 v14, 0x0

    goto :goto_12

    :cond_23
    :goto_11
    const/4 v14, 0x1

    :goto_12
    if-eqz v14, :cond_24

    const/high16 p5, 0x40000000    # 2.0f

    sget-object v15, Lkjq;->bx:Lkiz;

    invoke-virtual {v11, v15}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v15

    move/from16 p10, v10

    invoke-static/range {p5 .. p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v15, v10}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    goto :goto_13

    :cond_24
    move/from16 p10, v10

    const/high16 p5, 0x40000000    # 2.0f

    sget-object v10, Lkjq;->bw:Lkiz;

    invoke-virtual {v11, v10}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v10

    invoke-static/range {p5 .. p5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-virtual {v10, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    :goto_13
    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    if-eqz v14, :cond_25

    const/high16 p11, 0x40400000    # 3.0f

    sget-object v15, Lkjq;->bz:Lkiz;

    invoke-virtual {v11, v15}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v15

    move/from16 v16, v12

    invoke-static/range {p11 .. p11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    invoke-virtual {v15, v12}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    goto :goto_14

    :cond_25
    move/from16 v16, v12

    const/high16 p11, 0x40400000    # 3.0f

    sget-object v12, Lkjq;->by:Lkiz;

    invoke-virtual {v11, v12}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v12

    invoke-static/range {p11 .. p11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-virtual {v12, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    :goto_14
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    move-object v15, v1

    move-object/from16 p12, v2

    iget-wide v1, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v1, v2, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_lancet_min_zoom_factor_set(JLcom/google/googlex/gcam/ShotParams;F)V

    iget-wide v1, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v1, v2, v9, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_kepler_gan_min_zoom_factor_set(JLcom/google/googlex/gcam/ShotParams;F)V

    sget-object v1, Lkjq;->ak:Lkiz;

    invoke-virtual {v11, v1}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_26

    sget-object v2, Lkkn;->a:Lkiy;

    :cond_26
    if-eqz p13, :cond_27

    const/4 v1, 0x0

    goto :goto_15

    :cond_27
    invoke-virtual {v11, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    :goto_15
    sget-object v2, Lrip;->d:Lrip;

    invoke-direct {v0, v2, v5}, Lmla;->P(Lrip;Lmqa;)Z

    move-result v2

    if-eqz v2, :cond_28

    sget-object v2, Lzoi;->d:Lzoi;

    if-ne v13, v2, :cond_28

    sget-object v1, Lzog;->b:Lzog;

    invoke-virtual {v9, v1}, Lcom/google/googlex/gcam/ShotParams;->j(Lzog;)V

    goto :goto_16

    :cond_28
    if-eqz v1, :cond_29

    if-nez v3, :cond_29

    sget-object v1, Lzog;->f:Lzog;

    invoke-virtual {v9, v1}, Lcom/google/googlex/gcam/ShotParams;->j(Lzog;)V

    goto :goto_16

    :cond_29
    sget-object v1, Lkjq;->ai:Lkiz;

    invoke-virtual {v11, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_2a

    sget-object v1, Lzog;->d:Lzog;

    invoke-virtual {v9, v1}, Lcom/google/googlex/gcam/ShotParams;->j(Lzog;)V

    goto :goto_16

    :cond_2a
    sget-object v1, Lzog;->b:Lzog;

    invoke-virtual {v9, v1}, Lcom/google/googlex/gcam/ShotParams;->j(Lzog;)V

    :goto_16
    invoke-interface/range {p20 .. p20}, Lmtn;->g()Z

    move-result v1

    if-eqz p17, :cond_3d

    invoke-virtual/range {p7 .. p7}, Lcom/google/googlex/gcam/AeShotParams;->a()Lzmw;

    move-result-object v2

    sget-object v10, Lzmw;->d:Lzmw;

    if-ne v2, v10, :cond_2b

    const/4 v2, 0x1

    goto :goto_17

    :cond_2b
    const/4 v2, 0x0

    :goto_17
    iget-object v10, v0, Lmla;->R:Lmmp;

    if-nez p10, :cond_2d

    if-eqz v2, :cond_2c

    goto :goto_18

    :cond_2c
    const/4 v12, 0x0

    goto :goto_19

    :cond_2d
    :goto_18
    const/4 v12, 0x1

    :goto_19
    iput-boolean v12, v10, Lmmp;->a:Z

    iput-boolean v3, v10, Lmmp;->e:Z

    iput-boolean v1, v10, Lmmp;->d:Z

    iput-boolean v2, v10, Lmmp;->b:Z

    sget-object v2, Lmlt;->c:Lmlt;

    if-ne v4, v2, :cond_2e

    const/4 v2, 0x1

    goto :goto_1a

    :cond_2e
    const/4 v2, 0x0

    :goto_1a
    iput-boolean v2, v10, Lmmp;->c:Z

    iput-boolean v14, v10, Lmmp;->f:Z

    iget-object v2, v10, Lmmp;->i:Lklm;

    sget-object v12, Lznz;->g:Lznz;

    sget-object v14, Lkjq;->m:Lkiy;

    invoke-virtual {v2, v14}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v14

    invoke-virtual {v14}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    invoke-static {}, Laasn;->j()[I

    move-result-object v18

    aget v14, v18, v14

    move/from16 p7, v1

    const/4 v1, 0x1

    if-eq v14, v1, :cond_30

    add-int/lit8 v1, v14, -0x1

    if-eqz v14, :cond_2f

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/RuntimeException;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_0
    sget-object v12, Lznz;->f:Lznz;

    goto :goto_1b

    :pswitch_1
    sget-object v12, Lznz;->e:Lznz;

    goto :goto_1b

    :pswitch_2
    sget-object v12, Lznz;->d:Lznz;

    goto :goto_1b

    :pswitch_3
    sget-object v12, Lznz;->c:Lznz;

    goto :goto_1b

    :pswitch_4
    sget-object v12, Lznz;->b:Lznz;

    :goto_1b
    :pswitch_5
    const/4 v14, 0x1

    xor-int/lit8 v1, v3, 0x1

    goto/16 :goto_25

    :cond_2f
    const/4 v1, 0x0

    throw v1

    :cond_30
    move v14, v1

    xor-int/lit8 v1, v3, 0x1

    iget-boolean v3, v10, Lmmp;->a:Z

    if-nez v3, :cond_33

    iget-boolean v3, v10, Lmmp;->c:Z

    if-eqz v3, :cond_31

    goto :goto_1c

    :cond_31
    sget-object v3, Lkjq;->aK:Lkiz;

    invoke-virtual {v2, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    if-eqz v3, :cond_34

    sget-object v3, Lkjq;->n:Lkiy;

    invoke-virtual {v2, v3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v2

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v14, :cond_32

    sget-object v12, Lznz;->c:Lznz;

    goto :goto_1d

    :cond_32
    const/4 v3, 0x2

    if-ne v2, v3, :cond_34

    sget-object v12, Lznz;->f:Lznz;

    goto :goto_1d

    :cond_33
    :goto_1c
    sget-object v3, Lkjq;->aJ:Lkiz;

    invoke-virtual {v2, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    if-eqz v3, :cond_35

    iget-boolean v3, v10, Lmmp;->c:Z

    if-eqz v3, :cond_34

    goto :goto_1e

    :cond_34
    :goto_1d
    const/4 v14, 0x0

    goto/16 :goto_25

    :cond_35
    :goto_1e
    sget-object v3, Lkkc;->c:Lkiy;

    invoke-virtual {v2, v3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v3

    invoke-virtual {v3}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sget-object v14, Lkkc;->h:Lkiy;

    invoke-virtual {v2, v14}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v14

    move/from16 p14, v1

    new-instance v1, Lmmo;

    invoke-direct {v1, v3}, Lmmo;-><init>(I)V

    invoke-virtual {v14}, Lj$/util/Optional;->isPresent()Z

    move-result v3

    move-object/from16 p17, v12

    const/4 v12, 0x1

    if-eq v12, v3, :cond_36

    :goto_1f
    const/4 v1, 0x0

    goto :goto_21

    :cond_36
    invoke-virtual {v14}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v3

    iget v1, v1, Lmmo;->a:I

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v3, v1, :cond_37

    const/4 v1, 0x1

    goto :goto_20

    :cond_37
    const/4 v1, 0x0

    :goto_20
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v14

    goto :goto_1f

    :goto_21
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v14, v3}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-boolean v3, v10, Lmmp;->d:Z

    if-eqz v3, :cond_39

    if-eqz v1, :cond_38

    iget-boolean v1, v10, Lmmp;->e:Z

    if-eqz v1, :cond_39

    :cond_38
    const/4 v1, 0x1

    goto :goto_22

    :cond_39
    const/4 v1, 0x0

    :goto_22
    iget-boolean v3, v10, Lmmp;->h:Z

    if-eqz v3, :cond_3a

    iget-boolean v3, v10, Lmmp;->e:Z

    if-nez v3, :cond_3a

    if-nez v1, :cond_3a

    iget-boolean v1, v10, Lmmp;->b:Z

    if-nez v1, :cond_3a

    iget-object v1, v10, Lmmp;->g:Lufv;

    invoke-interface {v1}, Lufv;->d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3a

    sget-object v1, Lznz;->e:Lznz;

    goto :goto_23

    :cond_3a
    sget-object v1, Lkjq;->aG:Lkiz;

    invoke-virtual {v2, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_3b

    iget-boolean v1, v10, Lmmp;->e:Z

    if-nez v1, :cond_3b

    iget-boolean v1, v10, Lmmp;->d:Z

    if-nez v1, :cond_3b

    iget-boolean v1, v10, Lmmp;->f:Z

    if-nez v1, :cond_3b

    sget-object v1, Lznz;->d:Lznz;

    goto :goto_23

    :cond_3b
    sget-object v1, Lkjq;->aF:Lkiz;

    invoke-virtual {v2, v1}, Lklm;->q(Lkiz;)Z

    move-result v1

    if-eqz v1, :cond_3c

    sget-object v1, Lznz;->b:Lznz;

    :goto_23
    move-object v12, v1

    goto :goto_24

    :cond_3c
    move-object/from16 v12, p17

    :goto_24
    move/from16 v1, p14

    goto/16 :goto_1d

    :goto_25
    new-instance v2, Lmmn;

    invoke-direct {v2, v12, v14}, Lmmn;-><init>(Lznz;Z)V

    goto :goto_26

    :cond_3d
    move/from16 p7, v1

    const/4 v10, 0x1

    xor-int/lit8 v1, v3, 0x1

    sget-object v2, Lznz;->a:Lznz;

    new-instance v3, Lmmn;

    const/4 v10, 0x0

    invoke-direct {v3, v2, v10}, Lmmn;-><init>(Lznz;Z)V

    move-object v2, v3

    :goto_26
    move-object/from16 p14, v15

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-boolean v3, v2, Lmmn;->b:Z

    invoke-static {v14, v15, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_force_pecan_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    iget-object v2, v2, Lmmn;->a:Lznz;

    iget v2, v2, Lznz;->h:I

    invoke-static {v14, v15, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_pecan_model_type_set(JLcom/google/googlex/gcam/ShotParams;I)V

    const-string v2, "mergeMethodSelection"

    invoke-interface {v6, v2}, Lulx;->h(Ljava/lang/String;)V

    iget-object v2, v0, Lmla;->C:Lufv;

    invoke-interface {v2}, Lufv;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual/range {p4 .. p4}, Lcom/google/googlex/gcam/StaticMetadata;->d()Lzmz;

    move-result-object v3

    iget v3, v3, Lzmz;->k:I

    invoke-static {v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->IsQuadBayer(I)Z

    move-result v3

    sget-object v10, Lkjq;->am:Lkiz;

    invoke-virtual {v11, v10}, Lklm;->q(Lkiz;)Z

    move-result v10

    if-eqz p8, :cond_3e

    if-nez v16, :cond_3e

    const/4 v12, 0x1

    goto :goto_27

    :cond_3e
    const/4 v12, 0x0

    :goto_27
    if-eqz p13, :cond_40

    sget-object v14, Lzoi;->o:Lzoi;

    if-eq v13, v14, :cond_3f

    sget-object v14, Lzoi;->n:Lzoi;

    if-eq v13, v14, :cond_3f

    sget-object v14, Lzoi;->r:Lzoi;

    if-ne v13, v14, :cond_40

    :cond_3f
    const/4 v14, 0x1

    goto :goto_28

    :cond_40
    const/4 v14, 0x0

    :goto_28
    if-eqz v10, :cond_42

    if-nez v14, :cond_42

    int-to-float v8, v8

    int-to-float v7, v7

    div-float/2addr v7, v8

    const/high16 v8, 0x40100000    # 2.25f

    cmpl-float v7, v7, v8

    if-gez v7, :cond_41

    if-eqz v12, :cond_42

    :cond_41
    iget-object v7, v0, Lmla;->S:Lsql;

    sget-object v8, Lsql;->k:Lsql;

    invoke-virtual {v7, v8}, Lsql;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_42

    goto :goto_29

    :cond_42
    if-eqz v3, :cond_43

    :goto_29
    const/4 v7, 0x1

    goto :goto_2a

    :cond_43
    const/4 v7, 0x0

    :goto_2a
    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v14, v15, v9, v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_allow_spatial_rgb_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    if-eqz v3, :cond_44

    sget-object v7, Lznw;->d:Lznw;

    invoke-virtual {v9, v7}, Lcom/google/googlex/gcam/ShotParams;->g(Lznw;)V

    goto :goto_2b

    :cond_44
    sget-object v7, Lkjq;->an:Lkiz;

    invoke-virtual {v11, v7}, Lklm;->q(Lkiz;)Z

    move-result v7

    if-eqz v7, :cond_45

    sget-object v7, Lznw;->a:Lznw;

    invoke-virtual {v9, v7}, Lcom/google/googlex/gcam/ShotParams;->g(Lznw;)V

    :cond_45
    :goto_2b
    const-string v7, "shasta"

    invoke-interface {v6, v7}, Lulx;->h(Ljava/lang/String;)V

    sget-object v7, Lmlt;->a:Lmlt;

    invoke-virtual {v4, v7}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_49

    sget-object v8, Lmlt;->e:Lmlt;

    invoke-virtual {v4, v8}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_46

    goto :goto_2c

    :cond_46
    if-eqz p10, :cond_47

    sget-object v8, Lkjq;->ag:Lkiz;

    invoke-virtual {v11, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    goto :goto_2d

    :cond_47
    move-object/from16 v8, p23

    invoke-virtual {v4, v8}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_48

    sget-object v8, Lkkn;->ab:Lkiz;

    invoke-virtual {v11, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    goto :goto_2d

    :cond_48
    const/4 v8, 0x0

    goto :goto_2d

    :cond_49
    :goto_2c
    sget-object v8, Lkjq;->ah:Lkiz;

    invoke-virtual {v11, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    :goto_2d
    invoke-virtual {v9, v8}, Lcom/google/googlex/gcam/ShotParams;->k(Z)V

    if-eqz p10, :cond_4c

    const-string v8, "nightSight"

    invoke-interface {v6, v8}, Lulx;->h(Ljava/lang/String;)V

    iget-object v8, v0, Lmla;->m:Lmix;

    iget-boolean v8, v8, Lmix;->h:Z

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    const/4 v10, 0x1

    invoke-static {v14, v15, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_motion_ef_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    if-eqz p7, :cond_4c

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v14, v15, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_device_is_on_tripod_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    if-eqz p9, :cond_4b

    iget-wide v14, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v14, v15, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_downsample_by_2_before_merge_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-object v8, v0, Lmla;->t:Lulc;

    sget-object v10, Luko;->b:Luko;

    invoke-static {v8}, Luko;->i(Lulc;)Luko;

    move-result-object v8

    invoke-virtual {v10, v8}, Luko;->l(Luko;)Z

    move-result v8

    if-eqz v8, :cond_4a

    sget-object v8, Lmla;->b:Lulc;

    goto :goto_2e

    :cond_4a
    sget-object v8, Lmla;->c:Lulc;

    :goto_2e
    invoke-virtual {v9}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v10

    iget v12, v8, Lulc;->a:I

    invoke-virtual {v10, v12}, Lcom/google/googlex/gcam/AeShotParams;->n(I)V

    invoke-virtual {v9}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v10

    iget v8, v8, Lulc;->b:I

    invoke-virtual {v10, v8}, Lcom/google/googlex/gcam/AeShotParams;->m(I)V

    :cond_4b
    const/4 v8, 0x0

    invoke-virtual {v9, v8}, Lcom/google/googlex/gcam/ShotParams;->k(Z)V

    :cond_4c
    invoke-interface/range {v17 .. v17}, Lufv;->d()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lnqm;

    iget-object v8, v8, Lnqm;->g:Lj$/util/Optional;

    invoke-virtual {v8}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    if-nez v8, :cond_4e

    invoke-interface/range {v17 .. v17}, Lufv;->d()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lnqm;

    iget-object v8, v8, Lnqm;->f:Lj$/util/Optional;

    invoke-virtual {v8}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    if-eqz v8, :cond_4d

    goto :goto_2f

    :cond_4d
    const/4 v8, 0x0

    goto :goto_30

    :cond_4e
    :goto_2f
    const/4 v8, 0x1

    :goto_30
    if-nez p10, :cond_4f

    if-eqz v8, :cond_51

    :cond_4f
    iget-object v8, v0, Lmla;->m:Lmix;

    iget-object v8, v8, Lmix;->m:Lklm;

    sget-object v10, Lkjq;->c:Lkiy;

    invoke-virtual {v8, v10}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v12

    invoke-virtual {v12}, Lj$/util/Optional;->isPresent()Z

    move-result v12

    if-eqz v12, :cond_51

    invoke-virtual {v8, v10}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v8

    invoke-virtual {v8}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-lez v8, :cond_51

    const-string v8, "psaf"

    invoke-interface {v6, v8}, Lulx;->h(Ljava/lang/String;)V

    invoke-virtual {v11, v10}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v8

    move-object/from16 v15, p14

    invoke-virtual {v8, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    move/from16 p4, v2

    move/from16 p8, v3

    iget-wide v2, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v2, v3, v9, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_psaf_frame_count_set(JLcom/google/googlex/gcam/ShotParams;I)V

    sget-object v2, Lkjq;->bs:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v2

    new-instance v3, Llza;

    const/16 v8, 0x13

    invoke-direct {v3, v9, v8}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    const/4 v10, 0x1

    if-ne v10, v8, :cond_50

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Llza;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    check-cast v3, Lcom/google/googlex/gcam/ShotParams;

    move-object/from16 p10, v13

    iget-wide v12, v3, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v3, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_psaf_max_exposure_time_ms_set(JLcom/google/googlex/gcam/ShotParams;F)V

    goto :goto_31

    :cond_50
    move-object/from16 p10, v13

    :goto_31
    sget-object v2, Lkjq;->bt:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v2

    new-instance v3, Llza;

    const/16 v8, 0x14

    invoke-direct {v3, v9, v8}, Llza;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    const/4 v10, 0x1

    if-ne v10, v8, :cond_52

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Llza;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    check-cast v3, Lcom/google/googlex/gcam/ShotParams;

    iget-wide v12, v3, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v3, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_psaf_log_scene_brightness_threshold_override_set(JLcom/google/googlex/gcam/ShotParams;F)V

    goto :goto_32

    :cond_51
    move-object/from16 v15, p14

    move/from16 p4, v2

    move/from16 p8, v3

    move-object/from16 p10, v13

    :cond_52
    :goto_32
    iget-object v2, v0, Lmla;->M:Lmpu;

    invoke-interface {v2}, Lmpu;->g()Z

    move-result v2

    if-eqz v2, :cond_55

    sget-object v2, Lrip;->c:Lrip;

    invoke-direct {v0, v2, v5}, Lmla;->P(Lrip;Lmqa;)Z

    move-result v2

    if-eqz v2, :cond_55

    iget-wide v2, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    const/4 v8, 0x0

    invoke-static {v2, v3, v9, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_gpu_power_boost_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    sget-object v2, Lkjq;->bG:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v2

    new-instance v3, Lmky;

    const/4 v10, 0x1

    invoke-direct {v3, v9, v10}, Lmky;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    if-ne v10, v8, :cond_53

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Lmky;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    check-cast v3, Lcom/google/googlex/gcam/ShotParams;

    iget-wide v12, v3, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v3, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_big_cpu_freq_option_set(JLcom/google/googlex/gcam/ShotParams;F)V

    :cond_53
    sget-object v2, Lkjq;->bH:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v2

    new-instance v3, Lmky;

    const/4 v8, 0x0

    invoke-direct {v3, v9, v8}, Lmky;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    const/4 v10, 0x1

    if-ne v10, v8, :cond_54

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Lmky;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    check-cast v3, Lcom/google/googlex/gcam/ShotParams;

    iget-wide v12, v3, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v3, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_mid_cpu_freq_option_set(JLcom/google/googlex/gcam/ShotParams;F)V

    :cond_54
    sget-object v2, Lkjq;->bI:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v2

    new-instance v3, Lmky;

    const/4 v8, 0x2

    invoke-direct {v3, v9, v8}, Lmky;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v2}, Lj$/util/Optional;->isPresent()Z

    move-result v8

    const/4 v10, 0x1

    if-ne v10, v8, :cond_55

    invoke-virtual {v2}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, v3, Lmky;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    check-cast v3, Lcom/google/googlex/gcam/ShotParams;

    iget-wide v12, v3, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v3, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_little_cpu_freq_option_set(JLcom/google/googlex/gcam/ShotParams;F)V

    :cond_55
    const-string v2, "finalize"

    invoke-interface {v6, v2}, Lulx;->h(Ljava/lang/String;)V

    const/4 v10, 0x1

    if-eq v10, v1, :cond_57

    :goto_33
    move-object/from16 v12, p10

    :cond_56
    const/4 v2, 0x0

    goto/16 :goto_3c

    :cond_57
    if-eq v4, v7, :cond_58

    sget-object v2, Lmlt;->c:Lmlt;

    if-eq v4, v2, :cond_58

    goto :goto_33

    :cond_58
    sget-object v2, Lkjq;->bP:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->x(Lkiz;)Z

    move-result v2

    if-nez v2, :cond_59

    goto :goto_33

    :cond_59
    sget-object v2, Lkjq;->r:Lkiy;

    invoke-virtual {v11, v2}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object v2

    invoke-virtual {v2, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v10, 0x1

    and-int/2addr v3, v10

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x2

    and-int/2addr v7, v8

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v8

    and-int/lit8 v8, v8, 0x4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v2, v2, 0x8

    sget-object v10, Lzoi;->b:Lzoi;

    move-object/from16 v12, p10

    if-eq v12, v10, :cond_5b

    sget-object v10, Lzoi;->f:Lzoi;

    if-eq v12, v10, :cond_5b

    sget-object v10, Lzoi;->d:Lzoi;

    if-ne v12, v10, :cond_5a

    goto :goto_34

    :cond_5a
    move-object/from16 v13, p12

    const/4 v10, 0x0

    goto :goto_35

    :cond_5b
    :goto_34
    move-object/from16 v13, p12

    const/4 v10, 0x1

    :goto_35
    if-eq v12, v13, :cond_5d

    sget-object v13, Lzoi;->k:Lzoi;

    if-eq v12, v13, :cond_5d

    sget-object v13, Lzoi;->m:Lzoi;

    if-ne v12, v13, :cond_5c

    goto :goto_36

    :cond_5c
    const/4 v13, 0x0

    goto :goto_37

    :cond_5d
    :goto_36
    const/4 v13, 0x1

    :goto_37
    sget-object v14, Lzoi;->n:Lzoi;

    if-eq v12, v14, :cond_5f

    sget-object v14, Lzoi;->p:Lzoi;

    if-ne v12, v14, :cond_5e

    goto :goto_38

    :cond_5e
    const/4 v14, 0x0

    goto :goto_39

    :cond_5f
    :goto_38
    const/4 v14, 0x1

    :goto_39
    sget-object v15, Lzoi;->t:Lzoi;

    if-eqz v10, :cond_61

    if-nez v7, :cond_60

    goto :goto_3b

    :cond_60
    :goto_3a
    const/4 v2, 0x1

    goto :goto_3c

    :cond_61
    :goto_3b
    if-eqz v13, :cond_62

    if-nez v3, :cond_60

    :cond_62
    if-eqz v14, :cond_63

    if-nez v8, :cond_60

    :cond_63
    if-ne v12, v15, :cond_56

    if-eqz v2, :cond_56

    goto :goto_3a

    :goto_3c
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_chess_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-object v2, v0, Lmla;->S:Lsql;

    sget-object v3, Lsql;->r:Lsql;

    if-ne v2, v3, :cond_65

    sget-object v3, Lkhu;->a:Ljava/lang/Float;

    :cond_64
    const/4 v3, 0x0

    goto :goto_3d

    :cond_65
    if-eqz p22, :cond_64

    const/4 v3, 0x1

    :goto_3d
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->SetKolaEnabled(JLcom/google/googlex/gcam/ShotParams;Z)V

    invoke-interface/range {p20 .. p20}, Lmtn;->k()Z

    move-result v3

    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_layla_active_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    sget-object v3, Lkjq;->ae:Lkiz;

    invoke-virtual {v11, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    if-eqz v3, :cond_66

    invoke-interface/range {p20 .. p20}, Lmtn;->i()Z

    move-result v3

    if-eqz v3, :cond_66

    const/4 v3, 0x1

    goto :goto_3e

    :cond_66
    const/4 v3, 0x0

    :goto_3e
    sget-object v7, Lkjq;->af:Lkiz;

    invoke-virtual {v11, v7}, Lklm;->q(Lkiz;)Z

    move-result v7

    if-eqz v7, :cond_67

    invoke-interface/range {p20 .. p20}, Lmtn;->r()Z

    move-result v7

    if-eqz v7, :cond_67

    const/4 v7, 0x1

    goto :goto_3f

    :cond_67
    const/4 v7, 0x0

    :goto_3f
    sget-object v8, Lkjq;->ad:Lkiz;

    invoke-virtual {v11, v8}, Lklm;->q(Lkiz;)Z

    move-result v8

    if-nez v8, :cond_69

    if-nez v3, :cond_69

    if-eqz v7, :cond_68

    goto :goto_40

    :cond_68
    const/4 v3, 0x0

    goto :goto_41

    :cond_69
    :goto_40
    const/4 v3, 0x1

    :goto_41
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_eevee_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    sget-object v3, Lkit;->p:Lkiz;

    invoke-virtual {v11, v3}, Lklm;->q(Lkiz;)Z

    move-result v3

    if-eqz v3, :cond_6a

    invoke-virtual {v5}, Lmqa;->a()Lmpz;

    move-result-object v3

    sget-object v7, Lmpz;->d:Lmpz;

    if-ne v3, v7, :cond_6a

    iget v3, v5, Lmqa;->c:I

    const/4 v10, 0x1

    if-ne v3, v10, :cond_6a

    const/4 v3, 0x1

    goto :goto_42

    :cond_6a
    const/4 v3, 0x0

    :goto_42
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_cyclops_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    invoke-virtual {v9}, Lcom/google/googlex/gcam/ShotParams;->b()Lcom/google/googlex/gcam/ArkInfo;

    move-result-object v3

    invoke-virtual {v5}, Lmqa;->a()Lmpz;

    move-result-object v7

    sget-object v8, Lmpz;->b:Lmpz;

    if-eq v7, v8, :cond_6b

    invoke-virtual {v5}, Lmqa;->a()Lmpz;

    move-result-object v7

    sget-object v8, Lmpz;->c:Lmpz;

    if-ne v7, v8, :cond_6c

    :cond_6b
    iget v7, v5, Lmqa;->c:I

    const/4 v10, 0x1

    if-ne v7, v10, :cond_6c

    const/4 v7, 0x1

    goto :goto_43

    :cond_6c
    const/4 v7, 0x0

    :goto_43
    cmpg-float v8, p4, p5

    if-ltz v8, :cond_6e

    sget-object v8, Lsql;->g:Lsql;

    if-ne v2, v8, :cond_6d

    cmpg-float v8, p4, p11

    if-gez v8, :cond_6d

    goto :goto_44

    :cond_6d
    const/4 v8, 0x0

    goto :goto_45

    :cond_6e
    :goto_44
    const/4 v8, 0x1

    :goto_45
    sget-object v10, Lsql;->g:Lsql;

    if-ne v2, v10, :cond_6f

    sget-object v10, Lkkn;->af:Lkiz;

    invoke-virtual {v11, v10}, Lklm;->q(Lkiz;)Z

    move-result v10

    if-eqz v10, :cond_6f

    const/4 v10, 0x1

    goto :goto_46

    :cond_6f
    const/4 v10, 0x0

    :goto_46
    sget-object v13, Lsql;->q:Lsql;

    if-ne v2, v13, :cond_70

    sget-object v13, Lkjm;->a:Lkiy;

    :cond_70
    sget-object v13, Lsql;->b:Lsql;

    if-eq v2, v13, :cond_71

    sget-object v13, Lsql;->j:Lsql;

    if-eq v2, v13, :cond_71

    if-nez v10, :cond_71

    goto/16 :goto_4a

    :cond_71
    invoke-virtual {v3}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v10

    sget-object v13, Lznf;->e:Lznf;

    if-eq v10, v13, :cond_78

    invoke-virtual {v3}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v10

    sget-object v13, Lznf;->c:Lznf;

    if-eq v10, v13, :cond_78

    invoke-virtual {v3}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v10

    move-object/from16 v13, p2

    if-eq v10, v13, :cond_78

    iget-wide v13, v3, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v13, v14, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_focus_mode_get(JLcom/google/googlex/gcam/ArkInfo;)I

    move-result v10

    sget-object v13, Lznk;->d:[Lznk;

    const/4 v14, 0x3

    if-ge v10, v14, :cond_73

    if-ltz v10, :cond_73

    aget-object v15, v13, v10

    iget v14, v15, Lznk;->e:I

    if-ne v14, v10, :cond_72

    move-object/from16 v16, v2

    goto :goto_49

    :cond_72
    const/4 v14, 0x0

    :goto_47
    const/4 v15, 0x3

    goto :goto_48

    :cond_73
    move v15, v14

    const/4 v14, 0x0

    :goto_48
    if-ge v14, v15, :cond_77

    aget-object v15, v13, v14

    move-object/from16 v16, v2

    iget v2, v15, Lznk;->e:I

    if-ne v2, v10, :cond_76

    :goto_49
    sget-object v2, Lznk;->c:Lznk;

    if-eq v15, v2, :cond_79

    iget-wide v13, v3, Lcom/google/googlex/gcam/ArkInfo;->a:J

    invoke-static {v13, v14, v3}, Lcom/google/googlex/gcam/GcamModuleJNI;->ArkInfo_white_balance_factor_get(JLcom/google/googlex/gcam/ArkInfo;)F

    move-result v2

    float-to-double v13, v2

    const-wide/high16 v17, -0x4010000000000000L    # -1.0

    cmpl-double v2, v13, v17

    if-nez v2, :cond_79

    invoke-virtual {v3}, Lcom/google/googlex/gcam/ArkInfo;->a()F

    move-result v2

    float-to-double v13, v2

    cmpl-double v2, v13, v17

    if-nez v2, :cond_79

    invoke-virtual {v3}, Lcom/google/googlex/gcam/ArkInfo;->d()F

    move-result v2

    float-to-double v2, v2

    cmpl-double v2, v2, v17

    if-eqz v2, :cond_74

    goto :goto_4b

    :cond_74
    if-nez p7, :cond_79

    if-nez p8, :cond_79

    sget-object v2, Lzoi;->b:Lzoi;

    if-eq v12, v2, :cond_75

    sget-object v2, Lzoi;->f:Lzoi;

    if-ne v12, v2, :cond_79

    :cond_75
    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v2, p4, v2

    if-ltz v2, :cond_79

    if-eqz v8, :cond_79

    if-nez v7, :cond_79

    sget-object v2, Lkjq;->au:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_79

    const/4 v2, 0x1

    goto :goto_4c

    :cond_76
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v2, v16

    goto :goto_47

    :cond_77
    const-class v0, Lznk;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No enum "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " with value "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_78
    :goto_4a
    move-object/from16 v16, v2

    :cond_79
    :goto_4b
    const/4 v2, 0x0

    :goto_4c
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_bento_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    sget-object v2, Lkjq;->bo:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_7a

    invoke-virtual/range {v16 .. v16}, Lsql;->f()Z

    move-result v2

    if-eqz v2, :cond_7a

    const/4 v2, 0x1

    goto :goto_4d

    :cond_7a
    const/4 v2, 0x0

    :goto_4d
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_nighthawk_nonlinear_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    sget-object v2, Lkjq;->bp:Lkiz;

    invoke-virtual {v11, v2}, Lklm;->q(Lkiz;)Z

    move-result v2

    if-eqz v2, :cond_7b

    invoke-virtual/range {v16 .. v16}, Lsql;->f()Z

    move-result v2

    if-eqz v2, :cond_7b

    const/4 v2, 0x1

    goto :goto_4e

    :cond_7b
    const/4 v2, 0x0

    :goto_4e
    iget-wide v7, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v7, v8, v9, v2}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_nighthawk_linear_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    sget-object v2, Lmlt;->e:Lmlt;

    invoke-virtual {v4, v2}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7c

    iget-wide v2, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    const/4 v8, 0x0

    invoke-static {v2, v3, v9, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_extra_finish_vignetting_enabled_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v2, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    const/4 v10, 0x1

    invoke-static {v2, v3, v9, v10}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_apply_sgm_in_raw_to_yuv_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    iget-wide v2, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v2, v3, v9, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_apply_sgm_spatially_varying_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    :cond_7c
    invoke-static {v5}, Lmla;->Q(Lmqa;)Z

    move-result v2

    if-eqz v2, :cond_7d

    invoke-virtual {v9}, Lcom/google/googlex/gcam/ShotParams;->n()V

    sget-object v0, Lznw;->d:Lznw;

    invoke-virtual {v9, v0}, Lcom/google/googlex/gcam/ShotParams;->g(Lznw;)V

    goto :goto_4f

    :cond_7d
    invoke-interface/range {p20 .. p20}, Lmtn;->f()Z

    move-result v2

    move-object/from16 v3, p3

    invoke-direct {v0, v2, v3}, Lmla;->R(ZLpci;)Z

    move-result v0

    if-eqz v0, :cond_7e

    sget-object v0, Lznw;->e:Lznw;

    invoke-virtual {v9, v0}, Lcom/google/googlex/gcam/ShotParams;->g(Lznw;)V

    :cond_7e
    :goto_4f
    iget v0, v5, Lmqa;->c:I

    const/4 v10, 0x1

    if-ne v0, v10, :cond_7f

    invoke-virtual {v5}, Lmqa;->a()Lmpz;

    move-result-object v0

    sget-object v2, Lmpz;->h:Lmpz;

    if-ne v0, v2, :cond_7f

    invoke-virtual {v9}, Lcom/google/googlex/gcam/ShotParams;->n()V

    iget-wide v2, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    const/4 v8, 0x0

    invoke-static {v2, v3, v9, v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_crop_merged_output_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    :cond_7f
    if-eq v10, v1, :cond_80

    sget-object v0, Lkkq;->m:Lkiz;

    invoke-virtual {v11, v0}, Lklm;->q(Lkiz;)Z

    move-result v0

    iget-wide v1, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v1, v2, v9, v0}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_delay_merge_when_finishing_set(JLcom/google/googlex/gcam/ShotParams;Z)V

    :cond_80
    invoke-interface {v6}, Lulx;->g()V

    return-object v9

    :cond_81
    const/4 v1, 0x0

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final a(Luuv;)I
    .locals 1

    iget-object v0, p0, Lmla;->I:Luut;

    invoke-interface {v0, p1}, Luut;->a(Luuv;)Luus;

    move-result-object p1

    invoke-static {p1}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->t(Luus;)Lzoi;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmla;->b(Lzoi;)I

    move-result p0

    return p0
.end method

.method public final b(Lzoi;)I
    .locals 2

    iget-object p0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {p0}, Lcom/google/googlex/gcam/Gcam;->g()Z

    move-result v0

    invoke-static {v0}, Lyny;->aZ(Z)V

    iget p1, p1, Lzoi;->z:I

    iget-wide v0, p0, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v0, v1, p0, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_FindFirstCamera(JLcom/google/googlex/gcam/Gcam;I)I

    move-result p0

    if-ltz p0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Lyny;->aZ(Z)V

    return p0
.end method

.method public final c(Luzj;Luuv;)I
    .locals 1

    iget-object v0, p0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v0, p1, p2}, Lzsn;->u(Luzj;Luuv;)Lzoi;

    move-result-object p1

    invoke-virtual {p0, p1}, Lmla;->b(Lzoi;)I

    move-result p0

    return p0
.end method

.method public final d(Luzo;Luzj;ZLulc;)Lmlu;
    .locals 10

    invoke-interface {p2}, Luzj;->b()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {p2, v0}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lmla;->r:Lzsl;

    invoke-interface {p1}, Luzo;->b()I

    move-result v2

    invoke-virtual {v0, v2}, Lzsl;->d(I)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, p1}, Lzsl;->b(Luzo;)Lcom/google/googlex/gcam/RawWriteView;

    move-result-object v1

    :cond_1
    invoke-interface {p2}, Luzj;->b()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Luuv;->b(Ljava/lang/String;)Luuv;

    move-result-object v3

    const/4 p1, 0x1

    invoke-virtual {p0, p2, v3, p1}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v6

    iget-object v2, p0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v2, p2}, Lzsn;->v(Luzj;)Lcom/google/googlex/gcam/SpatialGainMap;

    move-result-object v7

    sget-object p1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {p2, p1}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v2, p1}, Lzsn;->a(I)F

    move-result p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p3, v0}, Lmla;->L(FZZ)Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v8

    new-instance v4, Lmlu;

    invoke-static {v1}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v5

    invoke-virtual {v6}, Lcom/google/googlex/gcam/FrameMetadata;->b()F

    move-result p1

    invoke-virtual {v6}, Lcom/google/googlex/gcam/FrameMetadata;->a()F

    move-result p3

    mul-float/2addr p1, p3

    iget-wide v0, v6, Lcom/google/googlex/gcam/FrameMetadata;->a:J

    invoke-static {v0, v1, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->FrameMetadata_applied_digital_gain_get(JLcom/google/googlex/gcam/FrameMetadata;)F

    move-result p3

    mul-float/2addr p1, p3

    iget-wide v0, v6, Lcom/google/googlex/gcam/FrameMetadata;->a:J

    invoke-static {v0, v1, v6}, Lcom/google/googlex/gcam/GcamModuleJNI;->FrameMetadata_post_raw_digital_gain_get(JLcom/google/googlex/gcam/FrameMetadata;)F

    move-result p3

    mul-float v9, p1, p3

    invoke-direct/range {v4 .. v9}, Lmlu;-><init>(Lj$/util/Optional;Lcom/google/googlex/gcam/FrameMetadata;Lcom/google/googlex/gcam/SpatialGainMap;Lcom/google/googlex/gcam/AeShotParams;F)V

    move-object p1, v4

    iget-object v4, p1, Lmlu;->d:Lcom/google/googlex/gcam/AeShotParams;

    iget-object p0, p0, Lmla;->m:Lmix;

    iget v6, p0, Lmix;->i:F

    const/4 v8, 0x0

    move-object v5, p2

    move-object v7, p4

    invoke-virtual/range {v2 .. v8}, Lzsn;->F(Luuv;Lcom/google/googlex/gcam/AeShotParams;Luzj;FLulc;Z)V

    return-object p1

    :cond_2
    :goto_0
    return-object v1
.end method

.method public final e(Lmlu;)Lcom/google/googlex/gcam/AeResults;
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v1, Lmlu;->a:Lj$/util/Optional;

    invoke-virtual {v2}, Lj$/util/Optional;->orElseThrow()Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/google/googlex/gcam/RawReadView;

    iget-object v2, v1, Lmlu;->b:Lcom/google/googlex/gcam/FrameMetadata;

    invoke-virtual {v2}, Lcom/google/googlex/gcam/FrameMetadata;->u()Lzoi;

    move-result-object v3

    invoke-virtual {v0, v3}, Lmla;->b(Lzoi;)I

    move-result v3

    iget-object v0, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/Gcam;->c(I)Lcom/google/googlex/gcam/StaticMetadata;

    move-result-object v5

    invoke-virtual {v0, v3}, Lcom/google/googlex/gcam/Gcam;->d(I)Lcom/google/googlex/gcam/Tuning;

    move-result-object v8

    new-instance v0, Lcom/google/googlex/gcam/AeResults;

    invoke-static {v5}, Lcom/google/googlex/gcam/StaticMetadata;->c(Lcom/google/googlex/gcam/StaticMetadata;)J

    move-result-wide v3

    iget-wide v6, v8, Lcom/google/googlex/gcam/Tuning;->a:J

    iget-object v11, v1, Lmlu;->d:Lcom/google/googlex/gcam/AeShotParams;

    iget-wide v9, v11, Lcom/google/googlex/gcam/AeShotParams;->a:J

    invoke-static {v14}, Lcom/google/googlex/gcam/RawReadView;->c(Lcom/google/googlex/gcam/RawReadView;)J

    move-result-wide v12

    iget-object v1, v1, Lmlu;->c:Lcom/google/googlex/gcam/SpatialGainMap;

    invoke-static {v2}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v15

    invoke-static {v1}, Lcom/google/googlex/gcam/SpatialGainMap;->a(Lcom/google/googlex/gcam/SpatialGainMap;)J

    move-result-wide v18

    const/16 v21, 0x0

    move-object/from16 v20, v1

    move-object/from16 v17, v2

    invoke-static/range {v3 .. v21}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_ComputeAeResults(JLcom/google/googlex/gcam/StaticMetadata;JLcom/google/googlex/gcam/Tuning;JLcom/google/googlex/gcam/AeShotParams;JLcom/google/googlex/gcam/RawReadView;JLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/SpatialGainMap;Z)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/googlex/gcam/AeResults;-><init>(JZ)V

    return-object v0
.end method

.method public final f(Lmnk;Luzo;Luzj;Lxwg;Lj$/util/Optional;)Lcom/google/googlex/gcam/BurstSpec;
    .locals 18

    move-object/from16 v0, p0

    invoke-direct {v0}, Lmla;->M()V

    move-object/from16 v1, p1

    iget-boolean v2, v1, Lmnk;->r:Z

    iget-object v3, v0, Lmla;->t:Lulc;

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-virtual {v0, v4, v5, v2, v3}, Lmla;->d(Luzo;Luzj;ZLulc;)Lmlu;

    move-result-object v2

    if-nez v2, :cond_0

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v1, 0xc3f

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "buildAfBurstSpec failed due to incomplete viewfinder frame. Out of memory?"

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    new-instance v0, Lcom/google/googlex/gcam/BurstSpec;

    invoke-direct {v0}, Lcom/google/googlex/gcam/BurstSpec;-><init>()V

    return-object v0

    :cond_0
    iget-object v3, v2, Lmlu;->a:Lj$/util/Optional;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lcom/google/googlex/gcam/RawWriteView;

    if-nez v10, :cond_1

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v1, 0xc3e

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "buildAfBurstSpec failed due to missing viewfinder image."

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    new-instance v0, Lcom/google/googlex/gcam/BurstSpec;

    invoke-direct {v0}, Lcom/google/googlex/gcam/BurstSpec;-><init>()V

    return-object v0

    :cond_1
    iget-object v13, v2, Lmlu;->b:Lcom/google/googlex/gcam/FrameMetadata;

    invoke-virtual/range {p4 .. p4}, Lxwg;->h()Z

    move-result v3

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->h()Lcom/google/googlex/gcam/AfMetadata;

    move-result-object v4

    if-eqz v3, :cond_4

    invoke-virtual {v4}, Lcom/google/googlex/gcam/AfMetadata;->a()Lzmu;

    invoke-virtual/range {p4 .. p4}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Luzc;

    sget-object v5, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v3, v5}, Luzc;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    if-eqz v5, :cond_2

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Lzmt;->a(I)Lzmt;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/googlex/gcam/AfMetadata;->c(Lzmt;)V

    :cond_2
    sget-object v5, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v3, v5}, Luzc;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Lzmu;->a(I)Lzmu;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/googlex/gcam/AfMetadata;->d(Lzmu;)V

    :cond_3
    sget-object v5, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v3, v5}, Luzc;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lzmv;->a(I)Lzmv;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/google/googlex/gcam/AfMetadata;->e(Lzmv;)V

    :cond_4
    iget-object v6, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {v1}, Lmnk;->a()I

    move-result v7

    iget-object v0, v2, Lmlu;->c:Lcom/google/googlex/gcam/SpatialGainMap;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    move-object/from16 v2, p5

    invoke-virtual {v2, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v17

    new-instance v1, Lcom/google/googlex/gcam/BurstSpec;

    iget-wide v4, v6, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v10}, Lcom/google/googlex/gcam/RawReadView;->c(Lcom/google/googlex/gcam/RawReadView;)J

    move-result-wide v8

    invoke-static {v13}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v11

    invoke-static {v0}, Lcom/google/googlex/gcam/SpatialGainMap;->a(Lcom/google/googlex/gcam/SpatialGainMap;)J

    move-result-wide v14

    move-object/from16 v16, v0

    invoke-static/range {v4 .. v17}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_BuildAfBurstSpec(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/RawReadView;JLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/SpatialGainMap;F)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lcom/google/googlex/gcam/BurstSpec;-><init>(J)V

    return-object v1
.end method

.method public final g(Lmnk;Luzj;Lcom/google/googlex/gcam/BurstSpec;)Lcom/google/googlex/gcam/BurstSpec;
    .locals 12

    invoke-direct {p0}, Lmla;->M()V

    invoke-interface {p2}, Luzj;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Luuv;->b(Ljava/lang/String;)Luuv;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p2, v0, v1}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v8

    iget-object v4, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {p1}, Lmnk;->a()I

    move-result v5

    new-instance p0, Lcom/google/googlex/gcam/BurstSpec;

    iget-wide v2, v4, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v8}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v6

    invoke-static {p3}, Lcom/google/googlex/gcam/BurstSpec;->b(Lcom/google/googlex/gcam/BurstSpec;)J

    move-result-wide v9

    move-object v11, p3

    invoke-static/range {v2 .. v11}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_BuildMetadataBurstSpec(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/BurstSpec;)J

    move-result-wide p1

    invoke-direct {p0, p1, p2}, Lcom/google/googlex/gcam/BurstSpec;-><init>(J)V

    return-object p0
.end method

.method public final h(Lmnk;Luzo;Luzj;ZZLmnv;Lj$/util/Optional;Lj$/util/Optional;)Lcom/google/googlex/gcam/BurstSpec;
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0}, Lmla;->M()V

    iget-object v2, v0, Lmla;->e:Lulx;

    const-string v3, "convertFrame"

    invoke-interface {v2, v3}, Lulx;->f(Ljava/lang/String;)V

    iget-boolean v3, v1, Lmnk;->r:Z

    iget-object v4, v0, Lmla;->t:Lulc;

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-virtual {v0, v5, v6, v3, v4}, Lmla;->d(Luzo;Luzj;ZLulc;)Lmlu;

    move-result-object v3

    const/4 v4, 0x0

    if-nez p5, :cond_1

    iget-object v6, v0, Lmla;->ab:Lklm;

    sget-object v7, Lkjq;->aB:Lkiz;

    invoke-virtual {v6, v7}, Lklm;->q(Lkiz;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_0

    :cond_0
    move v6, v4

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v6, 0x1

    :goto_1
    if-eqz v3, :cond_d

    if-eqz v6, :cond_2

    iget-object v7, v3, Lmlu;->a:Lj$/util/Optional;

    invoke-virtual {v7}, Lj$/util/Optional;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v1, 0xc43

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "buildPayloadBurstSpec failed due to missing viewfinder image."

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    new-instance v0, Lcom/google/googlex/gcam/BurstSpec;

    invoke-direct {v0}, Lcom/google/googlex/gcam/BurstSpec;-><init>()V

    return-object v0

    :cond_2
    invoke-virtual {v1}, Lmnk;->b()Lcom/google/googlex/gcam/ShotParams;

    move-result-object v7

    const-string v8, "setOptions"

    invoke-interface {v2, v8}, Lulx;->h(Ljava/lang/String;)V

    iget-object v8, v0, Lmla;->K:Lmhr;

    move/from16 v9, p4

    iput-boolean v9, v8, Lmhr;->a:Z

    iput-boolean v6, v8, Lmhr;->b:Z

    invoke-virtual {v1}, Lmnk;->e()Z

    move-result v6

    iput-boolean v6, v8, Lmhr;->c:Z

    iget-object v6, v0, Lmla;->p:Lmlt;

    sget-object v9, Lmlt;->b:Lmlt;

    invoke-virtual {v6, v9}, Lmlt;->equals(Ljava/lang/Object;)Z

    move-result v6

    iput-boolean v6, v8, Lmhr;->d:Z

    invoke-virtual {v7}, Lcom/google/googlex/gcam/ShotParams;->m()Z

    move-result v6

    iput-boolean v6, v8, Lmhr;->e:Z

    iget-object v6, v0, Lmla;->B:Lmkq;

    iget-object v6, v6, Lmkq;->b:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    sget-wide v11, Lmkq;->a:J

    cmp-long v9, v9, v11

    if-ltz v9, :cond_3

    const/4 v6, 0x1

    goto :goto_2

    :cond_4
    move v6, v4

    :goto_2
    iput-boolean v6, v8, Lmhr;->f:Z

    move-object/from16 v6, p6

    check-cast v6, Lmio;

    iget-object v6, v6, Lmio;->k:Lmtn;

    check-cast v6, Lmmk;

    iget-boolean v9, v6, Lmmk;->b:Z

    iput-boolean v9, v8, Lmhr;->g:Z

    invoke-virtual {v7}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/googlex/gcam/AeShotParams;->a()Lzmw;

    move-result-object v9

    sget-object v10, Lzmw;->d:Lzmw;

    if-ne v9, v10, :cond_5

    const/4 v9, 0x1

    goto :goto_3

    :cond_5
    move v9, v4

    :goto_3
    iput-boolean v9, v8, Lmhr;->h:Z

    move-object/from16 v9, p7

    iput-object v9, v8, Lmhr;->p:Lj$/util/Optional;

    iget-boolean v9, v6, Lmmk;->j:Z

    iput-boolean v9, v8, Lmhr;->i:Z

    iget-boolean v9, v6, Lmmk;->m:Z

    iput-boolean v9, v8, Lmhr;->j:Z

    iget-boolean v6, v6, Lmmk;->l:Z

    iput-boolean v6, v8, Lmhr;->k:Z

    invoke-virtual {v7}, Lcom/google/googlex/gcam/ShotParams;->b()Lcom/google/googlex/gcam/ArkInfo;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/googlex/gcam/ArkInfo;->b()F

    move-result v6

    iput v6, v8, Lmhr;->n:F

    invoke-virtual {v7}, Lcom/google/googlex/gcam/ShotParams;->b()Lcom/google/googlex/gcam/ArkInfo;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/googlex/gcam/ArkInfo;->c()F

    move-result v6

    iput v6, v8, Lmhr;->o:F

    move-object/from16 v6, p8

    iput-object v6, v8, Lmhr;->q:Lj$/util/Optional;

    iget-object v6, v1, Lmnk;->t:Lmqa;

    invoke-static {v6}, Lmla;->Q(Lmqa;)Z

    move-result v6

    if-nez v6, :cond_7

    iget-object v6, v0, Lmla;->N:Lmmj;

    iget-object v9, v0, Lmla;->J:Lpch;

    invoke-virtual {v6}, Lmmj;->f()Z

    move-result v6

    invoke-virtual {v9}, Lugo;->d()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lpci;

    invoke-direct {v0, v6, v9}, Lmla;->R(ZLpci;)Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_4

    :cond_6
    move v6, v4

    goto :goto_5

    :cond_7
    :goto_4
    const/4 v6, 0x1

    :goto_5
    iput-boolean v6, v8, Lmhr;->l:Z

    iget-object v6, v0, Lmla;->N:Lmmj;

    invoke-virtual {v6}, Lmmj;->n()Z

    move-result v6

    iput-boolean v6, v8, Lmhr;->m:Z

    invoke-virtual {v8}, Lmhr;->a()Lcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;

    move-result-object v6

    iget-object v8, v0, Lmla;->ab:Lklm;

    sget-object v9, Lkjq;->a:Lkiy;

    iget-wide v9, v6, Lcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;->a:J

    invoke-static {v9, v10, v6, v4}, Lcom/google/googlex/gcam/GcamModuleJNI;->BuildPayloadBurstSpecOptions_ultra_short_first_set(JLcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;Z)V

    invoke-virtual {v7}, Lcom/google/googlex/gcam/ShotParams;->l()Z

    move-result v9

    iget-wide v10, v6, Lcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;->a:J

    invoke-static {v10, v11, v6, v9}, Lcom/google/googlex/gcam/GcamModuleJNI;->BuildPayloadBurstSpecOptions_cyclops_enabled_set(JLcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;Z)V

    const-string v9, "computeSpec"

    invoke-interface {v2, v9}, Lulx;->h(Ljava/lang/String;)V

    iget-object v9, v3, Lmlu;->a:Lj$/util/Optional;

    invoke-virtual {v9}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    iget-object v11, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    if-eqz v10, :cond_8

    invoke-virtual {v1}, Lmnk;->a()I

    move-result v12

    invoke-virtual {v9}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Lcom/google/googlex/gcam/RawReadView;

    iget-object v0, v3, Lmlu;->b:Lcom/google/googlex/gcam/FrameMetadata;

    iget-object v1, v3, Lmlu;->c:Lcom/google/googlex/gcam/SpatialGainMap;

    new-instance v3, Lcom/google/googlex/gcam/BurstSpec;

    iget-wide v9, v11, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v15}, Lcom/google/googlex/gcam/RawReadView;->c(Lcom/google/googlex/gcam/RawReadView;)J

    move-result-wide v13

    invoke-static {v0}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v16

    invoke-static {v1}, Lcom/google/googlex/gcam/SpatialGainMap;->a(Lcom/google/googlex/gcam/SpatialGainMap;)J

    move-result-wide v19

    iget-wide v4, v6, Lcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;->a:J

    move-object/from16 v18, v0

    move-object/from16 v21, v1

    move-wide/from16 v22, v4

    move-object/from16 v24, v6

    invoke-static/range {v9 .. v24}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_BuildPayloadBurstSpec__SWIG_0(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/RawReadView;JLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/SpatialGainMap;JLcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;)J

    move-result-wide v0

    invoke-direct {v3, v0, v1}, Lcom/google/googlex/gcam/BurstSpec;-><init>(J)V

    goto :goto_6

    :cond_8
    move-object v0, v6

    invoke-virtual {v1}, Lmnk;->a()I

    move-result v12

    iget-object v15, v3, Lmlu;->b:Lcom/google/googlex/gcam/FrameMetadata;

    new-instance v3, Lcom/google/googlex/gcam/BurstSpec;

    iget-wide v9, v11, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v15}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v13

    iget-wide v4, v0, Lcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;->a:J

    move-object/from16 v18, v0

    move-wide/from16 v16, v4

    invoke-static/range {v9 .. v18}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_BuildPayloadBurstSpec__SWIG_1(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/BuildPayloadBurstSpecOptions;)J

    move-result-wide v0

    invoke-direct {v3, v0, v1}, Lcom/google/googlex/gcam/BurstSpec;-><init>(J)V

    :goto_6
    invoke-virtual {v7}, Lcom/google/googlex/gcam/ShotParams;->b()Lcom/google/googlex/gcam/ArkInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v1

    sget-object v4, Lznf;->a:Lznf;

    if-eq v1, v4, :cond_c

    invoke-virtual {v0}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v0

    sget-object v1, Lznf;->b:Lznf;

    if-eq v0, v1, :cond_c

    sget-object v0, Lkko;->g:Lkiz;

    invoke-virtual {v8, v0}, Lklm;->r(Lkiz;)Lj$/util/Optional;

    move-result-object v0

    const v1, 0x7f7fffff    # Float.MAX_VALUE

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    new-instance v4, Lcom/google/googlex/gcam/BurstSpec;

    invoke-direct {v4}, Lcom/google/googlex/gcam/BurstSpec;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_7
    invoke-virtual {v3}, Lcom/google/googlex/gcam/BurstSpec;->c()Lcom/google/googlex/gcam/FrameRequestVector;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/googlex/gcam/FrameRequestVector;->a()J

    move-result-wide v8

    int-to-long v10, v5

    cmp-long v8, v10, v8

    if-gez v8, :cond_b

    invoke-virtual {v3}, Lcom/google/googlex/gcam/BurstSpec;->c()Lcom/google/googlex/gcam/FrameRequestVector;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/google/googlex/gcam/FrameRequestVector;->b(I)Lcom/google/googlex/gcam/FrameRequest;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/googlex/gcam/FrameRequest;->c()Lzna;

    move-result-object v9

    sget-object v10, Lzna;->c:Lzna;

    if-eq v9, v10, :cond_9

    invoke-virtual {v4}, Lcom/google/googlex/gcam/BurstSpec;->c()Lcom/google/googlex/gcam/FrameRequestVector;

    move-result-object v9

    new-instance v10, Lcom/google/googlex/gcam/FrameRequest;

    invoke-direct {v10, v8}, Lcom/google/googlex/gcam/FrameRequest;-><init>(Lcom/google/googlex/gcam/FrameRequest;)V

    invoke-virtual {v9, v10}, Lcom/google/googlex/gcam/FrameRequestVector;->c(Lcom/google/googlex/gcam/FrameRequest;)V

    goto :goto_9

    :cond_9
    invoke-virtual {v8}, Lcom/google/googlex/gcam/FrameRequest;->a()F

    move-result v9

    add-float/2addr v9, v1

    if-eqz v6, :cond_a

    cmpl-float v6, v9, v0

    if-lez v6, :cond_a

    goto :goto_8

    :cond_a
    invoke-virtual {v4}, Lcom/google/googlex/gcam/BurstSpec;->c()Lcom/google/googlex/gcam/FrameRequestVector;

    move-result-object v1

    new-instance v6, Lcom/google/googlex/gcam/FrameRequest;

    invoke-direct {v6, v8}, Lcom/google/googlex/gcam/FrameRequest;-><init>(Lcom/google/googlex/gcam/FrameRequest;)V

    invoke-virtual {v1, v6}, Lcom/google/googlex/gcam/FrameRequestVector;->c(Lcom/google/googlex/gcam/FrameRequest;)V

    move v1, v9

    :goto_8
    const/4 v6, 0x1

    :goto_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    :cond_b
    move-object v3, v4

    :cond_c
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-interface {v2}, Lulx;->g()V

    return-object v3

    :cond_d
    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v1, 0xc42

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "buildPayloadBurstSpec failed due to incomplete viewfinder frame. Out of memory?"

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    new-instance v0, Lcom/google/googlex/gcam/BurstSpec;

    invoke-direct {v0}, Lcom/google/googlex/gcam/BurstSpec;-><init>()V

    return-object v0
.end method

.method public final i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    iget-object v0, v1, Lmla;->ab:Lklm;

    sget-object v4, Lkjq;->ao:Lkiz;

    invoke-virtual {v0, v4}, Lklm;->q(Lkiz;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, v1, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v0, v2, v3}, Lzsn;->r(Luzj;Luuv;)Lcom/google/googlex/gcam/FrameMetadataKey;

    move-result-object v9

    if-nez v9, :cond_1

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    goto :goto_0

    :cond_1
    new-instance v12, Lcom/google/googlex/gcam/FrameMetadata;

    invoke-direct {v12}, Lcom/google/googlex/gcam/FrameMetadata;-><init>()V

    iget-object v6, v1, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v4, v6, Lcom/google/googlex/gcam/Gcam;->a:J

    iget-wide v7, v9, Lcom/google/googlex/gcam/FrameMetadataKey;->a:J

    invoke-static {v12}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v10

    invoke-static/range {v4 .. v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_OverrideFrameMetadata(JLcom/google/googlex/gcam/Gcam;JLcom/google/googlex/gcam/FrameMetadataKey;JLcom/google/googlex/gcam/FrameMetadata;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lj$/util/Optional;->empty()Lj$/util/Optional;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {v12}, Lj$/util/Optional;->of(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Lj$/util/Optional;->isPresent()Z

    move-result v4

    if-nez v4, :cond_9

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz p3, :cond_4

    invoke-static {v3}, Lxwg;->j(Ljava/lang/Object;)Lxwg;

    move-result-object v0

    :try_start_0
    sget-object v6, Landroid/hardware/camera2/CaptureResult;->SENSOR_EXPOSURE_TIME:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v2, v6}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    sget-object v7, Landroid/hardware/camera2/CaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v2, v7}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    if-eqz v6, :cond_4

    if-nez v7, :cond_3

    goto :goto_1

    :cond_3
    iget-object v8, v1, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    check-cast v0, Lxwm;

    iget-object v0, v0, Lxwm;->a:Ljava/lang/Object;

    check-cast v0, Luuv;

    invoke-virtual {v8, v2, v0}, Lzsn;->j(Luzj;Luuv;)Luus;

    move-result-object v0

    invoke-static {v2}, Lzsn;->z(Luzj;)Z

    move-result v8

    invoke-static {v0, v8, v5}, Lzsn;->d(Luus;ZLulc;)J

    move-result-wide v8

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v12
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    add-long/2addr v10, v12

    add-long/2addr v10, v8

    new-instance v0, Lcom/google/googlex/gcam/GyroSampleVector;

    invoke-direct {v0}, Lcom/google/googlex/gcam/GyroSampleVector;-><init>()V

    iget-object v6, v1, Lmla;->x:Ladbv;

    invoke-interface {v6}, Ladbv;->a()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lxwg;

    invoke-virtual {v6}, Lxwg;->h()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v6}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Luwi;

    iget-object v6, v1, Lmla;->e:Lulx;

    const-string v8, "gyro"

    invoke-interface {v6, v8}, Lulx;->f(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    const-wide/32 v13, -0x4c4b40

    add-long/2addr v13, v7

    const-wide/32 v7, 0x4c4b40

    add-long v15, v10, v7

    new-instance v7, Lmkv;

    invoke-direct {v7, v0, v4}, Lmkv;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v17, v7

    invoke-interface/range {v12 .. v17}, Luwi;->b(JJLuwh;)V

    invoke-interface {v6}, Lulx;->g()V

    goto :goto_2

    :catch_0
    move-exception v0

    sget-object v6, Lmla;->g:Lykq;

    invoke-virtual {v6}, Lykh;->b()Lyld;

    move-result-object v6

    invoke-interface {v6, v0}, Lyko;->i(Ljava/lang/Throwable;)Lyld;

    move-result-object v6

    check-cast v6, Lyko;

    const/16 v7, 0xc46

    invoke-interface {v6, v7}, Lyko;->O(I)Lyld;

    move-result-object v6

    check-cast v6, Lyko;

    const-string v7, "Unable to build GyroSampleVector %s"

    invoke-interface {v6, v7, v0}, Lyko;->v(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    :goto_1
    move-object v0, v5

    :cond_5
    :goto_2
    sget-object v6, Landroid/hardware/camera2/CaptureResult;->SENSOR_TIMESTAMP:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v2, v6}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    if-eqz v6, :cond_8

    iget-object v7, v1, Lmla;->G:Lqgo;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Lqgo;->b(J)Lqgk;

    move-result-object v6

    if-eqz v6, :cond_8

    iget-object v6, v6, Lqgk;->t:Lxwg;

    invoke-virtual {v6}, Lxwg;->h()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-virtual {v6}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lqgw;

    iget-object v7, v7, Lqgw;->a:[Lqgv;

    array-length v7, v7

    if-nez v7, :cond_6

    goto :goto_4

    :cond_6
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v6}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqgw;

    iget-object v6, v6, Lqgw;->a:[Lqgv;

    array-length v7, v6

    :goto_3
    if-ge v4, v7, :cond_8

    aget-object v8, v6, v4

    iget v9, v8, Lqgv;->d:F

    const/4 v10, 0x0

    cmpl-float v10, v9, v10

    if-lez v10, :cond_7

    iget-wide v10, v8, Lqgv;->b:J

    long-to-int v8, v10

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_8
    :goto_4
    iget-object v1, v1, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v1, v2, v0, v5, v3}, Lzsn;->p(Luzj;Lcom/google/googlex/gcam/GyroSampleVector;Ljava/util/Map;Luuv;)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v0

    return-object v0

    :cond_9
    invoke-virtual {v0}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/googlex/gcam/FrameMetadata;

    return-object v0
.end method

.method public final j(I)Lcom/google/googlex/gcam/PhysicalStabilityParams;
    .locals 0

    iget-object p0, p0, Lmla;->j:Lyeo;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyeo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmkz;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lmkz;->a:Lcom/google/googlex/gcam/PhysicalStabilityParams;

    return-object p0
.end method

.method public final k(I)Lcom/google/googlex/gcam/PostShutterAfParams;
    .locals 0

    iget-object p0, p0, Lmla;->j:Lyeo;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyeo;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmkz;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lmkz;->b:Lcom/google/googlex/gcam/PostShutterAfParams;

    return-object p0
.end method

.method public final l(Luzj;Luuv;)Lzoi;
    .locals 1

    iget-object p0, p0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    iget-object v0, p2, Luuv;->a:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->l(Luzj;Ljava/lang/String;)Luzj;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lzsn;->u(Luzj;Luuv;)Lzoi;

    move-result-object p0

    return-object p0
.end method

.method public final m(Luuv;Luzj;ILmtn;ZZLxwg;)Lcom/google/googlex/gcam/ShotParams;
    .locals 25

    move-object/from16 v1, p0

    invoke-virtual/range {p7 .. p7}, Lxwg;->h()Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    invoke-virtual/range {p7 .. p7}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqlh;

    iget-boolean v0, v0, Lqlh;->g:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v3

    :goto_1
    iget-object v4, v1, Lmla;->aa:Lqtd;

    sget-object v5, Lqsy;->bm:Lqtm;

    invoke-virtual {v4, v5}, Lqtd;->b(Lqsw;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz v0, :cond_2

    move/from16 v23, v3

    goto :goto_2

    :cond_2
    move/from16 v23, v2

    :goto_2
    iget-object v0, v1, Lmla;->o:Lufv;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-float v2, v0

    iget-object v0, v1, Lmla;->J:Lpch;

    invoke-virtual {v0}, Lugo;->d()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lpci;

    move-object/from16 v13, p1

    move-object/from16 v8, p2

    invoke-virtual {v1, v8, v13}, Lmla;->c(Luzj;Luuv;)I

    move-result v5

    sget-object v9, Lxuz;->a:Lxuz;

    sget-object v17, Lmqa;->a:Lmqa;

    const/16 v20, 0x0

    const/high16 v22, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-wide/16 v14, -0x1

    const/high16 v16, -0x40800000    # -1.0f

    const/16 v19, 0x0

    move-object/from16 v12, p2

    move/from16 v3, p3

    move-object/from16 v21, p4

    move/from16 v6, p5

    move/from16 v18, p6

    move-object/from16 v24, p7

    invoke-virtual/range {v1 .. v24}, Lmla;->K(FILpci;IZZZLxwg;ZZLuzj;Luuv;JFLmqa;ZZZLmtn;FZLxwg;)Lcom/google/googlex/gcam/ShotParams;

    move-result-object v0

    iget-object v5, v1, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v0}, Lcom/google/googlex/gcam/ShotParams;->a()Lcom/google/googlex/gcam/AeShotParams;

    move-result-object v7

    iget-object v2, v1, Lmla;->m:Lmix;

    iget-object v10, v1, Lmla;->t:Lulc;

    iget v9, v2, Lmix;->i:F

    invoke-virtual {v0}, Lcom/google/googlex/gcam/ShotParams;->c()Lznw;

    move-result-object v1

    sget-object v2, Lznw;->e:Lznw;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    move-object/from16 v6, p1

    move-object/from16 v8, p2

    invoke-virtual/range {v5 .. v11}, Lzsn;->F(Luuv;Lcom/google/googlex/gcam/AeShotParams;Luzj;FLulc;Z)V

    return-object v0
.end method

.method public final n(I)Lcom/google/googlex/gcam/ViewfinderResults;
    .locals 3

    new-instance v0, Lcom/google/googlex/gcam/ViewfinderResults;

    iget-object p0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v1, p0, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v1, v2, p0, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_GetLatestViewfinderResults(JLcom/google/googlex/gcam/Gcam;I)J

    move-result-wide p0

    invoke-direct {v0, p0, p1}, Lcom/google/googlex/gcam/ViewfinderResults;-><init>(J)V

    return-object v0
.end method

.method public final o(Lmnk;)V
    .locals 4

    invoke-virtual {p1}, Lmnk;->a()I

    move-result p1

    const-string v0, "AbortShot-"

    invoke-static {p1, v0}, La;->bA(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmla;->e:Lulx;

    invoke-interface {v1, v0}, Lulx;->f(Ljava/lang/String;)V

    iget-object p0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v2, p0, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v2, v3, p0, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_AbortShot(JLcom/google/googlex/gcam/Gcam;I)V

    invoke-interface {v1}, Lulx;->g()V

    return-void
.end method

.method public final p(Lmnk;)V
    .locals 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Lpqj;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, v2}, Lmnk;->c(Luzj;)V

    new-instance v2, Lcom/google/googlex/gcam/FrameMetadata;

    invoke-direct {v2}, Lcom/google/googlex/gcam/FrameMetadata;-><init>()V

    sget-object v3, Lznb;->c:Lznb;

    invoke-virtual {v2, v3}, Lcom/google/googlex/gcam/FrameMetadata;->A(Lznb;)V

    invoke-virtual {v2}, Lcom/google/googlex/gcam/FrameMetadata;->f()Lcom/google/googlex/gcam/AeMetadata;

    move-result-object v3

    sget-object v4, Lzmp;->b:Lzmp;

    invoke-virtual {v3, v4}, Lcom/google/googlex/gcam/AeMetadata;->e(Lzmp;)V

    iget-object v3, v1, Lmnk;->B:Lzoi;

    invoke-virtual {v2, v3}, Lcom/google/googlex/gcam/FrameMetadata;->K(Lzoi;)V

    new-instance v3, Lcom/google/googlex/gcam/SpatialGainMap;

    invoke-direct {v3}, Lcom/google/googlex/gcam/SpatialGainMap;-><init>()V

    new-instance v4, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v4}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    new-instance v5, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v5}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    new-instance v6, Lcom/google/googlex/gcam/YuvWriteView;

    invoke-direct {v6}, Lcom/google/googlex/gcam/YuvWriteView;-><init>()V

    iget-object v7, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-static {v7}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v9

    invoke-virtual {v1}, Lmnk;->a()I

    move-result v11

    invoke-static {v2}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v12

    invoke-static {v3}, Lcom/google/googlex/gcam/SpatialGainMap;->a(Lcom/google/googlex/gcam/SpatialGainMap;)J

    move-result-wide v14

    invoke-static {v4}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v16

    new-instance v7, Lmbb;

    const/4 v8, 0x2

    invoke-direct {v7, v4, v2, v3, v8}, Lmbb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    invoke-static {v5}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v19

    new-instance v2, Lmgw;

    const/16 v3, 0xa

    invoke-direct {v2, v5, v3}, Lmgw;-><init>(Ljava/lang/Object;I)V

    invoke-static {v6}, Lcom/google/googlex/gcam/YuvWriteView;->c(Lcom/google/googlex/gcam/YuvWriteView;)J

    move-result-wide v22

    new-instance v3, Lmgw;

    const/16 v4, 0xb

    invoke-direct {v3, v6, v4}, Lmgw;-><init>(Ljava/lang/Object;I)V

    iget-object v0, v0, Lmla;->l:Lzsj;

    move-object v8, v0

    check-cast v8, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v21, v2

    move-object/from16 v24, v3

    move-object/from16 v18, v7

    invoke-virtual/range {v8 .. v26}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeAddPayloadFrame(JIJJJLjava/lang/Runnable;JLjava/lang/Runnable;JLjava/lang/Runnable;Lcom/google/googlex/gcam/base/OwningNativePointer;Ljava/lang/Runnable;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->b()Lyld;

    move-result-object v0

    const/16 v2, 0xc35

    invoke-interface {v0, v2}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    invoke-virtual {v1}, Lmnk;->a()I

    move-result v1

    const-string v2, "addPayloadFrame with empty payload for shot %d failed."

    invoke-interface {v0, v2, v1}, Lyko;->t(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public final q(Lmnk;Luuv;ILuzj;Lzna;Luzo;Luzo;Luzo;Luzo;Lxwg;Luzj;)V
    .locals 37

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v0, p9

    move-object/from16 v8, p11

    iget-object v9, v1, Lmla;->e:Lulx;

    const-string v10, "AddPayloadFrame"

    invoke-interface {v9, v10}, Lulx;->f(Ljava/lang/String;)V

    const-string v10, "metadata"

    invoke-interface {v9, v10}, Lulx;->f(Ljava/lang/String;)V

    new-instance v9, Lcom/google/googlex/gcam/FrameMetadata;

    invoke-direct {v9}, Lcom/google/googlex/gcam/FrameMetadata;-><init>()V

    if-eqz v5, :cond_18

    const/4 v9, 0x1

    invoke-virtual {v1, v5, v3, v9}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object v13

    iget-wide v11, v13, Lcom/google/googlex/gcam/FrameMetadata;->a:J

    move-object/from16 v14, p5

    iget v14, v14, Lzna;->l:I

    invoke-static {v11, v12, v13, v14}, Lcom/google/googlex/gcam/GcamModuleJNI;->FrameMetadata_burst_frame_type_set(JLcom/google/googlex/gcam/FrameMetadata;I)V

    invoke-virtual/range {p10 .. p10}, Lxwg;->h()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->s()Lcom/google/googlex/gcam/LiveHdrMetadata;

    move-result-object v11

    invoke-virtual/range {p10 .. p10}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lmkr;

    iget v12, v12, Lmkr;->a:F

    invoke-virtual {v11, v12}, Lcom/google/googlex/gcam/LiveHdrMetadata;->g(F)V

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->s()Lcom/google/googlex/gcam/LiveHdrMetadata;

    move-result-object v11

    invoke-virtual/range {p10 .. p10}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lmkr;

    iget v12, v12, Lmkr;->b:F

    invoke-virtual {v11, v12}, Lcom/google/googlex/gcam/LiveHdrMetadata;->e(F)V

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->s()Lcom/google/googlex/gcam/LiveHdrMetadata;

    move-result-object v11

    invoke-virtual/range {p10 .. p10}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lmkr;

    iget v12, v12, Lmkr;->a:F

    invoke-virtual {v11, v12}, Lcom/google/googlex/gcam/LiveHdrMetadata;->j(F)V

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->s()Lcom/google/googlex/gcam/LiveHdrMetadata;

    move-result-object v11

    invoke-virtual/range {p10 .. p10}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lmkr;

    iget v12, v12, Lmkr;->b:F

    invoke-virtual {v11, v12}, Lcom/google/googlex/gcam/LiveHdrMetadata;->h(F)V

    :cond_0
    invoke-virtual {v2}, Lmnk;->b()Lcom/google/googlex/gcam/ShotParams;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/googlex/gcam/ShotParams;->b()Lcom/google/googlex/gcam/ArkInfo;

    move-result-object v11

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->g()Lcom/google/googlex/gcam/AeResults;

    move-result-object v12

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->b()F

    move-result v14

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->s()Lcom/google/googlex/gcam/LiveHdrMetadata;

    move-result-object v15

    invoke-virtual {v11}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v10

    sget-object v9, Lznf;->a:Lznf;

    const/16 v18, 0x0

    const/16 v19, 0x0

    if-eq v10, v9, :cond_6

    invoke-virtual {v11}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v9

    sget-object v10, Lznf;->b:Lznf;

    if-eq v9, v10, :cond_6

    invoke-virtual {v11}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v9

    sget-object v10, Lznf;->c:Lznf;

    if-ne v9, v10, :cond_1

    goto/16 :goto_3

    :cond_1
    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->a()F

    move-result v9

    cmpl-float v9, v9, v19

    if-lez v9, :cond_2

    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->c()F

    move-result v9

    cmpl-float v9, v9, v19

    if-lez v9, :cond_2

    const/4 v9, 0x1

    goto :goto_0

    :cond_2
    move/from16 v9, v18

    :goto_0
    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->b()F

    move-result v10

    if-eqz v9, :cond_3

    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->a()F

    move-result v9

    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->c()F

    move-result v16

    div-float v9, v9, v16

    move/from16 p5, v10

    goto :goto_1

    :cond_3
    move/from16 p5, v10

    iget-wide v9, v12, Lcom/google/googlex/gcam/AeResults;->a:J

    invoke-static {v9, v10, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeResults_FinalHdrRatio(JLcom/google/googlex/gcam/AeResults;)F

    move-result v9

    :goto_1
    cmpl-float v10, p5, v19

    if-lez v10, :cond_4

    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->b()F

    move-result v10

    invoke-virtual {v15}, Lcom/google/googlex/gcam/LiveHdrMetadata;->a()F

    move-result v12

    div-float/2addr v10, v12

    move/from16 p5, v9

    goto :goto_2

    :cond_4
    move/from16 p5, v9

    iget-wide v9, v12, Lcom/google/googlex/gcam/AeResults;->a:J

    invoke-static {v9, v10, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->AeResults_FinalPortraitTetGain(JLcom/google/googlex/gcam/AeResults;)F

    move-result v10

    :goto_2
    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    invoke-virtual {v11}, Lcom/google/googlex/gcam/ArkInfo;->e()Lznf;

    move-result-object v10

    sget-object v12, Lznf;->e:Lznf;

    if-ne v10, v12, :cond_5

    invoke-virtual {v11}, Lcom/google/googlex/gcam/ArkInfo;->b()F

    move-result v14

    :cond_5
    invoke-virtual {v11}, Lcom/google/googlex/gcam/ArkInfo;->c()F

    move-result v10

    mul-float/2addr v14, v10

    mul-float v10, v14, p5

    mul-float/2addr v9, v10

    invoke-virtual {v15, v10}, Lcom/google/googlex/gcam/LiveHdrMetadata;->e(F)V

    invoke-virtual {v15, v14}, Lcom/google/googlex/gcam/LiveHdrMetadata;->g(F)V

    invoke-virtual {v15, v9}, Lcom/google/googlex/gcam/LiveHdrMetadata;->f(F)V

    invoke-virtual {v15, v14}, Lcom/google/googlex/gcam/LiveHdrMetadata;->j(F)V

    invoke-virtual {v15, v10}, Lcom/google/googlex/gcam/LiveHdrMetadata;->h(F)V

    invoke-virtual {v15, v9}, Lcom/google/googlex/gcam/LiveHdrMetadata;->i(F)V

    :cond_6
    :goto_3
    invoke-virtual {v2}, Lmnk;->b()Lcom/google/googlex/gcam/ShotParams;

    move-result-object v9

    iget-wide v10, v9, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v10, v11, v9}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_use_binned_metering_frame_get(JLcom/google/googlex/gcam/ShotParams;)Z

    move-result v9

    const/4 v10, 0x2

    if-eqz v9, :cond_7

    if-eqz v8, :cond_7

    iget-object v9, v1, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v9, v8}, Lzsn;->g(Luzj;)Landroid/graphics/Rect;

    move-result-object v9

    if-eqz v9, :cond_b

    invoke-static {v9, v8}, Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;->s(Landroid/graphics/Rect;Luzc;)Lcom/google/googlex/gcam/MeshWarp;

    move-result-object v9

    invoke-interface {v8}, Luzj;->b()Ljava/lang/String;

    iget-wide v11, v13, Lcom/google/googlex/gcam/FrameMetadata;->a:J

    iget-wide v14, v9, Lcom/google/googlex/gcam/MeshWarp;->a:J

    move-object/from16 v16, v9

    invoke-static/range {v11 .. v16}, Lcom/google/googlex/gcam/GcamModuleJNI;->FrameMetadata_mesh_warp_set(JLcom/google/googlex/gcam/FrameMetadata;JLcom/google/googlex/gcam/MeshWarp;)V

    goto/16 :goto_5

    :cond_7
    invoke-virtual {v2}, Lmnk;->b()Lcom/google/googlex/gcam/ShotParams;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/googlex/gcam/ShotParams;->c()Lznw;

    move-result-object v8

    sget-object v9, Lznw;->e:Lznw;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->u()Lzoi;

    move-result-object v8

    sget-object v9, Lzoi;->i:Lzoi;

    if-eq v8, v9, :cond_8

    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->u()Lzoi;

    move-result-object v8

    sget-object v9, Lzoi;->n:Lzoi;

    if-ne v8, v9, :cond_b

    :cond_8
    invoke-virtual {v13}, Lcom/google/googlex/gcam/FrameMetadata;->t()Lcom/google/googlex/gcam/MeshWarp;

    move-result-object v8

    if-eqz v8, :cond_b

    invoke-virtual {v8}, Lcom/google/googlex/gcam/MeshWarp;->c()Lcom/google/googlex/gcam/FloatVector;

    move-result-object v9

    if-eqz v9, :cond_9

    move/from16 v11, v18

    :goto_4
    iget-wide v14, v9, Lcom/google/googlex/gcam/FloatVector;->a:J

    invoke-static {v14, v15, v9}, Lcom/google/googlex/gcam/GcamModuleJNI;->FloatVector_size(JLcom/google/googlex/gcam/FloatVector;)J

    move-result-wide v14

    move-object/from16 p5, v13

    int-to-long v12, v11

    cmp-long v12, v12, v14

    if-gez v12, :cond_a

    invoke-virtual {v9, v11}, Lcom/google/googlex/gcam/FloatVector;->a(I)F

    move-result v12

    const/high16 v13, 0x3f000000    # 0.5f

    mul-float/2addr v12, v13

    iget-wide v13, v9, Lcom/google/googlex/gcam/FloatVector;->a:J

    invoke-static {v13, v14, v9, v11, v12}, Lcom/google/googlex/gcam/GcamModuleJNI;->FloatVector_set(JLcom/google/googlex/gcam/FloatVector;IF)V

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v13, p5

    goto :goto_4

    :cond_9
    move-object/from16 p5, v13

    :cond_a
    invoke-virtual {v8}, Lcom/google/googlex/gcam/MeshWarp;->e()Lcom/google/googlex/gcam/PixelRect;

    move-result-object v8

    if-eqz v8, :cond_c

    invoke-virtual {v8}, Lcom/google/googlex/gcam/PixelRect;->a()I

    move-result v9

    div-int/2addr v9, v10

    invoke-virtual {v8, v9}, Lcom/google/googlex/gcam/PixelRect;->i(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/PixelRect;->b()I

    move-result v9

    div-int/2addr v9, v10

    invoke-virtual {v8, v9}, Lcom/google/googlex/gcam/PixelRect;->j(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/PixelRect;->c()I

    move-result v9

    div-int/2addr v9, v10

    invoke-virtual {v8, v9}, Lcom/google/googlex/gcam/PixelRect;->k(I)V

    invoke-virtual {v8}, Lcom/google/googlex/gcam/PixelRect;->d()I

    move-result v9

    div-int/2addr v9, v10

    invoke-virtual {v8, v9}, Lcom/google/googlex/gcam/PixelRect;->l(I)V

    goto :goto_6

    :cond_b
    :goto_5
    move-object/from16 p5, v13

    :cond_c
    :goto_6
    iget-object v8, v1, Lmla;->ad:Lqep;

    iget-object v9, v8, Lqep;->f:Ljava/lang/Object;

    new-instance v11, Ljfu;

    const/16 v12, 0x10

    invoke-direct {v11, v5, v12}, Ljfu;-><init>(Ljava/lang/Object;I)V

    move-object v12, v9

    check-cast v12, Lj$/util/Optional;

    invoke-virtual {v12}, Lj$/util/Optional;->isPresent()Z

    move-result v13

    const/4 v14, 0x1

    if-ne v14, v13, :cond_d

    invoke-virtual {v12}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v9

    iget-object v11, v11, Ljfu;->a:Ljava/lang/Object;

    check-cast v9, Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v11, v9}, Luzc;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-static {v9}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v9

    :cond_d
    sget-object v11, Lqkv;->a:Lqkv;

    iget v12, v11, Lqlh;->d:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    check-cast v9, Lj$/util/Optional;

    invoke-virtual {v9, v13}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v14, 0x3

    if-eq v9, v12, :cond_17

    iget-object v11, v8, Lqep;->d:Ljava/lang/Object;

    new-instance v12, Ljfu;

    const/16 v15, 0xd

    invoke-direct {v12, v5, v15}, Ljfu;-><init>(Ljava/lang/Object;I)V

    move-object v15, v11

    check-cast v15, Lj$/util/Optional;

    invoke-virtual {v15}, Lj$/util/Optional;->isPresent()Z

    move-result v10

    const/4 v13, 0x1

    if-ne v13, v10, :cond_10

    invoke-virtual {v15}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v10

    iget-object v11, v12, Ljfu;->a:Ljava/lang/Object;

    check-cast v10, Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v11, v10}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [F

    if-eqz v10, :cond_e

    array-length v11, v10

    if-eq v11, v14, :cond_f

    :cond_e
    const/4 v10, 0x0

    :cond_f
    invoke-static {v10}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v11

    :cond_10
    new-array v10, v14, [F

    fill-array-data v10, :array_0

    check-cast v11, Lj$/util/Optional;

    invoke-virtual {v11, v10}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [F

    iget-object v11, v8, Lqep;->h:Ljava/lang/Object;

    new-instance v12, Ljfu;

    const/16 v13, 0xe

    invoke-direct {v12, v5, v13}, Ljfu;-><init>(Ljava/lang/Object;I)V

    move-object v13, v11

    check-cast v13, Lj$/util/Optional;

    invoke-virtual {v13}, Lj$/util/Optional;->isPresent()Z

    move-result v14

    const/4 v15, 0x1

    if-ne v15, v14, :cond_13

    invoke-virtual {v13}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v11

    iget-object v12, v12, Ljfu;->a:Ljava/lang/Object;

    check-cast v11, Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v12, v11}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [F

    if-eqz v11, :cond_11

    array-length v12, v11

    const/4 v13, 0x4

    if-eq v12, v13, :cond_12

    goto :goto_7

    :cond_11
    const/4 v13, 0x4

    :goto_7
    const/4 v11, 0x0

    :cond_12
    invoke-static {v11}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v11

    goto :goto_8

    :cond_13
    const/4 v13, 0x4

    :goto_8
    new-array v12, v13, [F

    fill-array-data v12, :array_1

    check-cast v11, Lj$/util/Optional;

    invoke-virtual {v11, v12}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [F

    iget-object v8, v8, Lqep;->a:Ljava/lang/Object;

    new-instance v12, Ljfu;

    const/16 v13, 0xf

    invoke-direct {v12, v5, v13}, Ljfu;-><init>(Ljava/lang/Object;I)V

    move-object v13, v8

    check-cast v13, Lj$/util/Optional;

    invoke-virtual {v13}, Lj$/util/Optional;->isPresent()Z

    move-result v14

    const/4 v15, 0x1

    if-ne v15, v14, :cond_16

    invoke-virtual {v13}, Lj$/util/Optional;->get()Ljava/lang/Object;

    move-result-object v8

    iget-object v12, v12, Ljfu;->a:Ljava/lang/Object;

    check-cast v8, Landroid/hardware/camera2/CaptureResult$Key;

    invoke-interface {v12, v8}, Luzj;->a(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [F

    if-eqz v8, :cond_14

    array-length v12, v8

    const/4 v13, 0x2

    if-eq v12, v13, :cond_15

    goto :goto_9

    :cond_14
    const/4 v13, 0x2

    :goto_9
    const/4 v8, 0x0

    :cond_15
    invoke-static {v8}, Lj$/util/Optional;->ofNullable(Ljava/lang/Object;)Lj$/util/Optional;

    move-result-object v8

    goto :goto_a

    :cond_16
    const/4 v13, 0x2

    :goto_a
    new-array v12, v13, [F

    fill-array-data v12, :array_2

    check-cast v8, Lj$/util/Optional;

    invoke-virtual {v8, v12}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [F

    goto/16 :goto_b

    :cond_17
    iget-object v8, v2, Lmnk;->G:Ltse;

    iget-object v8, v8, Ltse;->a:Ljava/lang/Object;

    check-cast v8, Lost;

    iget-object v9, v8, Lost;->p:Lxwg;

    invoke-virtual {v9, v11}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lqlh;

    iget v10, v9, Lqlh;->d:I

    invoke-static {v10}, Lcom/google/android/patch/cameralooks/TomteInitHelper;->getEffectiveLookId(I)I

    move-result v10

    new-instance v11, Lqmc;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lqmc;-><init>([B)V

    iget-object v8, v8, Lost;->q:Lxwg;

    invoke-virtual {v8, v11}, Lxwg;->e(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lqmc;

    new-array v11, v14, [F

    iget-object v13, v8, Lqmc;->a:Lj$/util/Optional;

    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-virtual {v13, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    aput v13, v11, v18

    iget-object v13, v8, Lqmc;->c:Lj$/util/Optional;

    invoke-virtual {v13, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    const/16 v17, 0x1

    aput v13, v11, v17

    iget-object v13, v8, Lqmc;->b:Lj$/util/Optional;

    invoke-virtual {v13, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Float;

    invoke-virtual {v13}, Ljava/lang/Float;->floatValue()F

    move-result v13

    const/16 v16, 0x2

    aput v13, v11, v16

    const/4 v13, 0x4

    new-array v13, v13, [F

    iget-object v12, v8, Lqmc;->d:Lj$/util/Optional;

    invoke-virtual {v12, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    aput v12, v13, v18

    iget-object v12, v8, Lqmc;->e:Lj$/util/Optional;

    invoke-virtual {v12, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    const/16 v17, 0x1

    aput v12, v13, v17

    iget-object v12, v8, Lqmc;->f:Lj$/util/Optional;

    invoke-virtual {v12, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    move/from16 p11, v14

    const/4 v14, 0x2

    aput v12, v13, v14

    iget-object v12, v8, Lqmc;->g:Lj$/util/Optional;

    invoke-virtual {v12, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    aput v12, v13, p11

    new-array v12, v14, [F

    iget-object v14, v8, Lqmc;->h:Lj$/util/Optional;

    invoke-static {v9}, Lqkj;->N(Lqlh;)F

    move-result v15

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-virtual {v14, v15}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Float;

    invoke-virtual {v14}, Ljava/lang/Float;->floatValue()F

    move-result v14

    aput v14, v12, v18

    iget-object v8, v8, Lqmc;->i:Lj$/util/Optional;

    invoke-static {v9}, Lqkj;->M(Lqlh;)F

    move-result v9

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {v8, v9}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    const/16 v17, 0x1

    aput v8, v12, v17

    move v9, v10

    move-object v10, v11

    move-object v8, v12

    move-object v11, v13

    :goto_b
    invoke-virtual/range {p5 .. p5}, Lcom/google/googlex/gcam/FrameMetadata;->w()Lcom/google/googlex/gcam/TomteMetadata;

    move-result-object v12

    invoke-virtual {v12, v9}, Lcom/google/googlex/gcam/TomteMetadata;->e(I)V

    invoke-virtual/range {p5 .. p5}, Lcom/google/googlex/gcam/FrameMetadata;->w()Lcom/google/googlex/gcam/TomteMetadata;

    move-result-object v9

    invoke-static {v10}, Lmla;->S([F)Lcom/google/googlex/gcam/FloatVector;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/googlex/gcam/TomteMetadata;->b(Lcom/google/googlex/gcam/FloatVector;)V

    invoke-virtual/range {p5 .. p5}, Lcom/google/googlex/gcam/FrameMetadata;->w()Lcom/google/googlex/gcam/TomteMetadata;

    move-result-object v9

    invoke-static {v11}, Lmla;->S([F)Lcom/google/googlex/gcam/FloatVector;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/googlex/gcam/TomteMetadata;->c(Lcom/google/googlex/gcam/FloatVector;)V

    invoke-virtual/range {p5 .. p5}, Lcom/google/googlex/gcam/FrameMetadata;->w()Lcom/google/googlex/gcam/TomteMetadata;

    move-result-object v9

    invoke-static {v8}, Lmla;->S([F)Lcom/google/googlex/gcam/FloatVector;

    move-result-object v8

    invoke-virtual {v9, v8}, Lcom/google/googlex/gcam/TomteMetadata;->d(Lcom/google/googlex/gcam/FloatVector;)V

    move-object/from16 v9, p5

    :cond_18
    invoke-virtual {v9}, Lcom/google/googlex/gcam/FrameMetadata;->n()Lcom/google/googlex/gcam/CroppedGrayMap;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/googlex/gcam/CroppedGrayMap;->b()Lcom/google/googlex/gcam/NormalizedRect;

    move-result-object v8

    move-object/from16 v10, p8

    invoke-static {v10, v8, v9}, Lzsf;->b(Luzo;Lcom/google/googlex/gcam/NormalizedRect;Lcom/google/googlex/gcam/FrameMetadata;)V

    if-eqz v6, :cond_19

    invoke-direct {v1}, Lmla;->O()Z

    move-result v8

    if-eqz v8, :cond_19

    iget-object v8, v2, Lmnk;->C:Ljava/lang/String;

    if-eqz v8, :cond_19

    invoke-virtual {v2}, Lmnk;->a()I

    move-result v10

    sget-object v11, Lznq;->b:Lznq;

    sget-object v12, Lmjf;->b:Ljava/lang/Object;

    monitor-enter v12

    :try_start_0
    sget-object v13, Lmjf;->a:Ljava/util/Map;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v13, v10, v14}, Lj$/util/Map$-EL;->putIfAbsent(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v13, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    new-instance v13, Lmje;

    invoke-direct {v13, v8, v11, v4, v5}, Lmje;-><init>(Ljava/lang/String;Lznq;ILuzc;)V

    invoke-interface {v10, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v12

    goto :goto_c

    :catchall_0
    move-exception v0

    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_19
    :goto_c
    invoke-virtual {v2, v5}, Lmnk;->c(Luzj;)V

    iget-object v8, v1, Lmla;->e:Lulx;

    const-string v10, "wrapImages"

    invoke-interface {v8, v10}, Lulx;->h(Ljava/lang/String;)V

    const/16 v8, 0x8

    if-eqz v6, :cond_1b

    iget-object v10, v1, Lmla;->r:Lzsl;

    invoke-virtual {v10, v6}, Lzsl;->b(Luzo;)Lcom/google/googlex/gcam/RawWriteView;

    move-result-object v10

    invoke-interface {v6}, Luzo;->g()Landroid/hardware/HardwareBuffer;

    move-result-object v11

    if-eqz v11, :cond_1a

    invoke-static {v11}, Lcom/google/googlex/gcam/AndroidJniUtils;->getAHardwareBufferPtr(Landroid/hardware/HardwareBuffer;)Lcom/google/googlex/gcam/base/OwningNativePointer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v13, Lmgw;

    const/16 v14, 0x9

    invoke-direct {v13, v12, v14}, Lmgw;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v11}, Landroid/hardware/HardwareBuffer;->close()V

    goto :goto_d

    :cond_1a
    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_d
    new-instance v11, Lmgw;

    invoke-direct {v11, v6, v8}, Lmgw;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v28, v11

    move-object/from16 v35, v12

    move-object/from16 v36, v13

    goto :goto_e

    :cond_1b
    new-instance v10, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v10}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    const/16 v28, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    :goto_e
    if-eqz v7, :cond_1d

    invoke-virtual {v2}, Lmnk;->b()Lcom/google/googlex/gcam/ShotParams;

    move-result-object v11

    iget-wide v12, v11, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v12, v13, v11}, Lcom/google/googlex/gcam/GcamModuleJNI;->ShotParams_skip_pd_data_get(JLcom/google/googlex/gcam/ShotParams;)Z

    move-result v11

    if-nez v11, :cond_1d

    iget-object v11, v1, Lmla;->r:Lzsl;

    invoke-virtual {v11, v7}, Lzsl;->a(Luzo;)Lxwg;

    move-result-object v11

    invoke-virtual {v11}, Lxwg;->h()Z

    move-result v12

    if-eqz v12, :cond_1c

    invoke-virtual {v11}, Lxwg;->c()Ljava/lang/Object;

    move-result-object v11

    new-instance v12, Lmgw;

    invoke-direct {v12, v7, v8}, Lmgw;-><init>(Ljava/lang/Object;I)V

    move-object/from16 v31, v12

    goto :goto_10

    :cond_1c
    new-instance v11, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v11}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    goto :goto_f

    :cond_1d
    new-instance v11, Lcom/google/googlex/gcam/RawWriteView;

    invoke-direct {v11}, Lcom/google/googlex/gcam/RawWriteView;-><init>()V

    if-eqz v7, :cond_1e

    invoke-interface {v7}, Luzo;->close()V

    :cond_1e
    :goto_f
    const/16 v31, 0x0

    :goto_10
    if-eqz v0, :cond_1f

    :try_start_1
    iget-object v12, v1, Lmla;->r:Lzsl;

    invoke-virtual {v12, v0}, Lzsl;->c(Luzo;)Lcom/google/googlex/gcam/YuvWriteView;

    move-result-object v12

    new-instance v13, Lmgw;

    invoke-direct {v13, v0, v8}, Lmgw;-><init>(Ljava/lang/Object;I)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-object/from16 v34, v13

    goto :goto_12

    :catch_0
    move-exception v0

    sget-object v8, Lmla;->g:Lykq;

    invoke-virtual {v8}, Lykh;->b()Lyld;

    move-result-object v8

    const-string v12, "Unable to convert viewfinder YUV image"

    const/16 v13, 0xc37

    invoke-static {v12, v13, v8, v0}, La;->bH(Ljava/lang/String;CLyko;Ljava/lang/Throwable;)V

    new-instance v12, Lcom/google/googlex/gcam/YuvWriteView;

    invoke-direct {v12}, Lcom/google/googlex/gcam/YuvWriteView;-><init>()V

    goto :goto_11

    :cond_1f
    new-instance v12, Lcom/google/googlex/gcam/YuvWriteView;

    invoke-direct {v12}, Lcom/google/googlex/gcam/YuvWriteView;-><init>()V

    :goto_11
    const/16 v34, 0x0

    :goto_12
    iget-object v0, v1, Lmla;->e:Lulx;

    const-string v8, "addPayloadFrame()"

    invoke-interface {v0, v8}, Lulx;->h(Ljava/lang/String;)V

    iget-object v8, v1, Lmla;->l:Lzsj;

    iget-object v1, v1, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-static {v1}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v19

    invoke-virtual {v2}, Lmnk;->a()I

    move-result v21

    iget-object v1, v3, Luuv;->a:Ljava/lang/String;

    invoke-interface {v5}, Luzj;->k()Lhfv;

    move-result-object v3

    iget-object v3, v3, Lhfv;->a:Ljava/lang/Object;

    move-object/from16 v23, v3

    check-cast v23, Landroid/hardware/camera2/TotalCaptureResult;

    invoke-static {v9}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v24

    invoke-static {v10}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v26

    check-cast v11, Lcom/google/googlex/gcam/RawWriteView;

    invoke-static {v11}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v29

    check-cast v8, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusAndroidInterface;

    iget-object v3, v8, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusAndroidInterface;->b:Lcom/google/googlex/gcam/hdrplus/CharacteristicsCache;

    invoke-static {v12}, Lcom/google/googlex/gcam/YuvWriteView;->c(Lcom/google/googlex/gcam/YuvWriteView;)J

    move-result-wide v32

    move-object/from16 v22, v1

    move-object/from16 v18, v3

    move-object/from16 v17, v8

    invoke-virtual/range {v17 .. v36}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusAndroidInterface;->nativeAddPayloadFrame(Lcom/google/googlex/gcam/hdrplus/CharacteristicsCache;JILjava/lang/String;Landroid/hardware/camera2/TotalCaptureResult;JJLjava/lang/Runnable;JLjava/lang/Runnable;JLjava/lang/Runnable;Lcom/google/googlex/gcam/base/OwningNativePointer;Ljava/lang/Runnable;)Z

    move-result v1

    if-nez v1, :cond_21

    sget-object v1, Lmla;->g:Lykq;

    invoke-virtual {v1}, Lykh;->b()Lyld;

    move-result-object v1

    const/16 v3, 0xc36

    invoke-interface {v1, v3}, Lyko;->O(I)Lyld;

    move-result-object v1

    check-cast v1, Lyko;

    invoke-virtual {v2}, Lmnk;->a()I

    move-result v2

    const-string v3, "addPayloadFrame for shot %d failed, closing input images at frame index %d."

    invoke-interface {v1, v3, v2, v4}, Lyko;->w(Ljava/lang/String;II)V

    if-eqz v6, :cond_20

    invoke-interface {v6}, Luzo;->close()V

    :cond_20
    if-eqz v7, :cond_21

    invoke-interface {v7}, Luzo;->close()V

    :cond_21
    invoke-interface {v0}, Lulx;->g()V

    invoke-interface {v0}, Lulx;->g()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
    .end array-data
.end method

.method public final r(Luuv;Luzo;Luzo;Luzj;)V
    .locals 26

    move-object/from16 v0, p0

    move-object/from16 v8, p2

    move-object/from16 v2, p4

    iget-object v1, v0, Lmla;->N:Lmmj;

    invoke-static {v1}, Llid;->v(Lmmj;)Lmtn;

    move-result-object v4

    move-object v1, v4

    check-cast v1, Lmmk;

    iget-boolean v1, v1, Lmmk;->c:Z

    iget-object v3, v0, Lmla;->t:Lulc;

    invoke-virtual {v0, v8, v2, v1, v3}, Lmla;->d(Luzo;Luzj;ZLulc;)Lmlu;

    move-result-object v9

    if-nez v9, :cond_0

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    const/16 v1, 0xc3b

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "addViewfinderFrame() failed: convertToHdrPlusViewfinderFrame returned null."

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v1, v9, Lmlu;->a:Lj$/util/Optional;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/google/googlex/gcam/RawWriteView;

    if-nez v10, :cond_1

    sget-object v0, Lmla;->g:Lykq;

    invoke-virtual {v0}, Lykh;->c()Lyld;

    move-result-object v0

    const/16 v1, 0xc3a

    invoke-interface {v0, v1}, Lyko;->O(I)Lyld;

    move-result-object v0

    check-cast v0, Lyko;

    const-string v1, "addViewfinderFrame() failed: missing image and/or spatial gain map."

    invoke-interface {v0, v1}, Lyko;->s(Ljava/lang/String;)V

    return-void

    :cond_1
    move-object/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Lmla;->c(Luzj;Luuv;)I

    move-result v14

    iget-object v3, v0, Lmla;->X:Lkxm;

    iget-object v5, v0, Lmla;->S:Lsql;

    invoke-interface {v3, v5}, Lkxm;->aA(Lsql;)V

    const/4 v6, 0x0

    sget-object v7, Lxuz;->a:Lxuz;

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v7}, Lmla;->m(Luuv;Luzj;ILmtn;ZZLxwg;)Lcom/google/googlex/gcam/ShotParams;

    move-result-object v1

    iget-object v2, v0, Lmla;->Y:Lmns;

    iget-object v2, v2, Lmns;->d:Lxwg;

    invoke-virtual {v2}, Lxwg;->h()Z

    iget-object v2, v0, Lmla;->l:Lzsj;

    iget-object v0, v0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-object v3, v9, Lmlu;->b:Lcom/google/googlex/gcam/FrameMetadata;

    iget-object v4, v9, Lmlu;->c:Lcom/google/googlex/gcam/SpatialGainMap;

    invoke-static {v0}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v12

    invoke-static {v3}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v15

    invoke-static {v4}, Lcom/google/googlex/gcam/SpatialGainMap;->a(Lcom/google/googlex/gcam/SpatialGainMap;)J

    move-result-wide v17

    iget-wide v0, v1, Lcom/google/googlex/gcam/ShotParams;->a:J

    invoke-static {v10}, Lcom/google/googlex/gcam/RawWriteView;->e(Lcom/google/googlex/gcam/RawWriteView;)J

    move-result-wide v23

    new-instance v3, Lmgw;

    const/16 v4, 0x8

    invoke-direct {v3, v8, v4}, Lmgw;-><init>(Ljava/lang/Object;I)V

    move-object v11, v2

    check-cast v11, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    const-wide/16 v21, 0x0

    move-wide/from16 v19, v0

    move-object/from16 v25, v3

    invoke-virtual/range {v11 .. v25}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeAddViewfinderFrame(JIJJJJJLjava/lang/Runnable;)V

    return-void
.end method

.method public final s(Luuv;Luzj;)V
    .locals 12

    :try_start_0
    invoke-virtual {p0, p2, p1}, Lmla;->c(Luzj;Luuv;)I

    move-result v3

    iget-object v0, p0, Lmla;->N:Lmmj;

    invoke-static {v0}, Llid;->v(Lmmj;)Lmtn;

    move-result-object v8

    sget-object v11, Lxuz;->a:Lxuz;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v7, 0x0

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    invoke-virtual/range {v4 .. v11}, Lmla;->m(Luuv;Luzj;ILmtn;ZZLxwg;)Lcom/google/googlex/gcam/ShotParams;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {v4, v6, v5, p1}, Lmla;->i(Luzj;Luuv;Z)Lcom/google/googlex/gcam/FrameMetadata;

    move-result-object p1

    iget-object p2, v4, Lmla;->l:Lzsj;

    iget-object v0, v4, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-static {v0}, Lcom/google/googlex/gcam/Gcam;->a(Lcom/google/googlex/gcam/Gcam;)J

    move-result-wide v1

    invoke-static {p1}, Lcom/google/googlex/gcam/FrameMetadata;->c(Lcom/google/googlex/gcam/FrameMetadata;)J

    move-result-wide v4

    iget-wide v6, p0, Lcom/google/googlex/gcam/ShotParams;->a:J

    move-object v0, p2

    check-cast v0, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;

    invoke-virtual/range {v0 .. v7}, Lcom/google/googlex/gcam/hdrplus/NativeHdrPlusInterface;->nativeAddViewfinderMetadataOnly(JIJJ)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p0, v0

    sget-object p1, Lmla;->g:Lykq;

    invoke-virtual {p1}, Lykh;->c()Lyld;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object p2

    const/16 v0, 0xc3c

    const-string v1, "addViewfinderMetadataOnly() failed %s"

    invoke-static {v1, p2, v0, p1, p0}, La;->bT(Ljava/lang/String;Ljava/lang/Object;CLyko;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final t(Lmnk;)V
    .locals 1

    new-instance v0, Lcom/google/googlex/gcam/BurstSpec;

    invoke-direct {v0}, Lcom/google/googlex/gcam/BurstSpec;-><init>()V

    invoke-virtual {p0, p1, v0}, Lmla;->u(Lmnk;Lcom/google/googlex/gcam/BurstSpec;)V

    return-void
.end method

.method public final u(Lmnk;Lcom/google/googlex/gcam/BurstSpec;)V
    .locals 9

    invoke-virtual {p1}, Lmnk;->a()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "BeginPayloadFrames-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmla;->e:Lulx;

    invoke-interface {v1, v0}, Lulx;->f(Ljava/lang/String;)V

    iget-object v4, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {p1}, Lmnk;->a()I

    move-result v5

    iget-wide v2, v4, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {p2}, Lcom/google/googlex/gcam/BurstSpec;->b(Lcom/google/googlex/gcam/BurstSpec;)J

    move-result-wide v6

    move-object v8, p2

    invoke-static/range {v2 .. v8}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_BeginPayloadFrames(JLcom/google/googlex/gcam/Gcam;IJLcom/google/googlex/gcam/BurstSpec;)V

    invoke-interface {v1}, Lulx;->g()V

    return-void
.end method

.method public final v(Lmnk;)V
    .locals 2

    iget-object p0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {p1}, Lmnk;->a()I

    move-result p1

    iget-wide v0, p0, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v0, v1, p0, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_EndZslPayloadFrames(JLcom/google/googlex/gcam/Gcam;I)V

    return-void
.end method

.method public final w(I)V
    .locals 0

    iget-object p0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {p0, p1}, Lcom/google/googlex/gcam/Gcam;->e(I)V

    return-void
.end method

.method public final x(Luuv;)V
    .locals 1

    iget-object v0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    invoke-virtual {p0, p1}, Lmla;->a(Luuv;)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/google/googlex/gcam/Gcam;->e(I)V

    return-void
.end method

.method public final y(I)V
    .locals 2

    iget-object p0, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v0, p0, Lcom/google/googlex/gcam/Gcam;->a:J

    invoke-static {v0, v1, p0, p1}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_FlushViewfinder(JLcom/google/googlex/gcam/Gcam;I)V

    return-void
.end method

.method public final z(Luzj;Luuv;)Z
    .locals 8

    new-instance v1, Lulw;

    iget-object v0, p0, Lmla;->e:Lulx;

    const-string v2, "HdrPlusSession#claimFrameForTemporalBinning"

    invoke-direct {v1, v0, v2}, Lulw;-><init>(Lulx;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lmla;->d:Lcom/google/googlex/gcam/hdrplus/NativeMetadataConverter;

    invoke-virtual {v0, p1, p2}, Lzsn;->r(Luzj;Luuv;)Lcom/google/googlex/gcam/FrameMetadataKey;

    move-result-object v7

    if-nez v7, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lmla;->k:Lcom/google/googlex/gcam/Gcam;

    iget-wide v2, v4, Lcom/google/googlex/gcam/Gcam;->a:J

    iget-wide v5, v7, Lcom/google/googlex/gcam/FrameMetadataKey;->a:J

    invoke-static/range {v2 .. v7}, Lcom/google/googlex/gcam/GcamModuleJNI;->Gcam_ClaimFrameForBinning(JLcom/google/googlex/gcam/Gcam;JLcom/google/googlex/gcam/FrameMetadataKey;)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    invoke-virtual {v1}, Lulw;->close()V

    return p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    :try_start_1
    invoke-virtual {v1}, Lulw;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p0
.end method
