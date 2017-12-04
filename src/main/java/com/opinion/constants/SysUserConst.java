package com.opinion.constants;

import com.opinion.mysql.entity.SysUser;
import org.apache.shiro.SecurityUtils;

/**
 * @author zhangtong
 * Created by on 2017/11/17
 */
public class SysUserConst {

    public SysUser getSysUser() {
//        return (SysUser) SecurityUtils.getSubject().getPrincipal();
        SysUser sysUser = new SysUser();
        sysUser.setId(5L);
        sysUser.setUserName("admin5");
        return sysUser;
    }

    public Long getUserId() {
//        return getSysUser().getId();
        return 5L;
    }

}
