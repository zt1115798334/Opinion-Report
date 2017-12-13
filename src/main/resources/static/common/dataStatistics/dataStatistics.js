$(function () {

    searchDisplayMenuFun("#li_005", "#lli_011");

    showMenuTitle("数据统计");

    /**
     * 获取数据
     */
    searchDataFun();

    $(document).on("click", ".formSubmit", function () {

        if (isNotEmpty($("#dataAnalysisChartBase64").val() &&
                isNotEmpty($("#dataLevelDistributionBase64").val()) &&
                isNotEmpty($("#dataSourceDistributionBase64").val()) &&
                isNotEmpty($("#dataEffectDistributionBase64").val()))) {
            console.log("我开始提交了啊")
            $("#downPresentation").submit();
        } else {
            notify.error({title: "提示", content: "数据还未加载完成请稍等！！", autoClose: true});
        }
    });

});

/**
 * 获取数据
 */
function searchDataFun() {
    var url = "/dataStatistics/searchData";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {

        //近一周舆情上报数
        var myChart1 = echarts.init(document.getElementById('echart-ds1'));
        //本周上报舆情等级分布
        var myChart2 = echarts.init(document.getElementById('echart-ds2'));
        //本周上报舆情来源分布
        var myChart3 = echarts.init(document.getElementById('echart-ds3'));
        //本周上报舆情影响力分析
        var myChart4 = echarts.init(document.getElementById('echart-ds4'));
        // 图表屏幕自适应
        setTimeout(function () {
            window.onresize = function () {
                myChart1.resize();
                myChart2.resize();
                myChart3.resize();
                myChart4.resize();
            }
        }, 200);


        /**
         * 舆情上报分析 -- 折线图信息
         */
        dataAnalysisChartFun(myChart1);

        /**
         * 舆情上报分析 -- 比例信息
         */
        dataAnalysisProportionFun();

        /**
         * 舆情上报分析 -- 表信息
         */
        dataAnalysisTableFun();

        /**
         * 本周上报舆情等级分布
         */
        dataLevelDistributionFun(myChart2);

        /**
         * 本周上报舆情来源分布
         */
        dataSourceDistributionFun(myChart3);

        /**
         * 本周上报舆情等级来源  -- 表
         */
        dataLevelSourceTableFun();

        /**
         * 本周上报舆情影响力分析 -- 图
         */
        dataEffectDistributionFun(myChart4);

        /**
         * 本周上报舆情影响力分析 -- 表
         */
        dataEffectTableFun();
    }
}

/**
 * 舆情上报分析 -- 折线图信息
 */
function dataAnalysisChartFun(myChart1) {
    var url = "/dataStatistics/dataAnalysisChart";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;

            var date = data.date;
            var value = data.value;

            var option1 = {
                animationDuration: 500,
                color: ["#03b2fc"],
                title: {
                    text: '近一周舆情上报数',
                    textStyle: {
                        fontSize: '14px'
                    }
                },
                tooltip: {
                    trigger: 'axis'
                },
                grid: {
                    left: '3%',
                    right: '0px',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: date,
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: '#8e99a8',
                            width: 1,
                            type: 'solid'
                        }
                    }
                },
                yAxis: [{
                    type: 'value',
                    axisTick: {
                        show: false
                    },
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: '#8e99a8',
                            width: 1,
                            type: 'solid'
                        }
                    },
                    axisLabel: {
                        margin: 10,
                    },

                    splitLine: {
                        show: false,
                        lineStyle: {
                            color: '#57617B'
                        }
                    },
                    splitArea: {
                        show: false
                    },
                }],
                series: [{
                    name: '舆情上报数',
                    type: 'line',
                    smooth: true,
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(3, 178, 252, 0.7)'
                            }, {
                                offset: 1,
                                color: 'rgba(3, 178, 252, 0)'
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                            shadowBlur: 10
                        }
                    },
                    data: value
                }]
            };
            myChart1.setOption(option1);
            setTimeout(function () {
                var dataAnalysisChartBase64 = myChart1.getDataURL('png');
                $("#dataAnalysisChartBase64").val(dataAnalysisChartBase64);
            }, 600);

        }
    }
}

