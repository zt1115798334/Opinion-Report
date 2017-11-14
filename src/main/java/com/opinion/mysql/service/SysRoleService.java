package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysRole;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysRoleService {

    /**
     * 保存
     *
     * @param sysRole
     * @return
     */
    SysRole save(SysRole sysRole);

    List<SysRole> findList();
}
