$(function () {

    searchDisplayMenuFun("#li_004","#lli_009");

    showMenuTitle("信息下发");

    //实例化编辑器
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '/wangEditor/upload'  // 上传图片到服务器
    editor.customConfig.uploadFileName = 'file'
    editor.customConfig.uploadImgHeaders = {
        'Accept': 'application/json'
    }
    editor.customConfig.zIndex = 100;
    editor.customConfig.debug = true;
    editor.create();

    searchNoticeRangeSelectFun();

    /**
     * 点击添加操作
     */

    $(document).on("click", ".submitBtn", function () {
        validateFun();
        var bv = $("#issuedNoticeForm").data('bootstrapValidator');
        bv.validate();
        if (!bv.isValid()) {
            return false;
        }
        var data = $("#issuedNoticeForm").serializeJSON();
        var noticeContentHtml = editor.txt.html();
        var noticeContentText = editor.txt.text();
        if (noticeContentText.length == 0) {
            notify.error({title: "提示", content: "你还没有填写内容", autoClose: true});
            return false;
        }
        if (noticeContentText.length > 1000) {
            notify.error({title: "提示", content: "内容长度不能超过1000字", autoClose: true});
            return false;
        }
        data.noticeContent = noticeContentHtml;
        saveIssuedNoticeFun(data, editor);
    });

});

function validateFun() {
    $("#issuedNoticeForm").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            // valid: 'glyphicon glyphicon-ok',
            // invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            title: {
                validators: {
                    notEmpty: {
                        message: '请输入标题'
                    }, stringLength: {
                        max: 50,
                        message: '请输入50个字符'
                    }
                }
            },
            noticeType: {
                validators: {
                    notEmpty: {
                        message: '请选择类型'
                    }
                }
            },
            noticeRange: {
                validators: {
                    notEmpty: {
                        message: '请选择范围'
                    }
                }
            }
        }
    });
}

function searchNoticeRangeSelectFun() {
    var url = "/system/searchCityOrganizationInfo";

    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var cityOrganization = result.data;
            var level = cityOrganization.level;
            var optionHtml = '';
            switch (level) {
                case 0:
                    optionHtml = '<option value="all">全部</option>\n' +
                        '                                        <option value="municipal">地市级单位</option>\n' +
                        '                                        <option value="county">区县级单位</option>';
                    break;
                case 1:
                    optionHtml = '<option value="all">全部</option>\n' +
                        '                                        <option value="municipal">地市级单位</option>\n' +
                        '                                        <option value="county">区县级单位</option>';
                    break;
                case 2:
                    optionHtml = '<option value="county">区县级单位</option>';
                    break;
                case 3:
                    optionHtml = '';
                    break;
            }
            $("#noticeRange").append(optionHtml).selectpicker('refresh');
        }
    }
}

function saveIssuedNoticeFun(params, editor) {
    var url = "/issuedNotice/saveIssuedNotice";

    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.message, autoClose: true});
            editor.txt.html('');
            resetForm("#issuedNoticeForm");
        } else {
            notify.error({title: "提示", content: result.message});
        }
    }
}
