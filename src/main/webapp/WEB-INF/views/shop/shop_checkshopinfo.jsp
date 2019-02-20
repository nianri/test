<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />	
		
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/BootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet" />	
		
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script	type="text/javascript"	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
		<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=F8xxgmeOcjHWtPiOS75AoVq35OBWVPNl"></script>
		<style type="text/css">
			/* img{height:300px;width:350px;} */
			body,html,#allmap {width:100%;height:90%;overflow: false;margin:0;font-family:"微软雅黑";}			
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
					<label class="form-label col-xs-4 col-sm-2">地址：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.address}"  name="address" readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人姓名：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadername}" name="leadername" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">负责人电话：</label>
					<div class="formControls col-xs-8 col-sm-3">
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
					<label class="form-label col-xs-4 col-sm-2">商家服务：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopservice}" name="shopservice" readonly>
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
						<select id="shoplevel" class="form-control m-b"  >
							<option value="1">1级</option>
							<option value="2">2级</option>
							<option value="3">3级</option>
							<option value="4" >4级</option>
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
						<input id=accountbank type="text" class="input-text" value="${shop.accountbank}" readonly >
					</div>
					<label class="form-label col-xs-4 col-sm-2">开户账号：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="accountnums" type="text" class="input-text" value="${shop.accountnums}"   readonly>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户人：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="accountname" type="text" class="input-text" value="${shop.accountname}" readonly>
					</div>
				</div>
				<hr>	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">油站实景照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img src="${shop.shopimg}" class="img-rounded" style="height:300px;width:350px;">
					</div>
				</div>		
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">营业执照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img src="${shop.licenseimg}" class="img-rounded" style="height:300px;width:350px;">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">成品油许可证：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img src="${shop.prolicenseimg}" class="img-rounded" style="height:300px;width:350px;">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">身份证正面照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img src="${shop.cardtop}" class="img-rounded" style="height:300px;width:350px;">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">身份证反面照：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img src="${shop.carddown}" class="img-rounded" style="height:300px;width:350px;">
					</div>
				</div>
			</form>
		</div>
		<hr><hr>
		<div style="height:500px;text-align: center;margin:1px 20px 0px 20px;">
			<div id="allmap" ></div>	
		</div>
		<div class="page-container">
			<div class="form form-horizontal">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">经度：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text"  id="longitude" value="${shop.longitude}" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">伟度：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text"  id="latitude" value="${shop.latitude}" readonly>
					</div>
				</div>
			</div>
		</div>
		<div class="breadcrumb">审核意见区</div>
		<div class="page-container">
			<div class="form form-horizontal">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>审核是否通过：</label>
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
		<input type="hidden" id="longitude" value="${shop.longitude}">
		<input type="hidden" id="latitude" value="${shop.latitude}">
		<input type="hidden" id="shopimg" value="${shop.shopimg}">
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
				map.centerAndZoom(new BMap.Point(posx, posy), 18); 
				var marker = new BMap.Marker(new BMap.Point(posx, posy));  // 创建标注
				map.addOverlay(marker);               // 将标注添加到地图中
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			}else{
				map.centerAndZoom("北京市", 11); 
			}		
			//map.enableScrollWheelZoom(false); //开启鼠标滚轮缩放
			
			$("#btnSubmit").click(function() {
				submitcheck();
			});
		});
		function submitcheck(){
			if($("input[name='checkstatus']:checked").val()==null||$("input[name='checkstatus']:checked").val()==""){
				toastr.warning("请选择审核是否通过！");
				return;
			}
			if($("#checkdesc").val().trim().length<=0){
				toastr.warning("请输入审核意见！");
				return;
			}
			var rowData = {"checkdesc":$("#checkdesc").val(),"status":$("input[name='checkstatus']:checked").val(),
							"scheckid":$("#scheckid").val(),"shopid":$("#shopid").val()};
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/commitCheckShop",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					console.log(result);
					if(result.code=="001"){
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