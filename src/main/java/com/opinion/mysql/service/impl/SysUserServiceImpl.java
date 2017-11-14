package com.opinion.mysql.service.impl;

import com.opinion.mysql.dao.CommonSearchDao;
import com.opinion.mysql.entity.SysRoleUser;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.repository.SysRoleUserRepository;
import com.opinion.mysql.repository.SysUserRepository;
import com.opinion.mysql.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserRepository sysUserRepository;

    @Autowired
    private SysRoleUserRepository sysRoleUserRepository;

    @Autowired
    private CommonSearchDao commonSearchDao;

    @Override
    public SysUser save(SysUser sysUser, Long roleId) {
        sysUser = sysUserRepository.save(sysUser);
        SysRoleUser sysRoleUser = new SysRoleUser();
        sysRoleUser.setRoleId(roleId);
        sysRoleUser.setUserId(sysUser.getId());
        return sysUser;
    }

    @Override
    public List<SysUser> findList() {
        return (List<SysUser>) sysUserRepository.findAll();
    }

    @Override
    public List<SysUser> findListByRoleId(Long roleId) {
        return commonSearchDao.findSysUserListByRoleId(roleId);
    }

    @Override
    public SysUser findByUserAccountAndUserPassword(String userAccount, String userPassword) {
        return sysUserRepository.findByUserAccountAndUserPassword(userAccount, userPassword);
    }

    @Override
    public SysUser updateLocalDateTime(Long id, LocalDateTime localDateTime) {
        SysUser sysUser = sysUserRepository.findOne(id);
        if (sysUser != null) {
            sysUser.setLastLoginTime(localDateTime);
            sysUser = sysUserRepository.save(sysUser);
        }
        return sysUser;
    }
}
