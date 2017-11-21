package com.opinion.mysql.entity;

import com.opinion.mysql.converter.LocalDateAttributeConverter;
import com.opinion.mysql.converter.LocalDateTimeAttributeConverter;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 系统消息表
 * @author zhangtong
 * Created by on 2017/11/21
 */
@Entity
@Table(name = "t_sys_message")
public class SysMessage implements Serializable {
    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 关联人id
     */
    @Column(name = "relation_user_id", nullable = false)
    private Long relationUserId;

    /**
     * 标题
     */
    @Column(name = "title", nullable = false)
    private String title;

    /**
     * 副标题
     */
    @Column(name = "subtitle", nullable = false)
    private String subtitle;

    /**
     * 内容
     */
    @Column(name = "content")
    private String content;

    /**
     * 类型
     */
    @Column(name = "type", nullable = false)
    private String type;

    /**
     * url
     */
    @Column(name = "url", nullable = false)
    private String url;

    /**
     * 状态 unread:未读，read:已读
     */
    @Column(name = "status", nullable = false)
    private String status;

    /**
     * 发布日期
     */
    @Column(name = "publish_date", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Convert(converter = LocalDateAttributeConverter.class)
    private LocalDate publishDate;

    /**
     * 发布时间
     */
    @Column(name = "publish_datetime", nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime publishDatetime;

    /**
     * 发布人Id
     */
    @Column(name = "publish_user_id", nullable = false)
    private Long publishUserId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRelationUserId() {
        return relationUserId;
    }

    public void setRelationUserId(Long relationUserId) {
        this.relationUserId = relationUserId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(LocalDate publishDate) {
        this.publishDate = publishDate;
    }

    public LocalDateTime getPublishDatetime() {
        return publishDatetime;
    }

    public void setPublishDatetime(LocalDateTime publishDatetime) {
        this.publishDatetime = publishDatetime;
    }

    public Long getPublishUserId() {
        return publishUserId;
    }

    public void setPublishUserId(Long publishUserId) {
        this.publishUserId = publishUserId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
