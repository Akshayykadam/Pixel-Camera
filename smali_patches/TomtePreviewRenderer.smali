.class public Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;
.super Ljava/lang/Object;
.source "TomtePreviewRenderer.java"


# static fields
.field private static final FRAGMENT_SHADER:Ljava/lang/String; = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES uTexture;\nuniform int uLookId;\nvarying vec2 vTexCoord;\n\nfloat getLuma(vec3 c) {\n    return dot(c, vec3(0.2126, 0.7152, 0.0722));\n}\n\nvec3 adjustSaturation(vec3 c, float sat) {\n    float l = getLuma(c);\n    return mix(vec3(l), c, sat);\n}\n\nvec3 adjustContrast(vec3 c, float cont) {\n    return clamp((c - 0.5) * cont + 0.5, 0.0, 1.0);\n}\n\nvoid main() {\n    vec4 src = texture2D(uTexture, vTexCoord);\n    vec3 c = src.rgb;\n    float luma = getLuma(c);\n\n    if (uLookId == 1) {\n        c = adjustContrast(c, 1.06);\n        c = adjustSaturation(c, 1.03);\n    } else if (uLookId == 2) {\n        c = pow(c, vec3(1.18));\n        c = adjustContrast(c, 1.15);\n        c.b += (1.0 - luma) * 0.04;\n    } else if (uLookId == 3) {\n        c.r += 0.07 * luma;\n        c.g += 0.03 * luma;\n        c.b = max(0.0, c.b - 0.05 * luma);\n        c = adjustContrast(c, 1.05);\n        c = adjustSaturation(c, 1.08);\n    } else if (uLookId == 4) {\n        c.r = pow(c.r, 0.90);\n        c.g = pow(c.g, 1.02);\n        c.b = pow(c.b, 1.08);\n        c = adjustContrast(c, 1.22);\n        c = adjustSaturation(c, 1.12);\n    } else if (uLookId == 5) {\n        c = adjustSaturation(c, 1.38);\n        c = adjustContrast(c, 1.18);\n        c.g = pow(c.g, 0.94);\n        c.b = pow(c.b, 0.92);\n    } else if (uLookId == 6) {\n        c = adjustContrast(c, 0.94);\n        c.r += 0.04 * (1.0 - luma);\n        c.g += 0.02 * (1.0 - luma);\n        c = adjustSaturation(c, 0.96);\n    } else if (uLookId == 7) {\n        c.b += 0.04 * luma;\n        c = adjustContrast(c, 1.25);\n        c = adjustSaturation(c, 1.15);\n    } else if (uLookId == 8) {\n        float m = dot(c, vec3(0.299, 0.587, 0.114));\n        m = smoothstep(0.04, 0.96, m);\n        c = vec3(m);\n    } else if (uLookId == 9) {\n        c = adjustSaturation(c, 0.60);\n        c = mix(c, vec3(0.5), -0.05);\n        c = adjustContrast(c, 0.92);\n    }\n\n    gl_FragColor = vec4(clamp(c, 0.0, 1.0), src.a);\n}\n"

.field private static final POOL_SIZE:I = 0x3

