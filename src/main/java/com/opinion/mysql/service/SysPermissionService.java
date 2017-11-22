package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysPermission;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysPermissionService {

    /**
     * 查询全部
     *
     * @return
     */
    List<SysPermission> findAll();

    /**
     * 根据编号 角色id批量保存
     *
     * @param codes
     * @param roleId
     * @return
     */
    boolean saveSysRolePermission(List<String> codes, Long roleId);

    /**
     * 根据角色id和类型查询
     *
     * @param roleId
     * @param type
     * @return
     */
    List<SysPermission> findListByRoleIdAndType(Long roleId, String type);

    /**
     * 根据父级id查询
     *
     * @param parentId 父级id
     * @return
     */
    List<SysPermission> findListByParentId(Long parentId);

}
