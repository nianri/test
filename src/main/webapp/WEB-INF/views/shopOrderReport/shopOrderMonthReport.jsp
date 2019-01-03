<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>  
<script src="${pageContext.request.contextPath}/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>  

<link href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
	<title></title>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>月收入统计报表</h5>
		</div>
		<div class="ibox-content">			

			<span class="col-sm-2"> 
				<input type="text"  placeholder="请输入加油站名称" id="shopname"	class="form-control">
			
			</span>
			<span class="col-sm-2"> 
					<input type="text"  placeholder="请选择年份" id="orderYear"	class="form-control">
			</span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary">搜索</a>				
			</span>			
			<div class="jqGrid_wrapper" style="margin-top:10px;"">
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
				{field:'shopname',title:'加油站',width:150,sortable:false,align:"left",rowspan:2,valign:"middle"},	
				{field:'m1',title:'一月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m2',title:'二月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m3',title:'三月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m4',title:'四月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m5',title:'五月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m6',title:'六月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m7',title:'七月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m8',title:'八月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m9',title:'九月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m10',title:'十月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m11',title:'十一月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'m12',title:'十二月',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'total',title:'合计',sortable:false,align:"center",colspan:2,rowspan:1},
				{field:'shopid',title:'shopid',visible:false}, 
				{
					field : 'action',
					title : '操作',
					width : 50,
					align : "center",
					colspan:1,rowspan:2,valign:"middle",
					formatter : function(cellvalue,options, row) {
						var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='getShopOrderMonthReport(\""
								+ options.shopid + "\")' >详情</a>  ";
						
						//console.log(html);
						return html;
					}
				}
				],
			[
				{field : 'count1',title : '订单量',width : 30,align : "center"},
				{field : 'realprice1',title : '订单金额',width : 30,align : "center"},
				{field : 'count2',title : '订单量',width : 30,align : "center"},
				{field : 'realprice2',title : '订单金额',width : 30,align : "center"},
				{field : 'count3',title : '订单量',width : 30,align : "center"},
				{field : 'realprice3',title : '订单金额',width : 30,align : "center"},
				{field : 'count4',title : '订单量',width : 30,align : "center"},
				{field : 'realprice4',title : '订单金额',width : 30,align : "center"},
				{field : 'count5',title : '订单量',width : 30,align : "center"},
				{field : 'realprice5',title : '订单金额',width : 30,align : "center"},
				{field : 'count6',title : '订单量',width : 30,align : "center"},
				{field : 'realprice6',title : '订单金额',width : 30,align : "center"},
				{field : 'count7',title : '订单量',width : 30,align : "center"},
				{field : 'realprice7',title : '订单金额',width : 30,align : "center"},
				{field : 'count8',title : '订单量',width : 30,align : "center"},
				{field : 'realprice8',title : '订单金额',width : 30,align : "center"},
				{field : 'count9',title : '订单量',width : 30,align : "center"},
				{field : 'realprice9',title : '订单金额',width : 30,align : "center"},
				{field : 'count10',title : '订单量',width : 30,align : "center"},
				{field : 'realprice10',title : '订单金额',width : 30,align : "center"},
				{field : 'count11',title : '订单量',width : 30,align : "center"},
				{field : 'realprice11',title : '订单金额',width : 30,align : "center"},
				{field : 'count12',title : '订单量',width : 30,align : "center"},
				{field : 'realprice12',title : '订单金额',width : 30,align : "center"},
				{field : 'count',title : '订单量',width : 30,align : "center"},
				{field : 'realprice',title : '订单金额',width : 30,align : "center"}
			]]
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
		$('#orderYear').datetimepicker({  
	        format: 'yyyy',  
	         weekStart: 1,  
	         autoclose: true,  
	         startView: 4,  
	         minView: 4,  
	         forceParse: false,  
	         language: 'cn',
	         initialDate:new Date()
	    }); 
		$("#orderYear").datetimepicker("setDate", new Date());
	});
	function getShopOrderMonthReport(shopid){
		var index = layer.open({
			type : 2,title : "月收入统计报表详情",
			content : "${pageContext.request.contextPath}/shopOrderReport/getShopOrderMonthReport/"+shopid+""
		});
		layer.full(index);
	}
	
	function binddata() {
		var rowData = {
				"shopname":$("#shopname").val(),
				"orderYear":$('#orderYear').val()
			};
		console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shopOrderReport/getShopOrderMonthReportList",
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