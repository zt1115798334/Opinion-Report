package com.opinion.mysql.service;

import com.opinion.mysql.entity.CityOrganization;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface CityOrganizationService {

    boolean save(CityOrganization cityOrganization);

    CityOrganization findById(Long id);

    CityOrganization findByUserId(Long userId);

    List<CityOrganization> findByParentId(Long parentId);

    boolean delCityOrganization(Long id);

    boolean isExistByNameAndParentId(String name, Long parentId);

    boolean isExistChildByParentId(Long parentId);
}
