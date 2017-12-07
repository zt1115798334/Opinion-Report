$(function () {
    $("#side-menu>li>b").next().find("li").slideUp();
    //左侧导航

    //展开收起
    $("#side-menu>li").on("click","b",function () {
        //复杂方法
        /*if($(this).hasClass("up")){
            $(this).removeClass("up");
            $(this).next().find("li").slideUp();
        }else{
            $(this).next().find("li").slideDown();
            $(this).addClass("up");
        }*/
        //简单方法
        $(this).next().find("li").slideToggle();
        $(this).toggleClass("up");
    });

    //选中
    $(".side-list>li").on("click","a",function () {
        $(this).parent().addClass("active").siblings().removeClass("active");//点击项加上active,兄弟项去掉active;
        $(this).parents(".level1").siblings().find("li").removeClass("active");//旁系兄弟项也去掉active;
    });
});