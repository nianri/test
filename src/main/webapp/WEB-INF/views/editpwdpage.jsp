<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0" rel="stylesheet">
    	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home/demo/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ceshi/uploader.css">
    
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    
	<body class="gray-bg">
			  <div class="wrapper wrapper-content animated fadeInRight ">
	        
	        <div class="row">
	            <div class="col-sm-12">
	                <div class="ibox float-e-margins">
	                    <div class="ibox-title">
	                        <h5>修改密码</h5>
<!-- 	                        <div class="ibox-tools"> -->
<!-- 	                        	 <button onclick=goBack("/admin/index.jsp") type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button> -->
<!-- 	                        </div> -->
	                    </div>
	                    <div class="ibox-content">
	                        <form class="form-horizontal m-t" id="form">
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">原密码：</label>
	                                <div class="col-sm-8">
	                                	<input  type="hidden" value="${obj.id}" name="id">
	                                    <input  placeholder="6到15位，包含字母和数字" name = "oldPwd" type="password" class="form-control" >
	                                </div>
	                            </div>
	                            
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">新密码：</label>
	                                <div class="col-sm-8">
	                                    <input  placeholder="6到15位，包含字母和数字" id="newPwd" name = "newPwd" type="password" class="form-control" >
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-sm-3 control-label">确认密码：</label>
	                                <div class="col-sm-8">
	                                    <input  placeholder="确认密码和新密码保持一致" name="newPwdAgain" type="password" class="form-control" >
	                                </div>
	                            </div>
	                            
	                            <div class="form-group">
	                                <div class="col-sm-4 col-sm-offset-3">
	                                    <button id="submit" onclick="return false;"class="btn btn-primary">更新</button>
	                                </div>
	                            </div>
	                            
	                        </form>
	                    </div>
	                </div>
	               
	            </div>
	            
	        </div>
	    </div>
	    <script src="${pageContext.request.contextPath}/js/home/jquery.min.js?v=2.1.4"></script>
	    <script src="${pageContext.request.contextPath}/js/home/bootstrap.min.js?v=3.3.6"></script>
	    <script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
	    <script src="${pageContext.request.contextPath}/js/home/plugins/validate/jquery.validate.min.js"></script>
	</body>
	<script type="text/javascript">
	jQuery(function($) {
		jQuery.validator.addMethod("isPwd", function(value, element) {//整数
			var length = value.length; 
			var regular = /^[A-Za-z0-9]+$/;//alert(mobile.test(value));
			return this.optional(element) || regular.test(value);
	        }, "空");
		//初始化信息校验表单
		var	form = $("#form").validate({
				rules: { 
					oldPwd:{
						required: true
						,rangelength:[6,15] 
						,isPwd:true
					},
					newPwd:{
						required: true
						,rangelength:[6,15] 
						,isPwd:true
					},
					newPwdAgain: {
						required: true
						,rangelength:[6,15]  
						,equalTo: "#newPwd"
					 }
				},
		        messages: {
		        	oldPwd:{
						required:"请输入原始密码"	
						,rangelength:"密码为6到15位字母和数字" 
						,isPwd:"密码为6到15位字母和数字" 
					},
					newPwd:{
						required:"请输入新密码"	
						,rangelength:"密码为6到15位字母和数字" 
						,isPwd:"密码为6到15位字母和数字" 
					},
					newPwdAgain: {
						required: "请输入确认密码"	
						,equalTo: "密码与确认密码不匹配"
					 }
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
			if(form.form()){doSubmit();}
		});
	});
		//提交表单
		function doSubmit(){ 
			$.post("${pageContext.request.contextPath}/admin/editPwd",$('#form').serialize(),function(data){
				alert(data.message);
				if(data.success==true){
					location.href="${pageContext.request.contextPath}/admin/logout";
				}
			});	
		}
// 		function goBack(url){
// 			if(url){
// 				location.href="${pageContext.request.contextPath}/"+url;
// 			}
// 		}
	</script>
</html>