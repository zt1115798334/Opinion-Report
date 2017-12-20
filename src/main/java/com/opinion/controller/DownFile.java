package com.opinion.controller;

import com.opinion.constants.SysConst;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author zhangtong
 * Created by on 2017/12/20
 */
@Controller
@RequestMapping("down")
public class DownFile {

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
}
