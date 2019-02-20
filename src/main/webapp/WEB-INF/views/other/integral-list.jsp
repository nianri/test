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
                        <h5>积分商品</h5>
                    </div>
                    <div class="ibox-content">   
                      	 <p>
                             <span class="col-sm-2"> <button id="addBtn" class="btn btn-primary" >添加商品</button></span>
                             <span class="col-sm-3">
                             	 <select id="isdisplay" name="isdisplay" class="form-control m-b">
                                  <option value="">请选择启用状态</option>
                                  <option value="1">启用</option>
                                  <option value="0">停用</option>
                               </select>
                             </span>
                             <span class="col-sm-2"><input type="text" id="adName" placeholder="请输入商品名称" class="form-control"></span>
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
    <script src="${pageContext.request.contextPath}/resources/js/home/plugins/jsjava/text/Format.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home/plugins/jsjava/text/DateFormat.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/home/plugins/jsjava/text/SimpleDateFormat.js"></script>
</body>
<script type="text/javascript">

var grid;
jQuery(function($) {
   /* ----------------初始化数据------------------ */
   var postData={};
   postData.adName="${!empty adName ? adName:''}";
   if(postData.adName)$("#adName").val(postData.adName);
   postData.adName="${!empty isdisplay ? isdisplay:''}";
   if(postData.adName)$("#isdisplay").val(postData.isdisplay);
   var page=${!empty pageNo ? pageNo:1 };
   var rowNum=${!empty pageSize ? pageSize:10 };
   /* ----------------初始化数据end------------------ */
	$.jgrid.defaults.styleUI = "Bootstrap";
	grid=$("#table_list_1").jqGrid({
		datatype: "json",
		url:'integralPage',
		mtype: 'POST',
		postData:postData,
		page: page,
		height: 750,
		autowidth: true,
		shrinkToFit: true,
		rowNum:rowNum,
		rowList: [10, 20, 30],
		colNames: ["排序号","商品名称", "所需积分", "图片","添加时间","操作"],
		colModel: [{name:'sort',index:'sort', width:45},
					{name:'integralName',index:'integralName', width:60},
					{name:'fraction',index:'fraction', width:60},
					{name:'showImage',index:'showImage', width:60,formatter:image},
			       {name: 'addTime',index: "addTime",width: 45},
			     	{name:'action',index:'', width:150, fixed:true, sortable:false, resize:false,
						formatter:function(cellvalue, options, rowObject){
							var html="<a href='javascript:void(0);' onclick='loadPage(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>编辑</a>  ";
							if(4==rowObject.type){html+="<a href='javascript:void(0);' onclick='editGoodsPage(\""+rowObject.id+"\")' class='btn btn-primary btn-minier'><i class='icon-edit bigger-60'></i>编辑商品</a>";}
							html+="<a href='javascript:void(0);' onclick='openDelete(\""+rowObject.id+"\")' class='btn btn-danger btn-minier'><i class='icon-trash bigger-60'></i>删除</a>";
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
		caption: "广告列表",
		hidegrid: false
	});
	//初始化分页条
	showNavGrid("#table_list_1","#pager_list_1");
	
	$("#queryBtn").click(function(){
		var filters = {
				'adName':$("#adName").val(),
				'isdisplay':$("#isdisplay").val()
				}
		grid.jqGrid("setGridParam", { postData: filters });
		grid.trigger('reloadGrid');
		
	});
	$("#addBtn").click(function(){
	    alert("sssss");
		var pageUrl="admin/integral";
		location.href="${pageContext.request.contextPath}/admin/addIntegralPage?pageUrl="+pageUrl;
	});

});

function editGoodsPage(id){
	var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/ad";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#adName").val()){
    	pageUrl+="&adName="+$("#adName").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/adGoods?id="+id+"&pageUrl="+pageUrl;
}

function loadPage(id){

    var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/integral";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    if($("#adName").val()){
    	pageUrl+="&adName="+$("#adName").val();
    }
    pageUrl=encodeURIComponent(pageUrl);
	location.href="${pageContext.request.contextPath}/admin/editIntegralPage?id="+id+"&pageUrl="+pageUrl;
}

function openDelete(id){
	var page = grid.getGridParam('page'); // current page
    var rows = grid.getGridParam('rowNum'); // rows  
    var pageUrl="admin/integral";
    pageUrl+="?pageNo="+page;
    pageUrl+="&pageSize="+rows;
    $.post("${pageContext.request.contextPath}/admin/delIntegral",{id:id,pageUrl:pageUrl},function(data){
   
    	alert(data.message);
    	if(data.success==true){
    		location.href="${pageContext.request.contextPath}/admin/integral?id="+id+"&pageUrl="+pageUrl;
    	}
    });
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
function myDate(date,layout){
	 var strStart ="";
	 if(date!=""){
		 if(layout==null){layout="yyyy-MM-dd HH:mm:ss"}
		 var sdf=new SimpleDateFormat(); //
		 sdf.applyPattern(layout);
	     var mytime =new Date();
	     mytime.setTime(date);
	     strStart=sdf.format(mytime); 
	 }
   return strStart;
}

function image(cellValue, options, rowObject) {
	var result ="";
	if(cellValue!=null&&cellValue.length>0){
		var pathArr = cellValue.split(",");
		for(var i =0;i<pathArr.length;i++){
			path = "<img src='"+pathArr[i]+"'  height='45' width='50'/>";
			result = result + path;
		}
	}else{
		result ="未上传图片";
	}

	return result;
};
</script>
</html>