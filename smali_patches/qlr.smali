.class public final Lqlr;
.super Ljava/lang/Object;
.source "PG"


# instance fields
.field public final a:Z

.field public final b:Lbe;

.field public final c:Ladbv;

.field public d:Landroidx/preference/Preference;

.field public e:Lqlh;

.field public final f:Lklm;


# direct methods
.method public constructor <init>(ZLklm;Lbe;Ladbv;)V
    .locals 0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqlr;->a:Z

    iput-object p2, p0, Lqlr;->f:Lklm;

    iput-object p3, p0, Lqlr;->b:Lbe;

    iput-object p4, p0, Lqlr;->c:Ladbv;

    return-void
.end method
