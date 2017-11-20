package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
     * 跳转信息统计页面
     *
     * @return
     */
    @RequestMapping("dataStatisticsPage")
    public String dataStatisticsPage() {
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

        LocalDateTime startDateTime = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime endDateTime = DateUtils.currentDatetime();

        Long userId = new SysUserConst().getUserId();
        List<ReportArticle> reportArticles = getReportArticles(startDateTime, endDateTime, userId);

        Map<String, Long> map = reportArticles.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()), Collectors.counting()));
        JSONArray result = new JSONArray();
        for (Map.Entry<String, Long> entry : map.entrySet()) {
            JSONObject jo = new JSONObject();
            jo.put("date", entry.getKey());
            jo.put("val", entry.getValue());
            result.add(jo);
        }
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
        Long userId = new SysUserConst().getUserId();

        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticlesThisWeek = getReportArticles(beforeSevenDays, currentDatetime, userId);
        LocalDateTime beforeFourteenDays = DateUtils.currentDateBeforeFourteenDays();

        //获取上周周信息
        List<ReportArticle> reportArticlesLastWeek = getReportArticles(beforeFourteenDays, beforeSevenDays, userId);

        long thisWeekCount = reportArticlesThisWeek.stream().count();
        long lastWeekCount = reportArticlesLastWeek.stream().count();
        JSONObject allInfo = calculationTrend(thisWeekCount, lastWeekCount);

        long thisWeekAdoptCount = reportArticlesThisWeek.stream()
                .filter(reportArticle -> reportArticle.getAdoptState().equals(SysConst.AdoptState.ADOPT.getCode())).count();
        long lastWeekAdoptCount = reportArticlesLastWeek.stream()
                .filter(reportArticle -> reportArticle.getAdoptState().equals(SysConst.AdoptState.ADOPT.getCode())).count();
        JSONObject adoptInfo = calculationTrend(thisWeekAdoptCount, lastWeekAdoptCount);

        JSONObject result = new JSONObject();
        result.put("allInfo", allInfo);
        result.put("adoptInfo", adoptInfo);
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

        Long userId = new SysUserConst().getUserId();

        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticles = getReportArticles(beforeSevenDays, currentDatetime, userId);
        Map<String, Long> reportCountMap = reportArticles.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()), Collectors.counting()));
        Map<String, Long> adoptCountMap = reportArticles.stream()
                .filter(reportArticle -> reportArticle.getAdoptState().equals(SysConst.AdoptState.ADOPT.getCode()))
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()), Collectors.counting()));
        List<String> dateList = reportArticles.stream()
                .map(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate())).collect(Collectors.toList());
        JSONArray result = new JSONArray();
        dateList.stream().forEach(date -> {
            JSONObject jo = new JSONObject();
            Long reportCount = 0L;
            Long adoptCount = 0L;
            if (reportCountMap.containsKey(date)) {
                reportCount = reportCountMap.get(date);
            }
            if (adoptCountMap.containsKey(date)) {
                adoptCount = adoptCountMap.get(date);
            }
            jo.put("date", date);
            jo.put("reportCount", reportCount);
            jo.put("adoptCount", adoptCount);
            result.add(jo);
        });


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

        Long userId = new SysUserConst().getUserId();

        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticles = getReportArticles(beforeSevenDays, currentDatetime, userId);
        Map<String, Long> reportLevelMap = reportArticles.stream()
                .collect(Collectors.groupingBy(ReportArticle::getReportLevel, Collectors.counting()));
        JSONArray result = new JSONArray();
        for (Map.Entry<String, Long> entry : reportLevelMap.entrySet()) {
            SysConst.ReportLevel rlEnum = SysConst.getReportLevelByCode(entry.getKey());
            if (rlEnum != null) {
                String levelName = rlEnum.getName();
                JSONObject jo = new JSONObject();
                jo.put("name", levelName);
                jo.put("val", entry.getValue());
                result.add(jo);
            }
        }
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

        Long userId = new SysUserConst().getUserId();
        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticles = getReportArticles(beforeSevenDays, currentDatetime, userId);
        Map<String, Long> sourceTypeMap = reportArticles.stream()
                .collect(Collectors.groupingBy(ReportArticle::getSourceType, Collectors.counting()));
        JSONArray result = new JSONArray();
        for (Map.Entry<String, Long> entry : sourceTypeMap.entrySet()) {
            SysConst.SourceType rlEnum = SysConst.getSourceTypeByCode(entry.getKey());
            if (rlEnum != null) {
                String levelName = rlEnum.getName();
                JSONObject jo = new JSONObject();
                jo.put("name", levelName);
                jo.put("val", entry.getValue());
                result.add(jo);
            }
        }
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

        Long userId = new SysUserConst().getUserId();
        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticles = getReportArticles(beforeSevenDays, currentDatetime, userId);

        Map<String, Map<String, Long>> reportLevelDateMap = reportArticles.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getReportLevel, Collectors.counting())));

        Map<String, Map<String, Long>> sourceTypeDateMap = reportArticles.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getSourceType, Collectors.counting())));
        List<String> dateList = reportArticles.stream()
                .map(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate())).collect(Collectors.toList());
        JSONArray result = new JSONArray();
        dateList.stream().forEach(date -> {
            JSONObject jo = new JSONObject();
            if (reportLevelDateMap.containsKey(date)) {
                Map<String, Long> reportLevelMap = reportLevelDateMap.get(date);

            }
            if (sourceTypeDateMap.containsKey(date)) {
                Map<String, Long> sourceTypeMap = sourceTypeDateMap.get(date);

            }
            jo.put("date", date);
            result.add(jo);
        });

        return success("");
    }

    /**
     * 本周上报舆情影响力分析 -- 图
     *
     * @return
     */
    @RequestMapping(value = "dataEffectDistribution", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataEffectDistribution() {
        Long userId = new SysUserConst().getUserId();
        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticles = getReportArticles(beforeSevenDays, currentDatetime, userId);

        Map<String, Map<String, Long>> replyTypeDateMap = reportArticles.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getReplyType, Collectors.counting())));

        return success("");
    }

    /**
     * 本周上报舆情影响力分析 -- 表
     *
     * @return
     */
    @RequestMapping(value = "dataEffectTable", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataEffectTable() {
        Long userId = new SysUserConst().getUserId();
        //获取本周信息
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<ReportArticle> reportArticles = getReportArticles(beforeSevenDays, currentDatetime, userId);

        Map<String, Map<String, Long>> replyTypeDateMap = reportArticles.stream()
                .collect(Collectors.groupingBy(reportArticle -> DateUtils.formatDate(reportArticle.getCreatedDate()),
                        Collectors.groupingBy(ReportArticle::getReplyType, Collectors.counting())));

        return success("");
    }

    private List<ReportArticle> getReportArticles(LocalDateTime startDateTime, LocalDateTime endDateTime, Long uesrId) {
        List<ReportArticle> reportArticles = Lists.newArrayList();
        CityOrganization cityOrganization = cityOrganizationService.findByUserId(uesrId);
        if (cityOrganization != null) {
            if (cityOrganization.getLevel().equals(SysConst.CityLevel.COUNTY.getCode())) {
                //个人
                reportArticles = reportArticleService.findListByCreatedUserId(uesrId, startDateTime, endDateTime);
            } else {
                //查看子级
                List<Long> childIds = sysUserService.findChildIdListByParentId(uesrId);
                reportArticles = reportArticleService.findListInCreatedUserIds(childIds, startDateTime, endDateTime);
            }
        }
        return reportArticles;
    }

    private JSONObject calculationTrend(long num1, long num2) {
        JSONObject result = new JSONObject();
        if (num1 > num2) {
            double num = NumberUtils.changeProportion(num1, num2);
            result.put("type", "up");
            result.put("num", num);
        } else {
            double num = NumberUtils.changeProportion(num1, num2);
            result.put("num", num);
        }
        return result;
    }
}
