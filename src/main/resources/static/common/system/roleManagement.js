$(function () {

    searchSysRoleFun();


    $(document).on("click", ".saveRoleName", function () {
        var roleName = $(".roleName").val();
        var params = {
            roleName: roleName
        };
        saveSysRoleFun(params);
    });

    $(document).on("click", ".del-role", function () {
        var id = $(this).parent().siblings("input").val();
        var params = {
            roleId: id
        }
        delSysRoleFun(params);
    });
    // var params = {
    //     roleName: ""
    // };
    // searchSysPermissionFun(params);
    //
    // saveSysPermissionFun(params);
});

/**
 * 查询所有角色
 */
function searchSysRoleFun() {
    var url = "/system/searchSysRole";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        var data = result.data;
        var html = '';
        for (var i in data) {
            var info = data[i];
            var id = info.id;
            var roleName = info.roleName;
            var createdDatetime = info.createdDatetime;
            html += ' <tr>\n' +
                '    <input value="' + id + '" type="hidden"/>\n' +
                '            <td>' + id + '</td>\n' +
                '            <td>' + roleName + '</td>\n' +
                '            <td>' + createdDatetime + '</td>\n' +
                '            <td><a>权限管理</a><a class="del-role">删除</a></td>\n' +
                '        </tr>'
        }
        $("#roleTable tbody").html(html);
    }
}

/**
 * 保存角色
 */
function saveSysRoleFun(params) {
    var url = "/system/saveSysRole";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.data, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 删除角色
 * @param params
 */
function delSysRoleFun(params) {

    var url = "/system/delSysRole";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.data, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 角色id查询权限信息
 * @param params
 */
function searchSysPermissionFun(params) {
    var url = "/system/searchSysPermission";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

/**
 * 根据角色id保存权限信息
 * @param params
 */
function saveSysPermissionFun(params) {
    var url = "/system/saveSysPermission";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}