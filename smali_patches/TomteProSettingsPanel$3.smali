.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$buttonViews:Ljava/util/List;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$palette:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

.field final synthetic val$prefKey:Ljava/lang/String;

.field final synthetic val$val:Ljava/lang/String;

.field final synthetic val$valueDescriptions:[Ljava/lang/String;

.field final synthetic val$valueView:Landroid/widget/TextView;

.field final synthetic val$values:[Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 471
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$ctx:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$prefKey:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$val:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$valueView:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$buttonViews:Ljava/util/List;

    iput-object p6, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$values:[Ljava/lang/String;

    iput-object p7, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$valueDescriptions:[Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$palette:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 475
    const/4 v0, 0x3

    :try_start_0
    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 476
    :goto_0
    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 477
    :goto_1
    iget-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$ctx:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$prefKey:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$val:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smsavePref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    iget-object v2, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$valueView:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$buttonViews:Ljava/util/List;

    iget-object v4, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$values:[Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$valueDescriptions:[Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$val:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$palette:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    iget-object v8, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;->val$ctx:Landroid/content/Context;

    invoke-static/range {v2 .. v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smupdateRowDisplay(Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Landroid/content/Context;)V

    .line 479
    return-void
.end method
