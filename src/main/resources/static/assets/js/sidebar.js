$(function () {
    sidebar();
});
function sidebar() {
    //左侧一二级混合菜单导航

    //展开收起
    $(" #side-menu>li").on("click",function () {
        $(this).find(".side-list").show();
        $(this).addClass("current").siblings().removeClass("current");
        $(this).find("li").slideDown();
        $(this).find("b").addClass("up");
        /* $(this).find("li").slideToggle();
         $(this).find("b").toggleClass("up");*/
        $(this).siblings().find("b").removeClass("up");
        $(this).siblings().find(".side-list>li").slideUp();
    });

    //选中
    $(".side-list>li").on("click","a",function () {
        $(this).parent().addClass("active").siblings().removeClass("active");//点击项加上active,兄弟项去掉active;
        $(this).parents(".level1").siblings().find("li").removeClass("active");//旁系兄弟项也去掉active;
        $(this).parents("#side-menu").find("li").eq(0).removeClass("active");//第一项一级菜单特殊处理

    });

    //第一项（特殊处理）
    $(" #side-menu>li:eq(0)").on("click","a",function () {
        $(this).parent().addClass("active");
        $(this).parents(".level1").siblings().find("li").removeClass("active");//旁系兄弟项也去掉active;
    });
}