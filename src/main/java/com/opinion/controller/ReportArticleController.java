package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.mysql.service.SysUserService;
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

    @Autowired
    private SysUserService sysUserService;


    /**
     * 跳转上报文章页面
     *
     * @return
     */
    @RequestMapping("opinionReportPage")
    public String opinionReportPage() {
        return "/report/opinionReport";
    }

    /**
     * 跳转上报文章(审核)页面
     *
     * @return
     */
    @RequestMapping("opinionReportExaminePage")
    public String opinionReportExaminePage() {
        return "/report/opinionReportExamine";
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
     * 报文章分页查询 (查询自己上报的)
     *
     * @return
     */
    @RequestMapping(value = "searchReportArticlePage", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticlePage(@RequestBody ReportArticle reportArticle) {
        if (StringUtils.isNotEmpty(reportArticle.getSortParam())) {
            reportArticle.setSortParam("publishDatetime");
            reportArticle.setSortType("desc");
        }
        Long userId = new SysUserConst().getUserId();
        reportArticle.setCreatedUserId(userId);
        Page<ReportArticle> page = reportArticleService.findPageByCreateUser(reportArticle);
        JSONObject result = pageReportArticleToJSONObject(page);
        return success(result);
    }

    /**
     * 查询子级上报文章信息（查找他人上报自己的）
     *
     * @return
     */
    @RequestMapping(value = "searchReportArticleInChild", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleInChild(@RequestBody ReportArticle reportArticle) {
        Long userId = new SysUserConst().getUserId();
        reportArticle.setCreatedUserId(userId);
        Page<ReportArticle> page = reportArticleService.findPageByInChild(reportArticle);
        JSONObject result = pageReportArticleToJSONObject(page);
        return success(result);
    }

    /**
     * 查询当前用户上报信息 详情
     *
     * @param reportCode
     * @return
     */
    @RequestMapping(value = "searchReportArticleById", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleById(@RequestBody String reportCode) {
        ReportArticle reportArticle = reportArticleService.findOneByreportCode(reportCode);
        return success(reportArticle);
    }

    /**
     * 对上报文章进行审核
     *
     * @return
     */
    @RequestMapping(value = "examineAndVerifyReportArticle", method = RequestMethod.POST)
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
        JSONArray result = new JSONArray();
        list.stream().forEach(reportArticleLog -> {
            JSONObject jo = new JSONObject();
            String adopStateVal = SysConst.getAdoptStateByCode(reportArticleLog.getAdoptState()).getCode();
            SysUser sysUser = sysUserService.findById(reportArticleLog.getCreatedUserId());
            StringBuilder sb = new StringBuilder();
            sb.append("用户：").append(sysUser.getUserName()).append(adopStateVal);
            jo.put("msg", sb.toString());
            jo.put("datetime", DateUtils.formatDate(reportArticleLog.getCreatedDate(), DateUtils.DATE_SECOND_FORMAT));
            result.add(jo);
        });
        return success(result);
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

    private JSONObject pageReportArticleToJSONObject(Page<ReportArticle> page){
        JSONObject result = new JSONObject();
        List<ReportArticle> list = page.getContent();
        JSONArray ja = new JSONArray();
        list.stream().forEach(reportArticle -> {
            JSONObject jo = new JSONObject();
            jo.put("id",reportArticle.getId());
            jo.put("reportCode",reportArticle.getReportCode());
            jo.put("title",reportArticle.getTitle());
            jo.put("sourceType",SysConst.getSourceTypeByCode(reportArticle.getSourceType()).getName());
            jo.put("reportLevel",SysConst.getReportLevelByCode(reportArticle.getReportLevel()).getName());
            jo.put("replyNumber",reportArticle.getReplyNumber());
            jo.put("adoptState",SysConst.getAdoptStateByCode(reportArticle.getAdoptState()).getName());
            jo.put("replyNumber",DateUtils.formatDate(reportArticle.getPublishDatetime(),DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            ja.add(jo);
        });
        result.put("totalElements",page.getTotalElements());
        result.put("totalPages",page.getTotalPages());
        result.put("list",ja);
        return result;
    }

}
