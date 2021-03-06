<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确认支付</title>
<script src="${pageContext.request.contextPath}/resources/js/home/jquery.min.js?v=2.1.4"></script>
</head>
<body>
</body>
<script>
	 var appId='${map.apiAppid}',
		timeStamp='${map.apiTimestamp}',
		nonceStr='${map.apiNoncestr}',
		pg='${map.apiPackage}',
		signType='${map.apiSigntype}',
		paySign='${map.apiPaysign}';
		orderId='${map.orderId}'

	function onBridgeReady() {
		WeixinJSBridge.invoke(
			'getBrandWCPayRequest', {
				"appId": appId, //公众号名称，由商户传入     
				"timeStamp": timeStamp, //时间戳，自1970年以来的秒数     
				"nonceStr": nonceStr, //随机串     
				"package": pg,
				"signType": signType, //微信签名方式:     
				"paySign": paySign //微信签名 
			},

			function(res) {
				if(res.err_msg == "get_brand_wcpay_request:ok") {
					// 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
					location.href="http://www.ydlbuy.com/mobileGuzzler/orderachieve.html?orderId="+orderId;
				} else {
					alert("支付失败");
					location.href="http://www.ydlbuy.com/mobileGuzzler/orderList.html";
				}
			}
		);
	}

	$(document).ready(function () {
		
			
			if(typeof WeixinJSBridge == "undefined") {				
				if(document.addEventListener) {
					document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
				} else if(document.attachEvent) {
					document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
					document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
				}
			} else {				
				onBridgeReady();
			}

	});
</script>