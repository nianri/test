<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>眼睛商城-管理后台</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> 
         <link rel="stylesheet" href="../resources/css/v/head.css">
		  <link rel="stylesheet" href="../resources/css/v/footer.css">
		   <link rel="stylesheet" href="../resources/css/static/reset.css">
           <link rel="stylesheet" href="../resources/css/v/cityselect.css">
		<link rel="stylesheet" href="../resources/css/v/orderDetails.css">
    <link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!-- Data Tables -->
   <link href="${pageContext.request.contextPath}/css/home/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/home/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/home/style.min.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/home/plugins/layer/skin/layer.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/css/home/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home/select2.min.css" type="text/css" />
<style type="text/css">
     .select2-container--open{z-index: 1000000;}
</style>
</head>
<body class="gray-bg">
	<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div  style="width:1100px;" class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                     </button>
                 <h4 class="modal-title">订单详情</h4>
               </div>
	           <div class="modal-body" id="modalBody">
	           	   <div id="g_orderDetail"> </div>     
   <script id="t_orderDetail" type="text/html">
	         	<div class="bg">
					<div class="content" style="width:100%;">
						<div class="statusWrap clearfix">
							<div class="statusDes">
								<p><span>订单号:</span><span>{{orderp.orderId}}</span></p>
								<p><span>支付方式：</span><span class="fuck">{{orderp.payType}}</span></p>
							</div>
                               
							
						</div>
						<div class="goodsStatus clearfix">
							<div class="goodsDes">
								<div class="imgWrap">
									<img src="../img/f/hotShow.png" width="100%" height="100%" >
								</div>
								<div class="goodsName">{{orderp.store.name}}</div>
							</div>
							<div class="logisticsStatus" style="width:70%;">
								<div>操作时间</div>
								  {{each ostepList as ostep i}}
					               <p><span>{{ostep.addTime.time | xx:'yyyy年 MM月 dd日 hh:mm:ss'}}</span><span>{{ostep.name}}</span></p>
				
                              {{/each}}
							</div>
						</div>
						<div class="buyInfo clearfix">
							<div class="receiverInfo">
					             <div>下单人信息</div>
					            <div><span>下单人：</span><span>{{orderp.addrName}}</span></div>
					             <div><span>车牌号：</span><span>{{orderp.buyerCarnum}}</span></div>
					            <div><span>手机号码：</span><span>{{orderp.addrTel}}</span></div>
				             </div>
				           <div class="payInfo">
					          <div>付款信息</div>
					          <div><span>商品总额：</span><span>￥</span><span>{{orderp.amount}}</span></div>
					   
					        <!--<div><span>商城优惠活动：</span><span>￥</span><span>{{orderp.couponAmount}}</span></div>-->
					         <div><span>优惠券：</span><span>￥</span><span>{{orderp.couponAmount}}</span></div>
				            </div>
						</div>
						<div class="goodsShow" style="width:100%;">
								<ul class="goodsTitle">
									<li>商品</li>
									
									<li>价格</li>
									
									<!-- <li>操作</li> -->
								</ul>
 {{each orderp.OGoodsList as og i}}
								<div class="shop">
									<!--商品-->
									<div class="goods">
										<div class="goodsInformation">
											<div class="goodsImg">
												<img src="{{og.image}}" width="100%" height="100%" />
											</div>
											<div class="goodsDes">
												{{og.goodsName}}
												<br>
												      <div><span>获得积分：</span><span></span><span>{{og.getIntegral}}</span></div>	
                                                  
											</div>
										</div>
										
										<div class="goodsPrice"><span>￥</span><span>{{og.yprice}}</span></div>
										
										<!-- <div class="goodsOperation">
											<div><a href="#">退款/</a><a hrel="#">售后</a></div>
			
										</div> -->
									</div>
								</div> {{/each}}
							</div>
			            <div class="lastWrap clearfix">
			            	<div class="lastBill">
			            		<div><span>付款总额：</span><span>￥</span><span>{{orderp.amount}}</span></div>
            		            <div><span>优惠券：</span><span>￥</span><span>{{orderp.couponAmount}}</span></div>
            		       
            		            <div><span>实付款：</span><span>￥</span><span>{{orderp.disAmount}}</span></div>
			            	</div>
			            </div> 
					</div>
					</div>

 </script>
					
				 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                   <!--   <button id="submit" onclick="return false;" class="btn btn-primary" type="button">保存</button> -->
