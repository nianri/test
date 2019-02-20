<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>眼镜商城后台</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
	
    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/chosen/chosen.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home/plugins/multiselect-master/prettify.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home/demo/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ceshi/uploader.css">
    <style>
	    .table{border:0px;border-collapse:collapse;border-spacing:0;}
	    .tr{height:30px;}
	    .tr td{border-bottom:1px solid #BBB;}
	</style>
</head>

<body class="gray-bg">
	  <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-content">
                        
                      <div class="clients-list">
                            <h3>申请入驻商家详情</h3>
                      	 <div class="clients-list">
                            <div class="ibox-tools">
                                  <button onclick="JavaScript:history.back(-1);" type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button>
                            </div>
                            <ul class="nav nav-tabs">
                               
                                <li class="active"><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i> 入驻商家信息</a></li>
                             
                            </ul>
                            <div class="tab-content">
                               

                                <div id="tab-2" class="tab-pane active" style="padding-bottom:30px; height:auto;">
                                    <div class="row" style="margin-top:10px;">
                                         <div class="col-sm-12" >
                                              <div class="panel panel-default">
                                                        <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            	商家资料
                                                        </div>
                                                        <div class="panel-body">
                                                             <form class="form-horizontal m-t" id="commentForm">
                                                                   
                                                                   <div class="form-group">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-3 control-label">加油站名称：</label>
                                                                        <div class="col-sm-8">
                                                                             <input   type="text" class="form-control" value="${store.name}"  readonly="readonly" >
                                                                        </div>
                                                                   </div>
                                                                   
                                                                    <div class="form-group">
                                                                        <label class="col-sm-3 control-label">加油站地址：</label>
                                                                        <div class="col-sm-8">
                                                                             <input   type="text" class="form-control" value="${store.detail}"  readonly="readonly" >
                                                                        </div>
                                                                   </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-3 control-label">加油站负责人姓名：</label>
                                                                        <div class="col-sm-8">
                                                                             <input   type="text" class="form-control" value="${store.addername}"  readonly="readonly" >
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">加油站负责人电话：</label>
                                                                        <div class="col-sm-8">
                                                                             <input   type="text" class="form-control" value="${store.addertel}"  readonly="readonly" >
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">加油站负责人邮箱：</label>
                                                                        <div class="col-sm-8">
                                                                             <input type="text" class="form-control" value="${store.userEmail}"  readonly="readonly" />
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">开户银行：</label>
                                                                        <div class="col-md-8">
                                                                            <input type="text" class="form-control" value="${store.blankname}"  readonly="readonly" />
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">开户银行卡号：</label>
                                                                        <div class="col-sm-8">
                                                                             <input type="text" class="form-control" value="${store.blankcardnum}"  readonly="readonly" />
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">开户人姓名：</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text" class="form-control" readonly="readonly"
                                                                            value="${store.blankusername}"   />
                                                                        </div>
                                                                   </div>
                                                                
                                                                  <div class="form-group">
                                                                        <label class="col-sm-3 control-label">营业执照：</label>
                                                                        <div class="col-sm-8" id="yyzz">
<%--                                                                         	<img alt="法人身份证" id= src="${(store.storeCompany).owner_idCardPhoto}"/> --%>
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">成品油许可证：</label>
                                                                        <div class="col-sm-8" id="cpyxkz">
<%--                                                                         	<img alt="法人身份证" id= src="${(store.storeCompany).owner_idCardPhoto}"/> --%>
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">身份证正面照：</label>
                                                                        <div class="col-sm-8" id="sfzzmz">
<%--                                                                         	<img alt="法人身份证" id= src="${(store.storeCompany).owner_idCardPhoto}"/> --%>
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">身份证反面照：</label>
                                                                        <div class="col-sm-8" id="sfzfmz">
<%--                                                                         	<img alt="营业执照" src="${(store.storeCompany).license_Photo}"/> --%>
                                                                        </div>
                                                                   </div>
                                                                  
                                                                   
                                                                   </div>
                                                             </form>
                                                        </div>
                                             		</div>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                               <div class="col-sm-12" >
                                              <div class="panel panel-default" >
                                                        <div class="panel-heading">
                                                           	 审核意见区
                                                        </div>
                                                        <div class="panel-body">
                                                             <form class="form-horizontal m-t" id="check">
                                                             		
                                                                   <div class="form-group">
                                                                        <label class="col-sm-3 control-label">资料审核状态：</label>
                                                                        <div class="col-sm-2">
                                                                            <input type="text" class="form-control" readonly="readonly"
                                                                            <c:if test="${store.flag =='-1'}">value="待审核"</c:if>
                                                                            <c:if test="${store.flag =='-2'}">value="审核未通过"</c:if>
                                                                            <c:if test="${store.flag =='0'}">value="审核已通过"</c:if>
                                                                              />
                                                                        </div>
                                                                   </div>
                                                                   <%-- <div class="form-group" <c:if test="${store.aptitudeState !=3}">style="display:none;"</c:if>>
                                                                        <label class="col-sm-3 control-label">合同审核状态：</label>
                                                                        <div class="col-sm-2">
                                                                            <input type="text" class="form-control" readonly="readonly"
                                                                            <c:if test="${store.contractState ==1}">value="审核通过|等待复核"</c:if>
                                                                            <c:if test="${store.contractState ==0}">value="未审核"</c:if>
                                                                            <c:if test="${store.contractState =='-1'}">value="审核未通过"</c:if>
                                                                              <c:if test="${store.contractState =='2'}">value="审核通过|复核未通过"</c:if>
                                                                            <c:if test="${store.contractState =='3'}">value="审核通过|复核通过"</c:if>
                                                                              />
                                                                        </div>
                                                                   </div> --%>
                                                                   
                                                                   <div class="form-group" >
                                                                    
                                                                    <label class="col-sm-3 control-label">
                                                                    	<span style="color: red;">资质审核</span>
                                                                      <%-- <c:choose>  
																		   <c:when test="${store.aptitudeState==0||store.aptitudeState==-10}">  
																	           <span style="color: red;">资质审核</span>
																		   </c:when>  
																		   <c:when test="${store.aptitudeState==-20||store.aptitudeState==10}">  
																		        <span style="color: red;">资质复核</span>
																		   </c:when>  
																		      <c:when test="${store.contractState<1&&store.contractState>=-1}">  
																	           <span style="color: red;">合同审核</span>
																		   </c:when>  
																		   <c:when test="${store.contractState<3&&store.contractState>=1}">  
																		       <span style="color: red;"> 合同复核</span>
																		   </c:when>  
																		   <c:otherwise>  
																		   </c:otherwise> 
																      </c:choose>  --%> 
                                                                                                                                                                                   是否通过：</label>
                                                                        <div class="col-sm-3">
                                                                        		 <input type="hidden" name="id" value="${store.id}">
                                                                            	是<input type="radio" name="state"
                                                                            		<c:if test="${store.flag =='-2'}">checked</c:if>value="flag,0"
                                                                            			<%-- <c:if test="${store.aptitudeState !=-1 ||store.contractState !=-1}">checked</c:if>
                                                                            			<c:if test="${store.aptitudeState ==0}">value="aptitudeState,1"</c:if>
                                                                            			<c:if test="${store.aptitudeState ==1}">value="aptitudeState,3"</c:if>
                                                                            			<c:if test="${store.aptitudeState ==3&&store.contractState==0}">value="contractState,1"</c:if>  
                                                                            			<c:if test="${store.contractState ==1}">value="contractState,3"</c:if>   --%>
                                                                            		/>
                                                                            	否<input type="radio" name="state" 
                                                                            		<c:if test="${store.flag =='-2' }">checked</c:if>value="flag,-2"
                                                                            			<%-- <c:if test="${store.aptitudeState ==-1 ||store.contractState ==-1}">checked</c:if>
                                                                            			<c:if test="${store.aptitudeState ==0}">value="aptitudeState,-1"</c:if>
                                                                            			<c:if test="${store.aptitudeState ==1}">value="aptitudeState,2"</c:if>
                                                                            			<c:if test="${store.aptitudeState ==3&&store.contractState==0}">value="contractState,-1"</c:if>
                                                                            			<c:if test="${store.contractState ==1}">value="contractState,2"</c:if>  --%>
                                                                            	 	/>
                                                                        </div>
                                                                   </div>
                                                                  
                                                                     <div class="form-group" >
                                                                   <label class="col-sm-3 control-label">审核意见：</label>
                                                                        <div class="col-sm-8">
                                                                            <textarea rows="5" cols="100" name="remark">"${store.remark}"</textarea>
                                                                        </div>
                                                                   </div>
                                                                   <div class="form-group" >
                                                                        <div class="col-sm-4 col-sm-offset-3">
                                                                        	<button id="submit" class="btn btn-primary" onclick="return false;"
                                                                        	<c:if test="${store.flag =='0'}">disabled</c:if>>提交</button>
                                                                        </div>
                                                                   </div>
                                                             </form>
                                                        </div>
                                             </div>
                                         </div>
                                
                            


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
    <script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/chosen/chosen.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/multiselect-master/js/multiselect.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/demo/webuploader.js"></script>
    <script src="${pageContext.request.contextPath}/js/ceshi/uploader.js"></script>
    <script type="text/javascript">
        var BASE_URL = 'js/plugins/webuploader/index.html';
    </script>
    <script type="text/javascript">
    var url="${pageContext.request.contextPath}/"+"${!empty pageUrl ? pageUrl:''}";
    $("#submit").click(function(){
		$.post("${pageContext.request.contextPath}/shop/audit",
				$('#check').serialize(),
				function(data){
					alert(data.message);
					if(data.success==true){
						location.href=url;
					}
		});
	});
    $(function(){ 
    
    	
    	var yyzz = "${store.yyzz}";
    	
    	var cpyxkz = "${store.cpyxkz}";
    	var sfzzmz = "${store.sfzzmz}";
    	var sfzfmz = "${store.sfzfmz}";
    	$("#yyzz").html(getSrcs(yyzz));
    	$("#cpyxkz").html(getSrcs(cpyxkz));
    	$("#sfzzmz").html(getSrcs(sfzzmz));
    	$("#sfzfmz").html(getSrcs(sfzfmz));
    
    	$("#yyzz").children("img").attr("onClick", "intProvince(this);").show();
    	$("#cpyxkz").children("img").attr("onClick", "intProvince1(this);").show();
    	$("#sfzzmz").children("img").attr("onClick", "intProvince2(this);").show();
    	$("#sfzfmz").children("img").attr("onClick", "intProvince3(this);").show();

    
    	}); 
 
	
    function getSrcs(path){
    	var srcs = path.split(",");
    	var photo="";
    	if(srcs!="" && srcs.length>0){
	    	$.each(srcs,function(index,value){
	    		photo += "<img  style=\"width:226px;height:140px;\" src=\"../upload/"+value+"\"/>";
	    		
	    	});
    	}
    	return photo;
    }
 
    var flag=true;
    var flag1=true;
    var flag2=true;
    var flag3=true;
    function intProvince(obj){
    	var imgH=obj.height;
    	var imgW=obj.width;
    	 if(flag){
             //图片为正常状态,设置图片宽高为现在宽高的2倍
             flag = false;//把状态设为放大状态
             obj.height = imgH*2;
             $("#yyzz").children("img").height(imgH*5);
             obj.width = imgW*2;
             $("#yyzz").children("img").width(imgW*4);
         }else{
             //图片为放大状态,设置图片宽高为现在宽高的二分之一
             flag = true;//把状态设为正常状态
             obj.height = imgH/2;
             $("#yyzz").children("img").height(imgH/5);
             obj.width = imgW/2;
             $("#yyzz").children("img").width(imgW/4);
         }

    }
    function intProvince1(obj){
    	var imgH=obj.height;
    	var imgW=obj.width;
    	 if(flag1){
             //图片为正常状态,设置图片宽高为现在宽高的2倍
             flag1 = false;//把状态设为放大状态
             obj.height = imgH*2;
             $("#cpyxkz").children("img").height(imgH*5);
             obj.width = imgW*2;
             $("#cpyxkz").children("img").width(imgW*4);
         }else{
             //图片为放大状态,设置图片宽高为现在宽高的二分之一
             flag1 = true;//把状态设为正常状态
             obj.height = imgH/2;
             $("#cpyxkz").children("img").height(imgH/5);
             obj.width = imgW/2;
             $("#cpyxkz").children("img").width(imgW/4);
         }

    }
    function intProvince2(obj){
    	var imgH=obj.height;
    	var imgW=obj.width;
    	 if(flag2){
             //图片为正常状态,设置图片宽高为现在宽高的2倍
             flag2 = false;//把状态设为放大状态
             obj.height = imgH*2;
             $("#sfzzmz").children("img").height(imgH*5);
             obj.width = imgW*2;
             $("#sfzzmz").children("img").width(imgW*4);
         }else{
             //图片为放大状态,设置图片宽高为现在宽高的二分之一
             flag2= true;//把状态设为正常状态
             obj.height = imgH/2;
             $("#sfzzmz").children("img").height(imgH/5);
             obj.width = imgW/2;
             $("#sfzzmz").children("img").width(imgW/4);
         }

    }
    function intProvince3(obj){
    	var imgH=obj.height;
    	var imgW=obj.width;
    	 if(flag3){
             //图片为正常状态,设置图片宽高为现在宽高的2倍
             flag3 = false;//把状态设为放大状态
             obj.height = imgH*2;
             $("#sfzfmz").children("img").height(imgH*5);
             obj.width = imgW*2;
             $("#sfzfmz").children("img").width(imgW*4);
         }else{
             //图片为放大状态,设置图片宽高为现在宽高的二分之一
             flag3 = true;//把状态设为正常状态
             obj.height = imgH/2;
             $("#sfzfmz").children("img").height(imgH/5);
             obj.width = imgW/2;
             $("#sfzfmz").children("img").width(imgW/4);
         }

    }
    </script>
</body>
</html>
