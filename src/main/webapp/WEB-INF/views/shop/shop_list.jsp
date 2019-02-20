<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>		
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>加油站列表</h5>
		</div>
		<div class="ibox-content">
			<span class="col-sm-2"> 
				<select id="status" class="form-control m-b">
					<option value="">全部</option>
					<option value="0">未申请</option>
					<option value="1">待审核</option>
					<option value="2">审核失败</option>
					<option value="3">审核通过</option>
					<option value="4">上线</option>
					<option value="5">下线</option>
					<option value="6">停用</option>
				</select>
			</span>
			<span class="col-sm-3"> 
				<input type="text" id="shopname" placeholder="请输入加油站名称"	class="form-control">
			</span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a>
				<a id="excelBtn" href="javascript:void(0);"	class="btn btn-primary ">导出</a>
			</span>
			<div class="jqGrid_wrapper">
				<table class="table-bordered" id="showtable"></table>
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
			{field : 'nums',title : '#',align : 'center',width : 30,
				formatter : function(value, row, index) {return index + 1;}
			},
			{field : "createtime",title : "申请日期",	width : 120,sortable : true,align : "center"},
			{field : 'shopimg',title : '加油站图片',width : 50,sortable : true,align : "center",
				formatter:function(cellvalue, options, rowObject){
					if(cellvalue==null) return;
					if(cellvalue.split(",").length<=0) return;	
					return "<img src=\"" +cellvalue.split(",")[0]+"\" height='60' width='80' class='img-rounded'/>";	    		   
				}
			},
			{field : 'shopcode',title : '加油站编码',width:20,sortable : true,align : "center"},
			{field : 'shopname',title : '加油站名称',width:100,sortable : true,align : "left"},
			{field : 'areadesc',title : '地址',width:200,sortable : true,align : "left"},
			{field : "status",title : "状态",width : 60,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";//0.否 1.是
					if(cellvalue == "0"){
						result='未申请';
					}else if(cellvalue == "1"){
						result='待审核';
					}else if(cellvalue == "2"){
						result='审核未通过';
					}else if(cellvalue == "3"){
						result='审核通过';
					}else if(cellvalue == "4"){
						result='上线';
					}else if(cellvalue == "5"){
						result='下线';
					}else if(cellvalue == "6"){
						result='停用';
					};					
					return result;					
				}
			},{field : 'shopid',title : 'shopid',visible : false}, 
			{field : 'action',title : '操作',width : 180,align : "center",
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='viewimg(\""
							+ options.shopid + "\")' >查看</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='updateshopstatus(\""
							+ options.shopid + "\",\"4\")' >上线</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='updateshopstatus(\""
						+ options.shopid + "\",\"5\")' >下线</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deleteshop(\""
							+ options.shopid + "\")' >删除</a>";
					//console.log(html);
					return html;
				}
			}]
	
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
	});
	function binddata(){
		var rowData = {"shopname" : $("#shopname").val(),"status" : $("#status").val()};
		//console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shop/shopSearch",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				console.log(result);
				$("#showtable").bootstrapTable("load", result);
			},
			error : function(errorMsg) {
			}
		});
	}
	function viewimg(shopid){
		var index = layer.open({
			type : 2,
			title : "加油站详情",
			content : "${pageContext.request.contextPath}/shop/shopDetail/"  + shopid 
		});
		layer.full(index);
	}
	function updateshopstatus(shopid,status){
		var rowData = {"shopid":shopid,"status":status};
		//console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shop/updateShopStatus",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				binddata();
			},
			error : function(errorMsg) {
			}
		});
	}
	function deleteshop(shopid){
		//window.confirm("确定删除？");
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shop/deleteShop/"+shopid,
			dataType : "json",
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);				 
				binddata();
			},
			error : function(errorMsg) {}
		});
	} 
</script>
</html>