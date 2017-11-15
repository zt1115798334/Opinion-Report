$(function () {


    var params = {
        sortParam: "publishDatetime",
        sortType: "desc",
        pageNum: "1",
        pageSize: "10"
    };
    searchReportArticlePageFun(params);

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
});


function searchReportArticlePageFun(params) {
    var url = "/reportArticle/searchPage";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

function saveReportArticleFun(params) {
    var url = "/reportArticle/save";
    execAjaxJSON(url, params, callback);

    function callback(result) {

    }
}