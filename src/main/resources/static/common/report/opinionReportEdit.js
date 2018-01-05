$(function () {

    searchDisplayMenuFun("#li_003", "#lli_007");

    showMenuTitle("舆情上报");

    //实例化编辑器
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '/wangEditor/upload'; // 上传图片到服务器
    editor.customConfig.uploadFileName = 'file';
    editor.customConfig.uploadImgHeaders = {
        'Accept': 'application/json'
    };
    editor.customConfig.zIndex = 100;
    editor.customConfig.debug = true;
    editor.create();

    /*附件上传*/
    $("#fileUploadContent").initUpload({
        "uploadUrl": "/reportArticle/saveReportArticleFile",//上传文件信息地址
        // "progressUrl":"/cont/getStatus",//获取进度信息地址，可选，注意需要返回的data格式如下（{bytesRead: 102516060, contentLength: 102516060, items: 1, percent: 100, startTime: 1489223136317, useTime: 2767}）
        "selfUploadBtId": "selfUploadBt",//自定义文件上传按钮id
        "isHiddenUploadBt": true,//是否隐藏上传按钮
        "isHiddenCleanBt": false,//是否隐藏清除按钮
        "isAutoClean": true,//是否上传完成后自动清除
        // "velocity":10,//模拟进度上传数据
        //"rememberUpload":true,//记住文件上传
        // "showFileItemProgress":false,
        //"showSummerProgress":false,//总进度条，默认限制
        //"scheduleStandard":true,//模拟进度的方式，设置为true是按总进度，用于控制上传时间，如果设置为false,按照文件数据的总量,默认为false
        "size": 1024*4,//文件大小限制，单位kb,默认不限制
        //"maxFileNumber":3,//文件个数限制，为整数
        //"filelSavePath":"",//文件上传地址，后台设置的根目录
        // "beforeUpload": beforeUploadFun,//在上传前执行的函数
        "onUpload": onUploadFun,//在上传后执行的函数
        //autoCommit:true,//文件是否自动上传
        // "fileType": ['png', 'jpg', 'docx', 'doc'],//文件类型限制，默认不限制，注意写的是文件后缀

    });

    /**
     * 点击添加操作
     */
    $(document).on("click", ".execBtn", function () {
        validateFun();
        var bv = $("#opinionReportForm").data('bootstrapValidator');
        bv.validate();
        if (!bv.isValid()) {
            return false;
        }
        var data = $("#opinionReportForm").serializeJSON();
        var reportCauseHtml = editor.txt.html();
        var reportCauseText = editor.txt.text();
        if (reportCauseText.length == 0) {
            notify.error({title: "提示", content: "你还没有填写内容", autoClose: true});
            return false;
        }
        if (reportCauseText.length > 1000) {
            notify.error({title: "提示", content: "内容长度不能超过1000字", autoClose: true});
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
                    stringLength: {
                        max: 8,
                        message: '请输入8位以内数值'
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
            var reportArticle = result.data;
            var reportCode = reportArticle.reportCode;
            var opt = uploadTools.getOpt("fileUploadContent");
            uploadTools.startUpload(opt);
            var fileNumber = uploadTools.getFileNumber(opt);
            if(fileNumber>0){
                opt.otherData = [{"name": "reportCode", "value": reportCode}];
                uploadEvent.uploadFileEvent(opt);
            }else{
                notify.success({title: "提示", content: result.message, autoClose: true});
                resetForm("#opinionReportForm");
            }
            editor.txt.html('');

        } else {
            notify.error({title: "提示", content: result.message, autoClose: true});
        }

    }
}

function beforeUploadFun(opt) {
    opt.otherData = [{"name": "reportCode", "value": "1231231321"}];
}

function onUploadFun(opt, data) {
    // alert(data);
    notify.success({title: "提示", content: "添加成功", autoClose: true});
    resetForm("#opinionReportForm");
    uploadTools.uploadError(opt);//显示上传错误
}

function testUpload() {
    var opt = uploadTools.getOpt("fileUploadContent");
    uploadEvent.uploadFileEvent(opt);
}

function tt() {
    var opt = uploadTools.getOpt("fileUploadContent");
    uploadTools.uploadError(opt);//显示上传错误
}


