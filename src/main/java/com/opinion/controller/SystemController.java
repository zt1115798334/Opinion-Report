package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.CityOrganization;
import com.opinion.mysql.entity.CityOrganizationSysUser;
import com.opinion.mysql.entity.SysRole;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.service.*;
import com.opinion.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    private SysRoleUserService sysRoleUserService;

    @Autowired
    private CityOrganizationService cityOrganizationService;

    @Autowired
    private CityOrganizationSysUserService cityOrganizationSysUserService;

    @Autowired
    private SysUserService sysUserService;

    /**
     * 跳转组织机构页面
     *
     * @return
     */
    @RequestMapping("organizationStructurePage")
    public String organizationStructurePage() {
        return "organizationStructure";
    }

    /**
     * 跳转角色管理页面
     *
     * @return
     */
    @RequestMapping("roleManagementPage")
    public String roleManagementPage() {
        return "roleManagement";
    }

    /**
     * 添加角色
     *
     * @param sysRole
     * @return
     */
    @RequestMapping(value = "saveSysRole", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysRole(@RequestBody SysRole sysRole) {
        sysRoleService.save(sysRole);
        return success("添加成功");
    }

    /**
     * 删除角色
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "delSysRole", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delSysRole(@RequestParam("roleId") Long roleId) {
        boolean flag = sysRoleService.delSysRole(roleId);
        return success(flag);
    }

    /**
     * 查询角色下有多少用户
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "searchSysRoleUserCount", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysRoleUserCount(@RequestParam("roleId") Long roleId) {
        long count = sysRoleUserService.findCountByRoleId(roleId);
        return success(count);
    }

    /**
     * 查询所有的角色
     *
     * @return
     */
    @RequestMapping(value = "searchSysRole", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysRole() {
        logger.info("searchSysRole:");
        List<SysRole> sysRoles = sysRoleService.findList();
        JSONArray result = new JSONArray();
        sysRoles.stream().forEach(sysRole -> {
            JSONObject jo = new JSONObject();
            jo.put("id", sysRole.getId());
            jo.put("roleName", sysRole.getRoleName());
            jo.put("createdDatetime", DateUtils.formatDate(sysRole.getCreatedDate(), DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            result.add(jo);
        });
        return success(result);
    }

    /**
     * 保存省市区组织信息表
     *
     * @param cityOrganization
     * @return
     */
    @RequestMapping(value = "saveCityOrganization", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveCityOrganization(@RequestBody CityOrganization cityOrganization) {
        cityOrganizationService.save(cityOrganization);
        return success("添加成功");
    }

    /**
     * 删除组织机构
     *
     * @param cityOrganizationId
     * @return
     */
    @RequestMapping(value = "delCityOrganization", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delCityOrganization(@RequestParam("cityOrganizationId") Long cityOrganizationId) {
        boolean flag = cityOrganizationService.delCityOrganization(cityOrganizationId);
        return success(flag);
    }

    /**
     * 查询组织机构有多少用户
     *
     * @param cityOrganizationId
     * @return
     */
    @RequestMapping(value = "searchCityOrganizationSysUserCount", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchCityOrganizationSysUserCount(@RequestParam("cityOrganizationId") Long cityOrganizationId) {
        long count = cityOrganizationSysUserService.findCountByCityOrganizationId(cityOrganizationId);
        return success(count);
    }

    /**
     * 查询用户所在的组织机构
     *
     * @return
     */
    @RequestMapping(value = "searchCityOrganization", method = RequestMethod.POST)
    public AjaxResult searchCityOrganization() {
        Long userId = new SysUserConst().getUserId();
        CityOrganizationSysUser cityOrganizationSysUser = cityOrganizationSysUserService.findOneByUserId(userId);
        JSONObject result = new JSONObject();
        if (cityOrganizationSysUser != null) {
            Long cityOrganizationId = cityOrganizationSysUser.getCityOrganizationId();
            CityOrganization cityOrganization = cityOrganizationService.findById(cityOrganizationId);
            result.put("parent", cityOrganization);
        }
        return success(result);
    }

    /**
     * 查询组织机构子级信息
     *
     * @param cityOrganizationId
     * @return
     */
    @RequestMapping(value = "searchCityOrganizationChild", method = RequestMethod.POST)
    public AjaxResult searchCityOrganizationChild(@RequestParam("cityOrganizationId") Long cityOrganizationId) {
        JSONObject result = new JSONObject();
        List<CityOrganization> cityOrganizationChild = cityOrganizationService.findByParentId(cityOrganizationId);
        result.put("child", cityOrganizationChild);
        return success(result);
    }


    /**
     * 保存用户信息
     *
     * @return
     */
    @RequestMapping(value = "saveSysUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysUserInfo(@RequestBody SysUser sysUser) {
        logger.info("请求 saveSysUserInfo 方法，参数信息为：sysUser:{}", sysUser);
        sysUser = sysUserService.save(sysUser);
        return success(sysUser);
    }

    /**
     * 删除用户信息
     *
     * @param userId 用户id
     * @return
     */
    @RequestMapping(value = "delSysUser", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delSysUser(@RequestParam("userId") Long userId) {
        sysUserService.delSysUser(userId);
        return success("删除成功");
    }

    /**
     * 根据角色id查看用户列表
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping("searchSysUserPageByRoleId")
    @ResponseBody
    public AjaxResult searchSysUserPageByRoleId(@RequestParam("roleId") Long roleId,
                                                @RequestParam("pageNum") int pageNum,
                                                @RequestParam("pageSize") int pageSize) {
        logger.info("请求 searchSysUserByRoleId 方法，参数信息为：roleId:{}", roleId);
        Page<SysUser> list = sysUserService.findPageByRoleId(roleId, pageNum, pageSize);
        return success(list);
    }

    /**
     * 根据角色id查看用户列表
     *
     * @param cityOrganizationId 系统用户省市区组织信息id
     * @return
     */
    @RequestMapping("searchSysUserPageByCityOrganizationId")
    @ResponseBody
    public AjaxResult searchSysUserPageByCityOrganizationId(@RequestParam("cityOrganizationId") Long cityOrganizationId,
                                                            @RequestParam("pageNum") int pageNum,
                                                            @RequestParam("pageSize") int pageSize) {
        logger.info("请求 searchSysUserByRoleId 方法，参数信息为：roleId:{}", cityOrganizationId);
        Page<SysUser> list = sysUserService.findPageByCityOrganizationId(cityOrganizationId, pageNum, pageSize);
        return success(list);
    }


}
