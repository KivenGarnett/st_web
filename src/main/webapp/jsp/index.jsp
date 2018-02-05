<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>靓淘首页</title>
<link href="<%=request.getContextPath()%>/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=request.getContextPath()%>/css/hmstyle.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/skin.css" rel="stylesheet"
	type="text/css" />
<link href="<%=request.getContextPath()%>/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/amazeui.min.js"></script>
</head>
<script type="text/javascript">
    // 页面加载数据
	$(function() {
		<!--侧边导航 -->
		getData();
		getData1();
		getData2();		
	});
    
	
	var param = "/st_web/com_cla/cla.do";
	function getData() {
		$.ajax({
			url : param,
			type : "POST",
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				oneCla(data);
			}
		});
	}

	
// 	侧边导航 
	function oneCla(data) {
		var len = data.rows.length;
		var rows = data.rows;
		for (var i = 0; i < len; i++) {
			var row = rows[i];
			var code = row.code;
			var parCode = row.parCode;
			if (parCode == "0") {
				guide(data, row, code);
			}
		}
	}

	function guide(data, row, code) {
		var rows = data.rows;
		var len = data.rows.length;
		var ss = "";
		for (var i = 0; i < len; i++) {
			var row2 = rows[i];
			var parCode = row2.parCode;
			var code2 = row2.code;
			var title2 = row2.claName;
			if (parCode == code) {
				ss += "<dd><a href='/st_web/search/clashow.do?claName="+row2.claName+"'><span>" + title2
						+ "</span></a></dd>"
			}
		}
		var title = row.claName;
		var s1 = '<li id="'+code+'"class="appliance js_toggle relative"> <div class="category-info"> <h3 class="category-name b-category-name">';

		var s2 = " <a class='ml-22' title='"+code+"'>" + title + "</a> ";

		var s3 = " </h3> <em>&gt;</em> </div> <div class='menu-item menu-in top'> <div class='area-in'> <div class='area-bg'> <div class='menu-srot'> <div class='sort-side'> <dl class='dl-sort'> "

		var s4 = "<dd> <a title='' href='#'> <span>" + title
				+ "</span> </a> </dd>";

		var s5 = "</dl> </div> <div class='brand-side'> <dl class='dl-sort'>"
				+ ss + "</dl>"

		var s6 = "</div> </div> </div> </div> </div> <b class='arrow'></b></li><br>";

		var s = s1 + s2 + s3 + s4 + s5 + s6;
		$("#js_climit_li").append(s);
		$("li").hover(
				function() {
					$(".category-content .category-list li.first .menu-in")
							.css("display", "none");
					$(".category-content .category-list li.first").removeClass(
							"hover");
					$(this).addClass("hover");
					$(this).children("div.menu-in").css("display", "block")
				}, function() {
					$(this).removeClass("hover")
					$(this).children("div.menu-in").css("display", "none")
				});
		$("#js_climit_li").trigger("create");
	}
	
