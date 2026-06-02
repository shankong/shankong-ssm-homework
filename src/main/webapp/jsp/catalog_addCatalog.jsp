<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>新增栏目</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
</head>
<body class="form-page">

<div class="update-page-panel">
    <div class="update-page-header">
        <h2>新增栏目</h2>
        <div class="subtitle">创建新的栏目</div>
    </div>

    <div class="error-msg" id="errorMsg">
        <span style="font-size:18px;">&#9888;</span>
        <span id="errorText"></span>
    </div>

    <form class="update-form" method="post" action="${pageContext.request.contextPath}/catalog/addCatalog" onsubmit="return validateForm()">
        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">N</span>
                栏目名称
            </div>
            <div class="form-field">
                <input type="text" name="catalogName" id="catalogName" placeholder="请输入栏目名称" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">#</span>
                栏目序号
            </div>
            <div class="form-field">
                <input type="text" name="catalogNumber" id="catalogNumber" placeholder="请输入栏目序号" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">S</span>
                状态
            </div>
            <div class="form-field">
                <select name="catalogState" id="catalogState">
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

    var name = document.getElementById('catalogName').value.trim();
    if (name === '') {
        showError('请输入栏目名称！');
        return false;
    }

    return true;
}
</script>

</body>
</html>
