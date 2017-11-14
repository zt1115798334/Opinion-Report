package com.opinion.controller;

import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.SysRoleService;
import com.opinion.mysql.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/14
 */
@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping(value = "searchSysRole", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysRole() {
        logger.info("searchSysRole:");
        List<SysRole> sysRoles = sysRoleService.findList();
        return success(sysRoles);
    }

    /**
     * 保存用户信息
     *
     * @return
     */
    @RequestMapping(value = "saveSysUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysUserInfo(@RequestBody SysUser sysUser, @RequestParam("roleId") Long roleId) {
        logger.info("请求 saveSysUserInfo 方法，参数信息为：sysUser:{},roleId:{}", sysUser, roleId);
        sysUser = sysUserService.save(sysUser, roleId);
        return success(sysUser);
    }

    /**
     * 根据角色id查看用户列表
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping("searchSysUserByRoleId")
    @ResponseBody
    public AjaxResult searchSysUserByRoleId(@RequestParam("roleId") Long roleId) {
        logger.info("请求 searchSysUserByRoleId 方法，参数信息为：roleId:{}", roleId);
        List<SysUser> list = sysUserService.findListByRoleId(roleId);
        return success(list);
    }
}
