package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysRoleUser;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface SysRoleUserService {

    /**
     * 保存
     *
     * @param sysRoleUser
     * @return
     */
    SysRoleUser save(SysRoleUser sysRoleUser);

    /**
     * 根据角色id查询
     *
     * @param roleId 角色id
     * @return
     */
    List<SysRoleUser> findByRoleId(Long roleId);

    /**
     * 根据用户id查询
     *
     * @param userId 用户id
     * @return
     */
    SysRoleUser findByUserId(Long userId);

    /**
     * 根据用户id和角色id查询
     *
     * @param roleId 角色id
     * @param userId 用户id
     * @return
     */
    SysRoleUser findByRoleIdAndUserId(Long roleId, Long userId);

    /**
     * 根据用户id删除
     *
     * @param userId 用户id
     */
    void delSysRoleUser(Long userId);

    /**
     * 根据角色id查询数量
     *
     * @param roleId 角色id
     * @return
     */
    long findCountByRoleId(Long roleId);
}
