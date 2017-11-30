$(function () {
    var noticeCode = $("#noticeCode").val();
    var type = $("#type").val();
    if (type == "info") { //详情
        alert("详情");
    } else if (type == "exec") {     // 审核
        alert("执行");
    }
    var params = {
        noticeCode: noticeCode
    };
    searchIssuedNoticeByCodeFun(params);
    searchIssuedNoticeLogFun(params);

    /**
     * 返回事件
     */
    $(document).on("click", "", function () {
        window.location.href = "/issuedNotice/issuedNoticeSendPage";
    });

    /**
     * 执行回执操作
     */
    $(document).on("click", "", function () {
        replyExecutionFun(params);
    });

});

/**
 * 查询当前用户下传信息 详情
 */
function searchIssuedNoticeByCodeFun(params) {
    var url = "/issuedNotice/searchIssuedNoticeByCode";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {

        }
    }
}


/**
 * 根据上报编号查询上报日志
 */
function searchIssuedNoticeLogFun(params) {
    var url = "/issuedNotice/searchIssuedNoticeLog";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {

        }
    }
}

/**
 * 执行回执操作
 */
function replyExecutionFun(params) {
    var url = "/issuedNotice/replyExecution";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {

        }
    }
}


