$(function () {
    var url = "/redis/getRedisMonitor";
    var params = {};
    execAjax(url, params, callback);

    function callback(result) {
        var data = result.data;
        var ridList = data.ridList;
        var logList = data.logList;
        var logLen = data.logLen;

        var ridHtml = '';
        for (var i in ridList) {
            var info = ridList[i];
            ridHtml += '  <tr>\n' +
                '           <td title="' + info.key + ':' + info.desctiption + '">' + info.key + '</td>\n' +
                '           <td>' + info.desctiption + '</td>\n' +
                '           <td>' + info.value + '</td>\n' +
                '         </tr>'
        }
        var logHtml = '';
        for (var i in logList) {
            var log = logList[i];
            logHtml += '<tr>\n' +
                '        <td>' + log.id + '</td>\n' +
                '        <td>' + log.executeTime + '</td>\n' +
                '        <td>' + log.usedTime + '</td>\n' +
                '        <td><p style="width: 600px; word-wrap: break-word; word-break: normal;">' + log.args + '}</p></td>\n' +
                '      </tr>'
        }

        $(".col-sm-5 tbody").html(ridHtml);
        $(".col-sm-7 tbody").html(ridHtml);
        $(".col-sm-7 h5").html("Redis实时日志(共"+logLen+"条)：");
    }
})