.field private static final QUAD_COORDS:[F

.field private static final TAG:Ljava/lang/String; = "PATCH_LOOKS_RENDERER"

.field private static final VERTEX_SHADER:Ljava/lang/String; = "attribute vec2 aPosition;\nattribute vec2 aTexCoord;\nvarying vec2 vTexCoord;\nvoid main() {\n    gl_Position = vec4(aPosition, 0.0, 1.0);\n    vTexCoord = aTexCoord;\n}\n"

.field private static sAllocHeight:I

.field private static sAllocWidth:I

.field private static sEglContext:Landroid/opengl/EGLContext;

.field private static sEglDisplay:Landroid/opengl/EGLDisplay;

.field private static sEglSurface:Landroid/opengl/EGLSurface;

.field private static sFboIds:[I

.field private static sInTexId:I

.field private static sInitFailed:Z

.field private static sInitialized:Z

.field private static sLocLookId:I

.field private static sLocPosition:I

.field private static sLocTexCoord:I

.field private static sLocTexture:I

.field private static sOutEglImages:[J

.field private static sOutRboIds:[I

.field private static sOutputBuffers:[Landroid/hardware/HardwareBuffer;

.field private static sPoolIndex:I

.field private static sProgram:I

.field private static sQuadBuffer:Ljava/nio/FloatBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 23
    const/4 v0, 0x3

    new-array v1, v0, [Landroid/hardware/HardwareBuffer;

    sput-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutputBuffers:[Landroid/hardware/HardwareBuffer;

    .line 24
    new-array v1, v0, [J

    sput-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutEglImages:[J

    .line 25
    new-array v1, v0, [I

    sput-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutRboIds:[I

    .line 26
    new-array v0, v0, [I

    sput-object v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sFboIds:[I

    .line 27
    const/4 v0, 0x0

    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sPoolIndex:I

    .line 28
    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocWidth:I

    .line 29
    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocHeight:I

    .line 31
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    sput-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    .line 32
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    sput-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglContext:Landroid/opengl/EGLContext;

    .line 33
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sput-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglSurface:Landroid/opengl/EGLSurface;

    .line 35
    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    .line 36
    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInTexId:I

    .line 37
    const/4 v1, -0x1

    sput v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocPosition:I

    .line 38
    sput v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexCoord:I

    .line 39
    sput v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocLookId:I

    .line 40
    sput v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexture:I

    .line 43
    sput-boolean v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInitialized:Z

    .line 44
    sput-boolean v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInitFailed:Z

    .line 46
    const/16 v0, 0x10

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->QUAD_COORDS:[F

    return-void

    nop

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static ensureBuffers(IIJ)Z
    .locals 12

    .line 313
    sget v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocWidth:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, p0, :cond_0

    sget v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocHeight:I

    if-ne v0, p1, :cond_0

    sget-object v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutputBuffers:[Landroid/hardware/HardwareBuffer;

    aget-object v0, v0, v2

    if-eqz v0, :cond_0

    .line 314
    return v1

    .line 317
    :cond_0
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->releaseBuffers()V

    .line 320
    const-wide/16 v3, 0x200

    or-long/2addr p2, v3

    const-wide/16 v3, 0x800

    or-long/2addr p2, v3

    .line 321
    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x3

    const-string v4, "PATCH_LOOKS_RENDERER"

    const v11, 0x8d40

    if-ge v0, v3, :cond_2

    .line 322
    const/4 v7, 0x1

    const/4 v8, 0x1

    move v5, p0

    move v6, p1

    move-wide v9, p2

    :try_start_0
    invoke-static/range {v5 .. v10}, Landroid/hardware/HardwareBuffer;->create(IIIIJ)Landroid/hardware/HardwareBuffer;

    move-result-object v3

    .line 325
    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutputBuffers:[Landroid/hardware/HardwareBuffer;

    aput-object v3, v5, v0

    .line 327
    new-array v5, v1, [I

    .line 328
    invoke-static {v1, v5, v2}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 329
    sget-object v6, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutRboIds:[I

    aget v5, v5, v2

    aput v5, v6, v0

    .line 331
    const v6, 0x8d41

    invoke-static {v6, v5}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 332
    new-instance v5, Lcom/google/android/libraries/oliveoil/gl/EGLImage;

    invoke-direct {v5, v3}, Lcom/google/android/libraries/oliveoil/gl/EGLImage;-><init>(Landroid/hardware/HardwareBuffer;)V

    .line 333
    sget-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutEglImages:[J

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v7, 0x0

    aput-wide v7, v3, v0

    .line 334
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7, v8}, Lcom/google/android/libraries/oliveoil/gl/EGLImage;->attachToRbo(J)V

    .line 336
    new-array v3, v1, [I

    .line 337
    invoke-static {v1, v3, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 338
    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sFboIds:[I

    aget v3, v3, v2

    aput v3, v5, v0

    .line 340
    invoke-static {v11, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 341
    sget-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutRboIds:[I

    aget v3, v3, v0

    const v5, 0x8ce0

    invoke-static {v11, v5, v6, v3}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 348
    invoke-static {v11}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    move-result v3

    .line 349
    const v5, 0x8cd5

    if-eq v3, v5, :cond_1

    .line 350
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Framebuffer incomplete: "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    invoke-static {v11, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 352
    return v2

    .line 321
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 355
    :cond_2
    invoke-static {v11, v2}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 357
    sput p0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocWidth:I

    .line 358
    sput p1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocHeight:I

    .line 359
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Allocated preview buffer pool: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, "x"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    return v1

    .line 361
    :catchall_0
    move-exception p0

    .line 362
    const-string p1, "ensureBuffers failed"

    invoke-static {v4, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 363
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->releaseBuffers()V

    .line 364
    return v2
.end method

.method private static ensureEgl()Z
    .locals 14

    .line 212
    const-string v0, "PATCH_LOOKS_RENDERER"

    sget-boolean v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInitialized:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 213
    return v2

    .line 217
    :cond_0
    const/4 v1, 0x0

    :try_start_0
    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v3

    sput-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    .line 218
    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    if-ne v3, v4, :cond_1

    .line 219
    const-string v2, "eglGetDisplay failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    return v1

    .line 223
    :cond_1
    const/4 v3, 0x2

    new-array v4, v3, [I

    .line 224
    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v5, v4, v1, v4, v2}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v4

    if-nez v4, :cond_2

    .line 225
    const-string v2, "eglInitialize failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    return v1

    .line 229
    :cond_2
    const/16 v4, 0xd

    new-array v6, v4, [I

    fill-array-data v6, :array_0

    .line 239
    new-array v4, v2, [Landroid/opengl/EGLConfig;

    .line 240
    new-array v13, v2, [I

    .line 241
    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v12, 0x0

    move-object v8, v4

    move-object v11, v13

    invoke-static/range {v5 .. v12}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v5

    if-eqz v5, :cond_7

    aget v5, v13, v1

    if-nez v5, :cond_3

    goto/16 :goto_0

    .line 246
    :cond_3
    const/16 v5, 0x3038

    const/16 v6, 0x3098

    filled-new-array {v6, v3, v5}, [I

    move-result-object v3

    .line 250
    sget-object v6, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    aget-object v7, v4, v1

    sget-object v8, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v6, v7, v8, v3, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v3

    sput-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglContext:Landroid/opengl/EGLContext;

    .line 251
    sget-object v6, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    if-ne v3, v6, :cond_4

    .line 252
    const-string v2, "eglCreateContext failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    return v1

    .line 256
    :cond_4
    const/16 v3, 0x3057

    const/16 v6, 0x3056

    filled-new-array {v3, v2, v6, v2, v5}, [I

    move-result-object v3

    .line 261
    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    aget-object v4, v4, v1

    invoke-static {v5, v4, v3, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object v3

    sput-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglSurface:Landroid/opengl/EGLSurface;

    .line 262
    sget-object v4, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sEglContext:Landroid/opengl/EGLContext;

    invoke-static {v4, v3, v3, v5}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 263
    const-string v2, "eglMakeCurrent failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    return v1

    .line 268
    :cond_5
    const-string v3, "attribute vec2 aPosition;\nattribute vec2 aTexCoord;\nvarying vec2 vTexCoord;\nvoid main() {\n    gl_Position = vec4(aPosition, 0.0, 1.0);\n    vTexCoord = aTexCoord;\n}\n"

    const v4, 0x8b31

    invoke-static {v4, v3}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->loadShader(ILjava/lang/String;)I

    move-result v3

    .line 269
    const-string v4, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nuniform samplerExternalOES uTexture;\nuniform int uLookId;\nvarying vec2 vTexCoord;\n\nfloat getLuma(vec3 c) {\n    return dot(c, vec3(0.2126, 0.7152, 0.0722));\n}\n\nvec3 adjustSaturation(vec3 c, float sat) {\n    float l = getLuma(c);\n    return mix(vec3(l), c, sat);\n}\n\nvec3 adjustContrast(vec3 c, float cont) {\n    return clamp((c - 0.5) * cont + 0.5, 0.0, 1.0);\n}\n\nvoid main() {\n    vec4 src = texture2D(uTexture, vTexCoord);\n    vec3 c = src.rgb;\n    float luma = getLuma(c);\n\n    if (uLookId == 1) {\n        c = adjustContrast(c, 1.06);\n        c = adjustSaturation(c, 1.03);\n    } else if (uLookId == 2) {\n        c = pow(c, vec3(1.18));\n        c = adjustContrast(c, 1.15);\n        c.b += (1.0 - luma) * 0.04;\n    } else if (uLookId == 3) {\n        c.r += 0.07 * luma;\n        c.g += 0.03 * luma;\n        c.b = max(0.0, c.b - 0.05 * luma);\n        c = adjustContrast(c, 1.05);\n        c = adjustSaturation(c, 1.08);\n    } else if (uLookId == 4) {\n        c.r = pow(c.r, 0.90);\n        c.g = pow(c.g, 1.02);\n        c.b = pow(c.b, 1.08);\n        c = adjustContrast(c, 1.22);\n        c = adjustSaturation(c, 1.12);\n    } else if (uLookId == 5) {\n        c = adjustSaturation(c, 1.38);\n        c = adjustContrast(c, 1.18);\n        c.g = pow(c.g, 0.94);\n        c.b = pow(c.b, 0.92);\n    } else if (uLookId == 6) {\n        c = adjustContrast(c, 0.94);\n        c.r += 0.04 * (1.0 - luma);\n        c.g += 0.02 * (1.0 - luma);\n        c = adjustSaturation(c, 0.96);\n    } else if (uLookId == 7) {\n        c.b += 0.04 * luma;\n        c = adjustContrast(c, 1.25);\n        c = adjustSaturation(c, 1.15);\n    } else if (uLookId == 8) {\n        float m = dot(c, vec3(0.299, 0.587, 0.114));\n        m = smoothstep(0.04, 0.96, m);\n        c = vec3(m);\n    } else if (uLookId == 9) {\n        c = adjustSaturation(c, 0.60);\n        c = mix(c, vec3(0.5), -0.05);\n        c = adjustContrast(c, 0.92);\n    }\n\n    gl_FragColor = vec4(clamp(c, 0.0, 1.0), src.a);\n}\n"

    const v5, 0x8b30

    invoke-static {v5, v4}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->loadShader(ILjava/lang/String;)I

    move-result v4

    .line 270
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v5

    sput v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    .line 271
    invoke-static {v5, v3}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 272
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 273
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    invoke-static {v3}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 275
    new-array v3, v2, [I

    .line 276
    sget v4, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    const v5, 0x8b82

    invoke-static {v4, v5, v3, v1}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 277
    aget v3, v3, v1

    if-eq v3, v2, :cond_6

    .line 278
    sget v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    invoke-static {v2}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Program link error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    return v1

    .line 282
    :cond_6
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    const-string v4, "aPosition"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v3

    sput v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocPosition:I

    .line 283
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    const-string v4, "aTexCoord"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v3

    sput v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexCoord:I

    .line 284
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    const-string v4, "uLookId"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v3

    sput v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocLookId:I

    .line 285
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    const-string v4, "uTexture"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v3

    sput v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexture:I

    .line 288
    new-array v3, v2, [I

    .line 289
    invoke-static {v2, v3, v1}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 290
    aget v3, v3, v1

    sput v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInTexId:I

    .line 291
    const v4, 0x8d65

    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 292
    const/16 v3, 0x2801

    const/16 v5, 0x2601

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 293
    const/16 v3, 0x2800

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 294
    const/16 v3, 0x2802

    const v5, 0x812f

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 295
    const/16 v3, 0x2803

    invoke-static {v4, v3, v5}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 297
    sget-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->QUAD_COORDS:[F

    array-length v4, v3

    mul-int/lit8 v4, v4, 0x4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 298
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 299
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v4

    sput-object v4, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sQuadBuffer:Ljava/nio/FloatBuffer;

    .line 300
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 301
    sget-object v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sQuadBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v3

    check-cast v3, Ljava/nio/FloatBuffer;

    .line 303
    sput-boolean v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInitialized:Z

    .line 304
    const-string v3, "TomtePreviewRenderer EGL & GL program initialized successfully."

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    return v2

    .line 242
    :cond_7
    :goto_0
    const-string v2, "eglChooseConfig failed"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    return v1

    .line 306
    :catchall_0
    move-exception v2

    .line 307
    const-string v3, "ensureEgl failed"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 308
    return v1

    nop

    :array_0
    .array-data 4
        0x3040
        0x4
        0x3033
        0x1
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3038
    .end array-data
.end method

.method private static loadShader(ILjava/lang/String;)I
    .locals 3

    .line 388
    invoke-static {p0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p0

    .line 389
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 390
    invoke-static {p0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 391
    const/4 p1, 0x1

    new-array p1, p1, [I

    .line 392
    const v0, 0x8b81

    const/4 v1, 0x0

    invoke-static {p0, v0, p1, v1}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 393
    aget p1, p1, v1

    if-nez p1, :cond_0

    .line 394
    invoke-static {p0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Shader compile error: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "PATCH_LOOKS_RENDERER"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    invoke-static {p0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 396
    return v1

    .line 398
    :cond_0
    return p0
.end method

.method public static declared-synchronized processPreviewBuffer(Landroid/hardware/HardwareBuffer;)Landroid/hardware/HardwareBuffer;
    .locals 13

    const-class v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;

    monitor-enter v0

    .line 135
    if-nez p0, :cond_0

    .line 136
    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    .line 139
    :cond_0
    :try_start_0
    sget v1, Lcom/google/android/patch/cameralooks/TomteInitHelper;->sSelectedLookId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 140
    if-gtz v1, :cond_1

    .line 142
    monitor-exit v0

    return-object p0

    .line 145
    :cond_1
    :try_start_1
    sget-boolean v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInitFailed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    if-eqz v2, :cond_2

    .line 146
    monitor-exit v0

    return-object p0

    .line 150
    :cond_2
    :try_start_2
    invoke-virtual {p0}, Landroid/hardware/HardwareBuffer;->getWidth()I

    move-result v2

    .line 151
    invoke-virtual {p0}, Landroid/hardware/HardwareBuffer;->getHeight()I

    move-result v3

    .line 152
    if-lez v2, :cond_6

    if-gtz v3, :cond_3

    goto/16 :goto_1

    .line 156
    :cond_3
    invoke-static {}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->ensureEgl()Z

    move-result v4

    if-nez v4, :cond_4

    .line 157
    const/4 v1, 0x1

    sput-boolean v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInitFailed:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 158
    monitor-exit v0

    return-object p0

    .line 161
    :cond_4
    :try_start_3
    invoke-virtual {p0}, Landroid/hardware/HardwareBuffer;->getUsage()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->ensureBuffers(IIJ)Z

    move-result v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-nez v4, :cond_5

    .line 162
    monitor-exit v0

    return-object p0

    .line 165
    :cond_5
    :try_start_4
    sget v4, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sPoolIndex:I

    .line 166
    add-int/lit8 v5, v4, 0x1

    rem-int/lit8 v5, v5, 0x3

    sput v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sPoolIndex:I

    .line 168
    sget-object v5, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutputBuffers:[Landroid/hardware/HardwareBuffer;

    aget-object v5, v5, v4

    .line 169
    sget-object v6, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sFboIds:[I

    aget v4, v6, v4

    .line 172
    const v6, 0x8d40

    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 173
    const/4 v4, 0x0

    invoke-static {v4, v4, v2, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 176
    new-instance v2, Lcom/google/android/libraries/oliveoil/gl/EGLImage;

    invoke-direct {v2, p0}, Lcom/google/android/libraries/oliveoil/gl/EGLImage;-><init>(Landroid/hardware/HardwareBuffer;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 177
    const v3, 0x84c0

    :try_start_5
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 178
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sInTexId:I

    const v7, 0x8d65

    invoke-static {v7, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 179
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v7, 0x0

    invoke-static {v7, v8}, Lcom/google/android/libraries/oliveoil/gl/EGLImage;->attachToTexture(J)V

    .line 182
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sProgram:I

    invoke-static {v3}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 183
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexture:I

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 184
    sget v3, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocLookId:I

    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 186
    sget-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sQuadBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v4}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/FloatBuffer;

    .line 187
    sget v7, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocPosition:I

    const/4 v8, 0x2

    const/16 v9, 0x1406

    const/4 v10, 0x0

    const/16 v11, 0x10

    sget-object v12, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sQuadBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 188
    sget v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocPosition:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 190
    sget-object v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sQuadBuffer:Ljava/nio/FloatBuffer;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v1

    check-cast v1, Ljava/nio/FloatBuffer;

    .line 191
    sget v7, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexCoord:I

    const/4 v8, 0x2

    const/16 v9, 0x1406

    const/4 v10, 0x0

    const/16 v11, 0x10

    sget-object v12, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sQuadBuffer:Ljava/nio/FloatBuffer;

    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 192
    sget v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexCoord:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 194
    const/4 v1, 0x5

    const/4 v3, 0x4

    invoke-static {v1, v4, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 196
    sget v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocPosition:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 197
    sget v1, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sLocTexCoord:I

    invoke-static {v1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 199
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 200
    :try_start_6
    invoke-virtual {v2}, Lcom/google/android/libraries/oliveoil/gl/EGLImage;->close()V

    .line 202
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 203
    monitor-exit v0

    return-object v5

    .line 176
    :catchall_0
    move-exception v1

    :try_start_7
    invoke-virtual {v2}, Lcom/google/android/libraries/oliveoil/gl/EGLImage;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_8
    invoke-static {v1, v2}, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer$$ExternalSyntheticBackport0;->m(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :goto_0
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 153
    :cond_6
    :goto_1
    monitor-exit v0

    return-object p0

    .line 205
    :catchall_2
    move-exception v1

    .line 206
    :try_start_9
    const-string v2, "PATCH_LOOKS_RENDERER"

    const-string v3, "processPreviewBuffer failed, fallback to inputBuffer"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 207
    monitor-exit v0

    return-object p0

    .line 134
    :catchall_3
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static releaseBuffers()V
    .locals 4

    .line 369
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_3

    .line 370
    sget-object v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sFboIds:[I

    aget v2, v2, v1

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 371
    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v3, v2, v0}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 372
    sget-object v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sFboIds:[I

    aput v0, v2, v1

    .line 374
    :cond_0
    sget-object v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutRboIds:[I

    aget v2, v2, v1

    if-eqz v2, :cond_1

    .line 375
    filled-new-array {v2}, [I

    move-result-object v2

    invoke-static {v3, v2, v0}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 376
    sget-object v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutRboIds:[I

    aput v0, v2, v1

    .line 378
    :cond_1
    sget-object v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutputBuffers:[Landroid/hardware/HardwareBuffer;

    aget-object v2, v2, v1

    if-eqz v2, :cond_2

    .line 379
    invoke-virtual {v2}, Landroid/hardware/HardwareBuffer;->close()V

    .line 380
    sget-object v2, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sOutputBuffers:[Landroid/hardware/HardwareBuffer;

    const/4 v3, 0x0

    aput-object v3, v2, v1

    .line 369
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 383
    :cond_3
    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocWidth:I

    .line 384
    sput v0, Lcom/google/android/patch/cameralooks/TomtePreviewRenderer;->sAllocHeight:I

    .line 385
    return-void
.end method
