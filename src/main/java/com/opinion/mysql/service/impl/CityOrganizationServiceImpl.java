package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.CityOrganizationSysUser;
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
    public boolean save(CityOrganization cityOrganization) {
        String name = cityOrganization.getName();
        Long parentId = cityOrganization.getParentId();
        boolean isExist = isExistByNameAndParentId(name, parentId);
        if (isExist) {
            return false;

        } else {
            cityOrganizationRepository.save(cityOrganization);
            return true;
        }
    }

    @Override
    public CityOrganization findById(Long id) {
        return cityOrganizationRepository.findOne(id);
    }

    @Override
    public CityOrganization findAndChildById(Long id) {
        CityOrganization cityOrganization = this.findById(id);
        if (this.isExistChildByParentId(id)) {
            List<CityOrganization> cityOrganizations = this.findByParentId(id);
            cityOrganizations.stream().forEach(co -> findAndChildById(co.getId()));
            cityOrganization.setChildInfo(cityOrganizations);
        }
        return cityOrganization;
    }

    @Override
    public CityOrganization findByUserId(Long userId) {
        CityOrganizationSysUser cityOrganizationSysUser = cityOrganizationSysUserService.findOneByUserId(userId);
        CityOrganization cityOrganization = null;
        if (cityOrganizationSysUser != null) {
            cityOrganization = findById(cityOrganizationSysUser.getCityOrganizationId());
        }
        return cityOrganization;
    }

    @Override
    public List<CityOrganization> findByParentId(Long parentId) {
        return cityOrganizationRepository.findByParentId(parentId);
    }

    @Override
    public boolean delCityOrganization(Long id) {
        long userCount = cityOrganizationSysUserService.findCountByCityOrganizationId(id);
        boolean isExistChild = isExistChildByParentId(id);
        if (userCount > 0 || isExistChild) {
            return false;
        } else {
            cityOrganizationRepository.delete(id);
            return true;
        }
    }

    @Override
    public boolean isExistByNameAndParentId(String name, Long parentId) {
        CityOrganization isExist = cityOrganizationRepository.findByNameAndParentId(name, parentId);
        return isExist != null;
    }

    @Override
    public boolean isExistChildByParentId(Long parentId) {
        List<CityOrganization> cityOrganizations = cityOrganizationRepository.findByParentId(parentId);
        return cityOrganizations.size() != 0;
    }
}
