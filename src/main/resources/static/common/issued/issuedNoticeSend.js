$(function () {

    searchIssuedNoticeSendFun();

    /**
     * 点击搜索操作
     */
    $(document).on("click", ".whiteButton", function () {
        searchIssuedNoticeSendFun();
    });

    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            searchIssuedNoticeSendFun();
        }
    };

    /**
     * 删除操作
     */
    // $(document).on("click", ".delete", function () {
    //     var id = $(this).attr("rowId");
    //     deleteIssuedNoticeFun(id);
    // });

    /**
     * 查看详情操作
     */
    // $(document).on("click", "", function () {
    //     var noticeCode = $(this).attr("rowNoticeCode");
    //     window.location.href = "/issuedNotice/issuedNoticeInfoPage/info/" + noticeCode;
    // });

    /**
     * 下传信息添加界面操作
     */
    // $(document).on("click", "", function () {
    //     window.location.href = "/issuedNotice/issuedNoticeInfoEditPage";
    // });

});

/**
 * 查询下传信息(发出)
 * @param params
 */
function searchIssuedNoticeSendFun() {
    var url = "/issuedNotice/searchIssuedNoticeSend";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        console.log(result);
    }
}

/**
 * 删除上报信息
 */
function deleteIssuedNoticeFun(id) {
    var url = "/issuedNotice/deleteIssuedNotice";
    var params = {
        id: id
    };
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            bootstrapTableRefresh();
            notify.success({title: "提示", content: result.data, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

function bootstrapTableRefresh() {
    $("#table-report").bootstrapTable('refresh');
}