/**
 * 舆情上报分析 -- 比例信息
 */
function dataAnalysisProportionFun() {
    var url = "/dataStatistics/dataAnalysisProportion";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {

            var upImgUrl = "/assets/images/top_03.png";
            var downImgUrl = "/assets/images/bottom_03.png";

            var data = result.data;

            var allInfo = data.allInfo;
            var adoptInfo = data.adoptInfo;

            var _allInfo = $(".allInfo");
            _allInfo.html(allInfo.weekCount);
            if (allInfo.type == "down") {
                _allInfo.next().find("img").attr("src", downImgUrl);
            }
            if (allInfo.type == "up") {
                _allInfo.next().find("img").attr("src", upImgUrl);
            }
            _allInfo.next().find("span").html(allInfo.num + "% <span class=\"colorglay\">同比上周</span>");

            var _adoptInfo = $(".adoptInfo");
            _adoptInfo.html(adoptInfo.weekCount);
            if (adoptInfo.type == "down") {
                _adoptInfo.next().find("img").attr("src", downImgUrl);
            }
            if (adoptInfo.type == "up") {
                _adoptInfo.next().find("img").attr("src", upImgUrl);
            }
            _adoptInfo.next().find("span").html(adoptInfo.num + "% <span class=\"colorglay\">同比上周</span>");

        }
    }
}

/**
 * 舆情上报分析 -- 表信息
 */
function dataAnalysisTableFun() {
    var url = "/dataStatistics/dataAnalysisTable";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var _table = $("table.dataAnalysisTable");


            var date = data.date;
            var dateHtml = '<th>日期</th>';
            $.each(date, function (index, value) {
                dateHtml += '<th>' + value + '</th>';
            });
            _table.find(".date").html(dateHtml);
            var reportCount = data.reportCount;
            var reportCountHtml = '<td>舆情上报数</td>';
            $.each(reportCount, function (index, value) {
                // reportCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                reportCountHtml += '<td>' + value + '</td>';
            });
            _table.find(".report").html(reportCountHtml);
            var adoptCount = data.adoptCount;
            var adoptCountHtml = '<td>舆情采纳数</td>';
            $.each(adoptCount, function (index, value) {
                // adoptCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                adoptCountHtml += '<td>' + value + '</td>';
            });
            _table.find(".adopt").html(adoptCountHtml);

        }
    }
}

/**
 * 本周上报舆情等级分布
 */
function dataLevelDistributionFun(myChart2) {
    var url = "/dataStatistics/dataLevelDistribution";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;

            var echartData = data.info;
            var legendData = data.name;
            var allCount = data.allCount;
            var redProportion = data.redProportion;
            var orangeProportion = data.orangeProportion;
            var yellowProportion = data.yellowProportion;

            $(".redProportion").html(redProportion + "%");
            $(".orangeProportion").html(orangeProportion + "%");
            $(".yellowProportion").html(yellowProportion + "%");

            var option2 = {
                animationDuration: 500,
                color: ['#fc6d6e', '#ff9901', '#ffcc01'],
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                title: {
                    text: allCount,
                    subtext: '主机（台）',
                    left: 'center',
                    top: '35%',
                    padding: [24, 0],
                    textStyle: {
                        color: '#34495e',
                        fontSize: 32,
                        align: 'center'
                    },
                    subtextStyle: {
                        color: '#8d989d',
                        fontSize: 14,
                        align: 'center'
                    }
                },
                series: [{
                    symbol: 'circle',
                    name: '等级',
                    type: 'pie',
                    radius: ['56%', '76%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: false,
                            textStyle: {
                                fontSize: '16',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: 5,
                            borderColor: '#fff'
                        }
                    },
                    data: echartData
                }]
            };

            myChart2.setOption(option2);
            setTimeout(function () {
                var dataLevelDistributionBase64 = myChart2.getDataURL('png');
                $("#dataLevelDistributionBase64").val(dataLevelDistributionBase64);
            }, 600);
        }
    }
}

