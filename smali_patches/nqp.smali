.class public final enum Lnqp;
.super Ljava/lang/Enum;
.source "PG"


# static fields
.field public static final enum a:Lnqp;

.field public static final enum b:Lnqp;

.field public static final enum c:Lnqp;

.field public static final enum d:Lnqp;

.field public static final enum e:Lnqp;

.field public static final enum f:Lnqp;

.field public static final enum g:Lnqp;

.field public static final enum h:Lnqp;

.field public static final enum i:Lnqp;

.field public static final enum j:Lnqp;

.field public static final enum k:Lnqp;

.field public static final enum l:Lnqp;

.field public static final enum m:Lnqp;

.field public static final enum n:Lnqp;

.field private static final synthetic o:[Lnqp;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    new-instance v0, Lnqp;

    const-string v1, "DUAL_EXPOSURE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnqp;->a:Lnqp;

    new-instance v1, Lnqp;

    const-string v2, "SINGLE_EXPOSURE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lnqp;->b:Lnqp;

    new-instance v2, Lnqp;

    const-string v3, "WHITEBALANCE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lnqp;->c:Lnqp;

    new-instance v3, Lnqp;

    const-string v4, "PRO_FOCUS"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lnqp;->d:Lnqp;

    new-instance v4, Lnqp;

    const-string v5, "PRO_NONFOCUS"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lnqp;->e:Lnqp;

    new-instance v5, Lnqp;

    const-string v6, "BLUR"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lnqp;->f:Lnqp;

    new-instance v6, Lnqp;

    const-string v7, "VIDEO_SPEED_SLOWMOTION"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lnqp;->g:Lnqp;

    new-instance v7, Lnqp;

    const-string v8, "VIDEO_SPEED_TIMELAPSE"

    const/4 v9, 0x7

    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lnqp;->h:Lnqp;

    new-instance v8, Lnqp;

    const-string v9, "NIGHT_SIGHT"

    const/16 v10, 0x8

    invoke-direct {v8, v9, v10}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lnqp;->i:Lnqp;

    new-instance v9, Lnqp;

    const-string v10, "TOMTE_AURA"

    const/16 v11, 0x9

    invoke-direct {v9, v10, v11}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lnqp;->j:Lnqp;

    new-instance v10, Lnqp;

    const-string v11, "TOMTE_CAPS"

    const/16 v12, 0xa

    invoke-direct {v10, v11, v12}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lnqp;->k:Lnqp;

    new-instance v11, Lnqp;

    const-string v12, "TOMTE_CAPS_LIMA"

    const/16 v13, 0xb

    invoke-direct {v11, v12, v13}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lnqp;->l:Lnqp;

    new-instance v12, Lnqp;

    const-string v13, "TOMTE_EXTRA"

    const/16 v14, 0xc

    invoke-direct {v12, v13, v14}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lnqp;->m:Lnqp;

    new-instance v13, Lnqp;

    const-string v14, "TOMTE_SELECTION"

    const/16 v15, 0xd

    invoke-direct {v13, v14, v15}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lnqp;->n:Lnqp;

    filled-new-array/range {v0 .. v13}, [Lnqp;

    move-result-object v0

    sput-object v0, Lnqp;->o:[Lnqp;

    return-void
.end method

.method public static values()[Lnqp;
    .locals 1

    sget-object v0, Lnqp;->o:[Lnqp;

    invoke-virtual {v0}, [Lnqp;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnqp;

    return-object v0
.end method


# virtual methods
.method public final a()Z
    .locals 1

    sget-object v0, Lnqp;->d:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnqp;->e:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnqp;->a:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnqp;->b:Lnqp;

    invoke-virtual {p0, v0}, Lnqp;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method
