package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysRole;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysRoleRepository extends CrudRepository<SysRole, Long>, JpaSpecificationExecutor<SysRole> {

    SysRole findByRoleName(String roleName);

}
