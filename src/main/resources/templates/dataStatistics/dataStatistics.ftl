<!DOCTYPE html>
<html>
<head>
    <title>数据统计</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>

    <style type="text/css">
        .downloadBtn{
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<#include "/public/header.ftl"/>
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <div id="page-wrapper" style="margin-left: 220px;">
        <div class="page-content clearfix">
            <div class="portlet box clearfix" style="border: 1px solid #e7e8f0;">
                <div class="portlet-header clearfix">
                    <form id="downPresentation" action="/dataStatistics/downloadPresentation" method="post"  enctype="multipart/form-data">
                        <input id="dataAnalysisChartBase64" type="hidden" name="dataAnalysisChartBase64" value=""/>
                        <input id="dataLevelDistributionBase64" type="hidden" name="dataLevelDistributionBase64" value=""/>
                        <input id="dataSourceDistributionBase64" type="hidden" name="dataSourceDistributionBase64" value=""/>
                        <input id="dataEffectDistributionBase64" type="hidden" name="dataEffectDistributionBase64" value=""/>
                        <a href="javascript:void(0)" class="button_green pull-right downloadBtn formSubmit"><i class="download"></i>下载报告</a>
                    </form>

                    <div class="TxtHeader mb15">
                        <span class="barIcon"></span> <span class="fs16">舆情上报分析</span>
                    </div>
                    <div class="echartHeader col-md-3 clearfix noPaddingX">
                        <div class="data_div">
                            <div class="data_title">
                                <img src="/assets/images/report1_03.png" style="width: 19px" alt="">
                                <span class="fs13">&nbsp;本周累计上报舆情数</span>
                            </div>
                            <div class="data_content">
                                <h1 class="colorful_num_blue allInfo"></h1>
                                <p>
                                    <img src="" alt="">
                                    <span></span>
                                </p>
                            </div>
                        </div>
                        <div class="data_div">
                            <div class="data_title">
                                <img src="/assets/images/report2_03.png" style="width: 20px" alt="">
                                <span class="fs13">&nbsp;本周累计上报采纳数</span>
                            </div>
                            <div class="data_content">
                                <h1 class="colorful_num_green adoptInfo">4560</h1>
                                <p>
                                    <img src="" alt="">
                                    <span></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div id="echart-ds1" class="col-md-9" style="height:320px;border-left:1px solid #ededed;"></div>
                </div>
                <div class="portlet-body clearfix mt10" style="padding: 0">
                    <table class="table table-hover table-bordered text-center data-table dataAnalysisTable">
                        <thead>
                        <tr class="date">

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="report">

                        </tr>
                        <tr class="adopt">

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="portlet box clearfix  mt10" style="border: 1px solid #e7e8f0;">
                <div class="portlet-header col-md-6 clearfix mb10">
                    <div class="TxtHeader mb15">
                        <span class="barIcon"></span> <span class="fs16">本周上报舆情等级分布</span>
                    </div>
                    <div class="echartHeader col-md-4 pull-right clearfix noPaddingX ">
                        <div class="mb25 mt100">
                            <span class="disc disc-red"></span>红色
                            <span class="fs16 Margin redProportion"></span>
                        </div>
                        <div class="mb25">
                            <span class="disc disc-orange"></span>橙色
                            <span class="fs16 Margin orangeProportion"></span>
                        </div>
                        <div class="mb25">
                            <span class="disc disc-yellow"></span>黄色
                            <span class="fs16 Margin yellowProportion"></span>
                        </div>
                    </div>
                    <div id="echart-ds2" class="col-md-7" style="height:320px;"></div>
                </div>
                <div class="portlet-header col-md-6 clearfix mb10">
                    <div class="TxtHeader mb15">
                        <span class="barIcon"></span> <span class="fs16">本周上报舆情来源分布</span>
                    </div>
                    <div id="echart-ds3"  style="height:320px;"></div>
                </div>
                <div class="portlet-body clearfix" style="padding: 0;">
                    <table class="table table-hover table-bordered text-center data-table dataLevelSourceTable">
                        <thead>
                        <tr class="date">

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="redReportLevel">

                        </tr>
                        <tr class="orangeReportLevelCount">

                        </tr>
                        <tr class="yellowReportLevelCount">

                        </tr>
                        <tr class="networkSourceTypeCount">

                        </tr>
                        <tr class="mediaSourceTypeCount">

                        </tr>
                        <tr class="sceneSourceTypeCount">

                        </tr>
                        <tr class="otherSourceTypeCount">

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="portlet box clearfix  mt10" style="border: 1px solid #e7e8f0;">
                <div class="portlet-header clearfix">
                    <div class="TxtHeader mb15">
                        <span class="barIcon"></span> <span class="fs16">本周上报舆情影响力分析</span>
                    </div>
                    <div id="echart-ds4" style="height:320px;"></div>
                </div>
                <div class="portlet-body clearfix mt10" style="padding: 0">
                    <table class="table table-hover table-bordered text-center data-table dataEffectTable">
                        <thead>
                        <tr class="date">

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="clickCount">

                        </tr>
                        <tr class="commentCount">

                        </tr>
                        <tr class="estimateCount">

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--page-content结束-->
    </div>
</div>
<!--wrapper结束-->
<#include "/public/footer.ftl"/>

<#include "/public/publicJs.ftl"/>
<script src="/common/dataStatistics/dataStatistics.js"></script>
</body>
</html>