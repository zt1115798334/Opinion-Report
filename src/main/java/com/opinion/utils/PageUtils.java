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
     * @param sortParam  排序字段
     * @param sortType 排序方向
     */
    public static PageRequest buildPageRequest(int page, int size, String sortParam, String sortType) {
        Sort sort = null;
        if (!StringUtils.isNotBlank(sortParam)) {
            return new PageRequest(page - 1, size);
        } else if (StringUtils.isNotBlank(sortType)) {
            if (Sort.Direction.ASC.equals(sortType)) {
                sort = new Sort(Sort.Direction.ASC, sortParam);
            } else {
                sort = new Sort(Sort.Direction.DESC, sortParam);
            }
            return new PageRequest(page - 1, size, sort);
        } else {
            sort = new Sort(Sort.Direction.ASC, sortParam);
            return new PageRequest(page - 1, size, sort);
        }
    }

    public static PageRequest buildPageRequest(int page, int size, String sortParam) {
        return buildPageRequest(page, size, sortParam, null);
    }
}
