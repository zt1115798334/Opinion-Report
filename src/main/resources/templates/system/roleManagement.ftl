<!DOCTYPE html>
<html>
<head>
    <title>角色权限管理</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>

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
                    <div class="portlet-header clearfix">
                        <div class="filterDiv">
                            <span>筛选条件：</span>
                            <input type="text" class="inlineBlock marginX10 calendar-input roleName"
                                   placeholder="请输入角色名">
                            <a href="javascript:void(0)" class="button_red searchButton">
                                搜索
                            </a>
                            <div class="tools">
                                <a href="javascript:void(0)" class="button_green create" data-toggle="modal">
                                    新建角色
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body clearfix">
                        <table class="p-table" id="table-role">
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--page-content结束-->
    </div>
    <!--page-wrapper结束-->
</div>
<#include "/public/footer.ftl"/>

<!--新建用户模态框-->
<div id="newRole" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form role="form" id="roleForm">
            <div class="modal-content">
                <div class="modal-header logocbg">
                    <h5 class="modal-title colorwhite" id="">新建角色</h5>
                </div>
                <div class="modal-body  text-center">
                    <div class="form-horizontal Margin">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-2 control-label">角色名称<span class="require">*</span></label>
                                <div class="col-md-6">
                                    <input name="roleName" id="roleName" type="text" placeholder="请输入角色名称(20字以内)"
                                           class="form-control" onblur="onRoleNameBlurHandler()">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-sm-12">
                        <button id="" type="button" class="btn btn-primary sureBtn_green saveBtn">确认</button>
                        <button type="button" class="btn btn-default denyBtn_green" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--权限管理模态框-->
<div id="jurisdiction" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 880px;">
        <div class="modal-content clearfix">
            <div class="modal-header logocbg">
                <h5 class="modal-title colorwhite">权限分配给【<span id="span_roleName" class="colorglay"></span>】</h5>
            </div>
            <div class="modal-body clearfix">
                <div class="form-horizontal clearfix">
                    <div class="form-body clearfix">
                        <!--  分配权限 -->
                        <div class="col-md-12 clearfix permissionsList">
                            <table class="p-table" style="width: 100%">
                                <thead>
                                <tr>
                                    <th data-field="sort">序号</th>
                                    <th data-field="moduleAuthority">模块权限</th>
                                    <th data-field="moduleAuthority2">子模块名称</th>
                                    <th data-field="operationAuthority">操作权限</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td rowspan="2">1</td>
                                    <td rowspan="2">舆情上报</td>
                                    <td>舆情上报(发出)</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="007">
                                                查看
                                            </label>
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="007001">
                                                上报舆情
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>舆情上报（接收）</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="008">
                                                查看
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2">2</td>
                                    <td rowspan="2">信息下发</td>
                                    <td>信息下发（发出）</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="009">
                                                查看
                                            </label>
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="009001">
                                                下发信息
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>信息下发（接收）</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="010">
                                                查看
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>数据统计</td>
                                    <td>数据统计</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="011">
                                                查看
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="2">4</td>
                                    <td rowspan="2">系统管理</td>
                                    <td>组织用户管理</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="012">
                                                查看
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>角色权限管理</td>
                                    <td>
                                        <div class="authority text-left">
                                            <label>
                                                <input type="checkbox" name="jurisdiction_code" value="013">
                                                查看
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="col-sm-12">
                    <button id="" type="button" class="btn btn-primary sureBtn_green saveBtn">确认</button>
                    <button type="button" class="btn btn-default denyBtn_green" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "/public/publicJs.ftl"/>
<script src="/common/system/roleManagement.js?v=22"></script>
</body>
</html>