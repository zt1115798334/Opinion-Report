$(function () {

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

    /**
     * 点击添加操作
     */
    validateFun();
    $(document).on("click", ".sureBtn", function () {
        var bv = $("#issuedNoticeForm").data('bootstrapValidator');
        bv.validate();
        if (!bv.isValid()) {
            return false;
        }
        var data = $("#issuedNoticeForm").serializeJSON();
        var noticeContentHtml = editor.txt.html();
        var noticeContentText = editor.txt.text();
        if (noticeContentText.length == 0) {
            notify.error({title: "提示", content: "你还没有填写内容",autoClose: true});
            return false;
        }
        if (noticeContentText.length > 1000) {
            notify.error({title: "提示", content: "内容长度不能超过1000字",autoClose: true});
            return false;
        }
        data.noticeContent = noticeContentHtml;
        saveIssuedNoticeFun(data, editor);
    });

});
function validateFun() {
    $("#opinionReportForm").bootstrapValidator({
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
            sourceType: {
                validators: {
                    notEmpty: {
                        message: '请选择来源'
                    }
                }
            },
            reportLevel: {
                validators: {
                    notEmpty: {
                        message: '请选择等级'
                    }
                }
            },
            replyType: {
                validators: {
                    notEmpty: {
                        message: '请选择影响范围'
                    }
                }
            },
            replyNumber: {
                validators: {
                    notEmpty: {
                        message: '请输入数值'
                    },
                    regexp: {
                        regexp: /^\+?(0|[1-9][0-9]*)$/,
                        message: '只能填写数字'
                    }
                }
            },
            sourceUrl: {
                validators: {
                    regexp: {
                        regexp: /^((ht|f)tps?):\/\/([\w\-]+(\.[\w\-]+)*\/)*[\w\-]+(\.[\w\-]+)*\/?(\?([\w\-\.,@?^=%&:\/~\+#]*)+)?/,
                        message: '请填写正确的URL地址（http或者https开头）'
                    }
                }
            }
        }
    });
}

function saveIssuedNoticeFun(params, editor) {
    var url = "/issuedNotice/saveIssuedNotice";

    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            notify.success({title: "提示", content: result.data, autoClose: true});
            editor.txt.html('');
            resetForm("issuedNoticeForm");
        }else {
            notify.error({title: "提示", content: result.message});
        }
    }
}