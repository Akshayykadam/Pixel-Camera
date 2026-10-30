.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->attachStockRawObserver(Landroid/widget/LinearLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$parent:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 567
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;->val$parent:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 570
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 571
    iget-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;->val$parent:Landroid/widget/LinearLayout;

    new-instance p2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5$1;

    invoke-direct {p2, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5$1;-><init>(Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;)V

    const-wide/16 v0, 0x50

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 578
    :cond_0
    const/4 p1, 0x0

    return p1
.end method
