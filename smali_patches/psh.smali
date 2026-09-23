.class public abstract Lpsh;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field public static final a:Lykq;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "psh"

    invoke-static {v0}, Lykq;->g(Ljava/lang/String;)Lykq;

    move-result-object v0

    sput-object v0, Lpsh;->a:Lykq;

    return-void
.end method

.method public static a(Luus;Lprz;J)V
    .locals 3

    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {p0, v0}, Luus;->m(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [J

    if-eqz p0, :cond_1

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    aget-wide v1, p0, v0

    cmp-long v1, v1, p2

    if-nez v1, :cond_0

    iput-wide p2, p1, Lprz;->h:J

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static b(Lovu;Luus;Lpst;Lsql;Lklm;Lpvz;Lxwg;ZZZLpqk;Lupa;Lptd;Lpsz;)Lupk;
    .locals 4

    move-object/from16 v0, p13

    sget-object v1, Lsql;->g:Lsql;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p3, v1, :cond_0

    sget-object p3, Lkkn;->S:Lkiz;

    invoke-virtual {p4, p3}, Lklm;->q(Lkiz;)Z

    move-result p3

    if-eqz p3, :cond_0

    if-eqz p8, :cond_0

    move p3, v2

    goto :goto_0

    :cond_0
    move p3, v3

    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p5}, Lpvz;->f()Z

    move-result p5

    if-eqz p5, :cond_1

    move v3, v2

    :cond_1
    invoke-interface {p1}, Luus;->l()Luve;

    move-result-object p5

    sget-object v1, Luve;->b:Luve;

    if-ne p5, v1, :cond_4

    if-eqz p3, :cond_4

    sget-object p3, Lpsz;->h:Lpsz;

    invoke-virtual {v0, p3}, Lpsz;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_2

    sget-object p5, Lkhw;->f:Lkiy;

    invoke-virtual {p4, p5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p5

    const/16 v1, 0x7e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p5, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    goto :goto_1

    :cond_2
    sget-object p5, Lkhw;->b:Lkiy;

    invoke-virtual {p4, p5}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p5

    const/16 v1, 0x7e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p5, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    :goto_1
    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p5

    invoke-virtual {v0, p3}, Lpsz;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    sget-object p3, Lkhw;->g:Lkiy;

    invoke-virtual {p4, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    const/16 v1, 0x5e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_2

    :cond_3
    sget-object p3, Lkhw;->c:Lkiy;

    invoke-virtual {p4, p3}, Lklm;->a(Lkiy;)Lj$/util/Optional;

    move-result-object p3

    const/16 v1, 0x5e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Lj$/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    :goto_2
    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    new-instance p4, Luvs;

    new-instance v1, Lulc;

    invoke-direct {v1, p5, p3}, Lulc;-><init>(II)V

    const/16 p3, 0x25

    invoke-direct {p4, p3, v1}, Luvs;-><init>(ILulc;)V

    goto :goto_3

    :cond_4
    invoke-virtual {p10, v0, p1, p9}, Lpqk;->e(Lpsz;Luus;Z)Luvs;

    move-result-object p4

    :goto_3
    invoke-virtual {p0}, Lovu;->b()Lprz;

    move-result-object p0

    invoke-virtual {p0, p1}, Lprz;->c(Luus;)V

    iput-object p4, p0, Lprz;->a:Luvs;

    invoke-virtual {p2, p4}, Lpst;->b(Luvs;)I

    move-result p1

    iput p1, p0, Lprz;->b:I

    iput-boolean v2, p0, Lprz;->c:Z

    invoke-virtual {p6}, Lxwg;->f()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    iput-object p1, p0, Lprz;->e:Ljava/lang/Long;

    iput-boolean p7, p0, Lprz;->f:Z

    iput-boolean p9, p0, Lprz;->g:Z

    move-object p1, p11

    iput-object p1, p0, Lprz;->l:Lupa;

    invoke-interface/range {p12 .. p13}, Lptd;->a(Lpsz;)Lxwg;

    move-result-object p1

    iput-object p1, p0, Lprz;->i:Lxwg;

    if-eqz v3, :cond_5

    const-wide/16 p1, 0x6

    iput-wide p1, p0, Lprz;->h:J

    :cond_5
    invoke-virtual {p0}, Lprz;->a()Lupk;

    move-result-object p0

    return-object p0
.end method
