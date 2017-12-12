package com.opinion.base.bean;

import java.io.Serializable;

/**
 * @author zhangtong
 * Created by on 2017/11/17
 */
public class BaseAjaxResult implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -7732195625549348333L;
    private int status;
    private String message;

    public BaseAjaxResult() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSuccess() {
        return (getStatus() == 0);
    }

}
