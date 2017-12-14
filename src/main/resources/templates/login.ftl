<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="/assets/plugins/bootstrap-3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/assets/plugins/jquery-3.1.1/jquery-3.1.1.min.js" type="text/javascript"></script>
    <link href="/assets/plugins/bootstrap-3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-3.3.7/css/bootstrap-theme.min.css" type="text/css" rel="stylesheet" />
    <script src="/assets/plugins/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/assets/plugins/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <link href="/assets/plugins/bootstrap-dialog/css/bootstrap-dialog.min.css" type="text/css" rel="stylesheet"/>
    <script src="/assets/plugins/bootstrap-dialog/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="/assets/plugins/icheck-1.x/skins/minimal/blue.css" rel="stylesheet" type="text/css" />
    <script src="/assets/plugins/icheck-1.x/icheck.min.js"></script>

    <link href="/assets/css/login.css" rel="stylesheet" type="text/css" /><!--登录-->
</head>
<body bgcolor="#FFFFFF">
<div class="loginBox">
    <div class="login-left">
        <img id="columnarDisc" src="../assets/images/login1_03.png" alt="">
        <img id="light_big" src="../assets/images/light_big_03.png" alt="">
        <img id="light_small" src="../assets/images/light_small_03.png" alt="">
        <img id="gu" src="/assets/images/login/dao1.png" alt="">
        <img id="line1" src="/assets/images/login/line1.png" alt="">
        <img id="line2" src="/assets/images/login/line2.png" alt="">
        <img id="line3" src="/assets/images/login/line3.png" alt="">
        <img id="line4" src="/assets/images/login/line4.png" alt="">
    </div>
    <div class="login-information">
        <div class="top">
            <div class="font">
                基层舆情上报系统
            </div>
        </div>
        <div class="login">
            <form action="">
                <div class="accounts">
                    <span class="glyphicon glyphicon-user"></span>
                    <input type="text" placeholder="帐号" maxlength="100" id="txt_username" value="" />
                </div>
                <div class="password">
                    <span class="glyphicon glyphicon-lock"></span>
                    <input type="password" placeholder="密码" maxlength="100" id="txt_password" value="" onkeydown=""/>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="txt_rememberMe" name="iCheck"  /> 记住密码
                    </label>
                </div>
                <input type="button" class="btn btn-default btn-info login-btn" onclick="" value="登录" />
            </form>
        </div>
    </div>
</div>
<#include "/public/footer.ftl"/>
<script src="/common/utils.js"></script>
<script src="/common/login.js"></script>
</body>
</html>