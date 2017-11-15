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

    /**
     * 页数
     */
    @Transient
    private int pageNum;

    /**
     * 每页显示数量
     */
    @Transient
    private int pageSize;


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

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
