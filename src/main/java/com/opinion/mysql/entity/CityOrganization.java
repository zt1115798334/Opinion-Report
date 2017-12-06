package com.opinion.mysql.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * 省市区组织信息表
 *
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Entity
@Table(name = "t_city_organization")
public class CityOrganization implements Serializable {

    private static final long serialVersionUID = 9201034849892179274L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 行政代码
     */
    @Column(name = "code")
    private String code;


    /**
     * 名称
     */
    @Column(name = "name", nullable = false)
    private String name;

    /**
     * 父id
     */
    @Column(name = "p_id", nullable = false)
    private Long pId;

    /**
     * 城市等级 0 全部， 1 省级 2 市级 3 县级 99 无效
     */
    @Column(name = "level", nullable = false)
    private Integer level;

    @Transient
    List<CityOrganization> children;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public List<CityOrganization> getChildren() {
        return children;
    }

    public void setChildren(List<CityOrganization> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
