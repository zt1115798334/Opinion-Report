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
    private String sortName;

    /**
     * 排序类型
     */
    @Transient
    private String sortOrder;

    /**
     * 页数
     */
    @Transient
    private int pageNumber;

    /**
     * 每页显示数量
     */
    @Transient
    private int pageSize;

//    @Transient
//    private LocalDateTime startDateTime;
//
//    @Transient
//    private LocalDateTime endDateTime;



    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

//    public LocalDateTime getStartDateTime() {
//        return startDateTime;
//    }
//
//    public void setStartDateTime(LocalDateTime startDateTime) {
//        this.startDateTime = startDateTime;
//    }
//
//    public LocalDateTime getEndDateTime() {
//        return endDateTime;
//    }
//
//    public void setEndDateTime(LocalDateTime endDateTime) {
//        this.endDateTime = endDateTime;
//    }
}
