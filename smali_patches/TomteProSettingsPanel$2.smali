.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$targetObj:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 83
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;->val$targetObj:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 87
    :try_start_0
    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;->val$targetObj:Ljava/lang/Object;

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smfindProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 88
    if-eqz v0, :cond_0

    .line 89
    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smbuildOrUpdatePanel(Landroid/widget/LinearLayout;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    :cond_0
    goto :goto_0

    .line 91
    :catchall_0
    move-exception v0

    .line 92
    const-string v1, "TomteProSettings"

    const-string v2, "Error in delayed retry"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    :goto_0
    return-void
.end method
