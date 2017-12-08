$(function () {

    searchDisplayMenuFun("#li_002", "#lli_000");

    showMenuTitle("舆情工作平台");

    /**
     * 显示通知
     */
    searchNoticeFun();

    /**
     * 上报文章明细
     */
    reportArticleDetailedFun();
});

/**
 * 显示通知
 */
function searchNoticeFun() {
    var url = "/index/searchNotice";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            for(var i in data){
                var da = data[i];
                var title = da.title;
                var subtitle = da.subtitle;
                var timeMsg = da.timeMsg;
                var url = da.url;
            }
        } else {
            notify.error({title: "提示", content: result.message});
        }

    }
}

/**
 * 清除通知
 */
function clearNoticeFun(params) {
    var url = "/index/clearNotice";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message, autoClose: true});
        }

    }
}

/**
 * 清除全部通知
 */
function clearNoticeAllFun() {
    var url = "/index/clearNoticeAll";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message, autoClose: true});
        }

    }
}

/**
 * 上报文章明细
 */
function reportArticleDetailedFun() {
    var url = "/index/reportArticleDetailed";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var data = result.data;
            for(var i in data){
                var da = data[i];
                var id = da.id;
                var title = da.title;
                var url = da.url;
                var reportCode = da.reportCode;
                var expireDate = da.expireDate;
            }
        } else {
            notify.error({title: "提示", content: result.message, autoClose: true});
        }

    }
}