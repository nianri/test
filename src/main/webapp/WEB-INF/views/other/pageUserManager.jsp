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
                        <h5>用户列表</h5>
                       
                    </div>
                    <div class="ibox-content">   
                        <p>
                             <span class="col-sm-2"><input type="text" id="username" placeholder="请输入用户名称" class="form-control"></span>
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
   postData.username="${!empty username ? username:''}";
   if(postData.username)$("#username").val(postData.username);
   var page=${!empty pageNo ? pageNo:1 };
   var rowNum=${!empty pageSize ? pageSize:10 };
   /* ----------------初始化数据end------------------ */
	$.jgrid.defaults.styleUI = "Bootstrap";
	grid=$("#table_list_1").jqGrid({
		datatype: "json",
		url:'userManagerPage',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 250,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30],
		colNames: ["用户名称","用户角色","用户创建时间","用户最后登录时间","操作"],
		colModel: [{name:'username',index:'username', width:60},
				   {name:'roleList',index:'rolename', width:60,
                   		/*@author:
                   		  formatte方法的参数:
                   			第一个参数是roleList数组的本身;第三个参数是ajax异步请求获取的完整数据json对象;
		                                                  此处用户角色数据来自roleList数组每个元素的rolename属性,需要将改数组中每一元素的
		                    roleList属性值取出,并用join()处理得带字符串格式的数据并返回!*/
						formatter:function(roleList, options, rowObject){
                   			var arr = new Array();
                   			//数组.forEach(e){}: js中数组的遍历方法
                   			roleList.forEach(function(e){
                   				arr.push(e.rolename);
                   			});
                   			//数组的join()方法返回值类型为String字符串
                   			var roleNames = arr.join("  ,  ");
    		    			return roleNames;
    		    		}
					},
					{name:'creatTime',index:'creatTime', width:30},
					{name:'lastLoginTime',index:'lastLoginTime', width:30},
		     	    {name:'action',index:'', width:140, fixed:true, sortable:false, resize:false,
						formatter:function(cellvalue, options, rowObject){
							return "<a href='javascript:void(0);' onclick='loadPage(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>编辑</a>"+
							"<a href='javascript:void(0);' onclick='openDelete2(\""+rowObject.id+"\")' class='btn btn-danger btn-minier'><i class='icon-trash bigger-60'></i>删除</a>";
					
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
		caption: "用户列表",
		hidegrid: false
	});
	//初始化分页条
	showNavGrid("#table_list_1","#pager_list_1");
	
	$("#queryBtn").click(function(){
		var filters = {
				'username':$("#username").val()
				}
		grid.jqGrid("setGridParam", { postData: filters });
		grid.trigger('reloadGrid');
		
	});

});
function loadPage(id){  
    var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/userManager";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#username").val()){
    	pageUrl+="&username="+$("#username").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/editUserManagerPage?id="+id+"&pageUrl="+pageUrl;
}
function openDelete2(id){
	var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/userManager";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    alert("sss")
    $.post("${pageContext.request.contextPath}/admin/delUserManager",{id:id,pageUrl:pageUrl},function(data){
    	alert(data.message);
    	if(data.success==true){
    		//alert(pageUrl);
    		location.href="${pageContext.request.contextPath}/admin/userManager?pageUrl="+pageUrl;
    	}
    });
}

</script>
</html>