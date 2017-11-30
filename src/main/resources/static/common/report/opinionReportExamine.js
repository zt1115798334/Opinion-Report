$(function () {

    var reportCode = $("#reportCode").val();
    if (reportCode == 0) {
        alert("添加操作");
    }else{
        alert("显示详情操作");
    }


});


function searchReportArticleLogFun(params) {
    var url = "/reportArticle/searchReportArticleLog";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}