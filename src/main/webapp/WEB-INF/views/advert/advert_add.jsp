<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
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
		<script src="${pageContext.request.contextPath}/resources/layer/2.4/layer.js" type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		
	</head>
</head>
<body>
	<div class="page-container">
		<form action="" method="post" class="form form-horizontal" id="form-article-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">广告名称：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input id="advertname" placeholder="广告名称" type="text"  class="form-control" value="${advertInfo.advertname}">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">广告所属地址：</label>
				<div class="formControls col-xs-8 col-sm-9">			
				    <select id="selprovince" class="selectpicker" ></select>
					<select id="selcity" class="selectpicker" ></select>				
			 	</div> 
			</div>  	            
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">广告类型：</label>
				<div class="formControls col-xs-8 col-sm-9">	
					<select id="seladverttype" class="selectpicker">
					  <option value="" >请选择</option>
					  <option value="0" >系统广告</option>
					  <option value="1" >市级广告</option>
					</select>						
				</div>					
			</div>	
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">广告状态：</label>
				<div class="formControls col-xs-8 col-sm-9">	
					<select id="selstatus" class="selectpicker">
					  <option value="" >请选择</option>
					  <option value="0" >待定</option>
					  <option value="1" >下线</option>
					  <option value="2" >上线</option>
					</select>						
				</div>					
			</div>	
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">广告链接：</label>
				<div class="formControls col-xs-8 col-sm-9">	
					<input id="detailpage" placeholder="广告链接" type="text" class="form-control" value="${advertInfo.detailpage}">
				</div>
			</div>
			<form enctype="multipart/form-data" id="form0" name="form0" >	    
                <div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">广告图片：</label>
					<div class="formControls col-xs-8 col-sm-9">	
						<div class="file-loading"><input id="fileimage" name="fileimage" type="file" ></div> 
					 </div>
				</div>	
			</form>	
			<hr>
			<div class="page-container">
				<div class="row cl">
					<div style="text-align: center;">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">	
							<a id="btnsave" class="btn btn-primary" onclick="datasave();" role="button">保 存</a>
							<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="provinceid" value="${advertInfo.provinceid}">
            <input type="hidden" id="cityid" value="${advertInfo.cityid}">
            <input type="hidden" id="imageurl" value="${advertInfo.imageurl}">
            <input type="hidden" id="advertid" value="${advertInfo.advertid}"> 
            <input type="hidden" id="status" value="${advertInfo.status}"> 
            <input type="hidden" id="adverttype" value="${advertInfo.adverttype}">                
		</form>
	</div>
</body>

<script type="text/javascript">
/* 链接广告、单品广告、商品类别、多个商品 */
//广告名字不能超过25字符
toastr.options.positionClass = 'toast-top-center';
toastr.options.timeOut = 1200;
 
