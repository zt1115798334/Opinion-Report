package com.opinion.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * @author zhangtong
 * Created by on 2017/11/29
 */
public class MStringUtils {

    /**
     * 截取字符串
     *
     * @param content    内容
     * @param splitLen   长度
     * @param replaceStr 替换符号
     * @return
     */
    public static String substr(String content, Integer splitLen, String replaceStr) {
        if (StringUtils.isNotEmpty(content)) {
            return content.length() > splitLen ? content.substring(0, splitLen) + replaceStr : content;
        } else {
            return "";
        }
    }
}
