<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果</title>
<link href="<%=request.getContextPath()%>/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/seastyle.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/amazeui.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		search(1, 8);
	});
	function search(pageNumber, pageSize) {
		var comName = '${comName}';
		$.ajax({
			url : "/st_web/search/bycomName.do",
			type : "POST",
			data : "comName=" + comName + "&page=" + pageNumber + "&rows="
					+ pageSize,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
			success : function(data) {
				show(data, pageNumber, pageSize);
			}
		});
	}

	function show(data, pageNumber, pageSize) {
		var s = "";
		var len = data.rows.length;
		var rows = data.rows;
		var total = data.total;
		$("#num").text(total);
		for (var i = 0; i < len; i++) {
			var row = rows[i]
			var code = row.comCode;
			var s1 = '<li> <div class="i-pic limit"><a href="/st_web/search/show.do?comCode='
					+ code + '"><img src="'+row.urla+'"/></a>';
			var s2 = '<p class="title fl">' + row.comName
					+ '</p><p class="title fl">' + row.comDescr + '</p>';
			var s3 = '<p class="price fl"><b>¥</b><strong>' + row.comPrice
					+ '</strong></p>';
			var s4 = '<p class="number fl"><span>热卖中</span></p></div></li>';
			s += s1 + s2 + s3 + s4;
		}
		var last = Math.ceil(total / pageSize);
		s += "<div class='clear'></div><ul class='am-pagination am-pagination-right' ><li><a href = 'javascript:search(1,8)' >首页</a>&nbsp</li>";
		s += "<li><a href='javascript:search("
				+ (pageNumber == 1 ? 1 : pageNumber - 1)
				+ ",8)' >上一页</a>&nbsp;</li>";
		s += "<li><a href='javascript:search("
				+ (pageNumber == last ? last : pageNumber + 1)
				+ ",8)' >下一页</a>&nbsp;</li>";
		s += "<li><a href='javascript:search(" + last
				+ ",8)' >末页</a>&nbsp;</li>";
		s += "第<span id='pageNumber'>" + pageNumber + "</span>页/共" + last
				+ "页</ul>";
		$("#show").html(s);
	}
</script>
<body>
	<%@ include file="head.jsp"%><div class="banner">
		<!-- 	搜索页 -->

		<div class="search">
			<div class="search-list">
				<div class="nav-table">
					<div class="long-title" style="float: left;">
						<a href="/st_web/jsp/index.jsp">
							<span class="all-goods">回到首页</span>
						</a>
					</div>
				</div>
				<div class="am-g am-g-fixed">
					<div class="am-u-sm-12 am-u-md-12">
						<div class="theme-popover">
							<div class="searchAbout">
								<span class="font-pale">相关搜索：</span>
							</div>
							<ul class="select">
								<p class="title font-normal">
									<span class="fl">${comName }</span>
									<span class="total fl">
										搜索到
										<strong class="num" id="num"></strong>
										件相关商品
									</span>
								</p>
								<div class="clear"></div>
								<div class="clear"></div>
							</ul>
							<div class="clear"></div>
						</div>
						<div class="search-content" style="margin-left: 140px;">
							<div class="clear"></div>
							<ul class="am-avg-sm-4 am-avg-md-3 am-avg-lg-4 boxes" id="show">

							</ul>
						</div>
						<!--分页 -->
					</div>
				</div>
				<%@ include file="foot.jsp"%>
			</div>
		</div>
</body>
</html>