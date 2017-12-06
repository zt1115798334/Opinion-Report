package com.opinion.mysql.service.impl;

import com.google.common.collect.Lists;
import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.CityOrganizationSysUser;
import com.opinion.mysql.repository.CityOrganizationRepository;
import com.opinion.mysql.service.CityOrganizationService;
import com.opinion.mysql.service.CityOrganizationSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
        Long id = cityOrganization.getId();
        if (id != null) {
            //更新
            boolean isExist = isExistByNameAndParentIdNotId(cityOrganization.getName(), cityOrganization.getParentId(), id);
            if (isExist) {
                //存在
                return null;
            } else {
                //不存在
                CityOrganization oldCityOrganization = cityOrganizationRepository.findOne(id);
                oldCityOrganization.setName(cityOrganization.getName());
                return cityOrganizationRepository.save(oldCityOrganization);
            }
        } else {
            return cityOrganizationRepository.save(cityOrganization);
        }
    }

    @Override
    public CityOrganization findById(Long id) {
        return cityOrganizationRepository.findOne(id);
    }

    @Override
    public CityOrganization findParentAndChildrenById(Long id) {
        CityOrganization cityOrganization = this.findById(id);
        if (this.isExistChildByParentId(id)) {
            List<CityOrganization> cityOrganizations = this.findByParentId(id);
            cityOrganizations.stream().forEach(co -> findParentAndChildrenById(co.getId()));
            cityOrganization.setChildren(cityOrganizations);
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
    public List<CityOrganization> findParentAndChildrenByEntity(CityOrganization cityOrganization) {
        List<CityOrganization> result = Lists.newArrayList();
        List<CityOrganization> childrens = cityOrganization.getChildren();
        if (childrens != null && childrens.size() != 0) {
            childrens.stream().forEach(child -> result.addAll(this.findParentAndChildrenByEntity(child)));
        }
        result.add(cityOrganization);
        return result;
    }

    @Override
    public List<Long> findParentIdAndChildrenIdByEntity(CityOrganization cityOrganization) {
        List<CityOrganization> parentAndChildren = this.findParentAndChildrenByEntity(cityOrganization);
        List<Long> result = parentAndChildren.stream().map(CityOrganization::getId).collect(Collectors.toList());
        return result;
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
    public boolean isExistByNameAndParentIdNotId(String name, Long parentId, Long id) {
        CityOrganization isExist = cityOrganizationRepository.findByNameAndParentIdAndIdNot(name, parentId, id);
        return isExist != null;
    }

    @Override
    public boolean isExistChildByParentId(Long parentId) {
        List<CityOrganization> cityOrganizations = cityOrganizationRepository.findByParentId(parentId);
        return cityOrganizations.size() != 0;
    }
}
