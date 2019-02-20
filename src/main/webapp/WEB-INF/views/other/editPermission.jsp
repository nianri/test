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
<style>
ul { list-style-type: none;}
li { display: inline-block;}
li { margin: 10px 0;}
input.labelauty + label { font: 12px "Microsoft Yahei";}
</style>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="shortcut icon" href="favicon.ico">
<link
	href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/home/animate.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/home/plugins/chosen/chosen.css"
	rel="stylesheet">
</head>
<body class="gray-bg">

	<div class="wrapper wrapper-content animated fadeInRight ">

		<div class="row" style="font-size:15px;">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>更改权限</h5>
						<div class="ibox-tools">
							<button class="btn btn-primary btn-xs" id="submit"
								onclick="return false;">更新</button>
							<button onclick="JavaScript:history.back(-1);" type="button"
								class="btn btn-w-m btn-white btn-xs">
								<i class="fa fa-reply"></i>返回
							</button>
						</div>
					</div>
					<div class="ibox-content">
					<form class="form-horizontal m-t" id="form" method="post">
					 <input name="id" id="id" type="hidden" value="${!empty obj.id ? obj.id:''}">
						<div class="form-group checkbox checkbox-inline">
							<table  width="800px" border="0px"  cellspacing="0" cellpadding="0" style="margin-left:200px;" > 
								<tr style="font-weight:bold; font-size:16px; ">
									<td style="text-align:center;">
									一级类目
									</td>
									<td colspan = " 3 " style="text-align:center;">
									二级类目
									</td>
								</tr>
								<tr style="background-color:#F0F0F0" > 
								  <th rowspan="2" style="text-align:center;" >
								  	<input id="inlineCheckbox3"  type="checkbox" class="checkAll1" value="1" name="subBox" /><label style="font-weight:bold; font-size:16px;" >广告管理</label>
								  </th>
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="11" name="subBox" class="1" ><label>全部广告 </label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									
								</tr> 
								<tr style="background-color:#F0F0F0"> 
								
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr> 
								<tr >
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll2" value="3" name="subBox" /><label style="font-weight:bold; font-size:16px;" >权限管理</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="31" name="subBox" class="2"><label  >用户管理</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="32" name="subBox" class="2"><label  >角色管理</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr> 
								<tr style="background-color:#F0F0F0"> 
									 <th rowspan="2" style="text-align:center;" >
									  	<input id="inlineCheckbox3"  type="checkbox" class="checkAll3" value="2" name="subBox" /><label style="font-weight:bold; font-size:16px;" >我的商品</label>
									 </th>
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="21" name="subBox" class="3"><label  > 商品管理 </label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td>  
								</tr> 
								<tr style="background-color:#F0F0F0"> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										
									</td> 
								</tr> 
								<tr >
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll4" value="4" name="subBox" /><label style="font-weight:bold; font-size:16px;" >优惠管理</label>
									</th> 
									
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="41" name="subBox" class="4"><label  > 全部优惠券</label>
									</td> 
									
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="42" name="subBox" class="4"><label  > 已领取优惠券</label>
									</td> 
								</tr> 
								<tr style="background-color:#F0F0F0" >
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll5" value="5" name="subBox" /><label style="font-weight:bold; font-size:16px;" >入驻管理</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="51" name="subBox" class="5"><label  > 入驻审核</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr> 
								
								<tr >
									<th rowspan="1" style="text-align:center;" >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll12" value="7" name="subBox" /><label style="font-weight:bold; font-size:16px;" >我的店铺</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="71" name="subBox" class="12"><label  >店铺信息设置</label>
									</td> 
									
								</tr>
								<tr style="background-color:#F0F0F0" >
									<th rowspan="1" style="text-align:center;" >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll6" value="6" name="subBox" /><label style="font-weight:bold; font-size:16px;" >商店管理</label>
									</th> 
									
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="61" name="subBox" class="6"><label  > 店铺列表</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								     <td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr>
								
								<tr >
									<th rowspan="4" style="text-align:center;" >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll13" value="8" name="subBox" /><label style="font-weight:bold; font-size:16px;" >我的订单</label>
									</th> 
										<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="81" name="subBox" class="13"><label  >全部订单</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="82" name="subBox" class="13"><label  > 待付款订单</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="83" name="subBox" class="13"><label  > 待接订单</label>
									</td>
								</tr>
									<tr > 	
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="84" name="subBox" class="13"><label  > 待确认完成订单</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="85" name="subBox" class="13"><label  >待评价订单</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="86" name="subBox" class="13"><label  > 已完成订单</label>
									</td> 
								</tr>	
								<tr > 
								<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="87" name="subBox" class="13"><label  > 待加油订单</label>
									</td> 	
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="88" name="subBox" class="13"><label  > 待退款订单</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr>	 
								<tr > 	
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr>  
								<tr style="background-color:#F0F0F0" >
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll7" value="9" name="subBox" /><label style="font-weight:bold; font-size:16px;" >会员管理</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="91" name="subBox" class="7"><label > 全部会员</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr>
								
								<tr >
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll8" value="12" name="subBox" /><label style="font-weight:bold; font-size:16px;" >统计信息</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="121" name="subBox" class="8"><label  >订单统计1</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									<input type="checkbox" id="inlineCheckbox3" value="122" name="subBox" class="8"><label  >资金变动</label>
									</td> 
								</tr>
								
								<tr>
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll10" value="10" name="subBox" /><label style="font-weight:bold; font-size:16px;" >平台资金</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="101" name="subBox" class="10"><label >提现审核</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
								</tr>
								
							    <tr style="background-color:#F0F0F0" >
									<th  style="text-align:center;"  >
									  	<input id="inlineCheckbox3"  type="checkbox"  class="checkAll11" value="111" name="subBox" /><label style="font-weight:bold; font-size:16px;" >商家资金</label>
									</th> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
										<input type="checkbox" id="inlineCheckbox3" value="112" name="subBox" class="11"><label >提现</label>
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									<td width="200" class="col-sm-3 control-label" style="text-align:left;">
									</td> 
									
								</tr>
								
								
							</table> 
						</div>
					</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/home/jquery.min.js?v=2.1.4"></script>
	<script
		src="${pageContext.request.contextPath}/js/home/bootstrap.min.js?v=3.3.6"></script>
	<script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/home//plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/home//plugins/chosen/chosen.jquery.js"></script>
