<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/Hui-iconfont/1.0.8/iconfont.css" />		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>
		
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap-table.min.css"	rel="stylesheet">
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap-table.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap-table-zh-CN.min.js"></script>
		<script	type="text/javascript"	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js"></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >
	</head>
	<body>
		<div class="page-container">
			<form class="form form-horizontal" id="form-article-add">
				<div class="row cl" id="divusercode">
					<label class="form-label col-xs-4 col-sm-2">用户ID：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="usercode" type="text" class="input-text" value="${sysUser.usercode}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">用户账号：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="logincode" type="text" class="input-text" value="${sysUser.logincode}"  >
					</div>
				</div>	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">用户姓名：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="realname" type="text" class="input-text" value="${sysUser.realname}" >
					</div>
				</div>
				<div class="row cl" id="divpassoword">
					<label class="form-label col-xs-4 col-sm-2">用户密码：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="password" type="password" class="input-text" value="${sysUser.password}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">用户类型：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
						<select id="usertype" class="select">
							<option value="">请选择</option>
							<option value="1">商家</option>
							<option value="2">普通用户</option>
							<option value="3">管理员</option>
						</select>
						</span>
					</div>
				</div>
				<div class="row cl" id="divshop">
					<label class="form-label col-xs-4 col-sm-2">用户商家：</label>
					<div class="formControls col-xs-8 col-sm-2">
						<input id=shopname type="text" class="input-text" value="${sysUser.shopname}" disabled="disabled" >
					</div>
					<a id="selectshop" class="btn btn-primary" onclick="selectshop();" role="button">选择...</a>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">状态：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<span class="select-box">
						<select id="status" class="select" >
							<option value="">请选择</option>
							<option value="2">启用</option>
							<option value="1">禁用</option>
							<option value="0">冻结</option>
						</select>
						</span>
					</div>
				</div> 				
				<div class="row cl" id="divlastlogtime">
					<label class="form-label col-xs-4 col-sm-2">最后登录时间：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="lastlogtime" type="text" class="input-text" value="${sysUser.lastlogtime}" disabled="disabled">
					</div>					
				</div>
				<div class="row cl" id="divcreatetime">
					<label class="form-label col-xs-4 col-sm-2">创建日期：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="createtime" type="text" class="input-text" value="${sysUser.createtime}" disabled="disabled" >
					</div>
				</div>
				<div class="row cl" >
					<label class="form-label col-xs-4 col-sm-2">备注：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="memo" type="text" class="input-text" value="${sysUser.memo}" >
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnsave" class="btn btn-primary" onclick="savedata();" role="button">保 存</a>
						<!-- <span style="margin:0px 30px 0px 30px"></span> -->
						<a id="btncancel" class="btn btn-primary" onclick="layer_close();" role="button">关 闭</a>
					</div>
				</div>
				<input type="hidden" id="userid" value="${sysUser.userid}">	
				<input type="hidden" id="shopid" value="${sysUser.shopid}">
				<input type="hidden" id="hstatus" value="${sysUser.status}">	
				<input type="hidden" id="husertype" value="${sysUser.usertype}">
			</form>
		</div>
		<!-- 加油站模态框（Modal） -->
		<div class="modal fade" id="shopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:700px;height:600px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="shopModalTitle">加油站列表</h4>
					</div>
					<div class="modal-body">
						<table class="table-bordered" id="shoptable"></table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>	
						<button id="shopok" type="button" class="btn btn-primary" data-trigger="click" title="提示"  onclick="okshop();"
								data-container="body" data-placement="auto left" data-content="请单击选择加油站！">确定
						</button>
					</div>
				</div>
			</div>
		</div>		
	</body>
	<script type="text/javascript">
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200;
		jQuery(function($) {
			$('#status').val($("#hstatus").val());
			$('#usertype').val($("#husertype").val());
			if($("#userid").val()==""||$("#userid").val()==null){
				$('#divshop').hide();
				$('#divlastlogtime').hide();
				$('#divcreatetime').hide();
				$('#divusercode').hide();
			}else{
				$("#divpassoword").hide();
			}
			if($("#usertype").val()=="1"){
				$('#divshop').show();
			}else{
				$('#divshop').hide();
			}
			
			$("#btnSubmit").click(function() {
				savedata();
			});
			$("#usertype").change(function() {
				$('#shopid').val("");
				$('#shopname').val("");
				if($("#usertype").val()=="1"){
					$('#divshop').show();
				}else{
					$('#divshop').hide();
				}
			});
		});
		function savedata(){
			var ulogincode=$("#logincode").val();
			if(ulogincode==""||ulogincode==null){
				toastr.warning("请输入用户账号！");
				return;
			}
			var urealname=$("#realname").val();
			if(urealname==""||urealname==null){
				toastr.warning("请输入用户姓名！");
				return;
			}
			var uusertype=$("#usertype").val();
			if(uusertype==""||uusertype==null){
				toastr.warning("请选择用户类型！");
				return;
			}
			var ushopid=$("#shopid").val();
			if(uusertype=="1"&&(ushopid==""||ushopid==null)){
				toastr.warning("请选择商家！");
				return;
			}
			var ustatus=$("#status").val();
			if(ustatus==""||ustatus==null||ustatus=="0"){
				toastr.warning("请选择状态！");
				return;
			}
			var rowData={"userid":$("#userid").val(),"logincode":$("#logincode").val(),
			"realname":$("#realname").val(),"password":$("#password").val(),
			"usertype":$("#usertype").val(),"shopid":$("#shopid").val(),
			"status":$("#status").val(),"memo":$("#memo").val()};
			console.log(JSON.stringify(rowData));
			 
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/sysUser/saveSysUser",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="SS01"){
						toastr.success(result.info);
						if($("#userid").val()=="") cleardata();
					}else
						toastr.error(result.info);
					//layer_close();
				},
				error : function(errorMsg) {
					toastr.error("数据保存异常，请联系管理员！");
				}
			}); 
		}
		function selectshop(){
			$('#shoptable').bootstrapTable(	{
				pagination : true,
				showLoading : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 'All' ],
				height:300,
				clickToSelect: true,
				singleSelect: true,
				columns : [{checkbox:true,title:'选择'},
				{field:'nums',title : '#',align : 'center',width : 30,
					formatter : function(value, row, index) {return index + 1;}
				},
				{field : 'shopcode',title : '加油站编码',width : 80,sortable : true,align : "center"},
				{field : 'shopname',title : '加油站名称',width : 150,sortable : true,align : "left"},				
				{field : "status",title : "状态",width : 50,sortable : true,align : "center",
					formatter : function(cellvalue,options, row) {
						var result = "";
						if (cellvalue =="") {
							result = "异常";
						} else if (cellvalue=="0") {
							result = "禁用";
						} else if (cellvalue=="1") {
							result = "启用";
						}
						return result;
					}
				},{field:'shopid',title:'shopid',visible:false}],
				onClickRow: function(row, $element) { 
			        index = $element.data('index');
			        console.log(index);
			    }
			});
			//获取
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/getShopByRight",
				dataType : "json",
				//data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					console.log(result);
					$("#shoptable").bootstrapTable("load", result);
				},
				error : function(errorMsg) { }
			}); 
			$("#shopModal").modal("show"); 
		}
		function okshop(){
			var rowobj= $("#shoptable").bootstrapTable('getSelections');			
			if(rowobj.length==1){
				$("#shopid").val(rowobj[0].shopid);
				$("#shopname").val(rowobj[0].shopname);
				$("#shopModal").modal("hide"); 
			}else{
				$("#shopok").popover("show");  
				setTimeout(function(){$("#shopok").popover("destroy");},1000);
			}
		}
		function cleardata(){
			$("#userid").val("");
			$("#shopid").val("");
			$("#shopname").val("");
			$("#usercode").val("");
			$("#logincode").val("");
			$("#realname").val("");
			$("#passowrd").val("");
			$("#usertype").val("");
			$("#status").val("");
			$("#memo").val("");
		}
	</script>
</html>