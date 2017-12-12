package com.opinion.utils;

import com.google.common.base.Objects;
import org.apache.commons.lang3.StringUtils;


/**
 * @author zhangtong
 * Created by on 2017/11/29
 */
public class TStringUtils {

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

    public static String StringEqual(String str, String equalStr, String def, String elDef) {
        if (Objects.equal(str, equalStr)) {
            return def;
        } else {
            return elDef;
        }
    }
}
