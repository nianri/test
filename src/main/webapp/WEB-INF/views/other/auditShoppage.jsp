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
                        <h5>待审核店铺</h5>
                    </div>
                    
                    <div class="ibox-content">
                    	<p>   
                             <span class="col-sm-3">
                             	 <select id="stats" class="form-control m-b">
                             	 	 <option value="0">未审核</option>
                             	 	 <option value="10">初审通过</option>
                             	   	 
<!--                                   <option value=""selected="selected">请选择待审核模块</option> -->
<!--                                   <option value="aptitudeState">资质待审核</option> -->
<!--                                   <option value="contractState">合同待审核</option> -->
<!--                                   <option value="payState">缴费待审核</option> -->
                               </select>
                             </span>
                             <span class="col-sm-2"><input type="text" id="storeNmae" placeholder="请输入店铺名称" class="form-control"></span>
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
		url:'auditShopPage',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 750,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30],
		colNames: ["会员名","店铺名", "审核状态", "缴费状态","操作"],
		colModel:  [{name: "user.username",index: "user.username",width: 90,sortable:false},
		       {name: "name",index: "name",width: 90,sortable:false}, 
		       {name: "flag",index: "flag",width: 90,sortable:false,
		    	   formatter:function(cellvalue, options, rowObject){
		    		   var stats;
		    		   if(cellvalue == -1){
		    			   stats='待审核'
		    			}else if(cellvalue == -2){
		    			   stats='审核未通过'
		    		    }else if(cellvalue == 0){
			    			   stats='审核通过'
			    	    }
		    		   return stats;
		    	   }
		       },
		       /* {name: "contractState",index: "contractState",width: 90,sortable:false,
		    	   formatter:function(cellvalue, options, rowObject){
		    		   var stats;
		    		   if(cellvalue == 0){
		    			   stats='未审核'
		    			}else if(cellvalue == -1){
		    				stats='审核未通过'
		    		    }else if(cellvalue == 1){
		    		    	stats='审核通过|<span style="color: red;">待复核</span>'
			    	    }else if(cellvalue == 2){
			    	    	stats='审核通过|<span style="color: red;">复核未通过</span>'
		    		   }else if(cellvalue == 3){
		    			   stats='审核通过|复核通过'
		    		   };
		    		   return stats;
		    	   }
		       }, */
		       {name: "payState",index: "payState",width: 90,sortable:false,
		    	   formatter:function(cellvalue, options, rowObject){
		    		   var stats;
		    		   if(cellvalue == 0){stats='未缴费'}else{stats='已缴费'};
		    		   return stats;
		    	   }
		    	},
		     	{name:'action',index:'', width:170, fixed:true, sortable:false, resize:false,
					formatter:function(cellvalue, options, rowObject){
						return "<a href='javascript:void(0);' onclick='loadPage(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>审核店铺</a>";
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
				'stats':$("#stats").val()
				}
		grid.jqGrid("setGridParam", { postData: filters });
		grid.trigger('reloadGrid');
		
	});

});
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
//------------------------测试测试----------------
function testPay(id){  
	$.post("../shop/audit",{state:"payState,1",id:id},function(data){
		if(data.success==true){
			alert("支付成功！");
			location.href="${pageContext.request.contextPath}/shop/auditShop";
		}
	});
}
</script>
</html>