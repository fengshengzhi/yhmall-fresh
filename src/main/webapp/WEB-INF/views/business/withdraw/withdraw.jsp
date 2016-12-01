<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
	<head>
		<title>提现记录</title>
		<%@ include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/business/withdraw.js"></script>
	</head>
	<body class = "gray_body">
		<div class = "provider clearfix" id = "provider">
			<%@include file="/WEB-INF/views/common/left.jsp"%>
			<div class = "provider_right">
				<%@include file="/WEB-INF/views/common/header.jsp"%>
				<div class = "provider_coment" id = "provider_apply">
					<div class = "coment">
						<p class = "tit"><a class="applyBtn" href="javascript:newWithdraw()">提现申请</a></p>
						<div id="dataList" style="width: 100%!important;">
						  <%@ include file="/WEB-INF/views/business/withdraw/withdrawlist.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>