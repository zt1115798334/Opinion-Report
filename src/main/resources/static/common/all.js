jQuery(document).ready(function ($) {
    $('.selectpicker').selectpicker({
        style: 'btn-default',
        size: 5
    });

    //高度
    ResizeHeight();
    window.onresize = function () {
        ResizeHeight();
    }

});

function ResizeHeight() {
    var height = $(window).height() - 67 - 40;
    $("#wrapper").css("min-height", height);
}