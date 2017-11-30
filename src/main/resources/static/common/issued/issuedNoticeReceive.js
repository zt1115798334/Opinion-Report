$(function () {

    searchIssuedNoticeReceiveFun();

    /**
     * 点击搜索操作
     */
    $(document).on("click", ".whiteButton", function () {
        searchIssuedNoticeReceiveFun();
    });

    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            searchIssuedNoticeReceiveFun();
        }
    };

    /**
     * 查看详情操作
     */
    $(document).on("click", "", function () {
        var noticeCode = $(this).attr("rowNoticeCode");
        window.location.href = "/reportArticle/opinionReportExaminePage/exec/" + noticeCode;
    });
});

/**
 * 查询下传信息(接受)
 * @param params
 */
function searchIssuedNoticeReceiveFun() {
    var url = "/issuedNotice/searchIssuedNoticeReceive";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

