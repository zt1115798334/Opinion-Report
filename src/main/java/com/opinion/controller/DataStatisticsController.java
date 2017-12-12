package com.opinion.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Objects;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
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
import com.opinion.utils.module.CommonModel;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
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
    private CommonModel commonModel;

    @Autowired
    private ReportArticleService reportArticleService;

    @Autowired
    private CityOrganizationService cityOrganizationService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;


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
        return "/dataStatistics/dataStatistics";
    }

    /**
     * 获取数据
     *
     * @return
     */
    @RequestMapping(value = "searchData", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchData() {
        getReportArticlesThisWeekData();
        getReportArticlesLastWeekData();
        getThisWeekDateRangeData();
        return success("查询成功");
    }

    private void getReportArticlesThisWeekData() {
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();
        //获取本周信息
        reportArticlesThisWeek = getReportArticles(beforeSevenDays, currentDatetime);
    }

    private void getReportArticlesLastWeekData() {
        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();


        LocalDateTime beforeFourteenDays = DateUtils.currentDateBeforeFourteenDays();
        //获取上周周信息
        reportArticlesLastWeek = getReportArticles(beforeFourteenDays, beforeSevenDays);
    }

    private void getThisWeekDateRangeData() {
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        LocalDateTime beforeSevenDays = DateUtils.currentDateBeforeSevenDays();

        //获取本周时间范围
        thisWeekDateRange = DateUtils.dateRange(beforeSevenDays.toLocalDate(), currentDatetime.toLocalDate());
    }

    private void judgeNull() {
        if (reportArticlesThisWeek == null) {
            getReportArticlesThisWeekData();
        }
        if (reportArticlesLastWeek == null) {
            getReportArticlesLastWeekData();
        }
        if (thisWeekDateRange == null) {
            getThisWeekDateRangeData();
        }
    }


    /**
     * 舆情上报分析 -- 折线图信息
     *
     * @return
     */
    @RequestMapping(value = "dataAnalysisChart", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult dataAnalysisChart() {
        judgeNull();
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
        judgeNull();

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
        judgeNull();
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
                        reportCount = reportCountMap.getOrDefault(date,0L);
                    }
                    if (adoptCountMap.containsKey(date)) {
                        adoptCount = adoptCountMap.getOrDefault(date,0L);
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
        judgeNull();
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
        judgeNull();
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
        judgeNull();
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
                        redReportLevelCount = reportLevelMap.getOrDefault(SysConst.ReportLevel.RED.getCode(), 0L);
                        orangeReportLevelCount = reportLevelMap.getOrDefault(SysConst.ReportLevel.ORANGE.getCode(), 0L);
                        yellowReportLevelCount = reportLevelMap.getOrDefault(SysConst.ReportLevel.YELLOW.getCode(), 0L);
                    }
                    if (sourceTypeDateMap.containsKey(date)) {
                        Map<String, Long> sourceTypeMap = sourceTypeDateMap.get(date);
                        networkSourceTypeCount = sourceTypeMap.getOrDefault(SysConst.SourceType.NETWORK.getCode(), 0L);
                        mediaSourceTypeCount = sourceTypeMap.getOrDefault(SysConst.SourceType.MEDIA.getCode(), 0L);
                        sceneSourceTypeCount = sourceTypeMap.getOrDefault(SysConst.SourceType.SCENE.getCode(), 0L);
                        otherSourceTypeCount = sourceTypeMap.getOrDefault(SysConst.SourceType.OTHER.getCode(), 0L);
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
        judgeNull();
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
                        clickCount = replyTypeMap.getOrDefault(SysConst.ReplyType.CLICK.getCode(), 0L);
                        commentCount = replyTypeMap.getOrDefault(SysConst.ReplyType.COMMENT.getCode(), 0L);
                        estimateCount = replyTypeMap.getOrDefault(SysConst.ReplyType.ESTIMATE.getCode(), 0L);
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
        judgeNull();
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
                        clickCount = replyTypeMap.getOrDefault(SysConst.ReplyType.CLICK.getCode(),0L);
                        commentCount = replyTypeMap.getOrDefault(SysConst.ReplyType.COMMENT.getCode(),0L);
                        estimateCount = replyTypeMap.getOrDefault(SysConst.ReplyType.ESTIMATE.getCode(),0L);
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
     * 下载报告
     *
     * @return
     */
    @RequestMapping(value = "downloadPresentation", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public void downloadPresentation(HttpServletRequest request, HttpServletResponse response)
            throws IOException, TemplateException {
        judgeNull();
        String downFileName = "测试文件下载.doc";
        String header = request.getHeader("User-Agent").toUpperCase();
        try {
            if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
                //IE下载文件名空格变+号问题
                downFileName = URLEncoder.encode(downFileName, "utf-8");
                downFileName = downFileName.replace("+", "%20");
            } else {
                downFileName = new String(downFileName.getBytes("utf-8"), "iso-8859-1");
            }
        } catch(UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/ms-word;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; fileName=" + downFileName);


        freeMarkerConfigurer.getConfiguration().setClassForTemplateLoading(getClass(),
                File.separator + commonModel.getReportTemplatePath() + File.separator);
        Template template = freeMarkerConfigurer.getConfiguration().getTemplate(commonModel.getReportTemplateFile());

        List<String> dataList = thisWeekDateRange.stream()
                .map(date -> DateUtils.formatDate(date, DateUtils.DATE_FORMAT))
                .collect(Collectors.toList());

        Map<String, Object> dataMap = Maps.newHashMap();
        dataMap.put("organizationName", "seawater");
        dataMap.put("publishDate", "seawater");
        dataMap.put("analysisTimeStart", "seawater");
        dataMap.put("analysisTimeEnd", "seawater");
        dataMap.put("analysisRange", "seawater");
        dataMap.put("analysisOutline", "seawater");
        dataMap.put("dateList", dataList);

        JSONObject dataAnalysisTableJSON = JSON.parseObject(JSONObject.toJSONString(dataAnalysisTable().getData()));
        JSONArray reportJsonArray = dataAnalysisTableJSON.getJSONArray("reportCount");
        JSONArray adoptJsonArray = dataAnalysisTableJSON.getJSONArray("adoptCount");
        dataMap.put("reportCount", reportJsonArray);
        dataMap.put("adoptCount", adoptJsonArray);

        JSONObject dataLevelSourceTableJSON = JSON.parseObject(JSONObject.toJSONString(dataLevelSourceTable().getData()));
        JSONArray redReportLevelJSONArray = dataLevelSourceTableJSON.getJSONArray("redReportLevelCount");
        JSONArray orangeReportLevelJSONArray = dataLevelSourceTableJSON.getJSONArray("orangeReportLevelCount");
        JSONArray yellowReportLevelJSONArray = dataLevelSourceTableJSON.getJSONArray("yellowReportLevelCount");

        JSONArray networkSourceTypeJSONArray = dataLevelSourceTableJSON.getJSONArray("networkSourceTypeCount");
        JSONArray mediaSourceTypeJSONArray = dataLevelSourceTableJSON.getJSONArray("mediaSourceTypeCount");
        JSONArray sceneSourceTypeJSONArray = dataLevelSourceTableJSON.getJSONArray("sceneSourceTypeCount");
        JSONArray otherSourceTypeJSONArray = dataLevelSourceTableJSON.getJSONArray("otherSourceTypeCount");
        dataMap.put("redReportLevelCount", redReportLevelJSONArray);
        dataMap.put("orangeReportLevelCount", orangeReportLevelJSONArray);
        dataMap.put("yellowReportLevelCount", yellowReportLevelJSONArray);

        dataMap.put("networkSourceTypeCount", networkSourceTypeJSONArray);
        dataMap.put("mediaSourceTypeCount", mediaSourceTypeJSONArray);
        dataMap.put("sceneSourceTypeCount", sceneSourceTypeJSONArray);
        dataMap.put("otherSourceTypeCount", otherSourceTypeJSONArray);

        JSONObject dataEffectTableJSON = JSON.parseObject(JSONObject.toJSONString(dataEffectTable().getData()));
        JSONArray clickJSONArray = dataEffectTableJSON.getJSONArray("clickCount");
        JSONArray commentJSONArray = dataEffectTableJSON.getJSONArray("commentCount");
        JSONArray estimateJSONArray = dataEffectTableJSON.getJSONArray("estimateCount");
        dataMap.put("clickCount", clickJSONArray);
        dataMap.put("commentCount", commentJSONArray);
        dataMap.put("estimateCount", estimateJSONArray);


        template.process(dataMap, new OutputStreamWriter(response.getOutputStream()));
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
        result.put("weekCount", num1);
        return result;
    }

    private String readFileContent(String path) {
        List<String> lines = null;
        try {
            File file = ResourceUtils.getFile("classpath:" + path);
            lines = Files.readAllLines(Paths.get(file.getPath()), StandardCharsets.UTF_8);
        } catch(IOException e) {
            e.printStackTrace();
        }
        StringBuilder result = new StringBuilder();
        for (String line : lines) {
            result.append(line);
        }
        return result.toString();
    }

}
