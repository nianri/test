<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>入驻审核</title>	
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">       
		<div class="ibox-title">
		    <h5>加油站审核列表</h5>
		</div>                    
		<div class="ibox-content">
			<span class="col-sm-2"> 
				<select id="status" class="form-control m-b">
					<option value="1" selected>待审核</option>
				</select>
			</span>
            <span class="col-sm-3">
            	<input type="text" id="shopname" placeholder="请输入加油站名称" class="form-control">
            </span>
            <span>
            	<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a>
            </span>  
		    <div class="jqGrid_wrapper">
				<table class="table-bordered" id="showtable" ></table>
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
		{field : 'nums',title : '#',align : 'center',width : 30,formatter : function(value, row, index) {return index + 1;}},
		{field : 'submittime',title:'提交审核日期',width:50,sortable : true,align : "center"},
		{field : 'realname',title:'提交人',width:50,sortable : true,align : "center"},
		{field : 'shopcode',title :'加油站编码',width:100,sortable : true,align : "left"},
		{field : 'shopname',title :'加油站名称',width:150,sortable : true,align : "left"},
		{field : 'areadesc',title:'地址',width:200,sortable : true,align : "left"},
		{field : "status",title:"审核状态",width:30,sortable:true,align : "center",
			formatter:function(cellvalue, options, row){
				var result = "";//0.否 1.是
				if(cellvalue == 0){
					result='未审核';
				}else if(cellvalue == 1){
					result='待审核';
				}else if(cellvalue == 2){
					result='审核失败';
				};				
				return result;	
    		}
		},
		{field : 'action',title : '操作',width : 50,align : "center",
			formatter : function(cellvalue,options, row) {
				var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='checkshop(\""
						+ options.shopid + "\")' >审核</a>  ";
				return html;
			}
		},{field : 'shopid',title : 'shopid',visible:false}]

	});
	$("#queryBtn").click(function() {
		binddata();
	});
	binddata();
});
function binddata(){
	var rowData = {"shopname" : $("#shopname").val()};
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/shop/getShopCheckList",
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
function checkshop(shopid){
	if(shopid=="") return;
	var index = layer.open({
		type: 2,
		title: "加油站信息-审核",
		content: "${pageContext.request.contextPath}/shop/checkShopInfo/"+shopid
	});
	layer.full(index);	 
}
</script>
</html>