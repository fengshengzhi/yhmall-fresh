<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
	<head>
		    <title>修改密码</title>
			<%@include file="/WEB-INF/views/common/base.jsp"%>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
			<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
		    <script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
		    <script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
		    <script type="text/javascript" src="${path}/commons/js/admin/editpassword.js"></script>
	</head>
	<body>
	    <form id="passwordForm">
		<div id = "password" class = "login">
			<img src = "${path}/commons/images/logo_register.png" class= "loginImg"/>
			<div class = "content clearfix">
				<div class = "left">
					<h2>修改密码</h2>
					<p><em  class="Short_message">修改密码：</em><input type = "password" name="admin.password" id="pass"></p>
	                                <p><em class="Short_message">确认密码：</em><input type = "password" id="confirmpassword" name ="confirmpassword"></p>
					<p><a href="javascript:save()" class="loginBtn registerBtn">提交</a></p>
					<p><a class = "Return">返回登录</a></p>
				</div>
				<div class = "right">
					<p class = "first">还没有账号？</p>
					<p><a class = "reg">注册新会员</a></p>
					<p><img src = "${path}/commons/images/erwei.png" class = "erwei"></p>
					<p class = "h"><em class = "erwei">扫描二维码进入约惠商城</em></p>
				</div>
			</div>
		</div>
		<div class = "login_foot"></div>
		</form>
	</body>
</html>