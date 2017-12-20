package com.opinion.controller;

import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.mongodb.entity.UserFingerprint;
import com.opinion.mongodb.service.UserFingerprintService;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.SysUserService;
import com.opinion.shiro.ShiroService;
import com.opinion.utils.MyDES;
import com.opinion.vcode.Captcha;
import com.opinion.vcode.GifCaptcha;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Controller
public class LoginController extends BaseController {
    @Autowired
    ShiroService shiroService;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private UserFingerprintService userFingerprintService;

    /**
     * 首页
     */
    @RequestMapping(value = "index")
    public String index() {
        return "index";
    }

    /**
     * 登录
     *
     * @return
     */
    @RequestMapping(value = "login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/")
    public String login2() {
        return "index";
    }

    /**
     * ajax登录请求
     *
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "ajaxLogin", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult ajaxLogin(@RequestParam String username,
                                @RequestParam String password,
                                @RequestParam Boolean rememberMe) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return fail("请输入账户,密码");
        }
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
            SecurityUtils.getSubject().login(token);
            return success("登录成功");
        } catch(Exception e) {
            return fail(e.getMessage());
        }
    }

    /**
     * 指纹登录
     *
     * @param fingerprint 指纹
     * @return
     */
    @RequestMapping(value = "ajaxFingerprintLogin", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult ajaxFingerprintLogin(@RequestParam String fingerprint) {
        List<UserFingerprint> userFingerprints = userFingerprintService.findAll();
        List<UserFingerprint> success = userFingerprints.stream()
                .filter(userFingerprint -> userFingerprintService.verificationFingerprint(userFingerprint.getFingerprint(), fingerprint))
                .collect(Collectors.toList());
        try {
            if (success != null && success.size() != 0) {
                SysUser sysUser = sysUserService.findById(success.get(0).getUserId());
                String userAccount = sysUser.getUserAccount();
                String pawDEC = MyDES.decryptBasedDes(sysUser.getUserPassword());
                String password = pawDEC.substring(0, pawDEC.length() - userAccount.length());
                UsernamePasswordToken token = new UsernamePasswordToken(userAccount, password, true);
                SecurityUtils.getSubject().login(token);
                return success("登录成功");
            } else {
                return fail("指纹错误");
            }
        } catch(Exception e) {
            return fail(e.getMessage());
        }
    }

    /**
     * 退出
     *
     * @return
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> logout() {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        try {
            //退出
            SecurityUtils.getSubject().logout();
        } catch(Exception e) {
            System.err.println(e.getMessage());
        }
        return resultMap;
    }

    /**
     * 获取验证码（Gif版本）
     *
     * @param response
     */
    @RequestMapping(value = "getGifCode", method = RequestMethod.GET)
    public void getGifCode(HttpServletResponse response, HttpServletRequest request) {
        try {
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/gif");
            /**
             * gif格式动画验证码
             * 宽，高，位数。
             */
            Captcha captcha = new GifCaptcha(146, 33, 4);
            //输出
            captcha.out(response.getOutputStream());
            HttpSession session = request.getSession(true);
            String v = captcha.text().toLowerCase();
            //存入Session
            session.setAttribute("_codeKey", v);

        } catch(Exception e) {
            System.err.println("获取验证码异常：" + e.getMessage());
        }
    }

}
