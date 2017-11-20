package com.opinion.mysql.service.impl;

import com.google.common.collect.Lists;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.CityOrganizationSysUser;
import com.opinion.mysql.entity.SysRoleUser;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.repository.SysUserRepository;
import com.opinion.mysql.service.CityOrganizationService;
import com.opinion.mysql.service.CityOrganizationSysUserService;
import com.opinion.mysql.service.SysRoleUserService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.MyDES;
import com.opinion.utils.PageUtils;
import org.crazycake.shiro.RedisSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDate;
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
    private CityOrganizationService cityOrganizationService;

    @Autowired
    private CityOrganizationSysUserService cityOrganizationSysUserService;

    @Autowired
    RedisSessionDAO redisSessionDAO;

    @Override
    public boolean save(SysUser sysUser) {
        Long id = sysUser.getId();
        Long userId = new SysUserConst().getUserId();
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        String paw = sysUser.getUserPassword() + sysUser.getUserAccount();
        String pawDES = MyDES.encryptBasedDes(paw);
        if (id != null) {
            /**
             * 修改密码和角色
             */
            SysUser su = sysUserRepository.findOne(id);
            su.setModifiedDate(currentDate);
            su.setModifiedDatetime(currentDatetime);
            su.setModifiedUserId(userId);
            su.setUserPassword(pawDES);
            Long roleId = sysUser.getRoleId();
            su.setRoleId(roleId);
            sysUserRepository.save(su);
            return true;
        } else {
            String userAccount = sysUser.getUserAccount();
            boolean isExist = isExistByUserAccount(userAccount);
            if (!isExist) {
                sysUser.setCreatedDate(currentDate);
                sysUser.setCreatedDatetime(currentDatetime);
                sysUser.setCreatedUserId(userId);
                sysUser.setModifiedDate(currentDate);
                sysUser.setModifiedDatetime(currentDatetime);
                sysUser.setModifiedUserId(userId);
                sysUser.setLastLoginTime(currentDatetime);
                sysUser.setUserPassword(pawDES);
                sysUser.setStatus(SysConst.LoginStatus.EFFECTIVE.getCode());
                sysUser = sysUserRepository.save(sysUser);
                Long roleId = sysUser.getRoleId();
                Long cityOrganizationId = sysUser.getCityOrganizationId();
                saveSysRoleUser(roleId, userId);
                saveCityOrganizationSysUser(cityOrganizationId, userId);
                return true;
            } else {
                return false;
            }
        }
    }

    @Override
    public SysUser findById(Long id) {
        return sysUserRepository.findOne(id);
    }

    @Override
    public boolean delSysUser(Long id) {
        sysUserRepository.delete(id);
        sysRoleUserService.delSysRoleUser(id);
        cityOrganizationSysUserService.delCityOrganizationSysUser(id);
        return false;
    }

    @Override
    public boolean isExistByUserAccount(String userAccount) {
        SysUser sysUser = sysUserRepository.findByUserAccount(userAccount);
        return sysUser != null;
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

    @Override
    public List<Long> findChildIdListByParentId(Long parentId) {
        CityOrganizationSysUser cityOrganizationSysUser = cityOrganizationSysUserService.findOneByUserId(parentId);
        List<Long> userIds = null;
        if (cityOrganizationSysUser != null) {
            List<CityOrganization> cityOrganizations = cityOrganizationService.findByParentId(cityOrganizationSysUser.getId());
            List<Long> cityOrganizationIds = cityOrganizations.stream().map(CityOrganization::getId).collect(Collectors.toList());
            List<CityOrganizationSysUser> cityOrganizationSysUsers = cityOrganizationSysUserService.findListByCityOrganizationIds(cityOrganizationIds);
            userIds = cityOrganizationSysUsers.stream().map(CityOrganizationSysUser::getUserId).collect(Collectors.toList());
        }
        return userIds;
    }

    @Override
    public List<Long> findDescendantIdListByParentId(Long parentId) {
        List<Long> childIds = findChildIdListByParentId(parentId);
        List<Long> descendantIds = Lists.newArrayList();
        childIds.stream().forEach(childId -> {
            List<Long> descendantId = findChildIdListByParentId(childId);
            descendantIds.addAll(descendantId);
        });
        return descendantIds;
    }

    @Override
    public List<Long> findDescendantAllIdListByParentId(Long parentId) {
        List<Long> childIds = findChildIdListByParentId(parentId);
        List<Long> descendantIds = Lists.newArrayList();
        descendantIds.addAll(childIds);
        childIds.stream().forEach(childId -> {
            List<Long> descendantId = findChildIdListByParentId(childId);
            descendantIds.addAll(descendantId);
        });
        return descendantIds;
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
                "createdDatetime");
        return sysUserRepository.findAll(specification, pageable);
    }
}
