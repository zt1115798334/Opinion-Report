package com.opinion.base.controller;

import com.opinion.base.bean.AjaxResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <p>Title: BaseController</p>
 * <p>Description: 提供公共接口方法的基础控制器类</p>
 *
 * @author zhangtong
 * @date 2017年6月19日
 */
public abstract class BaseController {

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    protected AjaxResult success(Object data) {
        return AjaxResult.success(data);
    }

    protected AjaxResult success(String message) {
        return AjaxResult.success(message);
    }

    protected AjaxResult success(String message, Object data) {
        return AjaxResult.success(message, data);
    }

    protected AjaxResult fail(String message) {
        return AjaxResult.fail(message);
    }

    protected AjaxResult fail(int status, String message) {
        return AjaxResult.fail(status, message);
    }

}
