$(function () {
    
});

/**
 * 查询下传信息(接受)
 * @param params
 */
function searchIssuedNoticeReceiveFun(params) {
    var url = "/reportArticle/searchPage";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

