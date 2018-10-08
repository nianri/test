<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<script	src="${pageContext.request.contextPath}/resources/datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<link href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" >	
</head>
<body class="gray-bg">
	<div class="page-container">
		<form class="form form-horizontal" id="form-article-add">
			<div class="ibox-content">
				<span class="col-sm-2"> 
					<select id="status" class="form-control m-b">
						<option value="">全部状态</option>
						<option value="0">异常</option>
						<option value="1">待支付</option>
						<option value="2">已支付</option>
						<option value="3">加油完成</option>
						<option value="4">申请退款</option>
						<option value="5">退款成功</option>
					</select>
				</span>
				<span class="col-sm-2"> 
					<input type="text" id="shopname" placeholder="请输入加油站名称"	class="form-control">
				</span>
				<span class="col-sm-2">
					<input type="text" class="form-control" id="begintime"  placeholder="请输入起始日期">				 
				</span>	
				<span class="col-sm-2">
					<input type="text" class="form-control" id="endtime"  placeholder="请输入截至日期">
				</span>
				<span>
					<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a>
					<a id="excelBtn" href="javascript:void(0);"	class="btn btn-primary ">导出</a>
				</span>
				<div class="jqGrid_wrapper">
					<table class="table-bordered" id="showtable"></table>
				</div>
			</div>	
			<input type="hidden" id="memberid" value="${memberid}">	
		</form>
	</div>
</body>
<script type="text/javascript">
	jQuery(function($) {
		$("#begintime").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn: true ,
	        autoclose: true,
	        todayHighlight: true,
	        startView: 2,
	        minView: 2,
	        format: 'yyyy-mm-dd',//定义时间格式
	        forceParse: true
	    });
		$("#endtime").datetimepicker({
			language:  'zh-CN',
	        weekStart: 1,
	        todayBtn: true ,
	        autoclose: true,
	        todayHighlight: true,
	        startView: 2,
	        minView: 2,
	        format: 'yyyy-mm-dd',//定义时间格式
	        forceParse: true
	    });
		$('#showtable').bootstrapTable(	{
			pagination : true,
			showLoading : true,
			pageSize : 10,
			showFooter: true,
			pageList : [ 10, 20, 30, 'All' ],
			columns : [
			{field:'nums',title:'#',align:'center',width:30,
				formatter:function(value,row,index){return index + 1;}
			},
			{field : 'ordercode',title : '订单号',width : 50,sortable : true,align : "center"	},
			{field : 'ordertime',title : '订单时间',width:120,sortable : true,align : "center"},	
			{field : 'oilsname',title : '产品',width:50,sortable : true,align : "center"},	
			{field : 'totalprice',title : '应付金额',width:40,sortable : true,align : "right",
				footerFormatter: function (colvalue) { 					 
					var rowcount = 0;        
					for (var i in colvalue) {
						rowcount += colvalue[i].totalprice;
					}        
					return '应付合计:'+  rowcount;
				}
			},
			{field : 'couponprice',title : '优惠金额',width:40,sortable : true,align : "right",
				footerFormatter: function (colvalue) { 					 
					var rowcount = 0;        
					for (var i in colvalue) {
						rowcount += colvalue[i].couponprice;
					}        
					return '优惠合计:'+  rowcount;
				}
			},
			{field : 'realprice',title : '实付金额',width:40,sortable : true,align : "right",
				footerFormatter: function (colvalue) { 					 
					var rowcount = 0;        
					for (var i in colvalue) {
						rowcount += colvalue[i].realprice;
					}        
					return '实付合计:'+  rowcount;
				}
			},
			{field : 'paytype',title : '支付类型',width:50,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = ""; 
					if(cellvalue == "1"){
						result='微信';
					}else if(cellvalue == "2"){
						result='支付宝';
					}else if(cellvalue == "3"){
						result='刷卡';
					}else
						result='异常';					
					return result;			
				}
			},
			{field : 'shopname',title : '加油站',width:120,sortable : true,align : "left",halign:"center"	},			 
			{field : "status",title : "状态",width : 50,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if(cellvalue == "1"){
						result='待支付';
					}else if(cellvalue == "2"){
						result='已支付';
					}else if(cellvalue == "3"){
						result='加油完成';
					}else if(cellvalue == "4"){
						result='申请退款';
					}else if(cellvalue == "5"){
						result='退款成功';
					}else
						result='异常';					
					return result;			
				}
			},{field:'orderid',title:'orderid',visible:false}, 
			{field : 'action',title : '操作',width : 30,align : "center",
				formatter : function(cellvalue,options, row) {
				return  "<a href='javascript:void(0);' class='btn btn-primary' onclick='viewdetail(\""
						+ options.orderid + "\")' >详情</a>  "; }
			}]
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
	});
	function binddata(){
		var rowData = {"shopname":$("#shopname").val(),"status":$("#status").val(),
					   "begintime":$("#begintime").val(),"endtime":$("#endtime").val(),
					   "memberid":$("#memberid").val()};
		console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shopOrder/shopOrderSearch",
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
	function viewdetail(orderid){
		var index = layer.open({
			type : 2,
			title : "订单详情",
			content : "${pageContext.request.contextPath}/shopOrder/shopOrderDetail/"  + orderid 
		});
		layer.full(index);
	}
	
</script>
</html>