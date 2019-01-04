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
		<script	type="text/javascript"	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
		
	</head>
	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油站名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopname}" name="shopname" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">详细地址：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.address}"  name="address" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人姓名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leadername}" name="leadername" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人电话：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leadertel}" name="leadertel" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人邮箱：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leaderemail}" name="leaderemail" readonly>
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnSubmit" class="btn btn-primary" role="button">保 存</a>
					</div>
				</div>	
			</form>
		</div>
		<input type="hidden" id="shopid" value="${shop.shopid}">
	</body>
	<script type="text/javascript">
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200;
		jQuery(function($) {
			$("#btnSubmit").click(function() {
				submitdata();
			});
		});
		function submitdata(){
			toastr.warning("正在开发中！");
			return;
			if($("#accountbank").val()==null||$("#accountbank").val()==""){
				toastr.warning("开户银行不能为空！");
				return ;
			}
			if($("#accountnums").val()==null||$("#accountnums").val()==""){
				toastr.warning("开户银行卡号不能为空！");
				return ;
			} 
			if($("#accountname").val()==null||$("#accountname").val()==""){
				toastr.warning("开户人姓名不能为空！");
				return ;
			} 
			var rowData = {"shopid":$("#shopid").val(),"accountbank":$("#accountbank").val(),
					"accountnums":$("#accountnums").val(),"accountname":$("#accountname").val()};
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/submitShopSetting",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="SS01"){
						toastr.success(result.info);
					}else{
						toastr.error(result.info);
					}
				},
				error : function(errorMsg) {
				}
			});
		} 
	</script>
</html>