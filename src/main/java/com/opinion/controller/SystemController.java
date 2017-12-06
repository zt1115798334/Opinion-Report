package com.opinion.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opinion.base.bean.AjaxResult;
import com.opinion.base.controller.BaseController;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.*;
import com.opinion.mysql.service.*;
import com.opinion.utils.DateUtils;
import com.opinion.utils.MyDES;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

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
    private SysPermissionService sysPermissionService;

    @Autowired
    private SysRolePermissionService sysRolePermissionService;

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
    @RequestMapping(value = "organizationStructurePage", method = RequestMethod.GET)
    public String organizationStructurePage() {
        return "/system/organizationStructure";
    }

    /**
     * 跳转角色管理页面
     *
     * @return
     */
    @RequestMapping(value = "roleManagementPage", method = RequestMethod.GET)
    public String roleManagementPage() {
        return "/system/roleManagement";
    }

    /**
     * 添加角色
     *
     * @param sysRole 系统角色
     * @return
     */
    @RequestMapping(value = "saveSysRole", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysRole(@RequestBody SysRole sysRole) {
        logger.info("请求 saveSysRole 方法,sysRole:{}", sysRole);
        boolean flag = sysRoleService.save(sysRole);
        if (flag) {
            return success("添加成功");
        } else {
            return fail("该角色存在，添加失败");
        }
    }

    /**
     * 查询角色名称是否存在
     *
     * @param roleName 角色名称
     * @return
     */
    @RequestMapping(value = "searchExistByRoleName", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchExistByRoleName(@RequestParam String roleName) {
        logger.info("请求 searchExistByRoleName方法，roleName：{}", roleName);
        boolean isExist = sysRoleService.isExistByRoleName(roleName);
        JSONObject result = new JSONObject();
        result.put("isExist", isExist);
        return success(result);
    }

    /**
     * 删除角色
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "delSysRole", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delSysRole(@RequestParam Long roleId) {
        logger.info("请求 delSysRole 方法，roleId：{}", roleId);
        boolean flag = sysRoleService.delSysRole(roleId);
        if (flag) {
            return success("删除成功");
        } else {
            return fail("删除失败，角色下还存在用户");
        }
    }

    /**
     * 查询角色下有多少用户
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "searchSysRoleUserCount", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysRoleUserCount(@RequestParam Long roleId) {
        logger.info("请求 searchSysRoleUserCount 方法，roleId：{}", roleId);
        long count = sysRoleUserService.findCountByRoleId(roleId);
        return success(count);
    }

    /**
     * 查询所有的角色
     *
     * @param roleName  关键字
     * @param pageNumber  页数
     * @param pageSize 数量
     * @return
     */
    @RequestMapping(value = "searchSysRole", method = RequestMethod.POST)
    @ResponseBody
    public Object searchSysRole(@RequestParam String roleName,
                                @RequestParam int pageNumber,
                                @RequestParam int pageSize) {
        logger.info("请求 searchSysRole 方法，roleName：{}，pageNumber，{}，pageSize:{}", roleName, pageNumber, pageSize);
        Page<SysRole> page = sysRoleService.findPage(roleName, pageNumber, pageSize);
        List<SysRole> sysRoles = page.getContent();
        JSONObject result = new JSONObject();
        JSONArray ja = new JSONArray();
        sysRoles.stream().forEach(sysRole -> {
            JSONObject jo = new JSONObject();
            jo.put("id", sysRole.getId());
            jo.put("roleType", sysRole.getRoleType());
            jo.put("roleName", sysRole.getRoleName());
            jo.put("createdDatetime", DateUtils.formatDate(sysRole.getCreatedDatetime(), DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            ja.add(jo);
        });
        result.put("total", page.getTotalElements());
        result.put("rows", ja);
        return result;
    }


    /**
     * 下拉菜单查询所有角色 （排除admin角色）
     *
     * @return
     */
    @RequestMapping(value = "searchSysRoleSelect", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysRoleSelect() {
        List<SysRole> sysRoles = sysRoleService.findList();
        JSONArray result = new JSONArray();
        sysRoles.stream().filter(sysRole -> !Objects.equals(sysRole.getRoleType(), SysConst.RoleType.ADMIN))
                .forEach(sysRole -> {
                    JSONObject jo = new JSONObject();
                    jo.put("roleId", sysRole.getId());
                    jo.put("roleName", sysRole.getRoleName());
                    result.add(jo);
                });
        return success(result);
    }

    /**
     * 根据角色id保存权限信息
     *
     * @param code   编号
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "saveSysPermission", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysPermission(@RequestParam List<String> code,
                                        @RequestParam Long roleId) {
        logger.info("请求 saveSysPermission 方法，code{},roleId：{}", code, roleId);
        sysPermissionService.saveSysRolePermission(code, roleId);
        return success("添加成功");
    }

    /**
     * 根据角色id查询权限信息
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "searchSysPermission", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysPermission(@RequestParam Long roleId) {
        logger.info("请求 searchSysPermission 方法，roleId：{}", roleId);
        List<SysRolePermission> sysRolePermissions = sysRolePermissionService.findByRoleId(roleId);
        return success(sysRolePermissions);
    }

    /**
     * 查询显示的菜单
     *
     * @return
     */
    @RequestMapping(value = "searchDisplayMenu", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchDisplayMenu() {
        String permissionType = SysConst.PermissionType.DISPLAY.getCode();
        List<SysPermission> sysPermissions = getSysPermissionsByType(permissionType);
        JSONArray result = new JSONArray();
        sysPermissions.stream()
                .filter(sysPermission -> sysPermission.getParentId() == 1L)
                .forEach(sysPermission -> {
                    Long permissionId = sysPermission.getId();
                    List<SysPermission> sysPermissionChilds = sysPermissionService.findListByParentId(permissionId);
                    JSONArray childJSON = new JSONArray();
                    sysPermissionChilds.stream().forEach(child -> {
                        JSONObject jo = new JSONObject();
                        jo.put("urlName", child.getUrlName());
                        jo.put("sysUrl", child.getSysUrl());
                        jo.put("icon", child.getIcon());
                        childJSON.add(jo);
                    });
                    JSONObject jo = new JSONObject();
                    jo.put("id", permissionId);
                    jo.put("urlName", sysPermission.getUrlName());
                    jo.put("sysUrl", sysPermission.getSysUrl());
                    jo.put("icon", sysPermission.getIcon());
                    jo.put("childs", childJSON);
                    result.add(jo);
                });
        return success(result);
    }

    /**
     * 查询用户的操作权限的菜单
     *
     * @return
     */
    @RequestMapping(value = "searchOperationAuthority", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchOperationAuthority() {
        String permissionType = SysConst.PermissionType.OPERATION.getCode();
        List<SysPermission> sysPermissions = getSysPermissionsByType(permissionType);
        System.out.println("sysPermissions = " + sysPermissions);
        JSONArray result = new JSONArray();
        return success(result);
    }

    private List<SysPermission> getSysPermissionsByType(String permissionType) {
        Long userId = new SysUserConst().getUserId();
        SysRoleUser sysRoleUser = sysRoleUserService.findByUserId(userId);
        List<SysPermission> sysPermissions = null;
        if (sysRoleUser != null) {
            Long roleId = sysRoleUser.getRoleId();
            sysPermissions = sysPermissionService.findListByRoleIdAndType(roleId, permissionType);
        }
        return sysPermissions;
    }

    /**
     * 保存省市区组织信息表
     *
     * @param cityOrganization 省市区组织信息
     * @return
     */
    @RequestMapping(value = "saveCityOrganization", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveCityOrganization(@RequestBody CityOrganization cityOrganization) {
        logger.info("请求 saveCityOrganization 方法，cityOrganization：{}", cityOrganization);
        Long userId = new SysUserConst().getUserId();
        CityOrganizationSysUser cityOrganizationSysUser = cityOrganizationSysUserService.findOneByUserId(userId);
        if (cityOrganizationSysUser != null) {
            Long cityOrganizationId = cityOrganizationSysUser.getCityOrganizationId();
            CityOrganization parentCityOrganization = cityOrganizationService.findById(cityOrganizationId);
            cityOrganization.setLevel(parentCityOrganization.getLevel() + 1);
        } else {
            cityOrganization.setLevel(99);
        }
        cityOrganization = cityOrganizationService.save(cityOrganization);
        return success(cityOrganization);
    }

    /**
     * 删除组织机构
     *
     * @param id 组织机构id
     * @return
     */
    @RequestMapping(value = "delCityOrganization", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delCityOrganization(@RequestParam Long id) {
        logger.info("请求 delCityOrganization 方法，cityOrganizationId：{}", id);
        boolean flag = cityOrganizationService.delCityOrganization(id);
        if (flag) {
            return success("删除成功");
        } else {
            return fail("删除失败，该组织下存在其他信息");
        }
    }

    /**
     * 查询组织机构有多少用户
     *
     * @param cityOrganizationId 组织机构id
     * @return
     */
    @RequestMapping(value = "searchCityOrganizationSysUserCount", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchCityOrganizationSysUserCount(@RequestParam Long cityOrganizationId) {
        logger.info("请求 searchCityOrganizationSysUserCount 方法，cityOrganizationId：{}", cityOrganizationId);
        long count = cityOrganizationSysUserService.findCountByCityOrganizationId(cityOrganizationId);
        return success(count);
    }

    /**
     * 查询用户所在的组织机构
     *
     * @return
     */
    @RequestMapping(value = "searchCityOrganization", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchCityOrganization() {
        Long userId = new SysUserConst().getUserId();
        Long cityOrganizationId = cityOrganizationSysUserService.findCityOrganizationIdByUserId(userId);
        CityOrganization cityOrganization = cityOrganizationService.findParentAndChildrenById(cityOrganizationId);
        List<CityOrganization> cityOrganizations = cityOrganizationService.findParentAndChildrenByEntity(cityOrganization);
        JSONArray result = new JSONArray();
        cityOrganizations.forEach(co -> {
            JSONObject jo = new JSONObject();
            jo.put("id", co.getId());
            jo.put("code", co.getCode());
            jo.put("name", co.getName());
            jo.put("pId", co.getpId());
            jo.put("level", co.getLevel());
            result.add(jo);
        });
        return success(result);
    }


    /**
     * 查看登录者信息
     *
     * @return
     */
    @RequestMapping(value = "searchLoginUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchLoginUserInfo() {
        SysUser sysUser = new SysUserConst().getSysUser();
        JSONObject result = new JSONObject();
        result.put("userName", sysUser.getUserName());
        return success(result);
    }


    /**
     * 保存用户信息
     *
     * @param sysUser 用户信息
     * @return
     */
    @RequestMapping(value = "saveSysUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysUserInfo(@RequestBody SysUser sysUser) {
        logger.info("请求 saveSysUserInfo 方法，sysUser:{}", sysUser);
        boolean flag = sysUserService.save(sysUser);
        if (flag) {
            return success("保存成功");
        } else {
            return fail("保存失败，该账户已存在");
        }
    }

    /**
     * 用户账户是否存在
     *
     * @param userAccount 用户账户
     * @return
     */
    @RequestMapping(value = "searchExistByUserAccount", method = RequestMethod.POST)
    @ResponseBody
    public Object searchExistByUserAccount(@RequestParam String userAccount) {
        logger.info("请求 searchExistByUserAccount 方法，userAccount:{}", userAccount);
        boolean isExist = sysUserService.isExistByUserAccount(userAccount);
        JSONObject result = new JSONObject();
        result.put("valid", !isExist);
        return result;
    }

    /**
     * 验证身份 修改密码时候使用
     *
     * @param userAccount  用户账户
     * @param userPassword 用户密码
     * @return
     */
    @RequestMapping(value = "verifyIdentity", method = RequestMethod.POST)
    @ResponseBody
    public Object verifyIdentity(@RequestParam String userAccount,
                                 @RequestParam String userPassword) {
        logger.info("请求 verifyIdentity 方法，userAccount:{}，userPassword：{}", userAccount, userPassword);
        String paw = userPassword + userAccount;
        String pawDES = MyDES.encryptBasedDes(paw);
        // 从数据库获取对应用户名密码的用户
        SysUser sysUser = sysUserService.findByUserAccountAndUserPassword(userAccount, pawDES);
        JSONObject result = new JSONObject();
        boolean flag = null != sysUser;
        result.put("valid", flag);
        return result;
    }

    /**
     * 删除用户信息
     *
     * @param userId 用户id
     * @return
     */
    @RequestMapping(value = "delSysUser", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delSysUser(@RequestParam Long userId) {
        logger.info("请求 delSysUser 方法，userId:{}", userId);
        sysUserService.delSysUser(userId);
        return success("删除成功");
    }

    /**
     * 删除用户信息
     *
     * @param userId 用户id
     * @return
     */
    @RequestMapping(value = "searchSysUserById", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysUserById(@RequestParam Long userId) {
        logger.info("请求 searchSysUserById 方法，userId:{}", userId);
        SysUser sysUser = sysUserService.findById(userId);
        return success(sysUser);
    }

    /**
     * 根据角色id查看用户列表
     *
     * @param roleId     角色id
     * @param userName   用户名称
     * @param pageNumber 页数
     * @param pageSize   数量
     * @return
     */
    @RequestMapping(value = "searchSysUserPageByRoleId", method = RequestMethod.POST)
    @ResponseBody
    public Object searchSysUserPageByRoleId(@RequestParam Long roleId,
                                            @RequestParam String userName,
                                            @RequestParam int pageNumber,
                                            @RequestParam int pageSize) {
        logger.info("请求 searchSysUserPageByRoleId 方法，roleId:{},userName:{},pageNumber:{},pageSize:{}",
                roleId, userName, pageNumber, pageSize);
        Page<SysUser> page = sysUserService.findPageByRoleId(roleId, pageNumber, pageSize, userName);
        JSONObject result = pageSysUserToJSONObject(page);
        return result;
    }

    /**
     * 根据系统用户省市区组织信息id查看用户列表
     *
     * @param cityOrganizationId 系统用户省市区组织信息id
     * @param userName           用户名称
     * @param pageNumber         页数
     * @param pageSize           数量
     * @return
     */
    @RequestMapping(value = "searchSysUserPageByCityOrganizationId", method = RequestMethod.POST)
    @ResponseBody
    public Object searchSysUserPageByCityOrganizationId(@RequestParam Long cityOrganizationId,
                                                        @RequestParam String userName,
                                                        @RequestParam int pageNumber,
                                                        @RequestParam int pageSize) {
        logger.info("请求 searchSysUserPageByRoleId 方法，cityOrganizationId:{},userName:{},pageNumber:{},pageSize:{}",
                cityOrganizationId, userName, pageNumber, pageSize);
        Page<SysUser> page = sysUserService.findPageByCityOrganizationId(cityOrganizationId, pageNumber, pageSize, userName);
        JSONObject result = pageSysUserToJSONObject(page);
        return result;
    }

    private JSONObject pageSysUserToJSONObject(Page<SysUser> page) {
        JSONObject result = new JSONObject();
        List<SysUser> list = page.getContent();
        JSONArray ja = new JSONArray();
        list.stream().forEach(sysUser -> {
            JSONObject jo = new JSONObject();
            jo.put("id", sysUser.getId());
            jo.put("userAccount", sysUser.getUserAccount());
            jo.put("userName", sysUser.getUserName());
            SysRole sysRole = sysRoleService.findListByUserId(sysUser.getId()).get(0);
            jo.put("roleName", sysRole.getRoleName());
            jo.put("createDatetime", DateUtils.formatDate(sysUser.getCreatedDatetime(), DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            ja.add(jo);
        });
        result.put("total", page.getTotalElements());
        result.put("rows", ja);
        return result;
    }

}
