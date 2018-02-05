<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/taotao.css" />
	<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function add(TitleText, src) {
		if ($('#tt').tabs("exists", TitleText)) {
			$('#tt').tabs("select", TitleText)

		} else {
			var content = "<iframe scrolling='true' style='width: 100%;height: 100%' src='"
					+ src + "'></iframe>"
			$('#tt').tabs('add', {
				title : TitleText,
				content : content,
				closable : true,
				tools : [ {
					iconCls : 'icon-mini-refresh',
					handler : function() {
						alert('refresh');
					}
				} ]
			});
		}
	}
</script>
</head>
<body style="background: rgb(255,245,247)">
	<div style="width: 1300px; margin-left: 3%"><%@ include file="head.jsp"%></div>
		<br>
		<div id="cc" class="easyui-layout"
			style="width: 1300px; height: 600px; margin-left: 3%; margin-top: 0px">

			<div data-options="region:'west',title:'菜单',split:true"
				style="width: 200px">
				<div class="easyui-accordion" fit="true">
					<div title="卖家管理系统" data-options="selected:true" style="background: rgb(178,200,187)">
						<br> <a onclick="add('添加商品','com_add.jsp')"
							class="easyui-linkbutton" style="width: 100%; height: 30px; margin-top: -20px">添加商品</a>
						<br> <br> <a onclick="add('查看商品','com_list.jsp')"
							class="easyui-linkbutton" style="width: 100%; height: 30px; margin-top: -20px">查看商品</a>
					</div>
<!-- 					<div title="主页内容管理" style="padding: 10px"> -->
<!-- 						<br> <a onclick="add('轮播图','content_pic.jsp')" -->
<!-- 							class="easyui-linkbutton" style="width: 100%; height: 30px">轮播图</a> -->
<!-- 					</div> -->
				</div>

			</div>
			<div data-options="region:'center',title:'功能页面'"
				style="padding: 0px; background: #eee;">
				<div id="tt" class="easyui-tabs" fit="true" >
					<div title="Tab1" style="display: none;" >
						<span style="margin-left: 30%; margin-top: 30%; font-size: 30px;">卖家管理系统</span>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 1300px; margin-left: 3%"><%@ include
				file="foot.jsp"%></div>
</body>
</html>