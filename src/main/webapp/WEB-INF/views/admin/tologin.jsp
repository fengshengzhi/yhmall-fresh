<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
	<head>
		<title>登录</title>
		<%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/admin/login.js"></script>
	</head>
	<body>
		<div id = "login" class = "login">
		  <form id="rloginForm">
			<img src = "${path}/commons/images/logo_register.png" class= "loginImg"/>
			<div class = "content clearfix">
				<div class = "left">
					<h2>登录：</h2>
					<p class="dingwei"><em>用户名：</em><input type = "text" id="userName" name="userName"><span class = "tipInfo_id"></span></p>
					<p class="dingwei"><em>密码：</em><input type = "password" id="passWord" name="passWord"><span class = "tipInfo_id"></span></p>
					<p><a class = "redBtn loginBtn" id="loginBtn">会员登录</a></p>
					<p><input type= "checkbox" class = "sel" name="mark" id="mark" value="mark"/><font>下次自动登录</font><a class = "forget" href="javascript:tofindpassword()">忘记密码</a></p>
				</div>
				<div class = "right">
					<p class = "first">还没有账号？</p>
					<p><a class = "reg" href="javascript:toregister()">注册新会员</a></p>
					<p><img src = "${path}/commons/images/erwei.png" class = "erwei"></p>
					<p class = "h"><em class = "erwei">扫描二维码进入约惠商城</em></p>
				</div>
			</div>
			</form>
		</div>
		<div class = "login_foot"></div>
	</body>
</html>