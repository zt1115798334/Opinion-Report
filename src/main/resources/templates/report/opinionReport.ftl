<!DOCTYPE html>
<html>
<head>
    <title>舆情上报列表</title>
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
    </style>
</head>
<body class="">
<#include "/public/header.ftl"/>
<div id="wrapper">
    <div id="page-wrapper" style="margin-left: 260px;">
        <div class="page-content clearfix">
            <div class="bgf">
                <div class="portlet box clearfix">
                    <div class="portlet-header clearfix">
                        <div class="filterDiv">
                            <span>筛选条件：</span>
                            <input type="text" class="inlineBlock marginX10 calendar-input" placeholder="请输入关键词">
                            <div class="dateDiv inlineBlock marginX10">
                                <select class="selectpicker">
                                    <option value="全部状态">全部状态</option>
                                    <option value="已上报">已上报</option>
                                    <option value="已采纳">已采纳</option>
                                    <option value="未采纳">未采纳</option>
                                </select>
                            </div>
                            <div class="dateDiv2 inlineBlock marginX10">
                                <select class="selectpicker">
                                    <option value="全部来源">全部来源</option>
                                    <option value="网络">网络</option>
                                    <option value="媒体">媒体</option>
                                    <option value="现场">现场</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                            <a href="javascript:void(0)" class="whiteButton">
                                搜索
                            </a>
                            <div class="tools">
                                <a href="javascript:void(0)" class="modalBtn">
                                    上报舆情
                                </a>
                            </div>
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
<script src="/common/utils.js"></script>
<script src="/common/report/opinionReport.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('.selectpicker').selectpicker({
            style: 'btn-info',
            size: 5
        });
        /* $(".viewReportBtn").on("click",function () {
             location.href="acceptanceReport.html";
         });*/

        //高度
        ResizeHeight();
        window.onresize = function () {
            ResizeHeight();
        }

    });

    function ResizeHeight() {
        var height = $(window).height() - 67 - 40;
        $("#wrapper").css("min-height", height);
    }
</script>

</body>
</html>