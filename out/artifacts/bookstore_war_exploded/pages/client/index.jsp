<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page</title>

<%--	 静态包含 base标签、css样式、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$(".addToCart").click(function () {
				var bookId = $(this).attr("bookId");
				location.href = "http://localhost:8081/bookstore/cartServlet?action=addItem&id=" + bookId;
			})
		})
	</script>

</head>
<body>
	
	<div id="header">
			<span class="wel_word">online bookstore</span>
			<div>
<%--未登录				--%>
				<c:if test="${empty sessionScope.user}">
				<a href="pages/user/login.jsp">登录</a> |
				<a href="pages/user/regist.jsp">注册</a> &nbsp;&nbsp;
				<a href="pages/cart/cart.jsp">购物车</a>
				<a href="pages/manager/manager.jsp">后台管理</a>
				</c:if>

				<c:if test="${not empty sessionScope.user}">
					<%@ include file="/pages/common/login_success_menu.jsp"%>
				</c:if>
			</div>
	</div>

	<div id="main">
		<div id="book">
			<div class="book_cond">

			</div>
			<div style="text-align: center">
				<c:if test="${empty sessionScope.cart.items}">

					<span>cart is empty</span>

				</c:if>

				<c:if test="${not empty sessionScope.cart.items}">

					<span>您的购物车中有${sessionScope.cart.totalCount}件商品</span>
					<div>
						您刚刚将<span style="color: red">${sessionScope.lastName}</span>加入到了购物车中
					</div>

				</c:if>

			</div>
			<c:forEach items="${requestScope.page.items}" var="book">
			<div class="b_list">
				<div class="img_div">
					<img class="book_img" alt="" src="${book.imgPath}" />
				</div>
				<div class="book_info">
					<div class="book_name">
						<span class="sp1">name:</span>
						<span class="sp2">${book.name}</span>
					</div>
					<div class="book_author">
						<span class="sp1">author:</span>
						<span class="sp2">${book.author}</span>
					</div>
					<div class="book_price">
						<span class="sp1">price:</span>
						<span class="sp2">${book.price}</span>
					</div>
					<div class="book_sales">
						<span class="sp1">sales:</span>
						<span class="sp2">${book.sales}</span>
					</div>
					<div class="book_amount">
						<span class="sp1">stock:</span>
						<span class="sp2">${book.stock}</span>
					</div>
					<div class="book_add">
						<button bookId="${book.id}" class="addToCart">add into cart</button>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>

		<%@include file="/pages/common/page_nav.jsp"%>
	
	</div>

</body>
</html>