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
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap-table.min.css"	rel="stylesheet">
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap-table.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap-table-zh-CN.min.js"></script>
		<style>
			img{height:300px;width:350px;}
		</style>
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
						<input type="text" class="input-text" value="${shop.areadesc}"  name="address" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商家服务(限20字)：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopservice}"  id="shopservice" readonly>
					</div>
				</div>							
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人姓名：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadername}" id="leadername" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">负责人电话：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadertel}" id="leadertel" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人邮箱：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leaderemail}" id="leaderemail" readonly>
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商户号：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.cusid}" id="cusid" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">商户星级：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<select id="shoplevel" class="form-control m-b">
							<option value="1">1级</option>
							<option value="2">2级</option>
							<option value="3">3级</option>
							<option value="4" selected>4级</option>
							<option value="5">5级</option>
						</select>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商户AppId：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="appid" type="text" class="input-text" value="${shop.appid}" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">商户AppKey：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="appkey" type="text" class="input-text" value="${shop.appkey}" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户行：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id=accountbank type="text" class="input-text" value="${shop.accountbank}" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">开户账号：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="accountnums" type="text" class="input-text" value="${shop.accountnums}" readonly >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户人：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="accountname" type="text" class="input-text" value="${shop.accountname}" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商家油站图：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="shopimg" width="500" height="300" class="img-rounded" src="${shop.shopimg}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">营业执照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="licenseimg" width="500" height="300" class="img-rounded" src="${shop.licenseimg}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">成品油许可证：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="prolicenseimg" width="500" height="300" class="img-rounded" src="${shop.prolicenseimg}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">身份证正面照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="cardtop" width="500" height="300" class="img-rounded" src="${shop.cardtop}">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">身份证反面照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="carddown" width="500" height="300" class="img-rounded" src="${shop.carddown}">
					</div>
				</div> 
			</form>
		</div>
		<div class="breadcrumb">审核意见记录</div>
		<div class="ibox-content">
			<span class="col-sm-2"> 
			</span>
			<div style="margin:10px 10px 10px 10px; height: 200px;">
				<table class="table-bordered" id="showtable"></table>
			</div>
		</div>
		<input type="hidden" id="shopid" value="${shop.shopid}">
	</body>
	<script type="text/javascript">
		jQuery(function($) {
			$('#showtable').bootstrapTable(	{
				pagination : true,
				showLoading : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 'All' ],
				columns : [
				{field : 'nums',title : '#',align : 'center',width : 30,
					formatter : function(value, row, index) {return index + 1;}
				},
				{field : 'submittime',title : '提交日期',width:100,align : "center"},
				{field : 'submitname',title : '提交人',width:100,align : "left"},				
				{field : "checktime",title : "审核日期",	width : 100,align : "center"},
				{field : 'auditorname',title : '审核人',width:100,align : "left"},
				{field : 'checkdesc',title : '审核意见',width:200,align : "left"},
				{field : "status",title : "状态",width : 50,sortable : true,align : "center",
					formatter : function(cellvalue,options, row) {
						var result = "";//0.否 1.是
						if(cellvalue == "0"){
							result='待审核';
						}else if(cellvalue == "1"){
							result='审核未通过';
						}else if(cellvalue == "2"){
							result='审核通过';
						};					
						return result;					
					}
				}]		
			});	
			bindshopcheck();
		});
		function bindshopcheck(){
			console.log($("#shopid").val());
			if($("#shopid").val()==""||$("#shopid").val()==null) return;
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/shop/getShopCheckLog/"+$("#shopid").val(),
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);	
					console.log(result);
					$("#showtable").bootstrapTable("load", result);
				},
				error : function(errorMsg) {}
			});
		}
	</script>
</html>