$(function () {

    //实例化编辑器
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '/wangEditor/upload'  // 上传图片到服务器
    editor.customConfig.uploadFileName = 'file'
    editor.customConfig.uploadImgHeaders = {
        'Accept': 'application/json'
    }
    editor.customConfig.debug = true;
    editor.create();

    /**
     * 点击添加操作
     */
    validateFun();
    $(document).on("click", ".sureBtn", function () {
        var bv = $("#opinionReportForm").data('bootstrapValidator');
        bv.validate();
        if (!bv.isValid()) {
            return false;
        }
        var data = $("#opinionReportForm").serializeJSON();
        var reportCauseHtml = editor.txt.html();
        var reportCauseText = editor.txt.text();
        if (reportCauseText.length == 0) {
            alert("你还没有填写内容");
            return false;
        }
        if (reportCauseText.length > 1000) {
            alert("内容长度不能超过1000字");
            return false;
        }
        data.reportCause = reportCauseHtml;
        saveReportArticleFun(data, editor);
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

function saveReportArticleFun(params, editor) {
    var url = "/reportArticle/saveReportArticle";
    execAjaxJSON(url, params, callback);

    function callback(result) {
        if (result.success) {
            alert(result.data.msg);
            $(':input', '#opinionReportForm')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
            editor.txt.html('');
            $("select.selectpicker").each(function () {
                $(this).selectpicker('val', $(this).find('option:first').val());    //重置bootstrap-select显示
                $(this).find("option").attr("selected", false);                    //重置原生select的值
                $(this).find("option:first").attr("selected", true);
            });
        }

    }
}


