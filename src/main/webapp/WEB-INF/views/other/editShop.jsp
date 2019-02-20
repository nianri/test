<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>眼睛商城-店铺</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="http://cache.amap.com/lbs/static/main1119.css" />
<link rel="stylesheet" href="../resources/css/common.css">
<script src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/jquery-ui.min.css">
<script src="js/jquery-ui-1.10.4.min.js"></script>
<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/home/demo/webuploader.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ceshi/uploader.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/ceshi/uploader2.css">

<link rel="stylesheet"
	href="http://cache.amap.com/lbs/static/main1119.css" />
<style type="text/css">
.ms-drop.bottom ul li {
	margin-left: 5px;
	float: left;
	width: 40px;
}
input{
border:1px solid #ccc;
}
.photo  .webuploader-pick {
	width: 80px;
	height: 80px;
	background: url('../img/home/photoBtn.png');
	background-size: 100% 100%;
}

.c-red, .c-red a, a.c-red {
	color: red
}

.c-red a:hover, a.c-red:hover {
	color: red
}
</style>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body, button, input, select, textarea {
	font: 12px/16px Verdana, Helvetica, Arial, sans-serif;
}

p {
	width: 603px;
	padding-top: 3px;
	overflow: hidden;
}

.btn {
margin-left:10px;
	width: 142px;
}

#container {
	min-width: 300px;
	min-height: 300px;
}
</style>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#main {
	height: 580px;
	margin: 0px auto;
	border: 1px solid #ff8d00;
	border-top: 0px;
	position: relative;
	
}

#tooles {
	height: 50px;
	background: orange;
	position: relative;
	z-index: 100;
	color: white;
}

#bside_left {
	width: 260px;
	height: 510px;
	padding: 10px 0px 10px 10px;
	float: left;
	overflow: auto;
}

#cur_city, #no_value {
	height: 20px;
	position: absolute;
	top: 11px;
	left: 10px;
}

#cur_city .change_city {
	margin-left: 5px;
	font-size: 1.1rem;
	cursor: pointer;
}

#level {
	margin-left: 20px;
}

.logo_img {
	width: 172px;
	height: 23px;
}

.search {
	width: 100%;
	height: 53px;
	padding-left: 10px;
	float: left;
	margin-left: 15px;
	margin-right: 30px;
}

.search_t {
	width: 100%;
   
    margin-top: 13px;
 
    padding: 6px 12px;
    font-size: 14px;
   
}

.search_c {
	width:60%;
	height: 40px;
	float: left;
	 margin-left:63px;
}

.btn, .btn_active {
	width: 49px;
	height: 24px;
	line-height: 12px;
	font-size: 14px;
	float: left;
	background: url(../resources/img/btn.png);
	margin-top: 14px;
	text-align: center;
	cursor: pointer;
}

.btn_active {
	background: url(../resources/img/btn.png) -49px 0px;
}
.btnnew{
	width: 10rem;
	height: 3rem;
	background: #1ab394;
	line-height:3rem;
	font-size: 14px;
	float: left;
	margin-top: 14px;
	text-align: center;
	cursor: pointer;
}
.poi {
	width: 570px;
	height: 41px;
	padding-top: 12px;
	float: left;
	position: relative;
}

.poi_note {
	width: 63px;
	line-height: 26px;
	float: left;
	font-weight:600;
}

#poi_cur {
	width: 100%;
	height: 30px;
	margin-right: 10px;
	margin-top: 10px;
	line-height: 30px;
	float: left;
	margin-left:86px;
	text-align: center;
}

#addr_cur {
	width: 100%;
	height: 30px;
margin-left:86px;
	margin-right: 5px;
	margin-top: 10px;
	line-height: 30px;
	float: left;
	text-align: center;
}

.btn_copy {
	width: 49px;
	height: 24px;
	background: url(../img/btn_cpoy.png) 0px 0px;
	float: left;
}

.already {
	width: 52px;
	line-height: 26px;
	padding-left: 5px;
	float: left;
	color: red;
	display: none;
}

.info_list {
	margin-bottom: 5px;
	cleat: both;
	cursor: pointer;
}

#txt_pannel {
	height: 500px;
}

#city {
	width: 356px;
	height: 433px;
	padding: 10px;
	border: 2px solid #D6D6D6;
	position: absolute;
	left: 44px;
	top: 20px;
	z-index: 999;
	background: #fff;
	overflow: auto;
	color: black;
}

#city .city_class {
	font-size: 12px;
	background: #fff;
}

#city .city_container {
	margin-top: 10px;
	margin-bottom: 10px;
	background: #fff;
}

#city .city_container_left {
	width: 48px;
	float: left;
}

#city .city_container_right {
	width: 289px;
	float: left;
}

#city .close {
	width: 20px;
	height: 20px;
	display: inline-block;
	float: right;
	font-size: 20px;
	font-weight: normal;
	cursor: pointer;
}

#city .city_name {
	line-height: 20px;
	margin-left: 5px;
	color: #2F82C4;
	cursor: pointer;
	display: inline-block;
	font-size: 12px;
}

#curCity {
	margin-right: 5px;
}

.hide {
	display: none;
}

#bside_rgiht {
	width: 631px;
	height: 530px;
	margin-left: 10px;
	border-left: 1px solid orange;
	float: left;
	font-size: 12px;
}

#container {
	width: 621px;
    height: 520px;
    border: 5px solid #fff;
    position: absolute;
    top: 46px;
    left: 300px;
}

