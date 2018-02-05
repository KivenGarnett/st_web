<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上架商品</title>
<link href="<%=request.getContextPath()%>/css/admin.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/amazeui.css" rel="stylesheet" type="text/css">
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
		$('#cla1').combobox({
			url : "/st_web/com_cla/getcla1.do",
			required : true,
			editable : false,
			valueField : 'code',
			textField : 'claName',
			onSelect : function(cla1) {
				$('#cla2').combobox({
					url : "/st_web/com_cla/getcla2.do?parCode=" + cla1.code,
					editable : false,
					valueField : 'id',
					textField : 'claName',
				});
			}
		});

	})
</script>
<script type="text/javascript">
	//提交表单
	function submitForm() {
		//有效性验证
		if (!$('#itemAddForm').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		//提交
		var form = new FormData(document.getElementById("itemAddForm"));
		var param = "/st_web/update/insert.do"
		$.ajax({
			url : param,
			type : "post",
			// 			data : $('#itemAddForm').serialize(),
			data : form,
			processData : false,//表示不是只输入数据
			contentType : false,
			dataType : "text",
			success : function(data) {
				if (data == "rep") {
					alert("编码重复，请重新输入！");
				} else {
					alert("添加成功");
					$("#image").attr("src", data);
					$('input,select,textarea', $('form[id="itemAddForm"]'))
							.attr('readonly', true);
				}
			}
		});
	}
	function clearForm() {
		$('#itemAddForm').form('reset');
		$('input,select,textarea', $('form[id="itemAddForm"]')).attr(
				'readonly', false);
	}
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
						<strong class="am-text-danger am-text-lg">商品上架</strong>
					</div>
				</div>
				<hr />
				<div style="padding: 10px 10px 10px 10px">
		<form id="itemAddForm" class="itemForm">
			<table cellpadding="20" style="margin-left: 50px;margin-top: 30px">
				<tr>
					<td>
						<span>商品类目:</span>
					</td>
					<td>
						<input id="cla1" />
						<input id="cla2" name="comClassifyId" class="easyui-combobox" required=true />
					</td>
				</tr>
				<tr style="margin-top: 20px">
					<td>
						<span>商品名称:</span>
					</td>
					<td>
						<input class="easyui-textbox" type="text" name="comName" data-options="required:true" style="width: 280px;"></input>
					</td>
				</tr>
				<tr>
					<td>商品描述:</td>
					<td>
						<input class="easyui-textbox" name="comDescr" data-options="required:true,multiline:true" style="height: 60px; width: 280px;"></input>
					</td>
				</tr>
				<tr>
					<td>商品价格:</td>
					<td>
						<input class="easyui-numberbox" type="text" name="comPrice" data-options="min:1,max:99999999,precision:2,required:true" />
					</td>
				</tr>
				<tr>
					<td>库存数量:</td>
					<td>
						<input class="easyui-numberbox" type="text" name="comRepository" data-options="min:1,max:99999999,precision:0,required:true" />
					</td>
				</tr>
				<tr>
					<td>编码：</td>
					<td>
						<input class="easyui-textbox" type="text" name="comCode" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<td>商品图片:</td>
					<td>
						<input type="file" name="file" value="上传图片" required=true />
						<img alt="" src="" id="image" style="width: 50px; height: 50px;">
					</td>
				</tr>
			</table>
		</form>
		<div style="padding: 10px; margin-left: 20%;">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="margin-left: 5%">重置</a>
		</div>
	</div>
			</div>
			<%@ include file="foot.jsp"%></div>
		<%@ include file="meau_shang.jsp"%>
	</div>
</body>
</html>