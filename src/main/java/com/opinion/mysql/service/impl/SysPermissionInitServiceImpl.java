package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.SysPermissionInit;
import com.opinion.mysql.repository.SysPermissionInitRepository;
import com.opinion.mysql.service.SysPermissionInitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Service
public class SysPermissionInitServiceImpl implements SysPermissionInitService {

    @Autowired
    private SysPermissionInitRepository sysPermissionInitRepository;

    @Override
    public List<SysPermissionInit> findAll() {
        return (List<SysPermissionInit>) sysPermissionInitRepository.findAll();
    }
}
