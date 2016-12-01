<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>页面没有找到</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<link rel="stylesheet" type="text/css" href="${path}/commons/css/failure.css" />
</head>
<body>
	<div class = "failure_div">
		<center>
		<div class = "failDiv">
			<ul>
				<li class = "failure_li1"><img src = "${path }/commons/images/Access failure.png"/></li>
				<li class = "failure_li2">访问失败</li>
				<li class = "line_li"></li>
				<li class = "failure_li3"><img src = "${path }/commons/images/failFace.png"/></li>
				<li class = "failure_li4">对不起，您的页面暂时无法找到！</li>
				<li class = "failure_li5">求可以点击返回<label>上一页</label></li>
				<li class = "failure_li6"><button class = "backIndexBtn" onclick="location.href='${path}/'">返回首页</button><button onclick="location.href='${path}/mall/index'" class = "backShopBtn">返回商城</button></li>
			</ul>
		</div>
		</center>
	</div>

</body>
</html>