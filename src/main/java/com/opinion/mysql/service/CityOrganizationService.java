package com.opinion.mysql.service;

import com.opinion.mysql.entity.CityOrganization;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface CityOrganizationService {

    /**
     * 保存 省市区组织信息
     *
     * @param cityOrganization 省市区组织信息
     * @return
     */
    CityOrganization save(CityOrganization cityOrganization);

    /**
     * 根据id查询省市区组织信息
     *
     * @param id id
     * @return
     */
    CityOrganization findById(Long id);

    /**
     * 查询自己以及自己信息
     *
     * @param id
     * @return
     */
    CityOrganization findParentAndChildrenById(Long id);

    /**
     * 根据用户id查询省市区组织信息
     *
     * @param userId 用户id
     * @return
     */
    CityOrganization findByUserId(Long userId);

    /**
     * 根据父级id查询子级 省市区组织信息
     *
     * @param parentId 父级id
     * @return
     */
    List<CityOrganization> findByParentId(Long parentId);

    /**
     *
     * @param cityOrganization
     * @return
     */
    List<CityOrganization> findParentAndChildrenByEntity(CityOrganization cityOrganization);

    /**
     *
     * @param cityOrganization
     * @return
     */
    List<Long> findParentIdAndChildrenIdByEntity(CityOrganization cityOrganization);

    /**
     * 根据id删除 省市区组织信息
     *
     * @param id id
     * @return
     */
    boolean delCityOrganization(Long id);

    /**
     * 根据名称父级id查询是否存在
     *
     * @param name     名称
     * @param parentId 父级id
     * @param id       id
     * @return
     */
    boolean isExistByNameAndParentIdNotId(String name, Long parentId, Long id);

    /**
     * 根据父级id查询子级是否存在
     *
     * @param parentId 父级id
     * @return
     */
    boolean isExistChildByParentId(Long parentId);

}
