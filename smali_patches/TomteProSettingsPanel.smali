.class public Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;
.super Ljava/lang/Object;
.source "TomteProSettingsPanel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;
    }
.end annotation


# static fields
.field private static final ID_FONT_GOOGLE_SANS:I = 0x7f09002a

.field private static final ID_FONT_GOOGLE_SANS_MEDIUM:I = 0x7f09003a

.field private static final ID_OPTIONS_MENU_INTERNAL_LIST:I = 0x7f0a03c5

.field private static final ID_OPTIONS_MENU_PRO_CONTAINER:I = 0x7f0a03c3

.field private static final ID_OPTIONS_MENU_VIEW:I = 0x7f0a03ca

.field private static final ID_PINNED_PANEL:I = 0x7f0a03fd

.field private static final TAG:Ljava/lang/String; = "TomteProSettings"

.field private static final observedRows:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$smapplyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smbuildOrUpdatePanel(Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->buildOrUpdatePanel(Landroid/widget/LinearLayout;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smfindProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;
    .locals 0

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smupdateRawFormatRowState(Landroid/view/ViewGroup;)V
    .locals 0

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 2

    .line 821
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 822
    const/16 v1, 0x13

    invoke-static {p0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 823
    if-eqz p2, :cond_0

    .line 824
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 825
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 826
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 827
    iget-object p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 829
    :cond_0
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 830
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 831
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 832
    iget-object p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 834
    :goto_0
    return-void
.end method

.method private static attachStockRawObserver(Landroid/widget/LinearLayout;)V
    .locals 4

    .line 521
    if-nez p0, :cond_0

    return-void

    .line 523
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findStockRawRow(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 524
    if-nez v0, :cond_1

    return-void

    .line 526
    :cond_1
    sget-object v1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 527
    :try_start_1
    sget-object v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 528
    monitor-exit v1

    return-void

    .line 530
    :cond_2
    sget-object v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 534
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "s"

    invoke-static {v1, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 535
    if-eqz v1, :cond_3

    .line 536
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 537
    if-eqz v1, :cond_3

    .line 538
    new-instance v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;

    invoke-direct {v2, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 557
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "p"

    invoke-static {v1, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 558
    if-eqz v1, :cond_5

    .line 559
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 560
    if-eqz v0, :cond_5

    .line 561
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 562
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_4

    .line 563
    check-cast v1, Landroid/view/ViewGroup;

    .line 564
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lez v2, :cond_4

    .line 565
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 566
    if-eqz v1, :cond_4

    .line 567
    new-instance v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;

    invoke-direct {v2, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 584
    :cond_4
    goto :goto_0

    .line 589
    :cond_5
    goto :goto_1

    .line 531
    :catchall_0
    move-exception p0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 587
    :catchall_1
    move-exception p0

    .line 588
    const-string v0, "TomteProSettings"

    const-string v1, "Error attaching stock raw observer"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 590
    :goto_1
    return-void
.end method

.method private static buildOrUpdatePanel(Landroid/widget/LinearLayout;)V
    .locals 14

    .line 305
    if-nez p0, :cond_0

    return-void

    .line 306
    :cond_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    move-result-object v1

    .line 307
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 310
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->enforceSolidBackground(Landroid/view/View;)V

    .line 313
    invoke-static {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->enforceStockHeight(Landroid/widget/LinearLayout;Landroid/content/Context;)V

    .line 315
    const-string v2, "tomte_pro_panel"

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    .line 316
    const/4 v8, 0x1

    if-eqz v3, :cond_2

    .line 317
    invoke-static {v3, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 318
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->attachStockRawObserver(Landroid/widget/LinearLayout;)V

    .line 319
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 320
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    .line 321
    if-lez v0, :cond_1

    sub-int/2addr v0, v8

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eq v0, v3, :cond_1

    .line 322
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 323
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 325
    :cond_1
    return-void

    .line 328
    :cond_2
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 329
    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 330
    invoke-virtual {v9, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 331
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 335
    const/4 v3, 0x4

    invoke-static {v0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    const/16 v5, 0x18

    invoke-static {v0, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    const/4 v10, 0x0

    invoke-virtual {v2, v10, v3, v10, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 336
    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 338
    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v2

    .line 341
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 342
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 344
    invoke-static {v0, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v5, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 346
    const/16 v4, 0x8

    invoke-static {v0, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v5, v2, v6, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 347
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 348
    const v2, 0x1fffffff

    invoke-virtual {v3, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 349
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 352
    const/4 v11, 0x3

    new-array v5, v11, [Ljava/lang/String;

    const-string v2, "95"

    aput-object v2, v5, v10

    const-string v2, "97"

    aput-object v2, v5, v8

    const-string v2, "100"

    const/4 v12, 0x2

    aput-object v2, v5, v12

    new-array v6, v11, [Ljava/lang/String;

    const-string v2, "95% (Standard)"

    aput-object v2, v6, v10

    const-string v2, "97% (High Quality)"

    aput-object v2, v6, v8

    const-string v2, "100% (Maximum Quality)"

    aput-object v2, v6, v12

    new-array v7, v11, [Ljava/lang/String;

    const-string v2, "95%"

    aput-object v2, v7, v10

    const-string v2, "97%"

    aput-object v2, v7, v8

    const-string v2, "100%"

    aput-object v2, v7, v12

    const-string v2, "pref_camera_jpeg_quality_key"

    const-string v3, "JPEG Quality"

    const-string v4, "100"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 364
    new-array v5, v11, [Ljava/lang/String;

    const-string v2, "off"

    aput-object v2, v5, v10

    const-string v2, "low"

    aput-object v2, v5, v8

    const-string v2, "stock"

    aput-object v2, v5, v12

    new-array v6, v11, [Ljava/lang/String;

    const-string v2, "Off (Full Detail)"

    aput-object v2, v6, v10

    const-string v2, "Low (Balanced)"

    aput-object v2, v6, v8

    const-string v2, "Standard (Smooth)"

    aput-object v2, v6, v12

    new-array v7, v11, [Ljava/lang/String;

    const-string v2, "Off"

    aput-object v2, v7, v10

    const-string v2, "Low"

    aput-object v2, v7, v8

    const-string v13, "Standard"

    aput-object v13, v7, v12

    const-string v2, "pref_camera_noise_reduction_key"

    const-string v3, "Spatial Noise Reduction"

    const-string v4, "stock"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 376
    new-array v5, v12, [Ljava/lang/String;

    const-string v2, "uncompressed"

    aput-object v2, v5, v10

    const-string v2, "compressed"

    aput-object v2, v5, v8

    new-array v6, v12, [Ljava/lang/String;

    const-string v2, "16-Bit Uncompressed RAW"

    aput-object v2, v6, v10

    const-string v2, "Standard (Compressed DNG)"

    aput-object v2, v6, v8

    new-array v7, v12, [Ljava/lang/String;

    const-string v2, "16-Bit RAW"

    aput-object v2, v7, v10

    aput-object v13, v7, v8

    const-string v2, "pref_camera_raw_compression_key"

    const-string v3, "RAW DNG Format"

    const-string v4, "compressed"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 388
    new-array v5, v11, [Ljava/lang/String;

    const-string v2, "soft"

    aput-object v2, v5, v10

    const-string v2, "natural"

    aput-object v2, v5, v8

    const-string v2, "standard"

    aput-object v2, v5, v12

    new-array v6, v11, [Ljava/lang/String;

    const-string v2, "Soft (0.0x - Zero Ringing)"

    aput-object v2, v6, v10

    const-string v2, "Natural (0.5x)"

    aput-object v2, v6, v8

    const-string v2, "Standard (1.0x)"

    aput-object v2, v6, v12

    new-array v7, v11, [Ljava/lang/String;

    const-string v2, "Soft"

    aput-object v2, v7, v10

    const-string v2, "Natural"

    aput-object v2, v7, v8

    aput-object v13, v7, v12

    const-string v2, "pref_camera_sharpness_key"

    const-string v3, "Edge Sharpness & De-Ring"

    const-string v4, "standard"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 399
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 401
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->attachStockRawObserver(Landroid/widget/LinearLayout;)V

    .line 402
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 403
    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;

    invoke-direct {v0, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;-><init>(Landroid/widget/LinearLayout;)V

    const-wide/16 v1, 0x64

    invoke-virtual {p0, v0, v1, v2}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 409
    return-void
.end method

.method private static createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;
    .locals 16

    .line 693
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v1, p2

    move-object/from16 v10, p5

    invoke-static {v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v0

    .line 694
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 695
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "row_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 696
    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 697
    const/16 v2, 0x10

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 698
    const/16 v3, 0x8

    invoke-static {v8, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v8, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v11, v0, v4, v0, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 699
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v13, -0x2

    invoke-direct {v0, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 705
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 706
    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 707
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v12, v13, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 710
    invoke-static {v8, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 711
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 714
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 715
    const-string v4, "label_text"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 716
    move-object/from16 v4, p3

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 717
    iget v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v3, v12, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 718
    iget v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 719
    iget-object v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 720
    invoke-virtual {v3, v12, v12, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 721
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 724
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 725
    const-string v3, "value_text"

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 726
    iget v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v4, v12, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 727
    iget v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 728
    iget-object v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 729
    invoke-virtual {v4, v12, v12, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 730
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 733
    const/4 v15, 0x2

    invoke-static {v8, v15}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v3, v12, v5, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 734
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 735
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 737
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 740
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 741
    const-string v0, "button_group"

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 742
    invoke-virtual {v7, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 743
    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 744
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 748
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 749
    move-object/from16 v0, p4

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 750
    nop

    .line 751
    const/4 v3, 0x0

    :goto_0
    array-length v5, v10

    if-ge v3, v5, :cond_1

    .line 752
    aget-object v5, v10, v3

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 753
    nop

    .line 754
    move v0, v3

    goto :goto_1

    .line 751
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 757
    :goto_1
    aget-object v3, p6, v0

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 759
    const/4 v6, 0x0

    :goto_2
    array-length v3, v10

    if-ge v6, v3, :cond_4

    .line 760
    nop

    .line 761
    aget-object v3, v10, v6

    .line 762
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 763
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "btn_"

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 764
    aget-object v12, p7, v6

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 765
    const/high16 v12, 0x41500000    # 13.0f

    invoke-virtual {v5, v15, v12}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 766
    const/16 v12, 0x11

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 767
    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 768
    const/16 v12, 0xd

    invoke-static {v8, v12}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v13

    invoke-static {v8, v12}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v12

    const/4 v14, 0x0

    invoke-virtual {v5, v13, v14, v12, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 769
    const/16 v12, 0x2a

    invoke-static {v8, v12}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setMinimumWidth(I)V

    .line 771
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    .line 773
    const/16 v13, 0x26

    invoke-static {v8, v13}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v13

    const/4 v14, -0x2

    invoke-direct {v12, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 775
    if-lez v6, :cond_2

    .line 776
    const/4 v13, 0x6

    invoke-static {v8, v13}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 778
    :cond_2
    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 780
    if-ne v6, v0, :cond_3

    const/4 v12, 0x1

    goto :goto_3

    :cond_3
    const/4 v12, 0x0

    .line 781
    :goto_3
    invoke-static {v8, v5, v12, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 783
    move v12, v0

    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;

    move-object v13, v5

    move-object/from16 v5, p6

    invoke-direct/range {v0 .. v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;-><init>(Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/TextView;[Ljava/lang/String;ILandroid/widget/LinearLayout;Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 808
    invoke-virtual {v7, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 759
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v1, p2

    move v0, v12

    const/4 v12, 0x0

    const/4 v13, -0x2

    const/4 v14, 0x1

    goto/16 :goto_2

    .line 811
    :cond_4
    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 812
    return-object v11
.end method

.method private static dpToPx(Landroid/content/Context;I)I
    .locals 1

    .line 901
    int-to-float p1, p1

    .line 904
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 901
    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method private static enforceSolidBackground(Landroid/view/View;)V
    .locals 3

    .line 623
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    .line 624
    if-eqz p0, :cond_1

    .line 625
    const v0, 0x7f0a03fd

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 626
    if-eqz p0, :cond_1

    .line 627
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 628
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    const/high16 v2, -0x1000000

    if-eqz v1, :cond_0

    .line 629
    move-object p0, v0

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 630
    const/16 p0, 0xff

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 632
    :cond_0
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 636
    :catchall_0
    move-exception p0

    :cond_1
    :goto_0
    nop

    .line 637
    return-void
.end method

.method private static enforceStockHeight(Landroid/widget/LinearLayout;Landroid/content/Context;)V
    .locals 4

    .line 641
    nop

    .line 642
    nop

    .line 643
    const/4 v0, 0x0

    move-object v1, v0

    .line 644
    :goto_0
    if-eqz p0, :cond_2

    .line 645
    if-nez v1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OptionsMenuView"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 646
    move-object v1, p0

    .line 648
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "AutobahnViewPager"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 649
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 650
    goto :goto_1

    .line 652
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_2

    .line 653
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    .line 659
    :cond_2
    :goto_1
    nop

    .line 660
    const/4 p0, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lez v2, :cond_3

    .line 661
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 662
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    if-lez v2, :cond_3

    .line 663
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    .line 666
    :cond_3
    if-gtz p0, :cond_4

    .line 668
    const/16 p0, 0x136

    invoke-static {p1, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    .line 671
    :cond_4
    if-eqz v1, :cond_5

    .line 672
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 673
    if-eqz p1, :cond_5

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, p0, :cond_5

    .line 674
    iput p0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 675
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 678
    :catchall_0
    move-exception p0

    .line 679
    const-string p1, "TomteProSettings"

    const-string v0, "Error enforcing stock height"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 680
    :cond_5
    :goto_2
    nop

    .line 681
    :goto_3
    return-void
.end method

.method private static findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;
    .locals 6

    .line 100
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 102
    :cond_0
    :try_start_0
    instance-of v1, p0, Landroid/widget/LinearLayout;

    const v2, 0x7f0a03c5

    if-eqz v1, :cond_1

    move-object v1, p0

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getId()I

    move-result v1

    if-ne v1, v2, :cond_1

    .line 103
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 105
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 106
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 107
    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_2

    .line 108
    check-cast v1, Landroid/widget/LinearLayout;

    return-object v1

    .line 112
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "q"

    invoke-static {v1, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 113
    if-eqz v1, :cond_3

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_3
    move-object v1, v0

    .line 115
    :goto_0
    const v3, 0x7f0a03ca

    if-nez v1, :cond_5

    .line 116
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "o"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 117
    if-eqz v4, :cond_4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_1

    :cond_4
    move-object v4, v0

    .line 118
    :goto_1
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_5

    .line 119
    move-object v1, v4

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 120
    if-nez v1, :cond_5

    .line 121
    move-object v1, v4

    .line 126
    :cond_5
    if-nez v1, :cond_7

    .line 127
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "k"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 128
    if-eqz v4, :cond_6

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_2

    :cond_6
    move-object p0, v0

    .line 129
    :goto_2
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_7

    .line 130
    check-cast p0, Landroid/view/ViewGroup;

    const v4, 0x7f0a03c3

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 131
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_7

    .line 132
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 133
    if-nez v1, :cond_7

    .line 134
    move-object v1, p0

    .line 140
    :cond_7
    nop

    instance-of p0, v1, Landroid/view/ViewGroup;

    if-eqz p0, :cond_9

    .line 141
    move-object p0, v1

    check-cast p0, Landroid/view/ViewGroup;

    .line 142
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 143
    instance-of v2, p0, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_8

    .line 144
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 146
    :cond_8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v2, "l"

    invoke-static {p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    .line 147
    if-eqz p0, :cond_9

    .line 148
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 149
    instance-of v1, p0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_9

    .line 150
    check-cast p0, Landroid/widget/LinearLayout;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 156
    :cond_9
    goto :goto_3

    .line 154
    :catchall_0
    move-exception p0

    .line 155
    const-string v1, "TomteProSettings"

    const-string v2, "Error finding pro internal list"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 157
    :goto_3
    return-object v0
.end method

.method private static findStockRawRow(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    .line 412
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 414
    :cond_0
    const/4 v1, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, "prg"

    if-ge v1, v2, :cond_3

    .line 415
    :try_start_1
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 416
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 417
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "r"

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 418
    if-eqz v3, :cond_1

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    goto :goto_1

    :cond_1
    move-object v3, v0

    .line 419
    :goto_1
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 420
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    .line 421
    const-string v4, "RAW"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 422
    return-object v2

    .line 414
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 427
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_4

    .line 428
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    .line 429
    if-eqz p0, :cond_4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_4

    .line 430
    return-object p0

    .line 435
    :cond_4
    goto :goto_2

    .line 433
    :catchall_0
    move-exception p0

    .line 434
    const-string v1, "TomteProSettings"

    const-string v2, "Error finding stock RAW row"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 436
    :goto_2
    return-object v0
.end method

.method private static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .line 161
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 163
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 164
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    return-object v0

    .line 166
    :catch_0
    move-exception v0

    .line 167
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 168
    goto :goto_0

    .line 170
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 0

    .line 892
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getFont(I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 893
    :catchall_0
    move-exception p0

    .line 895
    :try_start_1
    invoke-static {p2, p3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    .line 896
    :catchall_1
    move-exception p0

    .line 897
    invoke-static {p3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method private static getHorizontalMargin(Landroid/content/Context;)I
    .locals 4

    .line 882
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "bottom_panel_title_horizontal_margin"

    const-string v2, "dimen"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 883
    if-eqz v0, :cond_0

    .line 884
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 886
    :catchall_0
    move-exception v0

    :cond_0
    nop

    .line 887
    const/16 v0, 0x10

    invoke-static {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public static injectProSettings(Ljava/lang/Object;)V
    .locals 2

    .line 56
    if-nez p0, :cond_0

    return-void

    .line 58
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 59
    if-eqz v0, :cond_1

    .line 60
    nop

    .line 61
    new-instance p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;

    invoke-direct {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    const-wide/16 v0, 0x50

    invoke-static {p0, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V

    .line 73
    const-wide/16 v0, 0xfa

    invoke-static {p0, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    :goto_0
    goto :goto_1

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    const-string v0, "TomteProSettings"

    const-string v1, "Failed to inject Pro Settings"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 78
    :goto_1
    return-void
.end method

.method private static isRawCaptureEnabled(Landroid/view/ViewGroup;)Z
    .locals 7

    .line 440
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 442
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findStockRawRow(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 443
    if-eqz v2, :cond_6

    .line 445
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "p"

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 446
    if-eqz v3, :cond_2

    .line 447
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 448
    if-eqz v3, :cond_2

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_2

    .line 450
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 451
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_1

    .line 452
    check-cast v4, Landroid/view/ViewGroup;

    .line 453
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-lez v5, :cond_1

    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 454
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->isSelected()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 455
    return v1

    .line 459
    :cond_1
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 460
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2

    .line 461
    check-cast v3, Landroid/view/ViewGroup;

    .line 462
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-lez v4, :cond_2

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 463
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->isSelected()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 464
    return v0

    .line 472
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "s"

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 473
    if-eqz v3, :cond_3

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .line 474
    :goto_0
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 475
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 476
    const-string v3, "raw"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 477
    return v1

    .line 479
    :cond_4
    const-string v3, "jpeg only"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "only"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_6

    .line 480
    :cond_5
    return v0

    .line 486
    :cond_6
    goto :goto_1

    .line 484
    :catchall_0
    move-exception v2

    .line 485
    const-string v3, "TomteProSettings"

    const-string v4, "Error checking isRawCaptureEnabled from view"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 490
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 491
    nop

    .line 492
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_preferences_camera"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 491
    invoke-virtual {p0, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 494
    const-string v3, "true"

    const-string v4, "1"

    const-string v5, "pref_camera_raw_output_key"

    if-eqz v2, :cond_c

    :try_start_2
    invoke-interface {v2, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 495
    invoke-interface {v2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 496
    instance-of v6, v2, Ljava/lang/Boolean;

    if-eqz v6, :cond_7

    .line 497
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    .line 498
    :cond_7
    instance-of v6, v2, Ljava/lang/String;

    if-eqz v6, :cond_a

    .line 499
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9

    :cond_8
    const/4 v0, 0x1

    :cond_9
    return v0

    .line 500
    :cond_a
    instance-of v6, v2, Ljava/lang/Integer;

    if-eqz v6, :cond_c

    .line 501
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-eqz p0, :cond_b

    const/4 v0, 0x1

    :cond_b
    return v0

    .line 504
    :cond_c
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 505
    if-eqz p0, :cond_12

    invoke-interface {p0, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 506
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 507
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_d

    .line 508
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    .line 509
    :cond_d
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_10

    .line 510
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_f

    :cond_e
    const/4 v0, 0x1

    :cond_f
    return v0

    .line 511
    :cond_10
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_12

    .line 512
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p0, :cond_11

    const/4 v0, 0x1

    :cond_11
    return v0

    .line 515
    :catchall_1
    move-exception p0

    :cond_12
    nop

    .line 517
    return v0
.end method

.method private static refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 11

    .line 837
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 838
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 839
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    .line 840
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 841
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 842
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_4

    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "row_"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 843
    move-object v5, v4

    check-cast v5, Landroid/view/ViewGroup;

    .line 844
    const-string v6, "label_text"

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 845
    const-string v7, "value_text"

    invoke-virtual {v5, v7}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 846
    if-eqz v6, :cond_1

    .line 847
    iget v8, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 848
    iget v8, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v6, v2, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 849
    iget-object v8, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 851
    :cond_1
    if-eqz v7, :cond_2

    .line 852
    iget v6, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 853
    iget v6, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v7, v2, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 854
    iget-object v6, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 856
    :cond_2
    const-string v6, "button_group"

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 857
    if-eqz v5, :cond_4

    .line 858
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 859
    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 860
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 861
    const-string v7, ""

    invoke-interface {v6, v4, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 863
    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-ge v6, v8, :cond_4

    .line 864
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 865
    instance-of v9, v8, Landroid/widget/TextView;

    if-eqz v9, :cond_3

    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 866
    check-cast v8, Landroid/widget/TextView;

    .line 867
    invoke-virtual {v8}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "btn_"

    invoke-virtual {v9, v10, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 868
    invoke-virtual {v9, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    .line 869
    invoke-static {v0, v8, v9, p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 863
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 840
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 875
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_6

    .line 876
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 878
    :cond_6
    return-void
.end method

.method private static resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;
    .locals 12

    .line 174
    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-direct {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;-><init>()V

    .line 175
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 178
    nop

    .line 180
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x1

    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_a

    .line 181
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 182
    if-eqz v6, :cond_9

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "prg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 183
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "r"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 184
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "s"

    invoke-static {v8, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 185
    const/4 v9, 0x0

    if-eqz v7, :cond_0

    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    goto :goto_1

    :cond_0
    move-object v7, v9

    .line 186
    :goto_1
    if-eqz v8, :cond_1

    invoke-virtual {v8, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    goto :goto_2

    :cond_1
    move-object v8, v9

    .line 188
    :goto_2
    if-eqz v7, :cond_2

    .line 189
    invoke-virtual {v7}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 190
    invoke-virtual {v7}, Landroid/widget/TextView;->getTextSize()F

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 191
    invoke-virtual {v7}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 193
    :cond_2
    if-eqz v8, :cond_3

    .line 194
    invoke-virtual {v8}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 195
    invoke-virtual {v8}, Landroid/widget/TextView;->getTextSize()F

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 196
    invoke-virtual {v8}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 199
    :cond_3
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "p"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 200
    if-eqz v7, :cond_8

    .line 201
    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 202
    if-eqz v6, :cond_8

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    .line 203
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 204
    instance-of v8, v7, Landroid/view/ViewGroup;

    if-eqz v8, :cond_7

    .line 205
    check-cast v7, Landroid/view/ViewGroup;

    .line 206
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_7

    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_7

    .line 207
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 208
    invoke-virtual {v7}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v8

    .line 209
    nop

    .line 210
    instance-of v10, v7, Landroid/widget/ImageView;

    if-eqz v10, :cond_4

    .line 211
    check-cast v7, Landroid/widget/ImageView;

    invoke-virtual {v7}, Landroid/widget/ImageView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object v7

    goto :goto_4

    .line 210
    :cond_4
    move-object v7, v9

    .line 213
    :goto_4
    const v10, 0x10100a1

    if-eqz v8, :cond_5

    .line 214
    filled-new-array {v10}, [I

    move-result-object v11

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v11

    iput v11, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 217
    new-array v11, v2, [I

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 221
    :cond_5
    if-eqz v7, :cond_6

    .line 222
    filled-new-array {v10}, [I

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 225
    new-array v8, v2, [I

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 229
    :cond_6
    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-eqz v7, :cond_7

    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_7

    .line 230
    nop

    .line 231
    const/4 v4, 0x1

    goto :goto_5

    .line 235
    :cond_7
    goto :goto_3

    .line 238
    :cond_8
    :goto_5
    if-eqz v4, :cond_9

    goto :goto_6

    .line 180
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 243
    :cond_a
    :goto_6
    goto :goto_7

    .line 241
    :catchall_0
    move-exception p0

    .line 242
    const-string v3, "TomteProSettings"

    const-string v4, "Error extracting palette from stock row"

    invoke-static {v3, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 246
    :goto_7
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 247
    const p0, 0x1010530

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 248
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 249
    const p0, 0x7f04015f

    const v3, -0x573806

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 252
    :cond_b
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 253
    const p0, 0x7f040167

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 254
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 255
    const p0, 0x7f040168

    const v3, -0xe3e6e8

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 258
    :cond_c
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 259
    const p0, 0x7f040129

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 260
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 261
    const p0, 0x7f040134

    const v3, -0xfbe1b7

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 264
    :cond_d
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    const v3, -0x1d1d17

    const v4, 0x7f04013c

    if-nez p0, :cond_e

    .line 265
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 267
    :cond_e
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    if-nez p0, :cond_f

    .line 268
    const p0, 0x7f040140

    const v6, -0x383a3c

    invoke-static {v1, p0, v6}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 270
    :cond_f
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    if-nez p0, :cond_10

    .line 271
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 275
    :cond_10
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_11

    .line 276
    const p0, 0x7f09002a

    const-string v3, "google-sans"

    invoke-static {v1, p0, v3, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 278
    :cond_11
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_12

    .line 279
    const p0, 0x7f09003a

    const-string v2, "google-sans-medium"

    invoke-static {v1, p0, v2, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 281
    :cond_12
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    const/4 v2, 0x2

    const/4 v3, 0x0

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_13

    .line 282
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v4, 0x41480000    # 12.5f

    invoke-static {v2, v4, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 284
    :cond_13
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_14

    .line 285
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v1, 0x41840000    # 16.5f

    invoke-static {v2, v1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 288
    :cond_14
    return-object v0
.end method

.method private static resolveThemeColor(Landroid/content/Context;II)I
    .locals 3

    .line 293
    :try_start_0
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 294
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 295
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_0

    .line 296
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0

    .line 298
    :cond_0
    iget p0, v0, Landroid/util/TypedValue;->data:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 300
    :catchall_0
    move-exception p0

    :cond_1
    nop

    .line 301
    return p2
.end method

.method private static scheduleRetry(Ljava/lang/Object;J)V
    .locals 2

    .line 82
    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 83
    new-instance v1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;

    invoke-direct {v1, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 96
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 97
    return-void
.end method

.method private static updateRawFormatRowState(Landroid/view/ViewGroup;)V
    .locals 3

    .line 593
    if-nez p0, :cond_0

    return-void

    .line 595
    :cond_0
    :try_start_0
    const-string v0, "tomte_pro_panel"

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 596
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    return-void

    .line 597
    :cond_1
    check-cast v0, Landroid/view/ViewGroup;

    const-string v1, "row_pref_camera_raw_compression_key"

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 598
    if-nez v0, :cond_2

    return-void

    .line 600
    :cond_2
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isRawCaptureEnabled(Landroid/view/ViewGroup;)Z

    move-result p0

    .line 602
    if-eqz p0, :cond_3

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_3
    const v1, 0x3ec28f5c    # 0.38f

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 603
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 605
    const-string v1, "button_group"

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 606
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_5

    .line 607
    check-cast v0, Landroid/view/ViewGroup;

    .line 608
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 609
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 610
    if-eqz v2, :cond_4

    .line 611
    invoke-virtual {v2, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 612
    invoke-virtual {v2, p0}, Landroid/view/View;->setClickable(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 608
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 618
    :cond_5
    goto :goto_2

    .line 616
    :catchall_0
    move-exception p0

    .line 617
    const-string v0, "TomteProSettings"

    const-string v1, "Error updating raw format row state"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 619
    :goto_2
    return-void
.end method
