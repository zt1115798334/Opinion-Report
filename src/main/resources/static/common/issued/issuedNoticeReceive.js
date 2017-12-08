$(function () {

    searchDisplayMenuFun("#li_004","#lli_010");

    showMenuTitle("信息下发");

    searchIssuedNoticeReceiveFun();

    /**
     * 点击搜索操作
     */
    $(document).on("click", ".searchButton", function () {
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
    $(document).on("click", ".detailsBtn", function () {
        var noticeCode = $(this).attr("rowNoticeCode");
        window.location.href = "/issuedNotice/issuedNoticeInfoPage/exec/" + noticeCode;
    });
});

/**
 * 查询下传信息(接受)
 * @param params
 */
function searchIssuedNoticeReceiveFun() {
    var url = "/issuedNotice/searchIssuedNoticeReceive";
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
                    case "未读":
                        _html = "<span class=\"process-circle process-circle-red\"></span>";
                        break;
                    case "已读":
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
                // _html += "<button class=\"delete\" type=\"button\" rowId=\"" + row.id + "\">删除</button>";
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

