package com.opinion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhangtong
 * Created by on 2017/12/8
 */
@Controller
@RequestMapping("web")
public class WebController {

    @RequestMapping("401")
    public String web401(){
        return "/error/401";
    }

    @RequestMapping("404")
    public String web404(){
        return "/error/404";
    }

    @RequestMapping("500")
    public String web500(){
        return "/error/500";
    }
}
