<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
     <link
	href="${pageContext.request.contextPath}/css/home/plugins/chosen/chosen.css"
	rel="stylesheet">
    
</head>
<body class="gray-bg">
	
      <div class="wrapper wrapper-content animated fadeInRight ">
        
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑角色</h5>
                        <div class="ibox-tools">
                            <button onclick=goBack("${!empty pageUrl ? pageUrl:''}") type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="form">
                        <input name="id" id="id" type="hidden" value="${!empty obj.id ? obj.id:''}">
                            <div class="form-group">
								<label class="col-sm-3 control-label">角色名称：</label>
								<div class="col-sm-8">
									<input name="rolename" placeholder="角色名称" type="text"
										class="form-control"
										value="${!empty obj.rolename ? obj.rolename:''}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">角色描述：</label>
								<div class="col-sm-8">
									<input name="roleDscribe" placeholder="角色描述" type="text"
										class="form-control"
										value="${!empty obj.roleDscribe ? obj.roleDscribe:''}">
								</div>
							</div>
<!-- 							<div class="form-group"> -->
<!-- 								<label class="col-sm-3 control-label">角色权限 ：</label> -->
<!-- 								<div class="col-sm-8"> -->
<!-- 									<select id="per_name" name="permissionname" -->
<!-- 										data-placeholder="选择权限" class="chosen-select" -->
<!-- 										multiple="multiple" style="width: 450px;"> -->
<!-- 										<option value="-1"></option> -->
<%-- 										<c:forEach items="${pers}" var="pers"> --%>
<%-- 											<option value="${pers.id}" --%>
<!-- 												<c:forEach items="obj.permissionsName" var="permissionsName"> -->
<!-- 													<c:if test="pers.id==permissionsName.id">selected="true"</c:if> -->
<!-- 												</c:forEach> -->
<%-- 											>${pers.permissionname}</option> --%>
<%-- 										</c:forEach> --%>

<!-- 									</select> -->
<!-- 								</div> -->
<!-- 							</div> -->
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3">
                                    <button id="submit" onclick="return false;" class="btn btn-primary" >更新</button>
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
     <script src="${pageContext.request.contextPath}/js/home//plugins/validate/jquery.validate.min.js"></script>
     <script
		src="${pageContext.request.contextPath}/js/home//plugins/chosen/chosen.jquery.js"></script>
</body>
<script type="text/javascript">
jQuery(function($) {
	$("#per_name").chosen({
 		allow_single_deselect : true
 	});
	if(!$("#id").val()){
		$("#submit").html("添加");
	}
	jQuery.validator.addMethod("isMyInteger", function(value, element) {//整数
		var length = value.length; 
		var regular = /^\d+$/;//alert(mobile.test(value));
		return this.optional(element) || regular.test(value);
        }, "空");
	jQuery.validator.addMethod("isMobile", function(value, element) { 
		  var length = value.length; 
		  var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/; 
		  return this.optional(element) || (length == 11 && mobile.test(value)); 
		}, "空"); 
	//初始化信息校验表单
	var	form = $("#form").validate({
			rules: {
				permissionname:{
					required: true
				}
				
			},
	        messages: {
	        	permissionname: {
	                required: "请输入频道名"
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
			doSubmit();
	});
	var url="${pageContext.request.contextPath}/"+"${!empty pageUrl ? pageUrl:''}";

	//提交表单
	function doSubmit(){ 
	  if(form.form()){
		if(!$("#id").val()||0==$("#id").val()){//添加
			$.post("${pageContext.request.contextPath}/admin/addRole",$('#form').serialize(),function(data){
				if(data.success==true){
					alert(data.message);
					location.href=url;
				}
				
			});	
		}else{//编辑
			$.post("${pageContext.request.contextPath}/admin/editRole",$('#form').serialize(),function(data){
				if(data.success==true){
					alert(data.message);
					location.href=url;
				}
				
			});	
				
		     }
	    }
	}
});
	function goBack(url){
		if(url){
			location.href="${pageContext.request.contextPath}/"+url;
		}
	}
</script>
</html>