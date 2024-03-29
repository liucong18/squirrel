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
    <meta charset="utf-8" />
    <title>自媒体广告投放平台</title>
    <link rel="stylesheet" href="../css/index.css" />
    <script type="text/javascript" src="../js/jquery.js" ></script>
    <script type="text/javascript" src="../js/materialize.min.js" ></script>
    <script type="text/javascript" src="../js/index.bundle.js" ></script>
    <link rel="stylesheet" href="../css/materialize-icon.css" />
    <link rel="stylesheet" href="../css/user.css" />
    <script>
        function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }
        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }
    </script>
<body ng-view="ng-view">
<!--
    描述：顶部
-->
<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope">
    <nav class="white nav1">

        <div class="nav-wrapper">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <em class="em1">enenjoy</em>
                <em class="em3">C2C内容电商平台</em>
            </a>

            <div class="nav-wrapper search-bar">
                <form ng-submit="search()" class="ng-pristine ng-invalid ng-invalid-required" action="/goods/search">
                        <input id="search" name="str" placeholder="搜一搜" style="height: 35px; width: 200px"/>
                        <button data-position="bottom" class="cengse lighten-1 waves-effect waves-light btn" ng-click="search()">
                            搜索
                        </button>
                </form>
            </div>
            <ul class="right">
                <c:if test="${empty cur_user}">
                    <li class="publish-btn">
                        <button ng-click="showLogin()" data-position="bottom" data-delay="50"
                                data-tooltip="需要先登录哦！" class="cengse lighten-1 waves-effect waves-light btn" data-tooltip-id="510d3084-e666-f82f-3655-5eae4304a83a"	>
                            发布自媒体账号</button>
                    </li>
                </c:if>
                <c:if test="${!empty cur_user}">
                    <li class="publish-btn">
                        <button data-position="bottom" class="cengse lighten-1 waves-effect waves-light btn">
                            <a href="/goods/publishGoods">发布自媒体账号</a>
                        </button>
                    </li>
                    <li class="publish-btn">
                        <button data-position="bottom" class="bule lighten-1 waves-effect waves-light btn">
                        <a href="/user/allGoods">我的自媒体账号</a>
                        </button>
                    </li>
                    <li>
                        <a>${cur_user.username}</a>
                    </li>
                    <li class="notification">
                        <i ng-click="showNotificationBox()" class="iconfont"></i>
                        <div ng-show="notification.tagIsShow" class="notification-amount red lighten-1 ng-binding ng-hide">0 </div>
                    </li>
                    <li class="changemore">
                        <a class="changeMoreVertShow()">
                            <i class="iconfont"></i>
                        </a>
                        <div class="more-vert">
                            <ul class="dropdown-content">
                                <li><a href="/user/basic">个人中心</a></li>
                                <%--<li><a onclick="ChangeName()">更改用户名</a></li>--%>
                                <li><a href="/user/logout">退出登录</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${empty cur_user}">
                    <li>
                        <a onclick="showLogin()">登录</a>
                    </li>
                    <li>
                        <a onclick="showSignup()">注册</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</div>
<!--

    描述：登录
-->
<div ng-controller="loginController" class="ng-scope">
    <div id="login-show" class="login stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showLogin()">
                    <div class="col s12 title"></div>
                </a>
                <form:form action="/user/login" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>手机</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>密码</label>
                        <a ng-click="showForget()" class="forget-btn">忘记密码？</a>
                    </div>
                    <button type="submit" class="waves-effect waves-light btn login-btn red lighten-1">
                        <i class="iconfont left"></i>
                        <em>登录</em>
                    </button>
                    <div class="col s12 signup-area">
                        <em>没有账号？赶快</em>
                        <a onclick="showSignup()" class="signup-btn">注册</a>
                        <em>吧！</em>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--

    描述：注册
-->
<div ng-controller="signupController" class="ng-scope">
    <div id="signup-show" class="signup stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showSignup()">
                    <div class="col s12 title"></div>
                </a>
                <form:form action="/user/addUser" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>昵称</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="text" name="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>手机</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>密码</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button type="submit" class="waves-effect waves-light btn verify-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>点击注册</em>
                        </button>
                    </div>
                    <div ng-show="checkTelIsShow" class="login-area col s12">
                        <em>已有账号？去</em>
                        <a onclick="showLogin()">登录</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--更改用户名-->
<div ng-controller="changeNameController" class="ng-scope">
    <div id="changeName" class="change-name stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <div class="col s12 title">
                    <h1>修改用户名</h1>
                </div>
                <form:form action="/user/changeName" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>修改用户名</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button class="waves-effect waves-light btn publish-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>确认</em>
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--

    描述：左侧导航条
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
-->

