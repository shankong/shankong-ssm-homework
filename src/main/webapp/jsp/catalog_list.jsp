<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>栏目列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body class="manager-list-page">

<form method="post" action="${pageContext.request.contextPath}/catalog" id="batchForm" data-delete-url="/catalog/deleteCatalog">
    <input type="hidden" name="type" value="delByIds">
    <input type="hidden" name="page" value="${currentPage}">

    <div class="admin-panel">
        <div class="panel-head"><strong class="icon-reorder"></strong> 栏目列表</div>

        <div class="padding border-bottom">
            <ul class="search">
                <li>
                    <button type="button" class="button border-green" id="checkallBtn">
                        <span class="icon-check"></span> 全选本页
                    </button>
                    <button type="button" class="button border-red" id="batchDelBtn">
                        <span class="icon-trash-o"></span> 批量删除
                    </button>
                </li>
            </ul>
        </div>

        <table class="table table-hover text-center">
            <tr>
                <th width="60">选择</th>
                <th width="80">序号</th>
                <th>栏目名称</th>
                <th>栏目序号</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:choose>
                <c:when test="${empty catalogList}">
                    <tr>
                        <td colspan="6">暂无栏目数据</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${catalogList}" var="catalog" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="catalogId" class="item-checkbox" value="${catalog.catalogId}" /></td>
                            <td>${status.count + (currentPage - 1) * pageSize}</td>
                            <td>${catalog.catalogName}</td>
                            <td>${catalog.catalogNumber}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${catalog.catalogState eq 1}">启用</c:when>
                                    <c:otherwise>禁用</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="button-group">
                                    <a class="button border-main" href="${pageContext.request.contextPath}/catalog/moveUp?id=${catalog.catalogId}&page=${currentPage}">
                                        <span class="icon-arrow-up"></span> 上移
                                    </a>
                                    <a class="button border-main" href="${pageContext.request.contextPath}/catalog/moveDown?id=${catalog.catalogId}&page=${currentPage}">
                                        <span class="icon-arrow-down"></span> 下移
                                    </a>
                                    <a class="button border-main" href="${pageContext.request.contextPath}/catalog/findById?id=${catalog.catalogId}&page=${currentPage}">
                                        <span class="icon-edit"></span> 修改
                                    </a>
                                    <a class="button border-red js-delete-btn" href="javascript:void(0)" data-id="${catalog.catalogId}">
                                        <span class="icon-trash-o"></span> 删除
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <c:if test="${not empty catalogList}">
                <tr>
                    <td colspan="6">
                        <div class="pagelist">
                            <c:set var="ctx" value="${pageContext.request.contextPath}" />
                            <c:if test="${currentPage > 1}">
                                <a href="${ctx}/catalog/findAllCatalog?page=1">首页</a>
                                <a href="${ctx}/catalog/findAllCatalog?page=${currentPage - 1}">上一页</a>
                            </c:if>
                            <span>第 ${currentPage} 页 / 共 ${totalPages} 页</span>
                            <c:if test="${currentPage < totalPages}">
                                <a href="${ctx}/catalog/findAllCatalog?page=${currentPage + 1}">下一页</a>
                                <a href="${ctx}/catalog/findAllCatalog?page=${totalPages}">尾页</a>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:if>
        </table>
    </div>
</form>

<script src="${pageContext.request.contextPath}/static/js/admin.js"></script>

</body>
</html>
