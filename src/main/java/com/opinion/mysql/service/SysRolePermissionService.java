package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysRolePermission;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysRolePermissionService {

    /**
     * 批量保存
     *
     * @param list
     * @return
     */
    Iterable<SysRolePermission> save(List<SysRolePermission> list);

    /**
     * 根据角色id删除
     *
     * @param roleId 角色id
     * @return
     */
    boolean deleteByRoleId(Long roleId);

    /**
     * 根据角色id查询
     *
     * @param roleId 角色id
     * @return
     */
    List<SysRolePermission> findByRoleId(Long roleId);
}
