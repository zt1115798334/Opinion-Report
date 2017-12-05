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

function searchDisplayMenuFun() {
    var params = {};
    var url = "/system/searchDisplayMenu";
    execAjax(url, params, callback);

    function callback(result) {
        if (result.success) {
            var parents = result.data;
            for (var i in parents) {
                var parent = parents[i];
                var parentId = parent.id;
                var parentUrlName = parent.urlName;
                var parentSysUrl = parent.sysUrl;
                var parentIcon = parent.icon;
                var childs = parent.childs;
                for (var ii in childs) {
                    var child = childs[ii];
                    var childUrlName = child.urlName;
                    var childSysUrl = child.sysUrl;
                    var childIcon = child.icon;
                }
            }
        }
    }
}