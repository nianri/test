<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="u" uri="http://java.sun.com/jsp/jstl/u"%> --%>
<%@taglib prefix="i18n" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>眼睛商城-管理后台</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico"> 
<link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home/demo/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ceshi/uploader.css">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ceshi/uploader2.css">

<style>
li {
	list-style: none;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight ">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>编辑商品信息</h5>
						<div class="ibox-tools">
						 <button onclick=goBack("${!empty pageUrl ? pageUrl:''}") type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button>
						</div>
					</div>
					<div class="ibox-content">
						<form class="form-horizontal m-t" id="form">
						<input name="showImage" id="imageUrl" type="hidden"/>
							<input name="id" id="id" type="hidden"
								value="${!empty obj.id ? obj.id:''}">
							<div class="form-group">
								<label class="col-sm-3 control-label">积分商品名称：</label>
								<div class="col-sm-8">
									<input name="integralName" placeholder="积分商品名称" type="text"
										class="form-control"
										value="${!empty obj.integralName ? obj.integralName:''}">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">所需积分兑换：</label>
								<div class="col-sm-8">
									<input name="fraction" placeholder="所需积分兑换" type="text"
										class="form-control"
										value="${!empty obj.fraction ? obj.fraction:''}">
								</div>
							</div>
				
				<div class="form-group">
								<label class="col-sm-3 control-label">商品详情：</label>
								<div class="col-sm-8">
									<input name="goodsDetails" placeholder="商品详情" type="text"
										class="form-control"
										value="${!empty obj.goodsDetails ? obj.goodsDetails:''}">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">市场价值：</label>
								<div class="col-sm-8">
									<input name="price" placeholder="市场价值" type="text"
										class="form-control"
										value="${!empty obj.price ? obj.price:''}">
								</div>
							</div>
                             
							<!--  <input type="hidden" name="selProvince" id="AselProvince">
                             <input type="hidden" name="selCity" id="AselCity"> -->
						 
						
							
						    <div class="form-group">
                                <label class="col-sm-3 control-label">上传轮播图片：</label>
                                <div class="col-sm-8">
                                    <div id="fileList" class="uploader-list"></div>
		                               <div id="filePicker">选择图片</div>
		                               <input type="hidden"  value="${obj.showImage}" id="imageUrl" name="showImage"/>
                                </div>
                            </div>
                           <%--  	<div class="form-group">
								<label class="col-sm-3 control-label">广告类型：</label>
								<div class="col-sm-8">
									<ul class="col-sm-8">
										<li><span> <select class="form-control" name="type" id="ad_type">
													<option <c:if test="${obj.type==1}"> selected="selected" </c:if>  value="1" ap_type="slide">链接广告</option>  
													<option <c:if test="${obj.type==2}"> selected="selected" </c:if> value="2" ap_type="slide">单品广告</option>  
													<option <c:if test="${obj.type==3}"> selected="selected" </c:if> value="3" ap_type="slide">商品类别  </option>  
													<option <c:if test="${obj.type==4}"> selected="selected" </c:if> value="4" ap_type="slide">多个商品</option>  
											</select>
										</span></li>
									</ul>
								</div>
							</div> --%>
						
						
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-3">
									<button id="submit" onclick="return false;"
										class="btn btn-primary">更新</button>
								</div>
							</div>

						</form>
					</div>
				</div>

			</div>

		</div>
	</div>
 <script src="${pageContext.request.contextPath}/resources/js/home/jquery.min.js?v=2.1.4"></script>
 <script src="${pageContext.request.contextPath}/resources/js/home/bootstrap.min.js?v=3.3.6"></script>
 <script src="${pageContext.request.contextPath}/resources/js/ceshi/common.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/home/plugins/validate/jquery.validate.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/home/demo/webuploader.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/site/CityJson.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/site/DistrictJson.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/site/ProJson.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/home/demo/webuploader.js"></script>
 		<script src="${pageContext.request.contextPath}/resources/js/ceshi/uploader2.js"></script>
    	<script src="${pageContext.request.contextPath}/resources/js/ceshi/uploader-sp.js"></script>
	<!-- 引入日期选择器插件js 结束 -->
</body>
<!--<script type="text/Javascript">
    $("#data_1").datetimepicker({
    	 minView: "month", //选择日期后，不会再跳转去选择时分秒 
    	format: 'yyyy-mm-dd'
    	//	language: 'zh-CN', //汉化 
    		//autoclose:true//选择日期后自动关闭 
    });
</script>-->
<!-- 激活日期选择器 -->


<script type="text/javascript">


changeType();
$("#ad_type").change(function() {
	changeType();

});
function changeType(){
	var type=$("#ad_type").val();
	if(1==type){
		$("#unionDiv").css("display","none");
		$("#linkDiv").css("display","block");
	}else if(2==type){
		$("#unionDiv").css("display","block");
		$("#unionDiv").find("label:first").text("商品Id");
		$("#linkDiv").css("display","none");
	}else if(3==type){
		$("#unionDiv").css("display","block");
		$("#unionDiv").find("label:first").text("商品类别Id");
		$("#linkDiv").css("display","none");
	}else if(4==type){
		$("#unionDiv").css("display","none");
		$("#linkDiv").css("display","none");
	}
}

var BASE_URL = "${pageContext.request.contextPath}/css/home";
function sub(str){
	   var img=str+"?x-oss-process=style/1_1";
	   return img;
}
$(function () {
	var arr = new Array();
	var url="${!empty obj.showImage?obj.showImage:''}";
	if(url){
 	var obj={};
 	url=sub(url);
 	obj.url=url;
 	arr.push(obj);
 }
 var uploaderConfig = {
			url : '${pageContext.request.contextPath}/uploader/upload',
			idSign:"a_a",
			readyData:arr,
			pick:"#filePicker",
			list:"#fileList"
			};
 
 var myUploader=new MyUploader(uploaderConfig);
 var uploader =myUploader.uploader();

jQuery(function($) {
	if(!$("#id").val()){
		$("#submit").html("添加");
	}
	jQuery.validator.addMethod("isMyInteger", function(value, element) {//整数
		var length = value.length; 
		var regular = /^\d+$/;//alert(mobile.test(value));
		return this.optional(element) || regular.test(value);
        }, "空");
	//初始化信息校验表单
	var	form = $("#form").validate({
		ignore: "",
			rules: {
				adName:{
					required: true
					,maxlength:25
				},
				sort:{
					required: true,
					isMyInteger:true
				},
				/* imageUrl:{
					required: true
				}, */
			},
	        messages: {
	        	adName: {
	                required: "请输入广告名"
	                ,maxlength:"广告名字不能超过25字符"
	            },
	            sort: {
					required: "请输入排序号",
					isMyInteger:"排序必须为整数!"
				},
				/* imageUrl:{
					required: "请选择上传广告图片"
				}, */
	        },
	        showErrors: function(errorMap, errorList) {  
 	            var msg = "";  
 	            $.each( errorList, function(i,v){  
 	            	if(i==0)v.element.focus();
 	              msg += (v.message+"\r\n");  
 	            });  
 	            if(msg!="") {alert(msg);}  
 	        },  
 	        /* 失去焦点时不验证 */   
 	        onfocusout: false ,
 	        onkeyup:false
		});

	
	$("#submit").click(function(){
		var imageUrl=myUploader.getUploaderFiles(uploader);
		$("#imageUrl").val(imageUrl.substring(0,imageUrl.indexOf("?")));
		doSubmit();
	});
	var url="${pageContext.request.contextPath}/"+"${!empty pageUrl ? pageUrl:''}";

	//提交表单
	function doSubmit(){ 
	  if(form.form()){
		  
			
		if(!$("#id").val()||0==$("#id").val()){//添加
			$.post("${pageContext.request.contextPath}/admin/addIntegral",$('#form').serialize(),function(data){
				
				if(data.success==true){
					alert(data.message);
					location.href=url;
				}
				
			});	
		}else{//编辑
			$.post("${pageContext.request.contextPath}/admin/editIntegral",$('#form').serialize(),function(data){
				
				if(data.success==true){
					alert(data.message);
					location.href=url;
				}
				
			});	
				
		     }
	    }
	}
});
$.each(province, function (k, p) {
    var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
    $("#selProvince").append(option);
});

$("#selProvince").change(function () {
		var b =$("#selProvince").find("option:selected").text();
		$("#desite").val(b);
    var selValue = $(this).val();
    $("#selDist").val("");
    $("#selCi").val("");
    $("#selCity option:gt(0)").remove();
    $("#selDistrict option:gt(0)").remove();
    $.each(city, function (k, p) {
        if (p.ProID == selValue) {
        var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
        $("#selCity").append(option);
        }
    });
});

$("#selCity").change(function () {
	 var b =$("#desite").val()+$("#selCity").find("option:selected").text();
	 $("#desite").val(b);
    var selValue = $(this).val();
    $("#selDistrict option:gt(0)").remove();
    $.each(District, function (k, p) {
        if (p.CityID == selValue) {
            var option = "<option value='" + p.Id + "'>" + p.DisName + "</option>";
            $("#selDistrict").append(option);
        }
    });
});


var provinceb="${!empty store.province ? store.province:''}";
$("#selProvince option").each(function (){
    if(provinceb&&$(this).text()== provinceb){
        $(this).attr('selected',true).change();
    }
}); 
var cityb="${!empty store.city ? store.city:''}";
$("#selCity option").each(function (){
    if(cityb&&$(this).text()==cityb){
        $(this).attr('selected',true).change();
    }
});
       
    
	function goBack(url){
		if(url){
			location.href="${pageContext.request.contextPath}/"+url;
		}
	}
})
	
</script>
</html>