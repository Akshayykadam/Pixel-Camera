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

.method static bridge synthetic -$$Nest$smbuildOrUpdatePanel(Ljava/lang/Object;Landroid/widget/LinearLayout;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->buildOrUpdatePanel(Ljava/lang/Object;Landroid/widget/LinearLayout;)V

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

    .line 852
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 854
    const/16 v1, 0x64

    invoke-static {p0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 855
    if-eqz p2, :cond_0

    .line 856
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 857
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 858
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 859
    iget-object p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 861
    :cond_0
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 862
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 863
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 864
    iget-object p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 866
    :goto_0
    return-void
.end method

.method private static attachStockRawObserver(Landroid/widget/LinearLayout;)V
    .locals 4

    .line 591
    if-nez p0, :cond_0

    return-void

    .line 593
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findStockRawRow(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 594
    if-nez v0, :cond_1

    return-void

    .line 596
    :cond_1
    sget-object v1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 597
    :try_start_1
    sget-object v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 598
    monitor-exit v1

    return-void

    .line 600
    :cond_2
    sget-object v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->observedRows:Ljava/util/WeakHashMap;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0, v3}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 604
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "s"

    invoke-static {v1, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 605
    if-eqz v1, :cond_3

    .line 606
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 607
    if-eqz v1, :cond_3

    .line 608
    new-instance v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;

    invoke-direct {v2, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 627
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "p"

    invoke-static {v1, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 628
    if-eqz v1, :cond_5

    .line 629
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 630
    if-eqz v0, :cond_5

    .line 631
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 632
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_4

    .line 633
    check-cast v1, Landroid/view/ViewGroup;

    .line 634
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lez v2, :cond_4

    .line 635
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 636
    if-eqz v1, :cond_4

    .line 637
    new-instance v2, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;

    invoke-direct {v2, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$5;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 654
    :cond_4
    goto :goto_0

    .line 659
    :cond_5
    goto :goto_1

    .line 601
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

    .line 657
    :catchall_1
    move-exception p0

    .line 658
    const-string v0, "TomteProSettings"

    const-string v1, "Error attaching stock raw observer"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 660
    :goto_1
    return-void
.end method

.method private static buildOrUpdatePanel(Ljava/lang/Object;Landroid/widget/LinearLayout;)V
    .locals 13

    .line 379
    if-nez p1, :cond_0

    return-void

    .line 382
    :cond_0
    invoke-static {p0, p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isPhotoMode(Ljava/lang/Object;Landroid/view/View;)Z

    move-result p0

    const-string v0, "tomte_pro_panel"

    if-nez p0, :cond_2

    .line 383
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 384
    if-eqz p0, :cond_1

    .line 385
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 387
    :cond_1
    return-void

    .line 390
    :cond_2
    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    move-result-object v1

    .line 391
    move-object p0, v0

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 394
    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->enforceSolidBackground(Landroid/view/View;)V

    .line 396
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    .line 397
    const/4 v8, 0x1

    if-eqz v2, :cond_4

    .line 398
    invoke-static {v2, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 399
    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->attachStockRawObserver(Landroid/widget/LinearLayout;)V

    .line 400
    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 401
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p0

    .line 402
    if-lez p0, :cond_3

    sub-int/2addr p0, v8

    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    if-eq p0, v2, :cond_3

    .line 403
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 404
    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 406
    :cond_3
    return-void

    .line 409
    :cond_4
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 410
    invoke-virtual {v9, p0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 411
    invoke-virtual {v9, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 412
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {p0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 416
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v10, v10, v10}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 417
    invoke-virtual {v9, p0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 419
    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    .line 422
    const/4 p0, 0x3

    new-array v5, p0, [Ljava/lang/String;

    const-string v2, "95"

    aput-object v2, v5, v10

    const-string v2, "97"

    aput-object v2, v5, v8

    const-string v2, "100"

    const/4 v11, 0x2

    aput-object v2, v5, v11

    new-array v6, p0, [Ljava/lang/String;

    const-string v2, "95% (Standard)"

    aput-object v2, v6, v10

    const-string v2, "97% (High Quality)"

    aput-object v2, v6, v8

    const-string v2, "100% (Maximum Quality)"

    aput-object v2, v6, v11

    new-array v7, p0, [Ljava/lang/String;

    const-string v2, "95%"

    aput-object v2, v7, v10

    const-string v2, "97%"

    aput-object v2, v7, v8

    const-string v2, "100%"

    aput-object v2, v7, v11

    const-string v2, "pref_camera_jpeg_quality_key"

    const-string v3, "JPEG Quality"

    const-string v4, "100"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 434
    new-array v5, p0, [Ljava/lang/String;

    const-string v2, "off"

    aput-object v2, v5, v10

    const-string v2, "low"

    aput-object v2, v5, v8

    const-string v2, "stock"

    aput-object v2, v5, v11

    new-array v6, p0, [Ljava/lang/String;

    const-string v2, "Off (Full Detail)"

    aput-object v2, v6, v10

    const-string v2, "Low (Balanced)"

    aput-object v2, v6, v8

    const-string v2, "Standard (Smooth)"

    aput-object v2, v6, v11

    new-array v7, p0, [Ljava/lang/String;

    const-string v2, "Off"

    aput-object v2, v7, v10

    const-string v2, "Low"

    aput-object v2, v7, v8

    const-string v12, "Standard"

    aput-object v12, v7, v11

    const-string v2, "pref_camera_noise_reduction_key"

    const-string v3, "Spatial Noise Reduction"

    const-string v4, "stock"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 446
    new-array v5, v11, [Ljava/lang/String;

    const-string v2, "uncompressed"

    aput-object v2, v5, v10

    const-string v2, "compressed"

    aput-object v2, v5, v8

    new-array v6, v11, [Ljava/lang/String;

    const-string v2, "16-Bit Uncompressed RAW"

    aput-object v2, v6, v10

    const-string v2, "Standard (Compressed DNG)"

    aput-object v2, v6, v8

    new-array v7, v11, [Ljava/lang/String;

    const-string v2, "16-Bit RAW"

    aput-object v2, v7, v10

    aput-object v12, v7, v8

    const-string v2, "pref_camera_raw_compression_key"

    const-string v3, "RAW DNG Format"

    const-string v4, "compressed"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 458
    new-array v5, p0, [Ljava/lang/String;

    const-string v2, "soft"

    aput-object v2, v5, v10

    const-string v2, "natural"

    aput-object v2, v5, v8

    const-string v2, "standard"

    aput-object v2, v5, v11

    new-array v6, p0, [Ljava/lang/String;

    const-string v2, "Soft (0.0x - Zero Ringing)"

    aput-object v2, v6, v10

    const-string v2, "Natural (0.5x)"

    aput-object v2, v6, v8

    const-string v2, "Standard (1.0x)"

    aput-object v2, v6, v11

    new-array v7, p0, [Ljava/lang/String;

    const-string p0, "Soft"

    aput-object p0, v7, v10

    const-string p0, "Natural"

    aput-object p0, v7, v8

    aput-object v12, v7, v11

    const-string v2, "pref_camera_sharpness_key"

    const-string v3, "Edge Sharpness & De-Ring"

    const-string v4, "standard"

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v9, p0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 469
    invoke-virtual {p1, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 471
    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->attachStockRawObserver(Landroid/widget/LinearLayout;)V

    .line 472
    invoke-static {p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 473
    new-instance p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;

    invoke-direct {p0, p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;-><init>(Landroid/widget/LinearLayout;)V

    const-wide/16 v0, 0x64

    invoke-virtual {p1, p0, v0, v1}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 479
    return-void
.end method

.method private static createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;
    .locals 16

    .line 721
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v1, p2

    move-object/from16 v10, p5

    invoke-static {v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v0

    .line 722
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 723
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

    .line 724
    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 725
    const/16 v2, 0x10

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 727
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 729
    const/16 v4, 0x38

    invoke-static {v8, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    const/4 v6, -0x1

    invoke-direct {v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 727
    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 731
    invoke-static {v8, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 732
    invoke-virtual {v11, v0, v12, v0, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 735
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 736
    const/4 v13, 0x1

    invoke-virtual {v0, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 737
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v14, -0x2

    invoke-direct {v3, v12, v14, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 740
    const/16 v4, 0x8

    invoke-static {v8, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 741
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 744
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 745
    const-string v4, "label_text"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 746
    move-object/from16 v4, p3

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 747
    iget v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v3, v12, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 748
    iget v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 749
    iget-object v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 750
    invoke-virtual {v3, v12, v12, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 751
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 754
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 755
    const-string v3, "value_text"

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 756
    iget v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v4, v12, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 757
    iget v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 758
    iget-object v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 759
    invoke-virtual {v4, v12, v12, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 760
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 763
    invoke-virtual {v3, v12, v12, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 764
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 765
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 767
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 770
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 771
    const-string v0, "button_group"

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 772
    invoke-virtual {v7, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 773
    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 774
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 778
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 779
    move-object/from16 v0, p4

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 780
    nop

    .line 781
    const/4 v3, 0x0

    :goto_0
    array-length v5, v10

    if-ge v3, v5, :cond_1

    .line 782
    aget-object v5, v10, v3

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 783
    nop

    .line 784
    move v15, v3

    goto :goto_1

    .line 781
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v15, 0x0

    .line 787
    :goto_1
    aget-object v0, p6, v15

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 789
    const/4 v6, 0x0

    :goto_2
    array-length v0, v10

    if-ge v6, v0, :cond_4

    .line 790
    nop

    .line 791
    aget-object v3, v10, v6

    .line 792
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 793
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "btn_"

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 794
    aget-object v5, p7, v6

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 795
    const/4 v5, 0x2

    const/high16 v14, 0x41480000    # 12.5f

    invoke-virtual {v0, v5, v14}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 796
    const/16 v5, 0x11

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setGravity(I)V

    .line 797
    invoke-virtual {v0, v13}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 798
    const/16 v5, 0xc

    invoke-static {v8, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v14

    invoke-static {v8, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v0, v14, v12, v5, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 799
    const/16 v5, 0x28

    invoke-static {v8, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setMinimumWidth(I)V

    .line 802
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    .line 804
    invoke-static {v8, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    const/4 v12, -0x2

    invoke-direct {v14, v12, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 806
    if-lez v6, :cond_2

    .line 807
    const/4 v5, 0x4

    invoke-static {v8, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v14, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 809
    :cond_2
    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 811
    if-ne v6, v15, :cond_3

    const/4 v5, 0x1

    goto :goto_3

    :cond_3
    const/4 v5, 0x0

    .line 812
    :goto_3
    invoke-static {v8, v0, v5, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 814
    move-object v5, v0

    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;

    move-object v14, v5

    move-object/from16 v5, p6

    invoke-direct/range {v0 .. v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$6;-><init>(Ljava/lang/String;Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/widget/TextView;[Ljava/lang/String;ILandroid/widget/LinearLayout;Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    invoke-virtual {v14, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 839
    invoke-virtual {v7, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 789
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v1, p2

    const/4 v12, 0x0

    const/4 v14, -0x2

    goto/16 :goto_2

    .line 842
    :cond_4
    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 843
    return-object v11
.end method

.method private static dpToPx(Landroid/content/Context;I)I
    .locals 1

    .line 933
    int-to-float p1, p1

    .line 936
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 933
    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method private static enforceSolidBackground(Landroid/view/View;)V
    .locals 3

    .line 695
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    .line 696
    if-eqz p0, :cond_1

    .line 697
    const v0, 0x7f0a03fd

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 698
    if-eqz p0, :cond_1

    .line 699
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 700
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    const/high16 v2, -0x1000000

    if-eqz v1, :cond_0

    .line 701
    move-object p0, v0

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 702
    const/16 p0, 0xff

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 704
    :cond_0
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 708
    :catchall_0
    move-exception p0

    :cond_1
    :goto_0
    nop

    .line 709
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
    .locals 6

    .line 482
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 484
    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v4, "prg"

    if-ge v2, v3, :cond_3

    .line 485
    :try_start_1
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 486
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 487
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "r"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 488
    if-eqz v4, :cond_1

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    goto :goto_1

    :cond_1
    move-object v4, v0

    .line 489
    :goto_1
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 490
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    .line 491
    const-string v5, "RAW"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 492
    return-object v3

    .line 484
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 497
    :cond_3
    nop

    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 498
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 499
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_4

    .line 500
    return-object v2

    .line 497
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 505
    :cond_5
    goto :goto_3

    .line 503
    :catchall_0
    move-exception p0

    .line 504
    const-string v1, "TomteProSettings"

    const-string v2, "Error finding stock RAW row"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 506
    :goto_3
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

    .line 924
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getFont(I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 925
    :catchall_0
    move-exception p0

    .line 927
    :try_start_1
    invoke-static {p2, p3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    .line 928
    :catchall_1
    move-exception p0

    .line 929
    invoke-static {p3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method private static getHorizontalMargin(Landroid/content/Context;)I
    .locals 4

    .line 914
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "bottom_panel_title_horizontal_margin"

    const-string v2, "dimen"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 915
    if-eqz v0, :cond_0

    .line 916
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 918
    :catchall_0
    move-exception v0

    :cond_0
    nop

    .line 919
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
    new-instance v1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;-><init>(Ljava/lang/Object;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

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

.method private static isNotPhotoModeName(Ljava/lang/String;)Z
    .locals 2

    .line 174
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 175
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 176
    const-string v1, "VIDEO"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "SLOW_MOTION"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "TIME_LAPSE"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 177
    const-string v1, "CINEMATIC"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "AMBER"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    .line 176
    :cond_2
    return v0
.end method

.method private static isPhotoMode(Ljava/lang/Object;Landroid/view/View;)Z
    .locals 6

    .line 187
    const-string v0, "d"

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p0, :cond_6

    .line 189
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "e"

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 190
    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 191
    instance-of v4, v3, Ljava/lang/Enum;

    if-eqz v4, :cond_1

    .line 192
    check-cast v3, Ljava/lang/Enum;

    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v3

    .line 193
    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isNotPhotoModeName(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    return v2

    .line 194
    :cond_0
    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isPhotoModeName(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    return v1

    .line 196
    :catchall_0
    move-exception v3

    :cond_1
    nop

    .line 199
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "F"

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 200
    if-eqz v3, :cond_3

    .line 201
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 202
    instance-of v4, v3, Ljava/lang/Enum;

    if-eqz v4, :cond_3

    .line 203
    check-cast v3, Ljava/lang/Enum;

    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v3

    .line 204
    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isNotPhotoModeName(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    return v2

    .line 205
    :cond_2
    invoke-static {v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isPhotoModeName(Ljava/lang/String;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v3, :cond_3

    return v1

    .line 208
    :catchall_1
    move-exception v3

    :cond_3
    nop

    .line 211
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 212
    if-eqz v3, :cond_5

    .line 213
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 214
    if-eqz p0, :cond_5

    .line 215
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 216
    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 217
    instance-of v0, p0, Ljava/lang/Enum;

    if-eqz v0, :cond_5

    .line 218
    check-cast p0, Ljava/lang/Enum;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    .line 219
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isNotPhotoModeName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    return v2

    .line 220
    :cond_4
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isPhotoModeName(Ljava/lang/String;)Z

    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p0, :cond_5

    return v1

    .line 224
    :catchall_2
    move-exception p0

    :cond_5
    nop

    .line 227
    :cond_6
    if-eqz p1, :cond_9

    .line 229
    :try_start_3
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    .line 230
    if-eqz p0, :cond_8

    .line 231
    const p1, 0x7f0a00bf

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 232
    instance-of p1, p0, Landroid/widget/TextView;

    if-eqz p1, :cond_8

    .line 233
    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    .line 234
    if-eqz p0, :cond_8

    .line 235
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 236
    const-string p1, "video"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_7

    return v2

    .line 237
    :cond_7
    const-string p1, "photo"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    if-eqz p0, :cond_8

    return v1

    .line 241
    :catchall_3
    move-exception p0

    :cond_8
    nop

    .line 244
    :cond_9
    return v1
.end method

.method private static isPhotoModeName(Ljava/lang/String;)Z
    .locals 2

    .line 181
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 182
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p0

    .line 183
    const-string v1, "PHOTO"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "NIGHT_SIGHT"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "PORTRAIT"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method private static isRawCaptureEnabled(Landroid/view/ViewGroup;)Z
    .locals 7

    .line 510
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 512
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findStockRawRow(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 513
    if-eqz v2, :cond_6

    .line 515
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "p"

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 516
    if-eqz v3, :cond_2

    .line 517
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 518
    if-eqz v3, :cond_2

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_2

    .line 520
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 521
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_1

    .line 522
    check-cast v4, Landroid/view/ViewGroup;

    .line 523
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    if-lez v5, :cond_1

    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 524
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->isSelected()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 525
    return v1

    .line 529
    :cond_1
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 530
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2

    .line 531
    check-cast v3, Landroid/view/ViewGroup;

    .line 532
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-lez v4, :cond_2

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 533
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->isSelected()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 534
    return v0

    .line 542
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "s"

    invoke-static {v3, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 543
    if-eqz v3, :cond_3

    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .line 544
    :goto_0
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 545
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 546
    const-string v3, "raw"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 547
    return v1

    .line 549
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

    .line 550
    :cond_5
    return v0

    .line 556
    :cond_6
    goto :goto_1

    .line 554
    :catchall_0
    move-exception v2

    .line 555
    const-string v3, "TomteProSettings"

    const-string v4, "Error checking isRawCaptureEnabled from view"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 560
    :goto_1
    :try_start_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 561
    nop

    .line 562
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

    .line 561
    invoke-virtual {p0, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 564
    const-string v3, "true"

    const-string v4, "1"

    const-string v5, "pref_camera_raw_output_key"

    if-eqz v2, :cond_c

    :try_start_2
    invoke-interface {v2, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 565
    invoke-interface {v2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 566
    instance-of v6, v2, Ljava/lang/Boolean;

    if-eqz v6, :cond_7

    .line 567
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    .line 568
    :cond_7
    instance-of v6, v2, Ljava/lang/String;

    if-eqz v6, :cond_a

    .line 569
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

    .line 570
    :cond_a
    instance-of v6, v2, Ljava/lang/Integer;

    if-eqz v6, :cond_c

    .line 571
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-eqz p0, :cond_b

    const/4 v0, 0x1

    :cond_b
    return v0

    .line 574
    :cond_c
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 575
    if-eqz p0, :cond_12

    invoke-interface {p0, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 576
    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 577
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_d

    .line 578
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    .line 579
    :cond_d
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_10

    .line 580
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

    .line 581
    :cond_10
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_12

    .line 582
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p0, :cond_11

    const/4 v0, 0x1

    :cond_11
    return v0

    .line 585
    :catchall_1
    move-exception p0

    :cond_12
    nop

    .line 587
    return v0
.end method

.method private static refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 11

    .line 869
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 870
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 871
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    .line 872
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 873
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 874
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

    .line 875
    move-object v5, v4

    check-cast v5, Landroid/view/ViewGroup;

    .line 876
    const-string v6, "label_text"

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 877
    const-string v7, "value_text"

    invoke-virtual {v5, v7}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 878
    if-eqz v6, :cond_1

    .line 879
    iget v8, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 880
    iget v8, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v6, v2, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 881
    iget-object v8, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 883
    :cond_1
    if-eqz v7, :cond_2

    .line 884
    iget v6, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 885
    iget v6, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v7, v2, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 886
    iget-object v6, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 888
    :cond_2
    const-string v6, "button_group"

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 889
    if-eqz v5, :cond_4

    .line 890
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 891
    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 892
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 893
    const-string v7, ""

    invoke-interface {v6, v4, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 895
    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-ge v6, v8, :cond_4

    .line 896
    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 897
    instance-of v9, v8, Landroid/widget/TextView;

    if-eqz v9, :cond_3

    invoke-virtual {v8}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 898
    check-cast v8, Landroid/widget/TextView;

    .line 899
    invoke-virtual {v8}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "btn_"

    invoke-virtual {v9, v10, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    .line 900
    invoke-virtual {v9, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    .line 901
    invoke-static {v0, v8, v9, p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 895
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 872
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 907
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_6

    .line 908
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRawFormatRowState(Landroid/view/ViewGroup;)V

    .line 910
    :cond_6
    return-void
.end method

.method private static resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;
    .locals 12

    .line 248
    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-direct {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;-><init>()V

    .line 249
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 252
    nop

    .line 254
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x1

    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_a

    .line 255
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 256
    if-eqz v6, :cond_9

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "prg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 257
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "r"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 258
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "s"

    invoke-static {v8, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 259
    const/4 v9, 0x0

    if-eqz v7, :cond_0

    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    goto :goto_1

    :cond_0
    move-object v7, v9

    .line 260
    :goto_1
    if-eqz v8, :cond_1

    invoke-virtual {v8, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    goto :goto_2

    :cond_1
    move-object v8, v9

    .line 262
    :goto_2
    if-eqz v7, :cond_2

    .line 263
    invoke-virtual {v7}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 264
    invoke-virtual {v7}, Landroid/widget/TextView;->getTextSize()F

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 265
    invoke-virtual {v7}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 267
    :cond_2
    if-eqz v8, :cond_3

    .line 268
    invoke-virtual {v8}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 269
    invoke-virtual {v8}, Landroid/widget/TextView;->getTextSize()F

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 270
    invoke-virtual {v8}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 273
    :cond_3
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "p"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 274
    if-eqz v7, :cond_8

    .line 275
    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 276
    if-eqz v6, :cond_8

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    .line 277
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 278
    instance-of v8, v7, Landroid/view/ViewGroup;

    if-eqz v8, :cond_7

    .line 279
    check-cast v7, Landroid/view/ViewGroup;

    .line 280
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_7

    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_7

    .line 281
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 282
    invoke-virtual {v7}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v8

    .line 283
    nop

    .line 284
    instance-of v10, v7, Landroid/widget/ImageView;

    if-eqz v10, :cond_4

    .line 285
    check-cast v7, Landroid/widget/ImageView;

    invoke-virtual {v7}, Landroid/widget/ImageView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object v7

    goto :goto_4

    .line 284
    :cond_4
    move-object v7, v9

    .line 287
    :goto_4
    const v10, 0x10100a1

    if-eqz v8, :cond_5

    .line 288
    filled-new-array {v10}, [I

    move-result-object v11

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v11

    iput v11, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 291
    new-array v11, v2, [I

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 295
    :cond_5
    if-eqz v7, :cond_6

    .line 296
    filled-new-array {v10}, [I

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 299
    new-array v8, v2, [I

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 303
    :cond_6
    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-eqz v7, :cond_7

    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_7

    .line 304
    nop

    .line 305
    const/4 v4, 0x1

    goto :goto_5

    .line 309
    :cond_7
    goto :goto_3

    .line 312
    :cond_8
    :goto_5
    if-eqz v4, :cond_9

    goto :goto_6

    .line 254
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 317
    :cond_a
    :goto_6
    goto :goto_7

    .line 315
    :catchall_0
    move-exception p0

    .line 316
    const-string v3, "TomteProSettings"

    const-string v4, "Error extracting palette from stock row"

    invoke-static {v3, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 320
    :goto_7
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 321
    const p0, 0x1010530

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 322
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 323
    const p0, 0x7f04015f

    const v3, -0x573806

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 326
    :cond_b
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 327
    const p0, 0x7f040167

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 328
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 329
    const p0, 0x7f040168

    const v3, -0xe3e6e8

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 332
    :cond_c
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 333
    const p0, 0x7f040129

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 334
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 335
    const p0, 0x7f040134

    const v3, -0xfbe1b7

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 338
    :cond_d
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    const v3, -0x1d1d17

    const v4, 0x7f04013c

    if-nez p0, :cond_e

    .line 339
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 341
    :cond_e
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    if-nez p0, :cond_f

    .line 342
    const p0, 0x7f040140

    const v6, -0x383a3c

    invoke-static {v1, p0, v6}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 344
    :cond_f
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    if-nez p0, :cond_10

    .line 345
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 349
    :cond_10
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_11

    .line 350
    const p0, 0x7f09002a

    const-string v3, "google-sans"

    invoke-static {v1, p0, v3, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 352
    :cond_11
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_12

    .line 353
    const p0, 0x7f09003a

    const-string v2, "google-sans-medium"

    invoke-static {v1, p0, v2, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 355
    :cond_12
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    const/4 v2, 0x2

    const/4 v3, 0x0

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_13

    .line 356
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v4, 0x41480000    # 12.5f

    invoke-static {v2, v4, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 358
    :cond_13
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_14

    .line 359
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v1, 0x41840000    # 16.5f

    invoke-static {v2, v1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 362
    :cond_14
    return-object v0
.end method

.method private static resolveThemeColor(Landroid/content/Context;II)I
    .locals 3

    .line 367
    :try_start_0
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 368
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 369
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_0

    .line 370
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0

    .line 372
    :cond_0
    iget p0, v0, Landroid/util/TypedValue;->data:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 374
    :catchall_0
    move-exception p0

    :cond_1
    nop

    .line 375
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

    .line 663
    if-nez p0, :cond_0

    return-void

    .line 665
    :cond_0
    :try_start_0
    const-string v0, "tomte_pro_panel"

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 666
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    return-void

    .line 667
    :cond_1
    check-cast v0, Landroid/view/ViewGroup;

    const-string v1, "row_pref_camera_raw_compression_key"

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 668
    if-nez v0, :cond_2

    return-void

    .line 670
    :cond_2
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->isRawCaptureEnabled(Landroid/view/ViewGroup;)Z

    move-result p0

    .line 673
    const/4 v1, 0x0

    if-eqz p0, :cond_3

    const/4 v2, 0x0

    goto :goto_0

    :cond_3
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 674
    if-eqz p0, :cond_4

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_4
    const v2, 0x3ec28f5c    # 0.38f

    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 675
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 677
    const-string v2, "button_group"

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 678
    instance-of v2, v0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_6

    .line 679
    check-cast v0, Landroid/view/ViewGroup;

    .line 680
    nop

    :goto_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 681
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 682
    if-eqz v2, :cond_5

    .line 683
    invoke-virtual {v2, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 684
    invoke-virtual {v2, p0}, Landroid/view/View;->setClickable(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 680
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 690
    :cond_6
    goto :goto_3

    .line 688
    :catchall_0
    move-exception p0

    .line 689
    const-string v0, "TomteProSettings"

    const-string v1, "Error updating raw format row state"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 691
    :goto_3
    return-void
.end method
