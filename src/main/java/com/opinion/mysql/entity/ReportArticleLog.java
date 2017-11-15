package com.opinion.mysql.entity;

import com.opinion.base.bean.BaseSortRequest;
import com.opinion.mysql.converter.LocalDateTimeAttributeConverter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
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
     * 上传文章id
     */
    @Column(name = "report_article_id")
    private Long reportArticleId;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getReportArticleId() {
        return reportArticleId;
    }

    public void setReportArticleId(Long reportArticleId) {
        this.reportArticleId = reportArticleId;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
