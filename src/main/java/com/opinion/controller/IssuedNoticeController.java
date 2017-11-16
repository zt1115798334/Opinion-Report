package com.opinion.controller;

import com.google.common.collect.Lists;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.IssuedNotice;
import com.opinion.mysql.service.IssuedNoticeLogService;
import com.opinion.mysql.service.IssuedNoticeService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.SNUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
     * 保存下传信息
     *
     * @param issuedNotice
     * @return
     */
    @RequestMapping(value = "saveIssuedNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveIssuedNotice(@RequestBody IssuedNotice issuedNotice) {
        String noticeRange = issuedNotice.getNoticeRange();
        LocalDateTime currentDate = DateUtils.currentDate();
        Long userId = SysConst.USER_ID;

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
        issuedNotice.setCreatedDate(currentDate);
        issuedNotice.setCreatedUserId(userId);
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
        Long userId = SysConst.USER_ID;
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
        Long userId = SysConst.USER_ID;
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
     * 执行读取操作
     *
     * @param noticeCode
     * @return
     */
    @RequestMapping(value = "readIssuedNotice", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult readIssuedNotice(@RequestParam String noticeCode) {
        Long userId = SysConst.USER_ID;
        issuedNoticeLogService.readIssuedNotice(noticeCode, userId);
        return success("读取成功");
    }

}
