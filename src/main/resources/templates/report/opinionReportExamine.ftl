<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>舆情上报详情</title>
<#include "/public/public.ftl"/>
    <link href="/assets/css/flowShaft.css" type="text/css" rel="stylesheet"><!--流程轴样式-->
    <link href="/assets/plugins/wangEditor-3.0.15/release/wangEditor.css" type="text/css" rel="stylesheet"><!-- 编辑器-->
    <script type="text/javascript" src="/assets/plugins/wangEditor-3.0.15/release/wangEditor.js"
            charset="utf-8"></script><!-- 编辑器-->
</head>
<body>
<#include "/public/header.ftl"/>
<input id="type" value="${type}" type="hidden">
<input id="reportCode" value="${reportCode}" type="hidden">
<div id="wrapper">
    <div id="page-wrapper" style="margin-left: 260px;">
        <div class="page-content clearfix">
            <div class="bgf clearfix">
                <div class="portlet box clearfix">
                    <div class="portlet-header clearfix">
                        <div class="caseDescription" id="">
                            <div class="opinionHeader clearfix">
                                <h5 class="fs16 bold">携程亲子园事件最新进展：更多虐童视频流出</h5>
                            </div>
                            <div class="opinionBody  clearfix">
                                <div class="row m8">
                                    <div class="col-md-6 noPaddingX">
                                        来源：<span class="sourceType"></span>
                                    </div>
                                    <div class="col-md-6 noPaddingX">
                                        等级：<span class="reportLevel"></span>
                                    </div>
                                </div>
                                <div class="row m8">
                                    <div class="col-md-6 noPaddingX">
                                        影响范围：<span class="reply"></span>
                                    </div>
                                    <div class="col-md-6 noPaddingX">
                                        链接网址：<a href="" class="colorfive sourceUrl" target="_blank"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body clearfix">
                        <!-- 编辑器wangEditor-->
                        <div id="editor">

                        </div>

                        <!--流程轴-->
                        <div class="bgf flowShaft">
                            <h5 style="padding: 10px 5px;font-weight: 600;">处理记录</h5>

                        </div>
                    </div>
                </div>

                <!--处理按钮-->
                <div class="col-md-12 text-center  padding20 clearfix" id="showButton">
                    <input id="ddddd" type="button" class="btn btn-primary modalBtn_orange adoptBtn" adoptState="notAdopted"
                           value="不予采纳">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary modalBtn adoptBtn" adoptState="adopt" value="采纳">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary modalBtn_lingtgray report" value="上报">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary modalBtn_lingtgray return" value="返回">
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
<script src="/common/report/opinionReportExamine.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('.selectpicker').selectpicker({
            style: 'btn-default',
            size: 5
        });

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