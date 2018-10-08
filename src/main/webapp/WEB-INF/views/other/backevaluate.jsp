<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/home/plugins/layer/skin/layer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/jqgrid/ui.jqgridffe4.css?0820" rel="stylesheet">
</head>
<body class="gray-bg">

 <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                       <h5>评论详情</h5>
                        <div class="ibox-tools">
                            <button onclick="JavaScript:history.back(-1);" type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button>
                        </div>
                    </div>
                    
                    <div class="ibox-content">
                        <div class="media-body">
                            <h4><a href="#">${obj.user.username}</a> 对本油站发表评论</h4>
                        </div>
                        <div class="social-footer">
                        <div class="social-comment">
                           
                            <div class="media-body" >
                                 -<a href="#">${obj.user.username}：</a>
                                <small class="text-muted">发表于${obj.addTime}</small>
                                <br>
                                  ${obj.content} <br/>
                                 <div class="media-body" id="eva"></div>
                            </div>
                        </div>
                     <div class="reply">
						<c:if test="${obj.isreply ==1}">
						<c:forEach var="reply" items="${obj.replies}" varStatus="status">
							<div class="social-comment">
                            <div class="media-body">
                                 -
                                   <a href="#">
                               
                                    ${reply.storep.name}：
                              
                                  
                                </a>
                                <small class="text-muted">回复${reply.target.username}于 ${reply.addTime}</small>
                                <br>
                               ${reply.content}
                            </div>
                        </div>
						
						
						</c:forEach>
                        
                        </c:if>
                        
                     </div>   
                        <div class="social-comment">
                            <hr/>
                            <a href="" class="pull-left">我：</a>
                            <div class="media-body ">
                            	<form id="form">
                            		<input type="hidden" name="targetId" value="${obj.user.id}" />
                            		<input type="hidden" name="eid" value="${obj.id}" /> 
	                                <textarea name="content" class="form-control" style="height:50px;" placeholder="填写评论回复... "></textarea>
	                                <button id="submit" onclick="return false;" class="btn btn-primary" style="margin-top:10px;"  type="button">回复</button>
                            	</form>
                            </div>
                        </div>
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
    <script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/layer/layer.min.js"></script>
</body>
<script type="text/javascript">

	var url="${pageContext.request.contextPath}/"+"${!empty pageUrl ? pageUrl:''}";
	$("#submit").click(function(){
			$.post("${pageContext.request.contextPath}/admin/storeEvaluateReply",$('#form').serialize(),function(data){
				if(data.success==true){
					location.reload();
					consloe.log(data);
				/* 	var obj=data.obj;
					var html='<div class="social-comment">'+
	                    '<div class="media-body">'+
	                    '<small class="text-muted">回复于 '+obj.addTime+'</small>'+
	                    '<br>'+
	                    '<a href="#">';
                    if(obj.type ==0){
                    	html+=obj.storep.name;
                    }else if(obj.type ==1){
                    	html+=obj.target.name;
                    }
                    html+= ' ：</a>'+obj.content+'</div></div>';
                  $(".reply:first").append(html);             */
				}
				alert(data.message);
			});

		});
</script>
</html>