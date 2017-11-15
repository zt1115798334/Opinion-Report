<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <td>
            舆情标题:<input class="title" type="text" value="1"/>
            来源:<select class="source_type">
            <option value="network">网络</option>
            <option value="media">媒体</option>
            <option value="scene">现场</option>
            <option value="other">其他</option>
        </select>
            等级:<select class="report_level">
            <option value="red">红色</option>
            <option value="orange">橙色</option>
            <option value="yellow">黄色</option>
        </select>
            影响范围：<select class="reply_type">
            <option value="click">点击</option>
            <option value="comment">评论</option>
            <option value="estimate">预估值</option>
        </select>
            <input class="reply_number" type="text" value="2">
            链接网址:<input class="source_url" type="text" value="3">
            舆情内容:<input class="report_cause" type="text" value="4">
        </td>
    </tr>
</table>
<input type="button" value="提交" class="submit">
</body>
<script src="/assets/js/jquery-1.8.1.min.js"></script>
<script src="/common/utils.js"></script>
<script src="/common/report/opinionReport.js"></script>
</html>