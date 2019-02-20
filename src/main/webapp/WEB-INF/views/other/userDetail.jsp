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
    <link href="${pageContext.request.contextPath}/resources/css/home/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home/style.min862f.css?v=4.1.0" rel="stylesheet">
    
</head>
<body class="gray-bg">
      <div class="wrapper wrapper-content animated fadeInRight ">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>会员详情</h5>
                        <div class="ibox-tools">
                            <button onclick="JavaScript:history.back(-1);" type="button" class="btn btn-w-m btn-white btn-xs"><i class="fa fa-reply"></i>返回</button>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td style="background-color:#f3f3f4; width:20%;">会员名称</td>
                                    <td>${!empty obj.username ? obj.username:''}</td>
                                    <td style="background-color:#f3f3f4; width:20%;">会员邮箱</td>
                                    <td><a href="">${!empty obj.email ? obj.email:''}</a></td>
                                </tr>
                                <tr>
                                    <td style="background-color:#f3f3f4; width:20%;">会员真实姓名</td>
                                    <td>${!empty obj.realname ? obj.realname:''}</td>
                                    <td style="background-color:#f3f3f4; width:20%;">会员车牌号</td>
                                    <td>${!empty obj.carnum ? obj.carnum:''}</td>
                                </tr>
                                <tr>
                                    <td style="background-color:#f3f3f4; width:20%;">会员等级</td>
                                    <td>普通会员</td>
<!--                                     <td style="background-color:#f3f3f4; width:20%;">余额(元)</td> -->
<!--                                     <td>3000.05元</td> -->
									<td style="background-color:#f3f3f4; width:20%;">手机号</td>
                                    <td>${!empty obj.userphone ? obj.userphone:''}</td>
                                   
                                </tr>
                                <tr>
                                    <td style="background-color:#f3f3f4; width:20%;">注册日期</td>
                                    <td>${!empty obj.creatTime ? obj.creatTime:''}</td>
<!--                                     <td style="background-color:#f3f3f4; width:20%;">推荐人</td> -->
<!--                                     <td>马云</td> -->
                                    
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                     <td style="background-color:#f3f3f4; width:20%;">QQ</td> -->
<!--                                     <td>215273421</td> -->
                                    <td style="background-color:#f3f3f4; width:20%;">最后登录时间</td>
                                    <td>${!empty obj.lastLogTime ? obj.lastLogTime:''}</td>
                                </tr>
                                  <tr>
                                    <td style="background-color:#f3f3f4; width:20%;">会员积分</td>
                                    <td>${!empty obj.userIntegral ? obj.userIntegral:''}</td>
                                  </tr>
                              <!--   <tr>
                                    <td style="background-color:#f3f3f4; width:20%;">家庭电话</td>
                                    <td></td>
                                    
                                </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>            
        </div>        
      </div>
    <script src="${pageContext.request.contextPath}/js/home/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/home/bootstrap.min.js?v=3.3.6"></script>
    <script src="${pageContext.request.contextPath}/js/ceshi/common.js"></script>
    
    <script src="${pageContext.request.contextPath}/js/home/plugins/jsjava/text/Format.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/jsjava/text/DateFormat.js"></script>
    <script src="${pageContext.request.contextPath}/js/home/plugins/jsjava/text/SimpleDateFormat.js"></script>
</body>
<script type="text/javascript">

function myDate(date,layout){
	 var strStart ="";
	 if(date!=""){
		 if(layout==null){layout="yyyy-MM-dd HH:mm:ss"}
		 var sdf=new SimpleDateFormat(); //
		 sdf.applyPattern(layout);
	     var mytime =new Date(Date.parse(date)); 
	     strStart=sdf.format(mytime); 
	 }
     return strStart;
}
jQuery(function($) {
	var lastTime = myDate("${obj.lastLogTime}");
	$("#lastLogTime").append(lastTime);
	
	var mytime = myDate("${obj.birthday}","yyyy-MM-dd");
	$("#birthday").append(mytime);
	
	var gender = ${!empty obj.gender ? obj.gender:''};
	if(gender==""){$("#gender").append("保密");}
	if(gender==1){$("#gender").append("男");}
	if(gender==2){$("#gender").append("女");}
});
function goBack(url){
	if(url){
		location.href="${pageContext.request.contextPath}/"+url;
	}
};
</script>

</html>