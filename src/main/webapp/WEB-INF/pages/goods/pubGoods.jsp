<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布商品</title>
    <link rel="stylesheet" href="../css/font-awesome.min.css" />
    <link rel="stylesheet" href="../css/userhome.css" />
    <link rel="stylesheet" href="../css/user.css" />
    <script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <!-- 图片上传即使预览插件 -->
    <link rel="stylesheet" href="../css/fileinput.min.css">
    <script type="text/javascript" src="../js/fileinput.min.js"></script>
    <script type="text/javascript" src="../js/zh.js"></script>

    <style>
        .container{padding-top:10px}
    </style>
</head>
<body>
<div class="pre-2" id="big_img">
    <img src="http://findfun.oss-cn-shanghai.aliyuncs.com/images/head_loading.gif" class="jcrop-preview jcrop_preview_s">
</div>
<div id="cover" style="min-height: 639px;">
    <div id="user_area">
        <div id="home_header">
            <a href="<%=basePath%>goods/homeGoods">
                <h1 class="logo"></h1>
            </a>
            <a href="/user/home">
                <div class="home"></div>
            </a>
        </div>
        <!--
            
            描述：左侧个人中心栏
        -->
        <div id="user_nav">
            <div class="user_info">
                <div class="head_img">
                    <img src="<%=basePath%>img/photo.jpg">
                </div>
                <div class="big_headimg">
                    <img src="">
                </div>
                <span class="name">${cur_user.username}</span>
                <span class="name">自媒体账号：${cur_user.goodsNum}</span>
            </div>
            <div class="home_nav">
                <ul>
                    <a href="">
                        <li class="notice">
                            <div></div>
                            <span>我的消息</span>
                            <strong></strong>
                        </li>
                    </a>

                    <a href="/user/basic">
                        <li class="set">
                            <div></div>
                            <span>个人设置</span>
                            <strong></strong>
                        </li>
                    </a>

                    <a href="/goods/publishGoods">
                        <li class="store">
                            <div></div>
                            <span>发布自媒体账号</span>
                            <strong></strong>
                        </li>
                    </a>

                    <a href="/user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>自媒体账号列表</span>
                            <strong></strong>
                        </li>
                    </a>

                </ul>
            </div>
        </div>
        
        <div id="user_content">
            <div class="basic">
                <form:form action="/goods/publishGoodsSubmit" method="post" role="form" enctype="multipart/form-data">
                    <h1 style="margin-left: 210px;">我的自媒体账号</h1><hr />

                    <div class="changeinfo">
                        <span >账号名称：</span>
                        <input class="in_info" type="text" name="name" placeholder="请输入账号名称"/>
                        <span style="color: #f80600">(*必填：方便买家查看你的自媒体账号)</span>
                    </div>

                    <div class="changeinfo">
                        <span>账号ID：</span>
                        <input class="in_info" type="text" name="zhanghaoId" placeholder="请输入账号ID"/>
                        <span style="color: #f80600">(*必填：方便买家查看你的自媒体账号)</span>
                    </div>

                    <div class="changeinfo">
                        <span>WeChat：</span>
                        <input class="in_info" type="text" name="weChat" placeholder="请输入微信号"/>
                        <span style="color: #f80600">(*必填：方便买家联系您)</span>
                    </div>

                    <div class="changeinfo">
                        <span>TEL：</span>
                        <input class="in_info" type="text" name="TEL" placeholder="请输入手机号"/>
                        <span style="color: #f80600">(*必填：方便买家联系您)</span>
                    </div>

                    <div class="changeinfo">
                        <span>粉丝量：</span>
                        <input class="in_info" type="text" name="fans" placeholder="请输入粉丝数量"/>
                        <span style="color: #00C853">(*选填：更好的吸引买家)</span>
                    </div>

                    <div class="changeinfo">
                        <span>每条估价：</span>
                        <input class="in_info" type="text" name="price" placeholder="请输入每条估价"/>
                        <span style="color: #00C853">(*选填：方便买家商品价格)</span>
                    </div>

                    <div class="changeinfo">
                        <span>概不议价：</span>
                        <input class="in_info" type="text" name="realPrice" placeholder="请输入价格"/>
                        <span style="color: #00C853">(*选填,请如实填写)</span>
                    </div>

                    <div class="changeinfo">
                        <span>所在地理位置：</span>
                        <input class="in_info" type="text" name="weiZhi" placeholder="请输入位置"/>
                        <span style="color: #00C853">(*选填,请如实填写)</span>
                    </div>

                    <div class="changeinfo">
                        <span>自媒体平台：</span>
                        <select class="in_info" name="catelogId">
                            <option value="1">微信公众号</option>
                            <option value="2">头条号</option>
                            <option value="3">企鹅号</option>
                            <option value="4">百家号</option>
                            <option value="5">网易号</option>
                            <option value="6">搜狐号</option>
                            <option value="7">UC大鱼号</option>
                            <option value="8">一点号</option>
                            <option value="9">趣头条</option>
                            <option value="10">抖音小视频</option>
                            <option value="11">快手小视频</option>
                            <option value="12">火山小视频</option>
                            <option value="13">腾讯微视</option>
                            <option value="14">西瓜视频</option>
                            <option value="25">小咖秀</option>
                        </select>
                        <span style="color: #f80600">(*必填,请如实填写)</span>
                    </div>

                    <div class="changeinfo" id="dir">
                        <span>账号描述：<font style="color: #00C853"> (选填：请添加地名等信息，方便买家在搜索时，更方便的搜到您！)</font></span>
                        <br>
                        <div class="sha">
                            <div class="publ">
                                <div class="pub_con">
                                    <div class="text_pu">
                                        <input type="text" name="describle" class="emoji-wysiwyg-editor"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                    <br />
                    <hr />
                    <div class="changeinfo">
                        <span>账号图片：<font style="color: #00C853">(选填：可以是一条点赞量超多的小视频，或者阅读量超多的文章等等！)</font></span>
                        <br>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-1">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <input type="file" name="myfile" data-ref="imgUrl" class="col-sm-10 myfile" value=""/>
                                            <input type="hidden" name="imgUrl" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                    <br>
                     <input type="submit" class="setting-save" value="发布账号" style="margin-top: 20px;background-color: blue;"/>
                </form:form>
            </div>

        </div>
    </div>
</div>
<script>
    $(".myfile").fileinput({
        uploadUrl:"<%=basePath%>goods/uploadFile",//上传的地址
        uploadAsync:true, //默认异步上传
        showUpload: false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption: true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled: true,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 3, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        allowedFileTypes: ['image'],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
        language : 'zh'
    })
    //异步上传返回结果处理
    $('.myfile').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $(".myfile").on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded");
        var ref=$(this).attr("data-ref");
        $("input[name='"+ref+"']").val(data.response.imgUrl);
    });

    //同步上传错误处理
    $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
        console.log("filebatchuploaderror");
        console.log(data);
    });

    //同步上传返回结果处理
    $(".myfile").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        console.log("filebatchuploadsuccess");
        console.log(data);
    });

    //上传前
    $('.myfile').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
</script>
</body>
</html>