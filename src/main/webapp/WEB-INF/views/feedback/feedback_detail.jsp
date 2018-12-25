<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
	</head>
	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">反馈时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.feedbacktime}" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">反馈人：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.membername}" disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">反馈意见：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.feedbackmsg}"  disabled="disabled">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">反馈图片：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<img id="headimg" width="100" height="100" class="picture-thumb" src="${info.feedbackimg}"  onerror="imgerror(this)">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">状态：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.status=='0'?'未回复':'已回复'}" disabled="disabled">
					</div>
				</div>	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">回复内容：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${info.replymsg}" disabled="disabled">
					</div>
				</div>	
			</form>
		</div>		
	</body>
	<script type="text/javascript">
		function imgerror(img){
			img.src="../../resources/img/headimg.png";
			img.onerror=null;  //控制不要一直跳动
		}
	</script>
</html>