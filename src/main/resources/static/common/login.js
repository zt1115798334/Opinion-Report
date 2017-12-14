$(function () {

    $(document).on("click", ".btn-primary", function () {
        login();
    });
});

function login() {
    var username = $("#username").val();
    var password = $("#password").val();
    var rememberMe = $('#rememberMe').is(':checked');
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
            notify.error({title: "提示", content: result.message});
        }
    }
}


