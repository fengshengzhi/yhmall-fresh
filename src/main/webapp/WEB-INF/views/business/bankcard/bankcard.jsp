<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<title>绑定提现账号</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<style type="text/css">
	.layui-layer-title{
		float:none !important;
	}
	.layui-layer-content{
		width:850px !important;
	}
</style>
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
		<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment">
					<p class = "tit"><a class="applyBtn" href="javascript:turntoadd()">新增银行账号</a></p>
					<div id="dataList" style="width: 100%!important;">
					  <%@include file="/WEB-INF/views/business/bankcard/cardlist.jsp"%>
					</div>
					
					<div class = "coment" style="display:none" id="editCardBox">
						<form id ="dataform">
						   	<input type="hidden" id="po_cardName" name="po.cardName"/>
						   	<input type="hidden" id="po_id" name="po.id"/>
							<div class = "withdraw">
								<p class = "first">开户名：</p>
								<p class = "list"><em>开户银行及支行：</em><input type = "text" id="po_bankBrandch" name="po.bankBranch"></p>
								<p class = "list"><em>开户银行账号：</em><input type = "text" id="po_cardNo" name="po.cardNo"></p>
								<p class = "list">
									<input type = "radio" class="get" id="get" name="po.status" value="1" checked="checked">
									<strong>启用</strong>
									<input type = "radio" class="noget" id="noget" name="po.status" value="0">
									<strong>不启用</strong>
								</p>
								<p class = "dis last"><a href="javascript:savedata()" class = "redBtn widthdraw_save">保存</a></p>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="${path}/commons/js/business/bankcard.js"></script>
