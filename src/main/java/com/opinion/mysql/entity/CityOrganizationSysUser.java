package com.opinion.mysql.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 系统用户省市区组织信息表
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Entity
@Table(name = "t_city_organization_sys_user")
public class CityOrganizationSysUser implements Serializable {

    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "city_organization_id", nullable = false)
    private Long cityOrganizationId;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCityOrganizationId() {
        return cityOrganizationId;
    }

    public void setCityOrganizationId(Long cityOrganizationId) {
        this.cityOrganizationId = cityOrganizationId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
