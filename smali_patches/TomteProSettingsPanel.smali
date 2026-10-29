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

.field private static final TAG:Ljava/lang/String; = "TomteProSettings"


# direct methods
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

.method static bridge synthetic -$$Nest$smgetPref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getPref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$smsavePref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->savePref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$smupdateRowDisplay(Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Landroid/content/Context;)V
    .locals 0

    invoke-static/range {p0 .. p6}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRowDisplay(Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildOrUpdatePanel(Landroid/widget/LinearLayout;)V
    .locals 15

    .line 298
    if-nez p0, :cond_0

    return-void

    .line 299
    :cond_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    move-result-object v8

    .line 301
    const-string v0, "tomte_pro_panel"

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 302
    const/4 v9, 0x1

    if-eqz v1, :cond_2

    .line 303
    invoke-static {v1, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    .line 304
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    .line 305
    if-lez v0, :cond_1

    sub-int/2addr v0, v9

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eq v0, v1, :cond_1

    .line 306
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 307
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 309
    :cond_1
    return-void

    .line 312
    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v10

    .line 313
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v10}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 314
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 315
    invoke-virtual {v11, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 316
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 320
    const/4 v1, 0x4

    invoke-static {v10, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v1

    const/16 v3, 0x18

    invoke-static {v10, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    const/4 v12, 0x0

    invoke-virtual {v0, v12, v1, v12, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 321
    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 323
    invoke-static {v10}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v0

    .line 326
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, v10}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 327
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 329
    invoke-static {v10, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 331
    const/16 v2, 0x8

    invoke-static {v10, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v10, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v3, v0, v4, v0, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 332
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    const v0, 0x1fffffff

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 334
    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 337
    const-string v2, "pref_camera_jpeg_quality_key"

    const-string v3, "JPEG Quality"

    const-string v4, "100"

    const/4 v13, 0x3

    new-array v5, v13, [Ljava/lang/String;

    const-string v0, "95"

    aput-object v0, v5, v12

    const-string v0, "97"

    aput-object v0, v5, v9

    const-string v0, "100"

    const/4 v14, 0x2

    aput-object v0, v5, v14

    new-array v6, v13, [Ljava/lang/String;

    const-string v0, "95%"

    aput-object v0, v6, v12

    const-string v0, "97%"

    aput-object v0, v6, v9

    const-string v0, "100%"

    aput-object v0, v6, v14

    new-array v7, v13, [Ljava/lang/String;

    const-string v0, "95% (Standard)"

    aput-object v0, v7, v12

    const-string v0, "97% (High Quality)"

    aput-object v0, v7, v9

    const-string v0, "100% (Maximum Quality)"

    aput-object v0, v7, v14

    move-object v0, v10

    move-object v1, v8

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 349
    const-string v2, "pref_camera_noise_reduction_key"

    const-string v3, "Spatial Noise Reduction"

    const-string v4, "off"

    new-array v5, v13, [Ljava/lang/String;

    const-string v0, "off"

    aput-object v0, v5, v12

    const-string v0, "low"

    aput-object v0, v5, v9

    const-string v0, "stock"

    aput-object v0, v5, v14

    new-array v6, v13, [Ljava/lang/String;

    const-string v0, "Off"

    aput-object v0, v6, v12

    const-string v0, "Low"

    aput-object v0, v6, v9

    const-string v0, "Stock"

    aput-object v0, v6, v14

    new-array v7, v13, [Ljava/lang/String;

    const-string v0, "Off (Full Detail)"

    aput-object v0, v7, v12

    const-string v0, "Low (Balanced)"

    aput-object v0, v7, v9

    const-string v0, "Stock (Smooth)"

    aput-object v0, v7, v14

    move-object v0, v10

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 361
    const-string v2, "pref_camera_raw_compression_key"

    const-string v3, "RAW DNG Format"

    const-string v4, "uncompressed"

    new-array v5, v14, [Ljava/lang/String;

    const-string v0, "uncompressed"

    aput-object v0, v5, v12

    const-string v0, "compressed"

    aput-object v0, v5, v9

    new-array v6, v14, [Ljava/lang/String;

    const-string v0, "16-Bit RAW"

    aput-object v0, v6, v12

    const-string v0, "Compressed"

    aput-object v0, v6, v9

    new-array v7, v14, [Ljava/lang/String;

    const-string v0, "Uncompressed 16-Bit RAW"

    aput-object v0, v7, v12

    const-string v0, "Compressed DNG"

    aput-object v0, v7, v9

    move-object v0, v10

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 373
    const-string v2, "pref_camera_sharpness_key"

    const-string v3, "Edge Sharpness & De-Ring"

    const-string v4, "natural"

    new-array v5, v13, [Ljava/lang/String;

    const-string v0, "soft"

    aput-object v0, v5, v12

    const-string v0, "natural"

    aput-object v0, v5, v9

    const-string v0, "standard"

    aput-object v0, v5, v14

    new-array v6, v13, [Ljava/lang/String;

    const-string v0, "Soft"

    aput-object v0, v6, v12

    const-string v0, "Natural"

    aput-object v0, v6, v9

    const-string v0, "Standard"

    aput-object v0, v6, v14

    new-array v7, v13, [Ljava/lang/String;

    const-string v0, "Soft (0.0x - Zero Ringing)"

    aput-object v0, v7, v12

    const-string v0, "Natural (0.5x)"

    aput-object v0, v7, v9

    const-string v0, "Standard (1.0x)"

    aput-object v0, v7, v14

    move-object v0, v10

    invoke-static/range {v0 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 384
    invoke-virtual {p0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 385
    return-void
.end method

.method private static createSettingRow(Landroid/content/Context;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroid/view/View;
    .locals 22

    .line 397
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v12, p5

    invoke-static/range {p0 .. p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getHorizontalMargin(Landroid/content/Context;)I

    move-result v0

    .line 398
    new-instance v13, Landroid/widget/LinearLayout;

    invoke-direct {v13, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 399
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "row_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 400
    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 401
    const/16 v1, 0x10

    invoke-virtual {v13, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 402
    const/16 v2, 0xb

    invoke-static {v9, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v9, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v13, v0, v3, v0, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 403
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v15, -0x2

    invoke-direct {v0, v2, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 409
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 410
    const/4 v0, 0x1

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 411
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v14, v15, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 414
    const/16 v7, 0x8

    invoke-static {v9, v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 415
    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 418
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 419
    const-string v2, "label_text"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 420
    move-object/from16 v2, p3

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    iget v2, v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v0, v14, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 422
    iget v2, v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 423
    iget-object v2, v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 424
    invoke-virtual {v0, v14, v14, v14, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 425
    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 428
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 429
    const-string v0, "value_text"

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 430
    iget v0, v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v6, v14, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 431
    iget v0, v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 432
    iget-object v0, v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 433
    invoke-virtual {v6, v14, v14, v14, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 434
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v15, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 437
    const/4 v5, 0x2

    invoke-static {v9, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v14, v2, v14, v14}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 438
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 439
    invoke-virtual {v8, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 441
    invoke-virtual {v13, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 444
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 445
    const-string v0, "button_group"

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 446
    invoke-virtual {v4, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 447
    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 448
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v15, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 452
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 453
    const/4 v2, 0x0

    :goto_0
    array-length v0, v12

    if-ge v2, v0, :cond_1

    .line 454
    aget-object v1, v12, v2

    .line 455
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 456
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 457
    aget-object v7, p6, v2

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 458
    const/high16 v7, 0x41500000    # 13.0f

    invoke-virtual {v0, v5, v7}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 459
    const/16 v7, 0x11

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 460
    const/16 v7, 0xc

    invoke-static {v9, v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-static {v9, v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v0, v5, v14, v7, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 461
    const/16 v5, 0x2c

    invoke-static {v9, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setMinimumWidth(I)V

    .line 463
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 464
    const/16 v7, 0x28

    invoke-static {v9, v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v15, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 466
    if-lez v2, :cond_0

    .line 467
    const/16 v7, 0x8

    invoke-static {v9, v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v5, v14}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    goto :goto_1

    .line 466
    :cond_0
    const/16 v7, 0x8

    .line 469
    :goto_1
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 471
    new-instance v14, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;

    move-object v5, v0

    move-object v0, v14

    move-object/from16 v16, v1

    move-object/from16 v1, p0

    move/from16 v17, v2

    move-object/from16 v2, p2

    move-object/from16 v18, v3

    move-object/from16 v3, v16

    move-object v15, v4

    move-object v4, v6

    move-object v10, v5

    const/16 v19, 0x2

    move-object/from16 v5, v18

    move-object/from16 v20, v6

    move-object/from16 v6, p5

    const/16 v21, 0x8

    move-object/from16 v7, p7

    move-object v12, v8

    move-object/from16 v8, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$3;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    invoke-virtual {v10, v14}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 482
    move-object/from16 v14, v18

    invoke-interface {v14, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 483
    invoke-virtual {v15, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 453
    add-int/lit8 v2, v17, 0x1

    move-object/from16 v10, p1

    move-object v8, v12

    move-object v3, v14

    move-object v4, v15

    move-object/from16 v6, v20

    const/4 v5, 0x2

    const/16 v7, 0x8

    const/4 v14, 0x0

    const/4 v15, -0x2

    move-object/from16 v12, p5

    goto/16 :goto_0

    .line 487
    :cond_1
    move-object v14, v3

    move-object v15, v4

    move-object/from16 v20, v6

    move-object v12, v8

    new-instance v10, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;

    move-object v0, v10

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, v20

    move-object v6, v14

    move-object/from16 v7, p7

    move-object/from16 v8, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$4;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V

    invoke-virtual {v12, v10}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 507
    invoke-virtual {v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 510
    move-object/from16 v0, p4

    invoke-static {v9, v11, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getPref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 511
    move-object/from16 v0, v20

    move-object v1, v14

    move-object/from16 v2, p5

    move-object/from16 v3, p7

    move-object/from16 v5, p1

    move-object/from16 v6, p0

    invoke-static/range {v0 .. v6}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRowDisplay(Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Landroid/content/Context;)V

    .line 513
    return-object v13
.end method

.method private static dpToPx(Landroid/content/Context;I)I
    .locals 1

    .line 659
    int-to-float p1, p1

    .line 662
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 659
    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method private static findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;
    .locals 6

    .line 93
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 95
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

    .line 96
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 98
    :cond_1
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 99
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 100
    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_2

    .line 101
    check-cast v1, Landroid/widget/LinearLayout;

    return-object v1

    .line 105
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "q"

    invoke-static {v1, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 106
    if-eqz v1, :cond_3

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_3
    move-object v1, v0

    .line 108
    :goto_0
    const v3, 0x7f0a03ca

    if-nez v1, :cond_5

    .line 109
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "o"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 110
    if-eqz v4, :cond_4

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_1

    :cond_4
    move-object v4, v0

    .line 111
    :goto_1
    instance-of v5, v4, Landroid/view/ViewGroup;

    if-eqz v5, :cond_5

    .line 112
    move-object v1, v4

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 113
    if-nez v1, :cond_5

    .line 114
    move-object v1, v4

    .line 119
    :cond_5
    if-nez v1, :cond_7

    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "k"

    invoke-static {v4, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 121
    if-eqz v4, :cond_6

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_2

    :cond_6
    move-object p0, v0

    .line 122
    :goto_2
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_7

    .line 123
    check-cast p0, Landroid/view/ViewGroup;

    const v4, 0x7f0a03c3

    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 124
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_7

    .line 125
    move-object v1, p0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 126
    if-nez v1, :cond_7

    .line 127
    move-object v1, p0

    .line 133
    :cond_7
    nop

    instance-of p0, v1, Landroid/view/ViewGroup;

    if-eqz p0, :cond_9

    .line 134
    move-object p0, v1

    check-cast p0, Landroid/view/ViewGroup;

    .line 135
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 136
    instance-of v2, p0, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_8

    .line 137
    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    .line 139
    :cond_8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v2, "l"

    invoke-static {p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    .line 140
    if-eqz p0, :cond_9

    .line 141
    invoke-virtual {p0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 142
    instance-of v1, p0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_9

    .line 143
    check-cast p0, Landroid/widget/LinearLayout;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 149
    :cond_9
    goto :goto_3

    .line 147
    :catchall_0
    move-exception p0

    .line 148
    const-string v1, "TomteProSettings"

    const-string v2, "Error finding pro internal list"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 150
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

    .line 154
    nop

    :goto_0
    if-eqz p0, :cond_0

    .line 156
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 157
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    return-object v0

    .line 159
    :catch_0
    move-exception v0

    .line 160
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 161
    goto :goto_0

    .line 163
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;
    .locals 0

    .line 647
    if-eqz p1, :cond_0

    .line 648
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getFont(I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 649
    if-eqz p0, :cond_0

    return-object p0

    .line 651
    :catchall_0
    move-exception p0

    :cond_0
    nop

    .line 653
    :try_start_1
    invoke-static {p2, p3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    .line 654
    :catchall_1
    move-exception p0

    .line 655
    invoke-static {p3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method private static getHorizontalMargin(Landroid/content/Context;)I
    .locals 2

    .line 668
    nop

    .line 669
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070115

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 670
    :catchall_0
    move-exception v0

    .line 671
    const/16 v0, 0x10

    invoke-static {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method private static getPref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 618
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_preferences_camera"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 619
    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 620
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 622
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 623
    if-eqz p0, :cond_1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 624
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    .line 626
    :catchall_0
    move-exception p0

    :cond_1
    nop

    .line 627
    return-object p2
.end method

.method public static injectProSettings(Ljava/lang/Object;)V
    .locals 2

    .line 49
    if-nez p0, :cond_0

    return-void

    .line 51
    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->findProInternalList(Ljava/lang/Object;)Landroid/widget/LinearLayout;

    move-result-object v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    nop

    .line 54
    new-instance p0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;

    invoke-direct {p0, v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$1;-><init>(Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const-wide/16 v0, 0x50

    invoke-static {p0, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V

    .line 66
    const-wide/16 v0, 0xfa

    invoke-static {p0, v0, v1}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->scheduleRetry(Ljava/lang/Object;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :goto_0
    goto :goto_1

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    const-string v0, "TomteProSettings"

    const-string v1, "Failed to inject Pro Settings"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 71
    :goto_1
    return-void
.end method

.method private static refreshPanel(Landroid/view/View;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;)V
    .locals 12

    .line 553
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 554
    :cond_0
    move-object v0, p0

    check-cast v0, Landroid/view/ViewGroup;

    .line 555
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 557
    const-string v3, "pref_camera_jpeg_quality_key"

    const-string v4, "100"

    const/4 v8, 0x3

    new-array v5, v8, [Ljava/lang/String;

    const-string v1, "95"

    const/4 v9, 0x0

    aput-object v1, v5, v9

    const-string v1, "97"

    const/4 v10, 0x1

    aput-object v1, v5, v10

    const-string v1, "100"

    const/4 v11, 0x2

    aput-object v1, v5, v11

    new-array v6, v8, [Ljava/lang/String;

    const-string v1, "95% (Standard)"

    aput-object v1, v6, v9

    const-string v1, "97% (High Quality)"

    aput-object v1, v6, v10

    const-string v1, "100% (Maximum Quality)"

    aput-object v1, v6, v11

    move-object v1, v0

    move-object v2, p1

    move-object v7, p0

    invoke-static/range {v1 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshRow(Landroid/view/ViewGroup;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V

    .line 561
    const-string v3, "pref_camera_noise_reduction_key"

    const-string v4, "off"

    new-array v5, v8, [Ljava/lang/String;

    const-string v1, "off"

    aput-object v1, v5, v9

    const-string v1, "low"

    aput-object v1, v5, v10

    const-string v1, "stock"

    aput-object v1, v5, v11

    new-array v6, v8, [Ljava/lang/String;

    const-string v1, "Off (Full Detail)"

    aput-object v1, v6, v9

    const-string v1, "Low (Balanced)"

    aput-object v1, v6, v10

    const-string v1, "Stock (Smooth)"

    aput-object v1, v6, v11

    move-object v1, v0

    invoke-static/range {v1 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshRow(Landroid/view/ViewGroup;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V

    .line 565
    const-string v3, "pref_camera_raw_compression_key"

    const-string v4, "uncompressed"

    new-array v5, v11, [Ljava/lang/String;

    const-string v1, "uncompressed"

    aput-object v1, v5, v9

    const-string v1, "compressed"

    aput-object v1, v5, v10

    new-array v6, v11, [Ljava/lang/String;

    const-string v1, "Uncompressed 16-Bit RAW"

    aput-object v1, v6, v9

    const-string v1, "Compressed DNG"

    aput-object v1, v6, v10

    move-object v1, v0

    invoke-static/range {v1 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshRow(Landroid/view/ViewGroup;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V

    .line 569
    const-string v3, "pref_camera_sharpness_key"

    const-string v4, "natural"

    new-array v5, v8, [Ljava/lang/String;

    const-string v1, "soft"

    aput-object v1, v5, v9

    const-string v1, "natural"

    aput-object v1, v5, v10

    const-string v1, "standard"

    aput-object v1, v5, v11

    new-array v6, v8, [Ljava/lang/String;

    const-string v1, "Soft (0.0x - Zero Ringing)"

    aput-object v1, v6, v9

    const-string v1, "Natural (0.5x)"

    aput-object v1, v6, v10

    const-string v1, "Standard (1.0x)"

    aput-object v1, v6, v11

    move-object v1, v0

    invoke-static/range {v1 .. v7}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->refreshRow(Landroid/view/ViewGroup;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V

    .line 572
    return-void
.end method

.method private static refreshRow(Landroid/view/ViewGroup;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V
    .locals 9

    .line 583
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "row_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 584
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    .line 585
    :cond_0
    check-cast p0, Landroid/view/ViewGroup;

    .line 586
    const-string v0, "label_text"

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 587
    const-string v1, "value_text"

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/widget/TextView;

    .line 588
    const-string v1, "button_group"

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 589
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    return-void

    .line 590
    :cond_1
    check-cast p0, Landroid/view/ViewGroup;

    .line 592
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 593
    iget v3, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 594
    iget v3, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    invoke-virtual {v0, v1, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 595
    iget-object v3, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 597
    :cond_2
    if-eqz v2, :cond_3

    .line 598
    iget v0, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 599
    iget v0, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    invoke-virtual {v2, v1, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 600
    iget-object v0, p1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 603
    :cond_3
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 604
    nop

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_5

    .line 605
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 606
    instance-of v4, v0, Landroid/widget/TextView;

    if-eqz v4, :cond_4

    .line 607
    check-cast v0, Landroid/widget/TextView;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 604
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 610
    :cond_5
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result p0

    array-length v0, p4

    if-ne p0, v0, :cond_6

    .line 611
    invoke-static {p6, p2, p3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getPref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 612
    move-object v4, p4

    move-object v5, p5

    move-object v7, p1

    move-object v8, p6

    invoke-static/range {v2 .. v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->updateRowDisplay(Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Landroid/content/Context;)V

    .line 614
    :cond_6
    return-void
.end method

.method private static resolveDynamicPalette(Landroid/view/ViewGroup;)Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;
    .locals 12

    .line 167
    new-instance v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;

    invoke-direct {v0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;-><init>()V

    .line 168
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 171
    nop

    .line 173
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x1

    :try_start_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v3, v6, :cond_a

    .line 174
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 175
    if-eqz v6, :cond_9

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "prg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 176
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "r"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 177
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "s"

    invoke-static {v8, v9}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 178
    const/4 v9, 0x0

    if-eqz v7, :cond_0

    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    goto :goto_1

    :cond_0
    move-object v7, v9

    .line 179
    :goto_1
    if-eqz v8, :cond_1

    invoke-virtual {v8, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    goto :goto_2

    :cond_1
    move-object v8, v9

    .line 181
    :goto_2
    if-eqz v7, :cond_2

    .line 182
    invoke-virtual {v7}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 183
    invoke-virtual {v7}, Landroid/widget/TextView;->getTextSize()F

    move-result v10

    iput v10, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 184
    invoke-virtual {v7}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 186
    :cond_2
    if-eqz v8, :cond_3

    .line 187
    invoke-virtual {v8}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 188
    invoke-virtual {v8}, Landroid/widget/TextView;->getTextSize()F

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 189
    invoke-virtual {v8}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v7

    iput-object v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 192
    :cond_3
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "p"

    invoke-static {v7, v8}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 193
    if-eqz v7, :cond_8

    .line 194
    invoke-virtual {v7, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 195
    if-eqz v6, :cond_8

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_8

    .line 196
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 197
    instance-of v8, v7, Landroid/view/ViewGroup;

    if-eqz v8, :cond_7

    .line 198
    check-cast v7, Landroid/view/ViewGroup;

    .line 199
    invoke-virtual {v7}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v8

    if-lez v8, :cond_7

    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_7

    .line 200
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 201
    invoke-virtual {v7}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object v8

    .line 202
    nop

    .line 203
    instance-of v10, v7, Landroid/widget/ImageView;

    if-eqz v10, :cond_4

    .line 204
    check-cast v7, Landroid/widget/ImageView;

    invoke-virtual {v7}, Landroid/widget/ImageView;->getImageTintList()Landroid/content/res/ColorStateList;

    move-result-object v7

    goto :goto_4

    .line 203
    :cond_4
    move-object v7, v9

    .line 206
    :goto_4
    const v10, 0x10100a1

    if-eqz v8, :cond_5

    .line 207
    filled-new-array {v10}, [I

    move-result-object v11

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v11

    iput v11, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 210
    new-array v11, v2, [I

    invoke-virtual {v8, v11, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 214
    :cond_5
    if-eqz v7, :cond_6

    .line 215
    filled-new-array {v10}, [I

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    iput v8, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 218
    new-array v8, v2, [I

    invoke-virtual {v7, v8, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v7

    iput v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 222
    :cond_6
    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-eqz v7, :cond_7

    iget v7, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_7

    .line 223
    nop

    .line 224
    const/4 v4, 0x1

    goto :goto_5

    .line 228
    :cond_7
    goto :goto_3

    .line 231
    :cond_8
    :goto_5
    if-eqz v4, :cond_9

    goto :goto_6

    .line 173
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 236
    :cond_a
    :goto_6
    goto :goto_7

    .line 234
    :catchall_0
    move-exception p0

    .line 235
    const-string v3, "TomteProSettings"

    const-string v4, "Error extracting palette from stock row"

    invoke-static {v3, v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 239
    :goto_7
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 240
    const p0, 0x1010530

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 241
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    if-nez p0, :cond_b

    .line 242
    const p0, 0x7f04015f

    const v3, -0x273d45

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    .line 245
    :cond_b
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 246
    const p0, 0x7f040167

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 247
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    if-nez p0, :cond_c

    .line 248
    const p0, 0x7f040168

    const v3, -0xe3e6e8

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    .line 251
    :cond_c
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 252
    const p0, 0x7f040129

    invoke-static {v1, p0, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 253
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    if-nez p0, :cond_d

    .line 254
    const p0, 0x7f040134

    const v3, -0xb3c2c8

    invoke-static {v1, p0, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    .line 257
    :cond_d
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    const v3, -0x111c20

    const v4, 0x7f04013c

    if-nez p0, :cond_e

    .line 258
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    .line 260
    :cond_e
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    if-nez p0, :cond_f

    .line 261
    const p0, 0x7f040140

    const v6, -0x383a3c

    invoke-static {v1, p0, v6}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorLabelText:I

    .line 263
    :cond_f
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    if-nez p0, :cond_10

    .line 264
    invoke-static {v1, v4, v3}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->resolveThemeColor(Landroid/content/Context;II)I

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    .line 268
    :cond_10
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_11

    .line 269
    const p0, 0x7f09002a

    const-string v3, "google-sans"

    invoke-static {v1, p0, v3, v2}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    .line 271
    :cond_11
    iget-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    if-nez p0, :cond_12

    .line 272
    const p0, 0x7f09003a

    const-string v2, "google-sans-medium"

    invoke-static {v1, p0, v2, v5}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->getFont(Landroid/content/Context;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    .line 274
    :cond_12
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    const/4 v2, 0x2

    const/4 v3, 0x0

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_13

    .line 275
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v4, 0x41480000    # 12.5f

    invoke-static {v2, v4, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTextSizePx:F

    .line 277
    :cond_13
    iget p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    cmpg-float p0, p0, v3

    if-gtz p0, :cond_14

    .line 278
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/high16 v1, 0x41840000    # 16.5f

    invoke-static {v2, v1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    iput p0, v0, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTextSizePx:F

    .line 281
    :cond_14
    return-object v0
.end method

.method private static resolveThemeColor(Landroid/content/Context;II)I
    .locals 3

    .line 286
    :try_start_0
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 287
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 288
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p1, :cond_0

    .line 289
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p0

    return p0

    .line 291
    :cond_0
    iget p0, v0, Landroid/util/TypedValue;->data:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p0

    .line 293
    :catchall_0
    move-exception p0

    :cond_1
    nop

    .line 294
    return p2
.end method

.method private static savePref(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 632
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_preferences_camera"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 633
    if-eqz v0, :cond_0

    .line 634
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 636
    :catchall_0
    move-exception v0

    :cond_0
    :goto_0
    nop

    .line 638
    :try_start_1
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 639
    if-eqz p0, :cond_1

    .line 640
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 642
    :catchall_1
    move-exception p0

    :cond_1
    :goto_1
    nop

    .line 643
    return-void
.end method

.method private static scheduleRetry(Ljava/lang/Object;J)V
    .locals 2

    .line 75
    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 76
    new-instance v1, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;

    invoke-direct {v1, p0}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 89
    :catchall_0
    move-exception p0

    :goto_0
    nop

    .line 90
    return-void
.end method

.method private static updateRowDisplay(Landroid/widget/TextView;Ljava/util/List;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;Landroid/content/Context;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            "Ljava/util/List<",
            "Landroid/widget/TextView;",
            ">;[",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 525
    nop

    .line 526
    const-string v0, ""

    const/4 v1, 0x0

    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 527
    aget-object v2, p2, v1

    invoke-virtual {v2, p4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 528
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 529
    if-eqz v2, :cond_0

    .line 530
    aget-object v0, p3, v1

    .line 531
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 532
    const/16 v4, 0x14

    invoke-static {p6, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 533
    iget v4, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedBg:I

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 534
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 535
    iget v2, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorSelectedText:I

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 536
    iget-object v2, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->valueTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 537
    goto :goto_1

    .line 538
    :cond_0
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 539
    const/16 v4, 0xc

    invoke-static {p6, v4}, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel;->dpToPx(Landroid/content/Context;I)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 540
    iget v4, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedBg:I

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 541
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 542
    iget v2, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorUnselectedText:I

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 543
    iget-object v2, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->labelTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 526
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 546
    :cond_1
    if-eqz p0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 547
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 548
    iget p1, p5, Lcom/google/android/patch/cameralooks/TomteProSettingsPanel$DynamicPalette;->colorValueText:I

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 550
    :cond_2
    return-void
.end method
