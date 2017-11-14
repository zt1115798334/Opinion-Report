package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.repository.SysRoleRepository;
import com.opinion.mysql.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    private SysRoleRepository sysRoleRepository;

    @Override
    public SysRole save(SysRole sysRole) {
        return sysRoleRepository.save(sysRole);
    }

    @Override
    public List<SysRole> findList() {
        return (List<SysRole>) sysRoleRepository.findAll();
    }
}
