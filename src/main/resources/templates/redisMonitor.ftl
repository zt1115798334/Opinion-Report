<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Redis监控</title>
    <link href="/css/content-base.css" rel="stylesheet" />
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Redis 内存实时占用情况：</h5>
                </div>
                <div class="ibox-content">
                    <div id="container"></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Redis key的实时数量：</h5>
                </div>
                <div class="ibox-content">
                    <div id="keysChart"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Redis INFO：</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-condensed table-hover"
                           style="word-break: break-all; word-wrap: break-all;">
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm-7">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5></h5>
                    <div class="ibox-tools">
                        <button type="button" onclick="empty();"
                                class="btn btn-warning btn-xs">清空日志</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <table class="table table-condensed table-hover">
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="/js/jquery.js"></script>
<script src="/js/redischarts/highcharts.js"></script>
<script src="/js/redischarts/index.js"></script>
<script src="/common/utils.js"></script>
<script src="/common/redisMonitor.js"></script>
</html>