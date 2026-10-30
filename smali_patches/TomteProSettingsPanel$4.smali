.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Landroid/text/TextWatcher;


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

    .line 538
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;->val$parent:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 545
    iget-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;->val$parent:Landroid/widget/LinearLayout;

    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4$1;

    invoke-direct {v0, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4$1;-><init>(Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 551
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 540
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 542
    return-void
.end method
