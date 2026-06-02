<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>管理员列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body class="manager-list-page">

<form method="post" action="${pageContext.request.contextPath}/manager" id="batchForm" data-delete-url="/manager/updateManagerState">
    <input type="hidden" name="type" value="delByIds">
    <input type="hidden" name="page" value="${currentPage}">

    <div class="admin-panel">
        <div class="panel-head"><strong class="icon-reorder"></strong> 管理员列表</div>

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
                <th>用户名</th>
                <th>密码</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:choose>
                <c:when test="${empty managerList}">
                    <tr>
                        <td colspan="6">暂无管理员数据</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${managerList}" var="manager" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="managerId" class="item-checkbox" value="${manager.managerId}" /></td>
                            <td>${status.count}</td>
                            <td>${manager.managerName}</td>
                            <td>******</td>
                            <td>
                                <c:choose>
                                    <c:when test="${manager.managerState eq '1'}">启用</c:when>
                                    <c:otherwise>禁用</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="button-group">
                                    <a class="button border-main" href="${pageContext.request.contextPath}/manager/findById?id=${manager.managerId}&page=${currentPage}">
                                        <span class="icon-edit"></span> 修改
                                    </a>
                                    <a class="button border-red js-delete-btn" href="javascript:void(0)" data-id="${manager.managerId}">
                                        <span class="icon-trash-o"></span> 删除
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>

            <c:if test="${not empty managerList}">
                <tr>
                    <td colspan="6">
                        <div class="pagelist">
                            <c:set var="ctx" value="${pageContext.request.contextPath}" />
                            <c:if test="${currentPage > 1}">
                                <a href="${ctx}/manager/findAllManager?page=1">首页</a>
                                <a href="${ctx}/manager/findAllManager?page=${currentPage - 1}">上一页</a>
                            </c:if>
                            <span>第 ${currentPage} 页 / 共 ${totalPages} 页</span>
                            <c:if test="${currentPage < totalPages}">
                                <a href="${ctx}/manager/findAllManager?page=${currentPage + 1}">下一页</a>
                                <a href="${ctx}/manager/findAllManager?page=${totalPages}">尾页</a>
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
