package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysPermissionInit;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysPermissionInitService {

    /**
     * 查询全部
     *
     * @return
     */
    List<SysPermissionInit> findAll();
}
