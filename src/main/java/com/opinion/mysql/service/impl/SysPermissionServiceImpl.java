package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.SysPermission;
import com.opinion.mysql.entity.SysRolePermission;
import com.opinion.mysql.repository.SysPermissionRepository;
import com.opinion.mysql.service.SysPermissionService;
import com.opinion.mysql.service.SysRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Service
public class SysPermissionServiceImpl implements SysPermissionService {

    @Autowired
    private SysPermissionRepository sysPermissionRepository;

    @Autowired
    private SysRolePermissionService sysRolePermissionService;

    @Override
    public List<SysPermission> findAll() {
        return (List<SysPermission>) sysPermissionRepository.findAll();
    }

    @Override
    public boolean saveSysRolePermission(List<String> codes, Long roleId) {
        sysRolePermissionService.deleteByRoleId(roleId);
        List<SysPermission> sysPermissions = sysPermissionRepository.findByCodeIn(codes);
        List<SysRolePermission> sysRolePermissions = sysPermissions.stream()
                .map(sysPermission -> {
                    SysRolePermission sysRolePermission = new SysRolePermission();
                    sysRolePermission.setPermissionId(sysPermission.getId());
                    sysRolePermission.setRoleId(roleId);
                    return sysRolePermission;
                }).collect(Collectors.toList());
        sysRolePermissionService.save(sysRolePermissions);
        return false;
    }
}
