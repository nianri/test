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
    <link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- Data Tables -->
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/style.min.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/home/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>店铺评论</h5>
                    </div>
                    
                    <div class="ibox-content">
                    	<!--  <p>
                           
                           <button class="btn btn-primary" style="margin-left:10px;">全 部</button>
                           <button type="button" style="position:relative; margin-left:10px;" class="btn btn-primary">
                           			已回复
                                   <a href="" style="display:block;width:20px;height:20px;background:red;color:#fff;border-radius:100%;text-align:center;line-height:20px;position:absolute;top:-8px;right:-8px;">5</a>
                           </button>
                           <button type="button" style="position:relative; margin-left:10px;" class="btn btn-primary">
                           			未回复
                                   <a href="" style="display:block;width:20px;height:20px;background:red;color:#fff;border-radius:100%;text-align:center;line-height:20px;position:absolute;top:-8px;right:-8px;">5</a>
                           </button>
                        </p> -->
                        <p>
                        	<!-- <span class="col-sm-2">
                             	 <select id="stats" class="form-control m-b">
                                  <option value=""selected="selected">回复状态</option>
                                  <option value="1">已回复</option>
                                  <option value="0">未回复</option>
                               </select>
                             </span> -->
<!--                            <span class="col-sm-2"> -->
<!--                                  <input type="text" id="goodsName" placeholder="请输入商品名称" class="form-control"> -->
<!--                            </span> -->
                            <span class="col-sm-2">
                                 <input type="text" id="content" placeholder="请输入评论内容" class="form-control"></span>
                           <span>
                            <a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a>
                           </span>

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
    <script src="${pageContext.request.contextPath}/js/home/plugins/layer/layer.min.js"></script>
</body>
<script type="text/javascript">

var grid;
jQuery(function($) {
	
   /* ----------------初始化数据------------------ */
   var postData={};
   postData.goodsName="${!empty goodsName ? goodsName:''}";
   postData.sid="${!empty sid ? sid:''}";
   postData.orderId="${!empty orderId ? orderId:''}";
   if(postData.goodsName)$("#goodsName").val(postData.goodsName);
   var page=${!empty pageNo ? pageNo:1 };
   var rowNum=${!empty pageSize ? pageSize:10 };
   /* ----------------初始化数据end------------------ */
	$.jgrid.defaults.styleUI = "Bootstrap";
	grid=$("#table_list_1").jqGrid({
		datatype: "json",
		url:'evaluatePage',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 250,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30],
		colNames: ["用户昵称", "评价分数","评价内容", "评价时间","操作"],
		colModel:  [
		       {name: "user.username",index: "user.username",width: 60,sortable:false},
		       {name: "storeScore",index: "storeScore",width: 90,sortable:false},
		       {name: "content",index: "content",width: 150,sortable:false},
		       {name: "addTime.time",index: "addTime.time",width: 90,sortable:false,
		    	   formatter:function(cellvalue, options, row){
		    			return new Date(cellvalue).toLocaleString()}
		       },
		       {name:'action',index:'', width:200, fixed:true, sortable:false, resize:false,
					formatter:function(cellvalue, options, rowObject){
						return "<a href='javascript:void(0);'onclick='loadPage(\""+rowObject.id+"\")'  class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>查看及回复</a>";
					}
				},
		],
		pager: "#pager_list_1",
		viewrecords: true,
		altRows: true,
		rownumbers: true,
		multiselect: false,
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
		caption: "商品评论列表",
		hidegrid: false
	});
	//初始化分页条
	showNavGrid("#table_list_1","#pager_list_1");
	
	$("#queryBtn").click(function(){
		
	/* 	var filters = {
				'goodsName':$("#goodsName").val(),
				'stats':$("#stats").val(),
				'content':$("#content").val()
				}
		grid.jqGrid("setGridParam", { postData: filters }); */
		postData.goodsName=$("#goodsName").val();
		postData.stats=$("#stats").val();
		postData.content=$("#content").val();
		grid.jqGrid("setGridParam", { postData: postData });
		grid.trigger('reloadGrid');
		
	});
	

});
function loadPage(id){
	
	var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/evaluate";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#goodsName").val()){
    	pageUrl+="&goodsName="+$("#goodsName").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/evaluateBack?id="+id+"&pageUrl="+pageUrl;
	
}
function aa(id,reply){ 
    var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="shop/evaluate";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#goodsName").val()){
    	pageUrl+="&goodsName="+$("#goodsName").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/shop/reply?id="+id+"&replyContent="+reply+"&pageUrl="+pageUrl;
}
</script>
</html>