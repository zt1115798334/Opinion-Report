package com.opinion;

import com.opinion.base.BaseTest;
import com.opinion.mysql.entity.SysPermission;
import com.opinion.mysql.service.SysPermissionService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/12/7
 */
public class SystemTest extends BaseTest {

    @Autowired
    private SysPermissionService sysPermissionService;

    @Test
    public void test1(){
        List<String> code = sysPermissionService.findAll().stream().map(SysPermission::getCode).collect(Collectors.toList());
        sysPermissionService.saveSysRolePermission(code, 1L);
    }
}
