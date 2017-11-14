package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysUser;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysUserService {

    SysUser save(SysUser sysUser,Long roleId);

    List<SysUser> findList();

    List<SysUser> findListByRoleId(Long roleId);
}
