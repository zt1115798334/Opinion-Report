package com.opinion.mysql.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 系统访问认证表
 *
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Entity
@Table(name = "t_sys_permission")
public class SysPermission implements Serializable {
    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * url地址
     */
    @Column(name = "sys_url")
    private String sysUrl;

    /**
     * url名称
     */
    @Column(name = "url_name", nullable = false)
    private String urlName;

    /**
     * display：显示权限   operation 操作权限
     */
    @Column(name = "type", nullable = false)
    private String type;

    /**
     * 描述
     */
    @Column(name = "describe")
    private String describe;
    /**
     * 标示
     */
    @Column(name = "sn")
    private Integer sn;

    /**
     * 父id
     */
    @Column(name = "parent_id")
    private Long parentId;

    /**
     * display：显示权限   operation 操作权限
     */
    @Column(name = "code", nullable = false)
    private String code;

    @Column(name = "icon")
    private String icon;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSysUrl() {
        return sysUrl;
    }

    public void setSysUrl(String sysUrl) {
        this.sysUrl = sysUrl;
    }

    public String getUrlName() {
        return urlName;
    }

    public void setUrlName(String urlName) {
        this.urlName = urlName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
