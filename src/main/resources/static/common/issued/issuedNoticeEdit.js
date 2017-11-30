$(function () {

});

function saveIssuedNoticeFun(params, editor) {
    var url = "/issuedNotice/saveIssuedNotice";

    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {

        }
    }
}
