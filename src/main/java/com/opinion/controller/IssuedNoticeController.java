package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.IssuedNotice;
import com.opinion.mysql.entity.IssuedNoticeLog;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.IssuedNoticeLogService;
import com.opinion.mysql.service.IssuedNoticeService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
@Controller
@RequestMapping("issuedNotice")
public class IssuedNoticeController extends BaseController {

    @Autowired
    private IssuedNoticeService issuedNoticeService;

    @Autowired
    private IssuedNoticeLogService issuedNoticeLogService;

    @Autowired
    private SysUserService sysUserService;

    /**
     * 跳转通知下传（接受）页面
     *
     * @return
     */
    @RequestMapping(value = "issuedNoticeReceivePage", method = RequestMethod.GET)
    public String issuedNoticeReceivePage() {
        return "/issued/issuedNoticeReceive";
    }

    /**
     * 跳转通知下传（发出）页面
     *
     * @return
     */
    @RequestMapping(value = "issuedNoticeSendPage", method = RequestMethod.GET)
    public String issuedNoticeSendPage() {
        return "/issued/issuedNoticeSend";
    }

    /**
     * 跳转通知下传详情页面
     *
     * @param model
     * @param noticeCode 通知编号
     * @return
     */
    @RequestMapping(value = "issuedNoticeInfoPage", method = RequestMethod.GET)
    public String issuedNoticeInfoPage(Model model,
                                       @RequestParam String noticeCode) {
        logger.info("请求 issuedNoticeInfoPage 方法，noticeCode：{}", noticeCode);
        Long userId = new SysUserConst().getUserId();
        issuedNoticeLogService.readIssuedNotice(noticeCode, userId);
        model.addAttribute("noticeCode", noticeCode);
        return "/issued/issuedNoticeInfo";
    }

    /**
     * 保存下传信息
     *
     * @param issuedNotice 下达通知
     * @return
     */
    @RequestMapping(value = "saveIssuedNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveIssuedNotice(@RequestBody IssuedNotice issuedNotice) {
        logger.info("请求 saveIssuedNotice 方法，issuedNotice：{}", issuedNotice);
        issuedNoticeService.save(issuedNotice);
        return success("添加成功");
    }

    /**
     * 查询下传信息(接受)
     *
     * @param issuedNotice 下达通知
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeReceive", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeReceive(@RequestBody IssuedNotice issuedNotice) {
        logger.info("请求 searchIssuedNoticeReceive 方法，issuedNotice：{}", issuedNotice);
        Long userId = new SysUserConst().getUserId();
        issuedNotice.setReceiptUserId(userId);
        Page<IssuedNotice> page = issuedNoticeService.findPageByReceiptUserId(issuedNotice);
        JSONObject result = pageIssuedNoticeToJSONObject(page);
        return success(result);
    }

    /**
     * 查询下传信息(发出)
     *
     * @param issuedNotice
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeSend", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeSend(@RequestBody IssuedNotice issuedNotice) {
        logger.info("请求 searchIssuedNoticeSend 方法，issuedNotice：{}", issuedNotice);
        Long userId = new SysUserConst().getUserId();
        issuedNotice.setCreatedUserId(userId);
        Page<IssuedNotice> page = issuedNoticeService.findPageByCreatedUserId(issuedNotice);
        JSONObject result = pageIssuedNoticeToJSONObject(page);
        return success(result);
    }

    /**
     * 删除通知下传信息
     *
     * @param id id集合
     * @return
     */
    @RequestMapping(value = "deleteIssuedNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult deleteIssuedNotice(@RequestParam List<Long> id) {
        logger.info("请求 deleteIssuedNotice 方法，id集合：{}", id);
        boolean flag = issuedNoticeService.delByIds(id);
        JSONObject result = new JSONObject();
        if (flag) {
            result.put("msg", "删除成功");
        } else {
            result.put("msg", "删除失败");
        }
        return success(result);
    }

