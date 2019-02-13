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
    <title>修改商品</title>
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/zh.js"></script>

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
                <span class="school">龙岩学院</span>
                <span class="name">闲置数量：${cur_user.goodsNum}</span>
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
                    <a href="">
                        <li class="fri">
                            <div></div>
                            <span>关注列表</span>
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
                            <span>发布物品</span>
                            <strong></strong>
                        </li>
                    </a>
                    <a href="/user/allGoods">
                        <li class="second">
                            <div></div>
                            <span>我的闲置</span>
                            <strong></strong>
                        </li>
                    </a>
                </ul>
            </div>
        </div>
        <!--
	            描述：发布物品
        -->
        <div id="user_content">
            <div class="basic">
                <form:form action="/goods/editGoodsSubmit" method="post" role="form" enctype="multipart/form-data">
                    <h1 style="margin-left: 210px;">修改物品信息</h1><hr />
                    <div class="changeinfo">
                        <span>物品名：</span>
                        <input class="in_info" type="text" name="name" placeholder="请输入物品名" value="${goodsExtend.goods.name}"/>
                        <span>(*必填)</span>
                    </div>
                    <div class="changeinfo">
                        <span>出售价格：</span>
                        <input class="in_info" type="text" name="price" placeholder="请输入出售价格" value="${goodsExtend.goods.price}"/>
                       <span>(*必填)</span>
                   </div>
                   <div class="changeinfo">
                        <span>原价：</span>
                        <input class="in_info" type="text" name="realPrice" placeholder="请输入商品原价" value="${goodsExtend.goods.realPrice}"/>
                        <span id="checkphone">(*选填,请如实填写)</span>
                     </div>
                     <div class="changeinfo">
                        <span>自媒体平台：</span>
                        <select class="in_info" name="catelogId">
                            <%--1、微信公众号 2、头条号 3、企鹅号 4、百家号 5、网易号 6、搜狐号 7、大鱼号--%>
                            <%--8、一点号 9、凤凰号 10、东方号 11、众媒号 12、新浪看点 13、简书 14、趣头条--%>
                            <%--15、支付宝生活号 16、京东号 17、易信 18、看荐 19、号外号 20、封面号 21、迅雷号22、QQ公众号--%>
                            <option value="1">微信公众号</option>
                            <option value="2">头条号</option>
                            <option value="3">企鹅号</option>
                            <option value="4">百家号</option>
                            <option value="5">网易号</option>
                            <option value="6">搜狐号</option>
                            <option value="7">大鱼号</option>
                            <option value="8">一点号</option>
                            <option value="9">凤凰号</option>
                            <option value="10">东方号</option>
                            <option value="11">众媒号</option>
                            <option value="12">简书</option>
                            <option value="13">趣头条</option>
                            <option value="14">支付宝生活号</option>
                            <option value="15">京东号</option>
                            <option value="16">易信</option>
                            <option value="17">看荐</option>
                            <option value="18">号外号</option>
                            <option value="19">封面号</option>
                            <option value="20">QQ公众号</option>

                            <option value="21">抖音</option>
                            <option value="22">快手</option>
                            <option value="23">火山小视频</option>
                            <option value="24">秒拍</option>
                            <option value="25">美拍</option>
                            <option value="26">西瓜视频</option>
                            <option value="27">梨视频</option>
                            <option value="28">微视</option>
                            <option value="29">小咖秀</option>
                            <%--<option value="30">东方号</option>--%>
                            <%--<option value="31">众媒号</option>--%>
                            <%--<option value="32">简书</option>--%>
                            <%--<option value="33">趣头条</option>--%>
                            <%--<option value="34">支付宝生活号</option>--%>
                            <%--<option value="35">京东号</option>--%>
                            <%--<option value="36">易信</option>--%>
                            <%--<option value="37">看荐</option>--%>
                            <%--<option value="38">号外号</option>--%>
                            <%--<option value="39">封面号</option>--%>
                            <%--<option value="40">QQ公众号</option>--%>
                        </select>
                    </div>

                    <div class="changeinfo" id="dir">
                        <span>商品描述：</span>
                        <div class="sha">
                            <div class="publ">
                                <div class="pub_con">
                                    <div class="text_pu">
                                        <input type="text" name="describle" class="emoji-wysiwyg-editor" value="${goodsExtend.goods.describle}"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <hr />
                    <div class="changeinfo">
                        <span>图片：</span>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-1">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <img src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}"/>
                                            <input type="hidden" name="imgUrl" value="${goodsExtend.images[0].imgUrl}">
                                            <input type="hidden" name="id" value="${goodsExtend.goods.id}">
                                            <input type="hidden" name="startTime" value="${goodsExtend.goods.startTime}">
                                            <input type="hidden" name="endTime" value="${goodsExtend.goods.endTime}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="submit" class="setting-save" value="提交修改" style="margin-top: 20px;background-color: blue;"/>
                </form:form>
            </div>
            <!--
                描述：最右侧，可能认识的人
            -->
            <div class="recommend">
                <div class="title">
                    <span class="text">可能认识的人</span>
                    <span class="change">换一组</span>
                    <span class="underline"></span>
                </div>
                <ul>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo1.jpg">
                        </a>
                        <span>Brudce</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo2.jpg">
                        </a>
                        <span>Graham</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo3.jpg">
                        </a>
                        <span>策马奔腾hly</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo4.jpg">
                        </a>
                        <span>Danger-XFH</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                    <li>
                        <a href="" class="head_img">
                            <img src="<%=basePath%>img/photo5.jpg">
                        </a>
                        <span>Keithw</span>
                        <div class="fa fa-plus-square"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>