<!--                      <button type="saveBtn" onclick="doSubmit();return false;" class="btn btn-primary">保存</button> -->
                      </div>
            </div>
        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>订单列表</h5>
                       
                    </div>
                    <div class="ibox-content">   
                      	 <p>
                           <!-- <button id="addBtn" class="btn btn-primary" >添加商品</button> -->
                      	   <button class="btn btn-primary" style="margin-left:10px;">全 部</button>
                      	  <!--  <button type="button" style="position:relative; margin-left:10px;" class="btn btn-primary">
                      	   上 架
                      	           <a href="" style="display:block;width:20px;height:20px;background:red;color:#fff;border-radius:100%;text-align:center;line-height:20px;position:absolute;top:-8px;right:-8px;">5</a>
                      	   </button>
                      	   <button type="button" style="position:relative; margin-left:10px;" class="btn btn-primary">
                      	   下 架
                      	           <a href="" style="display:block;width:20px;height:20px;background:red;color:#fff;border-radius:100%;text-align:center;line-height:20px;position:absolute;top:-8px;right:-8px;">5</a>
                      	   </button> -->
                        </p>
                        <p>
                          <!--    <span class="col-sm-2">
                             	 <select class="form-control m-b">
                                  <option>请选择启用状态</option>
                                  <option>启用</option>
                                  <option>停用</option>
                               </select>
                             </span>
                             <span class="col-sm-2">
                             	 <select class="form-control m-b">
                                  <option>请选择推荐状态</option>
                                  <option>精品</option>
                                  <option>新品</option>
                                  <option>热销</option>
                                  <option>精品 热销</option>
                                  <option>精品 新品</option>
                                  <option>新品 热销</option>
                                  <option>精品 新品 热销</option>
                               </select>
                             </span> -->
                             <span class="col-sm-2">
                             	 <select class="form-control m-b" id="status">
                                  <option value="">请选择订单状态</option>
                                  <option value="1">待付款</option>
                                  <option value="7">已付款有效订单</option>
                                  <option value="2">已付款待发货</option>
                                  <option value="3">待收货</option>
                                  <option value="4">待评价</option>
                                  <option value="5">已完成</option>
                                  <option value="6">验光订单</option>
                               </select>
                               </span> 
                             <span class="col-sm-2"><input  placeholder="开始时间" class="form-control layer-date"  id="start"/></span>
	                         <span class="col-sm-2"> <input  placeholder="结束时间" class="form-control layer-date"  id="end"/></span>
                             <span class="col-sm-2"><input type="text" id="orderId" placeholder="请输入订单号" class="form-control"></span>
                             <span><a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a></span>
                             
                        </p>
                      <div class="jqGrid_wrapper">
                            <table id="table_list_1"></table>
                            <div id="pager_list_1"></div>
                        </div>
                     
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/home/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/home/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/layer/layer.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/demo/layer-demo.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/home/plugins/jqgrid/i18n/grid.locale-cnffe4.js?0820"></script>
     <script src="${pageContext.request.contextPath}/js/home/plugins/jqgrid/jquery.jqGrid.minffe4.js?0820"></script> 
    <script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
        <script src="${pageContext.request.contextPath}/js/home/content.min.js?v=1.0.0"></script>
          <script src="${pageContext.request.contextPath}/js/home/plugins/layer/layer.js"></script>
            <script src="${pageContext.request.contextPath}/js/home/plugins/layer/laydate/laydate.js"></script>
            <script type="text/javascript" src="../js/front/template.js"></script>
