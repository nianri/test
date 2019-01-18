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
			<h5>意见反馈列表</h5>
		</div>
		<div class="ibox-content">			 
			<span class="col-sm-2"> 
				<select id="status" name="status"	class="form-control m-b">
					<option value="">请选择回复状态</option>
					<option value="0">未回复</option>
					<option value="1">已回复</option>
				</select>
			</span>
			<span class="col-sm-3">
				<input type="text" id="feedbackmsg"	placeholder="请输入反馈内容" class="form-control"></span>
			<span>
				<a id="queryBtn" href="javascript:void(0);" class="btn btn-primary">搜索</a>
			</span>	
			<span style="float:right">
				<ul class="nav navbar-nav"  >
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						导出
						<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href='javascript:void(0);'  onclick='exportData()'>导出当前页</a></li>
							<li class="divider"></li>
							<li><a href='javascript:void(0);'  onclick='exportData(true)'>导出全部</a></li>
						</ul>
					</li>
				</ul>
			</span>			
			<div class="jqGrid_wrapper">
				<table class="table-bordered" id="showtable" >
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="createFileMModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createFileTitle">创建文件</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
          	<input type="hidden" id="replyid">
            <textarea autofocus class="form-control" placeholder="不得超过200个汉字"  rows="3" id="replymsg"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="createFileSureBut">确定</button>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	var grid;
	//排序号、商品名称、所需积分、图片、添加时间、操作
	jQuery(function($) {
		$('#showtable').bootstrapTable(	{
			pagination : true,
			showLoading : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 'All' ],
			columns : [
			{field:'nums',title : '#',align : 'center',width : 30,
				formatter : function(value, row, index) {return index + 1;}
			},
			{field : 'feedbacktime',title : '反馈时间',width : 30,sortable : true,align : "left"},
			{field : 'membername',title : '反馈人',width : 150,sortable : true,align : "left"},
			{field : 'feedbackmsg',title : '反馈意见',width : 50,sortable : true,align : "right"},
			{field : "status",title : "状态",width : 50,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if (cellvalue =="0") {
						result = "未回复";
					}  else {
						result = "已回复";
					}
					return result;
				}
			},
			{field : "feedbacktype",title : "反馈类型",width : 50,sortable : true,align : "center",
				formatter : function(cellvalue,options, row) {
					var result = "";
					if (cellvalue !="1") {
						result = "意见";
					}  else {
						result = "投诉";
					}
					return result;
				}
			},
			{field:'feedbackid',title:'feedbackid',visible:false}, 
			{
				field : 'action',
				title : '操作',
				width : 150,
				align : "center",
				
				formatter : function(cellvalue,options, row) {
					var html = "<a href='javascript:void(0);'  class='btn btn-primary' onclick='getFeedbackInfo(\""
							+ options.feedbackid + "\")' >详情</a>  ";
						if(options.status=='0'){
							html += "<a href='javascript:void(0);' class='btn btn-primary' onclick='reply(\""
							+ options.feedbackid + "\")' >回复</a>";
						}
					//console.log(html);
					return html;
				}
			}],		 
		});
		$("#exportBtn").on("click", function(e) {
			$("#showtable").tableExport({
				fileName:'反馈列表',
				ignoreCol : '5'
			});
		});
		$("#exportBtn1").on("click", function(e) {
			 var url = "${pageContext.request.contextPath}/export/download1.do";
		        var fileName = "testAjaxDownload.txt";
		        var form = $("<form></form>").attr("action", url).attr("method", "post");
		        form.append($("<input></input>").attr("type", "hidden").attr("name", "fileName").attr("value", fileName));
		        form.appendTo('body').submit().remove();
		});
		$("#queryBtn").click(function() {
			binddata();
		});
		binddata();
		$("#createFileSureBut").click(function (){
            var replymsg = $("#replymsg").val().trim();
            if(replymsg==""||replymsg==null){
            	toastr.error("请输入回复内容");
				return;
			}
            if(replymsg.length>200){
            	toastr.error("回复内容不能超过200个字符");
				return;
			}
            var rowData={
            	"replymsg":replymsg,
            	"feedbackid":$("#replyid").val(),
            	"status":"1"
            }
            $.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/feedbackInfo/updateFeedbackInfo",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				if(result.code=="RS01"){
					toastr.success(result.info);
		            $("#createFileMModal").modal("hide");
					binddata();
				}else
					toastr.error(result.info);
			},
			error : function(errorMsg) {
				toastr.error("数据保存异常，请联系管理员！");
			}
		});
        });
	});
	function exportData(isAllPage){
		 var url = "${pageContext.request.contextPath}/export/download.do";
		if(isAllPage){
			var rowData=getParams();
			exportAll(url,"feedbackInfoService","意见反馈.xlsx",rowData);
			}else{
			exportNowPage("#showtable","意见反馈",'5','0');
		}
	}
	function getParams(){
		var rowData =  {"feedbackmsg":$("#feedbackmsg").val(),"status":$("#status").val()};
		return rowData;
	}
	function getFeedbackInfo(feedbackid) {
		var index = layer.open({
			type : 2,title : "反馈详情",
			content : "${pageContext.request.contextPath}/feedbackInfo/getFeedbackInfo/"+feedbackid+""
		});
		layer.full(index);
	}
	function reply(feedbackid) {
		 $("#createFileTitle").text("回复");
         $('#createFileMModal').modal('show');
         $("#replyid").val(feedbackid);
         $("#replymsg").val("");
	}
	function binddata() {
		var rowData = {"feedbackmsg":$("#feedbackmsg").val(),"status":$("#status").val()};
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/feedbackInfo/getFeedbackInfoList",
			dataType : "json",
			data : JSON.stringify(rowData),
			contentType : 'application/json',
			success : function(result) {
				result = eval(result);
				console.log(result);
				$("#showtable").bootstrapTable("load", result);
			},
			error : function(errorMsg) { }
		});
	}
</script>
</html>