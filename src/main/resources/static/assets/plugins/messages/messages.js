/**
 * Created by zhangxin on 2017/7/26.
 */
var notify=new Object(),_top=-45,_zIndex=1000;
(function (notify) {
    notify.init=function (option) {
        var opstions={},
            defaults={
            title:"提示",
            content:"这是一条会自动关闭的消息提示",
            type:'defaults'
        };
        if(typeof option =="object"){
            opstions=$.extend(defaults,option);
        }else{
            console.error("参数不存在");
            return;
        }
        var _this=this,
            _notification=document.createElement("div"),
            _group=document.createElement("div"),
            _title=document.createElement("h2"),
            _content=document.createElement("div"),
            _closeBtn=document.createElement("div");
        _notification.className="notification";
        _group.className="notification-group";
        _title.className="notification-title";
        _title.innerText=opstions.title;
        _content.className="notification-content";
        _content.innerText=opstions.content;
        _closeBtn.className="notification-closeBtn";
        _closeBtn.innerHTML="&times;";
        _group.appendChild(_title);
        _group.appendChild(_content);
        _group.appendChild(_closeBtn);
        if(opstions.type!="defaults"){
            var _i=document.createElement("i");
                _group.className="notification-group is-with-icon";
        }
        switch(opstions.type){
            case 'success':
                _i.className="notification-icon glyphicon glyphicon-ok-sign";
                break;
            case 'info':
                _i.className="notification-icon glyphicon glyphicon-info-sign";
                break;
            case 'warning':
                _i.className="notification-icon glyphicon glyphicon-exclamation-sign";
                break;
            case 'error':
                _i.className="notification-icon glyphicon glyphicon-remove-sign";
                break;
            default :
                break;
        }
        if(_i!=null&&_i!=""&&_i!=undefined) {
            _notification.appendChild(_i);
        }
        _notification.appendChild(_group);
        $("body").append(_notification).fadeIn(300);
        _top+=100;
        $(_notification).css({"top":_top+"px","z-index":_zIndex++});
        /*叉号关闭事件*/
        $(document).on("click",".notification-closeBtn",function () {
            _this.close($(this));
        });
        if(opstions.autoClose){
            setTimeout(function () {
                _this.close($(_closeBtn));
            },2000);
        }
    };
    notify.success=function (options) {
        notify.init({
            title:options.title,
            content:options.content,
            autoClose:options.autoClose,
            type:"success"
        });
    };
    notify.info=function (options) {
        notify.init({
            title:options.title,
            content:options.content,
            autoClose:options.autoClose,
            type:"info"
        });
    };
    notify.warning=function (options) {
        notify.init({
            title:options.title,
            content:options.content,
            autoClose:options.autoClose,
            type:"warning"
        });
    };
    notify.error=function (options) {
        notify.init({
            title:options.title,
            content:options.content,
            autoClose:options.autoClose,
            type:"error"
        });
    };
    notify.close=function(ele){
        var _ele=ele;
        $(_ele).parents(".notification").nextAll(".notification").each(function () {
            var _siblingTop=$(this).position().top-100;
            $(this).css({"top":_siblingTop+"px"});
        });
        $(_ele).parents(".notification").addClass("removing").fadeOut(400).remove();
        var notifyChild=$("body>.notification");
        if(notifyChild!=undefined&&notifyChild!=null&&notifyChild!=""&&notifyChild.length>0){
            _top=$("body>.notification:last").position().top;
        }else{
            _top=-45;
        }
    };
})(notify);
