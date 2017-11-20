package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
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
import com.opinion.utils.SNUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    @RequestMapping("issuedNoticeReceivePage")
    public String issuedNoticeReceivePage() {
        return "/issued/issuedNoticeReceive";
    }

    /**
     * 跳转通知下传（发出）页面
     *
     * @return
     */
    @RequestMapping("issuedNoticeSendPage")
    public String issuedNoticeSendPage() {
        return "/issued/issuedNoticeSend";
    }

    /**
     * 跳转通知下传详情页面
     *
     * @return
     */
    @RequestMapping("issuedNoticeInfoPage")
    public String issuedNoticeInfoPage(Model model,
                                       @RequestParam String noticeCode) {
        Long userId = new SysUserConst().getUserId();
        issuedNoticeLogService.readIssuedNotice(noticeCode, userId);
        model.addAttribute("noticeCode", noticeCode);
        return "/issued/issuedNoticeInfo";
    }

    /**
     * 保存下传信息
     *
     * @param issuedNotice
     * @return
     */
    @RequestMapping(value = "saveIssuedNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveIssuedNotice(@RequestBody IssuedNotice issuedNotice) {
        Long userId = new SysUserConst().getUserId();

        String noticeRange = issuedNotice.getNoticeRange();
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();

        List<Long> childId = Lists.newArrayList();
        //全部
        if (noticeRange.equals(SysConst.NoticeRange.ALL.getCode())) {
            childId = sysUserService.findDescendantAllIdListByParentId(userId);
            //市级
        } else if (noticeRange.equals(SysConst.NoticeRange.MUNICIPAL.getCode())) {
            childId = sysUserService.findChildIdListByParentId(userId);
            //县级
        } else if (noticeRange.equals(SysConst.NoticeRange.COUNTY.getCode())) {
            childId = sysUserService.findDescendantIdListByParentId(userId);
        }

        issuedNotice.setNoticeCode(SNUtil.create15());
        issuedNotice.setReceiptState(SysConst.ReceiptState.UNRECEIPT.getCode());
        issuedNotice.setCreatedDatetime(currentDatetime);
        issuedNotice.setCreatedDate(currentDate);
        issuedNotice.setCreatedUserId(userId);
        issuedNotice.setModifiedDatetime(currentDatetime);
        issuedNotice.setModifiedDate(currentDate);
        issuedNotice.setModifiedUserId(userId);
        issuedNoticeService.save(issuedNotice, childId);
        return success("添加成功");
    }

    /**
     * 查询下传信息(接受)
     *
     * @param issuedNotice
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeReceive", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeReceive(@RequestBody IssuedNotice issuedNotice) {
        Long userId = new SysUserConst().getUserId();
        issuedNotice.setReceiptUserId(userId);
        Page<IssuedNotice> issuedNoticePage = issuedNoticeService.findPageByReceiptUserId(issuedNotice);
        return success(issuedNoticePage);
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
        Long userId = new SysUserConst().getUserId();

        issuedNotice.setCreatedUserId(userId);
        Page<IssuedNotice> issuedNoticePage = issuedNoticeService.findPageByCreatedUserId(issuedNotice);
        return success(issuedNoticePage);
    }

    /**
     * 执行回执操作
     *
     * @return
     */
    @RequestMapping(value = "replyExecution", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult replyExecution(@RequestParam String noticeCode) {
        issuedNoticeService.replyExecution(noticeCode);
        return success("执行成功");
    }

    /**
     * 查询当前用户下传信息 详情
     *
     * @param noticeCode
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeByNoticeCode", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeByNoticeCode(@RequestParam String noticeCode) {
        IssuedNotice issuedNotice = issuedNoticeService.findOneByNoticeCode(noticeCode);
        return success(issuedNotice);
    }

    /**
     * 根据上报编号查询上报日志
     *
     * @param noticeCode
     * @return
     */
    @RequestMapping(value = "searchIssuedNoticeLog", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchIssuedNoticeLog(@RequestParam String noticeCode) {
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

}
