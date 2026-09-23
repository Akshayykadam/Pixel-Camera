.class public final enum Lklh;
.super Ljava/lang/Enum;
.source "PG"


# static fields
.field public static final enum a:Lklh;

.field public static final enum b:Lklh;

.field public static final enum c:Lklh;

.field public static final enum d:Lklh;

.field private static final synthetic f:[Lklh;


# instance fields
.field public final e:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Lklh;

    const-string v1, "ENG"

    const/4 v2, 0x0

    const-string v3, "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider"

    invoke-direct {v0, v1, v2, v3}, Lklh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lklh;->a:Lklh;

    new-instance v1, Lklh;

    const-string v2, "FISHFOOD"

    const/4 v3, 0x1

    const-string v4, "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider"

    invoke-direct {v1, v2, v3, v4}, Lklh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lklh;->b:Lklh;

    new-instance v2, Lklh;

    const-string v3, "DOGFOOD"

    const/4 v4, 0x2

    const-string v5, "com.google.android.GoogleCameraEng.specialtypes.SpecialTypesProvider"

    invoke-direct {v2, v3, v4, v5}, Lklh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v2, Lklh;->c:Lklh;

    new-instance v3, Lklh;

    const-string v4, "RELEASE"

    const/4 v6, 0x3

    invoke-direct {v3, v4, v6, v5}, Lklh;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lklh;->d:Lklh;

    filled-new-array {v0, v1, v2, v3}, [Lklh;

    move-result-object v0

    sput-object v0, Lklh;->f:[Lklh;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lklh;->e:Ljava/lang/String;

    return-void
.end method

.method public static values()[Lklh;
    .locals 1

    sget-object v0, Lklh;->f:[Lklh;

    invoke-virtual {v0}, [Lklh;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lklh;

    return-object v0
.end method
