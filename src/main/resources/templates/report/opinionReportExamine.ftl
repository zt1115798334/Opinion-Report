<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>舆情上报详情</title>
    <#include "/public/public.ftl"/>
    <link href="/assets/css/flowShaft.css" type="text/css" rel="stylesheet"><!--流程轴样式-->
    <link href="/assets/plugins/wangEditor-3.0.15/release/wangEditor.css" type="text/css" rel="stylesheet"><!-- 编辑器-->
    <script type="text/javascript" src="/assets/plugins/wangEditor-3.0.15/release/wangEditor.js" charset="utf-8"></script><!-- 编辑器-->
</head>
<body>
<#include "/public/header.ftl"/>
<input id="type" value="${type}" type="hidden">
<input id="reportCode" value="${reportCode}" type="hidden">
<div id="wrapper">
    <div id="page-wrapper" style="margin-left: 260px;">
        <div class="page-content clearfix">
            <div class="bgf clearfix">
                <div class="portlet box clearfix">
                    <div class="portlet-header clearfix">
                        <div class="caseDescription" id="">
                            <div class="opinionHeader clearfix">
                                <h5 class="fs16 bold">携程亲子园事件最新进展：更多虐童视频流出</h5>
                            </div>
                            <div class="opinionBody  clearfix">
                                <div class="row m8">
                                    <div class="col-md-6 noPaddingX">
                                        来源：<span>网络</span>
                                    </div>
                                    <div class="col-md-6 noPaddingX">
                                        等级：<span>红色</span>
                                    </div>
                                </div>
                                <div class="row m8">
                                    <div class="col-md-6 noPaddingX">
                                        影响范围：<span>点击数34</span>
                                    </div>
                                    <div class="col-md-6 noPaddingX">
                                        链接网址：<a href="" class="colorfive">http://tech.sina.com.cn/i/2017-11-13/doc-ifynshev5756392.shtml</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="portlet-body clearfix">
                        <!-- 编辑器wangEditor-->
                        <div id="editor">
                            <div id="u1623_text" class="text ">
                                <p><span style="font-family:'微软雅黑';">来源微信号：西雅图雷尼尔</span></p><p><span style="font-family:'微软雅黑';">　　携程亲子园事件最新进展与一些问题</span></p><p><span style="font-family:'微软雅黑';">　　1、携程亲子园事件最新进展</span></p><p><span style="font-family:'微软雅黑';">　　更多的虐童视频流出。</span></p><p><span style="font-family:'微软雅黑';">　　自行微博搜索，虐待的形式五花八门，有绑在椅子上，使劲踹，暴力殴打，折叠拉一字马。</span></p><p><span style="font-family:'微软雅黑';">　　这些保育员难道是从731来的，怎么能这么恶毒，怎么能下的去手啊！涉案人数会继续增加。</span></p><p><span style="font-family:'微软雅黑';">　　</span></p><div id="u1625" class="ax_default _图片"><img id="u1625_img" class="img " src="https://d2t44wh9rnwl5y.cloudfront.net/gsc/PHO4S0/f3/b3/30/f3b330dee8c549708daf23027ffbbafc/images/舆情上报详情（_审核）/u1625.png?token=28b061015f21881f88f3542610a57816"></div><p><span style="font-family:'微软雅黑';">　　2、亲子园家属方面</span></p><p><span style="font-family:'微软雅黑';">　　一名ID为@叶子_perryyeh 上海携程托儿班幼儿家长，在微博上同步报道事件的进展。大多数幼儿家长都是员工很难站出来和东家和妇联怼。</span></p><p><span style="font-family:'微软雅黑';">　　是的，别人平时在家里一根手指头都不会碰，没想到在这个地方遭到如此惨无人道的虐待。这就尴尬了。</span></p><p><span style="font-family:'微软雅黑';">　　3． 携程方面</span></p><p><span style="font-family:'微软雅黑';">　　携程的内部调查还在继续，高层非常重视。负责监管的两位员工已被开除。有可能涉及玩忽职守罪也会被起诉。希望无论牵涉到谁，该担责任的一个都别放过。</span></p>
                            </div>
                        </div>

                        <!--流程轴-->
                        <div class="bgf flowShaft">
                            <h5 style="padding: 10px 5px;font-weight: 600;">处理记录</h5>
                            <div class="flowShaftSide state_active">
                                <img src="../../assets/images/state_waite.png" alt="">
                                <h5 >
                                    <i id="">2017-11-30  14:24:08</i>
                                    <span class="flowShaftResult">用户名称2采纳舆情。</span>
                                </h5>
                            </div>
                            <div class="flowShaftSide state_no">
                                <img src="../../assets/images/state_waite.png" alt="">
                                <h5 >
                                    <i id="">2017-11-30  14:24:08</i>
                                    <span class="flowShaftResult">用户名称3不予采纳舆情。</span>
                                </h5>
                            </div>
                            <div class="flowShaftSide state">
                                <img src="../../assets/images/state_Agree.png"  alt="">
                                <h5 >
                                    <i id="">2017-11-30  13:50:08</i>
                                    <span class="flowShaftResult">用户名称1上报舆情。</span>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>

                <!--处理按钮-->
                <div class="col-md-12 text-center  padding20 clearfix" id="showButton">
                    <input id="" type="button" class="btn btn-primary modalBtn_orange" onclick="" value="不予采纳">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="" type="button" class="btn btn-primary modalBtn" onclick="" value="采纳">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="" type="button" class="btn btn-primary modalBtn_lingtgray" onclick="" value="上报">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input id="backListBtn" type="button" class="btn btn-primary modalBtn_lingtgray"  value="返回">
                </div>

            </div>
        </div>
        <!--page-content结束-->
    </div>
    <!--page-wrapper结束-->
</div>
<!--wrapper结束-->
<#include "/public/footer.ftl"/>

<script src="/common/utils.js"></script>
<script src="/common/report/opinionReportExamine.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $('.selectpicker').selectpicker({
            style: 'btn-default',
            size: 5
        });

        //高度
        ResizeHeight();
        window.onresize=function(){
            ResizeHeight();
        }

    });
    function ResizeHeight(){
        var height=$(window).height()- 67 - 40;
        $("#wrapper").css("min-height",height);
    }
</script>
</body>
</html>