// 	今日推荐 
	function getData1() {
	  var param= "/st_web/show/today.do";
		$.ajax({
			url : param,
			type : "POST",
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				today(data);
			}
		});
	}
	function today(data) {
		var len = data.rows.length;
		var rows = data.rows;
		for (var i = 0; i < len; i++) {
		var row = rows[i];
		$("#today").children().eq(i+1).children().eq(0).children().eq(0).text(row.comName);
		$("#today").children().eq(i+1).children().eq(1).children().eq(0).attr("href","/st_web/show/introduction.do?comCode="+row.comCode);
		$("#today").children().eq(i+1).children().eq(1).children().eq(0).children().attr("src",row.urla);
		}
	}
		
  // 	页面展示分类
	function getData2() {
			$.ajax({
				url : "/st_web/show/comshow.do",
				type : "POST",
				dataType : "json",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
				success : function(data) {
					show(data);
				}
			});	
	}
  function show(data) {
	  var len = data.rows.length;
		var rows = data.rows;	
		for (var i = 0; i < len; i++) {
			var row=rows[i]
	       $("#com"+i).children().eq(0).children().eq(0).text(row.comName);
	       $("#com"+i).children().eq(0).children().eq(1).text(row.comPrice);
	       $("#com"+i).children().eq(1).attr("href","/st_web/show/introduction.do?comCode="+row.comCode);
	       $("#com"+i).children().eq(1).children().eq(0).attr("src",row.urla);
		} 
}
</script>
<body>

	<%@ include file="head.jsp"%><div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="detail.jsp"> <img
						src="<%=request.getContextPath()%>/image/tu11.png"
						style="width: 120%; height: 120%; position: absolute; left: 50%; margin-left: -675px;" />
				</a></li>
				<li class="banner2"><a href="detail.jsp"> <img
						src="<%=request.getContextPath()%>/image/tu10.png"
						style="width: 120%; height: 120%; position: absolute; left: 50%; margin-left: -675px;" />
				</a></li>
				<li class="banner3"><a href="detail.jsp"> <img
						src="<%=request.getContextPath()%>/image/tu9.png"
						style="width: 120%; height: 120%; position: absolute; left: 50%; margin-left: -675px;" />
				</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">
			<div class="long-title">
				<span class="all-goods">主题市场</span>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">
							</ul>
						</div>
					</div>

				</div>
			</div>

			<!--广告区-->
			<div class="marqueen" style="margin-right: -5%">
				<span class="marqueen-title">&nbsp;&nbsp;公告&nbsp;&nbsp;：</span>
				<div class="demo">
					<ul>
						<li class="title-first"><a target="_blank" href="#"> <span>冬款新品上市</span>
						</a></li>
						<li class="title-first"><a target="_blank" href="#"> <span>全场8折促销中</span>
						</a></li>

						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="/st_web/jsp/index.jsp"> 
								<img src="<%=request.getContextPath()%>/image/109.png">
								</a> 
								<em> 
								Hi, <span class="s-name">你好：${user.userName }</span>
								</em>
							</div>
							<div class="member-logout" id="login1">
								<a class="am-btn-warning btn" href="/st_web/jsp/login.jsp">登录</a>
								<a class="am-btn-warning btn" href="/st_web/jsp/register.jsp">注册</a>
							</div>
							<div class="clear"></div>
						</div>

						<li><a target="_blank" href="#"> <span>[头条]</span>
								今年超流行的几款眉毛
						</a></li>
						<li><a target="_blank" href="#"> <span>[论坛]</span>
								你无法抗拒的圣诞系列
						</a></li>
						<li><a target="_blank" href="#"> <span>[直播]</span>
								最潮女装搭配！
						</a></li>
						<li><a target="_blank" href="#"> <span>[规则]</span>
								出售假冒商品规则变更
						</a></li>
						<li><a target="_blank" href="#"> <span>[安全]</span>
								卖家注意：风险通报！
						</a></li>
						<li><a target="_blank" href="#"> <span>[公益]</span>
								公益宝贝卖家准入公告
						</a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--菜单 -->
