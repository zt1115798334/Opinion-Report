package com.opinion.mysql.service.impl;

import com.opinion.mysql.dao.CommonSearchDao;
import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.repository.SysRoleRepository;
import com.opinion.mysql.service.SysRoleService;
import com.opinion.mysql.service.SysRoleUserService;
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

    @Autowired
    private SysRoleUserService sysRoleUserService;

    @Autowired
    private CommonSearchDao commonSearchDao;

    @Override
    public SysRole save(SysRole sysRole) {
        return sysRoleRepository.save(sysRole);
    }

    @Override
    public List<SysRole> findList() {
        return (List<SysRole>) sysRoleRepository.findAll();
    }

    @Override
    public List<SysRole> findListByUserId(Long userId) {
        return commonSearchDao.findSysRoleListByUserId(userId);
    }

    @Override
    public boolean delSysRole(Long id) {
        long userCount = sysRoleUserService.findCountByRoleId(id);
        if (userCount > 0) {
            return false;
        } else {
            sysRoleRepository.delete(id);
            return true;
        }
    }
}
