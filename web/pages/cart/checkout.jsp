<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结算页面</title>
	<%@include file="/pages/common/login_success_menu.jsp"%>
	<%@include file="/pages/common/head.jsp"%>
</head>
<body>
	
	<div id="header">

			<span class="wel_word">结算</span>
		<%@include file="/pages/common/login_success_menu.jsp"%>
	</div>
	
	<div id="main">
		
		<h1>你的订单已结算，订单号为${sessionScope.orderId}</h1>
	</div>
	
	<div id="bottom">
	</div>
</body>
</html>