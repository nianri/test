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
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js" type="text/javascript"	></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
		<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/BootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet" />
		
		<script src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/resources/fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath}/resources/fileinput/js/locales/zh.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油站名称<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopname}" name="shopname" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">所属位置<span style="color:red">*</span>：</label>
					<div class="col-sm-9" >		 		
					    <select id="selprovince" class="selectpicker" ></select>
						<select id="selcity" class="selectpicker" ></select>	
						<select id="selcounty" class="selectpicker" ></select>			
				 	 </div>
				</div> 	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">详细地址<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.address}"  name="address" >
					</div>
				</div>								
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人姓名<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadername}" name="leadername" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">负责人电话<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadertel}" name="leadertel" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人邮箱<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.leaderemail}" name="leaderemail" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商家服务(限20字)：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopservice}"  name="shopservice" >
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">通联商户号<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.cusid}" id="accountname" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">商户星级<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<select id="status" class="form-control m-b">
							<option value="1">1级</option>
							<option value="2">2级</option>
							<option value="3">3级</option>
							<option value="4" selected>4级</option>
							<option value="5">5级</option>
						</select>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">通联AppId<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="goodspack" type="text" class="input-text" value="${shop.longitude}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">通联AppKey<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="brandname" type="text" class="input-text" value="${shop.latitude}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">经纬度<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="goodspack" type="text" class="input-text" value="${shop.longitude},${shop.latitude}" disabled="disabled" >
					</div>
					<div class="formControls col-xs-8 col-sm-3">
						<a class="btn btn-primary" onclick="searchmap()" role="button">获取...</a>	
						</div>			
				</div>
				<hr>
				<form enctype="multipart/form-data" id="form0" name="form0" >
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">商家油站图<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="fileshopimg" name="fileshopimg" type="file"  ></div> 
						</div>
					</div>
				</form>
				<hr>
				<form enctype="multipart/form-data" id="form1" name="form1" >
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">营业执照<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filelicenseimg" name="filelicenseimg" type="file"  ></div> 
						</div>
					</div>
				</form>
				</br>
				<form enctype="multipart/form-data" id="form2" name="form2" method="post">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">成品油许可证<span style="color:red">*</span>：</label>
						<div class="col-sm-8">						
							<div class="file-loading"><input id="fileprolicenseimg" name="fileprolicenseimg"  type="file" ></div>
						</div>
					</div>
				</form>
				</br>
				<form enctype="multipart/form-data" id="form3" name="form3">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">身份证正面照<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filecardtop" name="filecardtop" type="file" ></div>
						</div>
					</div>
				</form>
				</br>
				<form enctype="multipart/form-data" id="form4" name="form4">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">身份证反面照<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filecarddown" name="filecarddown" type="file" ></div>
						</div>
					</div>	
				</form>	
				</br>	
				<div class="row cl">
					<div style="text-align: center;">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
							<a id="btnSubmit" class="btn btn-primary" role="button">&nbsp;&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;&nbsp;</a>
						</div>
					</div>
				</div>	
			</form>
		</div>
		<input type="hidden" id="shopid" value="${shop.shopid}">
		<input type="hidden" id="shopimg" value="${shop.shopimg}">
		<input type="hidden" id="licenseimg" value="${shop.licenseimg}">
		<input type="hidden" id="prolicenseimg" value="${shop.prolicenseimg}">
		<input type="hidden" id="cardtop" value="${shop.cardtop}">
		<input type="hidden" id="carddown" value="${shop.carddown}">
	</body>
	<script type="text/javascript">
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200;
		$(document).ready(function(){
			$('#selprovince').append("<option value='0'>请选择省份</option>");
			$('#selcity').append("<option value='0'>请选择市</option>");
			$('#selcounty').append("<option value='0'>请选择县(区)</option>");
			$("#btnSubmit").click(function() {
				submitdata();
			});
			console.log($("#shopimg").val());
			initfileinput();
		});
		function submitdata(){
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
		function initfileinput(){
			console.log("img>"+$("#shopimg").val());
			//商家油站图
			$("#fileshopimg").fileinput({
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
				initialPreview:[$("#shopimg").val()]
			}).on("filebatchselected", function(event, files) {
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) { });	
			//营业执照
			$("#filelicenseimg").fileinput({
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
				initialPreview:[$("#licenseimg").val()]
			}).on("filebatchselected", function(event, files) {
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) { });	
			//成品油许可证
			$("#fileprolicenseimg").fileinput({  
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
				initialPreview:[$("#prolicenseimg").val()]
			}).on("filebatchselected", function(event, files) {        	  
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) {});	
			//身份证正面
			$("#filecardtop").fileinput({  
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
				initialPreview:[$("#cardtop").val()]		
			}).on("filebatchselected", function(event, files) {        	  
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) {});	
			//身份证反页
			$("#filecarddown").fileinput({  
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
				initialPreview:[$("#carddown").val()]	
			}).on("filebatchselected", function(event, files) {        	  
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) {});	
	}
	</script>
</html>