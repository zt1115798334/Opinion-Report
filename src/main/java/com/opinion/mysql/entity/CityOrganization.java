package com.opinion.mysql.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;

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
    @Column(name = "code", nullable = false)
    private String code;


    /**
     * 名称
     */
    @Column(name = "name", nullable = false)
    private String name;

    /**
     * 父id
     */
    @Column(name = "parent_id", nullable = false)
    private Long parentId;

    /**
     * 城市等级 0 全部， 1 省级 2 市级 3 县级
     */
    @Column(name = "level", nullable = false)
    private Integer level;

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

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
