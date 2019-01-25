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
						<form class="form form-horizontal" id="form"
							action="/yh/admin/updatePasswordPage" method="post">
							<div class="form-body form-user">
								<input id="phonenumber" name="phonenum" type="text"
									placeholder="请输入手机号" class="form-input">
								<button value="发送验证码"></button>
							</div>
							<div class="form-body form-code">
								<input class="form-input" type="text" placeholder="手机验证码"
									style="width: 140px;" name="smscode" id="smscode">
								<button class="btn btn-warning code-img" type="button"
									id="phonecodebtn">获取验证码</button>
							</div>
							<div class="form-body form-code">
								<input type="hidden" name="hash" id="codehash"> <input
									type="hidden" name="tamp" id="codetamp"> <input
									class="form-input" id="randomcode" type="text"
									placeholder="验证码" style="width: 140px;" name="checkcode">
								<img class="code-img" id="loginform:vCode"
									src="${pageContext.request.contextPath }/validatecode.jsp"
									onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();">
								<a id="kanbuq" href="javascript:;"
									onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/validatecode.jsp?'+Math.random();">看不清，换一张</a>
							</div>

							<div class="form-btns">
								<div class="form-btn btn-qd">
									<input id="submit" name="" type="submit"
										class="form-btn btn-queding" value="">
								</div>
									<input name="" type="reset" class="btn btn-default" value="重置"></input>

								<a class="btn btn-default"
									href="${pageContext.request.contextPath}/admin/login">返回</a>
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
		$("form").submit(function(e) {

			var ph = $("#phonenumber").val().trim();
			if (!isPoneAvailable(ph)) {
				alert("请输入正确的手机号");
				$("#phonenumber").val(ph);
				return;
			}
			var smscode = $("#smscode").val().trim();
			if (smscode == '') {
				alert("请输入短信验证码");
				return;
			}
			var checkcode = $("#randomcode").val().trim();
			if (randomcode == '') {
				alert("请输入随机验证码");
				return;
			}
		});

		$("#phonecodebtn").click(
				function() {
					var ph = $("#phonenumber").val().trim();
					if (!isPoneAvailable(ph)) {
						alert("请输入正确的手机号");
						return;
					}
					$("#phonecodebtn").attr({
						"disabled" : "disabled"
					});
					$("#phonecodebtn").attr("class", "code-img");
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/sms/sendMsg/"
								+ ph + "?",
						dataType : "json",
						contentType : 'application/json',
						success : function(result) {
							result = eval(result);
							if (result.code == "001") {
								$("#codehash").val(result.data.hash);
								$("#codetamp").val(result.data.tamp);
							}
						},
						error : function(errorMsg) {
							console.log(errorMsg);
						}
					});
					setTimeout("clearDisabled()", 30000)
				});

	});
	function clearDisabled() {
		$("#phonecodebtn").removeAttr("disabled");//将按钮可用
		$("#phonecodebtn").attr("class", "btn btn-warning code-img");

	}

	function isPoneAvailable(str) {
		var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
		if (!myreg.test(str)) {
			return false;
		} else {
			return true;
		}
	}
</script>
</html>