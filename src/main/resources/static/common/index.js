$(function () {

    searchDisplayMenuFun("#li_002", "#lli_000");

    showMenuTitle("舆情工作平台");

    //滚动条初始化
    $("#inner-content").slimScroll({
        height: "700px"
    });
    $("#myTabContent").slimScroll({
        height: "700px"
    });

    /**
     * 比例信息
     */
    searchDataFun();

    /**
     * 显示通知
     */
    searchNoticeFun();

    /**
     * 上报文章明细
     */
    reportArticleDetailedFun();

    //通知中心-清空消息
    $("#clearAllBtn").on("click", function () {
        var clearDiv = $(".notificationBody").find(".noticeSide");
        clearDiv.remove();
    });
    //通知中心-删除
    $(".clearBtn").on("click", function () {
        var clearSide = $(this).parents(".noticeSide");
        clearSide.remove();
    });
});

function searchDataFun() {
    var url = "/dataStatistics/searchData";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        /**
         * 比例信息
         */
        dataAnalysisProportionFun();
    }
}

/**
 * 比例信息
 */
function dataAnalysisProportionFun() {
    var url = "/dataStatistics/dataAnalysisProportion";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {

            var upImgUrl = "/assets/images/top_03.png";
            var downImgUrl = "/assets/images/bottom_03.png";

            var data = result.data;

            var allInfo = data.allInfo;
            var adoptInfo = data.adoptInfo;
            var notAdoptInfo = data.notAdoptInfo;

            var _allInfo = $(".allInfo");
            _allInfo.html(allInfo.weekCount);
            if (allInfo.type == "down") {
                _allInfo.next().find("img").attr("src", downImgUrl);
            }
            if (allInfo.type == "up") {
                _allInfo.next().find("img").attr("src", upImgUrl);
            }
            _allInfo.next().find("span").html(allInfo.num + "% 同比上周");

            var _adoptInfo = $(".adoptInfo");
            _adoptInfo.html(adoptInfo.weekCount);
            if (adoptInfo.type == "down") {
                _adoptInfo.next().find("img").attr("src", downImgUrl);
            }
            if (adoptInfo.type == "up") {
                _adoptInfo.next().find("img").attr("src", upImgUrl);
            }
            _adoptInfo.next().find("span").html(adoptInfo.num + "% 同比上周");

            var _notAdoptInfo = $(".notAdoptInfo");
            _notAdoptInfo.html(notAdoptInfo.weekCount);
            if (notAdoptInfo.type == "down") {
                _notAdoptInfo.next().find("img").attr("src", downImgUrl);
            }
            if (notAdoptInfo.type == "up") {
                _notAdoptInfo.next().find("img").attr("src", upImgUrl);
            }
            _notAdoptInfo.next().find("span").html(notAdoptInfo.num + "% 同比上周");
        }
    }
}

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
            for (var i in data) {
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
            for (var i in data) {
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