<!-- 	<div class=tip> -->
<!-- 		<div id="sidebar"> -->
<!-- 			<div id="wrap"> -->
<!-- 				<div id="prof" class="item "> -->
<!-- 					<a href="# "> <span class="setting "></span> -->
<!-- 					</a> -->
<!-- 					<div class="ibar_login_box status_login "> -->
<!-- 						<div class="avatar_box "> -->
<!-- 							<p class="avatar_imgbox "> -->
<!-- 								<img src="../images/no-img_mid_.jpg " /> -->
<!-- 							</p> -->
<!-- 							<ul class="user_info "> -->
<!-- 								<li>用户名sl1903</li> -->
<!-- 								<li>级&nbsp;别普通会员</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="login_btnbox "> -->
<!-- 							<a href="# " class="login_order ">我的订单</a> <a href="# " -->
<!-- 								class="login_favorite ">我的收藏</a> -->
<!-- 						</div> -->
<!-- 						<i class="icon_arrow_white "></i> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 				<div id="shopCart " class="item "> -->
<!-- 					<a href="# "> <span class="message "></span> -->
<!-- 					</a> -->
<!-- 					<p>购物车</p> -->
<!-- 					<p class="cart_num ">0</p> -->
<!-- 				</div> -->
<!-- 				<div id="asset " class="item "> -->
<!-- 					<a href="# "> <span class="view "></span> -->
<!-- 					</a> -->
<!-- 					<div class="mp_tooltip "> -->
<!-- 						我的资产 <i class="icon_arrow_right_black "></i> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div id="foot " class="item "> -->
<!-- 					<a href="# "> <span class="zuji "></span> -->
<!-- 					</a> -->
<!-- 					<div class="mp_tooltip "> -->
<!-- 						我的足迹 <i class="icon_arrow_right_black "></i> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div id="brand " class="item "> -->
<!-- 					<a href="#"> <span class="wdsc "> <img -->
<!-- 							src="../images/wdsc.png " /> -->
<!-- 					</span> -->
<!-- 					</a> -->
<!-- 					<div class="mp_tooltip "> -->
<!-- 						我的收藏 <i class="icon_arrow_right_black "></i> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div id="broadcast " class="item "> -->
<!-- 					<a href="# "> <span class="chongzhi "> <img -->
<!-- 							src="../images/chongzhi.png " /> -->
<!-- 					</span> -->
<!-- 					</a> -->
<!-- 					<div class="mp_tooltip "> -->
<!-- 						我要充值 <i class="icon_arrow_right_black "></i> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="quick_toggle "> -->
<!-- 					<li class="qtitem "><a href="# "> <span class="kfzx "></span> -->
<!-- 					</a> -->
<!-- 						<div class="mp_tooltip "> -->
<!-- 							客服中心 <i class="icon_arrow_right_black "></i> -->
<!-- 						</div></li> -->
<!-- 					<li class="qtitem "><a href="#top " class="return_top "> <span -->
<!-- 							class="top "></span> -->
<!-- 					</a></li> -->
<!-- 				</div> -->

<!-- 				回到顶部 -->
<!-- 				<div id="quick_links_pop " class="quick_links_pop hide "></div> -->

<!-- 			</div> -->

<!-- 		</div> -->
<!-- 		<div id="prof-content " class="nav-content "> -->
<!-- 			<div class="nav-con-close "> -->
<!-- 				<i class="am-icon-angle-right am-icon-fw "></i> -->
<!-- 			</div> -->
<!-- 			<div>我</div> -->
<!-- 		</div> -->
<!-- 		<div id="shopCart-content " class="nav-content "> -->
<!-- 			<div class="nav-con-close "> -->
<!-- 				<i class="am-icon-angle-right am-icon-fw "></i> -->
<!-- 			</div> -->
<!-- 			<div>购物车</div> -->
<!-- 		</div> -->
<!-- 		<div id="asset-content " class="nav-content "> -->
<!-- 			<div class="nav-con-close "> -->
<!-- 				<i class="am-icon-angle-right am-icon-fw "></i> -->
<!-- 			</div> -->
<!-- 			<div>资产</div> -->

<!-- 			<div class="ia-head-list "> -->
<!-- 				<a href="# " target="_blank " class="pl "> -->
<!-- 					<div class="num ">0</div> -->
<!-- 					<div class="text ">优惠券</div> -->
<!-- 				</a> <a href="# " target="_blank " class="pl "> -->
<!-- 					<div class="num ">0</div> -->
<!-- 					<div class="text ">红包</div> -->
<!-- 				</a> <a href="# " target="_blank " class="pl money "> -->
<!-- 					<div class="num ">￥0</div> -->
<!-- 					<div class="text ">余额</div> -->
<!-- 				</a> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 		<div id="foot-content " class="nav-content "> -->
<!-- 			<div class="nav-con-close "> -->
<!-- 				<i class="am-icon-angle-right am-icon-fw "></i> -->
<!-- 			</div> -->
<!-- 			<div>足迹</div> -->
<!-- 		</div> -->
<!-- 		<div id="brand-content " class="nav-content "> -->
<!-- 			<div class="nav-con-close "> -->
<!-- 				<i class="am-icon-angle-right am-icon-fw "></i> -->
<!-- 			</div> -->
<!-- 			<div>收藏</div> -->
<!-- 		</div> -->
<!-- 		<div id="broadcast-content " class="nav-content "> -->
<!-- 			<div class="nav-con-close "> -->
<!-- 				<i class="am-icon-angle-right am-icon-fw "></i> -->
<!-- 			</div> -->
<!-- 			<div>充值</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!--选择区-->
<div class="bg-xuanze">
	<div class="pinpai">
		<ul>
    		<li><a class="tuijianpinpai" href="">推荐品牌</a></li>
       	 	<li><a href="">独家品牌</a></li>
       		 <li><a href="">欧美品牌</a></li>
        	<li><a href="">国货品牌</a></li>
    	</ul>
    </div>
