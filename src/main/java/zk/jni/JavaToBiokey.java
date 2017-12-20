package zk.jni;


import java.util.Properties;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
public class JavaToBiokey {
    private static Properties props;

    /***
     * 9.0 Algorithm Identification
     * return
     * 	true: Identify successfully
     * 	false: Identify failed
     */
    public native static boolean NativeToProcess(String ARegTemplate,
                                                 String AVerTemplate);

    /***
     * 10.0 Algorithm Identification
     * return
     * 	true: Identify successfully
     * 	false: Identify failed
     */
//    public native static boolean NativeToProcess10(String ARegTemplate,
//                                                   String AVerTemplate);

    /***
     * SetThreshold
     * Parameter
     * 	AThreshold: 10 as default The larger the value the greater the rejection rate
     * 	AOneToOneThreshold: 10 as default
     */
    public native static void NativeToSetThreshold(int AThreshold,
                                                   int AOneToOneThreshold);

    static {
        System.loadLibrary("matchdll");
    }
}
