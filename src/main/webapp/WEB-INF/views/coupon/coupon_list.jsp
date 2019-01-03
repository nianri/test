<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>优惠券列表</h5>
		</div>
		<div class="ibox-content">			
			<span class="col-sm-2">
				<button id="btnmodal" class="btn btn-primary" onclick="adddata();">添加优惠券</button>
			</span> 
			<span class="col-sm-2"> 
				<select id="status" name="status"	class="form-control m-b">
					<option value="">全部</option>
					<option value="2">上架</option>
					<option value="1">下架</option>
					<option value="0">待定</option>
					<option value="3">超期</option>
				</select>
			</span>
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
			{field:'nums',title : '#',align : 'center',width : 20,
				formatter : function(value, row, index) {return index + 1;}
			},
			{field : 'shopname',title : '加油站',width : 80,sortable : true,align : "left"},
			{field : 'couponcode',title : '优惠券编码',width : 40,sortable : true,align : "center"},
			{field : 'couponname',title : '优惠券名称',width : 100,sortable : true,align : "left"},
			{field : 'createtime',title : '发布日期',width : 60,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {					
					return options.createtime.substring(0,10);
				} 
			},
			{field : 'endtime',title : '有效期',width : 60,sortable : true,align : "center"
				/* formatter : function(cellvalue,options, row) {					
					return options.begintime+"/"+options.endtime;
				} */
			},
			{field : 'couponprice',title : '优惠券金额',width : 50,sortable : true,align : "center"},
			{field : 'totalnums',title : '发布数量',width : 50,sortable : true,align : "center"},	
			{field : 'couponnums',title : '剩余数量',width : 50,sortable : true,align : "center"},	
			{field : 'fullamount',title : '消费额',width : 50,sortable : true,align : "center"},	
			{field : "status",title : "状态",width : 50,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if (cellvalue=="0") {
						result = "待定";
					}else if (cellvalue=="1") {
						result = "下架";
					}else if(cellvalue=="2"){
						result = "上架";
					}else{
						result = "异常";
					}
					return result;
				}
			},
			{field:'couponid',title:'couponid',visible:false}, 
			{
				field : 'action',
				title : '操作',
				width : 150,
				align : "center",
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='couponup(\""
							+ options.couponid + "\")' >上架</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='coupondown(\""
								+ options.couponid + "\")' >下架</a>  ";		
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deletedata(\""
							+ options.couponid + "\")' >删除</a>";
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
			type : 2,title : "添加产品",
			content : "${pageContext.request.contextPath}/coupon/addCoupon"
		});
		layer.full(index);
	}
	function couponup(couponid) {
		/* var index = layer.open({
			type : 2,title : "编辑产品",
			content : "${pageContext.request.contextPath}/coupon/editCoupon/"+couponid+""
		});
		layer.full(index); */
		layer.confirm('确认要上架吗？',function(index){			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/coupon/couponUp/"+couponid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="SS01"){
						layer.msg('上架成功。',{icon:1,time:1500});
						binddata();
					}else{
						layer.msg('上架失败!',{icon:2,time:1500});
					}
				},
				error : function(errorMsg) {
					layer.msg('上架失败!',{icon:2,time:1500});	
				}
			});
		});		
	}
	function coupondown(couponid) {
		layer.confirm('确认要下架吗？',function(index){			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/coupon/couponDown/"+couponid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="SS01"){
						layer.msg('下架成功。',{icon:1,time:1500});
						binddata();
					}else{
						layer.msg('下架失败!',{icon:2,time:1500});
					}
				},
				error : function(errorMsg) {
					layer.msg('上架失败!',{icon:2,time:1500});	
				}
			});
		});		
	}
	function deletedata(couponid) {
		layer.confirm('确认要删除吗？',function(index){			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/coupon/deleteCoupon/"+couponid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					console.log(result);
					if(result.code=="DS01"){
						layer.msg('删除成功。',{icon:1,time:1500});
						binddata();
					}else{
						layer.msg('删除失败!',{icon:2,time:1500});
					}
				},
				error : function(errorMsg) {
					layer.msg('删除失败!',{icon:2,time:1500});	
				}
			});
		});		
	}
	function binddata() {
		var rowData = {"status":$("#status").val()};
		console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/coupon/couponSearch",
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