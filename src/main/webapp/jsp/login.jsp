<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/amazeui.css" />
<link href="<%=request.getContextPath()%>/css/dlstyle.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/icon.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$(":text").focusin(function() {
			$("#err").text("");
		});
	});
</script>
<script type="text/javascript">
	//校验数据是否为空
	function login() {
		if ($("#username").val() == "") {
			$("#err").text("请输入账号！");
			return;
		}
		if ($("#userpass").val() == "") {
			$("#err").text("请输入密码！");
			return;
		}
		if ($("#code").val() == "") {
			$("#err").text("输入验证码！");
			return;
		}
		active();
	}

	//AJAX提交数据至UserServlet
	function active() {
		var param = "/st_web/user/login.do";
		$.ajax({
			url : param,
			type : "post",
			data : "userName=" + $("#username").val() + "&userPass="
					+ $("#userpass").val() + "&code=" + $("#code").val(),
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			dataType : "text",
			success : function(data) {
				if (data == "err_code") {
					$("#err").text("验证码错误！");
				} else if (data == "ok") {
					window.location.href = "/st_web/jsp/index.jsp";
				} else if (data == "isseller") {
					window.location.href = "/st_web/jsp/order_shang.jsp";
				} else {
					$("#err").text("账号不存在！");
				}
			}
		});
	}
</script>

<body style="background: white">
<%@ include file="head.jsp"%><div class="banner">
	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span>
				<img src="<%=request.getContextPath()%>/image/tu1.png" style="position:absolute;left:50%;margin-left:-1200px;margin-top: 15px" />
			</div>
			<div class="login-box">
				<h3 class="title">登录商城</h3>
				<div class="clear"></div>
				<div class="login-form">
					<form>
						<div class="user-name">
							<label for="user">
								<i class="am-icon-user"></i>
							</label>
							<input type="text" id="username" placeholder="账号">
						</div>
						<div class="user-pass">
							<label for="password">
								<i class="am-icon-lock"></i>
							</label>
							<input type="password" id="userpass" placeholder="请输入密码">
						</div>
						<br>
						<div>

							<img alt="" class="code" src="<%=request.getContextPath()%>/ImageServlet" onclick="this.src='<%=request.getContextPath()%>/ImageServlet?'+Math.random()" />
							<input type="text" id="code" style="vertical-align: middle; padding: 20px; width: 150px;" placeholder="验证码">
							<span id="err" style="color: red;"></span>
						</div>
					</form>
				</div>
				<div class="login-links"></div>
				<div class="am-cf">
					<input onclick="login()" value="登 录" readonly="true" class="am-btn am-btn-primary am-btn-sm" type="submit">
				</div>
				<br />
				<a href="<%=request.getContextPath()%>/jsp/register.jsp" style="float: right; font-size: 10px; color: rgb(254,67,101)">没有账号？点击注册</a>
			</div>
		</div>
	</div>
	<%@ include file="foot.jsp"%>
</body>
</html>