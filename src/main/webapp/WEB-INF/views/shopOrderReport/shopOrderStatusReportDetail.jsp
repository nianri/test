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
	</head>
	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油站名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.shopname}" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">待支付订单量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.topay}" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">已支付订单量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.paid}"  disabled="disabled">
					</div>
				</div>
			
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油完成订单量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.complete}" disabled="disabled">
					</div>
				</div>	
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">申请退款订单量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.applyRefund}" disabled="disabled">
					</div>
				</div>	
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">退款完成订单量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.refundSuccess}" disabled="disabled">
					</div>
				</div>	
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">总单量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.total}" disabled="disabled">
					</div>
				</div>	
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">应收总金额：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.totalprice}" disabled="disabled">
					</div>
				</div>	
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">优惠总金额：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.couponprice}" disabled="disabled">
					</div>
				</div>	
				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">实付总金额：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.realprice}" disabled="disabled">
					</div>
				</div>	
			</form>
		</div>		
	</body>
	<script type="text/javascript">
		function imgerror(img){
			img.src="../../resources/img/headimg.png";
			img.onerror=null;  //控制不要一直跳动
		}
	</script>
</html>