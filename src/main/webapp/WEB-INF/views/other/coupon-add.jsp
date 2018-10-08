<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="${pageContext.request.contextPath}/resources/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<style>
.error{
	color:green;
font-size:13px;
margin-left:5px;
padding-left:16px; 
}

</style>
</head>
<body>
<div class="page-container">
	<form id="form" class="form form-horizontal" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>优惠券名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="sysCouponName" name="sysCouponName" required="required"  aria-required="true"  style="width:19%"  placeholder="请输入优惠券名称">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>抵现金额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="amount" id="amount" placeholder="请输入优惠券金额" value="" class="input-text"  required="required" style="width:19%">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>满减金额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="fullAmount" id="fullAmount" placeholder="请输入满减金额" value="" class="input-text"  required="required" style="width:19%">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">发放数量：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="sendSum" id="sendSum" placeholder="请输入发放数量" value="" class="input-text" style="width:19%">

			</div>


				
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">优惠券排序：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="sort" id="sort" placeholder="" value="" class="input-text"  style="width:19%">
				元</div>
		</div>
		 <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>日期范围：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input  placeholder="开始日期" class="input-text"  id="start" name="startTime" style="width:19%"  required="required" value=""/>
			-
			<input  placeholder="结束日期" class="input-text"  id="end" name="endTime" style="width:19%"  required="required" value=""/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea rows="" cols="" name="note" id="note" placeholder="" value="" class="input-text" style="width:19%"></textarea>
				元</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button id="article_save" class="btn btn-secondary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
 <script src="${pageContext.request.contextPath}/js/home/plugins/layer/laydate/laydate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
 <%--  <script src="${pageContext.request.contextPath}/resources/js/home/jquery.min.js?v=2.1.4"></script>  --%>
   <script src="${pageContext.request.contextPath}/resources/js/home/plugins/chosen/chosen.jquery.js"></script>
<script type="text/javascript">
var start={elem:"#start",format:"YYYY/MM/DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){end.min=datas;end.start=datas}};
var end={elem:"#end",format:"YYYY/MM/DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){start.max=datas}};
laydate(start);
laydate(end); 
 $.validator.setDefaults({
    submitHandler: function() {
     // alert("提交事件!");
    }
});
$().ready(function() {
	// 提交时验证表单
	var validator = $("#form").validate({
		rules:{
			goodsName:{
				required: true
			},
			goodsClass:{
				required: true
			},
			marketPrice:{
				required: true
			}
		},
		errorElement: "span",
		messages: {
			goodsName: {
				required: " (必需字段)",
				minlength: " (不能少于 3 个字母)"
			},
			goodsClass:{
				required: " (必需字段)"
			},
			marketPrice:{
				required: " (必需字段)"
			}
			
		}
	});
}); 
	$("#article_save").click(function(){
		$.post("${pageContext.request.contextPath}/coupon/saveCoupon",$('#form').serialize(),function(data){
			alert(data.message);
			if(data.success==true){
				location.href="../coupon/showCoupon";
			}
		});
	});
	
		function myDate(date,layout){
			 var strStart ="";
			 if(date!=""){
				 if(layout==null){layout="yyyy-MM-dd HH:mm:ss"}
				 var sdf=new SimpleDateFormat(); //
				 sdf.applyPattern(layout);
			     var mytime =new Date();
			     mytime.setTime(date)
			     strStart=sdf.format(mytime); 
			 }
		   return strStart;
		}
</script>

</body>
</html>