<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title></title>	
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox-title">
			<h5>广告列表</h5>
		</div>
		<div class="ibox-content">			
			<span class="col-sm-2">
				<button class="btn btn-primary" onclick="adddata('')">添加广告</button>
			</span> 
			<span class="col-sm-2"> 
				<select id="status" name="status"	class="form-control m-b">
					<option value="">请选择</option>
					<option value="2">上线</option>
					<option value="1">下线</option>
					<option value="0">待定</option>
				</select>
			</span>
			<span class="col-sm-3">
				<input type="text" id="advertname"	placeholder="请输入广告名称" class="form-control"></span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary">搜索</a>
			</span>			
			<div class="jqGrid_wrapper">
				<table class="table-bordered" id="showtable">
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">	
	jQuery(function($) {
		$('#showtable').bootstrapTable(	{
			pagination : true,
			showLoading : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 'All' ],
			columns : [
			{field:'nums',title:'#',align:'center',width:30,
				formatter : function(value, row, index) {return index + 1;}
			},
			{field:'advertname',title:'广告名称',sortable : true,align : "left"},
			{field:'provincename',title:'省',width:150,sortable:true,align:"center"},
			{field:'cityname',title:'市',width:150,sortable:true,align:"center"},
			/* {field:"countyname",title:"县(区)",width:150,sortable:true,align:"center"}, */
			{field:"adverttype",title:"广告类型",width:150,sortable:true,align:"center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if (cellvalue == 1) {
						result = "地域广告";
					} else if (cellvalue == 0) {
						result = "系统广告";
					}else {
					 	result = "异常";
					}
					return result;
				}
			},
			{field:"createtime",title:"创建日期",	width:150,sortable:true,align:"center"},
			{field:"status",title:"状态",width:100,sortable:true,align:"center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if (cellvalue == 2) {
						result = "上线";
					} else if (cellvalue == 1) {
						result = "下线";
					} else if (cellvalue == 0) {
						result = "待定";
					}else {
					 	result = "异常";
					}
					return result;
				}
			},
			{field : 'advertid',title : 'id',visible : false}, 
			{field : 'action',title : '操作',width : 150,align : "center",
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='editdata(\""
							+ options.advertid + "\")' >编辑</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='deletedata(\""
							+ options.advertid + "\")' >删除</a>";
					return html;
				}
			} ]

		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
	});
	function adddata(objecttype) {
		var index = layer.open({
			type : 2,
			title : "添加广告",
			content : "${pageContext.request.contextPath}/advertin/addAdvert"
		});
		layer.full(index);
	}
	function editdata(index) {
		var index = layer.open({
			type : 2,
			title : "编辑广告",
			content : "${pageContext.request.contextPath}/advertin/editAdvert/"  + index + ""
		});
		layer.full(index);
	}
	function deletedata(advertid) {
		layer.confirm('您确认要删除吗？',function(index){			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/advertin/deleteAdvert/"+advertid,
				dataType : "json",
				//data : JSON.stringify("{id:"+id+"}"),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="DS01"){
						layer.msg('删除成功。',{icon:1,time:1500});
						binddata();
					}else{
						layer.msg('删除失败!',{icon:2,time:1500});
					}
				},
				error:function(errorMsg) {
					layer.msg('删除失败!',{icon:2,time:1500});
				}
			});
		});
	}
	function binddata() {
		var rowData = {"advertname" : $("#advertname").val(),"status" : $("#status").val()};		
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/advertin/advertSearch",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				$("#showtable").bootstrapTable("load", result);
			},
			error : function(errorMsg) {
				
			}
		});
	}
</script>
</html>