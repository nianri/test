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
			<h5>订单状态统计报表</h5>
		</div>
		<div class="ibox-content">			

			<span class="col-sm-2"> 
				<input type="text"  placeholder="请输入加油站名称" id="shopname"	class="form-control">
			
			</span>
			<span class="col-sm-2"> 
					<input type="text"  placeholder="请选择开始时间" id="dateFrom"	class="form-control">
			</span>
			<span class="col-sm-2"> 
				<input type="text"  placeholder="请选择结束时间" id="dateTo"	class="form-control">
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
				{field:'shopname',title:'加油站',width:80,sortable:false,align:"center",colspan:1,rowspan:2,valign:"middle"},	
				{field:'ordernum',title:'订单量',sortable:false,align:"center",colspan:6,rowspan:1},
				{field:'orderprice',title:'订单金额',sortable:false,align:"center",colspan:3,rowspan:1},
				{field:'shopid',title:'shopid',visible:false}, 
				{
					field : 'action',
					title : '操作',
					width : 150,
					align : "center",
					colspan:1,rowspan:2,valign:"middle",
					formatter : function(cellvalue,options, row) {
						var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='getShopOrderStatusReport(\""
								+ options.shopid + "\")' >详情</a>  ";
						
						//console.log(html);
						return html;
					}
				}
				],
			[
				{field : 'topay',title : '待支付',width : 30,align : "center"},
				{field : 'paid',title : '已支付',width : 30,align : "center"},
				{field : 'complete',title : '加油完成',width : 30,align : "center"},
				{field : 'applyRefund',title : '申请退款',width : 30,align : "center"},
				{field : 'refundSuccess',title : '退款完成',width : 30,align : "center"},
				{field : 'total',title : '总单量',width : 30,align : "center"},	
				{field : 'totalprice',title : '应收金额',width : 30,align : "center"},	
				{field : 'couponprice',title : '优惠金额',width : 30,align : "center"},	
				{field : 'realprice',title : '实付金额',width : 30,align : "center"},	
			]]
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
		    $("#dateFrom").datetimepicker({
		        format:'yyyy-mm-dd',  //格式  如果只有yyyy-mm-dd那就是0000-00-00
		        autoclose:true,//选择后是否自动关闭 
		        minView:2,//最精准的时间选择为日期  0-分 1-时 2-日 3-月
		        language:  'zh-CN', //中文
		        weekStart: 1, //一周从星期几开始
		        todayBtn:  1,
		        autoclose: 1,
		        todayHighlight: 1,
		        startView: 2,
		        forceParse: 0,
		       // daysOfWeekDisabled:"1,2,3", //一周的周几不能选 格式为"1,2,3"  数组格式也行
		        todayBtn : true,  //在底部是否显示今天
		        todayHighlight :false, //今天是否高亮显示
		        keyboardNavigation:true, //方向图标改变日期  必须要有img文件夹 里面存放图标
		        showMeridian:false,  //是否出现 上下午
		        initialDate:new Date()
		        //startDate: "2017-01-01" //日期开始时间 也可以是new Date()只能选择以后的时间
		    }).on("changeDate",function(){
		        var start = $("#dateFrom").val();
		        $("#dateTo").datetimepicker("setStartDate",start);
		    }); 
		    $("#dateTo").datetimepicker({
		        format:'yyyy-mm-dd',  //格式  如果只有yyyy-mm-dd那就是0000-00-00
		        autoclose:true,//选择后是否自动关闭 
		        minView:2,//最精准的时间选择为日期  0-分 1-时 2-日 3-月
		        language:  'zh-CN', //中文
		        weekStart: 1, //一周从星期几开始
		        todayBtn:  1,
		        autoclose: 1,
		        todayHighlight: 1,
		        startView: 2,
		        forceParse: 0,
		        //daysOfWeekDisabled:"1,2,3", //一周的周几不能选
		        todayBtn : true,  //在底部是否显示今天
		        todayHighlight :false, //今天是否高亮显示
		        keyboardNavigation:true, //方向图标改变日期  必须要有img文件夹 里面存放图标
		        showMeridian:false  //是否出现 上下午
		       // startDate: "2017-01-01"  //开始时间  ENdDate 结束时间
		    }).on("changeDate",function(){
		        var end = $("#dateTo").val();
		        $("#dateFrom").datetimepicker("setEndDate",end);
		    });
	});
	function getShopOrderStatusReport(shopid){
		var index = layer.open({
			type : 2,title : "加油站订单状态统计报表详情",
			content : "${pageContext.request.contextPath}/shopOrderReport/getShopOrderStatusReport/"+shopid+""
		});
		layer.full(index);
	}
	
	function binddata() {
		var rowData = {
				"shopname":$("#shopname").val(),
				"dateFrom":$("#dateFrom").val(),
				"dateTo":$("#dateTo").val(),
			};
		console.log(rowData);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shopOrderReport/getShopOrderStatusReportList",
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