/**
 * 本周上报舆情来源分布
 */
function dataSourceDistributionFun(myChart3) {
    var url = "/dataStatistics/dataSourceDistribution";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;

            var echartData = data.info;
            var name = data.name;

            var scale = 1;

            var option3 = {
                animationDuration: 500,
                series: [{
                    name: '来源',
                    type: 'pie',
                    radius: ['52%', '70%'],
                    hoverAnimation: false,
                    color: ['#02cca6', '#01d8e4', '#fcdc5c', '#fd6e6f'],
                    label: {
                        normal: {
                            formatter: function (params, ticket, callback) {
                                var total = 0; //来源总数量
                                var percent = 0; //来源占比
                                echartData.forEach(function (value, index, array) {
                                    total += value.value;
                                });
                                percent = ((params.value / total) * 100).toFixed(1);
                                return '' + params.name + '\n\n\n' + percent + '%';
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            length: 15 * scale,
                            length2: 60,
                            lineStyle: {
                                color: '#ededed'
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: 5,
                            borderColor: '#fff'
                        }
                    },
                    data: echartData
                }]
            };
            myChart3.setOption(option3);
            setTimeout(function () {
                var dataSourceDistributionBase64 = myChart3.getDataURL('png');
                $("#dataSourceDistributionBase64").val(dataSourceDistributionBase64);
            }, 600);
        }
    }
}

/**
 * 本周上报舆情等级来源  -- 表
 */
