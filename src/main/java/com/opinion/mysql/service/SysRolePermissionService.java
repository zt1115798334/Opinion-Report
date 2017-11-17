package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysRolePermission;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysRolePermissionService {

    Iterable<SysRolePermission> save(List<SysRolePermission> list);

    boolean deleteByRoleId(Long roleId);

    List<SysRolePermission> findByRoleId(Long roleId);
}
