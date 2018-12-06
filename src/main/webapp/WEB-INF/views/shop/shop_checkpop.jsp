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
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=F8xxgmeOcjHWtPiOS75AoVq35OBWVPNl"></script>
		<style type="text/css">
			body,html,#allmap {width:100%;height:90%;overflow: false;margin:0;font-family:"微软雅黑";}
		</style>
	</head>
	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油站名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopname}" name="shopname" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">详细地址：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.address}"  name="address" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人姓名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leadername}" name="leadername" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人电话：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leadertel}" name="leadertel" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人邮箱：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leaderemail}" name="leaderemail" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户银行：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.accountbank}" name="accountbank" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户银行卡号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.accountnums}" name="accountnums" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户人姓名：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.accountname}" name="accountname" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">营业执照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="licenseimg" width="500" height="300" class="picture-thumb" src="${shop.licenseimg}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">成品油许可证：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="prolicenseimg" width="500" height="300" class="picture-thumb" src="${shop.prolicenseimg}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">身份证正面照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="cardtop" width="500" height="300" class="picture-thumb" src="${shop.cardtop}">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">身份证反面照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img name="carddown" width="500" height="300" class="picture-thumb" src="${shop.carddown}">
					</div>
				</div>
			</form>
		</div>
		<div class="breadcrumb">地理位置</div>
		<div id="allmap" style="margin:2px 2px 2px 2px;" ></div>	
		<div class="page-container">
			<div class="form form-horizontal">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">位置：</label>
					<div class="formControls col-xs-8 col-sm-4">
						<input type="text" class="input-text" id="posxy" >
					</div>
					<a class="btn btn-primary" onclick="searchmap()" role="button">搜 索</a>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">经伟度：</label>
					<div class="formControls col-xs-8 col-sm-5">
						<input type="text" class="input-text"  id="positionxy" disabled="disabled">
					</div>
				</div>
			</div>
		</div>
		<div class="breadcrumb">审核意见区</div>
		<div class="page-container">
			<div class="form form-horizontal">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>资质审核是否通过：</label>
					<div class="formControls col-xs-8 col-sm-9 skin-minimal">
						<div class="radio-box">
							<input type="radio" id="statusyes" name="checkstatus" value="2" >
							<label for="sex-1">是</label>
						</div>
						<div class="radio-box">
							<input type="radio" id="statusno" name="checkstatus" checked value="1">
							<label for="sex-2">否</label>
						</div>
					</div>
				</div>	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">审核意见：</label>
					<div class="formControls col-xs-8 col-sm-9 skin-minimal">
						<textarea id="checkdesc" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyup="checkdesclength(100);" ></textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
					</div>
				</div>	
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input id="btnSubmit" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						&nbsp;&nbsp;
						<input id="btnSubmit" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;关闭&nbsp;&nbsp;" onclick="layer_close();">
					</div>
				</div>	
			</div>
		</div>
		<input type="hidden" id="scheckid" value="${check.scheckid}">
		<input type="hidden" id="shopid" value="${shop.shopid}">
		<input type="hidden" id="cityname" value="${shop.cityname}">
		<input type="hidden" id="countyname" value="${shop.countyname}">
		<input type="hidden" id="longitude" value="${shop.longitude}">
		<input type="hidden" id="latitude" value="${shop.latitude}">
	</body>
	<script type="text/javascript">
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200;
		// 创建Map实例
		var map = new BMap.Map("allmap"); 
		
		jQuery(function($) {
			var posx=$("#longitude").val();
			var posy=$("#latitude").val();
			if(posx!=""&&posx!=""&&posy!=""&&posy!=""){
				$("#positionxy").val(posx+","+posy);
				map.centerAndZoom(new BMap.Point(posx, posy), 16); 
			}else{
				map.centerAndZoom("北京市", 11); 
			}
			// 初始化地图,用城市名设置地图中心点
			//map.centerAndZoom($("#cityname").val()+$("#countyname").val(), 16); 			
			map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
			map.addEventListener("click", showInfo);
			$("#btnSubmit").click(function() {
				submitcheck();
			});
			
		});
		function showInfo(e){
			$("#positionxy").val(e.point.lng + "," + e.point.lat);
			$("#longitude").val(e.point.lng);
			$("#latitude").val(e.point.lat);
			//toastr.warning("经伟度已重新选择，请提交！");
		}
		function submitcheck(){
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
			if($("#licenseimg").val()==null||$("#licenseimg").val()==""){
				toastr.warning("营业执照不能为空！");
				return ;
			}
			if($("#prolicenseimg").val()==null||$("#prolicenseimg").val()==""){
				toastr.warning("成品油许可证不能为空！");
				return ;
			}
			if($("#cardtop").val()==null||$("#cardtop").val()==""){
				toastr.warning("身份证正面照不能为空！");
				return ;
			}
			if($("#carddown").val()==null||$("#carddown").val()==""){
				toastr.warning("身份证反面照不能为空！");
				return ;
			}
			if($("input[name='checkstatus']:checked").val()=="2" && $("#positionxy").val()==""){
				toastr.warning("请选择经纬度！");
				return;
			}
			if($("#checkdesc").val().trim().length<=0){
				toastr.warning("请输入审核意见！");
				return;
			}
			var rowData = {"checkdesc":$("#checkdesc").val(),"status":$("input[name='checkstatus']:checked").val(),
							"scheckid":$("#scheckid").val(),"shopid":$("#shopid").val(),
							"longitude":$("#longitude").val(),"latitude":$("#latitude").val()};
			console.log(rowData);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/submitShopCheck",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="SS01"){
						toastr.success(result.info);
						layer_close();
					}else{
						toastr.error(result.info);
					}
				},
				error : function(errorMsg) {
				}
			});
		}
		function searchmap(){
			map.centerAndZoom($("#posxy").val(), 16); 
			map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		}
		function checkdesclength(value) { 
			var regC = /[^ -~]+/g; 
			var regE = /\D+/g; 
			var str = $("#checkdesc").val();
			if (regC.test(str)){ 
				$("#checkdesc").val($("#checkdesc").val().substr(0,value)); 
			} 
			if(regE.test(str)){ 
				$("#checkdesc").val($("#checkdesc").val().substr(0,value*2)); 
			} 
		} 
	</script>
</html>