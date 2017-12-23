package com.opinion.mysql.entity;

import com.opinion.mysql.converter.LocalDateTimeAttributeConverter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 上报文章附件表
 *
 * @author zhangtong
 * Created by on 2017/12/23
 */
@Entity
@Table(name = "t_report_article_file")
public class ReportArticleFile {
    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 上传编号
     */
    @Column(name = "report_code")
    private String reportCode;

    /**
     * 上传编号
     */
    @Column(name = "file_path")
    private String filePath;

    /**
     * 文件大小
     */
    @Column(name = "file_size")
    private String fileSize;

    /**
     * 文件md5
     */
    @Column(name = "file_md5")
    private String fileMD5;
    /**
     * 存在服务器的名称
     */
    @Column(name = "full_file_name")
    private String fullFileName;
    /**
     * 原名称 带后缀
     */
    @Column(name = "original_file_name")
    private String originalFileName;
    /**
     * 原名称
     */
    @Column(name = "file_name")
    private String fileName;
    /**
     * 后缀名
     */
    @Column(name = "suffix_name")
    private String suffixName;

    /**
     * 创建时间
     */
    @Column(name = "created_datetime", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime createdDatetime;
    /**
     * 创建人
     */
    @Column(name = "created_user_id", nullable = false)
    private Long createdUserId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReportCode() {
        return reportCode;
    }

    public void setReportCode(String reportCode) {
        this.reportCode = reportCode;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
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

    public LocalDateTime getCreatedDatetime() {
        return createdDatetime;
    }

    public void setCreatedDatetime(LocalDateTime createdDatetime) {
        this.createdDatetime = createdDatetime;
    }

    public Long getCreatedUserId() {
        return createdUserId;
    }

    public void setCreatedUserId(Long createdUserId) {
        this.createdUserId = createdUserId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
