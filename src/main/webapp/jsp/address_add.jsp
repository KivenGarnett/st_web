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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/themes/icon.css" />
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function() {
		$('#add1').combobox({
			url : "/st_web/dictionary/getadd1.do",
			required : true,
			editable : false,
			valueField : 'name',
			textField : 'name',
			onSelect : function(add1) {
				$('#add2').combobox({
					url : "/st_web/dictionary/getadd2.do?parentCode=" + add1.code,
					editable : false,
					valueField : 'name',
					textField : 'name',
					onSelect : function(add2) {
						$('#add3').combobox({
							url : "/st_web/dictionary/getadd3.do?parentCode=" + add2.code,
							editable : false,
							valueField : 'name',
							textField : 'name',
						});
					}
				});
			}
		});

	})
</script>
<script type="text/javascript">
	function tijiao() {
// 		var form = new FormData(document.getElementById("addForm"));
		$.ajax({
			url : "/st_web/address/insert.do",
			type : "POST",
			data : $("#addForm").serialize(),
			dataType : "text",
			success : function(data) {
				alert("地址添加成功");
				window.location.href = "/st_web/jsp/address.jsp";
			}
		});
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
						<strong class="am-text-danger am-text-lg">添加地址</strong>
					</div>
				</div>
				<hr />
<!-- 				<form action="/st_web/address/insert.do" method="post"> -->
				<form id="addForm">
					<table cellpadding="20" style="margin-left: 50px;margin-top: 30px">
<%-- 					<input class="easyui-textbox" type="text" name="userId" hidden="true" >${user.id }</input> --%>
						<span name="userId" hidden="true">${user.id }</span>
						<tr>
							<td>
								<span>收件人:</span>
							</td>
							<td>
								<input class="easyui-textbox" type="text" name="userName" data-options="required:true" style="width: 100px;"></input>
							</td>
						</tr>
						<tr>
							<td>
								<span>电话:</span>
							</td>
							<td>
								<input class="easyui-numberbox" type="text" name="userTel" data-options="min:10000000000,max:99999999999,precision:0,required:true" />
							</td>
						</tr>
						<tr>
							<td>
								<span>省:</span>
							</td>
							<td>
								<input id="add1" name="userSheng" class="easyui-combobox" required=true />
							</td>
						</tr>
						<tr>
							<td>
								<span>市:</span>
							</td>
							<td>
								<input id="add2" name="userShi" class="easyui-combobox" required=true />
							</td>
						</tr>
						<tr>
							<td>
								<span>区:</span>
							</td>
							<td>
								<input id="add3" name="userQu" class="easyui-combobox" required=true />
							</td>
						</tr>
						<tr>
							<td>
								<span>详细地址:</span>
							</td>
							<td>
								<input class="easyui-textbox" name="userAddress" data-options="required:true,multiline:true" style="height: 60px; width: 280px;"></input>
							</td>
						</tr>
					</table>
					<input type="button" value="提交" style="margin-left: 20%; margin-top: 20px;width: 50px" onclick="tijiao()">
				</form>
			</div>
			</div>
			
		<%@ include file="meau_ge.jsp"%>
		
	</div>
	<div style="margin-top: 30px"><%@ include file="foot.jsp"%></div>
</body>
</html>