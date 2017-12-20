package com.opinion.controller;

import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.mongodb.entity.UserFingerprint;
import com.opinion.mongodb.service.UserFingerprintService;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.MyDES;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author zhangtong
 * Created by on 2017/12/20
 */
@Controller
@RequestMapping("fingerprint")
public class FingerprintController extends BaseController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private UserFingerprintService userFingerprintService;

    /**
     * 下载downZKBIOOnline 驱动
     */
    @RequestMapping(value = "ZKBIOOnline", method = RequestMethod.GET)
    public void ZKBIOOnline(HttpServletResponse response) throws IOException {
        String fileName = "zkbioonline.exe";
        String path = System.getProperty("user.dir") + File.separator + "middleware" + File.separator + fileName;
        String fileNameHeader = new String(fileName.getBytes(), SysConst.ENCODING_ISO_8859_1);
        File file = ResourceUtils.getFile(path);
        response.setHeader("content-type", "application/octet-stream");
        response.setContentType("application/octet-stream; charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileNameHeader);
        byte[] buff = new byte[1024];
        OutputStream os = response.getOutputStream();
        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
        int i = bis.read(buff);
        while (i != -1) {
            os.write(buff, 0, buff.length);
            os.flush();
            i = bis.read(buff);
        }
        if (bis != null) {
            bis.close();
        }
    }

    /**
     * 保存用户指纹
     *
     * @param userFingerprint
     * @return
     */
    @RequestMapping(value = "saveFingerprint", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveFingerprint(@RequestBody UserFingerprint userFingerprint) {
        userFingerprint = userFingerprintService.save(userFingerprint);
        if (userFingerprint != null) {
            return success("指纹保存成功");
        } else {
            return fail("指纹保存失败,该指纹已存在");
        }
    }

    /**
     * 判断指纹是否存在
     *
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "isExistFingerprint", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult isExistFingerprint(@RequestParam String username,
                                         @RequestParam String password) {
        String paw = password + username;
        String pawDES = MyDES.encryptBasedDes(paw);
        // 从数据库获取对应用户名密码的用户
        SysUser sysUser = sysUserService.findByUserAccountAndUserPassword(username, pawDES);
        if (sysUser == null) {
            return fail("帐号或密码不正确！");
        }
        boolean isExist = userFingerprintService.isExistFingerprint(sysUser.getId());
        JSONObject result = new JSONObject();
        result.put("isExist", isExist);
        result.put("userId", sysUser.getId());
        return success(result);
    }

}
