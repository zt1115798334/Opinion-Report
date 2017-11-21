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
 * 下达通知表
 *
 * @author zhangtong
 * Created by on 2017/11/16
 */
@Entity
@Table(name = "t_issued_notice")
public class IssuedNotice extends BaseSortRequest implements Serializable {

    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 通知编号
     */
    @Column(name = "notice_code", nullable = false)
    private String noticeCode;

    /**
     * 通知标题
     */
    @Column(name = "title", nullable = false)
    private String title;

    /**
     * 发布时间
     */
    @Column(name = "publish_datetime", nullable = false)
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime publishDatetime;

    /**
     * 通知类型 重要通知 ：importantNotice 工作安排 :workArrangement 工作建议 :workSuggestion 其他：other
     */
    @Column(name = "notice_type", nullable = false)
    private String noticeType;

    /**
     * 下发范围 municipal：市级  county 县级  all 全部
     */
    @Column(name = "notice_range", nullable = false)
    private String noticeRange;

    /**
     * 通知内容
     */
    @Column(name = "notice_content", nullable = false)
    private String noticeContent;
    /**
     * 回执状态 unreceipt:未回执,receipt:以回执 receipting:中回执中
     */
    @Column(name = "receipt_state", nullable = false)
    private String receiptState;
    /**
     * 回执时间
     */
    @Column(name = "receipt_datetime")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime receiptDatetime;

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
     * 创建人Id
     */
    @Column(name = "created_user_id", nullable = false)
    private Long createdUserId;
    /**
     * 修改时间
     */
    @Column(name = "modified_date", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Convert(converter = LocalDateAttributeConverter.class)
    private LocalDate modifiedDate;
    /**
     * 修改时间
     */
    @Column(name = "modified_datetime", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime modifiedDatetime;
    /**
     * 修改人Id
     */
    @Column(name = "modified_user_id", nullable = false)
    private Long modifiedUserId;

    @Transient
    private Long receiptUserId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNoticeCode() {
        return noticeCode;
    }

    public void setNoticeCode(String noticeCode) {
        this.noticeCode = noticeCode;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDateTime getPublishDatetime() {
        return publishDatetime;
    }

    public void setPublishDatetime(LocalDateTime publishDatetime) {
        this.publishDatetime = publishDatetime;
    }

    public String getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(String noticeType) {
        this.noticeType = noticeType;
    }

    public String getNoticeRange() {
        return noticeRange;
    }

    public void setNoticeRange(String noticeRange) {
        this.noticeRange = noticeRange;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public String getReceiptState() {
        return receiptState;
    }

    public void setReceiptState(String receiptState) {
        this.receiptState = receiptState;
    }

    public LocalDateTime getReceiptDatetime() {
        return receiptDatetime;
    }

    public void setReceiptDatetime(LocalDateTime receiptDatetime) {
        this.receiptDatetime = receiptDatetime;
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

    public LocalDate getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDate modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public LocalDateTime getModifiedDatetime() {
        return modifiedDatetime;
    }

    public void setModifiedDatetime(LocalDateTime modifiedDatetime) {
        this.modifiedDatetime = modifiedDatetime;
    }

    public Long getModifiedUserId() {
        return modifiedUserId;
    }

    public void setModifiedUserId(Long modifiedUserId) {
        this.modifiedUserId = modifiedUserId;
    }

    public Long getReceiptUserId() {
        return receiptUserId;
    }

    public void setReceiptUserId(Long receiptUserId) {
        this.receiptUserId = receiptUserId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
