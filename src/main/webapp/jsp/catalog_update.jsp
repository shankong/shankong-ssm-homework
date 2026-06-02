<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>修改栏目</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
</head>
<body class="form-page">

<div class="update-page-panel">
    <div class="update-page-header">
        <h2>修改栏目</h2>
        <div class="subtitle">修改栏目信息</div>
    </div>

    <form class="update-form" method="post" action="${pageContext.request.contextPath}/catalog/updateCatalog">
        <input type="hidden" name="catalogId" value="${catalog.catalogId}" />
        <input type="hidden" name="page" value="${page}" />

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">ID</span>
                栏目ID
            </div>
            <div class="form-field">
                <span class="readonly-value">${catalog.catalogId}</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">N</span>
                栏目名称
            </div>
            <div class="form-field">
                <input type="text" name="catalogName" value="${catalog.catalogName}" placeholder="请输入栏目名称" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">#</span>
                栏目序号
            </div>
            <div class="form-field">
                <input type="text" name="catalogNumber" value="${catalog.catalogNumber}" placeholder="请输入栏目序号" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">S</span>
                状态
            </div>
            <div class="form-field">
                <select name="catalogState">
                    <option value="1" <c:if test="${catalog.catalogState eq 1}">selected</c:if>>启用</option>
                    <option value="0" <c:if test="${catalog.catalogState eq 0}">selected</c:if>>禁用</option>
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
