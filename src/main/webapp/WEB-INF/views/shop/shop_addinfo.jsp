<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/h-ui.admin/css/style.css" />
		<link href="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/css/bootstrap.min.css"	rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/BootstrapSelect/css/bootstrap-select.min.css" rel="stylesheet" />		
		
		<script src="${pageContext.request.contextPath}/resources/Bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/BootstrapSelect/js/bootstrap-select.min.js"></script>		
		
		<script	src="${pageContext.request.contextPath}/resources/toastr/toastr.min.js" type="text/javascript"	></script>
		<link href="${pageContext.request.contextPath}/resources/toastr/toastr.min.css" rel="stylesheet" >		
		<script src="${pageContext.request.contextPath}/resources/fileinput/js/fileinput.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/resources/fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
		<script src="${pageContext.request.contextPath}/resources/fileinput/js/locales/zh.js" type="text/javascript"></script>	
		
		<script src="${pageContext.request.contextPath}/resources/static/h-ui.admin/js/H-ui.admin.js " type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/layer/2.4/layer.js" type="text/javascript" ></script>
		<script src="${pageContext.request.contextPath}/resources/static/h-ui/js/H-ui.min.js" type="text/javascript"></script> 
		<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=F8xxgmeOcjHWtPiOS75AoVq35OBWVPNl"></script>
		<style type="text/css">
			body,html,#allmap {width:100%;height:90%;overflow: false;margin:0;font-family:"微软雅黑";}
		</style>
	</head>
	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="form-article-add">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">加油站名称<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopname}" id="shopname" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">所属位置<span style="color:red">*</span>：</label>
					<div class="col-sm-9" >		 		
					    <select id="selprovince" class="selectpicker" ></select>
						<select id="selcity" class="selectpicker" ></select>	
						<select id="selcounty" class="selectpicker" ></select>		
				 	 </div>
				</div> 	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">详细地址<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.address}"  id="address" >
					</div>
				</div>	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商家服务(限20字)：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.shopservice}"  id="shopservice" >
					</div>
				</div>							
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人姓名<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadername}" id="leadername" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">负责人电话<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leadertel}" id="leadertel" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">负责人邮箱<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.leaderemail}" id="leaderemail" >
					</div>
				</div>
				<hr>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商户号<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text" value="${shop.cusid}" id="cusid" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">商户星级<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<select id="shoplevel" class="form-control m-b">
							<option value="1">1级</option>
							<option value="2">2级</option>
							<option value="3">3级</option>
							<option value="4" selected>4级</option>
							<option value="5">5级</option>
						</select>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">商户AppId<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="appid" type="text" class="input-text" value="${shop.appid}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">商户AppKey<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="appkey" type="text" class="input-text" value="${shop.appkey}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户行<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id=accountbank type="text" class="input-text" value="${shop.accountbank}" >
					</div>
					<label class="form-label col-xs-4 col-sm-2">开户账号<span style="color:red">*</span>：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="accountnums" type="text" class="input-text" value="${shop.accountnums}" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">开户人：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input id="accountname" type="text" class="input-text" value="${shop.accountname}" >
					</div>
				</div>
				<hr>
				<form enctype="multipart/form-data" id="form0" name="form0" >
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">商家油站图<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="fileshopimg" name="fileshopimg" type="file" ></div> 
						</div>
					</div>
				</form>
				<hr>
				<form enctype="multipart/form-data" id="form1" name="form1" >
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">营业执照<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filelicenseimg" name="filelicenseimg" type="file"  ></div> 
						</div>
					</div>
				</form>
				</br>
				<form enctype="multipart/form-data" id="form2" name="form2" method="post">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">成品油许可证<span style="color:red">*</span>：</label>
						<div class="col-sm-8">						
							<div class="file-loading"><input id="fileprolicenseimg" name="fileprolicenseimg"  type="file" ></div>
						</div>
					</div>
				</form>
				</br>
				<form enctype="multipart/form-data" id="form3" name="form3">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">身份证正面照<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filecardtop" name="filecardtop" type="file" ></div>
						</div>
					</div>
				</form>
				</br>
				<form enctype="multipart/form-data" id="form4" name="form4">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">身份证反面照<span style="color:red">*</span>：</label>
						<div class="col-sm-8">
							<div class="file-loading"><input id="filecarddown" name="filecarddown" type="file" ></div>
						</div>
					</div>	
				</form>
				</br>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">备注：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${shop.memo}" id="memo" >
					</div>
				</div>
			</form>
		</div>
		<hr>
		<hr>
		<div style="height:500px;text-align: center;margin:1px 20px 0px 20px;">
			<div id="allmap" ></div>	
		</div> 
		<div style="color:red;text-align: center;font-size:16px;">请正确设置商家所处地理位置的经纬度!否则会导致用户导航偏离！</div>
		<div class="page-container">
			<div class="form form-horizontal">	
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">位置：</label>
					<div class="formControls col-xs-8 col-sm-8">
						<input type="text" class="input-text" id="posxy" value="${shop.areadesc}">
					</div>
					<a class="btn btn-primary" onclick="searchmap()" role="button">搜 索</a>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">经度：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text"  id="longitude" value="${shop.longitude}" readonly>
					</div>
					<label class="form-label col-xs-4 col-sm-2">伟度：</label>
					<div class="formControls col-xs-8 col-sm-3">
						<input type="text" class="input-text"  id="latitude" value="${shop.latitude}" readonly>
					</div>
				</div>				
			</div>
		</div>
		<hr>
		<div class="page-container">
			<div class="row cl">
				<div style="text-align: center;">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">						
						<a id="btnSave" class="btn btn-primary" role="button">&nbsp;&nbsp;&nbsp;保&nbsp;存&nbsp;&nbsp;&nbsp;</a>
						<a id="btnClose" class="btn btn-primary" onclick="layer_close();"role="button">&nbsp;&nbsp;&nbsp;关&nbsp;闭&nbsp;&nbsp;&nbsp;</a>
					</div>
				</div>
			</div>
		</div>	
		<input type="hidden" id="shopid" value="${shop.shopid}">
		<input type="hidden" id="shopimg" value="${shop.shopimg}">
		<input type="hidden" id="licenseimg" value="${shop.licenseimg}">
		<input type="hidden" id="prolicenseimg" value="${shop.prolicenseimg}">
		<input type="hidden" id="cardtop" value="${shop.cardtop}">
		<input type="hidden" id="carddown" value="${shop.carddown}">
		<input type="hidden" id="provinceid" value="${shop.provinceid}">
		<input type="hidden" id="cityid" value="${shop.cityid}">
		<input type="hidden" id="countyid" value="${shop.countyid}">
	</body>
	<script type="text/javascript">
		toastr.options.positionClass = 'toast-top-center';
		toastr.options.timeOut = 1200; 
		var map = new BMap.Map("allmap"); 
		$(document).ready(function(){
			$('#selprovince').append("<option value='0'>请选择省份</option>");
			$('#selcity').append("<option value='0'>请选择市</option>");
			$('#selcounty').append("<option value='0'>请选择县(区)</option>");
			$('#selprovince').on('changed.bs.select', function (e) {
		        $('#selcity').empty();
		        $('#selcity').append("<option value='0'>请选择市</option>"); 
		        $("#selcity").selectpicker('refresh');
		        $('#selcounty').empty();
		        $('#selcounty').append("<option value='0'>请选择县(区)</option>"); 
		        $("#selcounty").selectpicker('refresh');
		       	getcity($('#selprovince').selectpicker('val'),"");
		    }); 
		    $('#selcity').on('changed.bs.select', function (e) {
		        $('#selcounty').empty();
		        $('#selcounty').append("<option value='0'>请选择县(区)</option>");
		        $("#selcounty").selectpicker('refresh');
		        getcounty($('#selcity').selectpicker('val'),"");        
		    });  
		    getprovince($("#provinceid").val());
		    getcity($("#provinceid").val(),$("#cityid").val());
		    getcounty($("#cityid").val(),$("#countyid").val()); 
		    
			$("#btnSave").click(function() {
				savedata();
			});	
			
			initfileinput();
			
			/*地图初始化*/
			var posx=$("#longitude").val();
			var posy=$("#latitude").val();
			if(posx!=""&&posx!=""&&posy!=""&&posy!=""){
				map.centerAndZoom(new BMap.Point(posx, posy), 18); 
				var marker = new BMap.Marker(new BMap.Point(posx, posy));  // 创建标注
				map.addOverlay(marker);               // 将标注添加到地图中
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
			}else{
				map.centerAndZoom("北京市", 11); 
			}		
			map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
			map.addEventListener("click", setshoppos);
		});
		function setshoppos(e){
			$("#positionxy").val(e.point.lng + "," + e.point.lat);
			$("#longitude").val(e.point.lng);
			$("#latitude").val(e.point.lat);
			//toastr.warning("经伟度已重新选择，请提交！");
		}
		function savedata(){
			var v_shopname,v_provinceid,v_cityid,v_countyid,v_address,v_leadername,v_leadertel,v_leaderemail;
			var v_cusid,v_appid,v_appkey,v_shopimg,v_licenseimg,v_prolicenseimg,v_cardtop,v_carddown,v_areadesc;
			var v_longitude,v_latitude,v_accountbank,v_accountnums,v_accountname;
			
			v_shopname=$("#shopname").val().trim();
			if(v_shopname==null||v_shopname==""){
				toastr.warning("请输入加油站名称！");
				return ;
			}
			v_provinceid=$("#selprovince").val().trim();
			if(v_provinceid==null||v_provinceid==""||v_provinceid=="0"){
				toastr.warning("请选择省！");
				return ;
			} 
			v_cityid=$("#selcity").val().trim();
			if(v_cityid==null||v_cityid==""||v_cityid=="0"){
				toastr.warning("请选择市！");
				return ;
			} 
			v_countyid=$("#selcounty").val().trim();
			if(v_countyid==null||v_countyid==""||v_countyid=="0"){
				toastr.warning("请选择县(区)！");
				return ;
			} 
			v_address=$("#address").val().trim();
			if(v_address==null||v_address==""){
				toastr.warning("请输入详细地址！");
				return ;
			} 
			v_leadername=$("#leadername").val().trim();
			if(v_leadername==null||v_leadername==""){
				toastr.warning("请输入负责人姓名！");
				return ;
			} 
			v_leadertel=$("#leadertel").val().trim();
			if(v_leadertel==null||v_leadertel==""){
				toastr.warning("请输入负责人电话！");
				return ;
			}
			v_leaderemail=$("#leaderemail").val().trim();
			if(v_leaderemail==null||v_leaderemail==""){
				toastr.warning("请输入负责人邮箱！");
				return ;
			} 
			v_shoplevel=$("#shoplevel").val().trim();			
			if(v_shoplevel==null||v_shoplevel==""||v_shoplevel=="0"){
				toastr.warning("请选择商户星级！");
				return ;
			} 
			v_cusid=$("#cusid").val().trim();
			if(v_cusid==null||v_cusid.trim()==""){
				toastr.warning("请输入商户号！");
				return ;
			} 
			v_appid=$("#appid").val().trim();
			if(v_appid==null||v_appid==""){
				toastr.warning("请输入商户AppId！");
				return ;
			} 
			v_appkey=$("#appkey").val().trim();
			if(v_appkey==null||v_appkey==""){
				toastr.warning("请输入商户AppKey！");
				return ;
			} 
			v_accountbank=$("#accountbank").val().trim();
			if(v_accountbank==null||v_accountbank==""){
				toastr.warning("请输入开户行！");
				return ;
			} 
			v_accountnums=$("#accountnums").val().trim();
			if(v_accountnums==null||v_accountnums==""){
				toastr.warning("请输入开户账号！");
				return ;
			} 
			v_accountname=$("#accountname").val().trim();
			
			v_shopimg=$("#shopimg").val().trim();
			if(v_shopimg==null||v_shopimg==""){
				toastr.warning("请上传商家油站图！");
				return ;
			}
			v_licenseimg=$("#licenseimg").val().trim();
			if(v_licenseimg==null||v_licenseimg==""){
				toastr.warning("请上传营业执照！");
				return ;
			}
			v_prolicenseimg=$("#prolicenseimg").val().trim();
			if(v_prolicenseimg==null||v_prolicenseimg==""){
				toastr.warning("请上传成品油许可证！");
				return ;
			}
			v_cardtop=$("#cardtop").val().trim();
			if(v_cardtop==null||v_cardtop==""){
				toastr.warning("请上传身份证正面照！");
				return ;
			}
			v_carddown=$("#carddown").val().trim();
			if(v_carddown==null||v_carddown==""){
				toastr.warning("请上传身份证反面照！");
				return ;
			}
			v_longitude=$("#longitude").val().trim(); 
			if(v_longitude==null||v_longitude==""){
				toastr.warning("请输入正确的经度！");
				return ;
			}
			v_latitude=$("#latitude").val().trim(); 
			if(v_latitude==null||v_latitude==""){
				toastr.warning("请输入正确的纬度！");
				return ;
			}
			v_areadesc=$("#selprovince").find("option:selected").text();
			v_areadesc+=$("#selcity").find("option:selected").text();
			v_areadesc+=$("#selcounty").find("option:selected").text();
			v_areadesc+=v_address;
			var rowData = {"shopname":v_shopname,"provinceid":v_provinceid,"cityid":v_cityid,"countyid":v_countyid,
				"address":v_address,"leadername":v_leadername,"leadertel":v_leadertel,"leaderemail":v_leaderemail,
				"cusid":v_cusid,"appid":v_appid,"appkey":v_appkey,"shopimg":v_shopimg,
				"licenseimg":v_licenseimg,"prolicenseimg":v_prolicenseimg,"cardtop":v_cardtop,"carddown":v_carddown,
				"memo":$("#memo").val().trim(),"shopid":$("#shopid").val(),"areadesc":v_areadesc,
				"shoplevel":v_shoplevel,"shopservice":$("#shopservice").val().trim(),
				"longitude":v_longitude,"latitude":v_latitude,
				"accountbank":v_accountbank,"accountnums":v_accountnums,"accountname":v_accountname};
			
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/shop/commitShopInfo",
				dataType : "json",
				data : JSON.stringify(rowData),
				contentType : 'application/json',
				success : function(result) {
					result = eval(result);
					if(result.code=="001"){
						toastr.success(result.info);
					}else{
						toastr.error(result.info);
					}
				},
				error:function(errorMsg) {
					toastr.error("数据提交失败！");
				}
			});
		}  
		function initfileinput(){
			//商家油站图
			$("#fileshopimg").fileinput({
				language: 'zh', //设置语言 
				uploadUrl:'/yh/upload/uploadBlog',
				enctype: 'multipart/form-data',
				allowedFileExtensions : ['jpg', 'png','bmp','jpeg'],//接收的文件后缀
				uploadAsync: false,
				showUpload: false, //是否显示上传按钮
				showPreview: true, //展前预览
				showCaption: false,//是否显示标题     
				showRemove :false,
				theme: 'gly',
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary",
				fileType: "any",
				overwriteInitial: true,
				maxFileSize : 2048,//上传文件最大的尺寸	           
				maxFileCount: 1,
				minFileCount: 1,
				initialPreviewAsData: true,
				initialPreview:[$("#shopimg").val()],
				layoutTemplates :{actionDelete:''}
			}).on("filebatchselected", function(event, files) {
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) { 
				$("#shopimg").val(data.response.data.filePath) ;
			});	
			//营业执照
			$("#filelicenseimg").fileinput({
				language: 'zh', //设置语言 
				uploadUrl:'/yh/upload/uploadBlog',
				enctype: 'multipart/form-data',
				allowedFileExtensions : ['jpg', 'png','bmp','jpeg'],//接收的文件后缀
				uploadAsync: false,
				showUpload: false, //是否显示上传按钮
				showPreview: true, //展前预览
				showCaption: false,//是否显示标题     
				showRemove :false,
				theme: 'gly',
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary",
				fileType: "any",
				overwriteInitial: true,
				maxFileSize : 2048,//上传文件最大的尺寸	           
				maxFileCount: 1,
				minFileCount: 1,
				initialPreviewAsData: true,
				initialPreview:[$("#licenseimg").val()],
				layoutTemplates :{actionDelete:''}
			}).on("filebatchselected", function(event, files) {
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) { 
				$("#licenseimg").val(data.response.data.filePath) ;
			});	
			//成品油许可证
			$("#fileprolicenseimg").fileinput({  
				language: 'zh', //设置语言 
				uploadUrl:'/yh/upload/uploadBlog',
				enctype: 'multipart/form-data',
				allowedFileExtensions : ['jpg', 'png','bmp','jpeg'],//接收的文件后缀
				uploadAsync: false,
				showUpload: false, //是否显示上传按钮
				showPreview: true, //展前预览
				showCaption: false,//是否显示标题     
				showRemove :false,
				theme: 'gly',
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary",
				fileType: "any",
				overwriteInitial: true,
				maxFileSize : 2048,//上传文件最大的尺寸	           
				maxFileCount: 1,
				minFileCount: 1,
				initialPreviewAsData: true,
				initialPreview:[$("#prolicenseimg").val()],
				layoutTemplates :{actionDelete:''}
			}).on("filebatchselected", function(event, files) {        	  
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) {
				$("#prolicenseimg").val(data.response.data.filePath) ;
			});	
			//身份证正面
			$("#filecardtop").fileinput({  
				language: 'zh', //设置语言 
				uploadUrl:'/yh/upload/uploadBlog',
				enctype: 'multipart/form-data',
				allowedFileExtensions : ['jpg', 'png','bmp','jpeg'],//接收的文件后缀
				uploadAsync: false,
				showUpload: false, //是否显示上传按钮
				showPreview: true, //展前预览
				showCaption: false,//是否显示标题     
				showRemove :false,
				theme: 'gly',
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary",
				fileType: "any",
				overwriteInitial: true,
				maxFileSize : 2048,//上传文件最大的尺寸	           
				maxFileCount: 1,
				minFileCount: 1,
				initialPreviewAsData: true,
				initialPreview:[$("#cardtop").val()],
				layoutTemplates :{actionDelete:''}
			}).on("filebatchselected", function(event, files) {        	  
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) {
				$("#cardtop").val(data.response.data.filePath) ;
			});	
			//身份证反页
			$("#filecarddown").fileinput({  
				language: 'zh', //设置语言 
				uploadUrl:'/yh/upload/uploadBlog',
				enctype: 'multipart/form-data',
				allowedFileExtensions : ['jpg', 'png','bmp','jpeg'],//接收的文件后缀
				uploadAsync: false,
				showUpload: false, //是否显示上传按钮
				showPreview: true, //展前预览
				showCaption: false,//是否显示标题     
				showRemove :false,
				theme: 'gly',
				showUpload: false,
				showCaption: false,
				browseClass: "btn btn-primary",
				fileType: "any",
				overwriteInitial: true,
				maxFileSize : 2048,//上传文件最大的尺寸	           
				maxFileCount: 1,
				minFileCount: 1,
				initialPreviewAsData: true,
				initialPreview:[$("#carddown").val()],
				layoutTemplates :{actionDelete:''}
			}).on("filebatchselected", function(event, files) {        	  
				$(this).fileinput("upload");
			}).on("filebatchuploadsuccess", function(event, data) {
				$("#carddown").val(data.response.data.filePath) ;
			});	
		}
		//获取或设置省
		function getprovince(value){
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/system/getArea/0",
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					$.each(eval(result), function (k, p) {
						var option = "<option value='" + p.areaid + "'>" + p.areaname + "</option>";
						$("#selprovince").append(option);
					});
					$("#selprovince").selectpicker('refresh');
					if(value!=""){
						$("#selprovince").selectpicker('val',value);
					}else
						$("#selprovince").selectpicker('val', '0');			 
				},
				error : function(errorMsg) {
					console.log(errorMsg);
				}
			});
			
		}
		//获取或设置市
		function getcity(parentid,value){
			if(parentid==""||parentid==null) return;
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/system/getArea/"+parentid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					$.each(eval(result), function (k, p) {
						var option = "<option value='" + p.areaid + "'>" + p.areaname + "</option>";
						$("#selcity").append(option);
					});
					$("#selcity").selectpicker('refresh');
					if(value!=""){
						$("#selcity").selectpicker('val',value);
					}else
						$("#selcity").selectpicker('val', '0');			 
				},
				error : function(errorMsg) {
					console.log(errorMsg);
				}
			});
		}
		//获取或设置县(区)
		function getcounty(parentid,value){
			if(parentid==""||parentid==null) return;
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/system/getArea/"+parentid,
				dataType : "json",
				contentType : 'application/json',
				success : function(result) {
					$.each(eval(result), function (k, p) {
						var option = "<option value='" + p.areaid + "'>" + p.areaname + "</option>";
						$("#selcounty").append(option);
					});
					$("#selcounty").selectpicker('refresh');
					if(value!=""){
						$("#selcounty").selectpicker('val',value);
					}else
						$("#selcounty").selectpicker('val', '0');			 
				},
				error : function(errorMsg) {
					console.log(errorMsg);
				}
			});
		}
		function searchmap(){
			map.centerAndZoom($("#posxy").val(), 16); 
			map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		}
	</script>
</html>