<!-- 联动选择 -->
<script type="text/javascript">
        $(function() {
           $(".checkAll1").click(function() {
                $('input.1').prop("checked",this.checked); 
            });
           $('input.1').click(function() {
        	   var t = $('input.1').is(':checked');
        	   if(!t){
               $(".checkAll1").prop("checked",this.checked); 
        	   }
        	   
           });
           $('input.1').click(function() {
        	   var t = $(".checkAll1").is(':checked');
        	   if(!t){
               $(".checkAll1").prop("checked",this.checked); 
        	   }
        	   
           });
            var $subBox = $("input.1");
            $subBox.click(function(){
                $("#checkAll1").prop("checked",$subBox.length == $("input.1:checked").length ? true : true);
            });
        });
        $(function() {
            $(".checkAll2").click(function() {
                 $('input.2').prop("checked",this.checked); 
             });
            $('input.2').click(function() {
         	   var t = $('input.2').is(':checked');
         	   if(!t){
                $(".checkAll2").prop("checked",this.checked); 
         	   }
         	   
            });
            $('input.2').click(function() {
         	   var t = $(".checkAll2").is(':checked');
         	   if(!t){
                $(".checkAll2").prop("checked",this.checked); 
         	   }
         	   
            });
             var $subBox = $("input.2");
             $subBox.click(function(){
                 $("#checkAll2").prop("checked",$subBox.length == $("input.2:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll3").click(function() {
                 $('input.3').prop("checked",this.checked); 
             });
            $('input.3').click(function() {
          	   var t = $('input.3').is(':checked');
          	   if(!t){
                 $(".checkAll3").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.3').click(function() {
          	   var t = $(".checkAll3").is(':checked');
          	   if(!t){
                 $(".checkAll3").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.3");
             $subBox.click(function(){
                 $("#checkAll3").prop("checked",$subBox.length == $("input.3:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll4").click(function() {
                 $('input.4').prop("checked",this.checked); 
             });
            $('input.4').click(function() {
          	   var t = $('input.4').is(':checked');
          	   if(!t){
                 $(".checkAll4").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.4').click(function() {
          	   var t = $(".checkAll4").is(':checked');
          	   if(!t){
                 $(".checkAll4").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.4");
             $subBox.click(function(){
                 $("#checkAll4").prop("checked",$subBox.length == $("input.4:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll5").click(function() {
                 $('input.5').prop("checked",this.checked); 
             });
            $('input.5').click(function() {
          	   var t = $('input.5').is(':checked');
          	   if(!t){
                 $(".checkAll5").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.5').click(function() {
          	   var t = $(".checkAll5").is(':checked');
          	   if(!t){
                 $(".checkAll5").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.5");
             $subBox.click(function(){
                 $("#checkAll5").prop("checked",$subBox.length == $("input.5:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll6").click(function() {
                 $('input.6').prop("checked",this.checked); 
             });
            $('input.6').click(function() {
          	   var t = $('input.6').is(':checked');
          	   if(!t){
                 $(".checkAll6").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.6').click(function() {
          	   var t = $(".checkAll6").is(':checked');
          	   if(!t){
                 $(".checkAll6").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.6");
             $subBox.click(function(){
                 $("#checkAll6").prop("checked",$subBox.length == $("input.6:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll7").click(function() {
                 $('input.7').prop("checked",this.checked); 
             });
            $('input.7').click(function() {
          	   var t = $('input.7').is(':checked');
          	   if(!t){
                 $(".checkAll7").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.7').click(function() {
          	   var t = $(".checkAll7").is(':checked');
          	   if(!t){
                 $(".checkAll7").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.7");
             $subBox.click(function(){
                 $("#checkAll7").prop("checked",$subBox.length == $("input.7:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll8").click(function() {
                 $('input.8').prop("checked",this.checked); 
             });
            $('input.8').click(function() {
          	   var t = $('input.8').is(':checked');
          	   if(!t){
                 $(".checkAll8").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.8').click(function() {
          	   var t = $(".checkAll8").is(':checked');
          	   if(!t){
                 $(".checkAll8").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.8");
             $subBox.click(function(){
                 $("#checkAll8").prop("checked",$subBox.length == $("input.8:checked").length ? true : true);
             });
         });
        $(function() {
            $(".checkAll9").click(function() {
                 $('input.9').prop("checked",this.checked); 
             });
            $('input.9').click(function() {
          	   var t = $('input.9').is(':checked');
          	   if(!t){
                 $(".checkAll9").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.9').click(function() {
          	   var t = $(".checkAll9").is(':checked');
          	   if(!t){
                 $(".checkAll9").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.9");
             $subBox.click(function(){
                 $("#checkAll9").prop("checked",$subBox.length == $("input.9:checked").length ? true : true);
             });
         });
        
        $(function() {
            $(".checkAll10").click(function() {
                 $('input.10').prop("checked",this.checked); 
             });
            $('input.10').click(function() {
          	   var t = $('input.10').is(':checked');
          	   if(!t){
                 $(".checkAll10").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.10').click(function() {
          	   var t = $(".checkAll10").is(':checked');
          	   if(!t){
                 $(".checkAll10").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.10");
             $subBox.click(function(){
                 $("#checkAll10").prop("checked",$subBox.length == $("input.10:checked").length ? true : true);
             });
         });
        
        $(function() {
            $(".checkAll11").click(function() {
                 $('input.11').prop("checked",this.checked); 
             });
            $('input.11').click(function() {
          	   var t = $('input.11').is(':checked');
          	   if(!t){
                 $(".checkAll11").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.11').click(function() {
          	   var t = $(".checkAll11").is(':checked');
          	   if(!t){
                 $(".checkAll11").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.11");
             $subBox.click(function(){
                 $("#checkAll11").prop("checked",$subBox.length == $("input.11:checked").length ? true : true);
             });
         });
        
        $(function() {
            $(".checkAll12").click(function() {
                 $('input.12').prop("checked",this.checked); 
             });
            $('input.12').click(function() {
          	   var t = $('input.12').is(':checked');
          	   if(!t){
                 $(".checkAll12").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.12').click(function() {
          	   var t = $(".checkAll12").is(':checked');
          	   if(!t){
                 $(".checkAll12").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.12");
             $subBox.click(function(){
                 $("#checkAll12").prop("checked",$subBox.length == $("input.12:checked").length ? true : true);
             });
         });
        
        $(function() {
            $(".checkAll13").click(function() {
                 $('input.13').prop("checked",this.checked); 
             });
            $('input.13').click(function() {
          	   var t = $('input.13').is(':checked');
          	   if(!t){
                 $(".checkAll13").prop("checked",this.checked); 
          	   }
          	   
             });
             $('input.13').click(function() {
          	   var t = $(".checkAll13").is(':checked');
          	   if(!t){
                 $(".checkAll13").prop("checked",this.checked); 
          	   }
          	   
             });
             var $subBox = $("input.13");
             $subBox.click(function(){
                 $("#checkAll13").prop("checked",$subBox.length == $("input.13:checked").length ? true : true);
             });
         });
    </script>
    <!-- 数据回显 -->
    <script type="text/javascript">
    $(function(){
		var checkeds = "";
    	<c:forEach items="${obj.permissionList}" var="item" >
    	checkeds = ${item.id}+","+checkeds;
		</c:forEach>
		var checkArray =checkeds.split(",");
		var checkBoxAll = $("input[name='subBox']");
		//获得所有复选框（新闻,微信,论坛，问答，博客，平媒）的value值，然后，用checkArray中的值和他们比较，如果有，则说明该复选框被选中
		for(var i=0;i<checkArray.length;i++){
			//获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
			$.each(checkBoxAll,function(j,checkbox){
				//获取复选框的value属性
				var checkValue=$(checkbox).val();
				if(checkArray[i]==checkValue){
					$(checkbox).attr("checked",true);
				}
			})
		}
    })
    </script>
    <script type="text/javascript">
    function fun(){
        obj = document.getElementsByName("subBox");
        check_val = [];
        for(k in obj){
            if(obj[k].checked)
                check_val.push(obj[k].value);
        }
    }
    </script>
    <script type="text/javascript">
  //提交表单
  var url="${pageContext.request.contextPath}/"+"${!empty pageUrl ? pageUrl:''}";
  $("#submit").click(function(){
			$.post("${pageContext.request.contextPath}/admin/editPermission",$('#form').serialize(),function(data){
				if(data.success==true){
					alert(data.message);
					location.href=url;
				}
				
			});	
				
	});    
    
    </script>
</body>
</html>
