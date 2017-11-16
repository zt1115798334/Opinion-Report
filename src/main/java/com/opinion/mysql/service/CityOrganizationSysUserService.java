package com.opinion.mysql.service;

import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.CityOrganizationSysUser;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface CityOrganizationSysUserService {

    CityOrganizationSysUser save(CityOrganizationSysUser cityOrganizationSysUser);

    CityOrganizationSysUser findOneByUserId(Long userId);

    List<CityOrganizationSysUser> findListByCityOrganizationId(Long cityOrganizationId);

    void delCityOrganizationSysUser(Long userId);

    long findCountByCityOrganizationId(Long cityOrganizationId);

    List<CityOrganizationSysUser> findListByCityOrganizationIds(List<Long> cityOrganizationIds);

}
