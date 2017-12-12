$(function () {

    showMenuTitle("舆情上报");

    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.debug = true;
    editor.customConfig.menus = []
    editor.customConfig.zIndex = 100;
    editor.create();
    editor.$textElem.attr('contenteditable', false);

    var reportCode = $("#reportCode").val();
    var type = $("#type").val();
    if (type == "info") { //详情
        $(".adoptBtn").remove();
        $(".report").remove();
        searchDisplayMenuFun("#li_003", "#lli_007");
    } else if (type == "examine") {     // 审核
        $(".return").remove();
        searchDisplayMenuFun("#li_003", "#lli_008");
    }
    var params = {
        reportCode: reportCode
    };
    searchReportArticleByCodeFun(params, editor);
    searchReportArticleLogFun(params);

    /**
     * 返回列表
     */
    $(document).on("click", ".return", function () {
        window.location.href = "/reportArticle/opinionReportListPage";
    });

    /**
     * 对上报文章进行审核
     */
    $(document).on("click", ".adoptBtn", function () {
        params.adoptState = $(this).attr("adoptState");
        examineAndVerifyReportArticleFun(params);
    });

    /**
     *对上报文章再次上报
     */
    $(document).on("click", ".report", function () {
        saveReportArticleAgainFun(params);
    });

});

/**
 * 查询详情
 * @param params
 */
function searchReportArticleByCodeFun(params, editor) {
    var url = "/reportArticle/searchReportArticleByCode";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var id = data.id;
            var reportCode = data.reportCode;
            var reportLevel = data.reportLevel;
            var sourceUrl = data.sourceUrl;
            var sourceType = data.sourceType;
            var title = data.title;
            var publishDatetime = data.publishDatetime;
            var replyType = data.replyType;
            var replyNumber = data.replyNumber;
            var reportCause = data.reportCause;
            var adoptState = data.adoptState;
            var adoptStateMsg = data.adoptStateMsg;
            $(".title").html(title)
            $(".sourceType").html(sourceType);
            $(".reportLevel").html(reportLevel);
            $(".reply").html(replyType + replyNumber);
            $(".sourceUrl").html(sourceUrl);
            $(".sourceUrl").attr("href", sourceUrl);
            editor.txt.html(reportCause);
            if (adoptState != "report") {
                if ($(".adoptBtn").length > 0) {
                    $(".adoptBtn").attr("disabled", true);
                }
            }
        }
    }
}

/**
 * 查询日志
 * @param params
 */
function searchReportArticleLogFun(params) {
    var url = "/reportArticle/searchReportArticleLog";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            var html = "";
            for (var i in data) {
                var da = data[i];
                var msg = da.msg;
                var datetime = da.datetime;
                var adoptState = da.adoptState;
                var reportClass = '';
                var imgUrl = '';
                switch (adoptState) {
                    case "adopt" :
                        reportClass = "state_active";
                        imgUrl = "<img src=\"/assets/images/state_waite.png\"  alt=\"\">";
                        break;
                    case "notAdopted" :
                        reportClass = "state_no";
                        imgUrl = "<img src=\"/assets/images/state_waite.png\"  alt=\"\">";
                        break;
                    case "report" :
                        reportClass = "state";
                        imgUrl = "<img src=\"/assets/images/state_Agree.png\"  alt=\"\">";
                        break;
                }
                html += '<div class="flowShaftSide ' + reportClass + '">\n' + imgUrl +
                    '                                <h5 >\n' +
                    '                                    <i>' + datetime + '</i>\n' +
                    '                                    <span class="flowShaftResult">' + msg + '</span>\n' +
                    '                                </h5>\n' +
                    '                            </div>';
            }
            $(".flowShaft").append(html);
        }
    }
}

/**
 * 对上报文章进行审核
 * @param params
 */
function examineAndVerifyReportArticleFun(params) {
    var url = "/reportArticle/examineAndVerifyReportArticle";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            if ($(".adoptBtn").length > 0) {
                $(".adoptBtn").attr("disabled", true);
            }
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

/**
 * 对上报文章再次上报
 */
function saveReportArticleAgainFun(params) {
    var url = "/reportArticle/saveReportArticleAgain";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            if ($(".report").length > 0) {
                $(".report").attr("disabled", true);
            }
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}
