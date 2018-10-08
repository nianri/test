<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	 <table  border="1" style=" border-color: #121a1e80; width: 100%">
		<tr style="border-bottom-color:#c7d0d5;">
			<td style="height: 38px;border-bottom-color:#131516e6;background-color: #9f9fa833;border-left-color: #13151666;border-right-color: #13151699;border-top-color: #1315164d;width: 30%;" align="center">商户名称:</td>
			<td style="height: 38px;border-bottom-color:#c7d0d5;background-color: #d5d5de1a;border-left-color: #f4f2ee00;border-right-color: #fdf8f8;border-top-color: #f9f5f500;">${store.name}</td>
			</tr>
			<tr>
			<td style="height: 38px;border-bottom-color:#131516e6;background-color: #9f9fa833;border-left-color: #13151666;border-right-color: #13151699;border-top-color: #1315164d;width: 30%;" align="center">商户联系人:</td>
			<td style="height: 38px;border-bottom-color:#c7d0d5;background-color: #d5d5de1a;border-left-color: #f4f2ee00;border-right-color: #fdf8f8;border-top-color: #f9f5f500;" >${store.addername}</td>
			<tr>
			<td style="height: 38px;border-bottom-color:#131516e6;background-color: #9f9fa833;border-left-color: #13151666;border-right-color: #13151699;border-top-color: #1315164d;width: 30%;" align="center">电话:</td>
			<td style="height: 38px;border-bottom-color:#c7d0d5;background-color: #d5d5de1a;border-left-color: #f4f2ee00;border-right-color: #fdf8f8;border-top-color: #f9f5f500;" >${store.addertel}</td>
			</tr>
			<tr>
			<td style="height: 38px;border-bottom-color:#131516e6;background-color: #9f9fa833;border-left-color: #13151666;border-right-color: #13151699;border-top-color: #1315164d;width: 30%;" align="center">开户行:</td>
			<td style="height: 38px;border-bottom-color:#c7d0d5;background-color: #d5d5de1a;border-left-color: #f4f2ee00;border-right-color: #fdf8f8;border-top-color: #f9f5f500;">${store.blankname}</td>
			<tr>
			<td style="height: 38px;border-bottom-color:#131516e6;background-color: #9f9fa833;border-left-color: #13151666;border-right-color: #13151699;border-top-color: #1315164d;width: 30%;" align="center">开户账号:</td>
			<td style="height: 38px;border-bottom-color:#c7d0d5;background-color: #d5d5de1a;border-left-color: #f4f2ee00;border-right-color: #fdf8f8;border-top-color: #f9f5f500;">${store.blankcardnum}</td>
		</tr>
	</table> 
	
</body>
</html>