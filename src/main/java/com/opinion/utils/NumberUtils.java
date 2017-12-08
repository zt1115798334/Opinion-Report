package com.opinion.utils;

import java.math.BigDecimal;

/**
 * <p>Title: NumberUtils</p>
 * <p>Description: 数值处理工具类</p>
 *
 * @author Wangjianchun
 * @date 2017年6月29日
 */
public class NumberUtils {

    private NumberUtils() {
    }

    public static Double changeProportion(Number num1, Number num2) {
        Double result = 0D;
        BigDecimal numBig1 = new BigDecimal(String.valueOf(num1));
        BigDecimal numBig2 = new BigDecimal(String.valueOf(num2));
        if (numBig2.compareTo(BigDecimal.ZERO) == 1) {
            BigDecimal calcResult = numBig1.divide(numBig2, 5, BigDecimal.ROUND_HALF_DOWN)
                    .subtract(BigDecimal.ONE)
                    .abs()
                    .multiply(new BigDecimal(100));
            result = calcResult.doubleValue();
        }
        return result;
    }
}
