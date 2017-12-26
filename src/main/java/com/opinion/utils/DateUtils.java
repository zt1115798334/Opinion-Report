package com.opinion.utils;

import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;

import static java.time.temporal.TemporalAdjusters.*;

/**
 * <p>Title: DateUtils</p>
 * <p>Description: 日期工具类</p>
 *
 * @author zhangtong
 * @date 2017年4月6日
 */
public class DateUtils {

    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String TIME_FORMAT = "HH:mm:ss";
    public static final String TIME_FORMAT_SIMPLE = "HH:mm:ss";
    public static final String DATE_SECOND_FORMAT_SIMPLE = "yyyy-MM-dd HH:mm";
    public static final String DATE_SECOND_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final String DATE__FORMAT_CN = "yyyy年MM月dd日";
    public static final String DATE_TIME__FORMAT_CN = "yyyy年MM月dd日 HH:mm:ss";

    private DateUtils() {
    }


    public static LocalDate currentDate() {
        LocalDate now = LocalDate.now();
        return now;
    }

    public static LocalDateTime currentDatetime() {
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
     * @param dateTime
     * @param dateFormat
     * @return
     */
    public static LocalDateTime parseDatetime(String dateTime, String dateFormat) {
        LocalDateTime result = null;
        if (StringUtils.isNotEmpty(dateTime) && StringUtils.isNotEmpty(dateFormat)) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
            result = LocalDateTime.parse(dateTime, formatter);
        }
        return result;
    }

    /**
     * <p>Description: 将日期对象格式化为yyyy-MM-dd格式的字符串</p>
     *
     * @param date
     * @return
     */
    public static String formatDate(LocalDate date) {
        if (date == null) {
            return null;
        }
        return formatDate(date, DATE_FORMAT);
    }

    /**
     * <p>Description: 将日期对象格式化为yyyy-MM-dd格式的字符串</p>
     *
     * @param dateTime
     * @return
     */
    public static String formatDate(LocalDateTime dateTime) {
        if (dateTime == null) {
            return null;
        }
        return formatDate(dateTime, DATE_FORMAT);
    }

