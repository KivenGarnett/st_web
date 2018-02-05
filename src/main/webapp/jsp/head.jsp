<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		if ($("#user").text() != "") {

			$("#login").hide();
			$("#login1").hide();
			$("#exit").show();
		}
	});
	function tosearch() {
		$.ajax({
			url : "/st_web/search/tosearch.do",
			type : "POST",
			data : "comName=" + $("#searchInput").val(),
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				window.location.href = "/st_web/jsp/search.jsp";
			}
		});
	}
	$(document).ready(function() {
		//鼠标移入变红色  
		for(var i=0;i<7;i++){
		$("#cc").children().eq(i).mouseover(function() {
			$(this).css("color", "red");

		});
		
		$("#cc").children().eq(i).mouseout(function() {
			$(this).css("color", "black");

		});	
			
		}
		
// 		$("a").mouseover(function() {
// 			$(this).css("color", "red");

// 		});
		//鼠标移除变黑色  
// 		$("a").mouseout(function() {
// 			$(this).css("color", "black");
// 		});
	});
// 	function centre() {
// 		var userIsuser = "${user.isuser }";
// 		if (userIsuser == "0"){
// 			window.location.href = "/st_web/jsp/order_shang.jsp";
// 			return;
// 		}else if (userIsuser == "1") {
// 			window.location.href = "/st_web/jsp/order_ge.jsp";
// 			return;
// 		}else {
// 			alert("请先登陆");
// 			window.location.href = "/st_web/jsp/login.jsp";
// 		}
// 	}
	$(document).ready(function() {
		$("#centre").click(function(){
	 		var userIsuser = "${user.isuser }";
	 		if (userIsuser == "0"){
	 			window.location.href = "/st_web/jsp/order_shang.jsp";
	 			return;
	 		}else if (userIsuser == "1") {
	 			window.location.href = "/st_web/jsp/order_ge.jsp";
	 			return;
	 		}else {
	 			alert("请先登陆");
	 			window.location.href = "/st_web/jsp/login.jsp";
	 		}
		});
	})
</script>

<div class="hmtop">
	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<span id="user" style="font-size: 20px;">${user.userName }</span>
				<div class="menu-hd" id="login">
					<a href="/st_web/jsp/login.jsp" class="h">亲，请登录</a>
					/
					<a href="/st_web/jsp/register.jsp">免费注册</a>
				</div>
				<a href="/st_web/user/exit.do" class="h" id="exit" hidden="true">退出账号</a>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="/st_web/jsp/index.jsp" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng" id="centre">
<!-- 					<a href="/st_web/jsp/user.jsp" target="_top"> -->
<!-- 						<i class="am-icon-user am-icon-fw"></i> -->
						个人中心
<!-- 					</a> -->
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="/st_web/jsp/ordercar.jsp" target="_top">
						<i class="am-icon-shopping-cart  am-icon-fw"></i>
						<span>购物车</span>
					</a>
				</div>
			</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logoBig">
			<ul>
				<li>
					<a href="/st_web/jsp/index.jsp">
						<img src="<%=request.getContextPath()%>/image/LOGO.png" style="margin-top: 20px" />
					</a>
				</li>
			</ul>
		</div>
		<div class="search-bar pr">
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off" style="height: 30px">
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit" onclick="tosearch()" style="height: 30px">
			</form>
			<span id="cc"><a href="" name="" style="margin-left: 10px">保湿 &nbsp;&nbsp;&nbsp;&nbsp;|</a><a href="" style="margin-left: 15px">面膜  &nbsp;&nbsp;&nbsp;&nbsp;|</a><a href="" style="margin-left: 15px">洗面奶 &nbsp;&nbsp;&nbsp;&nbsp;|</a><a href="" style="margin-left: 15px">补水  &nbsp;&nbsp;&nbsp;&nbsp;|</a><a href="" style="margin-left: 15px">护肤套装 &nbsp;&nbsp;&nbsp;&nbsp;|</a><a href="" style="margin-left: 15px">BB霜 &nbsp;&nbsp;&nbsp;&nbsp;|</a><a href="" style="margin-left: 15px">眼霜</a></span>
		</div>
	</div>
	<div class="clear"></div>
</div>
