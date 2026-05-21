<%--
  Created by IntelliJ IDEA.
  User: lytqq
  Date: 2025/11/24
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="renderer" content="webkit">
  <title></title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/catalog">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 留言管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选本页</button>
          <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
          <input type="hidden" value="delByIds" name="type">
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">ID</th>
        <th>栏目名称</th>
        <th>栏目序号</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      <c:forEach items="${catalogsList}" var="catalog">
        <tr>
          <td><input type="checkbox" name="catalog_id[]" class="item-checkbox"  value="${catalog.catalog_id}" />
              ${catalog.catalog_id}</td>
          <td>${catalog.catalog_name}</td>
          <td>${catalog.catalog_number}</td>
          <td>${catalog.catalog_state}</td>
          <td><div class="button-group">
            <a class="button border-main"
               href="${pageContext.request.contextPath}/catalog?type=up&catalog_id=${catalog.catalog_id}&catalog_number=${catalog.catalog_number}">
                <span class="icon-edit">
                </span> 上移
            </a>
            <a class="button border-red"
               href="${pageContext.request.contextPath}/catalog?type=down&catalog_id=${catalog.catalog_id}&catalog_number=${catalog.catalog_number}">
                <span class="icon-trash-o">
                </span> 下移
            </a>
            <a class="button border-main" href="${pageContext.request.contextPath}/catalog?type=findById&id=${catalog.catalog_id}">
                <span class="icon-edit">
                </span> 修改
            </a>
              <a class="button border-red" href="javascript:void(0)" onclick="return del(${catalog.catalog_id})">
                <span class="icon-trash-o"></span> 删除
              </a>
          </div></td>
        </tr>
      </c:forEach>

      <tr>
        <td colspan="8">
          <div class="pagelist">
            <a href="${pageContext.request.contextPath}/catalog?type=findall&nowPage=1">首页</a>
            <a href="${pageContext.request.contextPath}/catalog?type=findall&nowPage=${nowPage-1}">上一页</a>
            <a href="${pageContext.request.contextPath}/catalog?type=findall&nowPage=${nowPage+1}">下一页</a>
            <a href="${pageContext.request.contextPath}/catalog?type=findall&nowPage=${maxPage}">尾页</a>
          </div>
        </td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

  function del(id){
    if(confirm("您确定要删除吗?")){
      var url = "${pageContext.request.contextPath}/catalog?type=del&id=" + id;
      alert(url)
      window.location.href = url;
    }
  }

  $("#checkall").click(function(){
    $("input[name='id[]']").each(function(){
      if (this.checked) {
        this.checked = false;
      }
      else {
        this.checked = true;
      }
    });
  })

  function DelSelect(){
    var Checkbox=false;
    $("input[name='id[]']").each(function(){
      if (this.checked==true) {
        Checkbox=true;
      }
    });
    if (Checkbox){
      var t=confirm("您确认要删除选中的内容吗？");
      if (t==true){

      }
      if (t==false) return false;
    }
    else{
      alert("请选择您要删除的内容!");
      return false;
    }
  }

  const selectAllBtn = document.getElementById('checkall');
  console.log(selectAllBtn)
  const itemCheckboxes = document.querySelectorAll('.item-checkbox');

  let isAllSelected = false;

  selectAllBtn.addEventListener('click', () => {
    isAllSelected = !isAllSelected;
    itemCheckboxes.forEach(checkbox => {
      checkbox.checked = isAllSelected;
    });
    selectAllBtn.textContent = isAllSelected ? '取消全选' : '全选本页';
  });

  itemCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
      const allChecked = Array.from(itemCheckboxes).every(item => item.checked);
      isAllSelected = allChecked;
      selectAllBtn.textContent = isAllSelected ? '取消全选' : '全选本页';
    });
  });
</script>
</body>
</html>

