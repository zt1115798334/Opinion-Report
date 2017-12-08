package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Objects;
import com.google.common.collect.Lists;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.service.CityOrganizationService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
@Controller
@RequestMapping("dataStatistics")
public class DataStatisticsController extends BaseController {

    @Autowired
    private ReportArticleService reportArticleService;

    @Autowired
    private CityOrganizationService cityOrganizationService;

    @Autowired
    private SysUserService sysUserService;

    /**
     * 获取本周信息
     */
    List<ReportArticle> reportArticlesThisWeek;

    /**
     * 获取上周周信息
     */
    List<ReportArticle> reportArticlesLastWeek;

    /**
     * 获取本周时间范围
     */
    List<LocalDate> thisWeekDateRange;

    /**
     * 跳转信息统计页面
     *
     * @return
     */
    @RequestMapping(value = "dataStatisticsPage", method = RequestMethod.GET)
    public String dataStatisticsPage() {

        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        //获取本周信息
        reportArticlesThisWeek = getReportArticles(beforeSevenDays, currentDatetime);

        LocalDateTime beforeFourteenDays = DateUtils.currentDateBeforeFourteenDays();
        //获取上周周信息
        reportArticlesLastWeek = getReportArticles(beforeFourteenDays, beforeSevenDays);
        //获取本周时间范围
        thisWeekDateRange = DateUtils.dateRange(beforeSevenDays.toLocalDate(), currentDatetime.toLocalDate());
        return "/dataStatistics/dataStatistics";
    }

