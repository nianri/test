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
<!--     <link -->
<%-- 	href="${pageContext.request.contextPath}/css/home/plugins/chosen/chosen.css" --%>
<!-- 	rel="stylesheet"> -->
</head>
<body class="gray-bg">
	
      <div class="wrapper wrapper-content animated fadeInRight ">
        
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑用户</h5>
                        <div class="ibox-tools">
                            <button onclick=goBack("${!empty pageUrl ? pageUrl:''}") type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal m-t" id="form">
                        <input name="id" id="id" type="hidden" value="${!empty obj.id ? obj.id:''}">
                            <div class="form-group">
								<label class="col-sm-3 control-label">用户名称：</label>
								<div class="col-sm-8">
									<input name="username" placeholder="用户名称" type="text"
										class="form-control" readonly style="width: 450px;"
										value="${!empty obj.username ? obj.username:''}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">用户角色 ：</label>
								<div class="col-sm-8">
									<select id="role_name" name="rolename" data-placeholder="选择角色" class="form-control" 
										style="width: 450px;">
										<option value="-1">无角色</option>
										<c:forEach items="${roles}" var="roles">
											<option value="${roles.id}"
												<c:forEach items="${obj.roleList}" var="roleList">
													<c:if test="${roles.id==roleList.id}">selected="true"</c:if>
												</c:forEach>
											>${roles.rolename}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
						    <div class="form-group">
								<label class="col-sm-3 control-label">选择商家：</label>
								<div class="col-sm-8">
							      <c:choose>
								      <c:when test="${obj.isseller == 1}">
								          <input name="isseller" type="checkbox" checked="checked"  value="1" /> 
								      </c:when>
								       <c:when test="${obj.isseller != 1}">
										  <input name="isseller" type="checkbox" value="1" />
									   </c:when>
								 </c:choose>
								</div>
							</div>
                            
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
<!--      <script -->
<%-- 		src="${pageContext.request.contextPath}/js/home//plugins/chosen/chosen.jquery.js"></script> --%>
</body>
<script type="text/javascript">
jQuery(function($) {
// 	$("#role_name").chosen({
//  		allow_single_deselect : true
//  	});
	
	if(!$("#id").val()){
		$("#submit").html("添加");
	}
	//初始化信息校验表单
	var	form = $("#form").validate({
			rules: {
				rolename:{
					required: true
				}
				
			},
	        messages: {
	        	rolename: {
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
			$.post("${pageContext.request.contextPath}/testb/addChannel",$('#form').serialize(),function(data){
				if(data.success==true){
					alert(data.message);
					location.href=url;
				}
				
			});	
		}else{//编辑
			$.post("${pageContext.request.contextPath}/admin/editUserManager",$('#form').serialize(),function(data){
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