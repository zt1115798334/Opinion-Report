<!DOCTYPE html>
<html>
<head>
    <title>信息下发（接受）</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>

    <style type="text/css">
        .fixed-table-toolbar {
            display: none;
        }
        .p-table tbody tr td:nth-child(5){
            text-align: left;
        }
        .p-table tbody tr td:nth-child(5) span{
            margin-left: 15px;
        }
    </style></head>
<body>
<#include "/public/header.ftl"/>
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <div id="page-wrapper" style="margin-left: 260px;">
        <div class="page-content clearfix">
            <div class="bgf">
                <div class="portlet box clearfix">
                    <div class="portlet-header clearfix">
                        <div class="filterDiv">
                            <span>筛选条件：</span>
                            <input type="text" class="inlineBlock marginX10 calendar-input title" placeholder="请输入关键词">
                            <div class="dateDiv inlineBlock marginX10">
                                <select class="selectpicker receiptState">
                                    <option value="">全部状态</option>
                                    <option value="unreceipt">未回执</option>
                                    <option value="receipting">回执中</option>
                                    <option value="receipt">已回执</option>
                                </select>
                            </div>
                            <div class="dateDiv2 inlineBlock marginX10">
                                <select class="selectpicker noticeType">
                                    <option value="">全部类型</option>
                                    <option value="importantNotice">重要通知</option>
                                    <option value="workArrangement">工作安排</option>
                                    <option value="workSuggestion">工作建议</option>
                                    <option value="other">其他</option>
                                </select>
                            </div>
                            <a href="javascript:void(0)" class="button_red searchButton">
                                搜索
                            </a>
                        </div>

                    </div>
                    <div class="portlet-body clearfix">
                        <table class="p-table" id="table-report">

                        </table>
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
<script src="/common/issued/issuedNoticeReceive.js?v=1"></script>
</body>
</html>