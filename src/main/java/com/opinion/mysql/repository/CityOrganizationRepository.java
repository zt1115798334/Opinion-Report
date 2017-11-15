package com.opinion.mysql.repository;

import com.opinion.mysql.entity.CityOrganization;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface CityOrganizationRepository extends CrudRepository<CityOrganization, Long> {

    List<CityOrganization> findByParentId(Long parentId);
}
