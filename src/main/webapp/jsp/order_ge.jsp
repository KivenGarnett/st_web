<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/orstyle.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/amazeui.min.js"></script>
<script type="text/javascript">
	$(function() {
		getadd();
		getData();

	});
	function getadd() {
		var param = "/st_web/address/show.do";
		$.ajax({
			url : param,
			type : "POST",
			// 			data : "order=" + "${order}",
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				showadderss(data);
			}
		});
	}
	function showadderss(data) {
		var len = data.rows.length;
		var rows = data.rows;
		var s = "";
		var prices = 0;
		for (var i = 0; i < len; i++) {
			var row = rows[i];
			var s1 = '<li class="user-addresslist" onclick="checkaddress('
					+ row.id
					+ ')"><input type="radio" hidden id="addressId'+row.id+'" value="'+row.id+'" name="addressId"><span class="new-option-r"><i class="am-icon-check-circle"></i>选择地址</span>';
			var s2 = '<span class="new-txt">收件人:&nbsp;' + row.userName
					+ '<br></span><span class="new-txt-rd2">159****1622</span>';
			var s3 = '<div class="new-mu_l2a new-p-re"><p class="new-mu_l2cw"><span class="title">地址：</span>';
			var s4 = '<span class="province">' + row.userSheng
					+ '</span><span class="city">' + row.userShi
					+ '</span><span class="dist">' + row.userQu + '</span>';
			var s5 = '<br><span class="street">' + row.userAddress
					+ '</span></p></div>';
			var s6 = '<div class="new-addr-btn"><a href="#"><i class="am-icon-edit"></i>编辑</a><span class="new-addr-bar">|</span><a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a></div></li>';
			s += s1 + s2 + s3 + s4 + s5 + s6;
		}
		$("#address").html(s);

	}
	function checkaddress(addressid) {
		var radio = $("#addressId" + addressid);
		radio.prop("checked", radio.is(":checked") ? false : true);
		$(":radio").each(function() {
			if ($(this).is(":checked")) {
				$(this).parent().css("background", "#DDDDDD");
			} else {
				$(this).parent().css("background", "white");
			}
		})
	}

	function getData() {
		var param = "/st_web/order/show.do";
		$.ajax({
			url : param,
			type : "POST",
			data : "order=" + "${order}",
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
		var s = "";
		var prices = 0;
		for (var i = 0; i < len; i++) {
			var row = rows[i];
			var price = row.sellnum * row.comPrice;
			prices += price;
			var s1 = '<div class="order-status5"><div class="order-title"><div class="dd-num">订单编号：<span>'
					+ row.id
					+ '</span></div><span>成交时间：'
					+ row.updateTime
					+ '</span>';
			var s2 = '</div><div class="order-content"><div class="order-left"><ul class="item-list"><li class="td td-item"><div class="item-pic"><a href="#" class="J_MakePoint"><img src="'+row.urla+'" class="itempic J_ItemImg"></a></div>';
			var s3 = '<div class="item-info"><div class="item-basic-info"><p>'
					+ row.comDescr
					+ '</p><p class="info-little"><br/></p></div></div></li><li class="td td-price"><div class="item-price">￥'
					+ row.comPrice + '</div></li>';
			var s4 = '<li class="td td-number"><div class="item-number"><span>×</span>'
					+ row.sellnum
					+ '</div></li></div><div class="order-right"><li class="td td-amount"><div class="item-amount">共  :<br>￥'
					+ price + ' 元</div></li></ul></div></div></div>';
			s += s1 + s2 + s3 + s4;
		}
		$("#order").html(s);
		$("#prices").text(prices);
	}
</script>
</head>
<body style="background-color: rgb(249,205,173)">
	<%@ include file="head.jsp"%>
	<b class="line"></b>
	<div class="center">
		<div class="col-main" style="height: 440px">
			<div class="main-wrap">
				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg"></strong>
					</div>
				</div>
				<hr />
			</div>
		</div>
		<%@ include file="meau_ge.jsp"%>
	</div>
	<div style="margin-top: 30px"><%@ include file="foot.jsp"%></div>
</body>
</html>