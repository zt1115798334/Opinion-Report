package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysUserRepository extends CrudRepository<SysUser, Long>, JpaSpecificationExecutor<SysUser> {

    @Override
    Page<SysUser> findAll(Specification<SysUser> specification, Pageable pageable);

    SysUser findByUserAccount(String userAccount);

    SysUser findByUserAccountAndUserPassword(String userAccount, String userPassword);

}
