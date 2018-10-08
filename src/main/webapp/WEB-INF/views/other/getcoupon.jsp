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
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 优惠券管理 <span class="c-gray en">&gt;</span> 已领取优惠券 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<button type="submit" class="btn btn-success" id="button" name=""><i class="Hui-iconfont">&#xe665;</i> 搜记录</button>
	</div>
	<%-- <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
	<a class="btn btn-primary radius" onclick="product_add('添加优惠券','${pageContext.request.contextPath}/coupon/addCoupon')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加优惠券</a></span> 
	<span class="r">共有数据：<strong>88</strong> 条</span> </div> --%>
	<div class="mt-20">
		<table class="table table-border table-bordered table-hover table-bg table-sort" id="database">
			<thead>
				<tr class="text-c">
					<th width="100">红包名</th>
					<th width="80">红包金额</th>
					<th width="130">满减金额</th>
					<th width="130">起止时间</th>
					<th width="130">领取数量</th>
				</tr>
			</thead>
			<tbody align="center">
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
var _dataTables;
 $(function () {
	 _dataTables= $("#database").DataTable({
		 bSort: false,
		 processing:false,
         searching:false,
         serverSide:true,
         bServerSide:true,
         bStateSave:true,
         ajax:{
       	  url:"../coupon/selectGetCoupons",
       	  dataSrc:"info",
       	  type :"post",
       	data:function(d){
  		  var param = {};//因为服务端排序，可以新建一个参数对象
            param.start = d.start;//开始的序号
            param.length = d.length;//要取的数据的条数
         	param.draw=d.draw;
            param.datemin =$("#datemin").val();
         	param.datemax =$("#datemax").val();
            return param;//自定义需要传递的参数。
  	  }
         },
         destroy:true,
         columns: [
       { "data": "coupon_name"},
       { "data": "coupoon_amount" },
       { "data": "coupon_fullamount" },
       { "data": "text-c",
    	   "render": function (data, type,row) {
    		   return da(row.startTime)+"--"+da(row.endTime);
    	   }},
    	{ "data": "COUNT(scoupon_id)" },
	 ],
	  oLanguage: {                          //汉化   
          "sLengthMenu": "每页显示 _MENU_ 条记录",   
          "sZeroRecords": "没有检索到数据",   
          "sInfo": "当前数据为从第 _START_ 到第 _END_ 条数据；总共有 _TOTAL_ 条记录",   
          "sInfoEmtpy": "没有数据",   
          "sProcessing": "正在加载数据...",   
          "oPaginate": {   
              "sFirst": "首页",   
              "sPrevious": "前页",   
              "sNext": "后页",   
              "sLast": "尾页"  
          }},
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
function da(date){
	var  dat = new Date(date.time);
	return dat.format('yyyy-MM-dd');
}
Date.prototype.format = function(format) { 
    var date = { 
           "M+": this.getMonth() + 1, 
           "d+": this.getDate(), 
           "h+": this.getHours(), 
           "m+": this.getMinutes(), 
           "s+": this.getSeconds(), 
           "q+": Math.floor((this.getMonth() + 3) / 3), 
           "S+": this.getMilliseconds() 
    }; 
    if (/(y+)/i.test(format)) { 
           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length)); 
    } 
    for (var k in date) { 
           if (new RegExp("(" + k + ")").test(format)) { 
                  format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? date[k] : ("00" + date[k]).substr(("" + date[k]).length)); 
           } 
    } 
    return format; 
}
	/*根据日期进行查询*/
	$("#button").click(function(){
		_dataTables.draw();
	});
</script> 
</body>
</html>