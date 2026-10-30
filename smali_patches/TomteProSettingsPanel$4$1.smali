.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4$1;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;


# direct methods
.method constructor <init>(Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;)V
    .locals 0

    .line 615
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4$1;->this$0:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4$1;->this$0:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;

    iget-object v0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;->val$parent:Landroid/widget/LinearLayout;

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smupdateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 619
    return-void
.end method
