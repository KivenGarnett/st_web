<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
<link href="<%=request.getContextPath()%>/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/orstyle.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/systyle.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		var userId = "${user.id }";
		if (userId == "") {
			alert("请先登陆");
			window.location.href = "<%=request.getContextPath()%>/jsp/login.jsp";
			return;
		}
		getData();
	});
	
	function getData() {
		var param = "<%=request.getContextPath()%>/order/userorder.do";
		$.ajax({
			url : param,
			type : "POST",
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				show(data);
			}
		});
	}
	function show(data) {
		var len1 = data.code.length;
		var len2 = data.rows.length;
		var codes = data.code;
		var rows = data.rows;
		var s = "";
		for (var i = 0; i < len1; i++) {
			var ss1 = '<div style="border:3px solid  #eeeeee"><div class="order-status5" ><div class="order-title"><div class="dd-num">订单编号：<span>'
				+ codes[i].orderCode
				+ '</span></div><span>成交时间：'
				+ codes[i].createTime + '</span><div class="am-btn am-btn-danger anniu" style="float: right;" onclick="deleteit('+codes[i].id+')">删除订单</div></div>';
			var ss2=""
			for (var j = 0; j < len2; j++) {
				if(codes[i].orderCode==rows[j].orderCode){
				    var s1='<div class="order-content"><div class="order-left"><ul class="item-list"><li class="td td-item"><div><a href="/st_web/show/introduction.do?id='+ rows[j].comId+'"><img src="'+rows[j].com.urla+'" style="width: 70px; height: 70px; float: left;"></a></div>';
				    var s2 = '<div class="item-info"><div class="item-basic-info"><p>'+rows[j].com.comName+'</p></div></div></li><li class="td td-price"><div class="item-price">x'+rows[j].comNum+'</div></li>';
				    var s3 = '<li class="td td-number"><div class="item-number"><span>￥'+rows[j].comPrice.toFixed(2)+'</span>'
						+ '</div></li><li class="td td-operation"><span></span></li><div style="float: right;margin-right: 100px;"><br><a href="/st_web/order/showmes.do?id='+rows[j].id+'&addressId='+codes[i].addressId+'" style="margin-right: 50px;">查看详情</a>';
				    var s4 = '</div></ul></div></div></div>';
				    ss2+=s1+s2+s3+s4;
				}
			}
			s+=ss1+ss2+"</div></div></div><br>";
		}
		$("#order").html(s);
	}
	function deleteit(id) {
		var r=confirm("确认删除该订单？")
		  if (r==false)
		    {
		    return;
		    }
		var param = "<%=request.getContextPath()%>/order/deleteit.do";
		$.ajax({
			url : param,
			type : "POST",
			data : "id=" + id,
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				getData();
			}
		});
	}
	function editName() {
		$("#edit").prop("hidden",$("#edit").prop("hidden")?false:true);
		$("#ok").prop("hidden",$("#ok").prop("hidden")?false:true);
		$("#newname").prop("value",$("#userName").text());
	}
	
	function updateName() {
		var newname=$("#newname").val();
		if(newname==""){
			editName();
			return;
		}
		var param = "<%=request.getContextPath()%>/user/updateName.do";
		$.ajax({
			url : param,
			type : "POST",
			data : "newName=" + newname,
			dataType : "text",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				if (data == "ok") {
					$("#userName").text($("#newname").val());
					$("#user").text($("#newname").val());
					editName();
				}
			}
		});
	}
</script>
<body style="background-color: rgb(249,205,173)">
	<%@ include file="head.jsp"%><div class="banner">
		<div class="banner">
			<div class="col-main">
				<div class="main-wrap">
					<div class="wrap-left">
						<div class="wrap-list">
							<!--订单 -->
							<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

								<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
									<li class="am-active">
										<a href="#tab1">所有订单</a>
									</li>
								</ul>
								<div class="am-tabs-bd">
									<div class="am-tab-panel am-fade am-in am-active" id="tab1">
<!--  										<div class="order-top"> -->
<!-- 											<div class="th th-item"> -->
<!-- 												<td class="td-inner">订单</td> -->
<!-- 											</div> -->
<!-- 											<div class="th th-number"> -->
<!-- 												<td class="td-inner"><span style="margin-left: 21px;">数量</span></td> -->
<!-- 											</div> -->
<!-- 											<div class="th th-price"> -->
<!-- 												<td class="td-inner"><span style="margin-left: 60px;">合计</span></td> -->
<!-- 											</div> -->
<!-- 											<div class="th th-amount"> -->
<!-- 												<td class="td-inner"><span style="margin-left: 40px;">收货人</span></td> -->
<!-- 											</div> -->
<!-- 											<br> -->
<!-- 											<br> -->
<!-- 										</div> -->
<!-- 									<div style="font-size: 20px"> -->
<!-- 										<div style="margin-left: 10px;display: inline;">订单</div> -->
<!-- 										<div style="margin-left: 10px;display: inline;">数量</div> -->
<!-- 										<div style="margin-left: 10px;display: inline;">合计</div> -->
<!-- 										<div style="margin-left: 10px;display: inline;">收货人</div> -->
<!-- 										<br> -->
<!-- 										<br> -->
<!-- 									</div> -->
										<div class="order-main">
											<div class="order-list" id="order">
											</div>
										</div>
										<br>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
				<!--底部-->
				<%@ include file="foot.jsp"%>

			</div>
			<%@ include file="meau_ge.jsp"%>
		</div>
		<!--引导 -->
	</div>
</body>

</html>