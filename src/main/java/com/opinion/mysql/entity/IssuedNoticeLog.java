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
 * 下达通知日志表
 *
 * @author zhangtong
 * Created by on 2017/11/16
 */
@Entity
@Table(name = "t_issued_notice_log")
public class IssuedNoticeLog extends BaseSortRequest implements Serializable {
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
     * unread:未读，read:已读 ,receipt:回执
     */
    @Column(name = "receipt_state", nullable = false)
    private String receiptState;

    /**
     * 回执日期
     */
    @Column(name = "receipt_date")
    @Convert(converter = LocalDateAttributeConverter.class)
    private LocalDate receiptDate;

    /**
     * 回执时间
     */
    @Column(name = "receipt_datetime")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime receiptDatetime;

    /**
     * 回执人id
     */
    @Column(name = "receipt_user_id", nullable = false)
    private Long receiptUserId;

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

    public String getReceiptState() {
        return receiptState;
    }

    public void setReceiptState(String receiptState) {
        this.receiptState = receiptState;
    }

    public LocalDate getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(LocalDate receiptDate) {
        this.receiptDate = receiptDate;
    }

    public LocalDateTime getReceiptDatetime() {
        return receiptDatetime;
    }

    public void setReceiptDatetime(LocalDateTime receiptDatetime) {
        this.receiptDatetime = receiptDatetime;
    }

    public Long getReceiptUserId() {
        return receiptUserId;
    }

    public void setReceiptUserId(Long receiptUserId) {
        this.receiptUserId = receiptUserId;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
