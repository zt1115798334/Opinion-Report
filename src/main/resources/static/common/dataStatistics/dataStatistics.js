$(function () {

    /**
     * 舆情上报分析 -- 折线图信息
     */
    dataAnalysisChartFun();

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
    dataLevelDistributionFun();

    /**
     * 本周上报舆情来源分布
     */
    dataSourceDistributionFun();

    /**
     * 本周上报舆情等级来源  -- 表
     */
    dataLevelSourceTableFun();

    /**
     * 本周上报舆情影响力分析 -- 图
     */
    dataEffectDistributionFun();

    /**
     * 本周上报舆情影响力分析 -- 表
     */
    dataEffectTableFun();
});

/**
 * 舆情上报分析 -- 折线图信息
 */
function dataAnalysisChartFun() {
    var url = "/dataStatistics/dataAnalysisChart";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {

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

    }
}

/**
 * 本周上报舆情等级分布
 */
function dataLevelDistributionFun() {
    var url = "/dataStatistics/dataLevelDistribution";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {

    }
}

/**
 * 本周上报舆情来源分布
 */
function dataSourceDistributionFun() {
    var url = "/dataStatistics/dataSourceDistribution";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {

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

    }
}

/**
 * 本周上报舆情影响力分析 -- 图
 */
function dataEffectDistributionFun() {
    var url = "/dataStatistics/dataEffectDistribution";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {

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

    }
}
