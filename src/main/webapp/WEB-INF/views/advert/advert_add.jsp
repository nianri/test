<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="i18n" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath= request.getScheme() + "://" +request.getServerName() + ":"+ request.getServerPort() + path + "";
    String imgServer= request.getScheme() + "://" +request.getServerName() + ":8081";
    response.setHeader("Access-Control-Allow-Origin", "*");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="imgPath" value="${imgServer}"/>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<link rel="shortcut icon" href="favicon.ico"> 
	<link href="${pageContext.request.contextPath}/resources/css/home/style.min.css?v=4.1.0"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/BootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet" />
	<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/Webuploader/webuploader.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/resources/Webuploader/webuploader.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/resources/layer/2.4/layer.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
	<script	type="text/javascript"	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
	
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight ">		
		<div class="ibox-content">
			<form class="form-horizontal m-t" id="form">
			<input name="imageUrl" id="imageUrl" type="hidden"/>
				<div class="form-group">
					<label class="col-sm-3 control-label">广告名称：</label>
					<div class="col-sm-8">
						<input id="advertname" placeholder="广告名称" type="text"  class="form-control" value="${advertInfo.advertname}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">广告所属地址：</label>
					<div class="col-sm-9" >				
					    <select id="selprovince" class="selectpicker" ></select>
						<select id="selcity" class="selectpicker" ></select>	
						<select id="selcounty" class="selectpicker" ></select>							
				 	</div> 
				</div>  	            
				<div class="form-group">
					<label class="col-sm-3 control-label">广告类型：</label>
					<div class="col-sm-8">
						<select id="seladverttype" class="selectpicker">
						  <option value="" >请选择</option>
						  <option value="0" >系统广告</option>
						  <option value="1" >地域广告</option>
						</select>						
					</div>					
				</div>	
				<div class="form-group">
					<label class="col-sm-3 control-label">广告状态：</label>
					<div class="col-sm-8">
						<select id="selstatus" class="selectpicker">
						  <option value="" >请选择</option>
						  <option value="0" >待定</option>
						  <option value="1" >下线</option>
						  <option value="2" >上线</option>
						</select>						
					</div>					
				</div>		    
                <div class="form-group" id="imageuploader">
					<label class="col-sm-3 control-label">广告图片：</label>
					<div class="col-sm-8">
						<div id="uploader-demo" >
						    <!--用来存放item-->
						    <div id="fileList" class="uploader-list"></div>
						    <div id="filePicker" >选择图片...</div>
						</div>
					 </div>
				</div>	
				<div class="form-group" id="imageshow" style="display:none;">
					<label class="col-sm-3 control-label">广告图片：</label>
					<div class="col-sm-8">
						<div class="portfoliobox">
							<div class="picbox">
								<img id="imagevalue" style="width:300px;height:200px;" src="${advertInfo.imageurl}">
								<button type="button" class="btn btn-primary" onclick="reuploader()" >重新上传...</button>
							</div>							
						</div>
					</div>
				</div>				
				<div class="form-group" id="linkDiv">
					<label class="col-sm-3 control-label">广告链接：</label>
					<div class="col-sm-8">
						<input id="detailpage" placeholder="广告链接" type="text" class="form-control" value="${advertInfo.detailpage}">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-3">
						<a id="btnsave" class="btn btn-primary" onclick="datasave();" role="button">保 存</a>
						<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
					</div>
				</div>
				<input type="hidden" id="provinceid" value="${advertInfo.provinceid}">
                <input type="hidden" id="cityid" value="${advertInfo.cityid}">
                <input type="hidden" id="countyid" value="${advertInfo.countyid}">
                <input type="hidden" id="advertid" value="${advertInfo.advertid}"> 
                <input type="hidden" id="imageurl" value="${advertInfo.imageurl}"> 
                <input type="hidden" id="status" value="${advertInfo.status}"> 
                <input type="hidden" id="adverttype" value="${advertInfo.adverttype}"> 
                <input type="hidden" id=uploadImgService value="${uploadImgService}">                   
			</form>
		</div>				
	</div>
</body>

