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
			<h5>积分商品列表</h5>
		</div>
		<div class="ibox-content">			
			<span class="col-sm-2">
				<button class="btn btn-primary" onclick="adddata();">添加商品</button>
			</span> 
			<span class="col-sm-2"> 
				<select id="status" name="status"	class="form-control m-b">
					<option value="">请选择启用状态</option>
					<option value="0">待审核</option>
					<option value="1">审核失败</option>
					<option value="2">审核成功</option>
					<option value="3">冻结</option>
					<option value="4">下架</option>
					<option value="5">上架</option>
				</select>
			</span>
			<span class="col-sm-3">
				<input type="text" id="goodsname"	placeholder="请输入商品名称" class="form-control"></span>
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
	var grid;
	//排序号、商品名称、所需积分、图片、添加时间、操作
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
			{field : 'goodscode',title : '商品编码',width : 30,sortable : true,align : "left"},
			{field : 'goodsname',title : '商品名称',width : 150,sortable : true,align : "left"},
			{field : 'price',title : '商品价格',width : 50,sortable : true,align : "right"},
			{field : 'integral',title : '所需积分',width : 50,sortable : true,align : "right"},
			{field : 'goodsimg',title : '商品图片',width : 100,sortable : true,align : "center",
				formatter:function(cellvalue, options, rowObject){
					if(cellvalue==null||cellvalue=="") return;
					if(cellvalue.split(",").length<=0) return;	
					return "<img src=\"" +cellvalue+"\" height='60' width='80'/>";	    		   
				}
			},
			{field : "createtime",title:"创建日期",width:100,sortable:true,align : "center"},
			{field : "status",title : "状态",width : 50,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if (cellvalue =="1") {
						result = "审核失败";
					} else if (cellvalue=="2") {
						result = "审核成功";
					} else if (cellvalue=="3") {
						result = "冻结";
					} else if (cellvalue=="4") {
						result = "下架";	
					} else if (cellvalue=="5") {
						result = "上架";	
					} else {
						result = "待审核";
					}
					return result;
				}
			},
			{field:'goodsid',title:'goodsid',visible:false}, 
			{
				field : 'action',
				title : '操作',
				width : 150,
				align : "center",
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='editdata(\""
							+ options.goodsid + "\")' >编辑</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deletedata(\""
							+ options.goodsid + "\")' >删除</a>";
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
	function adddata() {
		var index = layer.open({
			type : 2,title : "添加商品",
			content : "${pageContext.request.contextPath}/goods/addGoods"
		});
		layer.full(index);
	}
	function editdata(goodsid) {
		var index = layer.open({
			type : 2,title : "编辑商品",
			content : "${pageContext.request.contextPath}/goods/editGoods/"+goodsid+""
		});
		layer.full(index);
	}
	function deletedata(goodsid) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/goods/deleteGoods/"+goodsid,
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
		var rowData = {"goodsname":$("#goodsname").val(),"status":$("#status").val()};
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/goods/goodsSearch",
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
</script>
</html>