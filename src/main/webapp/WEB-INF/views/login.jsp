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
		<link href="${pageContext.request.contextPath}/resources/css/login/css/style.css" rel="stylesheet" type="text/css" />
	
	<link href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	  <div class="wrapper">
        <div class="wrapper-container">
            <div class="header" style="margin-left:19%">
                <div class="header-logo"></div>
                <div class="header-label" style="font-size:40px">油虎车服运营管理系统</div>
            </div>
            <div class="wrapper-body" style="margin-left:15%;padding-top:10%">
                <div class="login-container" style="margin-top:10%">
                    <div class="login-header">
                        <div class="line"></div>
                        <div class="header-user"></div>
                        <div class="line"></div>
                    </div>
                    <div class="login-body" >
                    <form class="form form-horizontal" action="../admin/clogin"
				method="post">
                        <div class="form-body form_user">
                            <input id="logincode" name="logincode" type="text" placeholder="请输入账号"
							class="form-input">
                        </div>
                        <div class="form-body form-pwd">
                            <input id="password" name="password" type="password" placeholder="请输入密码"
							class="form-input">
                        </div>
                        <div class="form-body form-code">
                            
                            <input class="form-input" type="text" placeholder="验证码"
							onblur="if(this.value==''){this.value='验证码:'}"
							onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:"
							style="width: 140px;" name="checkcode"> <img class="code-img"
							id="loginform:vCode"
							src="${pageContext.request.contextPath }/validatecode.jsp" onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();">
						<a id="kanbuq" href="javascript:;"
							onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();">看不清，换一张</a>
                        </div>
                        <div class="form-des">
                            <!-- 
                                <input id="input" type="checkbox">
                                <label id="label" for="input">记住密码</label>
                           
                            <a href="#" class="des-btn">忘记密码/找回用户名</a> -->
                        </div>
                        <div class="form-btns" style="margin-top:30px">
                            <div class="form-btn btn-login"><input name="" type="submit" class="form-btn btn-login"
							value=""> </div>
                            <div class="form-btn btn-reg"><input
							name="" type="reset" class="form-btn btn-reg"
							value=""></div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" 	src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script>
</body>
</html>