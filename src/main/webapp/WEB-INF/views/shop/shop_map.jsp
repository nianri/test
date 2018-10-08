<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>地图展示</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body,html,#allmap {
	width: 100%;
	height: 50%;
	overflow: hidden;
	margin: 10 10 10 50;
	font-family: "微软雅黑";
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<script
	src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js "
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=F8xxgmeOcjHWtPiOS75AoVq35OBWVPNl"></script>
<script	type="text/javascript"	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
</head>

<body>
	<div class="page-container">
		<form class="form form-horizontal" id="form-article-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">加油站：</label>
				<div class="formControls col-xs-8 col-sm-5">
					<input type="text" class="input-text" value="${shop.shopname}" name="shopname" disabled="disabled">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">详细地址：</label>
				<div class="formControls col-xs-8 col-sm-5">
					<input type="text" class="input-text" value="${shop.address}"  disabled="disabled">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">经伟度：</label>
				<div class="formControls col-xs-8 col-sm-5">
					<input id="positionxy" type="text" class="input-text" value="${shop.positionxy}"  disabled="disabled">
				</div>
				<a id="btnsave" class="btn btn-primary" onclick="commitxy()" role="button">提 交</a>
			</div>
		</form>
	 </div>
	 <div id="allmap" ></div>
	 <div class="form form-horizontal">
		 <div class="page-container">
			 <div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">位置：</label>
				<div class="formControls col-xs-8 col-sm-5">
					<input type="text" class="input-text" id="posxy" >
				</div>
				<a class="btn btn-primary" onclick="searchmap()" role="button">搜 索</a>
			</div>
		</div>
	</div>
	 <input type="hidden" id="shopid" value="${shop.shopid}">	
</body>
<script type="text/javascript">
	toastr.options.positionClass = 'toast-top-center';
	toastr.options.timeOut = 1200;
	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	map.centerAndZoom("山东", 16); // 初始化地图,用城市名设置地图中心点
	jQuery(function($) {		
		/* var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				var mk = new BMap.Marker(r.point);
				map.addOverlay(mk);
				map.panTo(r.point);
				//alert('您的位置：'+r.point.lng+','+r.point.lat);
			}
			else {
				alert('failed'+this.getStatus());
			}        
		},{enableHighAccuracy: true}); */
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		map.addEventListener("click", showInfo);
	})
	
	function showInfo(e){
		$("#positionxy").val(e.point.lng + "," + e.point.lat);
		toastr.warning("经伟度已重新选择，请提交！");
	}
	function commitxy(){
		if($("#shopid").val().length=="") return;
		var rowData={"shopid":$("#shopid").val(),"positionxy":$("#positionxy").val()};
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/shop/saveShopXY",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);	
				console.log(result);
				if(result.code=="SS01"){
					toastr.success(result.info);					
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
	function searchmap(){
		var xyname=$("#posxy").val();
		if(xyname.length==0) {
			toastr.warning("请输入查询地点！");
			return;
		}
		map.centerAndZoom(xyname, 16);
	}
</script>
</html>
