package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysRoleUser;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface SysRoleUserService {

    SysRoleUser save(SysRoleUser sysRoleUser);

    List<SysRoleUser> findByRoleId(Long roleId);

    SysRoleUser findByUserId(Long userId);

    void delSysRoleUser(Long userId);

    long findCountByRoleId(Long roleId);
}
