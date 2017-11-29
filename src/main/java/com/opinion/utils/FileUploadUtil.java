package com.opinion.utils;

import com.opinion.utils.module.UploadFile;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/**
 * @author zhangtong
 * Created by on 2017/11/28
 */
public class FileUploadUtil {

    /**
     * 上传文件，并获取上传文件（单文件上传）
     *
     * @param request    [requewt请求]
     * @param folderPath [文件保存路]
     * @return [文件自定义实体类]
     */
    public UploadFile getFile(HttpServletRequest request, String folderPath) {
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 新建目录
        File directory = new File(folderPath);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        try {
            // 判断 request 是否有文件上传,即多部分请求
            if (multipartResolver.isMultipart(request)) {
                // 转换成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                // 取得request中的所有文件名
                Iterator<String> iter = multiRequest.getFileNames();
                while (iter.hasNext()) {
                    UploadFile f = transferFile(folderPath, multiRequest.getFile(iter.next()));
                    if (f != null) {
                        return f;
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 上传文件，并获取上传文件列表（多文件上传）
     *
     * @param request    [requewt请求]
     * @param folderPath [文件保存路]
     * @return [文件自定义实体类]
     */
    public List<UploadFile> getFiles(HttpServletRequest request, String folderPath) {
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 新建目录
        File directory = new File(folderPath);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        List<UploadFile> files = new ArrayList<>();
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                List<MultipartFile> multipartFiles = multiRequest.getFiles(iter.next());
                multipartFiles.stream().forEach(multipartFile -> {
                    UploadFile f = null;
                    try {
                        f = transferFile(folderPath, multipartFile);
                    } catch(IOException e) {
                        e.printStackTrace();
                    }
                    if (f != null) {
                        files.add(f);
                    }
                });

            }
        }
        return files;
    }

    /**
     * 文件写入磁盘
     *
     * @param folderPath [description]
     * @param file       [description]
     * @return [description]
     * @throws IOException [description]
     */
    private UploadFile transferFile(String folderPath, MultipartFile file) throws IOException {
        // 取得上传文件
//        MultipartFile file = multiRequest.getFile(path);

        if (file != null) {
            // 取得当前上传文件的文件名称
            String fileMD5 = DigestUtils.md5Hex(file.getBytes());
            String originalFileName = file.getOriginalFilename();//原名称 带后缀
            String fileName = originalFileName.substring(0, originalFileName.lastIndexOf("."));//原名称
            String suffixName = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);//后缀名

            double size = (file.getSize() * 1.0) / (1024 * 1.0) / (1024 * 1.0);
            BigDecimal bg = new BigDecimal(size);
            double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
            String fileSize = f1 + "";

            // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
            if (originalFileName.trim() != "") {
                // 重命名上传后的文件名
                String newName = UUID.randomUUID().toString() + "." + suffixName;
                // 定义上传路径
                String tarpath = folderPath + "/" + newName;
                File localFile = new File(tarpath);
                file.transferTo(localFile);
                UploadFile uploadFile = new UploadFile()
                        .setFile(localFile)
                        .setFullFileName(newName)
                        .setFileName(fileName)
                        .setOriginalFileName(originalFileName)
                        .setSuffixName(suffixName)
                        .setFileSize(fileSize)
                        .setFileMD5(fileMD5);
                return uploadFile;
            }
        }
        return null;
    }
}
