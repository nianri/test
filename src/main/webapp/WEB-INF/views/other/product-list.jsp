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
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>建材列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
 <div class="pos-a" style="width:0px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
	<ul id="treeDemo" class="ztree"></ul>
</div> 
<div style="margin-left:0px;">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c"> 日期范围：
			<!-- <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;"> -->
			<input type="text" name="" id="serchName" placeholder=" 产品名称" style="width:250px" class="input-text">
			<button name="" id="tijiao" class="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜产品</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel(this)" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a class="btn btn-primary radius" onclick="product_add('添加产品','../goods/addGoods')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span>
		 <%--  <span class="r">共有数据：<strong>${count}</strong> 条</span>  --%></div> 
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort" id="sd">
				<thead>
					<tr class="text-c">
						<th width="30"><input name="" type="checkbox" value=""></th>
						<th width="100">ID</th>
						<th width="60">产品名称</th>
						<th width="60">市场价格</th>
						<th width="60">所属分类</th>
						<th width="60">操作</th>
					</tr>
				</thead>
				<tbody>
					<%-- <tr class="text-c va-m">
						<td><input name="" type="checkbox" value=""></td>
						<td>001</td>
						<td><a onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;"><img width="60" class="product-thumb" src="${pageContext.request.contextPath}/resources/temp/product/Thumb/6204.jpg"></a></td>
						<td class="text-l"><a style="text-decoration:none" onClick="product_show('哥本哈根橡木地板','product-show.html','10001')" href="javascript:;"><img title="国内品牌" src="${pageContext.request.contextPath}/resources/static/h-ui.admin/images/cn.gif"> <b class="text-success">圣象</b> 哥本哈根橡木地板KS8373</a></td>
						<td class="text-l">原木的外在,实木条形结构,色泽花纹自然,写意;款式设计吸取实木地板的天然去雕饰之美,在视觉上给人带来深邃联想.多款产品适合搭配不同的风格的室内装饰;功能流露出尊贵典雅的大气韵味。</td>
						<td><span class="price">356.0</span> 元/平米</td>
						<td class="td-status"><span class="label label-success radius">已发布</span></td>
						<td class="td-manage"><a style="text-decoration:none" onClick="product_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr> --%>
				</tbody>
			</table>
		</div>
	</div>
</div>

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
<script type="text/javascript">

var _dataTables;
var page;
var rowNum;
$(function () {
	if(_dataTables==null){
	    _dataTables  = $("#sd").DataTable({
	    	processing:false,
	              searching:false,
	              serverSide:true,
	              bServerSide:true,
	              bStateSave:true,
	              ajax:{
	            	  url:"../goods/showGoods",
	            	  dataSrc:"info",
	            	  type : 'post', 
	            	  data:function(d){
	            		  var param = {};//因为服务端排序，可以新建一个参数对象
	                      param.start = d.start;//开始的序号
	                      console.log(d.start+"*********************");
	                    //  console.log(d.start)
	                      param.length = d.length;//要取的数据的条数
	                   //   console.log(d.length);
	                   //   console.log(param);
	                   param.draw=d.draw;
	                   param.serchName=$("#serchName").val();
	                  // console.log(d.sEcho+"&&&&&&&");
	                      return param;//自定义需要传递的参数。
	            	  }
	              },
	             
	    	//},
	         destroy:true,	
	         columns: [
	             { "sClass": "text-c",
	            	   "render": function (data, type,row) {
	                       return "<input type='checkbox' class='checkchild' value=\""+row.id+"\"/ id='check'>";
	                   }},
	             { "data": "id" },
	             { "data": "goodsName" },
	             { "data": "marketPrice" },
	             { "data": "goodsClass",
	            	"render":function(data,type,full,callback){
	            		switch(data){
	            		case 0:return "柴油";break;
	            		case 1:return "汽油";break;
	            		}
	            		
	            	}	 
	             
	             },
	           {"sClass":"text-c",
	            	 "render":function(data, type,row){
	            		// console.log(data);
	            		// console.log(type);
	            		// console.log(row);
	            		 var id=row.id;
	            		 console.log(id);
	            		 var url="../goods/editGoods?id="+id;
	            		 var title="编辑产品";
	            		var ht= "<a style='text-decoration:none' class='ml-5' onClick='product_edit(\""+title+"\",\""+row.id+"\",\""+url+"\")' href='javascript:void(0);' title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a>"
	            		ht+="<a style='text-decoration:none' class='ml-5' onClick='product_del(this,\""+row.id+"\")' href='javascript:void(0);' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>"
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
	   
}});
/*根据名称进行查询*/
$("#tijiao").click(function(){
	_dataTables.draw();
});	
/*产品-添加*/
function product_add(title,url){
	location.href=url;
}

/*产品-编辑*/
function product_edit(title,id,url){
    location.href=url;
}

/*产品-删除*/
function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type:"POST",
			url: "${pageContext.request.contextPath}/goods/delProduct?id="+id,
			dataType:"json",
			success: function(data){
				if(data==true){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				}
			},
			error:function(data) {
			if(data==false){
				layer.msg('删除失败');
			}
			},
		});		
	});
}
/*产品-批量删除*/
  function datadel(obj){
		  layer.confirm('确认要删除吗？',function(index){
		  var ids = new Array();
			var df=document.getElementsByClassName("checkchild");
				for(var i=0;i<df.length;i++){
					if(df[i].checked){
					ids.push(df[i].value);
				}
			}
					$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/goods/product_dels?ids="+JSON.stringify(ids),
					dataType:"json",
					success: function(data){
					if(data==true){
						$(obj).parents("tr").remove();
						layer.msg('已删除!',{icon:1,time:1000});
						location.reload();
						} 
					}
					});
	  });
	}  
</script>
</body>
</html>