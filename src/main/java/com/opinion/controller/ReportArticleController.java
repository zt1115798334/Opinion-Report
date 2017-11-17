package com.opinion.controller;

import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.SNUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Controller
@RequestMapping("reportArticle")
public class ReportArticleController extends BaseController {

    @Autowired
    private ReportArticleService reportArticleService;

    @Autowired
    private ReportArticleLogService reportArticleLogService;


    @RequestMapping("opinionReport")
    public String opinionReport() {
        return "/report/opinionReport";
    }

    /**
     * 保存 --上报文章信息
     *
     * @param reportArticle
     * @return
     */
    @RequestMapping(value = "saveReportArticle", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveReportArticle(@RequestBody ReportArticle reportArticle) {
        reportArticleService.save(reportArticle);
        return success("添加成功");
    }

    /**
     * 查询当前用户上报信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "searchId", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleById(Long id) {
        ReportArticle reportArticle = reportArticleService.findOneById(id);
        return success(reportArticle);
    }

    /**
     * 报文章分页查询
     *
     * @return
     */
    @RequestMapping(value = "searchPage", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticlePage(@RequestBody ReportArticle reportArticle) {
        if (StringUtils.isNotEmpty(reportArticle.getSortParam())) {
            reportArticle.setSortParam("publishDatetime");
            reportArticle.setSortType("desc");
        }
        Long userId = new SysUserConst().getUserId();
        reportArticle.setCreatedUserId(userId);
        Page<ReportArticle> reportArticles = reportArticleService.findPageByCreateUser(reportArticle);
        return success(reportArticles);
    }

    /**
     * 对上报文章进行审核
     *
     * @return
     */
    @RequestMapping(value = "examineAndVerify", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult examineAndVerifyReportArticle(@RequestBody ReportArticle reportArticle) {
        Long userId = new SysUserConst().getUserId();
        LocalDateTime adoptDatetime = DateUtils.currentDatetime();
        reportArticle.setAdoptDatetime(adoptDatetime);
        reportArticle.setModifiedUserId(userId);
        reportArticle = reportArticleService.examineAndVerify(reportArticle);
        return success(reportArticle);
    }

    /**
     * 根据上报编号查询上报日志
     *
     * @param reportCode 上报编号
     * @return
     */
    @RequestMapping(value = "searchReportArticleLog", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleLog(@RequestParam("reportCode") String reportCode) {
        List<ReportArticleLog> list = reportArticleLogService.findListByReportArticleId(reportCode);
        return success(list);
    }


    /**
     * 查询子级上报文章信息
     *
     * @return
     */
    @RequestMapping(value = "searchReportArticleInChild", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleInChild(@RequestBody ReportArticle reportArticle) {
        Long userId = new SysUserConst().getUserId();
        reportArticle.setCreatedUserId(userId);
        Page<ReportArticle> page = reportArticleService.findPageByInChild(reportArticle);
        return success(page);
    }


    /**
     * 对上报文章再次上报
     *
     * @param reportCode
     * @return
     */
    @RequestMapping(value = "saveReportArticleAgain", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveReportArticleAgain(@RequestParam("reportCode") String reportCode) {
        reportArticleService.saveAgain(reportCode);
        return success("上报成功");
    }

}
