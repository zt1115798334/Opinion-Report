package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.ReportArticleFile;
import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.ReportArticleFileService;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.FileUtils;
import com.opinion.utils.TStringUtils;
import com.opinion.utils.module.UploadFile;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

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
    private ReportArticleFileService reportArticleFileService;

    @Autowired
    private SysUserService sysUserService;

    /**
     * 跳转上报文章页面
     *
     * @return
     */
    @RequestMapping(value = "opinionReportListPage", method = RequestMethod.GET)
    public String opinionReportListPage() {
        return "/report/opinionReportList";
    }

    /**
     * 跳转上报文章(审核)页面
     *
     * @return
     */
    @RequestMapping(value = "opinionReportExamineListPage", method = RequestMethod.GET)
    public String opinionReportExamineListPage() {
        return "/report/opinionReportExamineList";
    }

    /**
     * 跳转上报文章(审核)页面
     *
     * @param model
     * @param reportCode 上报编号
     * @param type       类型  info 查看详情   examine 审核
     * @return
     */
    @RequestMapping(value = "opinionReportExaminePage/{type}/{reportCode}", method = RequestMethod.GET)
    public String opinionReportExaminePage(Model model,
                                           @PathVariable String type,
                                           @PathVariable String reportCode) {
        logger.info("请求 opinionReportExaminePage 方法，reportCode:{},type:{}", reportCode, type);
        model.addAttribute("type", type);
        model.addAttribute("reportCode", reportCode);
        return "/report/opinionReportExamine";
    }

    /**
     * 跳转上报文章添加页面
     *
     * @return
     */
    @RequestMapping(value = "opinionReportEditPage", method = RequestMethod.GET)
    public String opinionReportEditPage() {
        return "/report/opinionReportEdit";
    }

    /**
     * 保存 --上报文章信息
     *
     * @param reportArticle 上报文章
     * @return
     */
    @RequestMapping(value = "saveReportArticle", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveReportArticle(@RequestBody ReportArticle reportArticle) {
        logger.info("请求 saveReportArticle 方法，reportArticle:{}", reportArticle);
        reportArticle = reportArticleService.save(reportArticle);
        if (reportArticle != null) {
            return success("添加成功", reportArticle);
        } else {
            return fail("添加失败");
        }
    }

    /**
     * 保存 --上报文章信息
     *
     * @param reportCode 上报文章编号
     * @return
     */
    @RequestMapping(value = "saveReportArticleFile", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveReportArticleFile(HttpServletRequest request, @RequestParam String reportCode) {
        logger.info("请求 saveReportArticleFile 方法，reportCode:{}", reportCode);
        Long userId = new SysUserConst().getUserId();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        String filePath = System.getProperty("user.dir") + File.separator + "reportFile" + File.separator + reportCode + File.separator;
        FileUtils fileUtils = new FileUtils();
        List<UploadFile> files = fileUtils.getFiles(request, filePath);
        List<ReportArticleFile> reportArticleFiles = files.stream()
                .map(file -> {
                    ReportArticleFile reportArticleFile = new ReportArticleFile();
                    reportArticleFile.setReportCode(reportCode);
                    reportArticleFile.setFilePath(file.file.getPath());
                    reportArticleFile.setFileSize(file.getFileSize());
                    reportArticleFile.setFileMD5(file.getFileMD5());
                    reportArticleFile.setFullFileName(file.getFullFileName());
                    reportArticleFile.setOriginalFileName(file.getOriginalFileName());
                    reportArticleFile.setFileName(file.getFileName());
                    reportArticleFile.setSuffixName(file.getSuffixName());
                    reportArticleFile.setCreatedDatetime(currentDatetime);
                    reportArticleFile.setCreatedUserId(userId);
                    return reportArticleFile;
                }).collect(Collectors.toList());
        reportArticleFileService.save(reportArticleFiles);
        return success("添加成功");

    }

    /**
     * 报文章分页查询 (查询自己上报的)
     *
     * @return
     */
    @RequestMapping(value = "searchReportArticle", method = RequestMethod.POST)
    @ResponseBody
    public Object searchReportArticle(@RequestBody ReportArticle reportArticle) {
        logger.info("请求 searchReportArticle 方法，reportArticle:{}", reportArticle);
        if (StringUtils.isEmpty(reportArticle.getSortName())) {
            reportArticle.setSortName("publishDatetime");
            reportArticle.setSortOrder("desc");
        }
        if (StringUtils.isNotEmpty(reportArticle.getStartDateTimeStr())
                && StringUtils.isNotEmpty(reportArticle.getEndDateTimeStr())) {
            reportArticle.setStartDateTime(DateUtils.dateToZero(DateUtils.parseDate(reportArticle.getStartDateTimeStr())));
            reportArticle.setEndDateTime(DateUtils.dateToZero(DateUtils.parseDate(reportArticle.getEndDateTimeStr())));
        }
        Long userId = new SysUserConst().getUserId();
        reportArticle.setCreatedUserId(userId);
        Page<ReportArticle> page = reportArticleService.findPageByCreateUser(reportArticle);
        JSONObject result = pageReportArticleToJSONObject(page);
        return result;
    }

    /**
     * 查询子级上报文章信息（查找他人上报自己的）
     *
     * @return
     */
    @RequestMapping(value = "searchReportArticleInChild", method = RequestMethod.POST)
    @ResponseBody
    public Object searchReportArticleInChild(@RequestBody ReportArticle reportArticle) {
        logger.info("请求 searchReportArticleInChild 方法，reportArticle:{}", reportArticle);
        if (StringUtils.isEmpty(reportArticle.getSortName())) {
            reportArticle.setSortName("publishDatetime");
            reportArticle.setSortOrder("desc");
        }
        if (StringUtils.isNotEmpty(reportArticle.getStartDateTimeStr())
                && StringUtils.isNotEmpty(reportArticle.getEndDateTimeStr())) {
            reportArticle.setStartDateTime(DateUtils.dateToZero(DateUtils.parseDate(reportArticle.getStartDateTimeStr())));
            reportArticle.setEndDateTime(DateUtils.dateToZero(DateUtils.parseDate(reportArticle.getEndDateTimeStr())));
        }
        Long userId = new SysUserConst().getUserId();
        reportArticle.setCreatedUserId(userId);
        Page<ReportArticle> page = reportArticleService.findPageByInChild(reportArticle);
        JSONObject result = pageReportArticleToJSONObject(page);
        return result;
    }

    /**
     * 删除上报文章信息
     *
     * @param id id集合
     * @return
     */
    @RequestMapping(value = "deleteReportArticle", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult deleteReportArticle(@RequestParam List<Long> id) {
        logger.info("请求 deleteReportArticle 方法，id集合：{}", id);
        boolean flag = reportArticleService.delByIds(id);
        if (flag) {
            return success("删除成功");
        } else {
            return fail("删除失败");
        }
    }

    /**
     * 查询当前用户上报信息 详情
     *
     * @param reportCode 上报编号
     * @return
     */
    @RequestMapping(value = "searchReportArticleByCode", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleByCode(@RequestParam String reportCode) {
        logger.info("请求 searchReportArticleByCode 方法，reportCode:{}", reportCode);
        ReportArticle reportArticle = reportArticleService.findOneByreportCode(reportCode);
        JSONObject result = new JSONObject();
        if (reportArticle != null) {
            result.put("id", reportArticle.getId());
            result.put("reportCode", reportArticle.getReportCode());
            result.put("reportLevel", SysConst.getReportLevelByCode(reportArticle.getReportLevel()).getName());
            result.put("sourceUrl", reportArticle.getSourceUrl());
            result.put("sourceType", SysConst.getSourceTypeByCode(reportArticle.getSourceType()).getName());
            result.put("title", reportArticle.getTitle());
            result.put("publishDatetime", DateUtils.formatDate(reportArticle.getPublishDatetime(), DateUtils.DATE_TIME__FORMAT_CN));
            result.put("replyType", SysConst.getReplyTypeByCode(reportArticle.getReplyType()).getName());
            result.put("replyNumber", reportArticle.getReplyNumber());
            result.put("reportCause", reportArticle.getReportCause());
            result.put("adoptState", reportArticle.getAdoptState());
            result.put("adoptOpinion",reportArticle.getAdoptOpinion());
            result.put("adoptStateMsg", SysConst.getAdoptStateByCode(reportArticle.getAdoptState()).getName());
        }
        return success(result);
    }

    /**
     * 对上报文章进行审核
     *
     * @return
     */
    @RequestMapping(value = "examineAndVerifyReportArticle", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult examineAndVerifyReportArticle(@RequestBody ReportArticle reportArticle) {
        logger.info("请求 examineAndVerifyReportArticle 方法，reportArticle:{}", reportArticle);
        boolean flag = reportArticleService.examineAndVerify(reportArticle);
        if (flag) {
            return success("审核成功");
        } else {
            return fail("审核失败，其他人已经审核，你慢了一步！！");
        }
    }

    /**
     * 根据上报编号查询上报日志
     *
     * @param reportCode 上报编号
     * @return
     */
    @RequestMapping(value = "searchReportArticleLog", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleLog(@RequestParam String reportCode) {
        logger.info("请求 searchReportArticleLog 方法，reportCode:{}", reportCode);
        List<ReportArticleLog> list = reportArticleLogService.findListByReportCode(reportCode);
        JSONArray result = new JSONArray();
        list.stream()
//                .filter(reportArticleLog -> !Objects.equal(userId, reportArticleLog.getAdoptUserId()))
                .forEach(reportArticleLog -> {
                    JSONObject jo = new JSONObject();
                    String adoptStateVal = SysConst.getAdoptStateByCode(reportArticleLog.getAdoptState()).getName();
                    SysUser sysUser = sysUserService.findById(reportArticleLog.getCreatedUserId());
                    StringBuilder sb = new StringBuilder();
                    sb.append("用户：").append(sysUser.getUserName()).append(adoptStateVal);
                    jo.put("msg", sb.toString());
                    jo.put("datetime", DateUtils.formatDate(reportArticleLog.getCreatedDatetime(), DateUtils.DATE_SECOND_FORMAT));
                    jo.put("adoptState", reportArticleLog.getAdoptState());
                    result.add(jo);
                });
        return success(result);
    }

    /**
     * 根据上报编号查询上报文件
     *
     * @param reportCode 上报编号
     * @return
     */
    @RequestMapping(value = "searchReportArticleFile", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchReportArticleFile(@RequestParam String reportCode) {
        logger.info("请求 searchReportArticleFile 方法，reportCode:{}", reportCode);
        List<ReportArticleFile> list = reportArticleFileService.findListByReportCode(reportCode);
        JSONArray result = new JSONArray();
        list.stream()
                .forEach(reportArticleFile -> {
                    JSONObject jo = new JSONObject();
                    jo.put("originalFileName", reportArticleFile.getOriginalFileName());
                    jo.put("fileSize", reportArticleFile.getFileSize());
                    result.add(jo);
                });
        return success(result);
    }

    /**
     * 根据上报编号查询上报文件
     *
     * @param id 上报id
     * @return
     */
    @RequestMapping(value = "downLoadReportArticleFile/{id}", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult downLoadReportArticleFile(HttpServletRequest request,
                                                HttpServletResponse response,
                                                @PathVariable Long id) {
        logger.info("请求 downLoadReportArticleFile 方法，id:{}", id);
        ReportArticleFile reportArticleFile = reportArticleFileService.findById(id);
        if (reportArticleFile != null) {
            String filePath = reportArticleFile.getFilePath();
            try {
                boolean bl = FileUtils.fileDownLoad(request, response, filePath);
                if (bl) {
                    return success("下载附件成功");
                } else {
                    return fail("下载附件失败");
                }
            } catch(Exception e) {
                e.printStackTrace();
                return fail("下载文件发生异常");
            }
        } else {
            return fail("文件不存在");
        }
    }


    /**
     * 对上报文章再次上报
     *
     * @param reportCode
     * @return
     */
    @RequestMapping(value = "saveReportArticleAgain", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveReportArticleAgain(@RequestParam String reportCode) {
        logger.info("请求 saveReportArticleAgain 方法，reportCode:{}", reportCode);
        ReportArticle reportArticle = reportArticleService.saveAgain(reportCode);
        if (reportArticle != null) {
            return success("上报成功");
        } else {
            return fail("上报失败");
        }
    }

    private JSONObject pageReportArticleToJSONObject(Page<ReportArticle> page) {
        JSONObject result = new JSONObject();
        List<ReportArticle> list = page.getContent();
        JSONArray ja = new JSONArray();
        list.stream().forEach(reportArticle -> {
            JSONObject jo = new JSONObject();
            jo.put("id", reportArticle.getId());
            jo.put("reportCode", reportArticle.getReportCode());
            jo.put("title", TStringUtils.substr(reportArticle.getTitle(), SysConst.SPLIT_LEN, SysConst.REPLACE_STR));
            jo.put("sourceType", SysConst.getSourceTypeByCode(reportArticle.getSourceType()).getName());
            jo.put("reportLevel", SysConst.getReportLevelByCode(reportArticle.getReportLevel()).getName());
            jo.put("replyNumber", reportArticle.getReplyNumber());
            jo.put("adoptState", SysConst.getAdoptStateByCode(reportArticle.getAdoptState()).getName());
            jo.put("publishDatetime", DateUtils.formatDate(reportArticle.getPublishDatetime(), DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            ja.add(jo);
        });
        result.put("total", page.getTotalElements());
        result.put("rows", ja);
        return result;
    }

}
