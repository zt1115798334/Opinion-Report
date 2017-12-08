package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Objects;
import com.google.common.collect.Lists;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.json.JsonService;
import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.SysMessage;
import com.opinion.mysql.service.CityOrganizationService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.mysql.service.SysMessageService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.RelativeDateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/21
 */
@Controller
@RequestMapping("index")
public class IndexController extends BaseController {

    @Autowired
    private SysMessageService sysMessageService;

    @Autowired
    private ReportArticleService reportArticleService;

    @Autowired
    private CityOrganizationService cityOrganizationService;

    @Autowired
    private JsonService jsonService;

    /**
     * 显示通知
     *
     * @return
     */
    @RequestMapping(value = "searchNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchNotice() {
        Long userId = new SysUserConst().getUserId();
        List<SysMessage> sysMessages = sysMessageService.findByRelationUserId(userId, SysConst.MessageState.UNREAD.getCode());
        JSONArray result = new JSONArray();
        sysMessages.stream()
                .filter(sysMessage -> !Objects.equal(userId, sysMessage.getPublishUserId()))
                .forEach(sysMessage -> {
                    JSONObject jo = new JSONObject();
                    jo.put("id", sysMessage.getId());
                    jo.put("title", sysMessage.getTitle());
                    jo.put("subtitle", sysMessage.getSubtitle());
                    jo.put("timeMsg", RelativeDateUtils.format(sysMessage.getPublishDatetime()));
                    jo.put("url", sysMessage.getUrl());
                    jo.put("type", sysMessage.getType());
                    jo.put("adoptState", sysMessage.getAdoptState());
                    result.add(jo);
                });
        return success(result);
    }

    /**
     * 清除通知
     *
     * @param id 系统消息id
     * @return
     */
    @RequestMapping(value = "clearNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult clearNotice(@RequestParam Long id) {
        logger.info("clearNotice 方法, 系统消息id：{}", id);
        sysMessageService.executeRead(id);
        return success("清除消息成功");
    }

