.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5$1;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;


# direct methods
.method constructor <init>(Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;)V
    .locals 0

    .line 571
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5$1;->this$0:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 574
    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5$1;->this$0:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;

    iget-object v0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;->val$parent:Landroid/widget/LinearLayout;

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smupdateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 575
    return-void
.end method
