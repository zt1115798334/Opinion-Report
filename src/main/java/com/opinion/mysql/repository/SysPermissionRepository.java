package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysPermission;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysPermissionRepository extends CrudRepository<SysPermission, Long> {

    List<SysPermission> findByCodeIn(List<String> codes);
}