    /**
     * 舆情上报分析 -- 折线图信息
     *
     * @return
     */
    @RequestMapping(value = "dataAnalysisChart", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataAnalysisChart() {
        Map<String, Long> map = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()), Collectors.counting()));

        JSONObject result = new JSONObject();
        JSONArray dateJSONArray = new JSONArray();
        JSONArray valueJSONArray = new JSONArray();
        thisWeekDateRange.stream()
                .map(DateUtils::formatDate)
                .forEach(date -> {
                    Long value = 0L;
                    if (map.containsKey(date)) {
                        value = map.get(date);
                    }
                    dateJSONArray.add(date);
                    valueJSONArray.add(value);

                });
        result.put("date", dateJSONArray);
        result.put("value", valueJSONArray);
        return success(result);
    }

    /**
     * 舆情上报分析 -- 比例信息
     *
     * @return
     */
    @RequestMapping(value = "dataAnalysisProportion", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataAnalysisProportion() {

        long thisWeekCount = reportArticlesThisWeek.stream().count();
        long lastWeekCount = reportArticlesLastWeek.stream().count();
        JSONObject allInfo = calculationTrend(thisWeekCount, lastWeekCount);

        long thisWeekAdoptCount = reportArticlesThisWeek.stream()
                .filter(reportArticle -> Objects.equal(reportArticle.getAdoptState(), SysConst.AdoptState.ADOPT.getCode())).count();
        long lastWeekAdoptCount = reportArticlesLastWeek.stream()
                .filter(reportArticle -> Objects.equal(reportArticle.getAdoptState(), SysConst.AdoptState.ADOPT.getCode())).count();
        JSONObject adoptInfo = calculationTrend(thisWeekAdoptCount, lastWeekAdoptCount);

        long thisWeekNotAdoptCount = reportArticlesThisWeek.stream()
                .filter(reportArticle -> Objects.equal(reportArticle.getAdoptState(), SysConst.AdoptState.NOTADOPTED.getCode())).count();
        long lastWeekNotAdoptCount = reportArticlesLastWeek.stream()
                .filter(reportArticle -> Objects.equal(reportArticle.getAdoptState(), SysConst.AdoptState.NOTADOPTED.getCode())).count();
        JSONObject notAdoptInfo = calculationTrend(thisWeekNotAdoptCount, lastWeekNotAdoptCount);

        JSONObject result = new JSONObject();
        result.put("allInfo", allInfo);
        result.put("adoptInfo", adoptInfo);
        result.put("notAdoptInfo", notAdoptInfo);
        return success(result);
    }

    /**
     * 舆情上报分析 -- 表信息
     *
     * @return
     */
    @RequestMapping(value = "dataAnalysisTable", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataAnalysisTable() {
        Map<String, Long> reportCountMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()), Collectors.counting()));
        Map<String, Long> adoptCountMap = reportArticlesThisWeek.stream()
                .filter(reportArticle -> Objects.equal(reportArticle.getAdoptState(), SysConst.AdoptState.ADOPT.getCode()))
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()), Collectors.counting()));

        JSONObject result = new JSONObject();
        JSONArray dateJsonArray = new JSONArray();
        JSONArray reportJsonArray = new JSONArray();
        JSONArray adoptJsonArray = new JSONArray();
        thisWeekDateRange.stream()
                .map(DateUtils::formatDate)
                .forEach(date -> {
                    Long reportCount = 0L;
                    Long adoptCount = 0L;
                    if (reportCountMap.containsKey(date)) {
                        reportCount = reportCountMap.get(date);
                    }
                    if (adoptCountMap.containsKey(date)) {
                        adoptCount = adoptCountMap.get(date);
                    }
                    dateJsonArray.add(date);

                    reportJsonArray.add(reportCount);
                    adoptJsonArray.add(adoptCount);
                });
        result.put("date", dateJsonArray);

        result.put("reportCount", reportJsonArray);
        result.put("adoptCount", adoptJsonArray);
        return success(result);
    }

    /**
     * 本周上报舆情等级分布
     *
     * @return
     */
    @RequestMapping(value = "dataLevelDistribution", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataLevelDistribution() {
        Map<String, Long> reportLevelMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(ReportArticle::getReportLevel, Collectors.counting()));
        JSONObject result = new JSONObject();
        JSONArray infoJSONArray = new JSONArray();
        JSONArray nameJSONArray = new JSONArray();
        for (Map.Entry<String, Long> entry : reportLevelMap.entrySet()) {
            SysConst.ReportLevel rlEnum = SysConst.getReportLevelByCode(entry.getKey());
            if (rlEnum != null) {
                String levelName = rlEnum.getName();
                JSONObject jo = new JSONObject();
                jo.put("name", levelName);
                jo.put("value", entry.getValue());
                infoJSONArray.add(jo);
                nameJSONArray.add(levelName);
            }
        }
        result.put("info", infoJSONArray);
        result.put("name", nameJSONArray);
        return success(result);
    }

    /**
     * 本周上报舆情来源分布
     *
     * @return
     */
    @RequestMapping(value = "dataSourceDistribution", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataSourceDistribution() {
        Map<String, Long> sourceTypeMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(ReportArticle::getSourceType, Collectors.counting()));
        JSONObject result = new JSONObject();
        JSONArray infoJSONArray = new JSONArray();
        JSONArray nameJSONArray = new JSONArray();
        for (Map.Entry<String, Long> entry : sourceTypeMap.entrySet()) {
            SysConst.SourceType rlEnum = SysConst.getSourceTypeByCode(entry.getKey());
            if (rlEnum != null) {
                String levelName = rlEnum.getName();
                JSONObject jo = new JSONObject();
                jo.put("name", levelName);
                jo.put("value", entry.getValue());
                infoJSONArray.add(jo);
                nameJSONArray.add(levelName);
            }
        }
        result.put("info", infoJSONArray);
        result.put("name", nameJSONArray);
        return success(result);
    }

    /**
     * 本周上报舆情等级来源  -- 表
     *
     * @return
     */
    @RequestMapping(value = "dataLevelSourceTable", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataLevelSourceTable() {
        Map<String, Map<String, Long>> reportLevelDateMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getReportLevel, Collectors.counting())));

        Map<String, Map<String, Long>> sourceTypeDateMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getSourceType, Collectors.counting())));

        JSONObject result = new JSONObject();

        JSONArray dateJSONArray = new JSONArray();

        JSONArray redReportLevelJSONArray = new JSONArray();
        JSONArray orangeReportLevelJSONArray = new JSONArray();
        JSONArray yellowReportLevelJSONArray = new JSONArray();

        JSONArray networkSourceTypeJSONArray = new JSONArray();
        JSONArray mediaSourceTypeJSONArray = new JSONArray();
        JSONArray sceneSourceTypeJSONArray = new JSONArray();
        JSONArray otherSourceTypeJSONArray = new JSONArray();

        thisWeekDateRange.stream()
                .map(DateUtils::formatDate)
                .forEach(date -> {
                    Long redReportLevelCount = 0L;
                    Long orangeReportLevelCount = 0L;
                    Long yellowReportLevelCount = 0L;

                    Long networkSourceTypeCount = 0L;
                    Long mediaSourceTypeCount = 0L;
                    Long sceneSourceTypeCount = 0L;
                    Long otherSourceTypeCount = 0L;
                    if (reportLevelDateMap.containsKey(date)) {
                        Map<String, Long> reportLevelMap = reportLevelDateMap.get(date);
                        redReportLevelCount = reportLevelMap.get(SysConst.ReportLevel.RED.getCode());
                        orangeReportLevelCount = reportLevelMap.get(SysConst.ReportLevel.ORANGE.getCode());
                        yellowReportLevelCount = reportLevelMap.get(SysConst.ReportLevel.YELLOW.getCode());
                    }
                    if (sourceTypeDateMap.containsKey(date)) {
                        Map<String, Long> sourceTypeMap = sourceTypeDateMap.get(date);
                        networkSourceTypeCount = sourceTypeMap.get(SysConst.SourceType.NETWORK.getCode());
                        mediaSourceTypeCount = sourceTypeMap.get(SysConst.SourceType.MEDIA.getCode());
                        sceneSourceTypeCount = sourceTypeMap.get(SysConst.SourceType.SCENE.getCode());
                        otherSourceTypeCount = sourceTypeMap.get(SysConst.SourceType.OTHER.getCode());
                    }
                    dateJSONArray.add(date);

                    redReportLevelJSONArray.add(redReportLevelCount);
                    orangeReportLevelJSONArray.add(orangeReportLevelCount);
                    yellowReportLevelJSONArray.add(yellowReportLevelCount);

                    networkSourceTypeJSONArray.add(networkSourceTypeCount);
                    mediaSourceTypeJSONArray.add(mediaSourceTypeCount);
                    sceneSourceTypeJSONArray.add(sceneSourceTypeCount);
                    otherSourceTypeJSONArray.add(otherSourceTypeCount);

                });
        result.put("date", dateJSONArray);

        result.put("redReportLevelCount", redReportLevelJSONArray);
        result.put("orangeReportLevelCount", orangeReportLevelJSONArray);
        result.put("yellowReportLevelCount", yellowReportLevelJSONArray);

        result.put("networkSourceTypeCount", networkSourceTypeJSONArray);
        result.put("mediaSourceTypeCount", mediaSourceTypeJSONArray);
        result.put("sceneSourceTypeCount", sceneSourceTypeJSONArray);
        result.put("otherSourceTypeCount", otherSourceTypeJSONArray);
        return success(result);
    }

    /**
     * 本周上报舆情影响力分析 -- 图
     *
     * @return
     */
    @RequestMapping(value = "dataEffectDistribution", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataEffectDistribution() {
        Map<String, Map<String, Long>> replyTypeDateMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getReplyType, Collectors.counting())));

        JSONObject result = new JSONObject();

        JSONArray dateJSONArray = new JSONArray();

        JSONArray clickJSONArray = new JSONArray();
        JSONArray commentJSONArray = new JSONArray();
        JSONArray estimateJSONArray = new JSONArray();
        thisWeekDateRange.stream()
                .map(DateUtils::formatDate)
                .forEach(date -> {
                    Long clickCount = 0L;
                    Long commentCount = 0L;
                    Long estimateCount = 0L;

                    if (replyTypeDateMap.containsKey(date)) {
                        Map<String, Long> replyTypeMap = replyTypeDateMap.get(date);
                        clickCount = replyTypeMap.get(SysConst.ReplyType.CLICK.getCode());
                        commentCount = replyTypeMap.get(SysConst.ReplyType.COMMENT.getCode());
                        estimateCount = replyTypeMap.get(SysConst.ReplyType.ESTIMATE.getCode());
                    }
                    dateJSONArray.add(date);

                    clickJSONArray.add(clickCount);
                    commentJSONArray.add(commentCount);
                    estimateJSONArray.add(estimateCount);
                });

        result.put("date", dateJSONArray);

        result.put("clickCount", clickJSONArray);
        result.put("commentCount", commentJSONArray);
        result.put("estimateCount", estimateJSONArray);
        return success(result);
    }

    /**
     * 本周上报舆情影响力分析 -- 表
     *
     * @return
     */
    @RequestMapping(value = "dataEffectTable", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataEffectTable() {
        Map<String, Map<String, Long>> replyTypeDateMap = reportArticlesThisWeek.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getReplyType, Collectors.counting())));

        JSONObject result = new JSONObject();

        JSONArray dateJSONArray = new JSONArray();

        JSONArray clickJSONArray = new JSONArray();
        JSONArray commentJSONArray = new JSONArray();
        JSONArray estimateJSONArray = new JSONArray();
        thisWeekDateRange.stream()
                .map(DateUtils::formatDate)
                .forEach(date -> {
                    Long clickCount = 0L;
                    Long commentCount = 0L;
                    Long estimateCount = 0L;

                    if (replyTypeDateMap.containsKey(date)) {
                        Map<String, Long> replyTypeMap = replyTypeDateMap.get(date);
                        clickCount = replyTypeMap.get(SysConst.ReplyType.CLICK.getCode());
                        commentCount = replyTypeMap.get(SysConst.ReplyType.COMMENT.getCode());
                        estimateCount = replyTypeMap.get(SysConst.ReplyType.ESTIMATE.getCode());
                    }
                    dateJSONArray.add(date);

                    clickJSONArray.add(clickCount);
                    commentJSONArray.add(commentCount);
                    estimateJSONArray.add(estimateCount);
                });
        result.put("date", dateJSONArray);

        result.put("clickCount", clickJSONArray);
        result.put("commentCount", commentJSONArray);
        result.put("estimateCount", estimateJSONArray);
        return success(result);
    }

    private List<ReportArticle> getReportArticles(LocalDateTime startDateTime, LocalDateTime endDateTime) {
        Long userId = new SysUserConst().getUserId();
        List<ReportArticle> reportArticles = Lists.newArrayList();
        CityOrganization cityOrganization = cityOrganizationService.findByUserId(userId);
        if (cityOrganization != null) {
            if (Objects.equal(cityOrganization.getLevel(), SysConst.CityLevel.COUNTY.getCode())) {
                //个人
                reportArticles = reportArticleService.findListByCreatedUserId(userId, startDateTime, endDateTime);
            } else {
                //查看子级
                List<Long> childIds = sysUserService.findChildIdListByParentId(userId);
                reportArticles = reportArticleService.findListInCreatedUserIds(childIds, startDateTime, endDateTime);
            }
        }
        return reportArticles;
    }

    private JSONObject calculationTrend(long num1, long num2) {
        JSONObject result = new JSONObject();
        double num = NumberUtils.changeProportion(num1, num2);
        String type = num1 > num2 ? SysConst.Trend.UP.getCode() : SysConst.Trend.DOWN.getCode();
        result.put("type", type);
        result.put("num", num);
        return result;
    }
}
