<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">

		$(function () {
			$("a.deleteClass").click(function () {
				return confirm("delete "+$(this).parent().parent().find("td:first").text()+" ?");

			})
		})




	</script>
</head>
<body>
	
	<div id="header">
			<span class="wel_word">图书管理系统</span>
		<%@include file="/pages/common/manager_menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>名称</td>
				<td>价格</td>
				<td>作者</td>
				<td>销量</td>
				<td>库存</td>
				<td colspan="2">操作</td>
			</tr>		

			

			
			<c:forEach items="${requestScope.page.items}" var="book">
				<tr>
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sales}</td>
					<td>${book.stock}</td>
					<td><a href="/bookstore/manager/bookServlet?action=getBook&id=
					${book.id}&method=update&pageNo=${requestScope.page.pageNo}">修改</a></td>
					<td><a class="deleteClass" href=
							"/bookstore/manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">
						删除</a></td>
				</tr>
			</c:forEach>
			

			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="/bookstore/pages/manager/book_edit.jsp?method=add&pageNo=${requestScope.page.pageTotal}">添加图书</a></td>
			</tr>	
		</table>
		<div id="page_nav">
			<c:if test="${requestScope.page.pageNo > 1}">
				<a href="manager/bookServlet?action=page&pageNo=1">首页</a>
				<a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageNo-1}">上一页</a>
			</c:if>
			【${requestScope.page.pageNo}】
			<c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
				<a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageNo+1}">下一页</a>
				<a href="manager/bookServlet?action=page&pageNo=${requestScope.page.pageTotal}">末页</a>
			</c:if>

			共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
			到第<input value="${param.pageNo}" name="pn" id="pn_input"/>页
			<input id="page_bt" type="button" value="confirm">
			<script type="text/javascript">
				$(function () {
					$("#page_bt").click(function () {
						var pageNo = $("#pn_input").val();
						<%--console.log(pageNo+" "+${pageScope.page.pageTotal});--%>
						<%--if (pageNo<1||pageNo>${pageScope.page.pageTotal}) return false;--%>
						location.href = "${pageScope.basePath}manager/bookServlet?action=page&pageNo="+pageNo;
					})
				})
			</script>
		</div>
	</div>
	

</body>
</html>