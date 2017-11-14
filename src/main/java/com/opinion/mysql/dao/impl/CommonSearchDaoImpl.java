package com.opinion.mysql.dao.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.opinion.mysql.dao.CommonSearchDao;
import com.opinion.mysql.entity.SysUser;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class CommonSearchDaoImpl implements CommonSearchDao {

    @PersistenceContext
    private EntityManager manager;


    @Override
    public List<SysUser> findSysUserListByRoleId(Long roleId) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT a.* FROM t_sys_user a INNER JOIN t_sys_role_user b on a.id = b.user_id WHERE b.role_id = ");
        sql.append(roleId);
        Query query = manager.createNativeQuery(sql.toString());
        query.unwrap(SQLQuery.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List list = query.getResultList();
        ZoneId zone = ZoneId.systemDefault();
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