<script type="text/javascript">
/* 链接广告、单品广告、商品类别、多个商品 */
//广告名字不能超过25字符
toastr.options.positionClass = 'toast-top-center';
toastr.options.timeOut = 1200;
var uploader;
$(document).ready(function () {	
    binddata(); 
    initwebuploader();
});
//初始化数据
function binddata(){
	$('#selprovince').append("<option value='0'>请选择省份</option>");
	$('#selcity').append("<option value='0'>请选择市</option>");
	$('#selcounty').append("<option value='0'>请选择县(区)</option>");
    $('#selprovince').on('changed.bs.select', function (e) {
        $('#selcity').empty();
        $('#selcity').append("<option value='0'>请选择市</option>"); 
        $('#selcounty').empty();
        $('#selcounty').append("<option value='0'>请选择县(区)</option>"); 
        $("#selcounty").selectpicker('refresh');
       	getcity($('#selprovince').selectpicker('val'),"");        
    }); 
    $('#selcity').on('changed.bs.select', function (e) {
        $('#selcounty').empty();
        $('#selcounty').append("<option value='0'>请选择县(区)</option>");        
        getcounty($('#selcity').selectpicker('val'),"");        
    }); 
    
	$('#selstatus').selectpicker('refresh');
	if($("#advertid").val()!==""&& $("#advertid").val()!=null){
		$("#imageshow").show();
		$("#imageuploader").hide();			 
	    $('#selstatus').selectpicker('val',$("#status").val());
	    $('#seladverttype').selectpicker('val',$("#adverttype").val());
	}else{
	    //$('#selstatus').selectpicker('val',"2");
	}
	getprovince($("#provinceid").val());
    getcity($("#provinceid").val(),$("#cityid").val());
    getcounty($("#cityid").val(),$("#countyid").val());
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
//获取或设置县(区)
function getcounty(parentid,value){
	console.log(">:"+parentid+"|"+value);
	if(parentid==""||parentid==null) return;
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/advertin/getArea/"+parentid,
		dataType : "json",
		contentType : 'application/json',
		success : function(result) {
			$.each(eval(result), function (k, p) {
				var option = "<option value='" + p.areaid + "'>" + p.areaname + "</option>";
				$("#selcounty").append(option);
			});
			$("#selcounty").selectpicker('refresh');
			if(value!=""){
				$("#selcounty").selectpicker('val',value);
			}else
				$("#selcounty").selectpicker('val', '0');			 
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
	var tcountyid=$('#selcounty').selectpicker('val').toString();
	var rowData={"advertid":$("#advertid").val(),"advertname":$("#advertname").val(),"imageurl":$("#imageurl").val(),
			"status":$('#selstatus').selectpicker('val'),"detailpage":$("#detailpage").val(),
			"provinceid":tprovinceid,"cityid":tcityid,"countyid":tcountyid,"adverttype":$('#seladverttype').selectpicker('val')};
	console.log(rowData);
	if($("#advertname").val().trim()==""){
		alert("请填写广告名称！");
		return ;
	}
	if(tprovinceid=="0"||tcityid=="0"||tcountyid=="0"){
		alert("请选择省、市、县(区)！");
		return ;
	}	
	/* if($("#imageurl").val()==""){
		alert("请上传广告图片！");
		return ;
	} */
	if($("#selstatus").val()==""){
		//alert("请选择状态！");
		toastr.warning("请选择状态！");
		return ;
	}
	if($("#seladverttype").val()==""){
		toastr.warning("请选择广告类型！");
		return ;
	}
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/advertin/saveAdvert",
		dataType : "json",
		data : JSON.stringify(rowData),
		contentType : 'application/json',
		success : function(result) {
			result = eval(result);
			console.log(result);
			if(result.code=="SS01"){
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
	$("#countyid").val("");
	$("#imageurl").val("");
	$("#status").val("");
	$("#selstatus").selectpicker('val',"");
	$("#adverttype").val("");
	$("#seladverttype").selectpicker('val',"");
	//$("#imageshow").hide();
	//$("#imageuploader").show();
	$("#fileList").children('div').remove(); 
	$("#imagevalue").val("");
	
	 binddata(); 
	 initwebuploader();
}

//重新上传图片
function reuploader(){
	$("#imageshow").hide();
	$("#imageuploader").show();
	initwebuploader();
}
//初始化webuploader
function initwebuploader(){
	var  ratio = window.devicePixelRatio || 1;
   	var  thumbnailWidth = 110 * ratio;
   	var  thumbnailHeight = 110 * ratio;
	uploader = WebUploader.create({	    
	    auto: true,
	    //server: "http://127.0.0.1:8081/upload/image/",	
	    server: $('#uploadImgService').val(),
	    pick: '#filePicker',
	    accept: {
	        title: 'Images',
	        extensions: 'gif,jpg,jpeg,bmp,png',
	        mimeTypes: 'image/*'
	    }
	});
	// 当有文件添加进来的时候
	uploader.on( 'fileQueued', function( file ) {
	    var $li = $('<div id="' + file.id + '" ><img><div></br></div></div>'),$img = $li.find('img');
	    // $list为容器jQuery实例
	    //$list.append( $li );
	    //$("#fileList").empty();
	    
	    $("#fileList").children('div').remove(); 
	    $("#fileList").append( $li );	
	    // 创建缩略图,如果为非图片文件，可以不用调用此方法。
	    // thumbnailWidth x thumbnailHeight 为 100 x 100
	    uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }
	        $img.attr( 'src', src );
	    }, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),$percent = $li.find('.progress span');

	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<p class="progress"><span></span></p>').appendTo( $li ).find('span');
	    }
	    $percent.css( 'width', percentage * 100 + '%' );
	});
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file,response ) {
	    $( '#'+file.id ).addClass('upload-state-done');
	    console.log(response.imagepath);
	    $("#imageurl").val(response.imagepath);
	    
	});
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
	    var $li = $( '#'+file.id ),$error = $li.find('div.error');
	    // 避免重复创建
	    if ( !$error.length ) {
	        $error = $('<div class="error"></div>').appendTo( $li );
	    }
	    $error.text('上传失败');
	    console.log("失败！");
	});
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').remove();
	}); 
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