<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
	<head>
	    <title>创建用户</title>
	    <%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/admin/registervalidate.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/business/adduser.js"></script>
	</head>
	<body class = "gray_body">
		<div class = "provider clearfix" id = "provider">
		    <%@include file="/WEB-INF/views/common/left.jsp"%>
			<div class = "provider_right">
                <%@include file="/WEB-INF/views/common/header.jsp"%>
				<div class = "provider_coment" id = "provider_apply">
					<div class = "coment">
						<p class = "tit"><em>创建用户</em></p>
						<form id ="dataform">
						<div class = "creatuser">
							<p class = "first"><em>用户名：</em><input type = "text" name="admin.name"></p>
							<p><em>密码：</em><input type = "text" name="admin.password"></p>
							<p>
								<font>对应权限：</font>
								<input type = "checkbox" class = "mager" name="roleCode[0]" value="itemmanage">
								<strong>商品管理</strong>
								<input type = "checkbox" class = "mag" name="roleCode[1]" value="ordermanage">
								<strong>订单管理</strong>
								<input type = "checkbox" class = "mag" name="roleCode[2]" value="withdrawmanage">
								<strong>提现管理</strong>
							</p>
							<p class = "last"><a href="javascript:savedata()"  class = "redBtn surecreatBtn">确认创建</a></p>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>