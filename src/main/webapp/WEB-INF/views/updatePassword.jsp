<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link
	href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.login.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/login/css/style.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="wrapper">
		<div class="wrapper-container">
			<div class="header" style="margin-left: 19%">
				<div class="header-logo"></div>
				<div class="header-label" style="font-size: 40px">油虎车服运营管理系统</div>
			</div>
			<div class="wrapper-body" style="margin-left: 15%; padding-top: 10%">
				<div class="login-container" style="margin-top: 10%">
					<div class="login-header">
						<div class="line"></div>
						<div class="header-user"></div>
						<div class="line"></div>
					</div>
					<div class="login-body">
						<form class="form form-horizontal" id="form">
							<div class="form-body form-user">
								<input id="phonenumber" name="phonenum" type="text"
									value="${phonenum}" placeholder="请输入手机号" disabled="disabled" class="form-input">
							</div>
							<div class="form-body form-pwd">
								<input id="newPwd" name="newPwd" type="password"
									placeholder="6到15位，包含字母和数字" class="form-input">
							</div>
							<div class="form-body form-pwd">
								<input  id="newPwdAgain" name="newPwdAgain" type="password"
									placeholder="确认密码和新密码保持一致" class="form-input">
							</div>
							<div class="form-btns">
								<button id="submit" onclick="return false;"
									class="btn btn-warning">更新</button>
									<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/login">返回</a>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script>
</body>
<script type="text/javascript">
	jQuery(function($) {
		$("#close_btn").click(function(){
			location.href = "${pageContext.request.contextPath}/admin/login";
		});
		
		
		$("#submit").click(function() {
			var newPwd =$("#newPwd").val().trim();
			var newPwdAgain =$("#newPwdAgain").val().trim();
			var phonenum=$("#phonenumber").val().trim();
			if(!isPasswd(newPwd)){
				alert("密码不符合规则");
				return false;
			}
			
			if(newPwdAgain!=newPwd){
				alert("两次密码输入不一致");
				return false;
			}
			var row={
					"phonenum":phonenum,
					"password":newPwd
			}
			
			$.ajax({
				type : "post",					
				url : "../admin/updatePwd",
				dataType : "json",
				data : JSON.stringify(row),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);	
					if(result.code=="001"){
						alert("修改成功");
						location.href = "${pageContext.request.contextPath}/admin/login";
					}
				},
				error : function(errorMsg) {
					console.log(errorMsg);
				}
			});
		});
	});
	function isPasswd(s) {
		var patrn = /^(\w){6,15}$/;
		if (!patrn.exec(s))
			return false;
		return true;
	}
	
</script>
</html>