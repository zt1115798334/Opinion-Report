package com.opinion.utils;

import java.math.BigDecimal;
import java.util.List;
import java.util.Random;

public class TestUtils {

    public static String randomGetString(List<String> source) {
        int index = (new Random().nextInt(source.size()));
        return source.get(index);
    }

    public static Integer randomGetInt() {
        int index = (new Random().nextInt(100));
        return index;
    }

    public static Integer randomGetInt(int size) {
        int index = (new Random().nextInt(size));
        return index;
    }

    public static Double randomGetDouble() {
        Double nextDouble = (new Random().nextDouble() * (randomGetInt(2) == 0 ? -1 : 1));
        BigDecimal bg = new BigDecimal(nextDouble);
        double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }

    public static Double randomGetPlusDouble() {
        Double nextDouble = (new Random().nextDouble());
        BigDecimal bg = new BigDecimal(nextDouble);
        double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        return f1;
    }
}
