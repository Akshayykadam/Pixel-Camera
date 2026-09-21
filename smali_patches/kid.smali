.class public final Lkid;
.super Ljava/lang/Object;
.source "PG"


# static fields
.field public static final a:Lkiy;

.field public static final b:Lkiz;

.field public static final c:Lkiz;

.field public static final d:Lkiz;

.field public static final e:Lkiz;

.field public static final f:Lkiz;

.field public static final g:Lkiz;

.field public static final h:Lkiz;

.field public static final i:Lkiz;

.field public static final j:Lkiz;

.field public static final k:Lkiz;

.field public static final l:Lkiz;

.field public static final m:Lkiz;

.field public static final n:Lkiz;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lkiz;

    const-string v1, "camera.enable_granite_eligibility"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->h:Lkiz;

    new-instance v0, Lkht;

    const/16 v1, 0xd

    invoke-direct {v0, v1}, Lkht;-><init>(I)V

    new-instance v1, Lkiz;

    const-string v3, "camera.enable_granite"

    invoke-direct {v1, v3, v0}, Lkix;-><init>(Ljava/lang/String;Ljava/util/function/Supplier;)V

    sput-object v1, Lkid;->b:Lkiz;

    new-instance v0, Lkiz;

    const-string v1, "camera.enable_biotite_panel"

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->i:Lkiz;

    new-instance v0, Lkiz;

    const-string v1, "camera.enable_biotite_eligibility"

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->j:Lkiz;

    new-instance v0, Lkht;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lkht;-><init>(I)V

    new-instance v1, Lkiz;

    const-string v3, "camera.enable_biotite"

    invoke-direct {v1, v3, v0}, Lkix;-><init>(Ljava/lang/String;Ljava/util/function/Supplier;)V

    sput-object v1, Lkid;->c:Lkiz;

    new-instance v0, Lkiz;

    const-string v1, "camera.biotite_auto_scroll_eligibility"

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->k:Lkiz;

    new-instance v0, Lkht;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lkht;-><init>(I)V

    new-instance v1, Lkiz;

    const-string v3, "camera.biotite_auto_scroll_discovery"

    invoke-direct {v1, v3, v0}, Lkix;-><init>(Ljava/lang/String;Ljava/util/function/Supplier;)V

    sput-object v1, Lkid;->d:Lkiz;

    const-string v0, "camera.force_fixed_biotite_spe"

    invoke-static {v0, v2, v2}, Lejn;->h(Ljava/lang/String;Ljava/util/function/Supplier;Lyfm;)Lkiy;

    move-result-object v0

    sput-object v0, Lkid;->a:Lkiy;

    new-instance v0, Lkiz;

    const-string v1, "camera.enable_basalt_eligibility"

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->l:Lkiz;

    new-instance v0, Lkht;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lkht;-><init>(I)V

    new-instance v1, Lkiz;

    const-string v3, "camera.enable_basalt"

    invoke-direct {v1, v3, v0}, Lkix;-><init>(Ljava/lang/String;Ljava/util/function/Supplier;)V

    sput-object v1, Lkid;->e:Lkiz;

    new-instance v0, Lkiz;

    const-string v1, "camera.enable_slate_eligibility"

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->m:Lkiz;

    new-instance v0, Lkht;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lkht;-><init>(I)V

    new-instance v1, Lkiz;

    const-string v3, "camera.enable_slate"

    invoke-direct {v1, v3, v0}, Lkix;-><init>(Ljava/lang/String;Ljava/util/function/Supplier;)V

    sput-object v1, Lkid;->f:Lkiz;

    new-instance v0, Lkiz;

    const-string v1, "camera.enable_mica_eligibility"

    invoke-direct {v0, v1, v2}, Lkiz;-><init>(Ljava/lang/String;[B)V

    sput-object v0, Lkid;->n:Lkiz;

    new-instance v0, Lkht;

    const/16 v1, 0x12

    invoke-direct {v0, v1}, Lkht;-><init>(I)V

    new-instance v1, Lkiz;

    const-string v2, "camera.enable_mica"

    invoke-direct {v1, v2, v0}, Lkix;-><init>(Ljava/lang/String;Ljava/util/function/Supplier;)V

    sput-object v1, Lkid;->g:Lkiz;

    return-void
.end method

.method public static final a(Lklm;Lklg;)V
    .locals 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lkid;->b:Lkiz;

    invoke-virtual {p0, p1}, Lklm;->p(Lkiz;)V

    sget-object p1, Lkid;->c:Lkiz;

    invoke-virtual {p0, p1}, Lklm;->p(Lkiz;)V

    sget-object p1, Lkid;->d:Lkiz;

    invoke-virtual {p0, p1}, Lklm;->p(Lkiz;)V

    sget-object p1, Lkid;->e:Lkiz;

    invoke-virtual {p0, p1}, Lklm;->p(Lkiz;)V

    sget-object p1, Lkid;->f:Lkiz;

    invoke-virtual {p0, p1}, Lklm;->p(Lkiz;)V

    sget-object p1, Lkid;->g:Lkiz;

    invoke-virtual {p0, p1}, Lklm;->p(Lkiz;)V

    sget-object p1, Lkid;->h:Lkiz;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    sget-object p1, Lkid;->j:Lkiz;

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    sget-object p1, Lkid;->k:Lkiz;

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    sget-object p1, Lkid;->l:Lkiz;

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    sget-object p1, Lkid;->m:Lkiz;

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    sget-object p1, Lkid;->n:Lkiz;

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    sget-object p1, Lkid;->a:Lkiy;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lklm;->e(Lkiy;Ljava/lang/Integer;)V

    sget-object p1, Lkid;->i:Lkiz;

    invoke-virtual {p0, p1, v0}, Lklm;->w(Lkiz;Z)V

    return-void
.end method

.method public static final b(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static final c(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static final d(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static final e(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static final f(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static final g(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static final h(Lklm;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

