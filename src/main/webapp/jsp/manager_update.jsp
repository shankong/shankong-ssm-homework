<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>修改管理员</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body class="form-page">

<div class="update-page-panel">
    <div class="update-page-header">
        <h2>修改管理员</h2>
        <div class="subtitle">修改管理员账号信息</div>
    </div>

    <form class="update-form" method="post" action="${pageContext.request.contextPath}/manager/updateManager">
        <input type="hidden" name="managerId" value="${manager.managerId}" />
        <input type="hidden" name="page" value="${page}" />

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">ID</span>
                管理员ID
            </div>
            <div class="form-field">
                <span class="readonly-value">${manager.managerId}</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">N</span>
                用户名
            </div>
            <div class="form-field">
                <input type="text" name="managerName" value="${manager.managerName}" placeholder="请输入管理员用户名" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">P</span>
                新密码
            </div>
            <div class="form-field">
                <input type="password" name="managerPwd" placeholder="留空则不修改密码" autocomplete="new-password" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">S</span>
                状态
            </div>
            <div class="form-field">
                <select name="managerState">
                    <c:set var="s" value="${manager.managerState}" />
                    <option value="1" <c:if test="${s eq '1' || s eq '启用'}">selected</c:if>>启用</option>
                    <option value="0" <c:if test="${s eq '0' || s eq '禁用'}">selected</c:if>>禁用</option>
                </select>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">保存修改</button>
        </div>
    </form>
</div>

</body>
</html>
