$(function () {

    var reportCode = $("#reportCode").val();
    var type = $("#type").val();
    if (type == "info") { //详情
        alert("详情");
    } else if (type == "examine") {     // 审核
        alert("审核");
    }
    var params = {
        reportCode:reportCode
    }
    searchReportArticleByCodeFun(params);
    searchReportArticleLogFun(params);

});

function searchReportArticleByCodeFun(params) {
    var url = "/reportArticle/searchReportArticleByCode";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

function searchReportArticleLogFun(params) {
    var url = "/reportArticle/searchReportArticleLog";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}