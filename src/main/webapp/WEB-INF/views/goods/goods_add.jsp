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
	</head>
	<body>
		<div class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商品名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="goodsname" type="text" class="input-text" value="${goods.goodsname}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商品描述：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="goodsdesc" type="text" class="input-text" value="${goods.goodsdesc}"  >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商品价格：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="price" type="text" class="input-text" value="${goods.price}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品类型：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
						<select id="goodstype" class="select">
							<option value="">请选择</option>
							<option value="1">积分商品</option>
							<option value="2">自营商品</option>
						</select>
						</span>
					</div>
				</div>				
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">包装规格：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="goodspack" type="text" class="input-text" value="${goods.goodspack}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">品牌名称：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="brandname" type="text" class="input-text" value="${goods.brandname}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">所需积分：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="integral" type="text" class="input-text" value="${goods.integral}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">状态：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
						<select id="status" class="select" >
							<option value="">请选择</option>
							<option value="0">待审核</option>
							<option value="1">审核失败</option>
							<option value="2">审核成功</option>
							<option value="3">冻结</option>
							<option value="4">下架</option>
							<option value="5">上架</option>
						</select>
						</span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商品图片：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img id="goodsimg" width="300" height="200" class="picture-thumb" src="${goods.goodsimg}"  onerror="imgerror(this)">
					</div>
				</div> 		 
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnsave" class="btn btn-primary" onclick="savedata();" role="button">保 存</a>
						<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
					</div>
				</div>
				<input type="hidden" id="goodsid" value="${goods.goodsid}">	
				<input type="hidden" id="hstatus" value="${goods.status}">	
				<input type="hidden" id="hgoodstype" value="${goods.goodstype}">	
			</form>
		</div>		
	</body>
	<script type="text/javascript">
		jQuery(function($) {
			$('#status').val($("#hstatus").val());
			$('#goodstype').val($("#hgoodstype").val());
			$("#btnSubmit").click(function() {
				savedata();
			});
		});
		function savedata(){
			var gname=$("#goodsname").val();
			if(gname==""||gname==null){
				alert("请输入商品名称！");
				return;
			}
			var gprice=$("#price").val();
			if(gprice==""||gprice==null){
				alert("请输入商品价格！");
				return;
			}
			var gtype=$("#goodstype").val();
			if(gprice==""||gprice==null||gprice=="0"){
				alert("请选择商品类型！");
				return;
			}
			var gintegral=$("#integral").val();
			if(gintegral==""||gintegral==null||gintegral=="0"){
				alert("请输入商品积分！");
				return;
			}
			var gstatus=$("#status").val();
			if(gintegral==""||gintegral==null||gintegral=="0"){
				alert("请选择商品状态！");
				return;
			}
			var rowData={"goodsid":$("#goodsid").val(),"goodsname":$("#goodsname").val(),
			"goodsdesc":$("#goodsdesc").val(),"price":$("#price").val(),
			"goodstype":$("#goodstype").val(),"goodspack":$("#goodspack").val(),
			"brandname":$("#brandname").val(),"integral":$("#integral").val(),
			"status":$("#status").val(),"goodsimg":$("#goodsimg").val()};
			console.log(JSON.stringify(rowData));
			console.log($("#goodsimg").val());
			//alert("000");
			//return "";
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/goods/saveGoods",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="SS01"){
						toastr.success(result.info);
					}else
						toastr.error(result.info);
					//layer_close();
				},
				error : function(errorMsg) {
					toastr.error("数据保存异常，请联系管理员！");
				}
			}); 
		}
		function imgerror(img){
			console.log("---");
			img.src="${pageContext.request.contextPath}/resources/img/headimg.png";
			img.onerror=null;  //控制不要一直跳动
		}
	</script>
</html>