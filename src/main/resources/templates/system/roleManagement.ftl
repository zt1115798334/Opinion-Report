<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/js/validator-0.7.3/jquery.validator.css"/>
</head>
<body>
<table id="roleTable">
    <thead>
    <tr>
        <th hidden="hidden"></th>
        <th>角色ID</th>
        <th>角色名称</th>
        <th>创建时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<input type="text" class="roleName">
<input type="button" class="saveRoleName" value="保存">
<script src="/js/jquery-1.8.3.js"></script>
<script src="/common/utils.js"></script>
<script src="/common/login.js"></script>
<script src="/common/system/roleManagement.js?v=1"></script>
</body>
</html>