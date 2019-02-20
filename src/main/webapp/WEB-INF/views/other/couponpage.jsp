<%@ page language="java" contentType="text/html; charset=UTf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 优惠券管理 <span class="c-gray en">&gt;</span> 优惠券 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="" id="" name="">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜记录</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
	<a class="btn btn-primary radius" onclick="product_add('添加优惠券','${pageContext.request.contextPath}/coupon/addCoupon')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加优惠券</a></span> 
	<span class="r">共有数据：<strong>88</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" id="database">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="100">ID</th>
					<th width="80">优惠券名称</th>
					<th width="90">红包金额</th>
					<th width="130">起止时间</th>
					<th width="60">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-c">
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/laypage/1.2/laypage.js"></script>
 <script type="text/javascript">
 /*优惠券-删除*/
 function coupon_del(obj,id){
 	layer.confirm('确认要删除吗？',function(index){
 	
 		
 		$.post("../coupon/delCoupon",{"id":id},function(data){
 			alert(data.message);
 			
 				location.reload();
 			
 			
 		})
 	});
 }
 
 /*优惠券-编辑*/
 function coupon_edit(title1,id,url){
 	location.href="../coupon/editCoupion?id="+id
 }
 
 $(function () {
	 $("#database").DataTable({
		 processing:false,
         searching:false,
         serverSide:true,
         bServerSide:true,
         bStateSave:true,
         ajax:{
       	  url:"../coupon/selectCoupons",
       	  dataSrc:"info",
       	  type :"post",
       	data:function(d){
  		  var param = {};//因为服务端排序，可以新建一个参数对象
            param.start = d.start;//开始的序号
            param.length = d.length;//要取的数据的条数
         param.draw=d.draw;
            return param;//自定义需要传递的参数。
  	  }
         },
         destroy:true,
         columns: [
            { "sClass": "text-c",
	            	   "render": function (data, type,row) {
	                       return "<input type='checkbox' class='checkchild'  id='check'>";
	                   }},
       { "data": "id"},
       { "data": "sysCouponName" },
       { "data": "amount" },
       { "data": "text-c",
    	   "render": function (data, type,row) {
    		   return row.startTime+"--"+row.endTime;
    	   }},
       { "sClass": "text-c",
    	   "render":function(data, type,row){
    		   var title="产品查看";
    		   var title1="优惠券编辑";
    		   var url="../coupon/lookCoupon?id="+row.id;
    		   var ht="<a style='text-decoration:none' onClick='product_stop(\""+title+"\",\""+url+"\",\""+row.id+"\",\""+700+"\",\""+480+"\")' href='javascript:;' title='查看'><i class='Hui-iconfont'>&#xe6de;</i></a>"
    		   ht+="<a style='text-decoration:none' class='ml-5' onClick='coupon_edit(\""+title1+"\",\""+row.id+"\")' href='javascript:;' title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a>"
    		   ht+="<a style='text-decoration:none' class='ml-5' onClick='coupon_del(this,\""+row.id+"\")' href='javascript:;' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>"
    		   return ht;
    	   }
       }
	 ],
	  lengthMenu: [
    	           [5, 10, 15],
    	            [5, 10, 15] // 更改每页显示记录数
    	          ],
    	       pagingType:"full_numbers",
    	    paging:true
	 });
 });
/*用户-删除*/
function user_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
/*优惠券-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*茶品查看*/
function product_stop(title,url,id,w,h){
	layer_show(title,url,w,h);
}
</script> 
</body>
</html>