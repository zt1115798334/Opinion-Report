package com.opinion.base.bean;


import javax.persistence.Transient;

/**
 * @author zhangtong
 */
public abstract class BaseSortRequest {

    /**
     * 需要排序的字段
     */
    @Transient
    private String sortParam;

    /**
     * 排序类型
     */
    @Transient
    private String sortType;


    public String getSortParam() {
        return sortParam;
    }

    public void setSortParam(String sortParam) {
        this.sortParam = sortParam;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }
}
