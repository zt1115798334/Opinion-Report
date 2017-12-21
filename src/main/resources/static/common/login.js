$(function () {
    $('#txt_rememberMe').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
        increaseArea: '20%' // optional
    });

    myfunction();
    $(document).on("click", ".login-btn", function () {
        var url = "/fingerprint/isExistFingerprint";
        var username = $("#txt_username").val();
        var password = $("#txt_password").val();
        var param = {
            "username": username,
            "password": password
        };
        execAjax(url, param, callback);

        function callback(result) {
            if (result.success) {
                var isExists = result.data.isExist;
                if(isExists){   //存在指纹
                    // fpVerification("指纹比对", "请安装指纹驱动或启动服务", true, globalContext);
                    // $("#fingerprintVerification").modal("show");
                    login();
                }else{  //  不存在指纹
                    submitRegister("指纹", "指纹数:", "确认保存当前修改吗？", "驱动下载", true);
                    $("#fingerprintRegister").modal("show");
                    $("#userIdM").val(result.data.userId);
                }
            } else {
                BootstrapDialog.show({
                    title: '提示',
                    message: result.message
                });
            }
        }
    });

    /**
     * 录入指纹 -- 保存操作
     */
    $(document).on("click", "#fingerprintRegister .saveBtn", function () {
        storeDataToHtml();
        $("#fingerprintRegister").modal("hide");

    });

    /**
     * 录入指纹 -- 验证
     */
    $(document).on("click", "#fingerprintVerification .saveBtn", function () {
        fingerprintLogin();
        $("#fingerprintVerification").modal("hide");
    });
});

function login() {
    var username = $("#txt_username").val();
    var password = $("#txt_password").val();
    var rememberMe = $('#txt_rememberMe').is(':checked');
    var param = {
        "username": username,
        "password": password,
        "rememberMe": rememberMe
    };
    var url = "/ajaxLogin";
    execAjax(url, param, callback);

    function callback(result) {
        if (result.success) {
            window.location.href = "/index";
        } else {
            BootstrapDialog.show({
                title: '提示',
                message: result.message
            });
        }
    }
}

function fingerprintLogin() {
    var fingerprint = $("#fingerprint_val").val();
    var param = {
        "fingerprint": fingerprint
    };
    var url = "/ajaxFingerprintLogin";
    execAjax(url, param, callback);

    function callback(result) {
        if (result.success) {
            window.location.href = "/index";
        } else {
            BootstrapDialog.show({
                title: '提示',
                message: result.message
            });
        }
    }
}


