<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="/css/animate.min.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/style.min.css">
    <link rel="stylesheet" href="/css/iconfont.css">
    <link rel="stylesheet" href="/js/validator-0.7.3/jquery.validator.css">
    <link rel="stylesheet" href="/css/sweetalert/sweetalert.css">


</head>
<body bgcolor="#FFFFFF">
<div class="middle-box text-center loginscreen  ">
    <div class="middle-box text-center loginscreen  ">
        <div>
            <form id="userForm" class=" animated rollIn"
                  data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名" data-rule="用户名:required" id="username">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" data-rule="密码:required;password"
                           id="password">
                </div>
                <div class="form-group col-xs-6" style="padding-left: 0px;">
                    <img src="/getGifCode">
                </div>
                <div class="form-group col-xs-6">
                    <span><input type="text" class="form-control" placeholder="验证码" data-rule="验证码:required" id="vcode"></span>
                </div>
                <div class="form-group" style="text-align : left">
                    <label><input type="checkbox" id="rememberMe" style="width: 12px; height: 12px;margin-right: 5px;">记住我</label>
                </div>
                <button type="submit" class="btn btn-primary block full-width ">登 录</button>
            </form>
        </div>
    </div>
    <div class="part" style="z-index:-1;position:fixed;height:100%;width:100%;top:0;left:0"></div>
    <script src="../js/jquery-1.8.3.js"></script>
    <script src="../js/validator-0.7.3/jquery.validator.js"></script>
    <script src="../js/validator-0.7.3/local/zh_CN.js"></script>
    <script src="../js/host.js"></script>
    <script src="../js/sweetalert/sweetalert.min.js"></script>
    <script src="../common/utils.js"></script>
    <script src="../common/login.js"></script>
</body>
</html>