<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>
		
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/BootstrapSelect/css/bootstrap-select.min.css"></link>
		
	<title></title>	
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>礼品兑换列表</h5>
		</div>
		<div class="ibox-content">
			<span class="col-sm-2">
				<input type="text" id="goodsname"	placeholder="请输入礼品名称" class="form-control"></span>
			<span>			 
			<span class="col-sm-3">
				<input type="text" id="receive"	placeholder="请输入收货人" class="form-control"></span>
			<span>
			<span class="col-sm-3">
				<input type="text" id="telphone"	placeholder="请输入手机号" class="form-control"></span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary">搜索</a>
			</span>
			<span style="float:right">
				<ul class="nav navbar-nav"  >
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						导出
						<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href='javascript:void(0);'  onclick='exportData()'>导出当前页</a></li>
							<li class="divider"></li>
							<li><a href='javascript:void(0);'  onclick='exportData(true)'>导出全部</a></li>
						</ul>
					</li>
				</ul>
			</span>				
			<div class="jqGrid_wrapper">
				<table class="table-bordered" id="showtable">
				</table>
			</div>
		</div>
	</div><div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			          	<input type="hidden" id="orderid">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					发货
				</h4>
			</div>
			<div class="modal-body">
				<div class="row cl">
					<div class="formControls col-xs-10 col-sm-12">
										<label class="form-label col-xs-4 col-sm-4">快递号：</label>
					
						<input type="text" id="expressnums" class="input-text col-xs-4 col-sm-5" >
					</div>
				</div>
				<div class="row cl" style="margin-top:10px">
					<div class="formControls col-xs-10 col-sm-12">
						<label class="form-label col-xs-4 col-sm-4">快递公司：</label>
						<select id="queryDevice" class="selectpicker" >
						</select>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" id="deliveryOrder" class="btn btn-primary">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
<script type="text/javascript">
	var grid;
	var selectList;
	//排序号、礼品名称、所需积分、图片、添加时间、操作
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
			{field : 'goodsname',title : '礼品名称',width : 150,sortable : true,align : "left"},
			{field : 'price',title : '礼品价格',width : 50,sortable : true,align : "right"},
			{field : 'integral',title : '所需积分',width : 50,sortable : true,align : "right"},
			{field : 'receive',title : '收货人',width : 50,sortable : true,align : "left"},
			{field : 'telphone',title : '联系电话',width : 50,sortable : true,align : "left"},
			{field : 'orderid',title:'orderid',visible:false}, 
			{field : 'status',title:'状态',width : 50,sortable : true,
				formatter : function(cellvalue,options, row) {
					if(cellvalue=="0")
						return "待发货"
					else if(cellvalue=="1")
						return "已发货"
					else if(cellvalue=="2")
						return "已收货"
				}
			}, 
			{field : 'action',title : '操作',width : 100,align : "left",
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='getGoodsOrder(\""
							+ options.orderid + "\")' >详情</a>  ";
						if(options.status=='0'){
							html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='delivery(\""
							+ options.orderid + "\")' >发货</a>";
						}
					return html;
				}
			}]
		});
		
		$("#deliveryOrder").click(function() {
			deliveryOrder();
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		getDicExpressList();
		binddata();
	});
	function getDicExpressList(){
		var rowData={
				"status":'1'
		}
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/dicExpress/getDicExpressList",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				selectList=result;
				var deviceStr="" ;
				for(var i=0; i<result.length; i++){
					deviceStr+="<option value="+result[i].expressid+">"+result[i].expressname+"</option>"; 
				}

				$("#queryDevice").html("");
				$('#queryDevice').append(deviceStr);
				$('#queryDevice').selectpicker('refresh');
			},
			error : function(errorMsg) { }
		});
		
	}
	
	function getGoodsOrder(orderid) {
		var index = layer.open({
			type : 2,title : "礼品兑换详情",
			content : "${pageContext.request.contextPath}/goodsOrder/getGoodsOrder/"+orderid+""
		});
		layer.full(index);
	}
	function delivery(orderid) {
		// $("#createFileTitle").text("回复");
         $('#myModal').modal('show');
         $("#orderid").val(orderid);
         $("#expressnums").val("");
         $(".selectpicker").selectpicker('val', selectList[0].expressid);//
	}
	function deliveryOrder(){
	    var expressnums=$("#expressnums").val().trim();
	    var expressid=$("#queryDevice").val();
	    
	    if(expressnums.length<1){
	    	alert("请输入快递单号");
	    	return;
	    }
	    var data={
	    		"orderid":$("#orderid").val(),
	    		"expressnums":expressnums,
	    		"expressid":expressid,
	    		"status":'1'
	    }
	    $.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/goodsOrder/updateGoodsOrder",
			dataType : "json",
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				if(result.code=="SS01"){
					toastr.success(result.info);
					 $("#myModal").modal("hide");
					binddata();
				}else
					toastr.error(result.info);
			},
			error : function(errorMsg) {
				toastr.error("数据保存异常，请联系管理员！");
			}
		});
	    
	}
	function exportData(isAllPage){
		 var url = "${pageContext.request.contextPath}/export/download.do";
		if(isAllPage){
			var rowData=getParams();
			exportAll(url,"goodsOrderService","礼品兑换.xlsx",rowData);
			}else{
			exportNowPage("#showtable","礼品兑换",'6','0');
		}
	}
	function getParams(){
		var rowData = {
				"telphone":$("#telphone").val(),
				"receive":$("#receive").val(),
				"goodsname":$("#goodsname").val()
			};
		return rowData;
	}
	
	function binddata() {
		var rowData = getParams();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/goodsOrder/getGoodsOrderList",
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