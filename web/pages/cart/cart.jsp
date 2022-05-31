<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			$(".deleteItem").click(function () {
			return confirm("delete "+$(this).parent().parent().find("td:first").text()+"?")
			});

			$("#clear").click(function () {
				return confirm("clear cart?")
			})
			$(".updateCount").change(function () {
				var name = $(this).parent().parent().find("td:first").text();
				var count =this.value;
				var id = $(this).attr("bookId");
				if (confirm("change item "+name+" count to "+count+" ?")){
					location.href =
							"http://localhost:8081/bookstore/cartServlet?action=updateCount&count="+count+"&id="+id;
				}else {
					this.value = this.defaultValue;
				}
			})
		});

	</script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">购物车</span>
		<%@include file="/pages/common/login_success_menu.jsp"%>
	</div>
	
	<div id="main">
		<c:if test="${not empty sessionScope.cart.items}">
		<table>
			<tr>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
				<td>金额</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${sessionScope.cart.items}" var="entry">
				<tr>
					<td>${entry.value.name}</td>
					<td>
						<input bookId="${entry.value.id}" class="updateCount" style="width: 20px" type="text" name="count" value="${entry.value.count}">
					</td>
					<td>${entry.value.price}</td>
					<td>${entry.value.totalPrice}</td>
					<td><a class="deleteItem" href="/bookstore/cartServlet?action=deleteItem&id=${entry.value.id}">删除</a></td>
				</tr>
			</c:forEach>


		</table>

			<div class="cart_info">
				<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>件商品</span>
				<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
				<span class="cart_span"><a id="clear" href="/bookstore/cartServlet?action=clear">清空购物车</a></span>
				<span class="cart_span"><a href="/bookstore/orderServlet?action=createOrder">去结账</a></span>
			</div>
		</c:if>
		<c:if test="${empty sessionScope.cart.items}">
			<table>
				<tr>
					<td colspan="5"><a href="index.jsp">cart is empty,go shopping!</a></td>
				</tr>
			</table>

		</c:if>

	
	</div>
	
	<div id="bottom">
		<span>
			尚硅谷书城.Copyright &copy;2015
		</span>
	</div>
</body>
</html>