$(document).ready(function () {	
    binddata(); 
});
//初始化数据
function binddata(){
	$('#selprovince').append("<option value='0'>请选择省份</option>");
	$('#selcity').append("<option value='0'>请选择市</option>");
    $('#selprovince').on('changed.bs.select', function (e) {
    	$('#selcity').empty();
        $('#selcity').append("<option value='0'>请选择市</option>"); 
       	getcity($('#selprovince').selectpicker('val'),"");        
    }); 
	$('#selstatus').selectpicker('refresh');
	getprovince($("#provinceid").val());
	
	if($("#advertid").val()!==""&& $("#advertid").val()!=null){
	    $('#selstatus').selectpicker('val',$("#status").val());
	    $('#seladverttype').selectpicker('val',$("#adverttype").val());
		getcity($('#provinceid').val(),$('#cityid').val());  
	}else{
	    //$('#selstatus').selectpicker('val',"2");
	} 
    initimage();
}
function initimage(){
	$("#fileimage").fileinput({
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
		initialPreview:[$("#imageurl").val()],
		layoutTemplates :{actionDelete:''}
	}).on("filebatchselected", function(event, files) {
		$(this).fileinput("upload");
	}).on("filebatchuploadsuccess", function(event, data) { 
		$("#imageurl").val(data.response.data.filePath) ;
	});	
}
//获取或设置省
function getprovince(value){
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/advertin/getArea/0",
		dataType : "json",
		contentType : 'application/json',
		success : function(result) {
			$.each(eval(result), function (k, p) {
				var option = "<option value='" + p.areaid + "'>" + p.areaname + "</option>";
				$("#selprovince").append(option);
			});
			$("#selprovince").selectpicker('refresh');
			if(value!=""){
				$("#selprovince").selectpicker('val',value);
			}else
				$("#selprovince").selectpicker('val', '0');			 
		},
		error : function(errorMsg) {
			console.log(errorMsg);
		}
	});
}
//获取或设置市
function getcity(parentid,value){
	if(parentid==""||parentid==null) return;
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/advertin/getArea/"+parentid,
		dataType : "json",
		contentType : 'application/json',
		success : function(result) {
			$.each(eval(result), function (k, p) {
				var option = "<option value='" + p.areaid + "'>" + p.areaname + "</option>";
				$("#selcity").append(option);
			});
			$("#selcity").selectpicker('refresh');
			if(value!=""){
				$("#selcity").selectpicker('val',value);
			}else
				$("#selcity").selectpicker('val', '0');		
			
		},
		error : function(errorMsg) {
			console.log(errorMsg);
		}
	});
}

//保存
function datasave(){
	
	var tprovinceid=$('#selprovince').selectpicker('val').toString();
	var tcityid=$('#selcity').selectpicker('val').toString();
	
	if($("#advertname").val().trim()==""){
		toastr.warning("请填写广告名称！");
		return ;
	}
	if(tprovinceid=="0"||tcityid=="0"){
		toastr.warning("请选择省、市");
		return ;
	}
	if($("#selstatus").val()==""){
		toastr.warning("请选择状态！");
		return ;
	}
	if($("#seladverttype").val()==""){
		toastr.warning("请选择广告类型！");
		return ;
	}
	if($("#imageurl").val()==""){
		toastr.warning("请上传广告图片！");
		return ;
	} 
	var rowData={"advertid":$("#advertid").val(),"advertname":$("#advertname").val(),"imageurl":$("#imageurl").val(),
			"status":$('#selstatus').selectpicker('val'),"detailpage":$("#detailpage").val(),
			"provinceid":tprovinceid,"cityid":tcityid,"adverttype":$('#seladverttype').selectpicker('val')};
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/advertin/saveAdvert",
		dataType : "json",
		data : JSON.stringify(rowData),
		contentType : 'application/json',
		success : function(result) {
			result = eval(result);
			console.log(result);
			if(result.code=="001"){
				datainit();
				toastr.success(result.info);
			}else{
				toastr.error("数据保存异常，请联系管理员！");
			}
		},
		error : function(errorMsg) {
			toastr.error(result.info);	
		}
	});
}
function datainit(){
	$("#selprovince").selectpicker('val',"0");
	$("#selcity").selectpicker('val',"0");
	$("#selcounty").selectpicker('val',"0");
	$("#advertid").val("");
	$("#advertname").val("")
	$("#imageurl").val(""),	
	$("#detailpage").val("");
	$("#provinceid").val("");
	$("#cityid").val("");
	$("#status").val("");
	$("#selstatus").selectpicker('val',"");
	$("#adverttype").val("");
	$("#seladverttype").selectpicker('val',"");
	binddata(); 
}

/*关闭iframe layer_close */
function removeIframe(){
	var topWindow = $(window.parent.document),
		iframe = topWindow.find('#iframe_box .show_iframe'),
		tab = topWindow.find(".acrossTab li"),
		showTab = topWindow.find(".acrossTab li.active"),
		showBox=topWindow.find('.show_iframe:visible'),
		i = showTab.index();
	tab.eq(i-1).addClass("active");
	tab.eq(i).remove();
	iframe.eq(i-1).show();	
	iframe.eq(i).remove();
} 

</script>
</html>