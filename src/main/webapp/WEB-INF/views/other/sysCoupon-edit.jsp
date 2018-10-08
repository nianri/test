<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/css3pie/2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="../resources/static/h-ui/css/H-ui.css"/>
<!-- <link type="text/css" rel="stylesheet" href="../resources/static/h-ui/css/H-ui.admin.css"/> -->
<link type="text/css" rel="stylesheet" href="../resources/static/font-awesome.min93e3.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<!--[if IE 7]>
<link href="http://www.bootcss.com/p/font-awesome/assets/css/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>修改密码</title>
</head>
<body>
<div class="pd-20">
  <form class="Huiform" id="loginform" > 
    <table class="table table-border table-bordered table-bg">
      <thead>
        <tr>
          <th colspan="2">编辑优惠券</th>
        </tr>
      </thead>
      <tbody>
      <input type="hidden" id="id"  value="${obj.id}"/>
        <tr>
          <th class="text-r">优惠券名称：</th>
          <td><input name="sysCouponName" id="newpassword" class="input-text" type="text" value="${obj.sysCouponName}"> 
          </td>
        </tr>
        <tr>
          <th class="text-r">红包金额：</th>
          <td><input name="amount" id="newpassword2" class="input-text" type="text" value="${obj.amount}"> 
          </td>
        </tr>
        <tr>
          <th class="text-r">起止时间：</th>
          <td><!-- <input name="newpassword2" id="newpassword2" class="input-text" type="text"  value="">  -->
          <input  placeholder="开始日期" class="input-text"  id="start" name="startTime" style="width:44%"  required="required" value="${obj.startTime}"/>
          -
			<input  placeholder="结束日期" class="input-text"  id="end" name="endTime" style="width:44%"  required="required" value="${obj.endTime}"/>
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
           <!--  <button type="button" class="btn btn-success radius" id="admin-password-save" name="admin-password-save"><i class="icon-ok"></i> 确定</button> -->
           <input type="button" lass="btn btn-success radius" id="admin-password-save" name="admin-password-save" value="确定" onclick="update()"/>
          </td>
        </tr>
      </tbody>
    </table>
   </form> 
</div>
<!-- <script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="layer/layer.min.js"></script>  -->
<script type="text/javascript" src="../resources/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery.validation/1.14.0/messages_zh.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

 <script src="${pageContext.request.contextPath}/js/home/plugins/layer/laydate/laydate.js"></script>

 <%--  <script src="${pageContext.request.contextPath}/resources/js/home/jquery.min.js?v=2.1.4"></script>  --%>
   <script src="${pageContext.request.contextPath}/resources/js/home/plugins/chosen/chosen.jquery.js"></script>
<script type="text/javascript">
var start={elem:"#start",format:"YYYY/MM/DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){end.min=datas;end.start=datas}};
var end={elem:"#end",format:"YYYY/MM/DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){start.max=datas}};
laydate(start);
laydate(end); 
function update(){
	
/*  $.post("../coupon/updatCoupon",{$('#loginform').serialize()},function(data){
	
})  */

$.post("../coupon/updatCoupon",{"id":$("#id").val(),"sysCoupon":$("#newpassword").val(),"amount":$("#newpassword2").val(),"sart":$("#start").val(),"end":$("#end").val()},
	
		function(data){
			alert(data.message);
			if(data.success==true){
				location.href="${pageContext.request.contextPath}/coupon/showCoupon";
			}
});
}

</script>

</body>
</html>