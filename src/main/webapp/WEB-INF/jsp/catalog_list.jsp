<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>栏目列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<body class="manager-list-page">

<form method="post" action="${pageContext.request.contextPath}/catalog" id="batchForm">
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
                            <td>${status.count + (currentPage - 1) * 5}</td>
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

<script>
(function() {
    var form = document.getElementById('batchForm');
    var checkallBtn = document.getElementById('checkallBtn');
    var batchDelBtn = document.getElementById('batchDelBtn');
    var itemCheckboxes = document.querySelectorAll('.item-checkbox');
    if (!form || !checkallBtn || !batchDelBtn || itemCheckboxes.length === 0) return;

    var isAllSelected = false;

    function updateBtnText() {
        checkallBtn.innerHTML = isAllSelected
            ? '<span class="icon-check"></span> 取消全选'
            : '<span class="icon-check"></span> 全选本页';
    }

    function updateAllState() {
        var allChecked = true;
        for (var i = 0; i < itemCheckboxes.length; i++) {
            if (!itemCheckboxes[i].checked) {
                allChecked = false;
                break;
            }
        }
        isAllSelected = allChecked;
        updateBtnText();
    }

    checkallBtn.addEventListener('click', function() {
        isAllSelected = !isAllSelected;
        for (var i = 0; i < itemCheckboxes.length; i++) {
            itemCheckboxes[i].checked = isAllSelected;
        }
        updateBtnText();
    });

    for (var i = 0; i < itemCheckboxes.length; i++) {
        itemCheckboxes[i].addEventListener('change', updateAllState);
    }

    batchDelBtn.addEventListener('click', function() {
        var checked = document.querySelectorAll('.item-checkbox:checked');
        if (checked.length === 0) {
            alert('请选择您要删除的内容！');
            return;
        }
        if (confirm('您确认要删除选中的' + checked.length + '条内容吗？')) {
            form.submit();
        }
    });
})();

/* 单条删除 — 事件委托 */
document.addEventListener('click', function(e) {
    var btn = e.target.closest('.js-delete-btn');
    if (!btn) return;
    e.preventDefault();
    var id = btn.getAttribute('data-id');
    if (id && confirm('您确定要删除吗？')) {
        window.location.href = getContextPath() + '/catalog/deleteCatalog?id=' + id + '&page=${currentPage}';
    }
});

function getContextPath() {
    var path = window.location.pathname;
    var ctx = path.substring(0, path.indexOf('/', 1));
    return ctx || '';
}
</script>

</body>
</html>
