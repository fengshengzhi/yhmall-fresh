<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
	<head>
		<title>新增帐号</title>
		<%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/business/addcard.js"></script>
	</head>
	<body class = "gray_body">
		<div class = "provider clearfix" id = "provider">
			<%@include file="/WEB-INF/views/common/left.jsp"%>
			<div class = "provider_right">
				<%@include file="/WEB-INF/views/common/header.jsp"%>
				<div class = "provider_coment" id = "provider_apply">
					<div class = "coment">
						<p class = "tit"><em>新增帐号</em></p>
						<form id ="dataform">
						   <input type="hidden" value="${supplierName}" name="po.cardName"/>
							<div class = "withdraw">
								<p class = "first">开户名：${supplierName}</p>
								<p class = "list"><em>开户银行及支行：</em><input type = "text" name="po.bankBranch"></p>
								<p class = "list"><em>开户银行账号：</em><input type = "text" name="po.cardNo"></p>
								<p class = "list">
									<input type = "radio" class = "get" name="po.status" value="1" checked="checked">
									<strong>启用</strong>
									<input type = "radio" class = "noget" name="po.status" value="0">
									<strong>不启用</strong>
								</p>
								<p class = "dis last"><a href="javascript:savedata()" class = "redBtn widthdraw_save">保存</a></p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>