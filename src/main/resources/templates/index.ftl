<!DOCTYPE html>
<html>
<head>
    <title>舆情工作平台</title>
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
<body>
<#include "/public/header.ftl"/>
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <!--sidebar左导航结束-->
    <div id="page-wrapper" style="margin-left: 220px;">
        <div class="page-content clearfix">
            <div class="col-md-8 page-wrapper-div-div">
                <div class="bgf">
                    <div class="homePage_data clearfix">
                        <div class="homePage_data_report pull-left">
                            <div class="homePage_data_title">
                                <img src="/assets/images/p1_03.png" style="width: 20px" alt="">
                                <span>本周上报数</span>
                            </div>
                            <div class="homePage_data_content text-center">
                                <h1 class="colorful_num_blue allInfo"></h1>
                                <p>
                                    <img src="" alt="">
                                    <span></span>
                                </p>
                            </div>
                        </div>
                        <div class="homePage_data_disAgree pull-left">
                            <div class="homePage_data_title">
                                <img src="/assets/images/p2_03.png" style="width: 20px" alt="">
                                <span>本周舆情未采纳数</span>
                            </div>
                            <div class="homePage_data_content text-center">
                                <h1 class="colorful_num_orange notAdoptInfo"></h1>
                                <p>
                                    <img src="" alt="">
                                    <span></span>
                                </p>
                            </div>
                        </div>
                        <div class="homePage_data_agree pull-left">
                            <div class="homePage_data_title">
                                <img src="/assets/images/p3_03.png" style="width: 20px" alt="">
                                <span>本周舆情采纳数</span>
                            </div>
                            <div class="homePage_data_content text-center">
                                <h1 class="colorful_num_green adoptInfo"></h1>
                                <p>
                                    <img src="" alt="">
                                    <span></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--滚动条插件盒子 myTabContent -->
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="div_work_items">

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="notificationCenter">
                    <div class="notificationHeader clearfix">
                        <div class="pull-left marginX10">
                            <span class="fs16" id="notificationHeader_img">
                                <img src="/assets/images/messageCenter.png" alt="" style="margin-right: 5px;">
                                通知中心
                            </span>
                        </div>
                        <a href="javascript:void(0)" onclick="" style="color: #2b93f5" id="clearAllBtn" class="pull-right fs12">清空消息</a>
                    </div>
                    <!--滚动条插件盒子 inner-content -->
                    <div id="inner-content">
                        <div class="notificationBody" id="messageDiv">

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
<script src="/common/index.js"></script>
</body>
</html>