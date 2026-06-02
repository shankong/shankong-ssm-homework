<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>新增管理员</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body class="form-page">

<div class="update-page-panel">
    <div class="update-page-header">
        <h2>新增管理员</h2>
        <div class="subtitle">创建新的管理员账号</div>
    </div>

    <div class="error-msg" id="errorMsg">
        <span style="font-size:18px;">&#9888;</span>
        <span id="errorText"></span>
    </div>

    <form class="update-form" method="post" action="${pageContext.request.contextPath}/manager/toAddManager" onsubmit="return validateForm()">
        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">N</span>
                用户名
            </div>
            <div class="form-field">
                <input type="text" name="managerName" id="managerName" placeholder="请输入管理员用户名" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">P</span>
                密码
            </div>
            <div class="form-field">
                <input type="password" name="managerPwd" id="managerPwd" placeholder="请输入6位数字密码" autocomplete="new-password" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">P</span>
                确认密码
            </div>
            <div class="form-field">
                <input type="password" id="confirmPwd" placeholder="请再次输入密码" autocomplete="new-password" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">S</span>
                状态
            </div>
            <div class="form-field">
                <select name="managerState" id="managerState">
                    <option value="1" selected>启用</option>
                    <option value="0">禁用</option>
                </select>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">添加</button>
        </div>
    </form>
</div>

<script>
function showError(msg) {
    document.getElementById('errorText').textContent = msg;
    document.getElementById('errorMsg').classList.add('show');
}

function hideError() {
    document.getElementById('errorMsg').classList.remove('show');
}

function validateForm() {
    hideError();

    var name = document.getElementById('managerName').value.trim();
    var pwd = document.getElementById('managerPwd').value;
    var confirmPwd = document.getElementById('confirmPwd').value;

    if (name === '') {
        showError('请输入用户名！');
        return false;
    }

    if (pwd === '') {
        showError('请输入密码！');
        return false;
    }

    if (!/^\d{6}$/.test(pwd)) {
        showError('密码长度只能为6位数字！');
        return false;
    }

    if (pwd !== confirmPwd) {
        showError('两次输入的密码不一致！');
        return false;
    }

    return true;
}
</script>

</body>
</html>
