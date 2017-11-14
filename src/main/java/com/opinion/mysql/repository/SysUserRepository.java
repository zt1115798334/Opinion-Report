package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysUser;
import org.springframework.data.repository.CrudRepository;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysUserRepository extends CrudRepository<SysUser,Long> {
}
