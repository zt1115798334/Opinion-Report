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

    SysUser save(SysUser sysUser);

    boolean delSysUser(Long id);

    Page<SysUser> findPageByRoleId(Long roleId, int pageNum, int pageSize);

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
     * @param id
     * @param localDateTime
     * @return
     */
    SysUser updateLocalDateTime(Long id, LocalDateTime localDateTime);


    /**
     * 根据上级id查询下级id集合
     *
     * @param parentId
     * @return
     */
    List<Long> findChildIdListByParentId(Long parentId);

    /**
     * 根据上级id查询孙子id集合
     *
     * @param parentId
     * @return
     */
    List<Long> findDescendantIdListByParentId(Long parentId);

    /**
     * 根据上级id查询子孙全部集合
     *
     * @param parentId
     * @return
     */
    List<Long> findDescendantAllIdListByParentId(Long parentId);

}
