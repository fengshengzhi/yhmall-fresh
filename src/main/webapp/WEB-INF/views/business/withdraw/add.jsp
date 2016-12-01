<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
	<head>
	    <title></title>
	    <%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	    <script type="text/javascript" src="${path}/commons/js/admin/registervalidate.js"></script>
	    <script type="text/javascript" src="${path}/commons/js/business/addwithdraw.js"></script>
	</head>
	<body style="width:99%">
		<div class = "applyGet">
		   <form id="dataform">
		        <input type="hidden" value="${amt}" id="amt"/>
				<p class = "first"><em>账户总额：</em><font class = "txt">${totailamt}</font></p>
				<p><em>用户已确认收货金额：</em><font class = "txt">${amt}</font></p>
				<p><em>提现金额:</em><input type = "text" class = "txt money" name="po.withdrawPrice" id="withdrawPrice"></p>
				<p>
					<em>选择账户：<s>*</s></em>
					<select class = "txt sel" name="po.cardId" id="cardId">
						<c:forEach items="${list}" var="map">
						   <option value="${map.id}">${map.name}</option>
						</c:forEach>
					</select>
				</p>
				<p><a href="javascript:savedata()" class = "redBtn applyGetBtn">申请提现</a></p>
				<p class = "red">注：申请提现后到账时间为3-5个工作日，如果您在到账日期内未收到账款，请及时联系财务处！</p>
				<p class = "red dis">财务处电话：021-12345678</p>
			 </form>
		</div>
	</body>
</html>