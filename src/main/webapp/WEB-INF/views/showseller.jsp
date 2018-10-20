<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="Bookmark" href="/favicon.ico" >
	<link rel="Shortcut Icon" href="/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>

	<title>XX运营管理平台</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">		
		<div class="container-fluid cl"> 
			<img style="float: left; width: 5rem; margin-right: 16px; margin-left: 8px;"
				src="${pageContext.request.contextPath}/resources/static/youhulogo.png">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" >XX运营管理平台</a>  
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml"></a> 		
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				<ul class="cl"></ul>
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>${realname}</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${logincode}<i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a onclick="openpwd();" >修改密码</a></li>
						<li><a href="${pageContext.request.contextPath }/admin/logout">安全退出</a></li>
					</ul>
				</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> 
					<a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
	<!-- 修改密码（Modal） -->
		<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:500px;height:400px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" >修改密码</h4>
					</div>
					<div class="modal-body">
						<div class="page-container">
							<div class="form form-horizontal" id="form-article-add">
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">原密码：</label>
									<div class="formControls col-xs-8 col-sm-7">
										<input id="sourcepwd" type="text" class="input-text" >
									</div>
								</div>
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">新密码：</label>
									<div class="formControls col-xs-8 col-sm-7">
										<input id="newpwd" type="text" class="input-text" >
									</div>
								</div>
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">确认密码：</label>
									<div class="formControls col-xs-8 col-sm-7">
										<input id="okpwd" type="text" class="input-text" >
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button id="oilsok" type="button" class="btn btn-primary" data-trigger="click" title="提示"  onclick="okpwd();"
								data-container="body" data-placement="auto left" data-content="">确定
						</button>
					</div>
				</div>
			</div>
		</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">	
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul><li><a data-href="../shopOils/shopOilsList" data-title="产品列表" href="javascript:void(0)">产品列表</a></li></ul>
			</dd>
		</dl>	
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i>优惠券管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul><li><a data-href="${pageContext.request.contextPath}/coupon/couponList" data-title="优惠券管理" href="javascript:;">优惠券发布</a></li></ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i>商家订单 <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul><li><a data-href="${pageContext.request.contextPath}/shopOrder/shopOrderList" data-title="订单查询" href="javascript:void(0)">订单查询</a></li></ul>
			</dd>
		</dl>	
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i>店铺定位<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul><li><a data-href="${pageContext.request.contextPath}/shop/shopMap" data-title="店铺位置设置" href="javascript:void(0)">店铺位置设置</a></li></ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="../admin/welcome">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.html"></iframe>
		</div>
	</div>
</section>
<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
	</ul>
</div>

<script type="text/javascript">
	function okpwd(){
		console.log("----");
	}
	function openpwd(){
		$("#pwdModal").modal("show");
	}
</script> 
</body>
</html>