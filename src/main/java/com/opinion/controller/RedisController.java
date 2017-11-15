package com.opinion.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.redis.entity.Operate;
import com.opinion.redis.entity.RedisInfoDetail;
import com.opinion.redis.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * redis监控页面Controller
 *
 * @author 作者: z77z
 * @date 创建时间：2017年3月29日 下午1:32:02
 */
@Controller
@RequestMapping(value = "redis")
public class RedisController extends BaseController {

    @Autowired
    RedisService redisService;

    //跳转到监控页面
    @RequestMapping(value = "redisMonitor")
    public String redisMonitor(Model model) {
        return "redisMonitor";
    }

    @RequestMapping(value = "getRedisMonitor", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult getRedisMonitor() {
        //获取redis的info
        List<RedisInfoDetail> ridList = redisService.getRedisInfo();
        //获取redis的日志记录
        List<Operate> logList = redisService.getLogs(1000);
        //获取日志总数
        long logLen = redisService.getLogLen();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("ridList", ridList);
        jsonObject.put("logList", logList);
        jsonObject.put("logLen", logLen);
        return success(jsonObject);
    }

    //清空日志按钮
    @RequestMapping(value = "logEmpty")
    @ResponseBody
    public String logEmpty() {
        return redisService.logEmpty();
    }

    //获取当前数据库中key的数量
    @RequestMapping(value = "getKeysSize")
    @ResponseBody
    public String getKeysSize() {
        return JSON.toJSONString(redisService.getKeysSize());
    }

    //获取当前数据库内存使用大小情况
    @RequestMapping(value = "getMemeryInfo")
    @ResponseBody
    public String getMemeryInfo() {
        return JSON.toJSONString(redisService.getMemeryInfo());
    }
}
