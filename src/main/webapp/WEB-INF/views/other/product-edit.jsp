<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	color:gray;
}
</style>
</head>
<body>
<div class="page-container">
	<form id="form" class="form form-horizontal" >
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品ID：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${goods.id}"  id="id" name="id">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${goods.goodsName}"  id="goodsName" name="goodsName" required="required"  aria-required="true"  placeholder="" onblur="add()" onfocus="remove()">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">所属分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="goodsClass" id="goodsClass" class="select"  >
					<option value="0" <c:if test="${goods.goodsClass==0}"></c:if>>柴油</option>
					<option value="1" <c:if test="${goods.goodsClass==1}" ></c:if>>汽油</option>
					<option value="2"  <c:if test="${goods.goodsClass==2}"></c:if>>其他</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">排序值：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${goods.sort}" placeholder="" id="" name="sort">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">价格计算单位：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="company">
					<option value="1" <c:if test="${goods.marketPrice==1}"></c:if>>件</option>
					<option value="2" <c:if test="${goods.marketPrice==2}"></c:if>>斤</option>
					<option value="3" <c:if test="${goods.marketPrice==3}"></c:if>>KG</option>
					<option value="4" <c:if test="${goods.marketPrice==4}"></c:if>>吨</option>
					<option value="5" <c:if test="${goods.marketPrice==5}"></c:if>>套</option>
					<option value="6" <c:if test="${goods.marketPrice==6}"></c:if>>升</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">市场价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="marketPrice" id="marketPrice" placeholder="" value="${goods.marketPrice}" class="input-text"  required="required" style="width:90%" onblur="addPrivice(this)">
				元</div>
		</div>
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">优惠价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="price" id="marketPrice" placeholder="" value="${goods.price}" class="input-text"  required="required" style="width:90%" onblur="addPrivice(this)">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
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
				required: true,
				remote:{
					url: "${pageContext.request.contextPath}/goods/chekName",
					 type: "post",               //数据发送方式
					    dataType: "json",
					    data: { name:function() {return $("#goodsName").val();}
					    }
				}
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
				minlength: " (不能少于 3 个字母)",
				remote:"该商品名已经存在"
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
function isNull(str) {
	return str == null || typeof(str) == "undefined" || str == "";
} 
	function add(){
		var goodsName=$("#goodsName").val();
		//alert(goodsName);
		var str =goodsName.lastIndexOf("#");
		if(!isNull(goodsName)&&goodsName!="#" && str<=0){
			document.getElementById("goodsName").value=goodsName+"#";
		}
	}
	function remove(){
		var goodsName=$("#goodsName").val();
		for(var i=1;i<=goodsName.length;i++){
			var str=goodsName.charAt(i-1);
			if(str=="#"){
				goodsName = goodsName.replace("#","");
				document.getElementById("goodsName").value=goodsName;
				
			}
		}
	}
	function trim(str){
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	function addPrivice(obj){
		var str= trim(obj.value);
		if(str == null ||str == ""){
			return;
		}
		if(isNaN(str)){
			alert("请输入数字");
			obj.value="";
			return false;
		}
		str = parseFloat(str).toFixed(2);//将字符串转换成 浮点数
		var intNumber;//保存整数位
		var floatNumber;//保存小数位
		if(str.indexOf(".")!=-1){
			intNumber=str.substr(0,str.indexOf("."));
			floatNumber=str.substr(str.indexOf("."),str.length);
		}
		var chastr = reverseStr(intNumber);
		var tem = "";
		for(var j = 1;j <= chastr.length;j++){
			var te = chastr.charAt(j-1);
			tem += te;
			if(j%3 == 0 && j != chastr.length){
				tem = tem + ",";
			}
		}
		intNumber = reverseStr(tem);
		str = intNumber + floatNumber;
		obj.value = str;
	}
	function reverseStr(str){
		var temp;
		var sumStr="";
			for(var i=str.length-1;i>=0;i--){
				temp=str.charAt(i);
				sumStr += temp;
			}
			return sumStr;
		}
	$("#article_save").click(function(){
		 // if(form.form()){
			  alert();
		$.post("../goods/editProduct",$('#form').serialize(),function(data){
			alert(data.message);
			if(data.success==true){
				location.href="../goods/goods";
			}
		});
		//  }
	});
	
	
</script>

</body>
</html>