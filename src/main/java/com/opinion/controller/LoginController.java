package com.opinion.controller;

import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.mongodb.service.UserFingerprintService;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.SysUserService;
import com.opinion.shiro.ShiroService;
import com.opinion.utils.MyDES;
import com.opinion.vcode.Captcha;
import com.opinion.vcode.GifCaptcha;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import zk.jni.JavaToBiokey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.LinkedHashMap;
import java.util.Map;

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
                                @RequestParam Boolean rememberMe,
                                @RequestParam String fingerprint) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return fail("请输入账户,密码");
        }
        try {
            String paw = password + username;
            String pawDES = MyDES.encryptBasedDes(paw);
            // 从数据库获取对应用户名密码的用户
            SysUser sysUser = sysUserService.findByUserAccountAndUserPassword(username, pawDES);
            if (sysUser == null) {
                throw new AccountException("帐号或密码不正确！");
            }
            boolean verificationStatus = userFingerprintService.verificationFingerprint(sysUser.getId(), fingerprint);
            if (!verificationStatus) {
                return fail("你录入的指纹不对，快把手剁了吧！！");
            }
            UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
            SecurityUtils.getSubject().login(token);
            return success("登录成功");
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
