$(function () {
    $('#txt_rememberMe').iCheck({
        checkboxClass: 'icheckbox_minimal-blue',
        radioClass: 'iradio_minimal-blue',
        increaseArea: '20%' // optional
    });


    $(document).on("click", ".login-btn", function () {
        login();
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