    /**
     * 查询当前用户下传信息 详情
     *
     * @param noticeCode 通知编号
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeByNoticeCode", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeByNoticeCode(@RequestParam String noticeCode) {
        logger.info("请求 searchIssuedNoticeByNoticeCode 方法，noticeCode：{}", noticeCode);
        Long userId = new SysUserConst().getUserId();
        IssuedNotice issuedNotice = issuedNoticeService.findOneByNoticeCode(noticeCode);
        JSONObject result = new JSONObject();
        if (issuedNotice != null) {
            IssuedNoticeLog issuedNoticeLog = issuedNoticeLogService.findByNoticeCodeAndReceiptUserId(noticeCode, userId);
            result.put("id", issuedNotice.getId());
            result.put("noticeCode", issuedNotice.getNoticeCode());
            result.put("title", issuedNotice.getTitle());
            result.put("publishDatetime", DateUtils.formatDate(issuedNotice.getPublishDatetime(), DateUtils.DATE__FORMAT_CN));
            result.put("noticeType", SysConst.getNoticeTypeByCode(issuedNotice.getNoticeType()).getName());
            result.put("noticeContent", issuedNotice.getNoticeContent());
            if (issuedNoticeLog != null) {
                result.put("receiptState", issuedNoticeLog.getReceiptState());
                result.put("receiptStateMsg", SysConst.getReceiptStateByCode(issuedNoticeLog.getReceiptState()).getName());
            } else {
                result.put("receiptState", issuedNotice.getReceiptState());
                result.put("receiptStateMsg", SysConst.getReceiptStateByCode(issuedNotice.getReceiptState()).getName());
            }
        }
        return success(result);
    }

    /**
     * 执行回执操作
     *
     * @return
     */
    @RequestMapping(value = "replyExecution", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult replyExecution(@RequestParam String noticeCode) {
        logger.info("请求 replyExecution 方法，noticeCode：{}", noticeCode);
        issuedNoticeService.replyExecution(noticeCode);
        return success("执行成功");
    }

    /**
     * 根据上报编号查询上报日志
     *
     * @param noticeCode 通知编号
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeLog", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeLog(@RequestParam String noticeCode) {
        logger.info("请求 searchIssuedNoticeLog 方法，noticeCode：{}", noticeCode);
        List<IssuedNoticeLog> list = issuedNoticeLogService.findListByNoticeCode(noticeCode);
        JSONArray ja = new JSONArray();
        list.stream().forEach(issuedNoticeLog -> {
            JSONObject jo = new JSONObject();
            String RReceiptStateVal = SysConst.getReceiptStateByCode(issuedNoticeLog.getReceiptState()).getCode();
            SysUser sysUser = sysUserService.findById(issuedNoticeLog.getCreatedUserId());
            StringBuilder sb = new StringBuilder();
            sb.append("用户：").append(sysUser.getUserName()).append(RReceiptStateVal);
            jo.put("msg", sb.toString());
            jo.put("datetime", DateUtils.formatDate(issuedNoticeLog.getCreatedDate(), DateUtils.DATE_SECOND_FORMAT));
            ja.add(jo);
        });

        long allIssuedNoticeLogCount = issuedNoticeLogService.findCountByNoticeCode(noticeCode);
        long receiptIssuedNoticeLogCount = issuedNoticeLogService
                .findCountByNoticeCodeAndReceiptState(noticeCode, SysConst.ReceiptState.RECEIPT.getCode());
        JSONObject result = new JSONObject();
        result.put("data", ja);
        result.put("allCount", allIssuedNoticeLogCount);
        result.put("noticeCount", receiptIssuedNoticeLogCount);
        return success(result);
    }

    private JSONObject pageIssuedNoticeToJSONObject(Page<IssuedNotice> page) {
        JSONObject result = new JSONObject();
        List<IssuedNotice> list = page.getContent();
        JSONArray ja = new JSONArray();
        list.stream().forEach(issuedNotice -> {
            JSONObject jo = new JSONObject();
            jo.put("id", issuedNotice.getId());
            jo.put("noticeCode", issuedNotice.getNoticeCode());
            jo.put("title", issuedNotice.getTitle());
            jo.put("noticeType", SysConst.getNoticeTypeByCode(issuedNotice.getNoticeType()).getName());
            jo.put("receiptState", SysConst.getReceiptStateByCode(issuedNotice.getReceiptState()).getName());
            jo.put("replyNumber", DateUtils.formatDate(issuedNotice.getPublishDatetime(), DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            ja.add(jo);
        });
        result.put("totalElements", page.getTotalElements());
        result.put("totalPages", page.getTotalPages());
        result.put("list", ja);
        return result;
    }

}
