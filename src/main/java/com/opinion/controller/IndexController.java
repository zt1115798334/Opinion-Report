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

import java.util.Comparator;
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
                    jo.put("title", sysMessage.getTitle());
                    jo.put("subtitle", sysMessage.getSubtitle());
                    jo.put("timeMsg", RelativeDateUtils.format(sysMessage.getPublishDatetime()));
                    jo.put("url", sysMessage.getUrl());
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
        return success("操作成功");
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
        return success("操作成功");
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
        reportArticle.setSortType(SysConst.Sort.DESC.getCode());
        reportArticle.setSortParam("publishDatetime");

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

    public JSONArray listReportArticleToJSONArray(List<ReportArticle> list, String type) {
        JSONArray result = new JSONArray();
        list.stream().forEach(reportArticle -> {
            String reportCode = reportArticle.getReportCode();
            JSONObject jo = new JSONObject();
            if (type == null) {
                jo.put("type", type);
            } else {
                jo.put("type", reportArticle.getType());
            }
            jo.put("id", reportArticle.getId());
            jo.put("reportCode", reportCode);
            jo.put("title", reportArticle.getTitle());
            jo.put("url", SysConst.OPINION_REPORT_INFO_URL + reportCode);
            jo.put("expireDate", DateUtils.formatDate(reportArticle.getExpireDate()));
            result.add(jo);
        });
        return result;
    }

}
