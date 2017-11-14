$(function () {

    $(document).on("click", ".btn-primary", function () {
        login();
    })
});

function login() {
    var username = $("#username").val();
    var password = $("#password").val();
    var vcode = $("#vcode").val();
    var rememberMe = $('#rememberMe').is(':checked');
    var param = {
        "username": username,
        "password": password,
        "vcode": vcode,
        "rememberMe": rememberMe
    };
    var url = "/logining";
    execAjax(url, param, callback);

    function callback(result) {

        if (result.status != 200) {
            swal("哦豁", result.message, "error");
        } else {
            swal({title: "太帅了", text: "登录成功，进入系统！", type: "success"},
                function () {
                    location.href = "/index";
                });
        }
    }
}