.class public final Lkqc;
.super Lpfk;
.source "PG"


# instance fields
.field public final a:Lugh;

.field public final b:Lkqa;

.field public final c:Lkpo;

.field private final d:Lugh;

.field private final e:Lugh;

.field private final f:Lufv;

.field private final g:Lugh;

.field private final h:Lklm;


# direct methods
.method public constructor <init>(Lqtd;Lkpo;Lklm;Lkqa;Lufv;Lugh;)V
    .locals 10

    invoke-direct {p0}, Lpfk;-><init>()V

    new-instance v0, Lufn;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v0, v2}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lkqc;->e:Lugh;

    new-instance v0, Lufn;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v0, v3}, Lufn;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lkqc;->a:Lugh;

    iput-object p2, p0, Lkqc;->c:Lkpo;

    iput-object p3, p0, Lkqc;->h:Lklm;

    iput-object p4, p0, Lkqc;->b:Lkqa;

    iput-object p5, p0, Lkqc;->f:Lufv;

    move-object/from16 p2, p6

    iput-object p2, p0, Lkqc;->g:Lugh;

    new-instance v3, Lpfl;

    sget-object p2, Lqsy;->ap:Lqto;

    invoke-virtual {p1, p2}, Lqtd;->a(Lqsw;)Lugh;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    sget-object v7, Lpfw;->aI:Lpfw;

    sget-object v9, Lpfw;->aJ:Lpfw;

    move-object v8, v5

    invoke-direct/range {v3 .. v9}, Lpfl;-><init>(Lugh;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v3, p0, Lkqc;->d:Lugh;

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    const p0, 0x7f130650

    return p0
.end method

.method public final c()I
    .locals 0

    const p0, 0x7f130651

    return p0
.end method

.method public final d()Lpfo;
    .locals 0

    sget-object p0, Lpfo;->E:Lpfo;

    return-object p0
.end method

.method public final g()Lugh;
    .locals 0

    iget-object p0, p0, Lkqc;->d:Lugh;

    return-object p0
.end method

.method protected final gU(Lpfw;)I
    .locals 0

    invoke-virtual {p1}, Lpfw;->ordinal()I

    move-result p0

    const/16 p1, 0x56

    if-eq p0, p1, :cond_1

    const/16 p1, 0x57

    if-eq p0, p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const p0, 0x7f130653

    return p0

    :cond_1
    const p0, 0x7f130655

    return p0
.end method

.method public final gV()I
    .locals 0

    const p0, 0x7f130656

    return p0
.end method

.method protected final gW(Lpfw;)I
    .locals 0

    invoke-virtual {p1}, Lpfw;->ordinal()I

    move-result p0

    const/16 p1, 0x56

    if-eq p0, p1, :cond_1

    const/16 p1, 0x57

    if-eq p0, p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const p0, 0x7f130652

    return p0

    :cond_1
    const p0, 0x7f130654

    return p0
.end method

.method public final gX()Lpfu;
    .locals 0

    sget-object p0, Lpfu;->b:Lpfu;

    return-object p0
.end method

.method public final gY()Lpfz;
    .locals 2

    iget-object v0, p0, Lkqc;->a:Lugh;

    check-cast v0, Lufn;

    iget-object v0, v0, Lufn;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Ljmk;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ljmk;-><init>(Lpfk;I)V

    return-object v0
.end method

.method public final h()Lyeh;
    .locals 1

    sget-object p0, Lpfw;->aJ:Lpfw;

    sget-object v0, Lpfw;->aI:Lpfw;

    invoke-static {p0, v0}, Lyeh;->m(Ljava/lang/Object;Ljava/lang/Object;)Lyeh;

    move-result-object p0

    return-object p0
.end method

.method public final hI(Lpfw;)I
    .locals 0

    invoke-virtual {p1}, Lpfw;->ordinal()I

    move-result p0

    const/16 p1, 0x56

    if-eq p0, p1, :cond_1

    const/16 p1, 0x57

    if-eq p0, p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const p0, 0x7f08032a

    return p0

    :cond_1
    const p0, 0x7f080329

    return p0
.end method

.method public final ha()Lwsu;
    .locals 0

    sget-object p0, Lwsu;->F:Lwsu;

    return-object p0
.end method

.method public final k(Lpfr;)V
    .locals 0

    return-void
.end method

.method public final l(Lpfr;)V
    .locals 0

    return-void
.end method

.method public final q(Lpfr;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final u(Lpfr;)Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

