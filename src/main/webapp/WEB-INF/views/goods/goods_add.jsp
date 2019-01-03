<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<%-- <script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script> --%>
		<script src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/BootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet" />		
		
		<script src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>		
		
		<script	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js" type="text/javascript"	></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >		
		<script src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/resources/fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath}/resources/fileinput/js/locales/zh.js" type="text/javascript"></script>	
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		
	</head>
	<body>
		<div class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>礼品名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="goodsname" type="text" class="input-text" value="${goods.goodsname}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">礼品描述：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input id="goodsdesc" type="text" class="input-text" value="${goods.goodsdesc}"  >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>礼品价格：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="price" type="text" class="input-text" value="${goods.price}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所需积分：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="integral" type="text" class="input-text" value="${goods.integral}" >
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
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>礼品类型：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
						<select id="goodstype" class="select">
							<option value="">请选择</option>
							<option value="1">积分礼品</option>
							<option value="2">自营商品</option>
						</select>
						</span>
					</div>
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态：</label>
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
				<form enctype="multipart/form-data" id="form0" name="form0" >
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>礼品图片：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filegoodsimg" name="filegoodsimg" type="file" ></div>
						</div> 
					</div> 	
				</form>	 
				<hr>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnsave" class="btn btn-primary" onclick="savedata();" role="button">保 存</a>
						<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
					</div>
				</div>
				<input type="hidden" id="goodsid" value="${goods.goodsid}">	
				<input type="hidden" id="hstatus" value="${goods.status}">	
				<input type="hidden" id="hgoodstype" value="${goods.goodstype}">	
				<input type="hidden" id="goodsimg" value="${goods.goodsimg}">	
			</form>
		</div>		
	</body>
	<script type="text/javascript">
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200; 
		jQuery(function($) {
			$('#status').val($("#hstatus").val());
			$('#goodstype').val($("#hgoodstype").val());
			$("#btnSubmit").click(function() {
				savedata();
			});
			initfileinput();
		});
		function savedata(){
			var gname=$("#goodsname").val();
			if(gname==""||gname==null){
				toastr.warning("请输入礼品名称！");
				return;
			}
			var gprice=$("#price").val();
			if(gprice==""||gprice==null){
				toastr.warning("请输入礼品价格！");
				return;
			}
			var gtype=$("#goodstype").val();
			if(gprice==""||gprice==null||gprice=="0"){
				toastr.warning("请选择礼品类型！");
				return;
			}
			var gintegral=$("#integral").val();
			if(gintegral==""||gintegral==null||gintegral=="0"){
				toastr.warning("请输入礼品积分！");
				return;
			}
			var gstatus=$("#status").val();
			if(gintegral==""||gintegral==null||gintegral=="0"){
				toastr.warning("请选择礼品状态！");
				return;
			}
			var rowData={"goodsid":$("#goodsid").val(),"goodsname":$("#goodsname").val(),
			"goodsdesc":$("#goodsdesc").val(),"price":$("#price").val(),
			"goodstype":$("#goodstype").val(),"goodspack":$("#goodspack").val(),
			"brandname":$("#brandname").val(),"integral":$("#integral").val(),
			"status":$("#status").val(),"goodsimg":$("#goodsimg").val()};
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/goods/saveGoods",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="001"){
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
		function initfileinput(){
			//商家油站图
			$("#filegoodsimg").fileinput({
				language: 'zh', //设置语言 
				uploadUrl:'/yh/upload/uploadBlog',
				enctype: 'multipart/form-data',
				allowedFileExtensions : ['jpg', 'png','bmp','jpeg'],//接收的文件后缀
				uploadAsync: false,
				showUpload: false, //是否显示上传按钮
				showPreview: true, //展前预览
				showCaption: false,//是否显示标题     
				showRemove :false,
				theme: 'gly',
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary",
				fileType: "any",
				overwriteInitial: true,
				maxFileSize : 2048,//上传文件最大的尺寸	           
				maxFileCount: 1,
				minFileCount: 1,
				initialPreviewAsData: true,
				initialPreview:[$("#goodsimg").val()],
				layoutTemplates :{actionDelete:''}
			}).on("filebatchselected", function(event, files) {
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) { 
				$("#goodsimg").val(data.response.data.filePath) ;
			});	
		}
		function imgerror(img){
			console.log("---");
			img.src="${pageContext.request.contextPath}/resources/img/headimg.png";
			img.onerror=null;  //控制不要一直跳动
		}
	</script>
</html>