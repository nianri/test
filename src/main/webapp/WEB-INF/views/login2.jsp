<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="loginWraper">
		<div class="fphoto"></div>
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" action="../admin/clogin"
				method="post">
				<h5 class="no-margins"
					style="margin-left: 89px; margin-top: 39px; color: rgb(184, 134, 62); font-size: 1.5rem;">用户登录：${message}</h5>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="logincode" name="logincode" type="text" placeholder="账户"
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password" placeholder="密码"
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input class="input-text size-L" type="text" placeholder="验证码"
							onblur="if(this.value==''){this.value='验证码:'}"
							onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:"
							style="width: 140px;" name="checkcode"> <img
							id="loginform:vCode"
							src="${pageContext.request.contextPath }/validatecode.jsp">
						<a id="kanbuq" href="javascript:;"
							onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();">看不清，换一张</a>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label for="online"> <input type="checkbox" name="online"
							id="online" value=""> 使我保持登录状态
						</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input name="" type="submit" class="btn btn-success radius size-L"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input
							name="" type="reset" class="btn btn-default radius size-L"
							value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" 	src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script>
</body>
</html>