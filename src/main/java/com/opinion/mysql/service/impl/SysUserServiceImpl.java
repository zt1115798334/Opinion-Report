package com.opinion.mysql.service.impl;

import com.opinion.mysql.dao.CommonSearchDao;
import com.opinion.mysql.entity.CityOrganizationSysUser;
import com.opinion.mysql.entity.SysRoleUser;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.repository.SysUserRepository;
import com.opinion.mysql.service.CityOrganizationSysUserService;
import com.opinion.mysql.service.SysRoleUserService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.PageUtils;
import org.crazycake.shiro.RedisSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Transactional
@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserRepository sysUserRepository;

    @Autowired
    private SysRoleUserService sysRoleUserService;

    @Autowired
    private CityOrganizationSysUserService cityOrganizationSysUserService;

    @Autowired
    private CommonSearchDao commonSearchDao;

    @Autowired
    RedisSessionDAO redisSessionDAO;

    @Override
    public SysUser save(SysUser sysUser) {
        sysUser = sysUserRepository.save(sysUser);
        Long userId = sysUser.getId();
        Long roleId = sysUser.getRoleId();
        Long cityOrganizationId = sysUser.getCityOrganizationId();
        saveSysRoleUser(roleId, userId);
        saveCityOrganizationSysUser(cityOrganizationId, userId);
        return sysUser;
    }

    @Override
    public boolean delSysUser(Long id) {
        sysUserRepository.delete(id);
        sysRoleUserService.delSysRoleUser(id);
        cityOrganizationSysUserService.delCityOrganizationSysUser(id);
        return false;
    }

    @Override
    public Page<SysUser> findPageByRoleId(Long roleId, int pageNum, int pageSize) {

        List<SysRoleUser> sysRoleUsers = sysRoleUserService.findByRoleId(roleId);
        List<Long> userId = sysRoleUsers.stream()
                .map(SysRoleUser::getUserId)
                .collect(Collectors.toList());
        Page<SysUser> result = getSysUsersPageInUserId(pageNum, pageSize, userId);
        return result;
    }

    @Override
    public Page<SysUser> findPageByCityOrganizationId(Long cityOrganizationId, int pageNum, int pageSize) {
        List<CityOrganizationSysUser> cityOrganizationSysUsers = cityOrganizationSysUserService
                .findListByCityOrganizationId(cityOrganizationId);
        List<Long> userId = cityOrganizationSysUsers.stream()
                .map(CityOrganizationSysUser::getUserId)
                .collect(Collectors.toList());
        Page<SysUser> result = getSysUsersPageInUserId(pageNum, pageSize, userId);
        return result;
    }

    @Override
    public SysUser findByUserAccountAndUserPassword(String userAccount, String userPassword) {
        return sysUserRepository.findByUserAccountAndUserPassword(userAccount, userPassword);
    }

    @Override
    public SysUser updateLocalDateTime(Long id, LocalDateTime localDateTime) {
        SysUser sysUser = sysUserRepository.findOne(id);
        if (sysUser != null) {
            sysUser.setLastLoginTime(localDateTime);
            sysUser = sysUserRepository.save(sysUser);
        }
        return sysUser;
    }

    private SysRoleUser saveSysRoleUser(Long roleId, Long userId) {
        SysRoleUser sysRoleUser = new SysRoleUser();
        sysRoleUser.setRoleId(roleId);
        sysRoleUser.setUserId(userId);
        return sysRoleUserService.save(sysRoleUser);
    }

    private CityOrganizationSysUser saveCityOrganizationSysUser(Long cityOrganizationId, Long userId) {
        CityOrganizationSysUser cityOrganizationSysUser = new CityOrganizationSysUser();
        cityOrganizationSysUser.setCityOrganizationId(cityOrganizationId);
        cityOrganizationSysUser.setUserId(userId);
        return cityOrganizationSysUserService.save(cityOrganizationSysUser);
    }

    private Page<SysUser> getSysUsersPageInUserId(int pageNum, int pageSize, List<Long> userId) {
        Specification<SysUser> specification = new Specification<SysUser>() {
            @Override
            public Predicate toPredicate(Root<SysUser> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                CriteriaBuilder.In<Long> in = builder.in(root.get("id").as(Long.class));
                userId.forEach(userid -> in.value(userid));
                query.where(in);
                return null;
            }
        };
        Pageable pageable = PageUtils.buildPageRequest(pageNum,
                pageSize,
                "createdDate");
        return sysUserRepository.findAll(specification, pageable);
    }
}