function dataLevelSourceTableFun() {
    var url = "/dataStatistics/dataLevelSourceTable";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var _table = $("table.dataLevelSourceTable");

            var date = data.date;
            var dateHtml = '<th>类别</th>\n' +
                '                            <th>日期</th>';
            $.each(date, function (index, value) {
                dateHtml += '<th>' + value + '</th>';
            });
            _table.find(".date").html(dateHtml);

            var redReportLevelCount = data.redReportLevelCount;
            var redReportLevelCountHtml = '<td rowspan="3">舆情等级统计</td>\n' +
                '                            <td><span class="colorred">红色等级数</span></td>';
            $.each(redReportLevelCount, function (index, value) {
                // reportCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                redReportLevelCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".redReportLevel").html(redReportLevelCountHtml);
            var orangeReportLevelCount = data.orangeReportLevelCount;
            var orangeReportLevelCountHtml = '<td><span class="colororange">橙色等级数</span></td>';
            $.each(orangeReportLevelCount, function (index, value) {
                // reportCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                orangeReportLevelCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".orangeReportLevelCount").html(orangeReportLevelCountHtml);
            var yellowReportLevelCount = data.yellowReportLevelCount;
            var yellowReportLevelCountHtml = '<td><span class="coloryellow">黄色等级数</span></td>';
            $.each(yellowReportLevelCount, function (index, value) {
                // yellowReportLevelCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                yellowReportLevelCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".yellowReportLevelCount").html(yellowReportLevelCountHtml);

            var networkSourceTypeCount = data.networkSourceTypeCount;
            var networkSourceTypeCountHtml = '<td rowspan="4">舆情采纳数</td>\n' +
                '                            <td><span class="colorgreen">网络</span></td>';
            $.each(networkSourceTypeCount, function (index, value) {
                // networkSourceTypeCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                networkSourceTypeCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".networkSourceTypeCount").html(networkSourceTypeCountHtml);
            var mediaSourceTypeCount = data.mediaSourceTypeCount;
            var mediaSourceTypeCountHtml = ' <td><span class="colorgreen">媒体</span></td>';
            $.each(mediaSourceTypeCount, function (index, value) {
                // mediaSourceTypeCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                mediaSourceTypeCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".mediaSourceTypeCount").html(mediaSourceTypeCountHtml);
            var sceneSourceTypeCount = data.sceneSourceTypeCount;
            var sceneSourceTypeCountHtml = '<td><span class="colorgreen">现场</span></td>';
            $.each(sceneSourceTypeCount, function (index, value) {
                // sceneSourceTypeCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                sceneSourceTypeCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".sceneSourceTypeCount").html(sceneSourceTypeCountHtml);
            var otherSourceTypeCount = data.otherSourceTypeCount;
            var otherSourceTypeCountHtml = '<td><span class="colorgreen">其他</span></td>';
            $.each(otherSourceTypeCount, function (index, value) {
                // otherSourceTypeCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                otherSourceTypeCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".otherSourceTypeCount").html(otherSourceTypeCountHtml);

        }
    }
}

/**
 * 本周上报舆情影响力分析 -- 图
 */
function dataEffectDistributionFun(myChart4) {
    var url = "/dataStatistics/dataEffectDistribution";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;

            var date = data.date;

            var clickCount = data.clickCount;
            var commentCount = data.commentCount;
            var estimateCount = data.estimateCount;

            var option4 = {
                animationDuration: 500,
                color: ['#02cca6', '#01d8e4', '#ffcc01'],
                grid: {
                    y: '6%',
                    y2: '0',
                    x: '0',
                    x2: '0',
                    containLabel: true
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    icon: 'circle',
                    x: 'right',
                    padding: [0, 12, 0, 50],
                    itemWidth: 8,
                    itemHeight: 8,
                    data: ['点击数', '评论数', '预估值']
                },
                xAxis: [
                    {
                        axisLabel: {
                            interval: 0
                        },
                        show: true,
                        type: 'category',
                        data: date,
                        fontSize: 6,
                        scale: true,
                        axisTick: {
                            alignWithLabel: false
                        },
                        splitLine: {
                            show: false
                        },
                        axisLine: {
                            show: true,
                            lineStyle: {
                                color: '#8e99a8',
                                width: 1,
                                type: 'solid'
                            }
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            formatter: '{value}'
                        },
                        splitLine: {
                            show: false
                        },
                        axisLine: {
                            show: true,
                            lineStyle: {
                                color: '#8e99a8',
                                width: 1,
                                type: 'solid'
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '点击数',
                        type: 'bar',
                        barWidth: '12%',
                        barGap: '50%',
                        data: clickCount


                    },
                    {
                        name: '评论数',
                        type: 'bar',
                        barWidth: '12%',
                        barGap: '50%',
                        data: commentCount
                    },
                    {
                        name: '预估值',
                        type: 'bar',
                        barWidth: '12%',
                        barGap: '50%',
                        data: estimateCount
                    }

                ]
            };
            myChart4.setOption(option4);
            setTimeout(function () {
                var dataEffectDistributionBase64 = myChart4.getDataURL('png');
                $("#dataEffectDistributionBase64").val(dataEffectDistributionBase64);
            }, 600);
        }
    }
}

/**
 * 本周上报舆情影响力分析 -- 表
 */
function dataEffectTableFun() {
    var url = "/dataStatistics/dataEffectTable";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var _table = $("table.dataEffectTable");

            var date = data.date;
            var dateHtml = '<th>日期</th>';
            $.each(date, function (index, value) {
                dateHtml += '<th>' + value + '</th>';
            });
            _table.find(".date").html(dateHtml);

            var clickCount = data.clickCount;
            var clickCountHtml = '<th>点击数</th>';
            $.each(clickCount, function (index, value) {
                // clickCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                clickCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".clickCount").html(clickCountHtml);

            var commentCount = data.commentCount;
            var commentCountHtml = '<th>评论数</th>';
            $.each(commentCount, function (index, value) {
                // commentCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                commentCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".commentCount").html(commentCountHtml);
            var estimateCount = data.estimateCount;
            var estimateCountHtml = '<th>预估值</th>';
            $.each(estimateCount, function (index, value) {
                // estimateCountHtml += '<td><a target="_blank" href="">' + value + '</a></td>';
                estimateCountHtml += '<th>' + value + '</th>';
            });
            _table.find(".estimateCount").html(estimateCountHtml);
        }
    }
}
