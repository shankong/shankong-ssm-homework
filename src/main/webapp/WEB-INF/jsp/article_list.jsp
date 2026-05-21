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
<form method="post" action="${pageContext.request.contextPath}/article">
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
        <th>管理员</th>
        <th>栏目</th>
        <th>文章标题</th>
        <th>文章内容</th>
        <th>文章序号</th>
        <th>编辑人</th>
        <th>发表时间</th>
        <th>浏览量</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      <c:forEach items="${articlesList}" var="articleInfo">
        <tr>
          <td><input type="checkbox" name="article_id[]" class="item-checkbox"  value="${articleInfo.article.article_id}" />
              ${articleInfo.article.article_id}</td>
          <td>${articleInfo.manager_name}</td>
          <td>${articleInfo.catalog_name}</td>
          <td>${articleInfo.article.article_titles}</td>
          <td>${articleInfo.article.article_content}</td>
          <td>${articleInfo.article.article_number}</td>
          <td>${articleInfo.article.article_editor}</td>
          <td>${articleInfo.article.article_date}</td>
          <td>${articleInfo.article.article_view}</td>
          <td>${articleInfo.article.article_state}</td>
          <td><div class="button-group">

            <a class="button border-main" href="${pageContext.request.contextPath}/article?type=findById&id=${catalog.catalog_id}">
                <span class="icon-edit">
                </span> 修改
            </a>
            <a class="button border-red" href="${pageContext.request.contextPath}/article?type=FalseDelete&article_id=${articleInfo.article.article_id}">
              <span class="icon-trash-o">
              </span> 删除
            </a>
            <a class="button border-main" href="" onclick="return ViewAdd(${articleInfo.article.article_id})">
                <span class="icon-edit">
                </span> 浏览
            </a>
          </div></td>
        </tr>
      </c:forEach>

      <tr>
        <td colspan="8">
          <div class="pagelist">
            <a href="${pageContext.request.contextPath}/article?type=findall">首页</a>
            <a href="${pageContext.request.contextPath}/article?type=findall">上一页</a>
            <a href="${pageContext.request.contextPath}/article?type=findall">下一页</a>
            <a href="${pageContext.request.contextPath}/article?type=findall">尾页</a>
          </div>
        </td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

  function del(id){
    if(confirm("您确定要删除吗?")){
      var url = "${pageContext.request.contextPath}/article?type=del&id=" + id;
      alert(url)
      window.location.href = url;
    }
  }
  function ViewAdd(id) {
    alert("哈哈哈哈！\n该文章啥也没有，傻眼了吧！Σ(￣ロ￣lll)\n浏览量又又又又+1咯~")
      var url = "${pageContext.request.contextPath}/article?type=ViewAdd&article_id=" + id;
      // alert(url)
      window.location.href = url;

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

