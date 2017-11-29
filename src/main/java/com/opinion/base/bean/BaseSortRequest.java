package com.opinion.base.bean;


import javax.persistence.Transient;
import java.time.LocalDateTime;

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
