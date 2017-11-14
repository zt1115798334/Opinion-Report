package com.opinion.utils;

import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * <p>Title: DateUtils</p>
 * <p>Description: 日期工具类</p>
 *
 * @author zhangtong
 * @date 2017年4月6日
 */
public class DateUtils {

    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String DATE_SECOND_FORMAT = "yyyy-MM-dd HH:mm:ss";

    private DateUtils() {
    }


    public static LocalDateTime currentDate() {
        LocalDateTime now = LocalDateTime.now();
        return now;
    }

    /**
     * <p>
     * Description: 解析yyyy-MM-dd HH:mm:ss格式的日期字符串，返回日期对象
     * </p>
     *
     * @param date
     * @return
     * @author wjc
     * @date 2016年12月30日
     */
    public static LocalDate parseDate(String date) {
        return parseDate(date, DATE_FORMAT);
    }
    /**
     * <p>
     * Description: 使用指定的日期格式解析日期字符串，返回日期对象
     * </p>
     *
     * @param date
     * @param dateFormat
     * @return
     * @author wjc
     * @date 2016年12月30日
     */
    public static LocalDate parseDate(String date, String dateFormat) {
        LocalDate result = null;
        if (StringUtils.isNotEmpty(date) && StringUtils.isNotEmpty(dateFormat)) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
            result = LocalDate.parse(date, formatter);
        }
        return result;
    }
    /**
     * <p>
     * Description: 使用指定的日期格式解析日期字符串，返回日期对象
     * </p>
     *
     * @param date
     * @param dateFormat
     * @return
     * @author wjc
     * @date 2016年12月30日
     */
    public static LocalDateTime parseDatetime(String date, String dateFormat) {
        LocalDateTime result = null;
        if (StringUtils.isNotEmpty(date) && StringUtils.isNotEmpty(dateFormat)) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
            result = LocalDateTime.parse(date, formatter);
        }
        return result;
    }

    /**
     * <p>Description: 将日期对象格式化为yyyy-MM-dd格式的字符串</p>
     *
     * @param date
     * @return
     * @author wjc
     * @date 2017年4月6日
     */
    public static String formatDate(LocalDateTime date) {
        if (date == null) {
            return null;
        }
        return formatDate(date, DATE_FORMAT);
    }

    /**
     * <p>
     * Description: 使用指定的格式格式化日期对象，返回格式化后的日期字符串
     * </p>
     *
     * @param date
     * @param dateFormat
     * @return
     * @author wjc
     * @date 2016年12月30日
     */
    public static String formatDate(LocalDateTime date, String dateFormat) {
        String result = null;
        if (date != null && StringUtils.isNotEmpty(dateFormat)) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
            result = date.format(formatter);
        }
        return result;
    }


}
