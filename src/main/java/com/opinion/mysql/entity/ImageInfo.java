package com.opinion.mysql.entity;

import javax.persistence.*;

/**
 * @author zhangtong
 * Created by on 2017/11/29
 */
@Entity
@Table(name = "t_image_info")
public class ImageInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;
    /**文件路径*/
    @Column(name = "file_url", nullable = false)
    public String fileUrl;
    /**文件大小*/
    @Column(name = "file_size", nullable = false)
    public String fileSize;
    /**文件md5*/
    @Column(name = "file_md5", nullable = false)
    public String fileMD5;
    /**存在服务器的名称*/
    @Column(name = "full_file_name", nullable = false)
    public String fullFileName;
    /**原名称 带后缀*/
    @Column(name = "original_file_name", nullable = false)
    public String originalFileName;
    /**原名称*/
    @Column(name = "file_name", nullable = false)
    public String fileName;
    /**后缀名*/
    @Column(name = "suffix_name", nullable = false)
    public String suffixName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileMD5() {
        return fileMD5;
    }

    public void setFileMD5(String fileMD5) {
        this.fileMD5 = fileMD5;
    }

    public String getFullFileName() {
        return fullFileName;
    }

    public void setFullFileName(String fullFileName) {
        this.fullFileName = fullFileName;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getSuffixName() {
        return suffixName;
    }

    public void setSuffixName(String suffixName) {
        this.suffixName = suffixName;
    }

}
