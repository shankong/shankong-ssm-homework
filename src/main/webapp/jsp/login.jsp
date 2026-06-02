<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>管理员登陆</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
</head>
<body class="login-page">
<div class="login-container">
    <div class="login-header">
        <div class="logo-icon">&#128736;</div>
        <h1>管理员登陆</h1>
        <p>后台管理系统</p>
    </div>
    <div class="login-body">
        <c:if test="${not empty error}">
            <div class="error-msg show">
                <span class="icon-warning">&#9888;</span>
                <span>${error}</span>
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
            <div class="form-group">
                <label>用户名</label>
                <div class="input-wrapper">
                    <span class="input-icon">&#128100;</span>
                    <input type="text" name="managerName" id="managerName" placeholder="请输入管理员账号" autocomplete="off" />
                </div>
            </div>
            <div class="form-group">
                <label>密码</label>
                <div class="input-wrapper">
                    <span class="input-icon">&#128274;</span>
                    <input type="password" name="managerPwd" id="managerPwd" placeholder="请输入登录密码" />
                </div>
            </div>
            <div class="form-extra">
                <label class="remember-me">
                    <input type="checkbox" name="remember" id="rememberMe" />
                    <span>记住我</span>
                </label>
            </div>
            <button type="submit" class="login-btn">登 陆</button>
        </form>
    </div>
    <div class="login-footer">
        &copy; 2026 后台管理系统 · 管理员登陆
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</body>
</html>
