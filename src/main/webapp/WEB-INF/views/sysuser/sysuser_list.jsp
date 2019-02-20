<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>	
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>系统用户列表</h5>
		</div>
		<div class="ibox-content">			
			<span class="col-sm-2">
				<button class="btn btn-primary" onclick="adddata();">添加用户</button>
			</span> 
			<span class="col-sm-2"> 
				<select id="status" name="status"	class="form-control m-b">
					<option value="">请选择</option>
					<option value="0">冻结</option>
					<option value="1">关停</option>
					<option value="2">正常</option>
				</select>
			</span>
			<span class="col-sm-3">
				<input type="text" id="usercode"	placeholder="请输入用户账号或姓名" class="form-control"></span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary">搜索</a>
			</span>			
			<div class="jqGrid_wrapper">
				<table class="table-bordered" id="showtable">
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	jQuery(function($) {
		$('#showtable').bootstrapTable(	{
			pagination : true,
			showLoading : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 'All' ],
			columns : [
			{field:'nums',title : '#',align : 'center',width : 30,
				formatter : function(value, row, index) {return index + 1;}
			},
			{field:'usercode',title:'用户ID',width:30,sortable:true,align:"center",halign:"center"},
			{field:'logincode',title:'用户账号',width:150,sortable:true,align:"left",halign:"center"},
			{field:'realname',title:'用户姓名',width:50,sortable:true,align : "left",halign:"center"},
			{field:'usertype',title:'用户类型',width:50,sortable:true,align:"left",halign:"center",
				formatter:function(cellvalue,options,row) {
					var result = "";
					if (cellvalue =="1") {
						result = "商家";
					} else if (cellvalue=="2") {
						result = "普通用户";
					} else if (cellvalue=="3") {
						result = "管理员";
					} else 
						result = "未知";
					return result;
			}},
			{field:'shopname',title:'用户商家',width:150,sortable:true,align:"left",halign:"center"},
			{field:"createtime",title:"创建日期",width:120,sortable:true,align:"center",halign:"center"},
			{field:'userid',title:'userid',visible:false},
			{field:"status",title:"状态",width:50,sortable :true,align: "center",halign:"center",
				formatter:function(cellvalue,options,row) {
					var result = "";
					if (cellvalue =="0") {
						result = "冻结";
					} else if (cellvalue=="1") {
						result = "禁用";
					} else if (cellvalue=="2") {
						result = "启用";
					} else 
						result = "异常";
					return result; 
				}
			},
			{field:'action',title:'操作',width:180,align:"center",
				formatter:function(cellvalue,options,row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='editdata(\""
							+ options.userid + "\")' >编辑</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deletedata(\""
							+ options.userid + "\")' >删除</a>";
					html += "<span>   </span><a href='javascript:void(0);' class='btn btn-primary' onclick='repassword(\""
						+ options.userid + "\")' >重置密码</a>";		
					return html;
				}
			}]
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
	});
	function adddata() {
		var index = layer.open({
			type : 2,title : "添加用户",
			content : "${pageContext.request.contextPath}/sysUser/addSysUser"
		});
		layer.full(index);
	}
	function editdata(userid) {
		var index = layer.open({
			type : 2,title : "编辑用户",
			content : "${pageContext.request.contextPath}/sysUser/editSysUser/"+userid
		});
		layer.full(index);
	}
	function deletedata(userid) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sysUser/deleteSysUser/"+userid,
			dataType : "json",
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				console.log(result);
				binddata();
			},
			error : function(errorMsg) {}
		});
	}
	function binddata() {
		var rowData = {"usercode":$("#usercode").val(),"logincode":$("#usercode").val(),
					   "realname":$("#usercode").val(),"status":$("#status").val()};
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sysUser/sysUserSearch",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				console.log(result);
				$("#showtable").bootstrapTable("load", result);
			},
			error : function(errorMsg) { }
		});
	}
	function repassword(userid){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/sysUser/reSysUserPwd/"+userid,
			dataType : "json",
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				console.log(result);
				binddata();
			},
			error : function(errorMsg) {}
		});
	}
</script>
</html>