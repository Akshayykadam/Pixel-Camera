.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->injectProSettings(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$target:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;->val$target:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 65
    :try_start_0
    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;->val$target:Landroid/widget/LinearLayout;

    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smbuildOrUpdatePanel(Landroid/widget/LinearLayout;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v0

    .line 67
    const-string v1, "TomteProSettings"

    const-string v2, "Error in buildOrUpdatePanel"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 69
    :goto_0
    return-void
.end method
