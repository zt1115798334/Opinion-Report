$(function () {

    searchIssuedNoticeSendFun();

    /**
     * 点击搜索操作
     */
    $(document).on("click", ".searchButton", function () {
        searchIssuedNoticeSendFun();
    });

    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            searchIssuedNoticeSendFun();
        }
    };

    /**
     * 删除操作 -- 弹框显示
     */
    $(document).on("click", ".delete", function () {
        var id = $(this).attr("rowId");
        showBootstrapDialog("是否确认删除该条信息，删除后无法恢复？", callback);
        function callback() {
            deleteIssuedNoticeFun(id);
        }
    });

    /**
     * 查看详情操作
     */
    $(document).on("click", ".detailsBtn", function () {
        var noticeCode = $(this).attr("rowNoticeCode");
        window.location.href = "/issuedNotice/issuedNoticeInfoPage/info/" + noticeCode;
    });

    /**
     * 下传信息添加界面操作
     */
    $(document).on("click", ".issuedBtn", function () {
        window.location.href = "/issuedNotice/issuedNoticeEditPage";
    });

    searchOperationAuthorityFun(callbackResult);

    function callbackResult(result) {
        var data = result.data;
        if ($.inArray("009001", data) == -1) {
            $(".issuedBtn").remove();
        }
    }

});

/**
 * 查询下传信息(发出)
 * @param params
 */
function searchIssuedNoticeSendFun() {
    var url = "/issuedNotice/searchIssuedNoticeSend";
    var title = $(".title").val().trim();
    var receiptState = $(".receiptState").find("option:selected").val();
    var noticeType = $(".noticeType").find("option:selected").val();
    var options = {
        columns: [{
            field: 'id',
            title: "信息ID",
            visible: false

        }, {
            field: 'noticeCode',
            title: "信息编号",
            align: "center",
            valign: "middle"
        }, {
            field: 'title',
            title: "信息标题",
            align: "left",
            valign: "middle"

        }, {
            field: 'noticeType',
            title: "信息类型",
            align: "center",
            valign: "middle"


        }, {
            field: 'noticeRange',
            title: "下发范围",
            align: "center",
            valign: "middle"


        }, {
            field: 'receiptState',
            title: "状态",
            align: "left",
            valign: "middle",
            formatter: function (value, row, index) {
                var _html = "";
                switch (value) {
                    case "未回执":
                        _html = "<span class=\"process-circle process-circle-red\"></span>";
                        break;
                    case "回执中":
                        _html = "<span class=\"process-circle process-circle-blue\"></span>";
                        break;
                    case "已回执":
                        _html = "<span class=\"process-circle process-circle-green\"></span>";
                        break;
                }
                _html += value;
                return _html;
            }

        }, {
            field: 'publishDatetime',
            title: "下发时间",
            align: "center",
            sortable: true,
            valign: "middle"

        }, {
            title: "操作",
            align: "center",
            valign: "middle",
            formatter: function (value, row, index) {
                var _html = "";
                _html += "<button class=\"detailsBtn\"  type=\"button\" rowNoticeCode=\"" + row.noticeCode + "\">详情</button>";
                _html += "<button class=\"delete\" type=\"button\" rowId=\"" + row.id + "\">删除</button>";
                return _html;
            }
        }],
        paginationPreText: "<i class='glyphicon glyphicon-menu-left'></i>",
        paginationNextText: "<i class='glyphicon glyphicon-menu-right'></i>",
        paginationLoop: false,
        method: 'post',
        sortable: true,
        sortOrder: 'desc',
        pagination: true,
        sidePagination: 'server',
        pageNumber: 1,
        pageSize: 10,
        dataType: "json",
        url: url,
        pageList: [10, 25, 50, 100],
        queryParamsType: '',
        formatNoMatches: function () {
            var _nodata = '<div class="text-center"><img src="../../images/no_data.png">'
                + '<p>没有搜到任何数据</p></div>';
            return _nodata;
        },
        onLoadSuccess: function () {
        },
        queryParams: function (params) {
            return {
                title: title,
                receiptState: receiptState,
                noticeType: noticeType,
                sortName: params.sortName,
                sortOrder: params.sortOrder,
                pageSize: params.pageSize,
                pageNumber: params.pageNumber
            }
        }

    };

    $("#table-report").bootstrapTable("destroy").bootstrapTable(options);
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
            notify.success({title: "提示", content: result.message, autoClose: true});
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}

function bootstrapTableRefresh() {
    $("#table-report").bootstrapTable('refresh');
}