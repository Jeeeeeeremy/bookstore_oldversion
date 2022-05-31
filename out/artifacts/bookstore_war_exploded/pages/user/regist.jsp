<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="/pages/common/head.jsp"%>
	<script>
	//页面加载完成后
	$(function () {
		//给注册按钮绑定单机事件
	$("#sub_btn").click(function () {
		// 验证用户名:必须由字母，数字下划线组成，并且长度为 5 到 12 位

		//获取内容 正则表达匹配
		var usernameText = $("#username").val();
		var usernamePatt = /^\w{5,12}$/;
		if(!usernamePatt.test(usernameText)){
		$(".errorMsg").text("invalid username");
		return false;
		}

		// 验证密码:必须由字母，数字下划线组成，并且长度为 5 到 12 位

		var passwordText = $("#password").val();
		var passwordPatt = /^\w{5,12}$/;
		if(!passwordPatt.test(passwordText)){
			$(".errorMsg").text("invalid password");
			return false;
		}

		// 验证确认密码:和密码相同
		var repwdText = $("#repwd").val();
		if (repwdText!=passwordText){
			$(".errorMsg").text("passwords not matched!");
			return  false;
		}

		// 邮箱验证:xxxxx@xxx.com

		var emailText = $("#email").val();
		var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;

		if(!emailPatt.test(emailText)) {
			$(".errorMsg").text("email address is invalid!");
			return false;
		}

		// 验证码:现在只需要验证用户已输入。因为还没讲到服务器。验证码生成。

		var codeText = $.trim(("#code").val());
		if(codeText == null||codeText == ""){
			$(".errorMsg").text("auth code invalid");
			return false;
		}
		$(".errorMsg").text("");

	})

		//切换验证码
		$("#code_image").click(function () {
			this.src = "${basePath}kaptcha.jpg?d="+new Date();
		});
	})


	</script>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
	
</style>
</head>
<body>
		<div id="login_header"></div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">welcome to join us</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>join us now!</h1>
								<span class="errorMsg">
									<%=request.getAttribute("msg")==null ? "请输入用户名和密码!":request.getAttribute("msg")%>
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" value="regist" name="action" />
									<label>username：</label>
									<input class="itxt" type="text" placeholder="username" autocomplete="off"
										   value="<%=request.getAttribute("username")==null ? "":request.getAttribute("username")%>"
										   tabindex="1" name="username" id="username" />
									<br />
									<br />
									<label>password ：</label>
									<input class="itxt" type="password" placeholder="password" autocomplete="off"
										   tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>re-password：</label>
									<input class="itxt" type="password" placeholder="re-enter password" autocomplete="off"
										   tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>email：</label>
									<input class="itxt" type="text" placeholder="email address" autocomplete="off"
										   value="<%=request.getAttribute("email")==null ? "":request.getAttribute("email")%>"
										   tabindex="1" name="email" id="email" />
									<br />
									<br />
									<label>auth code：</label>
									<input  class="itxt" name="code" type="text" style=" width: 80px;" id="code"/>
									<img id="code_image" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px; width: 120px; height: 30px">
									<br />
									<br />
									<input type="submit" value="register" id="sub_btn" />
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
</body>
</html>