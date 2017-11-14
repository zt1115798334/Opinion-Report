package com.opinion.mysql.dao;

import com.opinion.mysql.entity.SysUser;

import java.util.List;

/**
 * @author zhangtong
 */
public interface CommonSearchDao {

    List<SysUser> findSysUserListByRoleId(Long roleId);
}
