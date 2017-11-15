package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.repository.CityOrganizationRepository;
import com.opinion.mysql.service.CityOrganizationService;
import com.opinion.mysql.service.CityOrganizationSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Service
public class CityOrganizationServiceImpl implements CityOrganizationService {

    @Autowired
    private CityOrganizationRepository cityOrganizationRepository;

    @Autowired
    private CityOrganizationSysUserService cityOrganizationSysUserService;

    @Override
    public CityOrganization save(CityOrganization cityOrganization) {
        return cityOrganizationRepository.save(cityOrganization);
    }

    @Override
    public CityOrganization findById(Long id) {
        return cityOrganizationRepository.findOne(id);
    }

    @Override
    public List<CityOrganization> findByParentId(Long parentId) {
        return cityOrganizationRepository.findByParentId(parentId);
    }

    @Override
    public boolean delCityOrganization(Long id) {
        long userCount = cityOrganizationSysUserService.findCountByCityOrganizationId(id);
        if (userCount > 0) {
            return false;
        } else {
            cityOrganizationRepository.delete(id);
            return true;
        }
    }
}
