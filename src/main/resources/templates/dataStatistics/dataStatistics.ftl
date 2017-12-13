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
        .fixed-table-toolbar {
            display: none;
        }
    </style>
</head>
<body>
<#include "/public/header.ftl"/>
<div id="wrapper">
    <#include "/public/menu.ftl"/>
    <div id="page-wrapper" style="margin-left: 220px;">
        <div class="page-content clearfix">
            <form action="/dataStatistics/downloadPresentation" method="post">
                <input id="dataAnalysisChartBase64" type="hidden" name="dataAnalysisChartBase64" value=""/>
                <input id="dataLevelDistributionBase64" type="hidden" name="dataLevelDistributionBase64" value=""/>
                <input id="dataSourceDistributionBase64" type="hidden" name="dataSourceDistributionBase64" value=""/>
                <input id="dataEffectDistributionBase64" type="hidden" name="dataEffectDistributionBase64" value=""/>
                <input type="submit" value="下载"/>
            </form>

            <div class="portlet box clearfix" style="border: 1px solid #e7e8f0;">
                <div class="portlet-header clearfix">
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