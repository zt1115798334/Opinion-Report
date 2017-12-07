$(function () {

    searchCityOrganizationFun();
    searchSysUserPageByCityOrganizationIdFun();
    searchSysRoleFun();

    /**
     * 点击搜索操作
     */
    $(document).on("click", ".searchButton", function () {
        searchSysUserPageByCityOrganizationIdFun();
    });

    /**
     * 新建用户
     */
    $(document).on("click", ".create", function () {
        if (cityOrganizationId == undefined || cityOrganizationId == "") {
            notify.error({title: "提示", content: "请选择组织机构", autoClose: true});
            return false;
        }
        $("#newUser").modal("show");
    });

    /**
     * 新建用户 -- 保存操作
     */
    $(document).on("click", "#newUser .saveBtn", function () {
        validateFun();
        var bv = $("#userInfoForm").data('bootstrapValidator');
        bv.validate();
        if (!bv.isValid()) {
            return false;
        }
        var data = $("#userInfoForm").serializeJSON();
        data.cityOrganizationId = cityOrganizationId;
        saveSysUserInfoFun(data);
    });

    /**
     * 编辑用户
     */
    $(document).on("click", ".revise", function () {
        var userId = $(this).attr("rowId");
        searchSysUserFun(userId);
        $("#editUser .saveBtn").attr("userId", userId);
        $("#editUser").modal("show");
    });

    /**
     * 编辑用户 -- 保存操作
     */
    $(document).on("click", "#editUser .saveBtn", function () {
        validateEditFun();
        var bv = $("#userInfoEditForm").data('bootstrapValidator');
        bv.validate();
        if (!bv.isValid()) {
            return false;
        }
        var id = $("#editUser .saveBtn").attr("userId");
        ;
        var data = $("#userInfoEditForm").serializeJSON();
        data.id = id;
        saveSysUserInfoFun(data);
    });

    //清除弹窗原数据
    $("#newUser").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
    });

    $("#editUser").on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
    });

    /**
     * 删除
     */
    $(document).on("click", ".delete", function () {
        var userId = $(this).attr("rowId");
        showBootstrapDialog("确认删除该用户信息？该用户信息全部删除，该操作不可恢复！！", callback);

        function callback() {
            delSysUserFun(userId);
        }
    });
});

/**
 * ztree方法 开始
 */
var log, className = "dark";

var cityOrganizationId = "";

function onClick(event, treeId, treeNode) {
    cityOrganizationId = treeNode.id;
    searchSysUserPageByCityOrganizationIdFun();
}

function beforeDrag(treeId, treeNodes) {
    return false;
}

function beforeEditName(treeId, treeNode) {
    className = (className === "dark" ? "" : "dark");
    showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
    var zTree = $.fn.zTree.getZTreeObj("organizationTree");
    zTree.selectNode(treeNode);
    setTimeout(function () {
        zTree.editName(treeNode);
    }, 0);
    return false;
}

function beforeRemove(treeId, treeNode) {
    className = (className === "dark" ? "" : "dark");
    var zTree = $.fn.zTree.getZTreeObj("organizationTree");
    zTree.selectNode(treeNode);
    BootstrapDialog.show({
        title: '确认',
        message: '你确认要删除机构[' + treeNode.name + ']吗？',
        onshow: function (dialog) {
        },
        buttons: [{
            label: '确认',
            action: function (dialogItself) {
                var params = {
                    id: treeNode.id
                }
                delCityOrganizationFun(params);
                dialogItself.close();
                var zTree = $.fn.zTree.getZTreeObj(treeId);
                zTree.removeNode(treeNode);
                return true;
            }
        }, {
            label: '取消',
            action: function (dialogItself) {
                dialogItself.close();
                flag = false;
                return false;
            }
        }]
    });
    return false;
}

function onRemove(e, treeId, treeNode) {
    showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}

function beforeRename(treeId, treeNode, newName, isCancel) {
    className = (className === "dark" ? "" : "dark");
    showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
    if (newName.length == 0) {
        setTimeout(function () {
            var zTree = $.fn.zTree.getZTreeObj("organizationTree");
            zTree.cancelEditName();
            alert("节点名称不能为空.");
        }, 0);
        return false;
    }
    return true;
}

function onRename(e, treeId, treeNode, isCancel) {
    var params = {
        id: treeNode.id,
        parentId: treeNode.parentId,
        name: treeNode.name
    };
    updateCityOrganizationFun(params, treeNode, isCancel);
}

function showLog(str) {
    if (!log) log = $("#log");
    log.append("<li class='" + className + "'>" + str + "</li>");
    if (log.children("li").length > 8) {
        log.get(0).removeChild(log.children("li")[0]);
    }
}

