package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysRoleUser;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
public interface SysRoleUserRepository extends CrudRepository<SysRoleUser, Long> {

    List<SysRoleUser> findByRoleId(Long roleId);

    SysRoleUser findByUserId(Long userId);

    SysRoleUser findByRoleIdAndUserId(Long roleId, Long userId);

    void deleteByUserId(Long userId);

    long countByRoleId(Long roleId);
}
