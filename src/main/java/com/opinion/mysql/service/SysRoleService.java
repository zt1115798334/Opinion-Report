package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysRole;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysRoleService {

    /**
     * 保存
     *
     * @param sysRole
     * @return
     */
    boolean save(SysRole sysRole);

    List<SysRole> findList();

    Page<SysRole> findPage(String keyword, int pageNum, int pageSize);

    List<SysRole> findListByUserId(Long userId);

    boolean delSysRole(Long id);

    boolean isExistByRoleName(String roleName);
}