    /**
     * 清除全部通知
     *
     * @return
     */
    @RequestMapping(value = "clearNoticeAll", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult clearNoticeAll() {
        sysMessageService.executeRead();
        return success("清除消息成功");
    }

    /**
     * 上报文章明细
     *
     * @return
     */
    @RequestMapping(value = "reportArticleDetailed", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult reportArticleDetailed() {
        Long userId = new SysUserConst().getUserId();

        CityOrganization cityOrganization = cityOrganizationService.findByUserId(userId);

        ReportArticle reportArticle = new ReportArticle();
        reportArticle.setCreatedUserId(userId);
        reportArticle.setPageNumber(1);
        reportArticle.setPageSize(10);
        reportArticle.setSortOrder(SysConst.Sort.DESC.getCode());
        reportArticle.setSortName("publishDatetime");

        JSONArray result = new JSONArray();
        if (cityOrganization != null) {
            if (Objects.equal(cityOrganization.getLevel(), SysConst.CityLevel.COUNTY.getCode())) {
                //县级
                Page<ReportArticle> page = reportArticleService.findPageByCreateUser(reportArticle);
                result = listReportArticleToJSONArray(page.getContent(), SysConst.ImportOrExport.IMPORT.getCode());

            } else if (Objects.equal(cityOrganization.getLevel(), SysConst.CityLevel.MUNICIPAL.getCode())) {
                //市级
                Page<ReportArticle> pageImport = reportArticleService.findPageByCreateUser(reportArticle);
                Page<ReportArticle> pageExport = reportArticleService.findPageByInChild(reportArticle);
                List<ReportArticle> importAndExportList = Lists.newArrayList();

                importAndExportList.addAll(pageImport.getContent().stream()
                        .map(ra -> {
                            ra.setType(SysConst.ImportOrExport.IMPORT.getCode());
                            return ra;
                        }).collect(Collectors.toList()));
                importAndExportList.addAll(pageExport.getContent().stream()
                        .map(ra -> {
                            ra.setType(SysConst.ImportOrExport.EXPORT.getCode());
                            return ra;
                        }).collect(Collectors.toList()));
                importAndExportList = importAndExportList.stream()
                        .sorted(Comparator.comparing(ReportArticle::getPublishDatetime))
                        .distinct().collect(Collectors.toList());
                result = listReportArticleToJSONArray(importAndExportList, null);

            } else if (Objects.equal(cityOrganization.getLevel(), SysConst.CityLevel.PROVINCE.getCode())) {
                //省级
                Page<ReportArticle> page = reportArticleService.findPageByInChild(reportArticle);
                result = listReportArticleToJSONArray(page.getContent(), SysConst.ImportOrExport.EXPORT.getCode());
            }
        }
        return success(result);
    }

    /**
     * 获取天气信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "searchHeaderInfo", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult searchHeaderInfo(HttpServletRequest request) {
//        String ip = NetworkUtil.getLocalIp(request);
//        String ipInfo = NetworkUtil.sendGet(NetworkUtil.IPINFO, "format=json&ip=123.123.123.123");
//        JSONObject ipJSON = JSONObject.parseObject(ipInfo);
//        String province = ipJSON.getString("province");
//        String city = ipJSON.getString("city");
//        IndexController indexController = new IndexController();
//        JSONObject cityCodeJSON = jsonService.getCityCodeJSON();
//        String code = indexController.getCityCode(cityCodeJSON, province, city);
//        Map<String, Object> map = Maps.newHashMap();
//        try {
//            map = WeatherUtils.getTodayWeather2(code);
//            System.out.println(map.get("city") + "\t" + map.get("temp")
//                    + "\t" + map.get("WD") + "\t" + map.get("WS")
//                    + "\t" + map.get("SD") + "\t" + map.get("time"));
//        } catch(IOException e) {
//            e.printStackTrace();
//        }
        JSONObject result = new JSONObject();
        return success(result);
    }

    public JSONArray listReportArticleToJSONArray(List<ReportArticle> list, String type) {
        JSONArray result = new JSONArray();
        list.stream().forEach(reportArticle -> {
            String reportCode = reportArticle.getReportCode();
            JSONObject jo = new JSONObject();
            if (type != null) {
                jo.put("type", type);
            } else {
                jo.put("type", reportArticle.getType());
            }
            jo.put("id", reportArticle.getId());
            jo.put("reportCode", reportCode);
            jo.put("title", reportArticle.getTitle());
            jo.put("url", SysConst.OPINION_REPORT_INFO_URL + reportCode);
            jo.put("publishDate", DateUtils.formatDate(reportArticle.getPublishDatetime()));
            jo.put("publishTime", DateUtils.formatDate(reportArticle.getPublishDatetime(),DateUtils.TIME_FORMAT_SIMPLE));
            jo.put("expireDate", DateUtils.formatDate(reportArticle.getExpireDate(),DateUtils.DATE__FORMAT_CN));
            result.add(jo);
        });
        return result;
    }


    public String getCityCode(JSONObject cityCodeJSON, String province, String city) {
        String result = null;
        JSONArray zone = cityCodeJSON.getJSONArray("zone");
        for (Iterator iterator = zone.iterator(); iterator.hasNext(); ) {
            JSONObject provinceObject = (JSONObject) iterator.next();
            String provinceName = provinceObject.getString("name");
            if (Objects.equal(provinceName, province)) {
                JSONArray cityArray = provinceObject.getJSONArray("zone");
                for (Iterator iteratorCity = cityArray.iterator(); iterator.hasNext(); ) {
                    JSONObject cityJSON = (JSONObject) iteratorCity.next();
                    String cityName = cityJSON.getString("name");
                    if (Objects.equal(cityName, city)) {
                        JSONArray areaArray = cityJSON.getJSONArray("zone");
                        for (Iterator iteratorArea = areaArray.iterator(); iterator.hasNext(); ) {
                            JSONObject areaJSON = (JSONObject) iteratorArea.next();
                            String areaName = areaJSON.getString("name");
                            if (Objects.equal(areaName, city)) {
                                result = areaJSON.getString("code");
                                return result;
                            }
                        }
                    }
                }
            }
        }
        return result;
    }

}
