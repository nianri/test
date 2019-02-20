<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
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
<script src="${pageContext.request.contextPath}/js/home/plugins/layer/laydate/laydate.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>我的桌面</title>
</head>
<body>
<div class="page-container">
	<!-- <p class="f-20 text-success">欢迎使用H-ui.admin <span class="f-14">v3.1</span>后台模版！</p> -->
<div class="page-container">
	<div id="container" style="min-width:700px;height:400px"></div>
</div>
<div style="margin-top: -464px;">
	<div style="margin-left: 491px;"><h4 >油站后台统计</h4></div>
	<table border="1" style=" border-color: #c7d0d5; width: 100%">
		<tr><td colspan="8" style="height: 38px;border-bottom-color:#c7d0d5;background-color: #9f9fa81a;"><i class="Hui-iconfont">&#xe665;</i>  订单查询<p style="margin-left: 104px;margin-top: 5px;">交易总金额：</p><p id="sum012" style="margin-left: 195px;margin-top: -28px;"></p><p style="margin-left: 319px;margin-top: -28px;">总笔数：</p><p id="counts" style="margin-left: 391px;margin-top: -31px;"></p>
				<p style="margin-left: 518px;margin-top: -30px;">在线支付：</p><p id="sum01" style="margin-left: 599px;margin-top: -31px;"></p><p style="margin-left: 731px;margin-top: -29px;">到站支付</p><p id="sum2" style="margin-left: 812px;margin-top: -31px;"></p><p style="margin-left: 966px;margin-top: -28px;">优惠券：</p><p id="coupon" style="margin-left: 1039px;margin-top: -31px;"></p></td></tr>
		<tr >
			<td colspan="4" width="13%"  align="center" style="height: 41px;border-right-color:#c7d0d5;border-bottom-color:#c7d0d5; " >创建时间:</td>
			<td   width="29%" style="border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;"><input  placeholder="开始时间" class="form-control layer-date"  id="start"/>
				-
					<input  placeholder="结束时间" class="form-control layer-date"  id="end"/>
				</td>
				<td align="center" colspan="4" style="border-bottom-color:#c7d0d5;">
				<!--  <table border="1" style=" border-color: #c7d0d5; width: 50%">
								<tr align="center" style="height: 33px;">
									<td align="center"><a>当日</a></td>
									<td align="center">昨日</td>
									<td align="center">上周</td>
									<td align="center">本月</td>
									<td align="center">上月</td>
								</tr>
				</table>  -->
			 	 <input type="button" value="当日" style="background-color: #1314131a;width: 56px;height: 31px;"  onclick="button(this)">
				<input type="button" value="昨日" style="background-color: #1314131a;width: 56px;height: 31px;"  onclick="button(this)">
				<input type="button" value="本周" style="background-color: #1314131a;width: 56px;height: 31px;"  onclick="button(this)">
				<input type="button" value="上周" style="background-color: #1314131a;width: 56px;height: 31px;"  onclick="button(this)">
				<input type="button" value="本月" style="background-color: #1314131a;width: 56px;height: 31px;"  onclick="button(this)">
				<input type="button" value="上月" style="background-color: #1314131a;width: 56px;height: 31px;"  onclick="button(this)">   
			</td>
		</tr>
		<tr>
			<td style=" height: 41px;border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;" align="center" colspan="4">商户名称：</td>
			<td style="border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;"><input type="text" style="height: 29px;width: 230px;border: 0.9" value="" id="storeName" onfocus=this.blur()></td>
			<td style=" height: 41px;border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;width: 13%;" align="center">支付类型：</td>
			<td align="center" style="border-bottom-color:#c7d0d5;" colspan="4">
				 <select id="sel" name="mysel" style="width: 158px;height: 27px;" onchange="A(this)">
					<option style="text-align:center;" value="">总计</option>
					<option value="1">在线支付</option>
					<option value="2">到站支付</option>
				</select>
		<!-- 		<select id="sel" name="mysel" onchange="A(this)" >
            <option value="1">11</option>
            <option value="2">22</option>
            <option value="3">33</option>
        </select> -->
			</td>
		</tr>
		<tr style="height: 41px;">
			<td align="center" style="border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;" colspan="4">商户编号：</td>
			<td style="border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;"><input type="text" style="height: 29px;width: 230px;" id="storeNumber" onfocus=this.blur()></td>
			<td style=" height: 41px;border-right-color:#c7d0d5;border-bottom-color:#c7d0d5;width: 13%;" align="center">油品类型：</td>
			<td align="center" style="border-bottom-color:#c7d0d5;"colspan="4">
				<select style="width: 158px;height: 27px;"  onchange="selectCounts(this)">
					<option style="text-align:center;">总计</option>
					<option value="92#汽油">92#汽油</option>
					<option value="95#汽油">95#汽油</option>
					<option value="98#汽油">98#汽油</option>
					<option value="0#汽油"> 0#柴油</option>
					<option value="5#汽油"> 5#柴油</option>
					<option value="-10#汽油">-10#柴油</option>
				</select>
			</td>
		</tr>
	<!-- 	<tr style="height: 38px;">
			<td colspan="8" style="border-bottom-color:#c7d0d5;"><p style="margin-left: 42px;margin-top: 5px;">交易总金额：</p><p></p><p style="margin-left: 279px;margin-top: -28px;">总笔数：</p><p></p>
				<p style="margin-left: 505px;margin-top: -30px;">在线支付：</p><p></p><p style="margin-left: 731px;margin-top: -29px;">到站支付</p><p></p><p style="margin-left: 966px;margin-top: -28px;">优惠券：</p>
			
			 </td>
		</tr> -->
		<tr style="height: 50px;">
			<td colspan="8" align="center" style="border-top-color:#FF0000; ">
				<input type="button" value="查询" style="margin-left: -219px;height: 36px;width: 42px;" id="serch"><input type="button" value="重置" style="margin-left: 3px;height: 36px;width: 42px;">
			</td>
		</tr>
	</table>
	<table  class="table table-border table-bordered table-bg table-hover table-sort" id="sd" style="width: 100%">
	<thead>
					<tr class="text-c">
						<th width="60" style="background-color: #8a8a941a;">商户名称</th>
						<th width="60" style="background-color: #8a8a941a;">商户编号</th>
						<th width="100" style="background-color: #8a8a941a;">订单号</th>
						<th width="60" style="background-color: #8a8a941a;">油品类型</th>
						<th width="60" style="background-color: #8a8a941a;">完成时间</th>
						<th width="60" style="background-color: #8a8a941a;">总金额</th>
						<th width="60" style="background-color: #8a8a941a;">优惠券</th>
						<th width="60" style="background-color: #8a8a941a;">支付金额</th>
						<th width="60" style="background-color: #8a8a941a;">支付方式</th>
						<th width="60" style="background-color: #8a8a941a;">操作</th>
					</tr>
				</thead>
					<tbody></tbody>
				</table>
				</div>
	<div class="text-c" style="margin-right: 839px;"> 
			<div>
			</div>
		</div>				
	<!-- <p>登录次数：18 </p> -->
	<!-- <table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th colspan="7" scope="col">信息详细统计</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>资讯库</th>
				<th>图片库</th>
				<th>产品库</th>
				<th>用户</th>
				<th>管理员</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<td>92</td>
				<td>9</td>
				<td>0</td>
				<td>8</td>
				<td>20</td>
			</tr>
			<tr class="text-c">
				<td>今日</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr class="text-c">
				<td>昨日</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr class="text-c">
				<td>本周</td>
				<td>2</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
			<tr class="text-c">
				<td>本月</td>
				<td>2</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
				<td>0</td>
			</tr>
		</tbody>
	</table> -->
	<!-- <div style="margin-top: 136px;">
 -->	<%-- <table class="table table-border table-bordered table-bg table-hover table-sort" id="sd">
				<thead>
					<tr class="text-c">
						<th width="100">订单号</th>
						<th width="60">订单商品名</th>
						<th width="60">完成时间</th>
						<th width="60">总金额</th>
						<th width="60">红包金额</th>
						<th width="60">支付金额</th>
						<th width="60">支付方式</th>
						<th width="60">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-c va-m">
						<td><input name="" type="checkbox" value=""></td>
						<td>001</td>
						<td><a onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;"><img width="60" class="product-thumb" src="${pageContext.request.contextPath}/resources/temp/product/Thumb/6204.jpg"></a></td>
						<td class="text-l"><a style="text-decoration:none" onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;"><img title="国内品牌" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/images/cn.gif"> <b class="text-success">圣象</b> 哥本哈根橡木地板KS8373</a></td>
						<td class="text-l">原木的外在,实木条形结构,色泽花纹自然,写意;款式设计吸取实木地板的天然去雕饰之美,在视觉上给人带来深邃联想.多款产品适合搭配不同的风格的室内装饰;功能流露出尊贵典雅的大气韵味。</td>
						<td><span class="price">356.0</span> 元/平米</td>
						<td class="td-status"><span class="label label-success radius">已发布</span></td>
						<td class="td-manage"><a style="text-decoration:none" onClick="product_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</tbody>
			</table> --%>
			<!-- </div> -->
			<input type="hidden" id="cal"/>
			<input type="hidden" id="select"/>
			<input type="hidden" id="selectCounts">
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/lib/laypage/1.2/laypage.js"></script>
<!--此乃百度统计代码，请自行删除-->
<script type="text/javascript">
var start={elem:"#start",format:"YYYY-MM-DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){end.min=datas;end.start=datas}};
var end={elem:"#end",format:"YYYY-MM-DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){start.max=datas}};
laydate(start);
laydate(end); 
</script>
<script>
var  _dataTables;
	$(function () {
		// oOptions;
		 _dataTables  = $("#sd").DataTable({
				   			bSort: false,
			    		processing:false,
			              searching:false,
			              serverSide:true,
			              bServerSide:true,
			              bStateSave:true,
			              
			              
			              ajax:{
			            	  url:"../order/orderStatisticsss",
			            	  dataSrc:"info",
			            	  type : 'post', 
			            	  data:function(d){
								console.log(d);
			            		  var param = {};//因为服务端排序，可以新建一个参数对象
			                      param.start = d.start;//开始的序号
			                      console.log(d.storeName+"*********************");
			                    //  console.log(d.start)
			                    console.log(d.length);
			                      param.length = d.length;//要取的数据的条数
			                   //   console.log(d.length);
			                   //   console.log(param);
			                   param.draw=d.draw;
			                   param.logmin=$("#start").val();//开始日期
			                   param.logmax=$("#end").val();//结束日期
			                   param.select=$("#select").val();
			                   param.selectCounts=$("#selectCounts").val();
			                  // console.log(d.sEcho+"&&&&&&&");
			                      return param;//自定义需要传递的参数。
			            	  }
			              },
			             
			    	//},
			         destroy:true,	
			         columns: [
						{ "data": "store.name","render":function(data,type,full,callback){
								$("#storeName").val(data);
								return data;
							}
						},
						{ "data": "store.number",
							"render":function(data,type,full,callback){
								$("#storeNumber").val(data);
								return data;
							}	
						
						}, 
			             { "data": "orderId"},
			             { "data": "orgoodsname" },
			             { "data": "receiptTime" },
			             { "data": "amount" },
			             { "data": "couponAmount" },
			             { "data": "disAmount" },
			             { "data": "payType","render":function(data,type,full,callback){
			            		switch(data){
			            		case 0:return "线上支付";break;
			            		case 1:return "线上支付";break;
			            		case 2:return "线下 支付";break;
			            		}
			            		
			            	}	 },
			           {"sClass":"text-c",
			            	 "render":function(data, type,row){
			            		 var title="产品查看";
			          		   var url="../order/lookOrder?id="+row.id;
			            		 var ht="<a style='text-decoration:none' onClick='product_stop(\""+title+"\",\""+url+"\",\""+row.id+"\",\""+700+"\",\""+480+"\")' href='javascript:;' title='查看'>查看</a>"
			            		return ht;
			            	 }
			           
			           }
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
		 button('');
		 counts();
});
function replaceDate(data){
			date = data.replace(/-/g,'/'); 
			var timestamp = new Date(date)
			return timestamp;
	}
/*茶品查看*/
function product_stop(title,url,id,w,h){
	layer_show(title,url,w,h);
}  
/*根据日期进行晒选*/
$("#serch").click(function(){
	counts();
	_dataTables.draw();
	
});
function A(obj){
	$("#select").val(obj.value);
}
function selectCounts(obj){
	$("#selectCounts").val(obj.value);
}
 function counts(){
	 $.post("../order/countOrders",{"logmin":$("#start").val(),"logmax":$("#end").val(),"select":$("#select").val(),"selectCounts":$("#selectCounts").val()},function(data){
		 if(data.sum01!=null){
			 $("#sum01").html(data.sum01+"(元)");
		 }else{
			 $("#sum01").html(0+"(元)");
		 }
		 if(data.sum012!=null){
			 $("#sum012").html(data.sum012+"(元)");
		 }else{
			 $("#sum012").html(0+"(元)");
		 }
		 if(data.counts!=null){
				$("#counts").html(data.counts+"(笔)");
		 }else{
				$("#counts").html(0+"(笔)");
		 }
		 if(data.sum2!=null){
			 $("#sum2").html(data.sum2+"(元)");
		 }else{
			 $("#sum2").html(0+"(元)");
		 }
		 if(data.coupon!=null){
			 $("#coupon").html(data.coupon+"(元)");
		 }else{
			 $("#coupon").html(0+"(元)");
		 }
		
	}); 
	
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
function button(obj){
	var  date =new Date();
	if(obj=='' || obj.value=='当日'){
		$("#start").val(date.format('yyyy-MM-dd hh:mm:ss'));
		$("#end").val(date.format('yyyy-MM-dd hh:mm:ss'));
	}
	if(obj.value!=''&&obj.value=='昨日'){
		date = new Date( new Date().getTime() - 24*60*60*1000).format('yyyy-MM-dd hh:mm:ss');
		$("#start").val(date);
		$("#end").val(date);
	}
	if(obj.value!=''&&obj.value=='本周'){
	 	var day=date.getDay();
	 	if(day==0){
	 		day=day+7-1
	 	}else{
	 		
	 		day=day-1;
	 	}
		var dat = new Date( new Date().getTime() - day*24*60*60*1000).format('yyyy-MM-dd hh:mm:ss');
		$("#start").val(dat);
		$("#end").val(date.format('yyyy-MM-dd hh:mm:ss')); 
	}
	if(obj.value!=''&& obj.value=='上周'){
		 var today = new Date();
		 var dayMSec = 24 * 3600 * 1000;
		var weekdayBetween = getDayBetweenMonday();
		//得到本周星期一的毫秒值    
       var nowMondayMSec = today.getTime() - weekdayBetween * dayMSec;    
       //得到上周一的毫秒值    
       var lastMondayMSec = nowMondayMSec - 7 * dayMSec;    
       //得到上周日的毫秒值    
       var lastSundayMSec = nowMondayMSec - 1 * dayMSec;    
           
       var lastMonday = new Date(lastMondayMSec).format('yyyy-MM-dd hh:mm:ss');    
       var lastSunday = new Date(lastSundayMSec).format('yyyy-MM-dd hh:mm:ss'); 
       $("#start").val(lastMonday);
		$("#end").val(lastSunday); 
	}
	if(obj.value!=''&& obj.value=='本月'){
		var now=new Date();     
		var nowMonth = now.getMonth(); //当前月
		var nowYear = now.getFullYear(); //当前年 
	    var MonthFirstDay=new Date(nowYear, nowMonth, 1).format('yyyy-MM-dd hh:mm:ss');//本月开始年份
	    $("#start").val(MonthFirstDay);
		$("#end").val(date.format('yyyy-MM-dd hh:mm:ss')); 
	    
	}
	if(obj.value!='' && obj.value=='上月'){
		var today = new Date();
	    var dayMSec = 24 * 3600 * 1000;  
	    var nowMonthFirstDay = new Date(today.getFullYear() , today.getMonth(), 1);    
        //得到上一个季度的最后一天的毫秒值    
        var lastQuarterLastDayMSec = nowMonthFirstDay.getTime() - 1 * dayMSec;    
        var lastQuarterLastDay = new Date(lastQuarterLastDayMSec).format('yyyy-MM-dd hh:mm:ss');
        var nowMonthFirstDay1 = new Date(today.getFullYear() , today.getMonth()-1, 1).format('yyyy-MM-dd hh:mm:ss');    
        $("#start").val(nowMonthFirstDay1);
		$("#end").val(lastQuarterLastDay); 
	}
	
}
function getDayBetweenMonday(){  
	var today = new Date();
    //得到今天的星期数(0-6),星期日为0    
    var weekday = today.getDay();    
    //周日    
    if(weekday == 0){    
        return 6;    
    }else{    
        return weekday - 1;    
    }    
}

</script>
</body>
</html>