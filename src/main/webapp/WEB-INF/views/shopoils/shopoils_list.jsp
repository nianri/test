<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>
	<%-- <script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script> --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
	<%-- <script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
	<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>	 --%>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>产品列表</h5>
		</div>
		<div class="ibox-content">			
			<span class="col-sm-2">
				<button id="btnmodal" class="btn btn-primary" onclick="adddata();">添加产品</button>
			</span> 
			<span class="col-sm-2"> 
				<input type="text" id="shopname" placeholder="请输入加油站名称"	class="form-control">
			</span>
			<span class="col-sm-2"> 
				<select id="status" name="status"	class="form-control m-b">
					<option value="">全部</option>
					<option value="2">上线</option>
					<option value="1">下线</option>
					<option value="0">待定</option>
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
			pagination:true,
			showLoading:true,
			pageSize:10,
			pageList:[ 10, 20, 30, 'All' ],
			columns:[
			[
				{field:'nums',title:'#',align:'center',width:30,colspan:1,rowspan:2,valign:"middle",
					formatter:function(value,row,index){return index + 1;}
				},
				{field:'shopoilsid',title:'shopoilsid',visible:false,colspan:1,rowspan:2}, 
				{field:'shopname',title:'加油站',width:80,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle"},
				{field:'oilscode',title:'产品编码',width:60,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle"},
				{field:'oilsname',title:'产品名称',width:150,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle"},
				{field:'sourceprice',title:'产品源价',width:50,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle"},
				{field:'sourceprice',title:'产品现价',sortable:false,align:"center",colspan:7,rowspan:1},
				{field:'runtime',title:'调价日期',width:50,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle"},	
				{field:"status",title:"状态",width:50,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle",
					formatter: function(cellvalue,options, row) {
						var result = "";
						if (cellvalue =="2") {
							result = "上线";
						} else if (cellvalue=="1") {
							result = "下线";
						} else if (cellvalue=="0") {
							result = "待定";
						}else{
							result="异常";
						}
						return result;
					}
				},
				{field:'action',title:'操作',width:100,align:"center",colspan:1,rowspan:2,valign:"middle",
					formatter : function(cellvalue,options, row) {
						var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='editdata(\""
								+ options.shopoilsid + "\")' >编辑</a>  ";
						html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deletedata(\""
								+ options.shopoilsid + "\")' >删除</a>";
						//console.log(html);
						return html;
					}
				}
			],
			[
				{field : 'payprice1',title : '周一',width : 30,align : "center"},
				{field : 'payprice2',title : '周二',width : 30,align : "center"},
				{field : 'payprice3',title : '周三',width : 30,align : "center"},
				{field : 'payprice4',title : '周四',width : 30,align : "center"},
				{field : 'payprice5',title : '周五',width : 30,align : "center"},
				{field : 'payprice6',title : '周六',width : 30,align : "center"},
				{field : 'payprice7',title : '周日',width : 30,align : "center"},
						 
			]]
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
	});
	function adddata() {
		var index = layer.open({
			type : 2,title : "添加产品",
			content : "${pageContext.request.contextPath}/shopOils/addShopOils"
		});
		layer.full(index);
		//$("#myModalLabel").text("添加产品");
		//$("#myModal").modal("show"); 
	}
	function editdata(shopoilsid) {
		var index = layer.open({
			type : 2,title : "编辑产品",
			content : "${pageContext.request.contextPath}/shopOils/editShopOils/"+shopoilsid+""
		});
		layer.full(index);
	}
	function deletedata(shopoilsid) {
		layer.confirm('确认要删除吗？',function(index){			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shopOils/deleteShopOils/"+shopoilsid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					layer.msg('已删除!',{icon:1,time:1000});
					//toastr.success("删除成功。");
					binddata();
				},
				error : function(errorMsg) {}
			});
		});		
	}
	function binddata() {
		var rowData = {"status":$("#status").val(),"shopname":$("#shopname").val()};
		console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shopOils/shopOilsSearch",
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