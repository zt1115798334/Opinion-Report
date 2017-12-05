<!DOCTYPE html>
<html>
<head>
    <title>信息下发详情（回执）</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>
    <link href="/assets/css/flowShaft.css" type="text/css" rel="stylesheet"><!--流程轴样式-->
    <link href="/assets/plugins/wangEditor-3.0.15/release/wangEditor.css" type="text/css" rel="stylesheet"><!-- 编辑器-->
    <script type="text/javascript" src="/assets/plugins/wangEditor-3.0.15/release/wangEditor.js" charset="utf-8"></script><!-- 编辑器-->

    <style type="text/css">
        .w-e-text-container{ /*编辑器文本区域高度*/
            height: 470px !important;
        }
    </style>
</head>
<body>
<#include "/public/header.ftl"/>
<input id="type" value="${type}" type="hidden">
<input id="noticeCode" value="${noticeCode}" type="hidden">
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <div id="page-wrapper" style="margin-left: 260px;">
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
                                    <div class="col-md-12 noPaddingX">
                                        信息类型：<span class="noticeType"></span>
                                    </div>
                                </div>
                                <div class="row m8">
                                    <div class="col-md-12 noPaddingX">
                                        下发时间：<span class="publishDatetime"></span>
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

                        </div>
                    </div>
                </div>

                <!--处理按钮-->
                <div class="col-md-12 text-center  padding20 clearfix" id="showButton">
                    <input id="" type="button" class="btn btn-primary button_green execBtn" onclick="" value="回执">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="backListBtn" type="button" class="btn btn-primary denyBtn_green return"  value="返回">
                </div>

            </div>
        </div>
        <!--page-content结束-->
    </div>
    <!--page-wrapper结束-->
</div>
<#include "/public/footer.ftl"/>
<script src="/common/issued/issuedNoticeInfo.js?v=2"></script>
</body>
</html>