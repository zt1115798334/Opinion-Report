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

        showBootstrapDialog("是否清空全部消息？", callback);

        function callback() {
            var clearDiv = $(".notificationBody").find(".noticeSide");
            clearDiv.remove();
            clearNoticeAllFun();
        }

    });
    //通知中心-删除
    $(document).on("click", ".clearBtn", function () {
        var clearSide = $(this).parents(".noticeSide");
        clearSide.remove();
        var id = $(this).attr("msgId");
        var params = {
            id: id
        };
        clearNoticeFun(params);
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
            var html = '';
            for (var i in data) {
                var da = data[i];
                var id = da.id;
                var title = da.title;
                var subtitle = da.subtitle;
                var timeMsg = da.timeMsg;
                var url = da.url;
                var type = da.type;
                var adoptState = da.adoptState;
                var imgUrl = '';
                if (type == "import") {    //提交
                    if (adoptState == "report") {    //已上报
                        imgUrl = '/assets/images/inform.png';
                    }
                    if (adoptState == "adopt") {     //已采纳
                        imgUrl = '/assets/images/inform_03.png';
                    }
                    if (adoptState == "notAdopted") {    //未采纳
                        imgUrl = '/assets/images/inform2_03.png';
                    }
                }
                if (type == "export") {     //收到
                    imgUrl = '/assets/images/inform2_03.png';
                }


                html += '<div class="noticeSide">\n' +
                    '                                <div class="sideTop clearfix">\n' +
                    '                                    <img src="' + imgUrl + '" class="pull-left" alt="">\n' +
                    '                                    <a class="slh noticeTitle" style="width: 180px" onclick="toPageInfo(\'' + url + '\',' + id + ')">\n' +
                    '                                        <div id="titleMessage">' + title + '</div>\n' +
                    '                                    </a>\n' +
                    '                                    <a href="javascript:void(0)" class="clearBtn pull-right" msgId="' + id + '"></a>\n' +
                    '                                </div>\n' +
                    '                                <div class="sideBottom">\n' +
                    '                                    <span class="noticeTime" id="messageTime">' + timeMsg + '</span>\n' +
                    '                                </div>\n' +
                    '                            </div>';
            }
            $("#messageDiv").html(html);
        } else {
            notify.error({title: "提示", content: result.message});
        }

    }
}

function toPageInfo(url, id) {
    var params = {
        id: id
    };
    clearNoticeFun(params);
    window.location = url;
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
            var html = '';
            for (var i in data) {
                var da = data[i];
                var id = da.id;
                var title = da.title;
                var url = da.url;
                var reportCode = da.reportCode;
                var publishDate = da.publishDate;
                var publishTime = da.publishTime;
                var expireDate = da.expireDate;
                html += '<div class="homePage_content_list">\n' +
                    '                                <div class="homePage_content_list_left">\n' +
                    '                                    <p>' + publishDate + '</p>\n' +
                    '                                    <p>' + publishTime + '</p>\n' +
                    '                                    <b></b>\n' +
                    '                                </div>\n' +
                    '                                <div class="homePage_content_list_right">\n' +
                    '                                    <h5><i>舆情上报</i></h5>\n' +
                    '                                    <p>\n' +
                    '                                        ' + title + '\n' +
                    '                                        <button class="whiteButton" vlaue="立即处理" onclick="window.location=\'' + url + '\'">立即查看</button>\n' +
                    '                                    </p>\n' +
                    '                                    <i><img src="../../assets/images/watch.png">截止到' + expireDate + '</i>\n' +
                    '                                </div>\n' +
                    '                            </div>';
            }
            $("#div_work_items").html(html);
        } else {
            notify.error({title: "提示", content: result.message, autoClose: true});
        }

    }
}