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
                                    <input type="text" class="inlineBlock marginX10 calendar-input userName" placeholder="请输入用户名">
                                    <a href="javascript:void(0)" class="button_red searchButton">
                                        搜索
                                    </a>
                                    <div class="tools">
                                        <a href="javascript:void(0)" class="button_green" data-toggle="modal" data-target="#newUser">
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
<#include "/public/publicJs.ftl"/>
<script src="/common/system/organizationStructure.js?v=111"></script>
</body>
</html>