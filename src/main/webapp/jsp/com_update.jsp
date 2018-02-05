<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		var param = "/st_web/update/update.do"
		$.ajax({
			url : param,
			type : "post",
			// 			data : $('#itemAddForm').serialize(),
			data : form,
			processData : false,
			contentType : false,
			dataType : "text",
			success : function(data) {
				alert(data);
				if (data == "rep") {
					alert("编码重复，请重新输入！");
				} else {
					alert("修改成功");
					exit();
				}
			}
		});
	}

	function loaddata(data) {
		//			alert(data.comcla1);
		$('#cla1').combobox({
			url : "/st_web/com_cla/getcla1.do",
			required : true,
			editable : false,
			valueField : 'code',
			textField : 'claName',
			onLoadSuccess : function() {
				$('#cla1').combobox('select', data.comcla1);
			},
			onSelect : function(cla1) {
				$('#cla2').combobox({
					url : "/st_web/com_cla/getcla2.do?parCode=" + cla1.code,
					editable : false,
					valueField : 'id',
					textField : 'claName',
					onLoadSuccess : function() {
						$('#cla2').combobox('select', data.comcla2);
					},
				});
			}
		});
		$("#comName").textbox("setValue", data.com.comName);
		$("#id").val(data.com.id);
		$("#comDescr").textbox("setValue", data.com.comDescr);
		$("#comPrice").numberbox("setValue", data.com.comPrice);
		$("#comRepository").numberbox("setValue", data.com.comRepository);
		$("#comCode").textbox("setValue", data.com.comCode);
		$("#urla").attr("src", data.com.urla);
	}
</script>
<div style="padding: 10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm">
		<table cellpadding="10">
			<tr>
				<td>
				<input id="id"  name="id" hidden="true" type="text"/>
					<span>商品类目:</span>
				</td>
				<td>
					<input id="cla1" class="easyui-combobox" required=true />
					<input id="cla2" name="comClassifyId" class="easyui-combobox" required=true />
				</td>
			</tr>
			<tr>
				<td>
					<span>商品名称:</span>
				</td>
				<td>
					<input class="easyui-textbox" type="text" name="comName" id="comName" data-options="required:true" style="width: 280px;"></input>
				</td>
			</tr>
			<tr>
				<td>商品描述:</td>
				<td>
					<input class="easyui-textbox" name="comDescr" id="comDescr" data-options="required:true,multiline:true" style="height: 60px; width: 280px;"></input>
				</td>
			</tr>
			<tr>
				<td>商品价格:</td>
				<td>
					<input class="easyui-numberbox" type="text" name="comPrice" id="comPrice" data-options="min:1,max:99999999,precision:2,required:true" />
				</td>
			</tr>
			<tr>
				<td>库存数量:</td>
				<td>
					<input class="easyui-numberbox" type="text" name="comRepository" id="comRepository" data-options="min:1,max:99999999,precision:0,required:true" />
				</td>
			</tr>
			<tr>
				<td>编码：</td>
				<td>
					<input class="easyui-textbox" type="text" name="comCode" id="comCode" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<td>商品图片:</td>
				<td>
					<input type="file" name="file" value="上传图片" required=true />
					<img alt="" src="" id="urla" style="width: 50px; height: 50px;">
				</td>
			</tr>
		</table>
	</form>
	<div style="padding: 10px; margin-left: 20%;">
		<a class="easyui-linkbutton" onclick="submitForm()">确认修改</a>
		<a class="easyui-linkbutton" onclick="exit()">取消修改</a>
	</div>
</div>

