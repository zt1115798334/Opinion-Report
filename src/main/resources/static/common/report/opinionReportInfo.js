$(function () {

    var reportCode = $("#reportCode").val();
    if (reportCode == 0) {
        alert("添加操作");
    }else{
        alert("显示详情操作");
    }

    $(document).on("click", ".submit", function () {
        var title = $(".title").val();
        var sourceType = $(".source_type").val();
        var reportLevel = $(".report_level").val();
        var replyType = $(".reply_type").val();
        var replyNumber = $(".reply_number").val();
        var sourceUrl = $(".source_url").val();
        var reportCause = $(".report_cause").val();
        var params = {
            title: title,
            sourceType: sourceType,
            reportLevel: reportLevel,
            replyType: replyType,
            replyNumber: replyNumber,
            sourceUrl: sourceUrl,
            reportCause: reportCause
        };
        saveReportArticleFun(params);
    })

    var params = {
        reportCode: reportCode
    }
    searchReportArticleLogFun(params);
});


function saveReportArticleFun(params) {
    var url = "/reportArticle/saveReportArticle";
    execAjaxJSON(url, params, callback);

    function callback(result) {

    }
}

function searchReportArticleLogFun(params) {
    var url = "/reportArticle/searchReportArticleLog";
    execAjax(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}