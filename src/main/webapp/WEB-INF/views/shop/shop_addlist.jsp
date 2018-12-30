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
			<h5>加油站入驻</h5>
		</div>
		<div class="ibox-content">
			<span class="col-sm-3">
				<button class="btn btn-primary" onclick="addshop()">+ 增  加</button>
			</span>
			<span class="col-sm-2"> 
				<select id="status" class="form-control m-b">
					<option value="" selected>全部</option>
					<option value="0">未申请</option>
					<option value="1">待审核</option>
					<option value="2">审核未通过</option>
				</select>
			</span>
			<span class="col-sm-3"> 
				<input type="text" id="shopname" placeholder="请输入加油站名称"	class="form-control">
			</span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜  索</a>
				<a id="excelBtn" href="javascript:void(0);"	class="btn btn-primary ">导  出</a>
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
			{field : "createtime",title : "入驻日期",	width : 120,sortable : true,align : "center"},
			{field : 'shopimg',title : '加油站图片',width : 30,sortable : true,align : "center",
				formatter:function(cellvalue, options, rowObject){
					if(cellvalue==null){
						cellvalue= "${pageContext.request.contextPath}/resources/static/shopimgdefault.png";
						return "<img src=\"" +cellvalue+"\" height='60' width='80'/>";	
					}else{
						return "<img src=\"" +cellvalue+"\" height='60' width='80'/>";	
					}
				}
			},
			{field : 'shopcode',title : '加油站编码',width:20,sortable : true,align : "center"},
			{field : 'shopname',title : '加油站名称',width:100,sortable : true,align : "left"},
			{field : 'areadesc',title : '地址',width:200,sortable : true,align : "left"},			
			{field : "status",title : "状态",width : 60,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if(cellvalue == "0"){
						result='未申请';
					}else if(cellvalue == "1"){
						result='待审核';
					}else if(cellvalue == "2"){
						result='审核未通过';
					}					
					return result;					
				}
			},{field : 'shopid',title : 'shopid',visible : false}, 
			{field : 'action',title : '操作',width : 100,align : "center",
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='editshop(\""
							+ options.shopid + "\")' >编  辑</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deleteshop(\""
							+ options.shopid + "\")' >删  除</a>";
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
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shop/shopAddSearch",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				$("#showtable").bootstrapTable("load", result);
			},
			error : function(errorMsg) {
			}
		});
	}
	function deleteshop(shopid){
		layer.confirm('您确认要删除吗？',function(index){	
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/deleteShop/"+shopid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					layer.msg('删除成功。',{icon:1,time:1500});
					result = eval(result);				 
					binddata();
				},
				error : function(errorMsg) {
					layer.msg('删除失败!',{icon:2,time:1500});
				}
			});
		});
	} 
	function addshop() {
		var index = layer.open({type : 2,title : "加油站-入驻",
			content : "${pageContext.request.contextPath}/shop/shopAddInfo/"});
		layer.full(index);
	}
	function editshop(index) {
		var index = layer.open({type : 2,title : "加油站-信息编辑",
			content : "${pageContext.request.contextPath}/shop/shopEditInfo/"  + index + ""	});
		layer.full(index);
	}
</script>
</html>