package com.opinion.controller;

import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Controller
@RequestMapping("/reportArticle")
public class ReportArticleController extends BaseController {

    @Autowired
    private ReportArticleService reportArticleService;

    @RequestMapping("opinionReport")
    public String opinionReport() {
        return "/opinionReport";
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
        String userAccount = SysConst.DEFAULT_USER_ACCOUNT;
        LocalDate publishDatetime = DateUtils.parseDate(reportArticle.getPublishDate(), DateUtils.DATE_FORMAT);

        reportArticle.setReportSource(SysConst.ReportSource.ARTIFICIAL.getCode());
        reportArticle.setPublishDatetime(publishDatetime);
        reportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
        reportArticle.setCreatedDate(currentDate);
        reportArticle.setCreatedUser(userAccount);
        reportArticle.setModifiedDate(currentDate);
        reportArticle.setModifiedUser(userAccount);
        reportArticleService.save(reportArticle);
        return success("添加成功");
    }

    /**
     * 根据登录者账户查询上报信息
     *
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticle() {
        String userAccount = SysConst.DEFAULT_USER_ACCOUNT;
        List<ReportArticle> reportArticles = reportArticleService.findListByCreatedUser(userAccount);
        return success(reportArticles);
    }

    @RequestMapping(value = "searchId", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleById(Long id) {
        ReportArticle reportArticle = reportArticleService.findOneById(id);
        return success(reportArticle);
    }

    @RequestMapping(value = "searchPage", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticlePage() {
        String userAccount = SysConst.DEFAULT_USER_ACCOUNT;
        String sortType = Sort.Direction.DESC.toString();
        String sortParam = "id";
        Page<ReportArticle> reportArticles = reportArticleService
                .findPageByCreateUser(userAccount, 2, 2, sortParam, sortType);
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
                                                    @RequestParam("adoptState") String adoptState) {
        String adoptUser = SysConst.DEFAULT_USER_ACCOUNT;
        LocalDateTime adoptDate = DateUtils.currentDate();
        ReportArticle reportArticle = reportArticleService.examineAndVerify(reportArticleId, adoptDate, adoptUser, adoptState);
        return success(reportArticle);
    }
}
