<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="../basepage.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
	<title></title>	
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox-title">
		    <h5>会员列表</h5>
		</div>                    
		<div class="ibox-content">
			<span class="col-sm-2"> 
				<select id="selectitem" name="status"	class="form-control m-b">
					<option value="">请选择</option>
					<option value="0">会员ID</option>
					<option value="1">姓名</option>
					<option value="2">账户名</option>
					<option value="3">手机号码</option>
				</select>
			</span>			
            <span class="col-sm-2">
            	<input type="text" id="codephone" placeholder="请输入查询值" class="form-control">
            </span>
            <span>
            	<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary ">搜索</a>           	
            </span>              
		    <div style="margin-top: 15px;">
				<table class="table-bordered" id="showtable" ></table>
			</div>  
		</div>  
    </div>
</body>
<script type="text/javascript">

jQuery(function($) {
	//return ;
	$('#showtable').bootstrapTable(	{
		pagination:true,
		showLoading:true,
		pageSize:10,
		pageList:[ 10, 20, 30, 'All' ],
		columns:[
		{field:'nums',title:'#',align:'center',width:30,
			formatter:function(value, row, index) {return index + 1;}
		},
		{field:'membercode',title:'会员ID',width:50,sortable:true,align:"center"},
		{field:'logincode',title:'账户名',width:50,sortable:true,align:"left",halign:"center"},
		{field:'memberphone',title:'手机号',width:100,sortable:true,align:"center",halign:"center"},
		{field:'realname',title :'姓名',width:150,sortable:true,align:"left",halign:"center"},
		{field:'carnum',title:'车牌号',width:50,sortable:true,align:"left",halign:"center"},
		{field:'integral',title:'积分',width:50,sortable:true,align:"right",halign:"center"},
		{field:'registertime',title:'注册日期',width:120,sortable :true,align:"center",halign:"center"},
		{field:'status',title:'状态',width:50,sortable :true,align:"center",halign:"center",
			formatter : function(cellvalue,options, row) {
				var result = "";
				if (cellvalue=="0") {
					result = "正常";
				}else if (cellvalue=="1") {
					result = "冻结";
				}else if(cellvalue=="2"){
					result = "关停";
				}else{
					result = "异常";
				}
				return result;
			}
		},
		{field:'action',title : '操作',width : 120,align : "center",
			formatter : function(cellvalue,options, row) {
				var html = "<a href='javascript:void(0);' class='btn btn-primary' onclick='memberinfo(\""
						+ options.memberid + "\")' >详情</a>  ";
					html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='shoporder(\""
							+ options.memberid + "\")' >加油订单</a>  ";
				return html;
			}
		},{field:'memberid',title:'memberid',visible:false}]
	});
	  
	$("#queryBtn").click(function(){
		binddata();	
	});
	binddata();	
});
function binddata(){
	var rowData = {};
	var selectvalue = $("#selectitem").val();
	switch(selectvalue){
		case "0":
			rowData={"membercode":$("#selectitem").val()}
			break;
		case "1":
			rowData={"realname":$("#selectitem").val()}
			break;
		case "2":
			rowData={"logincode":$("#selectitem").val()}
			break;
		case "3":
			rowData={"memberphone":$("#selectitem").val()}
			break;
		default:
			break;
	}
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/member/memberSearch",
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
function memberinfo(memberid){
	if(memberid=="") return;
	var index = layer.open({
		type: 2,title: "会员详情",
		content: "${pageContext.request.contextPath}/member/getMemberById/"+memberid
	});
	layer.full(index);	 
}
function shoporder(memberid){
	if(memberid=="") return;
	var index = layer.open({
		type: 2,title: "会员加油订单",
		content: "${pageContext.request.contextPath}/shopOrder/memberShopOrderList/"+memberid
	});
	layer.full(index);	
}
</script>
</html>