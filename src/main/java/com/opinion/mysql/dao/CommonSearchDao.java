package com.opinion.mysql.dao;

import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.entity.SysUser;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @author zhangtong
 */
public interface CommonSearchDao {

    /**
     * 根据账户id查询权限
     * @param userId 用户id
     * @return
     */
    List<SysRole> findSysRoleListByUserId(Long userId);

    /**
     * 根据角色id查询用户信息
     * @param roleId 角色id
     * @return
     */
    List<SysUser> findSysUserListByRoleId(Long roleId);

}
