package com.opinion.mysql.entity;

import com.opinion.base.bean.BaseSortRequest;
import com.opinion.mysql.converter.LocalDateAttributeConverter;
import com.opinion.mysql.converter.LocalDateTimeAttributeConverter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 上报文章表 entity
 *
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Entity
@Table(name = "t_report_article")
public class ReportArticle extends BaseSortRequest implements Serializable {

    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 上报来源 artificial:人工上报，machine:机器上报
     */
    @Column(name = "report_source", nullable = false)
    private String reportSource;

    /**
     * 上报类型 nonSensitive：非敏感，sensitive：敏感，serious：严重
     */
    @Column(name = "report_type", nullable = false)
    private String reportType;

    /**
     * 来源地址
     */
    @Column(name = "source_url", nullable = false)
    private String sourceUrl;

    /**
     * 来源站点
     */
    @Column(name = "source_site", nullable = false)
    private String sourceSite;

    /**
     * 标题
     */
    @Column(name = "title", nullable = false)
    private String title;

    /**
     * 发布时间
     */
    @Column(name = "publish_date", nullable = false)
    private String publishDate;

    /**
     * 发布时间
     */
    @Column(name = "publish_datetime", nullable = false)
    @Convert(converter = LocalDateAttributeConverter.class)
    private LocalDate publishDatetime;


    /**
     * 点击数
     */
    @Column(name = "click_number", nullable = false)
    private Integer clickNumber;

    /**
     * 回复数
     */
    @Column(name = "reply_number", nullable = false)
    private Integer replyNumber;

    /**
     * 上报原因
     */
    @Column(name = "report_cause", nullable = false)
    private String reportCause;

    /**
     * 采纳时间
     */
    @Column(name = "adopt_date")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime adoptDate;

    /**
     * 采纳人
     */
    @Column(name = "adopt_user")
    private String adoptUser;

    /**
     * adopt:采纳，report:已上报
     */
    @Column(name = "adopt_state", nullable = false)
    private String adoptState;

    /**
     * 采纳意见
     */
    @Column(name = "adopt_opinion")
    private String adoptOpinion;

    /**
     * 创建时间
     */
    @Column(name = "created_date", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime createdDate;
    /**
     * 创建人
     */
    @Column(name = "created_user", nullable = false)
    private String createdUser;

    /**
     * 修改时间
     */
    @Column(name = "modified_date", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime modifiedDate;

    /**
     * 修改人
     */
    @Column(name = "modified_user", nullable = false)
    private String modifiedUser;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReportSource() {
        return reportSource;
    }

    public void setReportSource(String reportSource) {
        this.reportSource = reportSource;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public String getSourceUrl() {
        return sourceUrl;
    }

    public void setSourceUrl(String sourceUrl) {
        this.sourceUrl = sourceUrl;
    }

    public String getSourceSite() {
        return sourceSite;
    }

    public void setSourceSite(String sourceSite) {
        this.sourceSite = sourceSite;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public LocalDate getPublishDatetime() {
        return publishDatetime;
    }

    public void setPublishDatetime(LocalDate publishDatetime) {
        this.publishDatetime = publishDatetime;
    }

    public Integer getClickNumber() {
        return clickNumber;
    }

    public void setClickNumber(Integer clickNumber) {
        this.clickNumber = clickNumber;
    }

    public Integer getReplyNumber() {
        return replyNumber;
    }

    public void setReplyNumber(Integer replyNumber) {
        this.replyNumber = replyNumber;
    }

    public String getReportCause() {
        return reportCause;
    }

    public void setReportCause(String reportCause) {
        this.reportCause = reportCause;
    }

    public LocalDateTime getAdoptDate() {
        return adoptDate;
    }

    public void setAdoptDate(LocalDateTime adoptDate) {
        this.adoptDate = adoptDate;
    }

    public String getAdoptUser() {
        return adoptUser;
    }

    public void setAdoptUser(String adoptUser) {
        this.adoptUser = adoptUser;
    }

    public String getAdoptState() {
        return adoptState;
    }

    public void setAdoptState(String adoptState) {
        this.adoptState = adoptState;
    }

    public String getAdoptOpinion() {
        return adoptOpinion;
    }

    public void setAdoptOpinion(String adoptOpinion) {
        this.adoptOpinion = adoptOpinion;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    public LocalDateTime getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDateTime modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
