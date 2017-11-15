package com.opinion.mysql.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 省市区信息表
 *
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Entity
@Table(name = "t_city")
public class City implements Serializable {

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
     * 首字母
     */
    @Column(name = "first_letter", nullable = false)
    private String firstLetter;

    /**
     * 城市等级
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

    public String getFirstLetter() {
        return firstLetter;
    }

    public void setFirstLetter(String firstLetter) {
        this.firstLetter = firstLetter;
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
