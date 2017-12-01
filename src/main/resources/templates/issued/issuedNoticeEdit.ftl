<!DOCTYPE html>
<html>
<head>
    <title>信息下发详情（编辑）</title>
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
    <div id="page-wrapper" style="margin-left: 260px;">
        <div class="page-content clearfix">
            <form role="form" id="issuedNoticeForm">
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
                                            class="require">*</span>信息标题:</label>
                                    <input type="text" name="title" class="inlineBlock calendar-input"
                                           placeholder="请输入信息标题，50汉字内">
                                </div>
                                <div class="col-md-6 m8 dateDiv3">
                                    <label for="" class="control-label col-md-3"><span
                                            class="require">*</span>通知类型:</label>
                                    <select name="noticeType" class="selectpicker">
                                        <option value="">请选择类型</option>
                                        <option value="importantNotice">重要通知</option>
                                        <option value="workArrangement">工作安排</option>
                                        <option value="workSuggestion">工作建议</option>
                                        <option value="other">其他</option>
                                    </select>
                                </div>
                                <div class="col-md-6 m8 dateDiv3">
                                    <label for="" class="control-label col-md-3"><span
                                            class="require">*</span>下发范围:</label>
                                    <select name="noticeRange" class="selectpicker">
                                        <option value="">请选择范围</option>
                                        <option value="all">全部</option>
                                        <option value="municipal">地市级单位</option>
                                        <option value="county">区县级单位</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="portlet box clearfix">
                        <div class="portlet-header clearfix">
                            <span class="circle1"></span>
                            <span class="inlineBlock  fs16">信息内容</span>
                        </div>
                        <div class="portlet-body clearfix">

                            <!-- 编辑器wangEditor-->
                            <div id="editor">

                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-center  padding20 clearfix" id="showButton">
                        <input id="" type="button" class="btn btn-primary sureBtn" onclick="" value="提交">
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
<script src="/common/issued/issuedNoticeEdit.js"></script>
</body>
</html>