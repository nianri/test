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
						<input id="shopname" type="text" class="input-text" value="${coupon.shopname}">						
					</div>
					<a id="selectshop" class="btn btn-primary" onclick="selectshop();" role="button">请选择...</a>
				</div>							
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">优惠券名称：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="couponname" type="text" class="input-text" value="${coupon.couponname}" >
					</div>				
				</div>				
				<%-- <div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">优惠券描述：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="coupondesc" type="text" class="input-text" value="${coupon.coupondesc}" >
					</div>
				</div> --%>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">起始日期：</label>					 
					<div class="formControls col-xs-8 col-sm-3">
						 <div class="input-append date" >
						    <input class="input-text" size="16" type="text" id="begintime" readonly value="${coupon.begintime}">
						    <span class="add-on"><i class="icon-th"></i></span>
						</div> 				
					</div>					
				</div>	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">结束效期：</label>					 
					<div class="formControls col-xs-8 col-sm-3">
						 <div class="input-append date" >
						    <input class="input-text" size="16" type="text" id="endtime" readonly value="${coupon.endtime}">
						    <span class="add-on"><i class="icon-th"></i></span>
						</div> 				
					</div>					
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">优惠券金额：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="couponprice" type="text" class="input-text" value="${coupon.couponprice}" onkeyup="num(this)" size="10">
					</div>
					<span>(元/张)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">总优惠数量：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="totalnums" type="text" class="input-text" value="${coupon.totalnums}" onkeyup="value=value.replace(/[^\d]/g,'')">
					</div>
					<span>(张)</span>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">消费额：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="fullamount" type="text" class="input-text" value="${coupon.fullamount}" onkeyup="num(this)" size="10">
					</div>
					<span>(元)</span>
				</div>				 
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">状态：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
							<select id="status" class="select" >
								<option value="">请选择</option>
								<option value = "0" ${coupon.status=="0"?'selected':''}>待定</option>
								<option value = "1" ${coupon.status=="1"?'selected':''}>下架</option>
								<option value = "2" ${coupon.status=="2"?'selected':''}>上架</option>
							</select>
						</span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">备注：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="memo" type="text" class="input-text" value="${coupon.memo}" >
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnsave" class="btn btn-primary" onclick="savedata();" role="button">保 存</a>
						<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
					</div>
				</div>
				<input type="hidden" id="shopid" value="${coupon.shopid}">
				<input type="hidden" id="couponid" value="${coupon.couponid}">
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
				},{field:'shopid',title:'shopid',visible:false}]				
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
			var tcouponname=$("#couponname").val();
			if(tcouponname==""||tcouponname==null){
				toastr.warning("请输入优惠券名称！");
				return;
			}
			var tbegintime=$("#begintime").val();
			if(tbegintime==""||tbegintime==null){
				toastr.warning("请输入起始日期！");
				return;
			}
			var tendtime=$("#endtime").val();
			if(tendtime==""||tendtime==null){
				toastr.warning("请输入结束日期！");
				return;
			}
			tbegintime=new Date(tbegintime.replace("-", "/").replace("-", "/"));
			tendtime=new Date(tendtime.replace("-", "/").replace("-", "/"));
			if(tbegintime>tendtime){
				toastr.warning("请输入正确的起至日期！");
				return;
			}
			var tcouponprice=$("#couponprice").val();
			if(tcouponprice==""||parseFloat(tcouponprice)<=0){
				toastr.warning("请优惠券金额！");
				return;
			}
			var ttotalnums=$("#totalnums").val();
			if(ttotalnums==""||parseFloat(ttotalnums)<=0){
				toastr.warning("请输入优惠数量！");
				return;
			}
			var tfullamount=$("#fullamount").val();
			if(tfullamount==""||parseFloat(tfullamount)<=0){
				toastr.warning("请输入消费额！");
				return;
			}
			if(parseFloat(tfullamount)<=parseFloat(tcouponprice)){
				toastr.warning("消费额必须大于优惠金额！");
				return;
			}
			var tstatus=$("#status").val();
			if(tstatus==""||tstatus==null){
				toastr.warning("请选择状态！");
				return;
			}
			
			var rowData={"shopid":tshopid,"couponid":$("#couponid").val(),"couponname":tcouponname,
					"begintime":tbegintime,"endtime":tendtime,"couponprice":tcouponprice,"totalnums":ttotalnums,
					"fullamount":tfullamount,"status":tstatus,"memo":$("#memo").val()};
			console.log(JSON.stringify(rowData));	
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/coupon/saveCoupon",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);	
					console.log(result);
					if(result.code=="SS01"){
						toastr.success(result.info);
						if($("#couponid").val().length>0) {
							//layer_close();
						}else
							cleardata();
					}else {
						toastr.error(result.info);	
					}
				},
				error : function(errorMsg) {
					console.log(errorMsg);
					toastr.error("数据保存异常，请联系管理员！");
				}
			}); 
		}		
		function cleardata(){
			$("#couponid").val("");
			$("#shopid").val("");
			$("#shopname").val("");
			$("#couponname").val("");
			//$("#coupondesc").val("");
			$("#begintime").val("");
			$("#endtime").val("");
			$("#couponprice").val("");			
			$("#totalnums").val("");
			$("#fullamount").val("");
			$("#status").val("");
			$("#memo").val("");
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