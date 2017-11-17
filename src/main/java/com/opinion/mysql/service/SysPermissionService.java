package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysPermission;
import com.opinion.mysql.entity.SysRolePermission;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysPermissionService {

    List<SysPermission> findAll();

    boolean saveSysRolePermission(List<String> codes,Long roleId);



}
