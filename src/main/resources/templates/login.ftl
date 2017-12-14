<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=11"/>
    <#include "/public/public.ftl"/>
</head>
<body bgcolor="#FFFFFF">
<div class="middle-box text-center loginscreen  ">
    <div class="middle-box text-center loginscreen  ">
        <div>
            <form id="userForm">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="用户名" data-rule="用户名:required" id="username">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" data-rule="密码:required;password"
                           id="password">
                </div>
                <div class="form-group" style="text-align : left">
                    <label><input type="checkbox" id="rememberMe" style="width: 12px; height: 12px;margin-right: 5px;">记住我</label>
                </div>
                <button type="button" class="btn btn-primary block full-width ">登 录</button>
            </form>
        </div>
    </div>
    <div class="part" style="z-index:-1;position:fixed;height:100%;width:100%;top:0;left:0"></div>
    <script src="/common/utils.js"></script>
    <script src="/common/login.js"></script>
</div>
</body>
</html>