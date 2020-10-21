import java.io.*;
import java.util.concurrent.ConcurrentHashMap;

public class HelloClassLoader extends ClassLoader {

    /**
     * 用一个map维护类名和路径的关系，考虑到可能出现的并发，使用ConcurrentHashMap
     */
    private ConcurrentHashMap<String, String> xlassMap = new ConcurrentHashMap<>();

    /**
     * 加载xlass信息到map，并不真正执行加载
     * @param name 类名
     * @param path 类路径
     */
    public void loadClass(String name, String path) {
        if (xlassMap == null) {
            xlassMap = new ConcurrentHashMap<>();
        }
        xlassMap.put(name, path);
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        if (xlassMap.contains(name)) {
            throw new ClassNotFoundException();
        }
        byte[] xlass;
        try(FileInputStream fileInputStream = new FileInputStream(xlassMap.get(name))) {
            int len = fileInputStream.available();
            xlass = new byte[len];
            fileInputStream.read(xlass);
            decode(xlass);
            return defineClass(name, xlass, 0, xlass.length);
        } catch (IOException e) {
            e.printStackTrace();
        }
        throw new ClassNotFoundException();
    }

    private void decode(byte[] xlass) {
        for (int i = 0; i < xlass.length; i++) {
            xlass[i] = (byte) (255 - xlass[i]);
        }
    }

    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
        String name = "Hello";
        String path = "/Users/wuyue/IdeaProjects/java01/src/Hello.xlass";
        HelloClassLoader helloClassLoader = new HelloClassLoader();
        helloClassLoader.loadClass(name, path);
        Object obj = helloClassLoader.findClass(name).newInstance();
        System.out.println("=====");
    }

}
