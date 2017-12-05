<!DOCTYPE html>
<html>
<head>
    <title>舆情上报详情（编辑）</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>
    <link href="/assets/plugins/wangEditor-3.0.15/release/wangEditor.css" type="text/css" rel="stylesheet"><!-- 编辑器-->
    <script type="text/javascript" src="/assets/plugins/wangEditor-3.0.15/release/wangEditor.js"
            charset="utf-8"></script><!-- 编辑器-->
    <link href="/assets/plugins/bootstrapValidator/css/bootstrapValidator.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/assets/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/assets/plugins/jquery.serializejson.min.js"></script>
</head>
<body>
<#include "/public/header.ftl"/>
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <div id="page-wrapper" style="margin-left: 260px;">
        <div class="page-content clearfix">
            <form role="form" id="opinionReportForm">
                <div class="bgf clearfix">
                    <div class="portlet box clearfix">
                        <div class="portlet-header clearfix">
                            <span class="circle1"></span>
                            <span class="inlineBlock  fs16">基本信息</span>
                        </div>
                        <div class="portlet-body clearfix">
                            <div class="infoMenuDiv">
                                <div class="col-md-6 m8">
                                    <label for="" class="control-label col-md-3"><span
                                            class="require">*</span>舆情标题:</label>
                                    <input type="text" name="title" class="inlineBlock calendar-input" placeholder="请输入舆情标题，50汉字内">
                                </div>
                                <div class="col-md-6 m8 dateDiv3">
                                    <label for="" class="control-label col-md-3"><span
                                            class="require">*</span>来源:</label>
                                    <select name="sourceType" class="selectpicker">
                                        <option value="">请选择来源</option>
                                        <option value="network">网络</option>
                                        <option value="media">媒体</option>
                                        <option value="scene">现场</option>
                                        <option value="other">其他</option>
                                    </select>
                                </div>
                                <div class="col-md-6 m8 dateDiv3">
                                    <label for="" class="control-label col-md-3"><span
                                            class="require">*</span>等级:</label>
                                    <select name="reportLevel" class="selectpicker">
                                        <option value="">请选择等级</option>
                                        <option value="2red">红色</option>
                                        <option value="1orange">橙色</option>
                                        <option value="0yellow">黄色</option>
                                    </select>
                                </div>
                                <div class="col-md-6 m8 dateDiv3">
                                    <label for="" class="control-label col-md-3"><span
                                            class="require">*</span>影响范围:</label>
                                    <select name="replyType" class="selectpicker col-md-3 noPaddingX">
                                        <option value="click">点击数</option>
                                        <option value="comment">评论数</option>
                                        <option value="estimate">预估值</option>
                                    </select>
                                    <input name="replyNumber" type="text" class="inlineBlock calendar-input2" placeholder="请输入数值">
                                </div>
                                <div class="col-md-6 m8">
                                    <label for="" class="control-label col-md-3">链接网址:</label>
                                    <input name="sourceUrl" type="text" class="inlineBlock calendar-input" placeholder="请输入链接网址（选填）">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="portlet box clearfix">
                        <div class="portlet-header clearfix">
                            <span class="circle1"></span>
                            <span class="inlineBlock  fs16">舆情内容</span>
                        </div>
                        <div class="portlet-body clearfix">

                            <!-- 编辑器wangEditor-->
                            <div id="editor">

                            </div>

                        </div>
                    </div>
                    <div class="col-md-12 text-center  padding20 clearfix" id="showButton">
                        <input id="" type="button" class="btn btn-primary button_green execBtn" onclick="" value="提交">
                    </div>
                </div>
            </form>
        </div>
        <!--page-content结束-->
    </div>
    <!--page-wrapper结束-->
</div>
<!--wrapper结束-->
<#include "/public/footer.ftl"/>
<#include "/public/publicJs.ftl"/>
<script src="/common/report/opinionReportEdit.js"></script>
</body>
</html>