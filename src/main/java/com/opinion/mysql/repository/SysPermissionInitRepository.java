package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysPermissionInit;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysPermissionInitRepository extends CrudRepository<SysPermissionInit, Long> {

    List<SysPermissionInit> findAll(Sort sort);
}
