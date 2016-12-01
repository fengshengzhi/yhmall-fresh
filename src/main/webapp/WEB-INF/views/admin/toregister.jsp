<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>注册</title>
		<%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/registervalidate.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/register.js"></script>
	</head>
	<body>
	 	<form id="registerForm">
		<div id = "login" class = "login">
			<img src = "${path}/commons/images/logo_register.png" class= "loginImg"/>
			<div class = "content clearfix">
				<div class = "left reg_h">
					<h2>注册</h2>
					<p class="dingwei"><em>用户名：</em><input type = "text" name="admin.name"><span class = "tipInfo_id"></span></p>
					<p class="dingwei"><em>手机：</em><input type = "text" name="admin.phone" id="phone"><span class = "tipInfo_id"></span></p>
					<p class="dingwei"><em>短信验证码：</em><input type = "text" class = "test" name = "smsCode"><a href="javascript:;" class = "testImg sendMesg" onclick="getcode(this)">发送验证码</a><span class = "tipInfo_id"></span></p>
					<p class="dingwei"><em>邮箱：</em><input type = "text" name="admin.email"><span class = "tipInfo_id"></span></p>
					<p class="dingwei"><em>密码：</em><input type = "password" name="admin.password" id="password"><span class = "tipInfo_id"></span></p>
					<p class="dingwei"><em>确认密码：</em><input type = "password" id="confirmpassword" name ="confirmpassword"><span class = "tipInfo_id"></span></p>
					<p><a href="javascript:register()" class="loginBtn registerBtn">立即注册</a></p>
				</div>
				<div class = "right">
					<p class = "first">已注册?</p>
					<p><a class = "reg" href="javascript:tologin()">登录</a></p>
					<p><img src = "${path}/commons/images/erwei.png" class = "erwei"></p>
					<p class = "h"><em class = "erwei">扫描二维码进入约惠商城</em></p>
				</div>
			</div>
		</div>
		<div class = "login_foot"></div>
		<input  type="hidden" value="${key }" name="key" id="key"/>
		<input  type="hidden" value="${uuid }" name="uuid" id="uuid"/>
		</form>
	</body>
</html>