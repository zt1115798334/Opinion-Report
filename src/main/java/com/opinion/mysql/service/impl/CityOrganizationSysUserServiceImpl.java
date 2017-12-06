package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.CityOrganizationSysUser;
import com.opinion.mysql.repository.CityOrganizationSysUserRepository;
import com.opinion.mysql.service.CityOrganizationSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Transactional
@Service
public class CityOrganizationSysUserServiceImpl implements CityOrganizationSysUserService {

    @Autowired
    private CityOrganizationSysUserRepository cityOrganizationSysUserRepository;

    @Override
    public CityOrganizationSysUser save(CityOrganizationSysUser cityOrganizationSysUser) {
        return cityOrganizationSysUserRepository.save(cityOrganizationSysUser);
    }

    @Override
    public CityOrganizationSysUser findOneByUserId(Long userId) {
        return cityOrganizationSysUserRepository.findByUserId(userId);

    }

    @Override
    public Long findCityOrganizationIdByUserId(Long userId) {
        Long cityOrganizationId = 0L;
        CityOrganizationSysUser cityOrganizationSysUser = this.findOneByUserId(userId);
        if (cityOrganizationSysUser != null) {
            cityOrganizationId = cityOrganizationSysUser.getCityOrganizationId();
        }
        return cityOrganizationId;
    }

    @Override
    public List<CityOrganizationSysUser> findListByCityOrganizationId(Long cityOrganizationId) {
        return cityOrganizationSysUserRepository.findByCityOrganizationId(cityOrganizationId);
    }

    @Override
    public void delCityOrganizationSysUser(Long userId) {
        cityOrganizationSysUserRepository.deleteByUserId(userId);
    }

    @Override
    public long findCountByCityOrganizationId(Long cityOrganizationId) {
        return cityOrganizationSysUserRepository.countByCityOrganizationId(cityOrganizationId);
    }

    @Override
    public List<CityOrganizationSysUser> findListByCityOrganizationIds(List<Long> cityOrganizationIds) {
        return cityOrganizationSysUserRepository.findByCityOrganizationIdIn(cityOrganizationIds);
    }

}
