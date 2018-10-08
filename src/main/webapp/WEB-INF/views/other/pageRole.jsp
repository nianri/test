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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/home/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>角色列表</h5>
                       
                    </div>
                    <div class="ibox-content">
                    <p>
                    <button id="addBtn" class="btn btn-primary" >添加角色</button>
                    </p>
                        <p>
                        
                             <span class="col-sm-2"><input type="text" id="rolename" placeholder="请输入角色名称" class="form-control"></span>
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
</body>
<script type="text/javascript">

var grid;
jQuery(function($) {
   /* ----------------初始化数据------------------ */
   var postData={};
   postData.rolename="${!empty rolename ? rolename:''}";
   postData.rolename="${!empty rolename ? rolename:''}";
   if(postData.rolename)$("#rolename").val(postData.username);
   var page=${!empty pageNo ? pageNo:1 };
   var rowNum=${!empty pageSize ? pageSize:10 };
   /* ----------------初始化数据end------------------ */
	$.jgrid.defaults.styleUI = "Bootstrap";
	grid=$("#table_list_1").jqGrid({
		datatype: "json",
		url:'rolePage',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 250,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30],
		colNames: ["角色名称","角色描述","角色权限","角色创建时间","操作"],
		colModel: [{name:'rolename',index:'rolename', width:20},
			{name:'roleDscribe',index:'roleDscribe', width:70},
			{name:'permissionsName',index:'permission',editable: true,  width:50, edittype:'custom',
				
			
/* 			   editoptions:{ custom_element:myinput,custom_value:myvalue}
 			formatter:function(roleList, options, rowObject){
 				for(i=0;i<=roleList.size();i++){
					
				} */
	    	   } ,
	    	   {name:'creatTime',index:'creatTime', width:30},
			     	{name:'action',index:'', width:230, fixed:true, sortable:false, resize:false,
						formatter:function(cellvalue, options, rowObject){
							return "<a href='javascript:void(0);' onclick='loadPage(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>编辑</a>"+"&nbsp;"+
							"<a href='javascript:void(0);' onclick='permissionPage(\""+rowObject.id+"\")' class='btn btn-danger btn-minier'><i class='icon-edit bigger-60'></i>选择权限</a>"+"&nbsp;"+
							"<a href='javascript:void(0);' onclick='openDelete(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-trash bigger-60'></i>删除</a>";
						
						}
					}
		],
		pager: "#pager_list_1",
		viewrecords: true,
		altRows: true,
		rownumbers: true,
// 		toppager: true,
		multiselect: false,
		multikey: "ctrlKey",
        multiboxonly: true,
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
		caption: "角色列表",
		hidegrid: false
	});
	//初始化分页条
	showNavGrid("#table_list_1","#pager_list_1");
	
	$("#queryBtn").click(function(){
		var filters = {
				'rolename':$("#rolename").val()
				}
		grid.jqGrid("setGridParam", { postData: filters });
		grid.trigger('reloadGrid');
	});
	$("#addBtn").click(function(){
		var pageUrl="admin/role";
		location.href="${pageContext.request.contextPath}/admin/addRolePage?pageUrl="+pageUrl;
	});

});
function loadPage(id){  
    var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/role";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#rolename").val()){
    	pageUrl+="&rolename="+$("#rolename").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/editRolePage?id="+id+"&pageUrl="+pageUrl;
}
function permissionPage(id){
	var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/role";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#rolename").val()){
    	pageUrl+="&rolename="+$("#rolename").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/editPermissionPage?id="+id+"&pageUrl="+pageUrl;
}
function openDelete(id){
	var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/role";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    $.post("${pageContext.request.contextPath}/admin/delRole",{id:id,pageUrl:pageUrl},function(data){
    	alert(data.message);
    	if(data.success==true){
    		//alert(pageUrl);
    		location.href="${pageContext.request.contextPath}/admin/role?id="+id+"&pageUrl="+pageUrl;
    	}
    });
}

</script>
</html>