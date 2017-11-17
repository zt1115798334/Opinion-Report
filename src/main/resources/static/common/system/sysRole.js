$(function () {

    searchSysRoleFun();

    var params = {
        roleName: "roleName"
    };
    saveSysRoleFun(params);
});

/**
 * 查询所有角色
 */
function searchSysRoleFun() {
    var url = "/system/searchSysRole";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

/**
 * 保存角色
 */
function saveSysRoleFun(params) {
    var url = "/system/saveSysRole";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}