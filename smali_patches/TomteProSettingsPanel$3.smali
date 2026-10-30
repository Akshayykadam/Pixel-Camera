.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->buildOrUpdatePanel(Landroid/widget/LinearLayout;)V
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

    .line 403
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$parent:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 406
    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$parent:Landroid/widget/LinearLayout;

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smupdateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 407
    return-void
.end method
