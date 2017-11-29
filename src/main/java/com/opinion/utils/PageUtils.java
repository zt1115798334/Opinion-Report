package com.opinion.utils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public class PageUtils {
    /**
     * @param page      当前页
     * @param size      每页条数
     * @param sortName  排序字段
     * @param sortOrder 排序方向
     */
    public static PageRequest buildPageRequest(int page, int size, String sortName, String sortOrder) {
        Sort sort = null;
        if (!StringUtils.isNotBlank(sortName)) {
            return new PageRequest(page - 1, size);
        } else if (StringUtils.isNotBlank(sortOrder)) {
            if (sortOrder.equalsIgnoreCase(Sort.Direction.ASC.toString())) {
                sort = new Sort(Sort.Direction.ASC, sortName);
            } else {
                sort = new Sort(Sort.Direction.DESC, sortName);
            }
            return new PageRequest(page - 1, size, sort);
        } else {
            sort = new Sort(Sort.Direction.ASC, sortName);
            return new PageRequest(page - 1, size, sort);
        }
    }

    public static PageRequest buildPageRequest(int page, int size, String sortName) {
        return buildPageRequest(page, size, sortName, null);
    }
}
