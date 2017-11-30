<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }

        .text {
            border: 1px solid #ccc;
            height: 400px;
        }
    </style>
</head>
<body>
<div id="div1" class="toolbar">
</div>
<div style="padding: 5px 0; color: #ccc">中间隔离带</div>
<div id="div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度-->
    <p>请输入内容</p>
</div>
<button id="btn1">获取html</button>
<button id="btn2">获取text</button>
<script type="text/javascript" src="/common/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var editor = new E('#div1', '#div2')  // 两个参数也可以传入 elem 对象，class 选择器
    //    editor.customConfig.menus = [
    //        'head',
    //        'bold',
    //        'italic',
    //        'underline'
    //    ]
//    editor.customConfig.lang = {
//        '设置标题': 'title',
//        '正文': 'p',
//        '链接文字': 'link text',
//        '链接': 'link',
//        '上传图片': 'upload image',
//        '上传': 'upload',
//        '创建': 'init'
//        // 还可自定添加更多
//    }
    // 关闭粘贴样式的过滤
    //    editor.customConfig.pasteFilterStyle = false
    //    // 自定义处理粘贴的文本内容
    //    editor.customConfig.pasteTextHandle = function (content) {
    //        // content 即粘贴过来的内容（html 或 纯文本），可进行自定义处理然后返回
    //        return content + '<p>在粘贴内容后面追加一行</p>'
    //    }
    //    editor.customConfig.linkImgCallback = function (url) {
    //        console.log(url) // url 即插入图片的地址
    //    }
    //    editor.customConfig.onfocus = function () {
    //        console.log("onfocus")
    //    }
    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    //     editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.customConfig.uploadImgServer = '/wangEditor/upload'  // 上传图片到服务器
    editor.customConfig.uploadFileName = 'file'
    editor.customConfig.uploadImgHeaders = {
        'Accept': 'application/json'
    }
    editor.customConfig.debug = true
    editor.create()
    //    editor.$textElem.attr('contenteditable', true)
    //    editor.txt.html('<p>用 JS 设置的内容</p>')
    //    editor.txt.append('<p>追加的内容</p>')
    //
    //    var json = editor.txt.getJSON()  // 获取 JSON 格式的内容
    //    var jsonStr = JSON.stringify(json)
    //    console.log(json)
    //    console.log(jsonStr)
    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html())
    }, false)

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)
</script>
</body>
</html>