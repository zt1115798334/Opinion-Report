package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.SysRolePermission;
import com.opinion.mysql.repository.SysRolePermissionRepository;
import com.opinion.mysql.service.SysRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Transactional
@Service
public class SysRolePermissionServiceImpl implements SysRolePermissionService {

    @Autowired
    private SysRolePermissionRepository sysRolePermissionRepository;

    @Override
    public Iterable<SysRolePermission> save(List<SysRolePermission> list) {
        return sysRolePermissionRepository.save(list);
    }

    @Override
    public boolean deleteByRoleId(Long roleId) {
        sysRolePermissionRepository.deleteByRoleId(roleId);
        return true;
    }

    @Override
    public List<SysRolePermission> findByRoleId(Long roleId) {
        return sysRolePermissionRepository.findByRoleId(roleId);
    }

}