    /**
     * <p>
     * Description: 使用指定的格式格式化日期对象，返回格式化后的日期字符串
     * </p>
     *
     * @param date
     * @param dateFormat
     * @return
     */
    public static String formatDate(LocalDate date, String dateFormat) {
        String result = null;
        if (date != null && StringUtils.isNotEmpty(dateFormat)) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
            result = date.format(formatter);
        }
        return result;
    }

    /**
     * <p>
     * Description: 使用指定的格式格式化日期对象，返回格式化后的日期字符串
     * </p>
     *
     * @param dateTime
     * @param dateFormat
     * @return
     */
    public static String formatDate(LocalDateTime dateTime, String dateFormat) {
        String result = null;
        if (dateTime != null && StringUtils.isNotEmpty(dateFormat)) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(dateFormat);
            result = dateTime.format(formatter);
        }
        return result;
    }

    /**
     * 获取相隔微秒数
     *
     * @param dateTime
     * @return
     */
    public static long dateTimeBeApart(LocalDateTime dateTime) {
        LocalDateTime currentDatetime = currentDatetime();
        return Duration.between(dateTime, currentDatetime).toMillis();
    }

    public static LocalDateTime dateToZero(LocalDate date) {
        LocalTime time = LocalTime.of(0, 0, 0);
        return date.atTime(time);
    }

    /**
     * 时分秒归零
     *
     * @param dateTime
     * @return
     */
    public static LocalDateTime dateTimeToZero(LocalDateTime dateTime) {
        LocalDate date = dateTime.toLocalDate();
        LocalTime time = LocalTime.of(0, 0, 0);
        return date.atTime(time);
    }

    /**
     * 时分秒归零
     *
     * @param date
     * @return
     */
    public static LocalDateTime dateToEnd(LocalDate date) {
        LocalTime time = LocalTime.of(23, 59, 59);
        return date.atTime(time);
    }

    /**
     * 时分秒归零
     *
     * @param dateTime
     * @return
     */
    public static LocalDateTime dateTimeToEnd(LocalDateTime dateTime) {
        LocalDate date = dateTime.toLocalDate();
        LocalTime time = LocalTime.of(23, 59, 59);
        return date.atTime(time);
    }

    /**
     * 当前日期前七天日期
     *
     * @return
     */
    public static LocalDateTime currentDateAfterSevenDays() {
        LocalDateTime dateTimeOfSevenDays = currentDateAddDay(6);
        return dateTimeToZero(dateTimeOfSevenDays);
    }

    /**
     * 当前日期前七天日期
     *
     * @return
     */
    public static LocalDateTime currentDateBeforeSevenDays() {
        LocalDateTime dateTimeOfSevenDays = currentDateAddDay(-6);
        return dateTimeToZero(dateTimeOfSevenDays);
    }

    /**
     * 当前日期前14天日期
     *
     * @return
     */
    public static LocalDateTime currentDateBeforeFourteenDays() {
        LocalDateTime dateTimeOfSevenDays = currentDateAddDay(-13);
        return dateTimeToZero(dateTimeOfSevenDays);
    }

    /**
     * 当前日期加上天数
     *
     * @param day
     * @return
     */
    public static LocalDateTime currentDateAddDay(long day) {
        return dateTimeAddDay(day, currentDatetime());
    }

    /**
     * 日期加上天数
     *
     * @param day
     * @return
     */
    public static LocalDateTime dateTimeAddDay(long day, LocalDateTime dateTime) {
        return dateTime.plusDays(day);
    }

    public static String dayOfWeek(DayOfWeek dayOfWeek) {
        return dayOfWeek.getDisplayName(TextStyle.FULL, Locale.CHINA);
    }

    public static List<LocalDate> dateRange(LocalDate dateStart, LocalDate dateEnd) {
        List<LocalDate> result = Lists.newArrayList();
        while (dateStart.isBefore(dateEnd)) {
            result.add(dateStart);
            dateStart = dateStart.plusDays(1);
        }
        result.add(dateEnd);
        return result;
    }

    /**
     * 获取本周周日日期
     *
     * @return
     */
    public static LocalDateTime thisWeekInSunday() {
        LocalDateTime currentDatetime = LocalDateTime.now();
        return dateTimeToEnd(currentDatetime.with(nextOrSame(DayOfWeek.SUNDAY)));
    }

    /**
     * 获取本周周一日期
     *
     * @return
     */
    public static LocalDateTime thisWeekInMonday() {
        LocalDateTime currentDatetime = LocalDateTime.now();
        return dateTimeToZero(currentDatetime.with(previousOrSame(DayOfWeek.MONDAY)));
    }

    /**
     * 获取上周周一日期
     *
     * @return
     */
    public static LocalDateTime previousWeekInMonday() {
        LocalDateTime thisWeekInMonday = thisWeekInMonday();
        return dateTimeAddDay(-7L, thisWeekInMonday);
    }

    /**
     * 获取本月月末时间
     * @return
     */
    public static LocalDateTime thisMonthInEOM(){
        LocalDateTime currentDatetime = LocalDateTime.now();
        return dateTimeToEnd(currentDatetime.with(lastDayOfMonth()));
    }

    /**
     * 获取本月月初时间
     * @return
     */
    public static LocalDateTime thisMonthInBOM(){
        LocalDateTime currentDatetime = LocalDateTime.now();
        return dateTimeToZero(currentDatetime.with(firstDayOfMonth()));
    }

    /**
     * 获取本月月末时间
     * @return
     */
    public static LocalDateTime previousMonthInBOM(){
        LocalDateTime currentDatetime = LocalDateTime.now();
        LocalDateTime previousNowDatetime = currentDatetime.minusMonths(1);
        return dateTimeToZero(previousNowDatetime.with(firstDayOfMonth()));
    }

    public static void main(String[] args) {
        System.out.println("本周日：" + thisWeekInSunday());
        System.out.println("本周一时间" + thisWeekInMonday());
        System.out.println("上周一时间" + previousWeekInMonday());
        System.out.println("本月最后天时间" + thisMonthInEOM());
        System.out.println("本月第一天时间" + thisMonthInBOM());
        System.out.println("上月第一天时间" + previousMonthInBOM());
    }
}
