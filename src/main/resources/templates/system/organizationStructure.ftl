<!DOCTYPE html>
<html>
<head>
    <title>组织机构</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>

    <link href="/assets/plugins/zTree/metroStyle/metroStyle.css" rel="stylesheet">
    <script src="/assets/plugins/zTree/js/jquery.ztree.all.js" type="text/javascript"></script>
    <link href="/assets/plugins/bootstrapValidator/css/bootstrapValidator.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/assets/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/assets/plugins/jquery.serializejson.min.js"></script>

</head>
<body>
<#include "/public/header.ftl"/>
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <!--sidebar左导航结束-->
    <div id="page-wrapper" style="margin-left: 220px;">
        <div class="page-content clearfix">
            <div class="bgf">
                <div class="portlet box clearfix">
                    <!--左侧-->
                    <div style="min-height: 600px;border-right: 1px solid #ededed;text-align: center" class="col-md-3">
                        <!--组织结构树 organizationTree-->
                        <div id="organizationTree" class="ztree padding20">

                        </div>
                    </div>
                    <!--右侧-->
                    <div class="col-md-9">
                        <div class="portlet box">
                            <div class="portlet-header clearfix">
                                <div class="filterDiv">
                                    <span>筛选条件：</span>
                                    <input type="text" class="inlineBlock marginX10 calendar-input userName"
                                           placeholder="请输入用户名">
                                    <a href="javascript:void(0)" class="button_red searchButton">
                                        搜索
                                    </a>
                                    <div class="tools">
                                        <a href="javascript:void(0)" class="button_green create" data-toggle="modal">
                                            新建用户
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="portlet-body clearfix">
                                <table class="p-table" id="table-user">

                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--page-content结束-->
    </div>
    <!--page-wrapper结束-->
</div>
<!--wrapper结束-->
<#include "/public/footer.ftl"/>
<!--新建用户模态框-->
<div id="newUser" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form role="form" id="userInfoForm">
            <div class="modal-content">
                <div class="modal-header logocbg">
                    <h5 class="modal-title colorwhite">新建用户</h5>
                </div>
                <div class="modal-body  text-center">
                    <div class="form-horizontal Margin">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">用户账户<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="userAccount" id="userAccountNew" type="text" placeholder="请输入用户账户(10字以内)"
                                           class="form-control" onblur="onUserNameBlurHandler()">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">用户名称<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="userName" id="userNameNew" type="text" placeholder="请输入用户名称(20字以内)"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">密码<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="userPassword" id="userPasswordNew" type="password"
                                           placeholder="请输入6-20位密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">确认密码<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="confirmPassword" id="confirmPasswordNew" type="password"
                                           placeholder="请输入确认密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">用户角色<span class="require">*</span></label>
                                <div class="col-md-6 dateDiv3">
                                    <select id="roleId" name="roleId" class="selectpicker">

                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-sm-12">
                        <button type="button" class="btn btn-primary sureBtn_green saveBtn">确认</button>
                        <button type="button" class="btn btn-default denyBtn_green" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="editUser" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form role="form" id="userInfoEditForm">
            <div class="modal-content">
                <div class="modal-header logocbg">
                    <h5 class="modal-title colorwhite">编辑用户</h5>
                </div>
                <div class="modal-body  text-center">
                    <div class="form-horizontal Margin">
                        <div class="form-body">
                            <input type="hidden" name="userAccount" id="userAccountEdit">
                            <div class="form-group">
                                <label class="col-md-2 control-label">用户名称<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="userName" id="userNameEdit" type="text" placeholder="请输入用户名称(20字以内)"
                                           class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">旧密码<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="oldPassword" id="oldPasswordEdit" type="password"
                                           placeholder="请输入旧密码密码" class="form-control"
                                           onblur="onOldPasswordBlurHandler()">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">密码<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="userPassword" id="userPasswordEdit" type="password"
                                           placeholder="请输入6-20位密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">确认密码<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="confirmPassword" id="confirmPasswordEdit" type="password"
                                           placeholder="请输入确认密码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">用户角色<span class="require">*</span></label>
                                <div class="col-md-6 dateDiv3">
                                    <select id="roleIdE" name="roleId" class="selectpicker">

                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-sm-12">
                        <button type="button" class="btn btn-primary sureBtn_green saveBtn">确认</button>
                        <button type="button" class="btn btn-default denyBtn_green" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="fingerprint" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header logocbg">
                    <h5 class="modal-title colorwhite">录入指纹</h5>
                </div>
                <div class="modal-body  text-center">
                    <div class="form-horizontal Margin">
                        <div class="form-body">
                            <canvas id="canvas" width="430" height="450"
                                    style="background: rgb(243, 245, 240)"></canvas>
                            <input type="hidden" id="userId">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-sm-12">
                        <button type="button" class="btn btn-primary sureBtn_green saveBtn">确认</button>
                        <button type="button" class="btn btn-default denyBtn_green" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
    </div>
</div>

<#include "/public/publicJs.ftl"/>

<script type="text/javascript" src="/assets/fingerprint/js/main.js"></script>
<script type="text/javascript" src="/assets/fingerprint/js/fingerprint.js"></script>
<script type="text/javascript" src="/assets/fingerprint/js/baseMoth.js"></script>
<script type="text/javascript" src="/assets/fingerprint/js/dhtmlxCommon.js"></script>


<script src="/common/system/organizationStructure.js?v=11"></script>
</body>
</html>