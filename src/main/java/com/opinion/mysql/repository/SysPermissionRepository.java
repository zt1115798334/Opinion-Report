package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysPermission;
import org.springframework.data.repository.CrudRepository;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysPermissionRepository extends CrudRepository<SysPermission, Long> {
}
