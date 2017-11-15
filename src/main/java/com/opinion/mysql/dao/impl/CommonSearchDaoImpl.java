package com.opinion.mysql.dao.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.opinion.mysql.dao.CommonSearchDao;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.entity.SysUser;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class CommonSearchDaoImpl implements CommonSearchDao {

    @PersistenceContext
    private EntityManager manager;


    public static ZoneId zone = ZoneId.systemDefault();

    @Override
    public List<SysRole> findSysRoleListByUserId(Long userId) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT a.* FROM t_sys_role a INNER JOIN t_sys_role_user b on a.id = b.role_id WHERE b.user_id = ");
        sql.append(userId);
        Query query = manager.createNativeQuery(sql.toString());
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List list = query.getResultList();

        List<SysRole> result = (List<SysRole>) list.stream().map(l -> {
            JSONObject jo = JSON.parseObject(JSON.toJSONString(l));
            SysRole sysRole = new SysRole();
            sysRole.setId(jo.getLong("id"));
            sysRole.setRoleName(jo.getString("role_name"));
            sysRole.setRoleType(jo.getString("role_type"));
            Date createdDate = jo.getDate("created_date");
            sysRole.setCreatedDate(LocalDateTime.ofInstant(createdDate.toInstant(), zone));
            sysRole.setCreatedUser(jo.getString("created_user"));
            Date modifiedDate = jo.getDate("modified_date");
            sysRole.setModifiedDate(LocalDateTime.ofInstant(modifiedDate.toInstant(), zone));
            sysRole.setModifiedUser(jo.getString("modified_user"));
            return sysRole;
        }).collect(Collectors.toList());
        return result;
    }

    @Override
    public List<SysUser> findSysUserListByRoleId(Long roleId) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT a.* FROM t_sys_user a INNER JOIN t_sys_role_user b on a.id = b.user_id WHERE b.role_id = ");
        sql.append(roleId);
        Query query = manager.createNativeQuery(sql.toString());
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List list = query.getResultList();
        List<SysUser> result = (List<SysUser>) list.stream().map(l -> {
            JSONObject jo = JSON.parseObject(JSON.toJSONString(l));
            SysUser sysUser = new SysUser();
            sysUser.setId(jo.getLong("id"));
            sysUser.setUserAccount(jo.getString("user_account"));
            sysUser.setUserName(jo.getString("user_name"));
            sysUser.setPhone(jo.getString("phone"));
            sysUser.setUserPassword(jo.getString("user_password"));
            Date lastLoginTime = jo.getDate("last_login_time");
            sysUser.setLastLoginTime(LocalDateTime.ofInstant(lastLoginTime.toInstant(), zone));
            sysUser.setStatus(jo.getString("status"));
            Date createdDate = jo.getDate("created_date");
            sysUser.setCreatedDate(LocalDateTime.ofInstant(createdDate.toInstant(), zone));
            sysUser.setCreatedUser(jo.getString("created_user"));
            Date modifiedDate = jo.getDate("modified_date");
            sysUser.setModifiedDate(LocalDateTime.ofInstant(modifiedDate.toInstant(), zone));
            sysUser.setModifiedUser(jo.getString("modified_user"));
            return sysUser;
        }).collect(Collectors.toList());
        return result;
    }

}
