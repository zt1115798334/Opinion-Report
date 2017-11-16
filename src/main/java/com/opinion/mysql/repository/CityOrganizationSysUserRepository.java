package com.opinion.mysql.repository;

import com.opinion.mysql.entity.CityOrganizationSysUser;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface CityOrganizationSysUserRepository extends CrudRepository<CityOrganizationSysUser, Long> {

    CityOrganizationSysUser findByUserId(Long userId);

    List<CityOrganizationSysUser> findByCityOrganizationId(Long cityOrganizationId);

    void deleteByUserId(Long userId);

    long countByCityOrganizationId(Long cityOrganizationId);

    List<CityOrganizationSysUser> findByCityOrganizationIdIn(List<Long> cityOrganizationIds);
}
