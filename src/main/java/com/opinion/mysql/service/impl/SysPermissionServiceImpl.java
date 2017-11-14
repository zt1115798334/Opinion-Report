package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.SysPermission;
import com.opinion.mysql.repository.SysPermissionRepository;
import com.opinion.mysql.service.SysPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Service
public class SysPermissionServiceImpl implements SysPermissionService {

    @Autowired
    private SysPermissionRepository sysPermissionRepository;

    @Override
    public List<SysPermission> findAll() {
        return (List<SysPermission>) sysPermissionRepository.findAll();
    }
}
