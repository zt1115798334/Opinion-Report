$(function () {
    searchCityOrganizationFun();

    var params = {
        cityOrganizationId: 1
    };
    searchCityOrganizationChildFun(params);

    // var params = {
    //     parentId: "1",
    //     name: "昌平区"
    // };
    // saveCityOrganizationFun(params);
    //
    // var params = {
    //     cityOrganizationId: "2"
    // };
    // delCityOrganizationFun(params);

    searchSysRoleFun();
});

/**
 * 保存子级组织机构
 * @param params
 */
function saveCityOrganizationFun(params) {
    var url = "/system/saveCityOrganization";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        var msg = result.data.msg;
        alert(msg);
    }
}

/**
 * 查询当前子级下名称是否存在
 * @param params
 */
function searchExistByCityOrganizationNameFun(params) {
    var url = "/system/searchExistByCityOrganizationName";
    execAjax(url, params, callback);

    function callback(result) {
        var msg = result.data.msg;
        alert(msg);
    }
}

/**
 * 删除子级机构信息
 * @param params
 */
function delCityOrganizationFun(params) {
    var url = "/system/delCityOrganization";
    execAjax(url, params, callback);

    function callback(result) {
        var msg = result.data.msg;
        alert(msg);
    }
}

/**
 * 根据当前用户显示最所在组织机构
 */
function searchCityOrganizationFun() {
    var url = "/system/searchCityOrganization";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        var data = result.data;
        console.log(data);
    }
}

/**
 * 根据当前用户显示最所在组织机构查询子机构信息
 * @param params
 */
function searchCityOrganizationChildFun(params) {
    var url = "/system/searchCityOrganizationChild";
    execAjax(url, params, callback);

    function callback(result) {
        var data = result.data;
        console.log(data);
    }
}

/**
 * 查询角色信息
 */
function searchSysRoleFun() {
    var url = "/system/searchSysRoleSelect";
    var params = {};
    execAjax(url, params, callback);
    var html = '';

    function callback(result) {
        var data = result.data;
        for (var i in data) {
            var info = data[i];
            var roleId = info.roleId;
            var roleName = info.roleName;
            html += '<option value="' + roleId + '">' + roleName + '</option>';
        }
        $(".role_select").html(html);
    }
}

/**
 * 保存用户信息
 */
function saveSysUserInfoFun(params) {
    var url = "/system/searchSysRole";
    execAjaxJSON(url, params, callback);

    function callback() {

    }
}

/**
 * 查询用户账户信息
 */
function searchExistByUserAccountFun(params) {
    var url = "/system/searchExistByUserAccount";
    execAjax(url, params, callback);

    function callback() {

    }
}

/**
 * 验证账户密码正确
 * @param params
 */
function verifyIdentityFun(params) {
    var url = "/system/verifyIdentity";
    execAjax(url, params, callback);

    function callback() {

    }
}

/**
 * 删除用户信息
 */
function delSysUserFun(params) {
    var url = "/system/delSysUser";
    execAjax(url, params, callback);

    function callback() {

    }
}

/**
 * 根据系统用户省市区组织信息id查看用户列表
 */
function searchSysUserPageByCityOrganizationIdFun(params) {
    var url = "/system/searchSysUserPageByCityOrganizationId";
    execAjax(url, params, callback);

    function callback() {

    }
}