#no_value {
	color: red;
	position: relative;
	width: 200px;
}
</style>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight ">
		<div class="row">
			<form class="form-horizontal m-t" id="commentForm">
				<div class="col-sm-8">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>编辑商店信息</h5>

						</div>
						<div class="ibox-content">
							<!--                         <form class="form-horizontal m-t" id="commentForm"> -->
							<div class="form-group">
								<label class="col-sm-2 control-label"><span
									class="c-red">*</span>商店名称：</label>
								<div class="col-sm-10">
									<input type="hidden" value="${store.id}" name="id" /> <input
										value="${store.name}" name="name" placeholder="请输入商店名称"
										type="text" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">商家联系人姓名：</label>
								<div class="col-sm-10">
									<input value="${store.addername}" name="addername"
										placeholder="商家联系人姓名" type="text" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">联系电话：</label>
								<div class="col-sm-10">
									<input value="${store.addertel}" name="addertel"
										placeholder="请输入联系电话" type="text" class="form-control" />
								</div>
							</div>


							<div class="form-group">
								<label class="col-sm-2 control-label">商家服务：</label>
								<div class="col-sm-10">
									<input value="${store.service}" name="service"
										placeholder="请输入商家服务范围" type="text" class="form-control">
								</div>
							</div>
							<br />

							<div class="form-group">
								<label class="col-sm-2 control-label">描述：</label>
								<div class="col-sm-10">
									<textarea name="describe" placeholder="请输入商店描述"
										class="form-control">${store.describe}</textarea>
								</div>
							</div>
							<div class="form-group">
							
								<div class="col-sm-10">
									<input type="hidden" id="desite" name="desite" />
									   <input type="hidden"  id="selCi" name="selCity"/> 
									<input type="hidden"  id="selDist" name="selDistrict"/> 
									<input type="hidden" value="${store.logo}" id="logo"
										name="logo" /> <input type="hidden"
										value="${store.showImage}" id="showImage" name="showImage" />
									
								</div>
							</div>
							<input type="hidden" name="selProvince" id="AselProvince">
							<input type="hidden" name="city" id="AselCity"> 
							<input type="hidden" name="selDistrict" id="AselDistrict">
							<div class="form-group">
								<label class="col-sm-1 control-label"></label>
								<div class="col-md-11">
									<!--  <div id="container"  style="height:400px;margin-bottom:10px;position: relative;"></div>  -->
									<%--   <%@ include file="../admin/getpoint.jsp" %> --%>
									<%-- <c:import url="../admin/getpoint.jsp"></c:import>  --%>
									<!--搜索部分-->
									<div style="width: 950px; height: 727px; position: relative; margin: 0px auto;">
										<div style="height:290px;">
										<div class="poi_note" style="margin-top:0;">搜索：</div>
											<div class="search">
											
												<div class="search_c">
												
													<input type="text" class="search_t"
														onkeypress="if(event.keyCode==13) {btnSearch.click();return false;}" />
												</div>
												<div id="btn_search" class="btn">搜索</div>
											</div>
											<div class="poi">
												<div class="poi_note">当前坐标：</div>
												<input type="text" id="poi_cur" value="${store.coordinate}" name="coordinate" />
												<div class="poi_note">当前地址：</div>
												<input type="text" id="addr_cur" value="${store.detail}" name="detail"/>
											</div>
										</div>
										<div id="main">
											<div id="tooles">
												<div id="cur_city">
													<strong style="font-size: 1.5rem">北京市</strong><span
														class="change_city">[<span
														style="text-decoration: underline;"
														style="font-size: 1rem;">更换城市</span>]<span id="level"
														style="font-size: 1rem;">当前缩放等级：10</span></span>
													<div id="city">
														<h3 class="city_class">
															热门城市<span class="close">X</span>
														</h3>
														<div class="city_container">
															<span class="city_name">北京</span> <span class="city_name">深圳</span>
															<span class="city_name">上海</span> <span class="city_name">香港</span>
															<span class="city_name">澳门</span> <span class="city_name">广州</span>
															<span class="city_name">天津</span> <span class="city_name">重庆</span>
															<span class="city_name">杭州</span> <span class="city_name">成都</span>
															<span class="city_name">武汉</span> <span class="city_name">青岛</span>
														</div>
														<h3 class="city_class">全国城市</h3>
														<div class="city_container">
															<div class="city_container_left">直辖市</div>
															<div class="city_container_right">
																<span class="city_name">北京</span> <span
																	class="city_name">上海</span> <span class="city_name">天津</span>
																<span class="city_name">重庆</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">内蒙古</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">呼和浩特</span> <span
																	class="city_name">包头</span> <span class="city_name">乌海</span>
																<span class="city_name">赤峰</span> <span
																	class="city_name">通辽</span> <span class="city_name">鄂尔多斯</span>
																<span class="city_name">呼伦贝尔</span> <span
																	class="city_name">巴彦淖尔</span> <span class="city_name">乌兰察布</span>
																<span class="city_name">兴安盟</span> <span
																	class="city_name">锡林郭勒盟</span> <span class="city_name">阿拉善盟</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">山西</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">太原</span> <span
																	class="city_name">大同</span> <span class="city_name">阳泉</span>
																<span class="city_name">长治</span> <span
																	class="city_name">晋城</span> <span class="city_name">朔州</span>
																<span class="city_name">晋中</span> <span
																	class="city_name">运城</span> <span class="city_name">忻州</span>
																<span class="city_name">临汾</span> <span
																	class="city_name">吕梁</span>

															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">陕西</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">西安</span> <span
																	class="city_name">铜川</span> <span class="city_name">宝鸡</span>
																<span class="city_name">咸阳</span> <span
																	class="city_name">渭南</span> <span class="city_name">延安</span>
																<span class="city_name">汉中</span> <span
																	class="city_name">榆林</span> <span class="city_name">安康</span>
																<span class="city_name">商洛</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">河北</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">石家庄</span> <span
																	class="city_name">唐山</span> <span class="city_name">秦皇岛</span>
																<span class="city_name">邯郸</span> <span
																	class="city_name">邢台</span> <span class="city_name">保定</span>
																<span class="city_name">张家口</span> <span
																	class="city_name">承德</span> <span class="city_name">沧州</span>
																<span class="city_name">廊坊</span> <span
																	class="city_name">衡水</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">辽宁</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">沈阳</span> <span
																	class="city_name">大连</span> <span class="city_name">鞍山</span>
																<span class="city_name">抚顺</span> <span
																	class="city_name">本溪</span> <span class="city_name">丹东</span>
																<span class="city_name">锦州</span> <span
																	class="city_name">营口</span> <span class="city_name">阜新</span>
																<span class="city_name">辽阳</span> <span
																	class="city_name">盘锦</span> <span class="city_name">铁岭</span>
																<span class="city_name">朝阳</span> <span
																	class="city_name">葫芦岛</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">吉林</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">长春</span> <span
																	class="city_name">吉林</span> <span class="city_name">四平</span>
																<span class="city_name">辽源</span> <span
																	class="city_name">通化</span> <span class="city_name">白山</span>
																<span class="city_name">松原</span> <span
																	class="city_name">白城</span> <span class="city_name">延边</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">黑龙江</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">哈尔滨</span> <span
																	class="city_name">齐齐哈尔</span> <span class="city_name">鸡西</span>
																<span class="city_name">鹤岗</span> <span
																	class="city_name">双鸭山</span> <span class="city_name">大庆</span>
																<span class="city_name">伊春</span> <span
																	class="city_name">牡丹江</span> <span class="city_name">佳木斯</span>
																<span class="city_name">七台河</span> <span
																	class="city_name">黑河</span> <span class="city_name">绥化</span>
																<span class="city_name">大兴安岭</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">江苏</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">南京</span> <span
																	class="city_name">无锡</span> <span class="city_name">徐州</span>
																<span class="city_name">常州</span> <span
																	class="city_name">苏州</span> <span class="city_name">南通</span>
																<span class="city_name">连云港</span> <span
																	class="city_name">淮安</span> <span class="city_name">盐城</span>
																<span class="city_name">扬州</span> <span
																	class="city_name">镇江</span> <span class="city_name">泰州</span>
																<span class="city_name">宿迁</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">安徽</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">合肥</span> <span
																	class="city_name">蚌埠</span> <span class="city_name">芜湖</span>
																<span class="city_name">淮南</span> <span
																	class="city_name">马鞍山</span> <span class="city_name">淮北</span>
																<span class="city_name">铜陵</span> <span
																	class="city_name">安庆</span> <span class="city_name">黄山</span>
																<span class="city_name">阜阳</span> <span
																	class="city_name">宿州</span> <span class="city_name">滁州</span>
																<span class="city_name">六安</span> <span
																	class="city_name">宣城</span> <span class="city_name">池州</span>
																<span class="city_name">亳州</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">山东</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">济南</span> <span
																	class="city_name">青岛</span> <span class="city_name">淄博</span>
																<span class="city_name">枣庄</span> <span
																	class="city_name">东营</span> <span class="city_name">潍坊</span>
																<span class="city_name">烟台</span> <span
																	class="city_name">威海</span> <span class="city_name">济宁</span>
																<span class="city_name">泰安</span> <span
																	class="city_name">日照</span> <span class="city_name">莱芜</span>
																<span class="city_name">临沂</span> <span
																	class="city_name">德州</span> <span class="city_name">聊城</span>
																<span class="city_name">滨州</span> <span
																	class="city_name">菏泽</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">浙江</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">杭州</span> <span
																	class="city_name">宁波</span> <span class="city_name">温州</span>
																<span class="city_name">嘉兴</span> <span
																	class="city_name">绍兴</span> <span class="city_name">金华</span>
																<span class="city_name">衢州</span> <span
																	class="city_name">舟山</span> <span class="city_name">台州</span>
																<span class="city_name">丽水</span> <span
																	class="city_name">湖州</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">江西</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">南昌</span> <span
																	class="city_name">景德镇</span> <span class="city_name">萍乡</span>
																<span class="city_name">九江</span> <span
																	class="city_name">新余</span> <span class="city_name">鹰潭</span>
																<span class="city_name">赣州</span> <span
																	class="city_name">吉安</span> <span class="city_name">宜春</span>
																<span class="city_name">抚州</span> <span
																	class="city_name">上饶</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">福建</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">福州</span> <span
																	class="city_name">厦门</span> <span class="city_name">莆田</span>
																<span class="city_name">三明</span> <span
																	class="city_name">泉州</span> <span class="city_name">漳州</span>
																<span class="city_name">南平</span> <span
																	class="city_name">龙岩</span> <span class="city_name">宁德</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">湖南</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">长沙</span> <span
																	class="city_name">株洲</span> <span class="city_name">湘潭</span>
																<span class="city_name">衡阳</span> <span
																	class="city_name">邵阳</span> <span class="city_name">岳阳</span>
																<span class="city_name">常德</span> <span
																	class="city_name">张家界</span> <span class="city_name">益阳</span>
																<span class="city_name">郴州</span> <span
																	class="city_name">永州</span> <span class="city_name">怀化</span>
																<span class="city_name">娄底</span> <span
																	class="city_name">湘西</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">湖北</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">武汉</span> <span
																	class="city_name">黄石</span> <span class="city_name">襄樊</span>
																<span class="city_name">十堰</span> <span
																	class="city_name">宜昌</span> <span class="city_name">荆门</span>
																<span class="city_name">鄂州</span> <span
																	class="city_name">孝感</span> <span class="city_name">荆州</span>
																<span class="city_name">黄冈</span> <span
																	class="city_name">咸宁</span> <span class="city_name">随州</span>
																<span class="city_name">恩施</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">河南</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">郑州</span> <span
																	class="city_name">开封</span> <span class="city_name">洛阳</span>
																<span class="city_name">平顶山</span> <span
																	class="city_name">焦作</span> <span class="city_name">鹤壁</span>
																<span class="city_name">新乡</span> <span
																	class="city_name">安阳</span> <span class="city_name">濮阳</span>
																<span class="city_name">许昌</span> <span
																	class="city_name">漯河</span> <span class="city_name">三门峡</span>
																<span class="city_name">南阳</span> <span
																	class="city_name">商丘</span> <span class="city_name">信阳</span>
																<span class="city_name">周口</span> <span
																	class="city_name">驻马店</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">海南</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">海口</span> <span
																	class="city_name">三亚</span> <span class="city_name">三沙</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">广东</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">广州</span> <span
																	class="city_name">深圳</span> <span class="city_name">珠海</span>
																<span class="city_name">汕头</span> <span
																	class="city_name">韶关</span> <span class="city_name">佛山</span>
																<span class="city_name">江门</span> <span
																	class="city_name">湛江</span> <span class="city_name">茂名</span>
																<span class="city_name">东沙群岛</span> <span
																	class="city_name">肇庆</span> <span class="city_name">惠州</span>
																<span class="city_name">梅州</span> <span
																	class="city_name">汕尾</span> <span class="city_name">河源</span>
																<span class="city_name">阳江</span> <span
																	class="city_name">清远</span> <span class="city_name">东莞</span>
																<span class="city_name">中山</span> <span
																	class="city_name">潮州</span> <span class="city_name">揭阳</span>
																<span class="city_name">云浮</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">广西</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">南宁</span> <span
																	class="city_name">柳州</span> <span class="city_name">桂林</span>
																<span class="city_name">梧州</span> <span
																	class="city_name">北海</span> <span class="city_name">防城港</span>
																<span class="city_name">钦州</span> <span
																	class="city_name">贵港</span> <span class="city_name">玉林</span>
																<span class="city_name">百色</span> <span
																	class="city_name">贺州</span> <span class="city_name">河池</span>
																<span class="city_name">来宾</span> <span
																	class="city_name">崇左</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">贵州</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">贵阳</span> <span
																	class="city_name">遵义</span> <span class="city_name">安顺</span>
																<span class="city_name">铜仁</span> <span
																	class="city_name">毕节</span> <span class="city_name">六盘水</span>
																<span class="city_name">黔西南</span> <span
																	class="city_name">黔东南</span> <span class="city_name">黔南</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">四川</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">成都</span> <span
																	class="city_name">自贡</span> <span class="city_name">攀枝花</span>
																<span class="city_name">泸州</span> <span
																	class="city_name">德阳</span> <span class="city_name">绵阳</span>
																<span class="city_name">广元</span> <span
																	class="city_name">遂宁</span> <span class="city_name">内江</span>
																<span class="city_name">乐山</span> <span
																	class="city_name">南充</span> <span class="city_name">宜宾</span>
																<span class="city_name">广安</span> <span
																	class="city_name">达州</span> <span class="city_name">眉山</span>
																<span class="city_name">雅安</span> <span
																	class="city_name">巴中</span> <span class="city_name">资阳</span>
																<span class="city_name">阿坝</span> <span
																	class="city_name">甘孜</span> <span class="city_name">凉山</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">云南</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">昆明</span> <span
																	class="city_name">保山</span> <span class="city_name">昭通</span>
																<span class="city_name">丽江</span> <span
																	class="city_name">普洱</span> <span class="city_name">临沧</span>
																<span class="city_name">曲靖</span> <span
																	class="city_name">玉溪</span> <span class="city_name">文山</span>
																<span class="city_name">西双版纳</span> <span
																	class="city_name">楚雄</span> <span class="city_name">红河</span>
																<span class="city_name">德宏</span> <span
																	class="city_name">大理</span> <span class="city_name">怒江</span>
																<span class="city_name">迪庆</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">甘肃</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">兰州</span> <span
																	class="city_name">嘉峪关</span> <span class="city_name">金昌</span>
																<span class="city_name">白银</span> <span
																	class="city_name">天水</span> <span class="city_name">酒泉</span>
																<span class="city_name">张掖</span> <span
																	class="city_name">武威</span> <span class="city_name">定西</span>
																<span class="city_name">陇南</span> <span
																	class="city_name">平凉</span> <span class="city_name">庆阳</span>
																<span class="city_name">临夏</span> <span
																	class="city_name">甘南</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">宁夏</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">银川</span> <span
																	class="city_name">石嘴山</span> <span class="city_name">吴忠</span>
																<span class="city_name">固原</span> <span
																	class="city_name">中卫</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">青海</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">西宁</span> <span
																	class="city_name">玉树</span> <span class="city_name">果洛</span>
																<span class="city_name">海东</span> <span
																	class="city_name">海西</span> <span class="city_name">黄南</span>
																<span class="city_name">海北</span> <span
																	class="city_name">海南</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">西藏</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">拉萨</span> <span
																	class="city_name">那曲</span> <span class="city_name">昌都</span>
																<span class="city_name">山南</span> <span
																	class="city_name">日喀则</span> <span class="city_name">阿里</span>
																<span class="city_name">林芝</span>
															</div>
														</div>
														<div style="clear: both"></div>
														<div class="city_container">
															<div class="city_container_left">
																<span class="style_color">新疆</span>
															</div>
															<div class="city_container_right">
																<span class="city_name">乌鲁木齐</span> <span
																	class="city_name">克拉玛依</span> <span class="city_name">吐鲁番</span>
																<span class="city_name">哈密</span> <span
																	class="city_name">博尔塔拉</span> <span class="city_name">巴音郭楞</span>
																<span class="city_name">克孜勒苏</span> <span
																	class="city_name">和田</span> <span class="city_name">阿克苏</span>
																<span class="city_name">喀什</span> <span
																	class="city_name">塔城</span> <span class="city_name">伊犁</span>
																<span class="city_name">昌吉</span> <span
																	class="city_name">阿勒泰</span>
															</div>
														</div>
														<div style="clear: both"></div>
													</div>
												</div>

											</div>
											<div id="bside_left">
												<div id="txt_pannel">
													<h3 style="font-size: 16px;width:225px; line-height: 2rem">注意：</h3>
													<p
														style="font-size: 14px;width:225px; line-height: 2rem; margin-bottom: 1rem; color: red">请先更换所在城市后搜索您的加油站</p>

													<p style="font-size: 14px;width:225px; line-height: 2rem; color: red">在搜索框搜索关键词后，地图上会显示相应poi点，同时左侧显示对应该点的信息，点击某点或某信息，右上角会显示相应该点的坐标和地址。</p>
												</div>

											</div>
											<div id="bside_rgiht">
												<div id="container"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%--   <div class="form-group">
	                             <label class="col-sm-3 control-label"><span class="c-red">*</span>位置坐标</label>
	                             <div class="col-md-9">
	                                     <input type="text" name="coordinate" id="lnglat" value="${store.coordinate}" readonly="true" placeholder="左击获取经纬度" class="form-control">
	                             </div>
                             </div> --%>
							<div id="show">
								<label class="col-sm-3 control-label">平台扣点：</label>
								<div class="col-md-9">
									<input type="text" name="points" id="points" onblur="add(this)"
										value="${store.points}" />

								</div>

							</div>



					<div class="form-group">
								<div class="col-sm-4 col-sm-offset-3">
									<button id="submit" onclick="return false;" class="btnnew" type="button">更新</button>
								</div>
							</div>
						                      </form> 
						</div>
					</div>

				</div>
				<div class="col-sm-4">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>商店图片</h5>
						</div>
						<div class="ibox-content">
							<!--                     	  <form class="form-horizontal m-t" id="commentForm" novalidate="novalidate"> -->
							<div class="form-group">
								<label class="col-sm-4 control-label">商店logo：</label>
								<div class="col-sm-8">
									<div id="fileList" class="uploader-list"></div>
									<div id="filePicker">更改logo</div>
								</div>

							</div>
							<div class="form-group">
								<label class="col-sm-4 control-label">商店展示图片：</label>
								<div class="col-sm-8">
									<div id="fileList1" class="uploader-list"></div>
									<div id="filePicker1">更改图片</div>
								</div>
								<br />

							</div>


							<!--                         </form> -->
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<input type="hidden" value="${store.user.username}" id="username" />

	<script src="${pageContext.request.contextPath}/js/home/jquery.min.js?v=2.1.4"></script>
	    <script src="${pageContext.request.contextPath}/js/home/bootstrap.min.js?v=3.3.6"></script>
	    <script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
	    <script src="${pageContext.request.contextPath}/js/home/plugins/validate/jquery.validate.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/site/CityJson.js"></script>
	    <script src="${pageContext.request.contextPath}/js/site/DistrictJson.js"></script>
	    <script src="${pageContext.request.contextPath}/js/site/ProJson.js"></script>
	    <script src="${pageContext.request.contextPath}/js/home/demo/webuploader.js"></script>
 		<script src="${pageContext.request.contextPath}/js/ceshi/uploader2.js"></script>
    	<script src="${pageContext.request.contextPath}/js/ceshi/uploader-sp.js"></script>


	<script type="text/javascript">
	var username=$("#username").val();
	if(username!=null&&username=='admin'){
		$("#show").show();
	}else{
		$("#show").hide();
	}
     

	function add(obj){
		if(obj!=null||typeof(obj)!= "undefined"||obj!=""){
			var sd=	obj.value.indexOf("%");
			if(sd!=-1){
				var newstr=obj.value.replace(/%/, "");
				if(isNaN(newstr)!=true){
					var t=newstr/100;
					$("#points").val(t);
				}
				
				
			}
			
		}
	}

	
    function mainTipContents(type, address, tel,x,y) {  //窗体内容
        if (type == "" || type == "undefined" || type == null || type == " undefined" || typeof type == "undefined") {
            type = "暂无";
        }
        if (address == "" || address == "undefined" || address == null || address == " undefined" || typeof address == "undefined") {
            address = "暂无";
        }
        if (tel == "" || tel == "undefined" || tel == null || tel == " undefined" || typeof address == "tel") {
            tel = "暂无";
        }
        var str = "  地址：" + address + "<br />  电话：" + tel + " <br />  类型：" + type+ " <br /> 坐标：X:" + x+"  Y:"+y;
        return str;
    }
    
      
   
   
	var BASE_URL = "${pageContext.request.contextPath}/css/home";
	   function sub(str){
		   var img=str+"?x-oss-process=style/1_1";
		   return img;
	   }
	$(function () {
		var arr = new Array();
		var url="${!empty store.logo?store.logo:''}";
		if(url){
	    	var obj={};
	    	url=sub(url);
	    	obj.url=url;
	    	arr.push(obj);
	    }
	    var uploaderConfig = {
				url : '${pageContext.request.contextPath}/uploader/upload',
				idSign:"a_a",
				readyData:arr,
				pick:"#filePicker",
				list:"#fileList"
				};
	    
	    var arr2 = new Array();
		var url2="${!empty store.showImage?store.showImage:''}";
		if(url2){
	    	
	    	var url2Arr=url2.split(",");
	    	for(var i in url2Arr){
	    		var url=sub(url2Arr[i]);
	    		var obj2={};
		    	obj2.url=url;
		    	arr2.push(obj2);
	    	}
	    
	    }
	    var uploaderConfig2 = {
				url : '${pageContext.request.contextPath}/uploader/upload',
				idSign:"a_b",
				readyData:arr2,
				pick:"#filePicker1",
				list:"#fileList1"
				};
	    
	
	    
	    var myUploader=new MyUploader(uploaderConfig);
	    var uploader =myUploader.uploader();
	    
	    var myUploader2=new MySpUploader(uploaderConfig2);
	    var uploader2 =myUploader2.uploader();
		
	  
	    
	    $("#submit").click(function(){
	    	/* if($("#name").val()==''||$("#selProvince").val()=='0'||$("#selCity").val()=='0'||$("#selDistrict").val()=='0'||$("#lnglat").val()==''){
	    		alert("请完善详细信息");
	    		return false;
	    	} */

			var imageUrl=myUploader.getUploaderFiles(uploader);
			if(imageUrl!=""&& imageUrl.length>0){
				imageUrl=imageUrl.substring(0,imageUrl.indexOf("?"));
				$("#logo").val(imageUrl);
		   }else{
			   $("#logo").val("");
		   }
			$("#AselProvince").val($("#selProvince").find("option:selected").text());
			$("#AselCity").val($("#selCity").find("option:selected").text());
			$("#AselDistrict").val($("#selDistrict").find("option:selected").text());
			var image=myUploader2.getUploaderFiles(uploader2);
			if(image!=""&& image.length>0){
				//image=image.substring(0,image.indexOf("?"));
				$("#showImage").val(image);
				}
			$.post("${pageContext.request.contextPath}/goods/editShopInfo",
					$('#commentForm').serialize(),
					function(data){
					console.log(data);
						alert(data.message);
						if(data.success==true){
							location.href="${pageContext.request.contextPath}/shop/editShop";
						}
			});
		});
	    
	    
	    
        $.each(province, function (k, p) {
            var option = "<option value='" + p.ProID + "'>" + p.ProName + "</option>";
            $("#selProvince").append(option);
        });
    	
        $("#selProvince").change(function () {
 			var b =$("#selProvince").find("option:selected").text();
 			$("#desite").val(b);
            var selValue = $(this).val();
            $("#selDist").val("");
            $("#selCi").val("");
            $("#selCity option:gt(0)").remove();
            $("#selDistrict option:gt(0)").remove();
            $.each(city, function (k, p) {
                if (p.ProID == selValue) {
                var option = "<option value='" + p.CityID + "'>" + p.CityName + "</option>";
                $("#selCity").append(option);
                }
            });
        });
    
        $("#selCity").change(function () {
        	 var b =$("#desite").val()+$("#selCity").find("option:selected").text();
        	 $("#desite").val(b);
            var selValue = $(this).val();
            $("#selDistrict option:gt(0)").remove();
            $.each(District, function (k, p) {
                if (p.CityID == selValue) {
                    var option = "<option value='" + p.Id + "'>" + p.DisName + "</option>";
                    $("#selDistrict").append(option);
                }
            });
        });
        $("#selDistrict").change(function () {
        	  var b =$("#desite").val()+$("#selDistrict").find("option:selected").text();
        	  $("#desite").val(b);
        });
        
    	var provinceb="${!empty store.province ? store.province:''}";
        $("#selProvince option").each(function (){
		    if(provinceb&&$(this).text()== provinceb){
		        $(this).attr('selected',true).change();
		    }
		}); 
        var cityb="${!empty store.city ? store.city:''}";
        $("#selCity option").each(function (){
		    if(cityb&&$(this).text()==cityb){
		        $(this).attr('selected',true).change();
		    }
		});
        var districtb="${!empty store.district ? store.district:''}";
        $("#selDistrict option").each(function (){
        	if(districtb&&$(this).text()==districtb){
		        $(this).attr('selected',true).change();
		    }
		});
	});
	</script> 
	<script type="text/javascript">
	var city = document.getElementById("city").style.display = "none";;
	var curCity;
		var container = document.getElementById("container");
		var map = new qq.maps.Map(container, {
			zoom : 10

		}), label = new qq.maps.Label({
			map : map,
			offset : new qq.maps.Size(15, -12),
			draggable : false,
			clickable : false
		}), markerArray = [], curCity = document.getElementById("cur_city"), btnSearch = document.getElementById("btn_search"), bside = document.getElementById("bside_left"), url, query_city, cityservice = new qq.maps.CityService(
				{
					complete : function(result) {
						curCity.children[0].innerHTML = result.detail.name;
						map.setCenter(result.detail.latLng);
					}
				});
		cityservice.searchLocalCity();
		map.setOptions({
			draggableCursor : "crosshair"
		});

		$(container).mouseenter(function() {
			label.setMap(map);
		});
		$(container).mouseleave(function() {
			label.setMap(null);
		});

		qq.maps.event.addListener(map, "mousemove", function(e) {
			var latlng = e.latLng;
			label.setPosition(latlng);
			label.setContent(latlng.getLat().toFixed(6) + ","
					+ latlng.getLng().toFixed(6));
		});

		var url3;
		qq.maps.event
				.addListener(
						map,
						"click",
						function(e) {
							document.getElementById("poi_cur").value = e.latLng
									.getLat().toFixed(6)
									+ "," + e.latLng.getLng().toFixed(6);
							url3 = encodeURI("http://apis.map.qq.com/ws/geocoder/v1/?location="
									+ e.latLng.getLat()
									+ ","
									+ e.latLng.getLng()
									+ "&key=AXQBZ-ODQ3U-KMLVO-2HSU5-AQTC3-RQF5V&output=jsonp&&callback=?");
							$.getJSON(url3,function(result) {
												if (result.result != undefined) {
													document.getElementById("addr_cur").value = result.result.address;
												} else {
													document.getElementById("addr_cur").value = "";
												}

											})
						});

		qq.maps.event.addListener(map, "zoom_changed", function() {
			document.getElementById("level").innerHTML = "当前缩放等级："
					+ map.getZoom();
		});
		var listener_arr = [];
		var isNoValue = false;
		qq.maps.event.addDomListener(btnSearch,'click',function() {
							var value = this.parentNode.getElementsByTagName("input")[0].value;
							var latlngBounds = new qq.maps.LatLngBounds();
							for (var i = 0, l = listener_arr.length; i < l; i++) {
								qq.maps.event.removeListener(listener_arr[i]);
							}
							listener_arr.length = 0;
							query_city = curCity.children[0].innerHTML;
							url = encodeURI("http://apis.map.qq.com/ws/place/v1/search?keyword="
									+ value
									+ "&boundary=region("
									+ query_city
									+ ",0)&page_size=9&page_index=1&key=AXQBZ-ODQ3U-KMLVO-2HSU5-AQTC3-RQF5V&output=jsonp&&callback=?");
							$.getJSON(url,function(result) {
												if (result.count) {
													isNoValue = false;
													bside.innerHTML = "";
													each(markerArray, function(
															n, ele) {
														ele.setMap(null);
													});
													markerArray.length = 0;
													each(
															result.data,
															function(n, ele) {
																var latlng = new qq.maps.LatLng(
																		ele.location.lat,
																		ele.location.lng);
																latlngBounds
																		.extend(latlng);
																var left = n * 27;
																var marker = new qq.maps.Marker(
																		{
																			map : map,
																			position : latlng,
																			zIndex : 10
																		});
																marker.index = n;
																marker.isClicked = false;
																setAnchor(
																		marker,
																		true);
																markerArray
																		.push(marker);
																var listener1 = qq.maps.event
																		.addDomListener(
																				marker,
																				"mouseover",
																				function() {
																					var n = this.index;
																					setCurrent(
																							markerArray,
																							n,
																							false);
																					setCurrent(
																							markerArray,
																							n,
																							true);
																					label
																							.setContent(this.position
																									.getLat()
																									.toFixed(
																											6)
																									+ ","
																									+ this.position
																											.getLng()
																											.toFixed(
																													6));
																					label
																							.setPosition(this.position);
																					label
																							.setOptions({
																								offset : new qq.maps.Size(
																										15,
																										-20)
																							})

																				});
																listener_arr
																		.push(listener1);
																var listener2 = qq.maps.event
																		.addDomListener(
																				marker,
																				"mouseout",
																				function() {
																					var n = this.index;
																					setCurrent(
																							markerArray,
																							n,
																							false);
																					setCurrent(
																							markerArray,
																							n,
																							true);
																					label
																							.setOptions({
																								offset : new qq.maps.Size(
																										15,
																										-12)
																							})
																				});
																listener_arr
																		.push(listener2);
																var listener3 = qq.maps.event
																		.addDomListener(
																				marker,
																				"click",
																				function() {
																					var n = this.index;
																					setFlagClicked(
																							markerArray,
																							n);
																					setCurrent(
																							markerArray,
																							n,
																							false);
																					setCurrent(
																							markerArray,
																							n,
																							true);
																					document
																							.getElementById("addr_cur").value = bside.childNodes[n].childNodes[1].childNodes[1].innerHTML
																							.substring(3);
																				});
																listener_arr
																		.push(listener3);
																map
																		.fitBounds(latlngBounds);
																var div = document
																		.createElement("div");
																div.className = "info_list";
																var order = document
																		.createElement("div");
																var leftn = -54
																		- 17
																		* n;
																order.style.cssText = "width:17px;height:17px;margin:3px 3px 0px 0px;float:left;background:url(../resources/img/marker_n.png) "
																		+ leftn
																		+ "px 0px";
																div
																		.appendChild(order);
																var pannel = document
																		.createElement("div");
																pannel.style.cssText = "width:200px;float:left;";
																div
																		.appendChild(pannel);
																var name = document
																		.createElement("p");
																name.style.cssText = "margin:0px;color:#0000CC";
																name.innerHTML = ele.title;
																pannel
																		.appendChild(name);
																var address = document
																		.createElement("p");
																address.style.cssText = "margin:0px;";
																address.innerHTML = "地址："
																		+ ele.address;
																pannel
																		.appendChild(address);
																if (ele.tel != undefined) {
																	var phone = document
																			.createElement("p");
																	phone.style.cssText = "margin:0px;";
																	phone.innerHTML = "电话："
																			+ ele.tel;
																	pannel
																			.appendChild(phone);
																}
																var position = document
																		.createElement("p");
																position.style.cssText = "margin:0px;";
																position.innerHTML = "坐标："
																		+ ele.location.lat.toFixed(6)
																		+ "，"
																		+ ele.location.lng.toFixed(6);
																pannel.appendChild(position);
																bside.appendChild(div);
																div.style.height = pannel.offsetHeight
																		+ "px";
																div.isClicked = false;
																div.index = n;
																marker.div = div;
																div.marker = marker;
															});
													$("#bside_left")
															.delegate(
																	".info_list",
																	"mouseover",
																	function(e) {

																		var n = this.index;

																		setCurrent(
																				markerArray,
																				n,
																				false);
																		setCurrent(
																				markerArray,
																				n,
																				true);
																	});
													$("#bside_left").delegate(".info_list","mouseout",function() {
																		each(
																				markerArray,
																				function(
																						n,
																						ele) {
																					if (!ele.isClicked) {
																						setAnchor(
																								ele,
																								true);
																						ele.div.style.background = "#fff";
																					}
																				})
																	});
													$("#bside_left")
															.delegate(
																	".info_list",
																	"click",
																	function(e) {
																		var n = this.index;
																		setFlagClicked(
																				markerArray,
																				n);
																		setCurrent(
																				markerArray,
																				n,
																				false);
																		setCurrent(
																				markerArray,
																				n,
																				true);
																		map
																				.setCenter(markerArray[n].position);
																		document.getElementById("addr_cur").value = this.childNodes[1].childNodes[1].innerHTML.substring(3);
																	});
												} else {

													bside.innerHTML = "";
													each(markerArray, function(
															n, ele) {
														ele.setMap(null);
													});
													markerArray.length = 0;
													var novalue = document
															.createElement('div');
													novalue.id = "no_value";
													novalue.innerHTML = "对不起，没有搜索到你要找的结果!";
													bside.appendChild(novalue);
													isNoValue = true;
												}
											});
						});

		btnSearch.onmousedown = function() {
			this.className = "btn_active";
		};
		btnSearch.onmouseup = function() {
			this.className = "btn";
		};
		function setAnchor(marker, flag) {
			var left = marker.index * 27;
			if (flag == true) {
				var anchor = new qq.maps.Point(10, 30), origin = new qq.maps.Point(
						left, 0), size = new qq.maps.Size(27, 33), icon = new qq.maps.MarkerImage(
						"../resources/img/marker10.png", size, origin, anchor);
				marker.setIcon(icon);
			} else {
				var anchor = new qq.maps.Point(10, 30), origin = new qq.maps.Point(
						left, 35), size = new qq.maps.Size(27, 33), icon = new qq.maps.MarkerImage(
						"../resources/img/marker10.png", size, origin, anchor);
				marker.setIcon(icon);
			}
		}
		function setCurrent(arr, index, isMarker) {
			if (isMarker) {
				each(markerArray, function(n, ele) {
					if (n == index) {
						setAnchor(ele, false);
						ele.setZIndex(10);
					} else {
						if (!ele.isClicked) {
							setAnchor(ele, true);
							ele.setZIndex(9);
						}
					}
				});
			} else {
				each(markerArray, function(n, ele) {
					if (n == index) {
						ele.div.style.background = "#DBE4F2";
					} else {
						if (!ele.div.isClicked) {
							ele.div.style.background = "#fff";
						}
					}
				});
			}
		}
		function setFlagClicked(arr, index) {
			each(markerArray, function(n, ele) {
				if (n == index) {
					ele.isClicked = true;
					ele.div.isClicked = true;
					var str = '<div style="width:250px;">'
							+ ele.div.children[1].innerHTML.toString()
							+ '</div>';
					var latLng = ele.getPosition();
					document.getElementById("poi_cur").value = latLng.getLat()
							.toFixed(6)
							+ "," + latLng.getLng().toFixed(6);
				} else {
					ele.isClicked = false;
					ele.div.isClicked = false;
				}
			});
		}
		var city = document.getElementById("city");
		curCity.onclick = function(e) {
			var e = e || window.event, target = e.target || e.srcElement;
			if (target.innerHTML == "更换城市") {
				city.style.display = "block";
				
				if (isNoValue) {
					bside.innerHTML = "";
					each(markerArray, function(n, ele) {
						ele.setMap(null);
					});
					markerArray.length = 0;
				}

			}
		};

		var url2;
		city.onclick = function(e) {
			alert();
			var e = e || window.event, target = e.target || e.srcElement;
			if (target.className == "close") {
				city.style.display = "none";
			}
			if (target.className == "city_name") {
				curCity.children[0].innerHTML = target.innerHTML + "市";
				url2 = encodeURI("http://apis.map.qq.com/ws/geocoder/v1/?region="
						+ curCity.children[0].innerHTML
						+ "&address="
						+ curCity.children[0].innerHTML
						+ "&key=AXQBZ-ODQ3U-KMLVO-2HSU5-AQTC3-RQF5V&output=jsonp&&callback=?");
				$.getJSON(url2, function(result) {
					map.setCenter(new qq.maps.LatLng(
							result.result.location.lat,
							result.result.location.lng));
					map.setZoom(10);
				});
				city.style.display = "none";
			}
		};

		var url4;
		$(".search_t").autocomplete({
							source : function(request, response) {
								url4 = encodeURI("http://apis.map.qq.com/ws/place/v1/suggestion/?keyword="
										+ request.term
										+ "&region="
										+ curCity.children[0].innerHTML
										+ "&key=AXQBZ-ODQ3U-KMLVO-2HSU5-AQTC3-RQF5V&output=jsonp&&callback=?");
								$.getJSON(url4, function(result) {

									response($.map(result.data, function(item) {
										return ({
											label : item.title

										})
									}));
								});
							}
						});

		function each(obj, fn) {
			for (var n = 0, l = obj.length; n < l; n++) {
				fn.call(obj[n], n, obj[n]);
			}
		}
	</script>
</html>