function getTime() {
    var now = new Date(),
        h = now.getHours(),
        m = now.getMinutes(),
        s = now.getSeconds(),
        ms = now.getMilliseconds();
    return (h + ":" + m + ":" + s + " " + ms);
}

var newCount = 1;

function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_" + treeNode.tId);
    if (btn) btn.bind("click", function () {

        var params = {
            pId: treeNode.id,
            name: "新的机构",
            level: treeNode.level + 1
        };
        saveCityOrganizationFun(params, treeNode);
    });
};

function removeHoverDom(treeId, treeNode) {
    $("#addBtn_" + treeNode.tId).unbind().remove();
};

function selectAll() {
    var zTree = $.fn.zTree.getZTreeObj("organizationTree");
    zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
}

/**
 * ztree方法 结束
 */

/**
 * 根据当前用户显示最所在组织机构
 */
function searchCityOrganizationFun() {
    /*ztree交互配置*/
    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false,
            showLine: false,
            showIcon: false
        },
        edit: {
            enable: true,
            editNameSelectAll: true,
            removeTitle: "删除",
            renameTitle: "编辑"
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: onClick,
            beforeDrag: beforeDrag,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename,
            onRemove: onRemove,
            onRename: onRename
        }
    };
    var url = "/system/searchCityOrganization";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        var zNode = result.data;
        zNode.push({id: 0, pid: -1, name: "::组织机构::", open: true, noRemoveBtn: true, noEditBtn: true});
        $.fn.zTree.init($("#organizationTree"), setting, zNode);
        $("#selectAll").bind("click", selectAll);
    }
}

/**
 * 保存子级组织机构
 * @param params
 */
function saveCityOrganizationFun(params, treeNode) {
    var url = "/system/saveCityOrganization";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var zTree = $.fn.zTree.getZTreeObj("organizationTree");
            zTree.addNodes(treeNode, data);
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 保存子级组织机构
 * @param params
 */
function updateCityOrganizationFun(params, treeNode, isCancel) {
    var url = "/system/saveCityOrganization";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            if (data != null) {

            } else {
                notify.error({title: "提示", content: "该机构名称已存在"});
                isCancel = true;
                return false;
            }
            return true;
        } else {
            isCancel = true;
            return false;
        }
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
        if (result.success) {
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 根据系统用户省市区组织信息id查看用户列表
 */
function searchSysUserPageByCityOrganizationIdFun() {
    var url = "/system/searchSysUserPageByCityOrganizationId";

    var userName = $(".userName").val().trim();
    var options = {
        columns: [{
            field: 'id',
            title: "用户ID",
            align: "center",
            valign: "middle"
        }, {
            field: 'userAccount',
            title: "用户账户",
            align: "left",
            valign: "middle"

        }, {
            field: 'userName',
            title: "用户名称",
            align: "center",
            valign: "middle"
        }, {
            field: 'roleName',
            title: "用户角色",
            align: "center",
            valign: "middle"
        }, {
            field: 'createDatetime',
            title: "创建时间",
            align: "center",
            valign: "middle"
        }, {
            title: "操作",
            align: "center",
            valign: "middle",
            formatter: function (value, row, index) {
                var _html = "";
                // _html += "<button class=\"viewBtn\"  type=\"button\" rowId=\"" + row.id + "\">查看</button>";
                _html += "<button class=\"revise\"  type=\"button\" rowId=\"" + row.id + "\">修改</button>";
                _html += "<button class=\"delete\"  type=\"button\" rowId=\"" + row.id + "\">删除</button>";
                return _html;
            }
        }],
        contentType: "application/x-www-form-urlencoded",
        paginationPreText: "<i class='glyphicon glyphicon-menu-left'></i>",
        paginationNextText: "<i class='glyphicon glyphicon-menu-right'></i>",
        paginationLoop: false,
        method: 'post',
        pagination: true,
        sidePagination: 'server',
        pageNumber: 1,
        pageSize: 10,
        dataType: "",
        url: url,
        pageList: [10, 25, 50, 100],
        queryParamsType: '',
        formatNoMatches: function () {
            var _nodata = '<div class="text-center"><img src="../../images/no_data.png">'
                + '<p>没有搜到任何数据</p></div>';
            return _nodata;
        },
        onLoadSuccess: function () {
        },
        queryParams: function (params) {
            return {
                userName: userName,
                cityOrganizationId: cityOrganizationId,
                pageSize: params.pageSize,
                pageNumber: params.pageNumber
            }
        }

    };

    $("#table-user").bootstrapTable("destroy").bootstrapTable(options);
}

/**
 * 查询角色信息
 */
function searchSysRoleFun() {
    var url = "/system/searchSysRoleSelect";
    var params = {};
    execAjax(url, params, callback);
    var html = '<option value="">请选择用户角色</option>';

    function callback(result) {
        var data = result.data;
        for (var i in data) {
            var info = data[i];
            var roleId = info.roleId;
            var roleName = info.roleName;
            html += '<option value="' + roleId + '">' + roleName + '</option>';
        }
        $("#roleId").append(html).selectpicker('refresh');
        $("#roleIdE").append(html).selectpicker('refresh');
    }
}

function validateFun() {
    $("#userInfoForm").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            // valid: 'glyphicon glyphicon-ok',
            // invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userAccount: {
                validators: {
                    notEmpty: {
                        message: '请输入用户账户'
                    },
                    stringLength: {
                        max: 10,
                        message: '用户账户不能大于10个字符'
                    },
                    remote: {
                        url: "/system/searchExistByUserAccount",
                        type: "post",
                        delay: 1000,
                        // async: false, //改为同步
                        message: '该账户已被注册请使用其他账户'
                    }
                }
            },
            userName: {
                validators: {
                    notEmpty: {
                        message: '请输入用户名称'
                    },
                    stringLength: {
                        max: 20,
                        message: '用户名称不能大于20个字符'
                    }
                }
            },
            userPassword: {
                validators: {
                    notEmpty: {
                        message: '请输入用户密码',
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '密码长度必须在6到30之间'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: '请输入用户密码',
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '密码长度必须在6到30之间'
                    },
                    identical: {
                        field: 'userPassword',
                        message: '两次密码不一致'
                    }
                }
            },
            roleId: {
                validators: {
                    notEmpty: {
                        message: '请选择角色'
                    }
                }
            }
        }
    });
}

