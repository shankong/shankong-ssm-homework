<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>后台管理中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body class="index-page">

<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1>
            <img src="${pageContext.request.contextPath}/images/y.jpg" class="radius-circle" height="50" alt="" />
            后台管理中心
        </h1>
    </div>
    <div class="head-l">
        <a class="button bg-green" href="#" target="_blank"><span class="icon-home"></span> 前台首页</a>
        <a class="button bg-blue" href="#"><span class="icon-wrench"></span> 清除缓存</a>
        <a class="button bg-red" href="${pageContext.request.contextPath}/logout"><span class="icon-power-off"></span> 退出登录</a>
    </div>
</div>

<div class="body-wrapper">

<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span> 菜单列表</strong></div>

    <h2><span class="icon-user"></span> 基本设置</h2>
    <ul class="open">
        <li><a href="${pageContext.request.contextPath}/manager/findAllManager" target="right"><span class="icon-caret-right"></span> 管理员列表</a></li>
        <li><a href="${pageContext.request.contextPath}/manager/toAddManager" target="right"><span class="icon-caret-right"></span> 新增管理员</a></li>
    </ul>

    <h2><span class="icon-pencil-square-o"></span> 栏目管理</h2>
    <ul class="open">
        <li><a href="${pageContext.request.contextPath}/catalog/findAllCatalog" target="right"><span class="icon-caret-right"></span> 内容管理</a></li>
    </ul>

    <h2><span class="icon-pencil-square-o"></span> 文章管理</h2>
    <ul class="open">
        <li><a href="${pageContext.request.contextPath}/article?type=findall" target="right"><span class="icon-caret-right"></span> 内容管理</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog?type=register" target="right"><span class="icon-caret-right"></span> 添加内容</a></li>
        <li><a href="${pageContext.request.contextPath}/catalog?type=cate" target="right"><span class="icon-caret-right"></span> 分类管理</a></li>
    </ul>
</div>

<div class="main-content">
    <ul class="bread">
        <li><a href="${pageContext.request.contextPath}/manager?type=toright" target="right"><span class="icon-home"></span> 首页</a></li>
        <li><a href="#" id="a_leader_txt">网站信息</a></li>
        <li><b>当前语言：</b><span class="text-red">中文</span></li>
        <li>切换语言：<a href="#">中文</a> | <a href="#">英文</a></li>
    </ul>

    <div class="admin">
        <iframe src="${pageContext.request.contextPath}/manager?type=toright" name="right" frameborder="0" scrolling="auto"></iframe>
    </div>

    <div class="index-footer">
        <p>来源：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
    </div>
</div>
</div>

</body>
</html>
