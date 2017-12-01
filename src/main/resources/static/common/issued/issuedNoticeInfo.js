$(function () {

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.debug = true;
    editor.customConfig.menus = []
    editor.customConfig.zIndex = 100;
    editor.create();
    editor.$textElem.attr('contenteditable', false);

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

    // /**
    //  * 返回事件
    //  */
    // $(document).on("click", "", function () {
    //     window.location.href = "/issuedNotice/issuedNoticeSendPage";
    // });

    // /**
    //  * 执行回执操作
    //  */
    // $(document).on("click", "", function () {
    //     replyExecutionFun(params);
    // });

});

/**
 * 查询当前用户下传信息 详情
 */
function searchIssuedNoticeByCodeFun(params, editor) {
    var url = "/issuedNotice/searchIssuedNoticeByCode";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var id = data.id;
            var noticeCode = data.noticeCode;
            var title = data.title;
            var publishDatetime = data.publishDatetime;
            var noticeType = data.noticeType;
            var noticeContent = data.noticeContent;
            var receiptState = data.receiptState;
            var receiptStateMsg = data.receiptStateMsg;
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
            var data = result.data;
            var allCount = data.allCount;
            var noticeCount = data.noticeCount;
            var da = data.da;
            for (var i in da) {
                var m = da[i];
                var msg = m.msg;
                var datetime = m.datetime;
            }
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
            alert(result.data.msg);
        }
    }
}


