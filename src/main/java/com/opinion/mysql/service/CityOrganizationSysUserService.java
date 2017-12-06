package com.opinion.mysql.service;

import com.opinion.mysql.entity.CityOrganizationSysUser;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface CityOrganizationSysUserService {

    /**
     * 保存
     *
     * @param cityOrganizationSysUser
     * @return
     */
    CityOrganizationSysUser save(CityOrganizationSysUser cityOrganizationSysUser);

    /**
     * 根据用户id查询
     *
     * @param userId 用户id
     * @return
     */
    CityOrganizationSysUser findOneByUserId(Long userId);

    /**
     * 根据用户id查询
     *
     * @param userId 用户id
     * @return
     */
    Long findCityOrganizationIdByUserId(Long userId);

    /**
     * 根据省市区组织id查询
     *
     * @param cityOrganizationId 省市区组织id
     * @return
     */
    List<CityOrganizationSysUser> findListByCityOrganizationId(Long cityOrganizationId);

    /**
     * 根据用户id删除
     *
     * @param userId 用户id
     */
    void delCityOrganizationSysUser(Long userId);

    /**
     * 根据省市区组织id查询数量
     *
     * @param cityOrganizationId 省市区组织id
     * @return
     */
    long findCountByCityOrganizationId(Long cityOrganizationId);

    /**
     * 省市区组织id集合查询
     *
     * @param cityOrganizationIds 省市区组织id
     * @return
     */
    List<CityOrganizationSysUser> findListByCityOrganizationIds(List<Long> cityOrganizationIds);

}