</body>
<script type="text/javascript">
var start={elem:"#start",format:"YYYY/MM/DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){end.min=datas;end.start=datas}};
var end={elem:"#end",format:"YYYY/MM/DD hh:mm:ss",min:"1900-01-01 00:00:00",max:"2099-06-16 23:59:59",istime:true,istoday:false,choose:function(datas){start.max=datas}};
laydate(start);
laydate(end); 
var grid;
jQuery(function($) {
   /* ----------------初始化数据------------------ */
	 var postData={};
	   postData.orderId="${!empty orderId ? orderId:''}";
	   postData.state="${!empty state ? state:''}";
	   postData.optometryState="${!empty optometryState ? optometryState:''}";
	   if(postData.state){
		   $("#oQuery").hide();
	   }
	   if(postData.orderId)$("#orderId").val(postData.orderId);
	   var page=${!empty pageNo ? pageNo:1 };
	   var rowNum=${!empty pageSize ? pageSize:10 };
   /* ----------------初始化数据end------------------ */
	$.jgrid.defaults.styleUI = "Bootstrap";
	grid=$("#table_list_1").jqGrid({
		datatype: "json",
		url:'getOrderListData',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 700,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30],
		colNames: ["订单号", "买家",/* "订购商品", */ "金额","订单状态","支付类型","下单时间","操作"],
		colModel: [{name:'orderId',index:'orderId', width:60},
			       {name: "addrName",index: "addrName",width: 90,sortable:false}, 
			   	 /*   {name:'OGoodsList',index:'OGoodsList',sortable:false,formatter:function(cellvalue, options, rowObject){
				     var str='';  
				     var sy="border-right:1px;text-align:center;word-wrap:break-word;";
					   for(var i=0;i<cellvalue.length;i++){
						  if(i==cellvalue.length-1){
						     sy="border:none;text-align:center;word-wrap:break-word;";
						  }
						   str+= '<table  style=table-layout:fixed;><tr><td width=150  style='+sy+' >'
						    	 +cellvalue[i].goodsName+'</td><td width=150  style='+sy+' >'
						    	 +cellvalue[i].specName+'</td><td width=100 style= '+sy+'  >  X'+cellvalue[i].num+
						    	 '</td><td width=100 style= '+sy+' >  '
						    	 +cellvalue[i].price+'</td></tr></table>';
				       }   
						return str;
			         }
				  }, */
			       {name: "amount",index: "amount",width: 90,sortable:false},
			       {name:'state',index:'', width:170, fixed:true, sortable:false, resize:false,
						formatter:function(cellvalue, options, rowObject){
							var state='';
							if(5==rowObject.state){//交易进行中
							     state="已取消";
							}else if(10==rowObject.state){
								 state="待支付";         
							}else if(15==rowObject.state){
								state="已付款待加油";
							}/* else if(25==rowObject.state){
								state="已接单";
							}else if(30==rowObject.state){
								state="待加油";
							} */else if(35==rowObject.state){
								state="已完成";
							}else if(40==rowObject.state){
								state="已评价";
							}else if(45==rowObject.state){
								state="申请退款中";
							}else if(50==rowObject.state){
								state="退款完成";
							}
							return state;
						}
			       },
			       {name:'payType',index:'', width:170, fixed:true, sortable:false, resize:false,
						formatter:function(cellvalue, options, rowObject){
							var payType='';
							//if(20==rowObject.state){//交易进行中
								if(0==rowObject.payType){//待验光
									payType="支付宝支付";
								}else if(1==rowObject.payType){
									payType="微信支付";
								}else if(2==rowObject.payType){
									payType="到站支付";
								}
							//}
							return payType;
						}
			       },
			       {name: "addTime",index: "addTime",width: 70,sortable:false,
			    	   formatter:function(cellvalue, options, row){
			    			return dateFormat(cellvalue.time);}
			       },
			       {name:'action',index:'', width:170, fixed:true, sortable:false, resize:false,
			    	   formatter:function(cellvalue, options, rowObject){
							var html='<div style="text-align: center;">';
							//交易进行中
								/* if(15==rowObject.step){
									 html+='<button onclick="pay(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">支付</button>';
								}else */ /* if(15==rowObject.state){ *///已支付
									/* if(5==rowObject.optometryState){//待验光
										html+='<button onclick="sendOrder(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">指定验光地点</button>';	
									}else{ */
									  // html+='<button onclick="receive(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">接单</button>';
								    /* } */
								/* }else if(25==rowObject.state){//待加油
										html+='<button  style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">待加油</button>';	
									}else  */if(15==rowObject.state){
										html+='<button onclick="sendOrder(\''+rowObject.id+'\',1);" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">确认完成</button>';	
									}else if(40==rowObject.state){
									    html+='<button onclick="allEvaluate(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">所有评价</button>';
									}else if(35==rowObject.state){
										html+='<button style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">用户未评价</button>';
									}
								/* else if(30==rowObject.step){
									 html+='<button onclick="receipt(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">收货</button>';
								} */
							else if(45==rowObject.state){
									 html+='<button  style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">退款</button>';
								 /* else{
									 html+='<button onclick="goodsEvaluate(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">评价</button>';
								 } */
							}else if(50==rowObject.state){//申请退款中
								html+='<button onclick="openRefund(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">退款已完成</button>';
							}
							  if(rowObject.state>0)
								html+='<button onclick="orderDetail(\''+rowObject.id+'\');" style="margin-left: 1px;margin-right: 1px;" type="button" class="btn btn-primary btn-xs">订单详情</button>';
								html+='</div>';
								return html;
							
							
							
							
						}
					}
		],
		pager: "#pager_list_1",
		viewrecords: true,
		altRows: true,
		rownumbers: true,
		//toppager: true,
		multiselect: false,
		//multikey: "ctrlKey",
        //multiboxonly: true,
		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				updatePagerIcons(table);
			}, 0);
		},
		jsonReader : jsonReader,
		prmNames : prmNames,
		recordtext: "显示 {0} - {1} 条 , 共 {2} 条",
		emptyrecords: "没有记录",
		loadtext: "正在加载...",
		pgtext : "当前第 {0} 页  ,共 {1} 页",
		caption: "订单列表",
		hidegrid: false
	});
	//初始化分页条
	showNavGrid("#table_list_1","#pager_list_1");
	
	$("#queryBtn").click(function(){
		var status=$("#status").val();
		var state=null;
    	   if(1==status){//待付款
    		state=10;
    	   }else if(2==status){//已支付待加油
       		state=30;
        	}else if(3==status){//已接单
       		state=25;
       	}else if(4==status){//已评价
         		state=40;
         }else if(5==status){//已完成
      		state=35;
      }else if(6==status){//到站付款的
     	 payType=2;
      }else if(7==status){//已付款有效订单
    	  state=15
      }
		var filters = {
				'sign':1
				,'state':state
		        ,'payType':payType
				,'start':$("#start").val()
				,'end':$("#end").val()
				,'orderId':$("#orderId").val()
				}
		grid.jqGrid("setGridParam", { postData: filters,page:1 });
		grid.trigger('reloadGrid');
		
	});
	$("#addBtn").click(function(){
		var pageUrl="admin/channel";
		location.href="${pageContext.request.contextPath}/admin/addChannelPage?pageUrl="+pageUrl;
	});

});
function receive(orderId){
	layer.confirm('确定接单吗?', {
	  btn: ['确定','取消'] //按钮
	}, function(){
		$.post("${pageContext.request.contextPath}/admin/receiveOrder",{"orderId":orderId},function(data){
			if(data.success==true){
				 grid.trigger('reloadGrid');
				 layer.msg(data.message, { time: 1500,icon: 1});
				
			}
			
		});	
		
	 
	}, function(){
	 /*  layer.msg('也可以这样', {
	    time: 1000, //20s后自动关闭
	    btn: ['知道了']
	  }); */
	});
}
function sendOrder(orderId){
	layer.open({
	    content: '确认完成订单吗？'
	    ,btn: ['确定', '取消']
	    ,yes: function(index){
	    	$.post("${pageContext.request.contextPath}/admin/sendOrder",{"orderId":orderId},function(data){
				if(data.success==true){
					 grid.trigger('reloadGrid');
					 layer.open({
						    content: data.message
						    ,skin: 'msg'
						    ,time: 2 //2秒后自动关闭
						  });
					
				}
				
			});
	      layer.close(index);
	    },
	  });
	
}
function loadPage(id){  
    var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/channel";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#orderId").val()){
    	pageUrl+="&orderId="+$("#orderId").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/editChannelPage?id="+id+"&pageUrl="+pageUrl;
}
function sendOrder1(id,sign){ 
	 var page = grid.getGridParam('page'); // current page
	    var rows = grid.getGridParam('rowNum'); // rows  
	    var pageUrl="admin/order";
	    pageUrl+="?pageNo="+page;
	    pageUrl+="&pageSize="+rows;
	    if($("#orderId").val()){
	    	pageUrl+="&orderId="+$("#orderId").val();
	    }
	    pageUrl=encodeURIComponent(pageUrl);
	    if(!sign)sign=0;
		location.href="${pageContext.request.contextPath}/admin/sendOrderPage?id="+id+"&sign="+sign+"&pageUrl="+pageUrl;
}
function pay(orderId){//支付---待删除
	 $.post("${pageContext.request.contextPath}/admin/payUpdateOrder",{"orderId":orderId},function(data){
		  //  alert(data.message);
		  layer.msg(data.message, { time: 1500,icon: 1});
		    grid.trigger('reloadGrid');
		});	
}
function receipt(orderId){//收货---待删除
	 $.post("${pageContext.request.contextPath}/admin/orderReceipt",{"orderId":orderId},function(data){
		  //  alert(data.message);
		  layer.msg(data.message, { time: 1500,icon: 1});
		    grid.trigger('reloadGrid');
		});	
}
function goodsEvaluate(orderId){//评价---待删除
	var obj={};
	obj.goodsSpec={};
	obj.orderId=orderId;
	obj.content="非常好";
	obj.creditScore="10";
	obj.serviceScore="10";
	obj.praise="10";
	var token="ad10eb75-d84d-4685-a0ff-983777d624de";
	$.post("${pageContext.request.contextPath}/admin/goodsEvaluate",{"evaluateStr":JSON.stringify(obj),"token":token},function(data){
		
		  layer.msg(data.message, { time: 1500,icon: 1});
		    grid.trigger('reloadGrid');
		});	
}
function allEvaluate(id){
	 var page = grid.getGridParam('page'); // current page
	    var rows = grid.getGridParam('rowNum'); // rows  
	    var pageUrl="admin/order";
	    pageUrl+="?pageNo="+page;
	    pageUrl+="&pageSize="+rows;
	    if($("#orderId").val()){
	    	pageUrl+="&orderId="+$("#orderId").val();
	    }
	    pageUrl=encodeURIComponent(pageUrl);
		location.href="${pageContext.request.contextPath}/admin/evaluate?orderId="+id+"&pageUrl="+pageUrl;
}
function dateFormat(date){  
	 var d=	new Date();
	 d.setTime(date);
   var format = new Date(d).Format("yyyy-MM-dd hh:mm:ss");  

   return format;  
}  

Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}

	function orderDetail(id){
	//	$("#modalBody").html("");
	 $.post("${pageContext.request.contextPath}/admin/getOrderDetailData",{"orderId":id},function(data){
	      	              console.log(data);
	      	            if(data.resultCode&&data.resultCode==100){
	      	                 		   location.href="login.html";
	      	                 		   return;
	      	                 	   }
	      	            var html = template('t_orderDetail', data);
	    			    $("#g_orderDetail").html(html);
	    			    if(data.orderp.payType==1){
	    			    	$(".fuck").html("微信支付");
	    			    }else{
	    			    	$(".fuck").html("支付宝支付");
	    			    }
	    			    
			        }); 
		$("#myModal").modal();
	}
	
	 template.helper("getState",function(state,step){  
    		var html='';
    		if(10==state){
    			html="订单已取消";
    		}else if(20==state){//交易进行中
					if(15==step){
						html="待支付";
						$("#o_simage").attr("src","../img/f/orderStatus-01.png");
					}else if(20==step){//已支付
						html="已支付";
						$("#o_simage").attr("src","../img/f/orderStatus-02.png");
					}else if(25==step){
						html="已接单";
						$("#o_simage").attr("src","../img/f/orderStatus-02.png");
					}else if(30==step){
						html="已发货";
						$("#o_simage").attr("src","../img/f/orderStatus-03.png");
					}
				}else if(80==state){
					if(35==step){
						html="买家已收货";
						$("#o_simage").attr("src","../img/f/orderStatus-04.png");
					}else if(40==step){//已支付
						html="已评价";
						$("#o_simage").attr("src","../img/f/orderStatus-05.png");
					}
				}
				return html;
    	});  
		   template.helper("getoImage",function(state,step){  
	       		var html='';
	       		if(10==state){
	       			//html="订单已取消";
	       		}else if(20==state){//交易进行中
						if(15==step){
							html="../img/f/orderStatus-01.png";
						}else if(20==step){//已支付
							html="../img/f/orderStatus-02.png";
						}else if(25==step){
							html="../img/f/orderStatus-02.png";
						}else if(30==step){
							html="../img/f/orderStatus-03.png";
						}
					}else if(80==state){
						if(35==step){
							html=="../img/f/orderStatus-04.png";
						}else if(40==step){//已支付
							html="../img/f/orderStatus-05.png";
						}
					}
					return html;
	       	});  
		   template.helper("xx", dateFormat);  
	function optDetail(id){
		 $.post("${pageContext.request.contextPath}/admin/getOptometryDetailData",{"orderId":id},function(data){
	              console.log(data);
	              if(data){
	            	  $("#ystoreName").text(data.targetStore.name);
	            	  $("#yoptometrist").text(data.optometrist);
	            	  $("#yaddrName").text(data.order.addrName);
	            	  $("#yaddrTel").text(data.order.addrTel);
	            	  $("#yaddr").text(data.order.province+"-"+data.order.city+"-"+data.order.region+"-"+data.order.deliveryAddress);
	            	  $("#yldegrees").text(data.ldegrees);
	            	  $("#yrdegrees").text(data.rdegrees);
	            	  $("#ylflash").text(data.lflash);
	            	  $("#yrflash").text(data.rflash);
	            	  $("#ylaxis").text(data.laxis);
	            	  $("#yraxis").text(data.raxis);
	            	  $("#ypdistance").text(data.pdistance);
	              }
	              $("#myModalOpt").modal();
		 });      
		
	}
</script>
</html>