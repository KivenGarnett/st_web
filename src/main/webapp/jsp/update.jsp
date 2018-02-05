<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/orstyle.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/addstyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/icon.css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$('#win').window({
			title : '修改商品',
			width : 800,
			height : 520,
			closed : true,//初始时是关闭状态
			cache : false,
			modal : true
		//模态
		});
	})
	var editIndex = undefined;
	function edit() {
		if (editIndex == undefined) {
			alert("请先选择一行");
		}
		var row = $('#dg').datagrid('getSelected', editIndex);
		$.ajax({
			url : '/st_web/update/toupdate.do',
			type : "post",
			data : "id=" + row.id,
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			success : function(data) {
				$('#win').window('open'); // open a window    
				loaddata(data);
			}
		});
	}
	function exit() {
		$('#win').window('close'); // close a window  
	}

	function onClickRow(index) {//编辑的行不等于所选行时，编辑此行
		editIndex = index;
	}

	function flushit() { //刷新数据
		$('#dg').datagrid('reload');
	}

	//分页
	function adminselect(pageNumber, pageSize) {
		data = "rows=" + pageSize + "&page=" + pageNumber;
		var param = "/st_web/show/getdata.do"
		$.ajax({
			url : param,
			type : "post",
			data : data,
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			dataType : "json",
			success : function(data) {
				$('#dg').datagrid('loadData', data);
			}
		});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var p = $('#dg').datagrid('getPager');
		$(p).pagination({
			onSelectPage : function(pageNumber, pageSize) {
				adminselect(pageNumber, pageSize);
			}
		});
	});
</script>
<body>
	<%@ include file="head.jsp"%>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">管理商品</strong>
					</div>
				</div>
				<hr />
	<div id="tab" style="width: 1080px; height: 500px; margin: 0px auto;" data-options="border:true">
		<table id="dg" class="easyui-datagrid" style="width: 1020px;"
			data-options="	
				singleSelect: true,
				toolbar: '#tb',
 				url: '/st_web/show/getdata.do', 
				method: 'post',
				pagination:true,
				pageSize:5,
				onClickRow:onClickRow,
				pageList:[5,15,20,30],
				left:'2px'
			">
			<thead>
				<tr>
					<th data-options="field:'id',width:50">商品ID</th>
					<th data-options="field:'comName',width:200">商品名称</th>
					<th data-options="field:'comCode',width:100">商品编码</th>
					<th data-options="field:'comDescr',width:100">商品描述</th>
					<th data-options="field:'comPrice',width:70,align:'right'">商品价格</th>
					<th data-options="field:'comRepository',width:70,align:'right'">库存数量</th>
					<th data-options="field:'claname',width:100">商品分类</th>
					<th data-options="field:'comClassifyId',width:100" hidden="true"></th>
					<th data-options="field:'comStatus',width:60,align:'center'">状态</th>
					<th data-options="field:'createTime',width:130,align:'center'">创建日期</th>
					<th data-options="field:'updateTime',width:130,align:'center'">更新日期</th>
				</tr>
			</thead>
		</table>
		<div id="tb" style="height: auto">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="edit()">修改</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="flushit()">刷新</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-clear',plain:true" onclick="deleteit()">删除</a>
		</div>
	</div>
	<div id="win"><%@ include file="com_update.jsp"%></div>
			</div>
			<%@ include file="foot.jsp"%></div>
		<%@ include file="meau_shang.jsp"%>
	</div>
</body>
</html>