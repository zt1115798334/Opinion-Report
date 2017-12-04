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
            $(".execBtn").remove();
    } else if (type == "exec") {     // 审核
        $(".return").remove();
    }
    var params = {
        noticeCode: noticeCode
    };
    searchIssuedNoticeByCodeFun(params, editor);
    searchIssuedNoticeLogFun(params);

    /**
     * 返回事件
     */
    $(document).on("click", ".return", function () {
        window.location.href = "/issuedNotice/issuedNoticeSendPage";
    });

    /**
     * 执行回执操作
     */
    $(document).on("click", ".execBtn", function () {
        replyExecutionFun(params);
    });

});

/**
 * 查询当前用户下传信息 详情
 */
function searchIssuedNoticeByCodeFun(params, editor) {
    var url = "/issuedNotice/searchIssuedNoticeByCode";
    execAjax(url, params, callback);

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
            $(".title").html(title);
            $(".noticeType").html(noticeType);
            $(".publishDatetime").html(publishDatetime);
            editor.txt.html(noticeContent);
            if (receiptState == "receipt") {
                if ($(".execBtn").length > 0) {
                    $(".execBtn").attr("disabled", true);
                }
            }
        }
    }
}


/**
 * 根据上报编号查询上报日志
 */
function searchIssuedNoticeLogFun(params) {
    var url = "/issuedNotice/searchIssuedNoticeLog";

    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var allCount = data.allCount;
            var noticeCount = data.noticeCount;
            var da = data.data;
            var html = '<h5 class="fs16 bold" style="padding: 10px 5px;">处理记录 <span class="fs12 colorgreen">已回执' + noticeCount + '/' + allCount + '</span></h5>\n';
            for (var i in da) {
                var m = da[i];
                var msg = m.msg;
                var datetime = m.datetime;
                html += '<div class="flowShaftSide state_active">\n' +
                    '                                <img src="/assets/images/state_waite.png" alt="">\n' +
                    '                                <h5 >\n' +
                    '                                    <i id="">' + datetime + '</i>\n' +
                    '                                    <span class="flowShaftResult">' + msg + '</span>\n' +
                    '                                </h5>\n' +
                    '                            </div>';
            }

            $(".flowShaft").html(html);
        }
    }
}

/**
 * 执行回执操作
 */
function replyExecutionFun(params) {
    var url = "/issuedNotice/replyExecution";

    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.data, autoClose: true});
            searchIssuedNoticeLogFun(params);
            if ($(".execBtn").length > 0) {
                $(".execBtn").attr("disabled", true);
            }
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}