<div ng-controller="sidebarController" class="sidebar stark-components ng-scope">
    <li ng-class="{true: 'active'}[isAll]">
        <a href="/goods/homeGoods" class="index">
            <img src="../img/ShouYe.jpg">
            <em>首页</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isWeChat]">
        <a href="/goods/catelog/1" class="digital">
            <img src="../img/WeChat.jpg"  />
            <em>微信公众号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isTouTiao]">
        <a href="/goods/catelog/2" class="ride">
            <img src="../img/TouTiao.jpg"/>
            <em>头条号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isQiEr]">
        <a href="/goods/catelog/3" class="commodity">
            <img src="../img/QiEr.jpg"/>
            <em>企鹅号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isBaiJia]">
        <a href="/goods/catelog/4" class="book">
            <img src="../img/BaiJia.jpg"/>
            <em>百家号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isWangYi]">
        <a href="/goods/catelog/5" class="makeup">
            <img src="../img/WangYi.jpg"/>
            <em>网易号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isShouHu]">
        <a href="/goods/catelog/6" class="sport">
            <img src="../img/ShouHu.jpg"/>
            <em>搜狐号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isDaYu]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/DaYu.jpg"/>
            <em>UC大鱼号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isYiDian]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/YiDian.jpg"/>
            <em>一点号</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isQuTouTiao]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/QuTouTiao.jpg"/>
            <em>趣头条</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isDouYin]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/DouYin.jpg"/>
            <em>抖音小视频</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isKuaiShou]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/KuaiShou.jpg"/>
            <em>快手小视频</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isHuoShan]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/HuoShan.jpg"/>
            <em>火山小视频</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isWeiShi]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/WeiShi.jpg"/>
            <em>腾讯微视</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isXiGua]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/XiGua.jpg"/>
            <em>西瓜视频</em>
        </a>
    </li>
    <li ng-class="{true: 'active'}[isXiaoKa]">
        <a href="/goods/catelog/7" class="smallthing">
            <img src="../img/XiaoKa.jpg"/>
            <em>小咖秀</em>
        </a>
    </li>

</div>
<!--
    描述：右侧显示部分
-->
<div class="main-content">

<div class="waterfoo stark-components row"><img src="../img/Basic.jpg" height="25%" width="100%"/> </div>
    <!--
        描述：首页
    -->
    <%--<div class="index-title">--%>
        <%--<a href="<%=basePath%>goods/homeGoods">首页</a>--%>
        <%--<hr class="hr2">--%>
    <%--</div>--%>
    <%--<div class="waterfoo stark-components row">--%>
        <%--<div class="item-wrapper normal">--%>
            <%--<c:forEach var="item" items="${catelogGoods1}">--%>
                <%--<div class="card col">--%>
                    <%--<a href="<%=basePath%>goods/goodsId/${item.goods.id}">--%>
                        <%--<div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>--%>
                        <%--<div class="card-content">ID：--%>
                            <%--<span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>--%>
                        <%--</div>--%>
                        <%--<div class="card-content">名称：--%>
                            <%--<span class="item-price"><c:out value="${item.goods.name}"></c:out></span>--%>
                        <%--</div>--%>
                        <%--<div class="card-content">每条估价：--%>
                            <%--<span class="item-price"><c:out value="${item.goods.price}"></c:out></span>--%>
                        <%--</div>--%>
                        <%--<div class="card-content item-location">--%>
                            <%--<p><c:out value="${item.goods.weiZhi}"></c:out> </p>--%>
                            <%--<p><c:out value="${item.goods.startTime}"></c:out></p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</div>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!--
        描述：微信公共号
    -->
    <div class="index-title">
        <a href="">微信公共号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods1}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                         <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                         <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                         <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <!--
        描述：头条号
    -->
    <div class="index-title">
        <a href="">头条号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods2}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <%--企鹅号--%>
    <div class="index-title">
        <a href="">企鹅号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods3}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="index-title">
        <a href="">百家号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods4}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="index-title">
        <a href="">网易号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods5}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="index-title">
        <a href="">搜狐号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods6}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="index-title">
        <a href="">UC大鱼号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods7}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">一点号</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods8}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">趣头条</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods9}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">抖音小视频</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods10}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">快手小视频</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods11}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">火山小视频</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods12}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">腾讯微视</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods13}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">西瓜视频</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods14}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="index-title">
        <a href="">小咖秀</a>
        <hr class="hr2">
    </div>
    <div class="waterfoo stark-components row">
        <div class="item-wrapper normal">
            <c:forEach var="item" items="${catelogGoods15}">
                <div class="card col">
                    <a href="<%=basePath%>goods/goodsId/${item.goods.id}">
                        <div class="card-image"><img src="../upload/${item.images[0].imgUrl}" /></div>
                        <div class="card-content">ID：
                            <span class="item-price"><c:out value="${item.goods.zhanghaoId}"></c:out></span>
                        </div>
                        <div class="card-content">名称：
                            <span class="item-price"><c:out value="${item.goods.name}"></c:out></span>
                        </div>
                        <div class="card-content">每条估价：
                            <span class="item-price"><c:out value="${item.goods.price}"></c:out></span>
                        </div>
                        <div class="card-content item-location">
                            <p><c:out value="${item.goods.weiZhi}"></c:out> </p>
                            <p><c:out value="${item.goods.startTime}"></c:out></p>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>