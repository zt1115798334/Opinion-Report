jQuery(document).ready(function ($) {
    $('.selectpicker').selectpicker({
        style: 'btn-default',
        size: 5
    });

    //高度
    ResizeHeight();
    window.onresize = function () {
        ResizeHeight();
    };

    /**
     * 显示登录者名称
     */
    searchLoginUserInfoFun();

    /**
     * 显示菜单
     */
    searchDisplayMenuFun();

});

function ResizeHeight() {
    var height = $(window).height() - 67 - 40;
    $("#wrapper").css("min-height", height);
}

/**
 * 显示菜单
 */
function searchDisplayMenuFun() {
    var params = {};
    var url = "/system/searchDisplayMenu";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var parents = result.data;
            var html = '';
            for (var i in parents) {
                var parent = parents[i];
                var parentId = parent.id;
                var parentUrlName = parent.urlName;
                var parentSysUrl = parent.sysUrl;
                var parentIcon = parent.icon;
                var childs = parent.childs;
                html += ' <li class="level1">\n' +
                    '            <a  href="javascript:void(0)">\n' +
                    '                <i class="' + parentIcon + '"></i>\n' +
                    '                <span class="menu-title lineblock">' + parentUrlName + '</span>\n' +
                    '            </a>\n';
                if (childs.length != 0) {
                    html += '<b></b>';
                    html += ' <ul class="side-list">';
                    for (var ii in childs) {
                        var child = childs[ii];
                        var childUrlName = child.urlName;
                        var childSysUrl = child.sysUrl;
                        var childIcon = child.icon;
                        html += '<li>\n' +
                            '       <a  href="' + childSysUrl + '"><span class="menu-title lineblock">' + childUrlName + '</span></a>\n' +
                            '                </li>';
                    }
                    html += '</ul>';
                }
                html += '</li>';
            }
            console.log(html);
            $("#side-menu").html(html);
            menuFun();
        }
    }
}

function searchOperationAuthorityFun(callbackResult) {
    var params = {};
    var url = "/system/searchOperationAuthority";
    execAjax(url, params, callback);

    function callback(result) {
        callbackResult(result);
    }
}

/**
 * 显示登录者名称
 */
function searchLoginUserInfoFun() {
    var params = {};
    var url = "/system/searchLoginUserInfo";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var sysUser = result.data;
            var userName = sysUser.userName;
            $(".role").html(userName);
        }
    }
}