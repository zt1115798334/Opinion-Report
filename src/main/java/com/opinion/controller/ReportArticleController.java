package com.opinion.controller;

import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.utils.DateUtils;
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
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveReportArticle(@RequestBody ReportArticle reportArticle) {
        LocalDateTime currentDate = DateUtils.currentDate();
        String userAccount = SysConst.USER_ACCOUNT;
        reportArticle.setReportSource(SysConst.ReportSource.ARTIFICIAL.getCode());
        reportArticle.setPublishDatetime(currentDate);
        reportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
        reportArticle.setCreatedDate(currentDate);
        reportArticle.setCreatedUser(userAccount);
        reportArticle.setModifiedDate(currentDate);
        reportArticle.setModifiedUser(userAccount);
        reportArticleService.save(reportArticle);
        return success("添加成功");
    }

    /**
     * 根据id查看上报文章
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
        String userAccount = SysConst.USER_ACCOUNT;
        if (StringUtils.isNotEmpty(reportArticle.getSortParam())) {
            reportArticle.setSortParam("publishDatetime");
            reportArticle.setSortType("desc");
        }
        reportArticle.setCreatedUser(userAccount);
        Page<ReportArticle> reportArticles = reportArticleService.findPageByCreateUser(reportArticle);
        return success(reportArticles);
    }

    /**
     * 对上报文章进行审核
     *
     * @param reportArticleId id
     * @param adoptState      审核状态
     * @return
     */
    @RequestMapping(value = "examineAndVerify", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult examineAndVerifyReportArticle(@RequestParam("reportArticleId") Long reportArticleId,
                                                    @RequestParam("adoptState") String adoptState,
                                                    @RequestParam("adoptOpinion") String adoptOpinion) {
        String adoptUser = SysConst.USER_ACCOUNT;
        LocalDateTime adoptDate = DateUtils.currentDate();
        ReportArticle reportArticle = reportArticleService.examineAndVerify(reportArticleId, adoptDate, adoptUser, adoptState, adoptOpinion);
        return success(reportArticle);
    }

    /**
     * 对上报文章日志
     *
     * @param reportArticleId id
     * @return
     */
    @RequestMapping(value = "searchReportArticleLog", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleLog(@RequestParam("reportArticleId") Long reportArticleId) {
        List<ReportArticleLog> list = reportArticleLogService.findListByReportArticleId(reportArticleId);
        return success(list);
    }


//    /**
//     * 查询子级上报文章信息
//     *
//     * @return
//     */
//    @RequestMapping(value = "searchReportArticleByChild", method = RequestMethod.POST)
//    @ResponseBody
//    public AjaxResult searchReportArticleByChild(@RequestBody ReportArticle reportArticle) {
//        String userAccount = SysConst.USER_ACCOUNT;
//
//    }
}
