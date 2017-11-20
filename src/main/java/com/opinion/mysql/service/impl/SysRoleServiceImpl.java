package com.opinion.mysql.service.impl;

import com.opinion.constants.SysUserConst;
import com.opinion.mysql.dao.CommonSearchDao;
import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.repository.SysRoleRepository;
import com.opinion.mysql.service.SysRoleService;
import com.opinion.mysql.service.SysRoleUserService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    private SysRoleRepository sysRoleRepository;

    @Autowired
    private SysRoleUserService sysRoleUserService;

    @Autowired
    private CommonSearchDao commonSearchDao;

    @Override
    public boolean save(SysRole sysRole) {
        String roleName = sysRole.getRoleName();
        boolean isExist = isExistByRoleName(roleName);
        if (isExist) {
            return false;
        } else {
            Long userId = new SysUserConst().getUserId();
            LocalDate currentDate = DateUtils.currentDate();
            LocalDateTime currentDatetime = DateUtils.currentDatetime();
            sysRole.setCreatedDate(currentDate);
            sysRole.setCreatedDatetime(currentDatetime);
            sysRole.setCreatedUserId(userId);
            sysRole.setModifiedDate(currentDate);
            sysRole.setModifiedDatetime(currentDatetime);
            sysRole.setModifiedUserId(userId);
            sysRoleRepository.save(sysRole);
            return true;
        }
    }

    @Override
    public Page<SysRole> findPage(String keyword, int pageNum, int pageSize) {
        Specification<SysRole> specification = new Specification<SysRole>() {
            @Override
            public Predicate toPredicate(Root<SysRole> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                query.where(builder.and(builder.like(root.get("roleName").as(String.class), "%" + keyword + "%")));
                return null;
            }
        };
        Pageable pageable = PageUtils.buildPageRequest(pageNum,
                pageSize,
                "id");
        return sysRoleRepository.findAll(specification, pageable);

    }

    @Override
    public List<SysRole> findListByUserId(Long userId) {
        return commonSearchDao.findSysRoleListByUserId(userId);
    }

    @Override
    public boolean delSysRole(Long id) {
        long userCount = sysRoleUserService.findCountByRoleId(id);
        if (userCount > 0) {
            return false;
        } else {
            sysRoleRepository.delete(id);
            return true;
        }
    }

    @Override
    public boolean isExistByRoleName(String roleName) {
        SysRole isExist = sysRoleRepository.findByRoleName(roleName);
        return isExist != null;
    }
}
