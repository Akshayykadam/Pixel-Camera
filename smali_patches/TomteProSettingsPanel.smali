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

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 2

    .line 591
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 592
    const/16 v1, 0x13

    invoke-static {p0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    int-to-float p0, p0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 593
    if-eqz p2, :cond_0

    .line 594
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 595
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 596
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 597
    iget-object p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0

    .line 599
    :cond_0
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 600
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 601
    iget p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 602
    iget-object p0, p3, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 604
    :goto_0
    return-void
.end method

.method private static buildOrUpdatePanel(Landroid/widget/LinearLayout;)V
    .locals 14

    .line 299
    if-nez p0, :cond_0

    return-void

    .line 300
    :cond_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    move-result-object v1

    .line 301
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 304
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->enforceSolidBackground(Landroid/view/View;)V

    .line 307
    invoke-static {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->enforceStockHeight(Landroid/widget/LinearLayout;Landroid/content/Context;)V

    .line 309
    const-string v2, "tomte_pro_panel"

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    .line 310
    const/4 v8, 0x1

    if-eqz v3, :cond_2

    .line 311
    invoke-static {v3, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 312
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    .line 313
    if-lez v0, :cond_1

    sub-int/2addr v0, v8

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eq v0, v3, :cond_1

    .line 314
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 315
    invoke-virtual {p0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 317
    :cond_1
    return-void

    .line 320
    :cond_2
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 321
    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 322
    invoke-virtual {v9, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 323
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 327
    const/4 v3, 0x4

    invoke-static {v0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    const/16 v5, 0x18

    invoke-static {v0, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    const/4 v10, 0x0

    invoke-virtual {v2, v10, v3, v10, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 328
    invoke-virtual {v9, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 330
    invoke-static {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v2

    .line 333
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 334
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 336
    invoke-static {v0, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v5, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 338
    const/16 v4, 0x8

    invoke-static {v0, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v6

    invoke-static {v0, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v5, v2, v6, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 339
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    const v2, 0x1fffffff

    invoke-virtual {v3, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 341
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 344
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

    .line 356
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

    .line 368
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

    .line 380
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

    .line 391
    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 392
    return-void
.end method

.method private static createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;
    .locals 16

    .line 466
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v2, p2

    move-object/from16 v10, p5

    invoke-static {v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v0

    .line 467
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 468
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "row_"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 469
    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 470
    const/16 v1, 0x10

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 471
    const/16 v3, 0x8

    invoke-static {v8, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v8, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v11, v0, v4, v0, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 472
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v13, -0x2

    invoke-direct {v0, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 478
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 479
    const/4 v14, 0x1

    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 480
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v4, v12, v13, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 483
    invoke-static {v8, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 484
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 487
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 488
    const-string v4, "label_text"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 489
    move-object/from16 v4, p3

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 490
    iget v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v3, v12, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 491
    iget v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 492
    iget-object v4, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 493
    invoke-virtual {v3, v12, v12, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 494
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 497
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 498
    const-string v3, "value_text"

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 499
    iget v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v4, v12, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 500
    iget v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 501
    iget-object v3, v9, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 502
    invoke-virtual {v4, v12, v12, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 503
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 506
    const/4 v15, 0x2

    invoke-static {v8, v15}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v3, v12, v5, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 507
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 508
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 510
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 513
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 514
    const-string v0, "button_group"

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 515
    invoke-virtual {v7, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 516
    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 517
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 521
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 522
    move-object/from16 v0, p4

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 523
    nop

    .line 524
    const/4 v3, 0x0

    :goto_0
    array-length v5, v10

    if-ge v3, v5, :cond_1

    .line 525
    aget-object v5, v10, v3

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 526
    nop

    .line 527
    move v0, v3

    goto :goto_1

    .line 524
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 530
    :goto_1
    aget-object v3, p6, v0

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 532
    const/4 v6, 0x0

    :goto_2
    array-length v3, v10

    if-ge v6, v3, :cond_4

    .line 533
    nop

    .line 534
    aget-object v3, v10, v6

    .line 535
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 536
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

    .line 537
    aget-object v12, p7, v6

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 538
    const/high16 v12, 0x41500000    # 13.0f

    invoke-virtual {v5, v15, v12}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 539
    const/16 v12, 0x11

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setGravity(I)V

    .line 540
    invoke-virtual {v5, v14}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 541
    const/16 v12, 0xd

    invoke-static {v8, v12}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v13

    invoke-static {v8, v12}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v12

    const/4 v14, 0x0

    invoke-virtual {v5, v13, v14, v12, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 542
    const/16 v12, 0x2a

    invoke-static {v8, v12}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setMinimumWidth(I)V

    .line 544
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    .line 546
    const/16 v13, 0x26

    invoke-static {v8, v13}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v13

    const/4 v14, -0x2

    invoke-direct {v12, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 548
    if-lez v6, :cond_2

    .line 549
    const/4 v13, 0x6

    invoke-static {v8, v13}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 551
    :cond_2
    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 553
    if-ne v6, v0, :cond_3

    const/4 v12, 0x1

    goto :goto_3

    :cond_3
    const/4 v12, 0x0

    .line 554
    :goto_3
    invoke-static {v8, v5, v12, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 556
    move v12, v0

    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;

    move-object v13, v5

    move-object/from16 v5, p6

    invoke-direct/range {v0 .. v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;[Ljava/lang/String;ILandroid/widget/LinearLayout;Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 578
    invoke-virtual {v7, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 532
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v2, p2

    move v0, v12

    const/4 v12, 0x0

    const/4 v13, -0x2

    const/4 v14, 0x1

    goto/16 :goto_2

    .line 581
    :cond_4
    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 582
    return-object v11
.end method

.method private static dpToPx(Landroid/content/Context;I)I
    .locals 1

    .line 668
    int-to-float p1, p1

    .line 671
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 668
    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method private static enforceSolidBackground(Landroid/view/View;)V
    .locals 3

    .line 396
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    .line 397
    if-eqz p0, :cond_1

    .line 398
    const v0, 0x7f0a03fd

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 399
    if-eqz p0, :cond_1

    .line 400
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 401
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    const/high16 v2, -0x1000000

    if-eqz v1, :cond_0

    .line 402
    move-object p0, v0

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 403
    const/16 p0, 0xff

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_0

    .line 405
    :cond_0
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 409
    :catchall_0
    move-exception p0

    :cond_1
    :goto_0
    nop

    .line 410
    return-void
.end method

.method private static enforceStockHeight(Landroid/widget/LinearLayout;Landroid/content/Context;)V
    .locals 4

    .line 414
    nop

    .line 415
    nop

    .line 416
    const/4 v0, 0x0

    move-object v1, v0

    .line 417
    :goto_0
    if-eqz p0, :cond_2

    .line 418
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

    .line 419
    move-object v1, p0

    .line 421
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "AutobahnViewPager"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 422
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 423
    goto :goto_1

    .line 425
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_2

    .line 426
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0

    .line 432
    :cond_2
    :goto_1
    nop

    .line 433
    const/4 p0, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lez v2, :cond_3

    .line 434
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 435
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    if-lez v2, :cond_3

    .line 436
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    .line 439
    :cond_3
    if-gtz p0, :cond_4

    .line 441
    const/16 p0, 0x136

    invoke-static {p1, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    .line 444
    :cond_4
    if-eqz v1, :cond_5

    .line 445
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 446
    if-eqz p1, :cond_5

    iget v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v0, p0, :cond_5

    .line 447
    iput p0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 448
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 451
    :catchall_0
    move-exception p0

    .line 452
    const-string p1, "TomteProSettings"

    const-string v0, "Error enforcing stock height"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 453
    :cond_5
    :goto_2
    nop

    .line 454
    :goto_3
    return-void
.end method

.method private static findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;
    .locals 6

    .line 94
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 96
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

    .line 97
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 99
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 100
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 101
    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_2

    .line 102
    check-cast v1, Landroid/widget/LinearLayout;

    return-object v1

    .line 106
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "q"

    invoke-static {v1, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 107
    if-eqz v1, :cond_3

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_3
    move-object v1, v0

    .line 109
    :goto_0
    const v3, 0x7f0a03ca

    if-nez v1, :cond_5

    .line 110
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "o"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 111
    if-eqz v4, :cond_4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_1

    :cond_4
    move-object v4, v0

    .line 112
    :goto_1
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_5

    .line 113
    move-object v1, v4

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 114
    if-nez v1, :cond_5

    .line 115
    move-object v1, v4

    .line 120
    :cond_5
    if-nez v1, :cond_7

    .line 121
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "k"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 122
    if-eqz v4, :cond_6

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_2

    :cond_6
    move-object p0, v0

    .line 123
    :goto_2
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_7

    .line 124
    check-cast p0, Landroid/view/ViewGroup;

    const v4, 0x7f0a03c3

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 125
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_7

    .line 126
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 127
    if-nez v1, :cond_7

    .line 128
    move-object v1, p0

    .line 134
    :cond_7
    nop

    instance-of p0, v1, Landroid/view/ViewGroup;

    if-eqz p0, :cond_9

    .line 135
    move-object p0, v1

    check-cast p0, Landroid/view/ViewGroup;

    .line 136
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 137
    instance-of v2, p0, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_8

    .line 138
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 140
    :cond_8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v2, "l"

    invoke-static {p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    .line 141
    if-eqz p0, :cond_9

    .line 142
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 143
    instance-of v1, p0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_9

    .line 144
    check-cast p0, Landroid/widget/LinearLayout;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 150
    :cond_9
    goto :goto_3

    .line 148
    :catchall_0
    move-exception p0

    .line 149
    const-string v1, "TomteProSettings"

    const-string v2, "Error finding pro internal list"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 151
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

    .line 155
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 157
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 158
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    return-object v0

    .line 160
    :catch_0
    move-exception v0

    .line 161
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 162
    goto :goto_0

    .line 164
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 0

    .line 659
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getFont(I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 660
    :catchall_0
    move-exception p0

    .line 662
    :try_start_1
    invoke-static {p2, p3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    .line 663
    :catchall_1
    move-exception p0

    .line 664
    invoke-static {p3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method private static getHorizontalMargin(Landroid/content/Context;)I
    .locals 4

    .line 649
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "bottom_panel_title_horizontal_margin"

    const-string v2, "dimen"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 650
    if-eqz v0, :cond_0

    .line 651
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 653
    :catchall_0
    move-exception v0

    :cond_0
    nop

    .line 654
    const/16 v0, 0x10

    invoke-static {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public static injectProSettings(Ljava/lang/Object;)V
    .locals 2

    .line 50
    if-nez p0, :cond_0

    return-void

    .line 52
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    nop

    .line 55
    new-instance p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;

    invoke-direct {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 65
    goto :goto_0

    .line 66
    :cond_1
    const-wide/16 v0, 0x50

    invoke-static {p0, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V

    .line 67
    const-wide/16 v0, 0xfa

    invoke-static {p0, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :goto_0
    goto :goto_1

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    const-string v0, "TomteProSettings"

    const-string v1, "Failed to inject Pro Settings"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 72
    :goto_1
    return-void
.end method

.method private static refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 10

    .line 607
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 608
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 609
    check-cast p0, Landroid/view/ViewGroup;

    .line 610
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 611
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 612
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "row_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 613
    move-object v4, v3

    check-cast v4, Landroid/view/ViewGroup;

    .line 614
    const-string v5, "label_text"

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 615
    const-string v6, "value_text"

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 616
    if-eqz v5, :cond_1

    .line 617
    iget v7, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 618
    iget v7, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v5, v1, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 619
    iget-object v7, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 621
    :cond_1
    if-eqz v6, :cond_2

    .line 622
    iget v5, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 623
    iget v5, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v6, v1, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 624
    iget-object v5, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 626
    :cond_2
    const-string v5, "button_group"

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 627
    if-eqz v4, :cond_4

    .line 628
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 629
    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 630
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 631
    const-string v6, ""

    invoke-interface {v5, v3, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 633
    const/4 v5, 0x0

    :goto_1
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v7

    if-ge v5, v7, :cond_4

    .line 634
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 635
    instance-of v8, v7, Landroid/widget/TextView;

    if-eqz v8, :cond_3

    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 636
    check-cast v7, Landroid/widget/TextView;

    .line 637
    invoke-virtual {v7}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "btn_"

    invoke-virtual {v8, v9, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 638
    invoke-virtual {v8, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    .line 639
    invoke-static {v0, v7, v8, p1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->applyPillState(Landroid/content/Context;Landroid/widget/TextView;ZLcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 633
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 610
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 645
    :cond_5
    return-void
.end method

.method private static resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;
    .locals 12

    .line 168
    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-direct {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;-><init>()V

    .line 169
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 172
    nop

    .line 174
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x1

    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_a

    .line 175
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 176
    if-eqz v6, :cond_9

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "prg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 177
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "r"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 178
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "s"

    invoke-static {v8, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 179
    const/4 v9, 0x0

    if-eqz v7, :cond_0

    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    goto :goto_1

    :cond_0
    move-object v7, v9

    .line 180
    :goto_1
    if-eqz v8, :cond_1

    invoke-virtual {v8, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    goto :goto_2

    :cond_1
    move-object v8, v9

    .line 182
    :goto_2
    if-eqz v7, :cond_2

    .line 183
    invoke-virtual {v7}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 184
    invoke-virtual {v7}, Landroid/widget/TextView;->getTextSize()F

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 185
    invoke-virtual {v7}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 187
    :cond_2
    if-eqz v8, :cond_3

    .line 188
    invoke-virtual {v8}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 189
    invoke-virtual {v8}, Landroid/widget/TextView;->getTextSize()F

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 190
    invoke-virtual {v8}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 193
    :cond_3
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "p"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 194
    if-eqz v7, :cond_8

    .line 195
    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 196
    if-eqz v6, :cond_8

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    .line 197
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 198
    instance-of v8, v7, Landroid/view/ViewGroup;

    if-eqz v8, :cond_7

    .line 199
    check-cast v7, Landroid/view/ViewGroup;

    .line 200
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_7

    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_7

    .line 201
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 202
    invoke-virtual {v7}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v8

    .line 203
    nop

    .line 204
    instance-of v10, v7, Landroid/widget/ImageView;

    if-eqz v10, :cond_4

    .line 205
    check-cast v7, Landroid/widget/ImageView;

    invoke-virtual {v7}, Landroid/widget/ImageView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object v7

    goto :goto_4

    .line 204
    :cond_4
    move-object v7, v9

    .line 207
    :goto_4
    const v10, 0x10100a1

    if-eqz v8, :cond_5

    .line 208
    filled-new-array {v10}, [I

    move-result-object v11

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v11

    iput v11, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 211
    new-array v11, v2, [I

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 215
    :cond_5
    if-eqz v7, :cond_6

    .line 216
    filled-new-array {v10}, [I

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 219
    new-array v8, v2, [I

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 223
    :cond_6
    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-eqz v7, :cond_7

    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_7

    .line 224
    nop

    .line 225
    const/4 v4, 0x1

    goto :goto_5

    .line 229
    :cond_7
    goto :goto_3

    .line 232
    :cond_8
    :goto_5
    if-eqz v4, :cond_9

    goto :goto_6

    .line 174
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 237
    :cond_a
    :goto_6
    goto :goto_7

    .line 235
    :catchall_0
    move-exception p0

    .line 236
    const-string v3, "TomteProSettings"

    const-string v4, "Error extracting palette from stock row"

    invoke-static {v3, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 240
    :goto_7
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 241
    const p0, 0x1010530

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 242
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 243
    const p0, 0x7f04015f

    const v3, -0x573806

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 246
    :cond_b
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 247
    const p0, 0x7f040167

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 248
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 249
    const p0, 0x7f040168

    const v3, -0xe3e6e8

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 252
    :cond_c
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 253
    const p0, 0x7f040129

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 254
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 255
    const p0, 0x7f040134

    const v3, -0xfbe1b7

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 258
    :cond_d
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    const v3, -0x1d1d17

    const v4, 0x7f04013c

    if-nez p0, :cond_e

    .line 259
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 261
    :cond_e
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    if-nez p0, :cond_f

    .line 262
    const p0, 0x7f040140

    const v6, -0x383a3c

    invoke-static {v1, p0, v6}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 264
    :cond_f
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    if-nez p0, :cond_10

    .line 265
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 269
    :cond_10
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_11

    .line 270
    const p0, 0x7f09002a

    const-string v3, "google-sans"

    invoke-static {v1, p0, v3, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 272
    :cond_11
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_12

    .line 273
    const p0, 0x7f09003a

    const-string v2, "google-sans-medium"

    invoke-static {v1, p0, v2, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 275
    :cond_12
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    const/4 v2, 0x2

    const/4 v3, 0x0

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_13

    .line 276
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v4, 0x41480000    # 12.5f

    invoke-static {v2, v4, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 278
    :cond_13
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_14

    .line 279
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v1, 0x41840000    # 16.5f

    invoke-static {v2, v1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 282
    :cond_14
    return-object v0
.end method

.method private static resolveThemeColor(Landroid/content/Context;II)I
    .locals 3

    .line 287
    :try_start_0
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 288
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 289
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_0

    .line 290
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0

    .line 292
    :cond_0
    iget p0, v0, Landroid/util/TypedValue;->data:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 294
    :catchall_0
    move-exception p0

    :cond_1
    nop

    .line 295
    return p2
.end method

.method private static scheduleRetry(Ljava/lang/Object;J)V
    .locals 2

    .line 76
    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 77
    new-instance v1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;

    invoke-direct {v1, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 90
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 91
    return-void
.end method
