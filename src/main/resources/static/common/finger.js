$(function () {
   $(document).on('click',".login-finger-btn",function () {
       checkFinger();
   });
});

function checkFinger(){//指纹对比模块js
    if (navigator.appName == "Microsoft Internet Explorer")	{
        if (typeof zkonline.RegisterTemplate != "undefined") {
            if (zkonline.GetVerTemplate()){
                VerifyTemplate=zkonline.VerifyTemplate;

            }else{
                VerifyTemplate="";
                return;
            }
        } else {
            var errnum = "0";
            var emessage = "登记失败.";
            var etips = "请检查确认已安装ZKOnline客户端和指纹设备已连接.";
            DisplayError(errnum,emessage,etips);
            return;
        }
    } else {
        if (window["zkonline"]) {
            if (zkonline.GetVerTemplate()){
                VerifyTemplate=zkonline.VerifyTemplate;
            }else{
                VerifyTemplate="";
                return;
            }
        } else {
            var errnum = "0";
            var emessage = "登记失败.";
            var etips = "请检查确认已安装ZKOnline客户端和指纹设备已连接.";
            DisplayError(errnum,emessage,etips);
            return;
        }
    }
    $("#fingerReg").val(VerifyTemplate)
}

function DisplayError(errnum,emessage,etips){
    $("id_error").style.display = "block";//id为id_error的对象的display（显示）方式为block（显示）
    if(errnum=="0"){                                           //如果错误号码为0
        $("id_error").innerHTML="<ul class='errorlist'><li>"+emessage+"</li><li>"+etips+"</li></ul>";
    }
}