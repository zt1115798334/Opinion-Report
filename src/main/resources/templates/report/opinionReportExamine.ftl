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
    <style type="text/css">
        .w-e-text-container{ /*编辑器文本区域高度*/
            height: 470px !important;
        }
    </style>
</head>
<body>
<#include "/public/header.ftl"/>
<input id="type" value="${type}" type="hidden">
<input id="reportCode" value="${reportCode}" type="hidden">
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <div id="page-wrapper" style="margin-left: 220px;">
        <div class="page-content clearfix">
            <div class="bgf clearfix">
                <div class="portlet box clearfix">
                    <div class="portlet-header clearfix">
                        <div class="caseDescription" id="">
                            <div class="opinionHeader clearfix">
                                <h5 class="fs16 bold title"></h5>
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
                                        链接网址：<a href="" class="colorgreen sourceUrl" target="_blank"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body clearfix">
                        <!-- 编辑器wangEditor-->
                        <div id="editor" style="height: 500px;">

                        </div>

                        <!--流程轴-->
                        <div class="bgf flowShaft">
                            <h5  class="fs16 bold" style="padding: 10px 5px;">处理记录</h5>

                        </div>
                    </div>
                </div>

                <!--处理按钮-->
                <div class="col-md-12 text-center  padding20 clearfix" id="showButton">
                    <input id="ddddd" type="button" class="btn btn-primary button_red adoptBtn" adoptState="notAdopted"
                           value="不予采纳">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary button_green adoptBtn" adoptState="adopt" value="采纳">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary denyBtn_green report" value="上报">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary denyBtn_green return" value="返回">
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
<script src="/common/report/opinionReportExamine.js"></script>
</body>
</html>