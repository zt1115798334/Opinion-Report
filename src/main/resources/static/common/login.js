$(function () {
    $('#txt_rememberMe').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
        increaseArea: '20%' // optional
    });


    $(document).on("click", ".login-btn", function () {
        myfunction();
        fpVerification("指纹比对", "请安装指纹驱动或启动服务", true, globalContext);
        $("#fingerprint").modal("show");
        // login();
    });

    $(document).on("click", "#fingerprint .saveBtn", function () {
        login();
        $("#fingerprint").modal("hide");
    });
});

function login() {

    var username = $("#txt_username").val();
    var password = $("#txt_password").val();
    var rememberMe = $('#txt_rememberMe').is(':checked');
    var fingerprint = $("#fingerprint_val").val();
    var param = {
        "username": username,
        "password": password,
        "rememberMe": rememberMe,
        "fingerprint": fingerprint
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


