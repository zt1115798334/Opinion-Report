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

    /**
     * 查询全部
     *
     * @return
     */
    List<SysRole> findList();

    /**
     * 分页查询
     *
     * @param keyword  关键字
     * @param pageNum  页数
     * @param pageSize 数量
     * @return
     */
    Page<SysRole> findPage(String keyword, int pageNum, int pageSize);

    /**
     * 根据用户id查询
     *
     * @param userId 用户id
     * @return
     */
    List<SysRole> findListByUserId(Long userId);

    /**
     * 根据id删除
     *
     * @param id id
     * @return
     */
    boolean delSysRole(Long id);

    /**
     * 根据角色名称判断是否存在
     *
     * @param roleName
     * @return
     */
    boolean isExistByRoleName(String roleName);
}
