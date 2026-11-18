package pixel.camera.test;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;

/** Test-only adapter: runs the APK's original language manager and matcher without Camera HAL. */
public class PixelRussianSpeechTest extends Activity {
    private TextView view;
    private final StringBuilder report = new StringBuilder();
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        view = new TextView(this);
        view.setTextSize(16);
        view.setPadding(24, 24, 24, 24);
        setContentView(view);
        new Thread(() -> {
            try { test(); } catch (Throwable error) { line("ERROR: " + error); Log.e("PixelRussianTest", "test failed", error); }
        }, "russian-speech-test").start();
    }
    private void line(String message) {
        Log.i("PixelRussianTest", message);
        synchronized(report) { report.append(message).append('\n'); }
        runOnUiThread(() -> view.setText(report.toString()));
        try (java.io.FileOutputStream out = new java.io.FileOutputStream(new java.io.File(getExternalFilesDir(null), "russian-speech-test.txt"))) {
            out.write(report.toString().getBytes("UTF-8"));
        } catch (Exception ignored) {}
    }
    private static Class<?> type(String name) throws Exception { return Class.forName(name); }
    private static Object field(Object owner, String name) throws Exception {
        Class<?> current = owner instanceof Class ? (Class<?>)owner : owner.getClass();
        while (current != null) {
            try { Field field = current.getDeclaredField(name); field.setAccessible(true); return field.get(owner instanceof Class ? null : owner); }
            catch (NoSuchFieldException missing) { current = current.getSuperclass(); }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object constant(String owner, String name) throws Exception { return field(type(owner), name); }
    private static boolean accepts(Class<?>[] types, Object[] arguments) {
        if (types.length != arguments.length) return false;
        for(int i=0;i<types.length;i++) {
            if(arguments[i] == null) { if(types[i].isPrimitive())return false; }
            else if(types[i].isPrimitive()) {
                if(types[i] == int.class && !(arguments[i] instanceof Integer))return false;
                if(types[i] == boolean.class && !(arguments[i] instanceof Boolean))return false;
            } else if(!types[i].isInstance(arguments[i]))return false;
        }
        return true;
    }
    private static Object call(Object owner, String name, Object... args) throws Throwable {
        Class<?> current = owner instanceof Class ? (Class<?>)owner : owner.getClass();
        for(Method method : current.getDeclaredMethods()) if(method.getName().equals(name) && accepts(method.getParameterTypes(), args)) {
            method.setAccessible(true);
            try { return method.invoke(owner instanceof Class ? null : owner, args); }
            catch(InvocationTargetException failure) { throw failure.getCause(); }
        }
        throw new NoSuchMethodException(current + "." + name);
    }
    private static Object create(String name, Object... args) throws Throwable {
        for(Constructor<?> constructor : type(name).getDeclaredConstructors()) if(accepts(constructor.getParameterTypes(),args)) {
            constructor.setAccessible(true);
            try {return constructor.newInstance(args);}catch(InvocationTargetException failure){throw failure.getCause();}
        }
        throw new NoSuchMethodException(name + " constructor");
    }
    private static Object suspend(Object owner, String name, Object... args) throws Throwable {
        CountDownLatch done = new CountDownLatch(1);
        AtomicReference<Object> result = new AtomicReference<>();
        Class<?> continuation = type("adqg");
        Object callback = Proxy.newProxyInstance(continuation.getClassLoader(),new Class[]{continuation},(p,m,a)->{
            if(m.getName().equals("iW"))return constant("adql","a");
            if(m.getName().equals("w")){result.set(a[0]);done.countDown();return null;}
            if(m.getName().equals("toString"))return "RussianSpeechTestContinuation";
            return null;
        });
        Object[] parameters=Arrays.copyOf(args,args.length+1);parameters[args.length]=callback;
        Object immediate=call(owner,name,parameters);
        if(immediate != constant("adqn","a"))return immediate;
        if(!done.await(25,TimeUnit.SECONDS))throw new TimeoutException(name);
        Object value=result.get();
        if(value != null && !value.getClass().getName().startsWith("x") && !value.getClass().getName().startsWith("tj")) {
            call(type("aanc"),"s",value); // Kotlin Result.throwOnFailure
        }
        return value;
    }
    private void test() throws Throwable {
        line("script languages="+constant("kuw","a"));
        line("SODA locales="+constant("tjb","a"));
        line("word-count languages="+constant("ktp","a"));
        Locale russian=Locale.forLanguageTag("ru-RU");
        String script="Ёлка, ещё один съёмочный день. 2026";
        Object matcher=create("ktp",script,russian);
        line("normalized script="+field(matcher,"g"));
        line("word count="+call(field(matcher,"p"),"a"));
        line("English still allowed="+((Collection<?>)constant("kuw","a")).contains("en"));
        if(!((Collection<?>)constant("kuw","a")).contains("ru"))throw new AssertionError("Russian script gate");
        if(!((Collection<?>)constant("tjb","a")).contains(russian))throw new AssertionError("Russian locale gate");
        if(!((Collection<?>)constant("ktp","a")).contains("ru"))throw new AssertionError("Russian word counting");
        if(!Integer.valueOf(6).equals(call(field(matcher,"p"),"a")))throw new AssertionError("Russian word count");
        line("CORE LANGUAGE CHECKS PASSED; checking native model access next");

        Object address=call(type("adal"),"c","com.google.android.tts","com.google.android.libraries.speech.transcription.recognition.grpc.GoogleAsrService");
        Object builder=call(type("acwq"),"i",address,this);
        Object auth=create("adao",field(constant("adap","a"),"b"));
        call(auth,"b",4096);call(auth,"b",512);
        Object options=field(builder,"a");
        Field policy=options.getClass().getField("e");policy.set(options,call(auth,"a"));
        // Use the same trusted-package verifier as the camera's production tjd provider.
        Object verifier=call(type("aamv"),"B",this,create("yvd","com.google.android.tts"),Executors.newSingleThreadExecutor());
        call(builder,"j",verifier);
        Object channel=call(builder,"g");
        Object stub=create("xgf",channel,constant("acvm","a"));
        Object config=create("tjm","Biotite",russian,Collections.emptyList(),constant("tjk","a"),10000,1,null,true);
        Object languageManager=create("tjb",this,stub,config);
        Object catalog=suspend(languageManager,"b");
        line("model catalog="+catalog);
        Object info=suspend(languageManager,"c",russian);
        line("Russian native model="+info);
        line("DONE");
    }
}
