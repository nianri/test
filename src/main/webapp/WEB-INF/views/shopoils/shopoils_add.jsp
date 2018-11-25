<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>
		
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap-table.min.css"	rel="stylesheet">
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap-table.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap-table-zh-CN.min.js"></script>
		
		<script	src="${pageContext.request.contextPath}/resources/datetimepicker/js/bootstrap-datetimepicker.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<link href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" >
		<script	type="text/javascript"	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
	</head>
	<body>
		<div class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油站：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="shopname" type="text" class="input-text" value="${shopoils.shopname}">						
					</div>
					<a id="selectshop" class="btn btn-primary" onclick="selectshop();" role="button">请选择...</a>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">产品名称：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id=oilsname type="text" class="input-text" value="${shopoils.oilsname}" >
					</div>
					<a id="selectoils" class="btn btn-primary" onclick="selectoils();" role="button">请选择...</a>
				</div>				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">产品原价：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="sourceprice" type="text" class="input-text" value="${shopoils.sourceprice}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>				
				</div>				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周一：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice1" type="text" class="input-text" value="${shopoils.payprice1}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周二：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice2" type="text" class="input-text" value="${shopoils.payprice2}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周三：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice3" type="text" class="input-text" value="${shopoils.payprice3}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周四：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice4" type="text" class="input-text" value="${shopoils.payprice4}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周五：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice5" type="text" class="input-text" value="${shopoils.payprice5}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周六：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice6" type="text" class="input-text" value="${shopoils.payprice6}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">现价-周日：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="payprice7" type="text" class="input-text" value="${shopoils.payprice7}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">调价日期：</label>					 
					<div class="formControls col-xs-8 col-sm-3">
						 <div class="input-append date" >
						    <input class="input-text" size="16" type="text" id="runtime" readonly value="${shopoils.runtime}">
						    <span class="add-on"><i class="icon-th"></i></span>
						</div> 				
					</div>					
				</div>				 
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">状态：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
							<select id="status" class="select" >
								<option value="">请选择</option>
								<option value = "0" ${shopoils.status=="0"?'selected':''}>待定</option>
								<option value = "1" ${shopoils.status=="1"?'selected':''}>下线</option>
								<option value = "2" ${shopoils.status=="2"?'selected':''}>上线</option>
							</select>
						</span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">顺序号：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="ordernum" type="text" class="input-text" value="${shopoils.ordernum}" onkeyup="num(this)" size="10">
					</div>
					<span>(产品展示的前后顺序)</span>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnsave" class="btn btn-primary" onclick="savedata();" role="button">保 存</a>
						<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
					</div>
				</div>
				<input type="hidden" id="shopoilsid" value="${shopoils.shopoilsid}">
				<input type="hidden" id="shopid" value="${shopoils.shopid}">
				<input type="hidden" id="oilsid" value="${shopoils.oilsid}">
				<!-- 加油站模态框（Modal） -->
				<div class="modal fade" id="shopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="width:700px;height:600px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="shopModalTitle">加油站列表</h4>
							</div>
							<div class="modal-body">
								<table class="table-bordered" id="shoptable"></table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>	
								<button id="shopok" type="button" class="btn btn-primary" data-trigger="click" title="提示"  onclick="okshop();"
										data-container="body" data-placement="auto left" data-content="请单击选择加油站！">确定
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 产品框（Modal） -->
				<div class="modal fade" id="oilsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="width:700px;height:600px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" >产品列表</h4>
							</div>
							<div class="modal-body">
								<table class="table-bordered" id="oilstable"></table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
								<button id="oilsok" type="button" class="btn btn-primary" data-trigger="click" title="提示"  onclick="okoils();"
										data-container="body" data-placement="auto left" data-content="请单击选择某一项产品！">确定
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>		
	</body>
	<script type="text/javascript">
		var rowindex="";		
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200;
		jQuery(function($) {
			$("#btnSubmit").click(function() {
				savedata();
			});			
			$("#runtime").datetimepicker({
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
		});
		function selectshop(){
			$('#shoptable').bootstrapTable(	{
				pagination : true,
				showLoading : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 'All' ],
				height:300,
				clickToSelect: true,
				singleSelect: true,
				columns : [{checkbox:true,title:'选择'},
				{field:'nums',title : '#',align : 'center',width : 30,
					formatter : function(value, row, index) {return index + 1;}
				},
				{field : 'shopcode',title : '加油站编码',width : 80,sortable : true,align : "center"},
				{field : 'shopname',title : '加油站名称',width : 150,sortable : true,align : "left"},				
				{field : "status",title : "状态",width : 50,sortable : true,align : "center",
					formatter : function(cellvalue,options, row) {
						var result = "";
						if (cellvalue =="") {
							result = "异常";
						} else if (cellvalue=="0") {
							result = "禁用";
						} else if (cellvalue=="1") {
							result = "启用";
						}
						return result;
					}
				},{field:'shopid',title:'shopid',visible:false}],
				onClickRow: function(row, $element) { 
			        index = $element.data('index');
			        console.log(index);
			    }
			});
			//获取
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/getShopByRight",
				dataType : "json",
				//data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					console.log(result);
					$("#shoptable").bootstrapTable("load", result);
				},
				error : function(errorMsg) { }
			}); 
			$("#shopModal").modal("show"); 
		}
		function stateFormatter(value, row, index) {
            if (row.state == true)
                return {
                    disabled : true,//设置是否可用
                    checked : true//设置选中
                };
            return value;
        }
		function selectoils(){
			$('#oilstable').bootstrapTable(	{
				pagination : true,
				showLoading : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 'All' ],
				height:300,
				clickToSelect: true,
				singleSelect: true,
				columns : [{checkbox:true,title:'选择'},
				{field:'nums',title : '#',align : 'center',width : 30,
					formatter : function(value, row, index) {return index + 1;}
				},
				{field : 'oilscode',title : '产品编码',width : 80,align : "center"},
				{field : 'oilsname',title : '产品名称',width : 150,align : "left"},
				{field : 'oilstype',title : '产品类型',width : 150,align : "center",
					formatter : function(cellvalue,options, row) {
						var result = "";
						if (cellvalue=="0") {
							result = "未知";
						} else if (cellvalue=="1") {
							result = "汽油";
						} else if (cellvalue=="2") {
							result = "柴油";
						}
						return result;
					}
				},		
				{field : "status",title : "状态",width : 50,align : "center",
					formatter : function(cellvalue,options, row) {
						var result = "";
						if (cellvalue=="0") {
							result = "禁用";
						} else if (cellvalue=="1") {
							result = "启用";
						}
						return result;
					}
				},{field:'oilsid',title:'oilsid',visible:false}]
			});
			//获取
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/oils/getDicOilsAllList",
				dataType : "json",
				//data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					console.log(result);
					$("#oilstable").bootstrapTable("load", result);
				},
				error : function(errorMsg) { }
			}); 
			$("#oilsModal").modal("show"); 
		}
		function savedata(){
			var tshopname=$("#shopname").val();
			if(tshopname==""||tshopname==null){
				toastr.warning("请选择加油站！");
				return;
			}
			var tshopid=$("#shopid").val();
			if(tshopid==""||tshopid==null){
				toastr.warning("加油站无效，请重新选择！");
				return;
			}
			var toilsname=$("#oilsname").val();
			if(toilsname==""||toilsname==null){
				toastr.warning("请选择产品！");
				return;
			}
			var toilsid=$("#oilsid").val();
			if(toilsid==""||toilsid==null){
				toastr.warning("产品无效，请重新选择！");
				return;
			}
			var tsourceprice=$("#sourceprice").val();
			if(tsourceprice==""||tsourceprice<="0"){
				toastr.warning("请输入产品源价！");
				return;
			}
			var tpayprice1=$("#payprice1").val();
			if(tpayprice1==""||tpayprice1<="0"||tpayprice1>tsourceprice){
				toastr.warning("请输入现价-周一，且小于等于源价！");
				return;
			}
			var tpayprice2=$("#payprice2").val();
			if(tpayprice2==""||tpayprice2<="0"||tpayprice2>tsourceprice){
				toastr.warning("请输入现价-周二，且小于等于源价！");
				return;
			}
			var tpayprice3=$("#payprice3").val();
			if(tpayprice3==""||tpayprice3<="0"||tpayprice3>tsourceprice){
				toastr.warning("请输入现价-周三，且小于等于源价！");
				return;
			}
			var tpayprice4=$("#payprice4").val();
			if(tpayprice4==""||tpayprice4<="0"||tpayprice4>tsourceprice){
				toastr.warning("请输入现价-周四，且小于等于源价！");
				return;
			}
			var tpayprice5=$("#payprice5").val();
			if(tpayprice5==""||tpayprice5<="0"||tpayprice5>tsourceprice){
				toastr.warning("请输入现价-周五，且小于等于源价！");
				return;
			}
			var tpayprice6=$("#payprice6").val();
			if(tpayprice6==""||tpayprice6<="0"||tpayprice6>tsourceprice){
				toastr.warning("请输入现价-周六，且小于等于源价！");
				return;
			}
			var tpayprice7=$("#payprice7").val();
			if(tpayprice7==""||tpayprice7<="0"||tpayprice7>tsourceprice){
				toastr.warning("请输入现价-周日，且小于等于源价！");
				return;
			}
			var truntime=$("#runtime").val();
			if(truntime==""||truntime<="0"){
				toastr.warning("请输入调价日期！");
				return;
			}
			var tstatus=$("#status").val();
			if(tstatus==""||tstatus==null){
				toastr.warning("请选择状态！");
				return;
			}
			var tordernum=$("#ordernum").val();
			if(tordernum==""||tordernum==null){
				toastr.warning("请输入顺序号！");
				return;
			}
			var rowData={"shopid":tshopid,"oilsid":toilsid,"sourceprice":tsourceprice,"payprice1":tpayprice1,
					"payprice2":tpayprice2,"payprice3":tpayprice3,"payprice4":tpayprice4,"payprice5":tpayprice5,
					"payprice6":tpayprice6,"payprice7":tpayprice7,"status":tstatus,"shopoilsid":$("#shopoilsid").val(),
					"runtime":truntime,"ordernum":tordernum};
			console.log(JSON.stringify(rowData));	
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shopOils/saveShopOils",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);	
					console.log(result);
					if(result.code=="SS01"){
						toastr.success(result.info);
						if($("#shopoilsid").val()==""||$("#shopoilsid").val()==null) cleardata();					 
					}else if(result.code=="KEY00"){
						toastr.error("油价超出最高限定！");
					}else{
						toastr.error(result.info);
					}
				},
				error : function(errorMsg) {
					console.log(errorMsg);
					toastr.error("数据保存异常，请联系管理员！");
				}
			}); 
		}
		function okshop(){
			var rowobj= $("#shoptable").bootstrapTable('getSelections');			
			if(rowobj.length==1){
				$("#shopid").val(rowobj[0].shopid);
				$("#shopname").val(rowobj[0].shopname);
				$("#shopModal").modal("hide"); 
			}else{
				$("#shopok").popover("show");  
				setTimeout(function(){$("#shopok").popover("destroy");},1000);
			}
		}
		function okoils(){			
			var rowobj= $("#oilstable").bootstrapTable('getSelections');
			if(rowobj.length==1){
				$("#oilsid").val(rowobj[0].oilsid);
				$("#oilsname").val(rowobj[0].oilsname);
				$("#oilsModal").modal("hide"); 
			}else{
				$("#oilsok").popover("show");  
				setTimeout(function(){$("#oilsok").popover("destroy");},1000);
			}
		}
		function cleardata(){
			$("#soilslogid").val("");
			$("#shopid").val("");
			$("#shopname").val("");
			$("#oilsid").val("");
			$("#oilsname").val("");
			$("#sourceprice").val("");
			$("#payprice1").val("");
			$("#payprice2").val("");
			$("#payprice3").val("");
			$("#payprice4").val("");
			$("#payprice5").val("");
			$("#payprice6").val("");
			$("#payprice7").val("");
			$("#runtime").val("");			
			$("#ordernum").val("");
			$("#status").val("");			
		}
		//保留两位小数
		function num(obj){
			obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
			obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
			obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
			obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
			obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数			
			console.log(obj.value);
		}
	</script>
</html>