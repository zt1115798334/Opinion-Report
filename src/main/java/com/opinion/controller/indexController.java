package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.SysMessage;
import com.opinion.mysql.service.SysMessageService;
import com.opinion.utils.RelativeDateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/21
 */
@Controller
@RequestMapping("index")
public class indexController extends BaseController {

    @Autowired
    private SysMessageService sysMessageService;

    @RequestMapping
    @ResponseBody
    public AjaxResult searchnotice(){
        Long userId = new SysUserConst().getUserId();
        List<SysMessage> sysMessages = sysMessageService.findByRelationUserId(userId, SysConst.MessageState.UNREAD.getCode());
        JSONArray result = new JSONArray();
        sysMessages.stream().forEach(sysMessage -> {
            JSONObject jo = new JSONObject();
            jo.put("title",sysMessage.getTitle());
            jo.put("subtitle",sysMessage.getSubtitle());
            jo.put("timeMsg", RelativeDateUtils.format(sysMessage.getPublishDatetime()));
            result.add(jo);
        });
        return success(result);
    }

}
