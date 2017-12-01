$(function () {
    searchReportArticleInChildPageFun();

    /**
     * 点击搜索操作
     */
    $(document).on("click", ".whiteButton", function () {
        searchReportArticleInChildPageFun();
    });

    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            searchReportArticleInChildPageFun();
        }
    };

    /**
     * 查看详情操作
     */
    $(document).on("click", ".detailsBtn", function () {
        var reportCode = $(this).attr("rowReportCode");
        window.location.href = "/reportArticle/opinionReportExaminePage/examine/" + reportCode;
    });


});

/**
 * 显示列表
 */
function searchReportArticleInChildPageFun() {
    var url = "/reportArticle/searchReportArticleInChild";
    var title = $(".title").val().trim();
    var adoptState = $(".adoptState").find("option:selected").val();
    var sourceType = $(".sourceType").find("option:selected").val();
    var options = {
        columns: [{
            field: 'id',
            title: "舆情ID",
            visible: false

        }, {
            field: 'reportCode',
            title: "舆情编号",
            align: "center",
            valign: "middle"
        }, {
            field: 'title',
            title: "舆情标题",
            align: "left",
            valign: "middle"

        }, {
            field: 'sourceType',
            title: "来源",
            align: "center",
            valign: "middle"


        }, {
            field: 'reportLevel',
            title: "等级",
            align: "center",
            sortable: true,
            valign: "middle",

        }, {
            field: 'replyNumber',
            title: "影响范围",
            align: "center",
            sortable: true,
            valign: "middle",

        }, {
            field: 'adoptState',
            title: "状态",
            align: "center",
            valign: "middle",
            formatter: function (value, row, index) {
                var _html = "";
                switch (value) {
                    case "已采纳":
                        _html = "<span class=\"process-circle process-circle-green\"></span>";
                        break;
                    case "未采纳":
                        _html = "<span class=\"process-circle process-circle-red\"></span>";
                        break;
                    case "已上报":
                        _html = "<span class=\"process-circle process-circle-blue\"></span>";
                        break;
                }
                _html += value;
                return _html;
            }

        }, {
            field: 'publishDatetime',
            title: "上报时间",
            align: "center",
            sortable: true,
            valign: "middle",

        }, {
            title: "操作",
            align: "center",
            valign: "middle",
            formatter: function (value, row, index) {
                var _html = "";
                _html += "<button class=\"detailsBtn\"  type=\"button\" rowReportCode=\"" + row.reportCode + "\">详情</button>";
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
                adoptState: adoptState,
                sourceType: sourceType,
                sortName: params.sortName,
                sortOrder: params.sortOrder,
                pageSize: params.pageSize,
                pageNumber: params.pageNumber
            }
        }

    };

    $("#table-report").bootstrapTable("destroy").bootstrapTable(options);
}