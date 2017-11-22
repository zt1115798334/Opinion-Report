package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysUser;
import org.springframework.data.domain.Page;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface SysUserService {

    /**
     * 保存
     *
     * @param sysUser
     * @return
     */
    boolean save(SysUser sysUser);

    /**
     * 根据id查询
     *
     * @param id id
     * @return
     */
    SysUser findById(Long id);

    /**
     * 根据id删除
     *
     * @param id id
     * @return
     */
    boolean delSysUser(Long id);

    /**
     * 判断账户是否存在
     *
     * @param userAccount 账户
     * @return
     */
    boolean isExistByUserAccount(String userAccount);

    /**
     * 根据 角色id分页查询
     *
     * @param roleId   角色id
     * @param pageNum  页数
     * @param pageSize 数量
     * @param userName 用户名称
     * @return
     */
    Page<SysUser> findPageByRoleId(Long roleId, int pageNum, int pageSize, String userName);

    /**
     * 根据 机构id分页查询
     *
     * @param cityOrganizationId 角色id
     * @param pageNum            页数
     * @param pageSize           数量
     * @return
     */
    Page<SysUser> findPageByCityOrganizationId(Long cityOrganizationId, int pageNum, int pageSize);

    /**
     * 根据账户密码查询账户信息
     *
     * @param userAccount  账户
     * @param userPassword
     * @return
     */
    SysUser findByUserAccountAndUserPassword(String userAccount, String userPassword);

    /**
     * 更新最后一次登录时间
     *
     * @param id            id
     * @param localDateTime 最后一次登录时间
     * @return
     */
    SysUser updateLocalDateTime(Long id, LocalDateTime localDateTime);

    /**
     * 根据上级id查询下级id集合
     *
     * @param parentId 父级id
     * @return
     */
    List<Long> findChildIdListByParentId(Long parentId);

    /**
     * 根据上级id查询孙子id集合
     *
     * @param parentId 父级id
     * @return
     */
    List<Long> findDescendantIdListByParentId(Long parentId);

    /**
     * 根据上级id查询子孙全部集合
     *
     * @param parentId 父级id
     * @return
     */
    List<Long> findDescendantAllIdListByParentId(Long parentId);

}
