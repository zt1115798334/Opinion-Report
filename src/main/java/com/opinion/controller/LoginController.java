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

    public static void main(String[] args) {
        String reg = "mspY1o6mpgltAQiMDjZBB2mOVMIGCJBjAQWDkTRCBuIVZ0EJHJYqwQZoF2nBB40YNIIJZRpNQgt1oX2BBiChT8IWEiJYgg0bJnKBBiapMsELTy1hAgwvLnHBCC0vSEExODIoQQdMNDDBB0e2NsIIPTdEgSW0t0bBJL24cUEIMzhmwQ1FOUdBHmU5P8EvuDo8ASmyPGtBE0s9OwEd2z0mwQXDvoQCDDHBNgET2cFxQnc5wXxCHZpCL4IOyEN5gh1+SHhBTGnLKgEL1EtEgQPZUlRCBdRAVMsRr1BQHAMSUVNTU1ZhDR0mKSopJSMiIQMSUFBOTEtFMysvMC4tKSckJAMRVVZXWF1nAhUfIiUlIyMiAxNMTUtGQz87ODg2NDEsKSUlIgMRWVtcXmFqdg0XHCAiISEhAxNLSkdDQkNEQj87NzItKSYnJwMRX19hY2dtdgkQFhodHyAgAxNJSUhHS1BRTUhCOjMrKCQlIgQRZGZpbHEBBw4UGBscHR0DE0tLS1FYXVtXUktAMiQjIiQiBBBoaWxwdAIIDRIWGRscAxJQUFNYXV9dXFhWVDcaHRwgBBBoa21xdQMHDBAVGBobBBFUWFxfYF5eXFxhbQULBgQPaWxvcnYDBwsPExcaBBFZXV9gYF9eXV9iZm50cwUPbm9zdwQHCw8TFxsEEl1hYmJgXl5dXV9gYWdnaQYOcXR3BQgKDhEXBRFlZWNhX19eX2FgYmRjBw10AQYICw8RBhBnY2FfX15cXlxeXBjwMxm0qlAUIdEpxoHM/3yFVRjqjGWGC5QiDAUyDTjyIsNcu+jaTw83LB1wgCOdS+C3rKIgXACWPSVNC+Qed1knAK47O3XxTwUiLOWs40N8kl7txd5EtQ86Ifa/4CJYEZ2YQnvvnnmpKunFCTlIlwJhe3FAGb6Jit4F4UghJ/WtoJz1Y6GJNT3ZooaBs3bzRIj1YhTvaee46bYvxzIhpQpzxZUaNGDHHaKe7C7a8DTSLadWhQ56ujdO2K63C0KV71D/rYG/PcDOwlM2H2z7hwfgJvtCirZ6fHaLK8IfUoauQUsIi+Mk1m7jJZ08QfhYfWqCYg3/vR1bO5l3SmnxntfjShb6IMbriVRC4IH9wuGKICXvQzpzCZV8cP9GOrBV0XWFdZQC7xJen9ZsXDijOHcYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgY";// "REGSTR";
        String ver = "mspYlpG2qAdaAguNjHKBFY8NS4EJEBB3ghGdljOBBm8WaoEIkRd6QQcgmTLBBewZUMIHEZtewgSKoSyBDWkkREINeiRiQgWVqUuBDoOqUIEKHa9yAQYlsidBDFKzZUEGKjkfQglQuTtBJD65U8EKOLoTARXJu2IBCDG8I8EKTD8qQglCv4iBE6FBNgErusE4QSu/QjLBO7bDLkE0tEQ6QRZlxFaBDklEYoEHNkQZwQXExSzBJODIWoETT8kmgRbeySDCEcxJdsEGn0xqQRWkzWCCbT5PUYENcFBnQhuD0E6BCGLRdgETikO07Q6ycPMXAxFgYWNpcQYTGR0gISIhISECEVhcXF5lcQobISQlJSQiIiMDEWNkaG11Bg8WGh0fIB8fHQIRVFZXWGBxFSInKisoJSQjJgMRZWltcncHDxQYGx0dHx0fAhFQUlJRUj4pKy4tLSonJSUpBBBscHQCBw8TFxocHR0dAhFMTktIRD44NjUyMCwoJicrBBBvcXQCBw0SFRkcHR8gAhFLTEdEQkE/PTk2My8sKCgqBBBucXQCBw4RFRgbHB8hAhFNTUpKTE5KRD85NTAtKSgpBRBydAEFDREVFxwdISECEVBQU1ZdXFZPRj42MCwoJycFD3N0dwQMDxQWGx0jAhBSVVtgY2BdVk8/MiglIiMGDnJ2AwoQFhgbHQIQWF5hY2NhYFxbUSQgHRwfBw51AgkQFhcYGgMQYmNlZWNiX2FrBRQUFBUIDQIJExgZGQQPZ2dlY2JhZGl1Cw8NGPACGbSqUBQh0SrOMS9lRQeSZl3DX1bRn8Pppxb2h01LIkrB6I3eGvzcTzWMpXuDQVXbMyvL6hic1u0P8FZUTvY4GjPt9nFMk37V4eLKV1JWgNSi31RcYAlAytXsz4LS8qm+7RQjXgUpwBAtqly2ZU+DCKAlWrjKcmUrnWEqNZ6ofqk2JrrSomNNUS8DLZKyU1kk6FILgv9eK7feykWNmwwApDMnZ8KB4Mpi+7jy5mP5Bef6OGLgtYXAq7rSlIEt4gKlFSLRrwEYs/uEK4gwDN49Vu6TzvUC6e6HvHovljRs2U5JY4yGhdKeAdexOQB7J1VK1vRhnaUpNV+eX97AzsvYiVoLHfkUQAuqjo+/jOccGTpOcKB+HLcYtCooyHcYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg=";// "VERSTR";
        String test = "fali";
        if (JavaToBiokey.NativeToProcess(reg, ver)) {
            test = "success";
        }
        System.out.printf("verify 9.0,result=" + test + "\n");

        reg = "TVFTUjIyAAAEEhAFBQUHCc7QAAAcE2kAAAAAgyEgiBKiAacPlQABAIIdnAHcAH4PagBlEmYN6ACJAA0PLhKrAaoPSADAAZcdEQGWACsONgA8EqwMzQAYAEYPZBJMAIMOhAB3AJodXgGdALIPeAB5EmQPqQBZADAMNxKXAbMPRACKAMIdAABwAM4PYQAbEvkOoQA9Ab0PAhMXAFMOtQCeAfAdlwGIAM0PZABvEucMcgDfAEoPyBJqAUgOngDAAX0dcAEyANkPUAAnE/cOIwBXAH8PAxMHAFMMGQDiAMEdLAmp3xIhWOopGLPgtfpCBkfzxGWAgSogmv2fgkJ1qPtygM/6FgYnAf6ecoBWeeZzdz8K4i9neo/e2VeB9g7jj7PzfPgBCHvu5hdWAxMP/QzLAbaAsJMYEaa8IAtOidYD9w2j/FoCFgk3ia4jhmX6I8cHuYf3hcMQ8AG335Nj830/ERZyASuC6G9qhZJs8OoY8hMfC8filOfG4M5Wk4TO7EYDExab4gbnvZFXfbcHvvW69PsZcAGv37/XMgzfEcLuzLf4/cQJBBIDMVlMFw+e9VYh1l1f/06bOqskIQADRB4qBMUsBEicDQA4AFoBwIJDgiUARABXVXhw7cCVw4DDb0fAf9CGxRQAVACnosXSwkSEwsDCBosDEmABXpNcDsWHBHvCgWd4eAbFngRlx8HAwwUAHwAN7P7ZDAAOAoZ4+9FSbgMAGQWJwwgSYhNTwVyABYgZEswVj6lpwkl6ldSDocPBSQnF1R0dwf/9/f4kwQDJCIGOBAAbLviECxMNL6mZfsUFwcDSwcMRAO83WcPFgJONkMQLAKs4SNLDcMHClhbFp0r7/P3A+fjAm/767PzB/f/9wOMDBNtTgcMJAJmlU6XUyMLDDQELoEkyVMHB+10GAMtrOYHBDQAUazAFc4BuBQG8b3Cn3gDPYEf//vz9/D76+u38//7///w7/vns//v9wP3A3gEPb0j///9HwDhU++3+/ztE/0beAQiBSP/+PlP+Ov/7UsH8///AwDv/xewLARSXKXivhQ4SNp0peIOJzgEPvVIqV8AzDsUMvznDdcFsb8HdARSuXVVTPsDA7v867f9LBwAMyvWZaB4ADsta/0eQ/kkeABDZXP/COcFP0zMHAAveJwbAxNECAZ3fdP3QAQTsZUZM//5bBf/60j/BChAXC9N0emUGEZ8Icf6F/w0DAgtiPkr/yBEGC2ZL/8D+wzr+XRYRWVt9MgrUAiJ1RcH/ZAwQyynz63PD/8PAasIQED0XwMDCagjVDjU7n8GNBRChhXTEKgQR5kNtRcEQ511sRVJCABmGAQYTAccAWl8AxACmEoXUAAAZRZcAQFAAAAAAABbFAAQSAzIAAAAAxQBBUA==";
        ver = "TVFTUjIyAAAEEhAFBQUHCc7QAAAcE2kAAAAAgyEgiBKiAacPlQABAIIdnAHcAH4PagBlEmYN6ACJAA0PLhKrAaoPSADAAZcdEQGWACsONgA8EqwMzQAYAEYPZBJMAIMOhAB3AJodXgGdALIPeAB5EmQPqQBZADAMNxKXAbMPRACKAMIdAABwAM4PYQAbEvkOoQA9Ab0PAhMXAFMOtQCeAfAdlwGIAM0PZABvEucMcgDfAEoPyBJqAUgOngDAAX0dcAEyANkPUAAnE/cOIwBXAH8PAxMHAFMMGQDiAMEdLAmp3xIhWOopGLPgtfpCBkfzxGWAgSogmv2fgkJ1qPtygM/6FgYnAf6ecoBWeeZzdz8K4i9neo/e2VeB9g7jj7PzfPgBCHvu5hdWAxMP/QzLAbaAsJMYEaa8IAtOidYD9w2j/FoCFgk3ia4jhmX6I8cHuYf3hcMQ8AG335Nj830/ERZyASuC6G9qhZJs8OoY8hMfC8filOfG4M5Wk4TO7EYDExab4gbnvZFXfbcHvvW69PsZcAGv37/XMgzfEcLuzLf4/cQJBBIDMVlMFw+e9VYh1l1f/06bOqskIQADRB4qBMUsBEicDQA4AFoBwIJDgiUARABXVXhw7cCVw4DDb0fAf9CGxRQAVACnosXSwkSEwsDCBosDEmABXpNcDsWHBHvCgWd4eAbFngRlx8HAwwUAHwAN7P7ZDAAOAoZ4+9FSbgMAGQWJwwgSYhNTwVyABYgZEswVj6lpwkl6ldSDocPBSQnF1R0dwf/9/f4kwQDJCIGOBAAbLviECxMNL6mZfsUFwcDSwcMRAO83WcPFgJONkMQLAKs4SNLDcMHClhbFp0r7/P3A+fjAm/767PzB/f/9wOMDBNtTgcMJAJmlU6XUyMLDDQELoEkyVMHB+10GAMtrOYHBDQAUazAFc4BuBQG8b3Cn3gDPYEf//vz9/D76+u38//7///w7/vns//v9wP3A3gEPb0j///9HwDhU++3+/ztE/0beAQiBSP/+PlP+Ov/7UsH8///AwDv/xewLARSXKXivhQ4SNp0peIOJzgEPvVIqV8AzDsUMvznDdcFsb8HdARSuXVVTPsDA7v867f9LBwAMyvWZaB4ADsta/0eQ/kkeABDZXP/COcFP0zMHAAveJwbAxNECAZ3fdP3QAQTsZUZM//5bBf/60j/BChAXC9N0emUGEZ8Icf6F/w0DAgtiPkr/yBEGC2ZL/8D+wzr+XRYRWVt9MgrUAiJ1RcH/ZAwQyynz63PD/8PAasIQED0XwMDCagjVDjU7n8GNBRChhXTEKgQR5kNtRcEQ511sRVJCABmGAQYTAccAWl8AxACmEoXUAAAZRZcAQFAAAAAAABbFAAQSAzIAAAAAxQBBUA==";
        test = "fali";

        if (JavaToBiokey.NativeToProcess(reg, ver)) {
            test = "success";
        }
        System.out.printf("verify 10.0,result=" + test + "\n");
    }
}
