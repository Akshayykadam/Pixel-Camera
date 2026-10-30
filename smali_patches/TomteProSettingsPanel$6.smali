.class Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;
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
.field final synthetic val$buttonGroup:Landroid/widget/LinearLayout;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$index:I

.field final synthetic val$palette:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

.field final synthetic val$prefKey:Ljava/lang/String;

.field final synthetic val$prefs:Landroid/content/SharedPreferences;

.field final synthetic val$val:Ljava/lang/String;

.field final synthetic val$valueDescriptions:[Ljava/lang/String;

.field final synthetic val$valueView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/TextView;[Ljava/lang/String;ILandroid/widget/LinearLayout;Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 814
    iput-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$prefKey:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$prefs:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$val:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$valueView:Landroid/widget/TextView;

    iput-object p5, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$valueDescriptions:[Ljava/lang/String;

    iput p6, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$index:I

    iput-object p7, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$buttonGroup:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$ctx:Landroid/content/Context;

    iput-object p9, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$palette:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 817
    const-string v0, "pref_camera_raw_compression_key"

    iget-object v1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$prefKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 818
    return-void

    .line 821
    :cond_0
    const/4 v0, 0x3

    :try_start_0
    invoke-virtual {p1, v0}, Landroid/view/View;->performHapticFeedback(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 822
    :goto_0
    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 824
    :goto_1
    iget-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$prefKey:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$val:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 825
    iget-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$valueView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$valueDescriptions:[Ljava/lang/String;

    iget v1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$index:I

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 827
    iget-object p1, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$buttonGroup:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    .line 828
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, p1, :cond_3

    .line 829
    iget-object v2, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$buttonGroup:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 830
    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_2

    .line 831
    check-cast v2, Landroid/widget/TextView;

    .line 832
    iget v3, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$index:I

    if-ne v1, v3, :cond_1

    const/4 v3, 0x1

    goto :goto_3

    :cond_1
    const/4 v3, 0x0

    .line 833
    :goto_3
    iget-object v4, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$ctx:Landroid/content/Context;

    iget-object v5, p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;->val$palette:Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-static {v4, v2, v3, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->-$$Nest$smapplyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 828
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 836
    :cond_3
    return-void
.end method
