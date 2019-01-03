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
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<title>运营管理平台</title>
</head>
<body>
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">			
			<span style="color:white;"><h4>油虎车服运营管理平台</h4></span> 			
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>${realname}</li>
				<li class="dropDown dropDown_hover"><a href="#"
					class="dropDown_A">${logincode} <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<%-- <li><a href="${pageContext.request.contextPath}/admin/editPwdPage">修改密码</a></li> --%>
						<li><a onclick="openpwd();">修改密码</a></li>
						<li><a
							href="${pageContext.request.contextPath }/admin/logout">安全退出</a></li>
					</ul></li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"><a
					href="javascript:;" class="dropDown_A" title="换肤"> <i
						class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i>
				</a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="blue" title="默认（黄色）">默认（黄色）</a></li>
						<li><a href="javascript:;" data-val="default" title="黑色">黑色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul></li>
			</ul>
			</nav>
		</div>
		<!-- 修改密码（Modal） -->
		<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 500px; height: 400px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">修改密码</h4>
					</div>
					<div class="modal-body">
						<div class="page-container">
							<div class="form form-horizontal" id="form-article-add">
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">原密码：</label>
									<div class="formControls col-xs-8 col-sm-7">
										<input id="sourcepwd" type="text" class="input-text">
									</div>
								</div>
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">新密码：</label>
									<div class="formControls col-xs-8 col-sm-7">
										<input id="newpwd" type="text" class="input-text">
									</div>
								</div>
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">确认密码：</label>
									<div class="formControls col-xs-8 col-sm-7">
										<input id="okpwd" type="text" class="input-text">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button id="oilsok" type="button" class="btn btn-primary"
							data-trigger="click" title="提示" onclick="okpwd();"
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
		<dl id="menu-comments">
			<dt>
				<i class="Hui-iconfont">&#xe622;</i> 营销管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath}/coupon/couponList"
						data-title="发布优惠券" href="javascript:;">发布优惠券</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt>
				<i class="Hui-iconfont">&#xe613;</i> 广告管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath}/advertin/advertList"
						data-title="发布广告" href="javascript:void(0)">发布广告</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt>
				<i class="Hui-iconfont">&#xe622;</i> 商家管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath}/shop/shopAddList"
						data-title="加油站入驻" href="javascript:void(0)">加油站入驻</a></li>
					<li><a
						data-href="${pageContext.request.contextPath}/shop/shopCheckList"
						data-title="加油站审核" href="javascript:void(0)">加油站审核</a></li>
					<li><a
						data-href="${pageContext.request.contextPath}/shop/shopList"
						data-title="加油站列表" href="javascript:void(0)">加油站列表</a></li>
					<li><a
						data-href="${pageContext.request.contextPath}/shop/shopAccount"
						data-title="加油站编辑" href="javascript:void(0)">加油站编辑</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i> 会员管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath }/member/memberList"
						data-title="注册会员列表" href="javascript:;">注册会员列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i> 礼品管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath }/goods/goodsList"
						data-title="积分礼品添加" href="javascript:;">积分礼品添加</a></li>
					<li><a	data-href="${pageContext.request.contextPath }/goodsOrder/goodsOrderList"
						data-title="礼品兑换列表" href="javascript:void(0)">礼品兑换列表</a>
					</li> 	
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe620;</i> 产品管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath }/shopOils/shopOilsList"
						data-title="发布产品" href="javascript:void(0)">发布产品</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 数据统计 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul><li><a data-href="${pageContext.request.contextPath}/shopOrder/shopOrderList" data-title="订单明细查询" href="javascript:void(0)">订单明细查询</a></li></ul>
				<ul><li><a data-href="${pageContext.request.contextPath}/shopOrderReport/shopOrderStatusReport" data-title="订单状态报表" href="javascript:void(0)">订单状态报表</a></li></ul>
				<ul><li><a data-href="${pageContext.request.contextPath}/shopOrderReport/shopOrderOilsReport" data-title="产品订单报表" href="javascript:void(0)">产品订单报表</a></li></ul>
				<ul><li><a data-href="${pageContext.request.contextPath}/shopOrderReport/shopOrderMonthReport" data-title="月收入报表" href="javascript:void(0)">月收入报表</a></li></ul>
			</dd>
		</dl>
		<dl>
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 意见反馈<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath }/feedbackInfo/feedbackInfoList"
						data-title="意见反馈列表" href="javascript:void(0)">意见反馈列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>
				<i class="Hui-iconfont">&#xe62e;</i> 系统管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a
						data-href="${pageContext.request.contextPath }/sysUser/sysUserList"
						data-title="用户列表" href="javascript:void(0)">用户列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的油虎"
					data-href="../admin/welcome">我的油虎</span> <em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
				id="js-tabNav-next" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display: none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.html"></iframe>
		</div>
	</div>
	</section>
	<span data-href="../admin/charts2"></span>
	<div class="contextMenu" id="Huiadminmenu">
		<ul>
			<li id="closethis">关闭当前</li>
			<li id="closeall">关闭全部</li>
		</ul>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
	<script type="text/javascript">
		function okpwd() {
			console.log("----");
		}
		function openpwd() {
			$("#pwdModal").modal("show");
		}
	</script>
</body>
</html>