package com.opinion.controller;

import com.opinion.shiro.ShiroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Controller
public class LoginController {
    @Autowired
    ShiroService shiroService;

    //首页
    @RequestMapping(value="index")
    public String index() {
        return "index";
    }

    //登录
    @RequestMapping(value="login")
    public String login() {
        return "login";
    }
}
