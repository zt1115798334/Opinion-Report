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
@Table(name = "t_report_article_log")
public class ReportArticleLog extends BaseSortRequest implements Serializable {

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
     * 采纳时间
     */
    @Column(name = "adopt_datetime")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime adoptDatetime;

    /**
     * 采纳人
     */
    @Column(name = "adopt_user_id")
    private Long adoptUserId;

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
     * 创建日期
     */
    @Column(name = "created_date", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Convert(converter = LocalDateAttributeConverter.class)
    private LocalDate createdDate;

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

//    @Transient
//    private String userName;

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

    public LocalDateTime getAdoptDatetime() {
        return adoptDatetime;
    }

    public void setAdoptDatetime(LocalDateTime adoptDatetime) {
        this.adoptDatetime = adoptDatetime;
    }

    public Long getAdoptUserId() {
        return adoptUserId;
    }

    public void setAdoptUserId(Long adoptUserId) {
        this.adoptUserId = adoptUserId;
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

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
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

//    public String getUserName() {
//        return userName;
//    }
//
//    public void setUserName(String userName) {
//        this.userName = userName;
//    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
