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
 * 系统角色
 *
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Entity
@Table(name = "t_sys_role")
public class SysRole implements Serializable {
    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 角色名称
     */
    @Column(name = "role_name", nullable = false)
    private String roleName;

    /**
     * 角色类型 角色类型 0000 超级系统管理员，1 省级 2, 市级，3 县级 99 无效
     */
    @Column(name = "role_type", nullable = false)
    private String roleType;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
