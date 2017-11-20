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
    @RequestMapping("organizationStructurePage")
    public String organizationStructurePage() {
        return "/system/organizationStructure";
    }

    /**
     * 跳转角色管理页面
     *
     * @return
     */
    @RequestMapping("roleManagementPage")
    public String roleManagementPage() {
        return "/system/roleManagement";
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
        boolean flag = sysRoleService.save(sysRole);
        JSONObject result = new JSONObject();
        if (flag) {
            result.put("msg", "添加成功");
        } else {
            result.put("msg", "该角色存在，添加失败");
        }
        return success(result);
    }

    /**
     * 查询角色名称是否存在
     *
     * @param roleName
     * @return
     */
    @RequestMapping(value = "searchExistByRoleName", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchExistByRoleName(@RequestParam("roleName") String roleName) {
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
    public AjaxResult delSysRole(@RequestParam("roleId") Long roleId) {
        boolean flag = sysRoleService.delSysRole(roleId);
        JSONObject result = new JSONObject();
        if (flag) {
            result.put("msg", "删除成功");
        } else {
            result.put("msg", "删除失败，角色下还存在用户");
        }
        return success(result);
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
    public AjaxResult searchSysRole(@RequestParam("keyword") String keyword,
                                    @RequestParam("pageNum") int pageNum,
                                    @RequestParam("pageSize") int pageSize) {
        logger.info("searchSysRole:");
        Page<SysRole> page = sysRoleService.findPage(keyword, pageNum, pageSize);
        List<SysRole> sysRoles = page.getContent();
        JSONArray result = new JSONArray();
        sysRoles.stream().forEach(sysRole -> {
            JSONObject jo = new JSONObject();
            jo.put("id", sysRole.getId());
            jo.put("roleName", sysRole.getRoleName());
            jo.put("createdDatetime", DateUtils.formatDate(sysRole.getCreatedDatetime(), DateUtils.DATE_SECOND_FORMAT_SIMPLE));
            result.add(jo);
        });
        return success(result);
    }

    /**
     * 根据角色id查询权限信息
     *
     * @param roleId
     * @return
     */
    @RequestMapping(value = "searchSysPermission", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchSysPermission(@RequestParam("roleId") Long roleId) {
        List<SysRolePermission> sysRolePermissions = sysRolePermissionService.findByRoleId(roleId);
        return success(sysRolePermissions);
    }

    /**
     * 根据角色id保存权限信息
     *
     * @param codes
     * @param roleId
     * @return
     */
    @RequestMapping(value = "saveSysPermission", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveSysPermission(@RequestParam("code") List<String> codes, @RequestParam("roleId") Long roleId) {
        sysPermissionService.saveSysRolePermission(codes, roleId);
        return success("添加成功");
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
        System.out.println("sysPermissions = " + sysPermissions);
        JSONArray result = new JSONArray();
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
     * @param cityOrganization
     * @return
     */
    @RequestMapping(value = "saveCityOrganization", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult saveCityOrganization(@RequestBody CityOrganization cityOrganization) {
        Long userId = new SysUserConst().getUserId();
        CityOrganizationSysUser cityOrganizationSysUser = cityOrganizationSysUserService.findOneByUserId(userId);
        if (cityOrganizationSysUser != null) {
            Long cityOrganizationId = cityOrganizationSysUser.getCityOrganizationId();
            CityOrganization parentCityOrganization = cityOrganizationService.findById(cityOrganizationId);
            cityOrganization.setLevel(parentCityOrganization.getLevel() + 1);
        } else {
            cityOrganization.setLevel(99);
        }
        boolean flag = cityOrganizationService.save(cityOrganization);
        JSONObject result = new JSONObject();
        if (flag) {
            result.put("msg", "添加成功");
        } else {
            result.put("msg", "添加失败，该机构已存在");
        }
        return success(result);
    }

    /**
     * 查询省市区组织信息名称是否存在
     *
     * @param name     组织机构名称
     * @param parentId 上级id
     * @return
     */
    @RequestMapping(value = "searchExistByCityOrganizationName", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchExistByCityOrganizationName(@RequestParam("name") String name,
                                                        @RequestParam("parentId") Long parentId) {
        boolean isExist = cityOrganizationService.isExistByNameAndParentId(name, parentId);
        JSONObject result = new JSONObject();
        result.put("isExist", isExist);
        return success(result);
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
        JSONObject result = new JSONObject();
        if (flag) {
            result.put("msg", "删除成功");
        } else {
            result.put("msg", "删除失败，该组织下存在其他信息");
        }
        return success(result);
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
    @ResponseBody
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
    @ResponseBody
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
        boolean flag = sysUserService.save(sysUser);
        JSONObject result = new JSONObject();
        if (flag) {
            result.put("msg", "添加成功");
        } else {
            result.put("msg", "添加失败，该账户已存在");
        }
        return success(result);
    }

    /**
     * 用户账户是否存在
     *
     * @return
     */
    @RequestMapping(value = "searchExistByUserAccount", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult searchExistByUserAccount(@RequestParam("userAccount") String userAccount) {
        logger.info("请求 isExistByUserAccount 方法，参数信息为：userAccount:{}", userAccount);
        boolean isExist = sysUserService.isExistByUserAccount(userAccount);
        JSONObject result = new JSONObject();
        result.put("isExist", isExist);
        return success(result);
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
     * 根据系统用户省市区组织信息id查看用户列表
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