function validateEditFun() {
    $("#userInfoEditForm").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            // valid: 'glyphicon glyphicon-ok',
            // invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userName: {
                validators: {
                    notEmpty: {
                        message: '请输入用户名称'
                    },
                    stringLength: {
                        max: 20,
                        message: '用户名称不能大于20个字符'
                    }
                }
            },
            oldPassword: {
                validators: {
                    notEmpty: {
                        message: '请输入用户密码',
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '密码长度必须在6到30之间'
                    },
                    threshold: 6,
                    remote: {
                        url: "/system/verifyIdentity",
                        type: "post",
                        delay: 1000,
                        data: {
                            userAccount: $("#userInfoEditForm #userAccount").val(),
                            userPassword: $("#userInfoEditForm #oldPassword").val()
                        },
                        message: '密码错误，请重新输入'
                    }
                }
            },
            userPassword: {
                validators: {
                    notEmpty: {
                        message: '请输入用户密码',
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '密码长度必须在6到30之间'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: '请输入用户密码',
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '密码长度必须在6到30之间'
                    },
                    identical: {
                        field: 'userPassword',
                        message: '两次密码不一致'
                    }
                }
            },
            roleId: {
                validators: {
                    notEmpty: {
                        message: '请选择角色'
                    }
                }
            }
        }
    });
}

function onUserNameBlurHandler() {
    $('#userInfoForm').bootstrapValidator();
    var bv = $('#userInfoForm').data("bootstrapValidator");
    var bool = bv.validateField("userAccount");
    var bool2 = bv.isValid();
    console.log(bool)
    console.log(bool2)
}

function onOldPasswordBlurHandler() {
    $('#userInfoEditForm').bootstrapValidator();
    var bv = $('#userInfoEditForm').data("bootstrapValidator");
    var bool = bv.validateField("oldPassword");
    var bool2 = bv.isValid();
    console.log(bool)
    console.log(bool2)
}

/**
 * 保存用户信息
 */
function saveSysUserInfoFun(params) {
    var url = "/system/saveSysUserInfo";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            resetForm("#userInfoForm");
            resetForm("#userInfoEditForm");
            $("#newUser").modal("hide");
            $("#editUser").modal("hide");
            notify.success({title: "提示", content: result.message, autoClose: true});
            bootstrapTableRefresh();
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 删除用户信息
 */
function delSysUserFun(userId) {
    var url = "/system/delSysUser";
    var params = {
        userId: userId
    };
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            bootstrapTableRefresh();
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 根据用户id查看用户信息
 * @param userId
 */
function searchSysUserFun(userId) {
    var url = "/system/searchSysUserById";
    var params = {
        userId: userId
    };
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var userAccount = data.userAccount;
            $("#editUser #userAccount").val(userAccount);
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

function bootstrapTableRefresh() {
    $("#table-user").bootstrapTable('refresh');
}


