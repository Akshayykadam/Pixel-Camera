.class public final Lqkq;
.super Ljava/lang/Object;
.source "PG"

# interfaces
.implements Laccc;


# instance fields
.field private final a:Laccg;

.field private final b:Laccg;


# direct methods
.method public constructor <init>(Laccg;Laccg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqkq;->a:Laccg;

    iput-object p2, p0, Lqkq;->b:Laccg;

    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0}, Lqkq;->b()Lqmb;

    move-result-object p0

    return-object p0
.end method

.method public final b()Lqmb;
    .locals 1

    iget-object p0, p0, Lqkq;->b:Laccg;

    invoke-interface {p0}, Ladbv;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqmb;

    return-object p0
.end method
