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
    <link href="${pageContext.request.contextPath}/resources/js/home/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>商店列表</h5>
                    </div>
                    <div class="ibox-content">   
                        <p>
                             <span class="col-sm-2">
                             	 <select id="flag"class="form-control m-b">
                                  <option value="">请选择启用状态</option>
                                  <option value="1">启用</option>
                                  <option value="2">停用</option>
                               </select>
                             </span>
                             <span class="col-sm-2"><input type="text" id="storeNmae" placeholder="请输入店铺名称" class="form-control"></span>
                             <span><a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a>
                             <a onclick="exExcel();" href="javascript:void(0);" class="btn btn-primary ">导出商家</a>
                             </span>
                                  <form  id="exportfeeform" action="../admin/storeExportExcel" method="post">
									 <!-- <input id="list" name="list" type="hidden"> -->
									 <input id="pageNo" name="pageNo" type="hidden"/>
									 <input id="pageSize" name="pageSize" type="hidden"/>
									 <input id="sign" name="sign" type="hidden"/>
								</form>
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
    <script src="${pageContext.request.contextPath}/resources/js/home/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home/plugins/layer/layer.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home/demo/layer-demo.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/home/plugins/jqgrid/i18n/grid.locale-cnffe4.js?0820"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home/plugins/jqgrid/jquery.jqGrid.minffe4.js?0820"></script>
    <script src="${pageContext.request.contextPath}/resources/js/ceshi/common.js"></script>
</body>
<script type="text/javascript">

var grid;
jQuery(function($) {
   /* ----------------初始化数据------------------ */
    var postData={};
   postData.channelName="${!empty storeNmae ? storeNmae:''}";
   if(postData.channelName)$("#storeNmae").val(postData.storeNmae);
   var page=${!empty pageNo ? pageNo:1 };
   var rowNum=${!empty pageSize ? pageSize:10 };
   /* ----------------初始化数据end------------------ */
   $.jgrid.defaults.styleUI = "Bootstrap";
	grid=$("#table_list_1").jqGrid({
		datatype: "json",
		url:'auditShopPage?handle=1',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 750,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30,500],
		colNames: ["商店图片","商店名称", "状态", "创建时间","操作"],
		colModel:  [
				{name: "logo",index: "logo",width: 60,sortable:false,
					formatter:function(cellvalue, options, rowObject){
			    		   var path = "<img src=\""
			    		   +cellvalue+"\" height='88' width='88'/>";
			    		   return path;
						}
				},
		       {name: "name",index: "name",width: 60,sortable:false}, 
		       {name: "flag",index: "flag",width: 60,sortable:false,
		    	   formatter:function(cellvalue, options, rowObject){
		    		   var stats;
		    		   if(cellvalue == 0){
		    			   stats='未审核';
		    		   }else if(cellvalue == 1){
		    			   stats='启用';
		    		   }else if(cellvalue == 2){
		    			   stats='停用';
		    		   };
		    		   return stats;
		    	   }
		    	},
		    	{name: "addTime",index: "addTime",width: 60,sortable:false,
		    		formatter:function(cellvalue, options, row){
		    			return new Date(cellvalue).toLocaleString()},
		    	}, 
		     	{name:'action',index:'', width:300, fixed:true, sortable:false, resize:false,
					formatter:function(cellvalue, options, rowObject){
						var path ="<a href='javascript:void(0);' onclick='loadPage(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>查看执照</a>"+" ";
						
						if(rowObject.flag == "2"){
							path += "<a href='javascript:void(0);' onclick='openDelete(\""+rowObject.id+"\",1)' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>启用</a>"+" ";
						}else{
							path += "<a href='javascript:void(0);' onclick='openDelete(\""+rowObject.id+"\",2)' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>停用</a>"+" ";
						}
						path += "<a href='javascript:void(0);' onclick='openDelete(\""+rowObject.id+"\",-1)' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>删除</a>";
						return path;
					}
				}
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
		caption: "频道列表",
		hidegrid: false
	});
	//初始化分页条
	showNavGrid("#table_list_1","#pager_list_1");
	
	$("#queryBtn").click(function(){
		
		var filters = {
				'storeNmae':$("#storeNmae").val(),
				'flag':$("#flag").val()
				}
		grid.jqGrid("setGridParam", { postData: filters });
		grid.trigger('reloadGrid');
		
	});

});
function openDelete(id,flag){
	   var page = grid.getGridParam('page'); // current page
	   var rows = grid.getGridParam('rowNum'); // rows  
	   var pageUrl="shop/shopPage";
	   pageUrl+="?pageNo="+page;
	   pageUrl+="&pageSize="+rows;
	   if($("#storeNmae").val()){
	   	pageUrl+="&storeNmae="+$("#storeNmae").val();
	   }
	    pageUrl=encodeURIComponent(pageUrl);
	if(flag==-1){
		if(window.confirm("确定删除？")){
			location.href="${pageContext.request.contextPath}/shop/editShopFlag?&flag="+flag+"&id="+id+"&pageUrl="+pageUrl;
			};
	}else{
		location.href="${pageContext.request.contextPath}/shop/editShopFlag?&flag="+flag+"&id="+id+"&pageUrl="+pageUrl;
	}
};
function loadPage(id){  
   var page = grid.getGridParam('page'); // current page
   var rows = grid.getGridParam('rowNum'); // rows  
   var pageUrl="shop/auditShop";
   pageUrl+="?pageNo="+page;
   pageUrl+="&pageSize="+rows;
   if($("#storeNmae").val()){
   	pageUrl+="&storeNmae="+$("#storeNmae").val();
   }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/shop/getAuditShop?id="+id+"&pageUrl="+pageUrl;
}
function exExcel(){
	 var pageNo = grid.jqGrid('getGridParam', 'page'); 
	 var pageSize = grid.jqGrid('getGridParam', 'rowNum'); 
	 var sign=$("#flag").val();
	 $("#sign").val(sign);
	 $("#pageNo").val(pageNo);
	 $("#pageSize").val(pageSize);
	// $('#exportfeeform').attr('action','fee/downmotorfee');   
        $('#exportfeeform').submit();   
}
</script>
</html>