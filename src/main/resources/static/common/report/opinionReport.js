$(function () {
    var params = {
        sortParam: "publishDatetime",
        sortType: "desc",
        pageNum: "1",
        pageSize: "10"
    };
    searchReportArticlePageFun(params);
});

function searchReportArticlePageFun(params) {
    var url = "/reportArticle/searchPage";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}