</div>
	<!-- 	商品展览 -->

	<div class="jutituijian">
		<div class="tuijiantu">
			<img src="../image/41.png">
		</div>
		<div class="gezhongshangbiao">
			<div class="p1">
				<p>美加净</p>
			</div>
			<div class="p2">
				<p>李医生</p>
			</div>
			<div class="p3">
				<p>自然堂</p>
			</div>
			<div class="p4">
				<p>佳洁士</p>
			</div>
			<div class="p5">
				<p>镖旗男装</p>
			</div>
			<div class="p6">
				<p>艺元素</p>
			</div>
			<div class="p7">
				<p>泊美</p>
			</div>
			<div class="p8">
				<p>赤道</p>
			</div>
			<div class="p9">
				<p>欧珀雅</p>
			</div>
			<div class="p10">
				<p>玉兰油</p>
			</div>
			<div class="p11">
				<p>丁家宜</p>
			</div>
			<div class="p12">
				<p>露得清</p>
			</div>
			<div class="p13">
				<p>宝洁</p>
			</div>
			<div class="p14">
				<p>波斯兰迪</p>
			</div>
			<div class="p15">
				<p>水芝澳</p>
			</div>
			<div class="p16">
				<p>傲慢季节</p>
			</div>
			<div class="p17">
				<p>丹菲诗</p>
			</div>
			<div class="p18">
				<p>奥利斯</p>
			</div>
		</div>
	</div>
	<!--保险区-->
	<div class="baoxian" style="margin-left: 300px;">
		<div class="pinzhi">
			<h2>品质保障</h2>
			<h3>品质护航 购物无忧</h3>
		</div>
		<div class="tese">
			<h2>特色服务体验</h2>
			<h3>为您呈现不一样的服务</h3>
		</div>
		<div class="bangzhu">
			<h2>帮助中心</h2>
			<h3>您的购物指南</h3>
		</div>
		<div class="qitian">
			<h2>七天无理由退换货</h2>
			<h3>为您提供售后无忧保障</h3>
		</div>
	</div>
	<!--扫描区-->
	<div class="saomiao">
		<div class="gouwuzhinan">
			<h3>购物指南</h3>
			<p>免费注册</p>
			<p>开通支付宝</p>
			<p>支付宝充值</p>
		</div>
		<div class="pinzhibaozhang">
			<h3>品质保障</h3>
			<p>发票保障</p>
			<p>售后规则</p>
			<p>缺贷赔付</p>
		</div>
		<div class="zhifufangshi">
			<h3>支付方式</h3>
			<p>快捷支付</p>
			<p>信用卡</p>
			<p>货到付款</p>
		</div>
		<div class="shangjiafuwu">
			<h3>商家服务</h3>
			<p>商家入驻</p>
			<p>商家中心</p>
			<p>运营服务</p>
		</div>
		<div class="shoujilaingtao">
			<h3>手机靓淘</h3>
			<img src="../image/98.png" style="height: 80%; width: 80%">
		</div>
	</div>
	<%@ include file="foot.jsp"%>
	</div>
	</div>
	</div>
</body>
</html>