import android.app.Activity;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/** Test-only adapter to the original 11.1.040.982810059.19 Compose renderer. */
public final class PixelTeleprompterPreview {
    private static final String SCRIPT =
            "When the camera turns sideways, the teleprompter should keep complete phrases on each line. "
            + "The text must stay readable while recording a video. "
            + "При повороте камеры текст должен оставаться читаемым и помещаться целыми фразами.";

    private interface Callback {
        Object run(Object[] arguments) throws Throwable;
    }

    private static Class<?> type(String name) throws ClassNotFoundException {
        return Class.forName(name);
    }

    private static Object field(String owner, String name) throws Exception {
        return type(owner).getField(name).get(null);
    }

    private static Object call(String owner, String name, Object... arguments) throws Throwable {
        for (Method method : type(owner).getDeclaredMethods()) {
            if (method.getName().equals(name) && method.getParameterCount() == arguments.length) {
                method.setAccessible(true);
                try {
                    return method.invoke(null, arguments);
                } catch (InvocationTargetException error) {
                    throw error.getCause();
                }
            }
        }
        throw new NoSuchMethodException(owner + "." + name);
    }

    private static Object callback(String name, Callback callback) throws Exception {
        Class<?> functionType = type(name);
        return Proxy.newProxyInstance(functionType.getClassLoader(), new Class<?>[]{functionType},
                (proxy, method, arguments) -> {
                    switch (method.getName()) {
                        case "toString": return "PixelTeleprompterPreview";
                        case "hashCode": return System.identityHashCode(proxy);
                        case "equals": return proxy == arguments[0];
                        default: return callback.run(arguments);
                    }
                });
    }

    public static void portrait(bya composer, int flags) {
        render(composer, 0, false);
    }

    public static void landscape(bya composer, int flags) {
        render(composer, 1, false);
    }

    public static void reverseLandscape(bya composer, int flags) {
        render(composer, 2, false);
    }

    public static void tabletop(bya composer, int flags) {
        render(composer, 1, true);
    }

    private static void render(Object composer, int orientation, boolean tabletop) {
        try {
            Object localContext = field("dcz", "b");
            for (Method method : type("bya").getDeclaredMethods()) {
                if (method.getName().equals("e") && method.getParameterCount() == 1) {
                    Object context = method.invoke(composer, localContext);
                    if (context instanceof Activity) {
                        // Android orientation constants: portrait, landscape, reverse landscape.
                        ((Activity) context).setRequestedOrientation(
                                orientation == 0 ? 1 : orientation == 1 ? 0 : 8);
                    }
                }
            }

            Object unit = field("adok", "a");
            Object noArgumentCallback = callback("adrs", args -> unit);
            Object oneArgumentCallback = callback("adsd", args -> unit);
            Object body = callback("adsh", args -> {
                Object scrollState = call("c", "w", args[0]);
                // Original script renderer, using medium font/line-height resource IDs.
                call("fue", "by", null, SCRIPT, -1, -1, scrollState,
                        oneArgumentCallback, oneArgumentCallback,
                        0x7f0700d3, 0x7f0700d8, false, args[0], 0);
                return unit;
            });
            Object controls = callback("adsh", args -> {
                call("fue", "bv", null, noArgumentCallback, noArgumentCallback, args[0], 0);
                return unit;
            });
            Object presenter = callback("adsh", args -> {
                Object[] orientations = (Object[]) call("smc", "values");
                Object[] layouts = (Object[]) call("slz", "values");
                call("fue", "bu", field("cjn", "e"), false, false, noArgumentCallback,
                        false, body, controls, layouts[tabletop ? 3 : 1],
                        orientations[orientation], args[0], 0);
                return unit;
            });
            call("kii", "a", false, presenter, composer, 48, 1);
        } catch (Throwable error) {
            throw new RuntimeException(error);
        }
    }
}
