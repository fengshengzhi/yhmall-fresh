<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<!-- <link rel="shortcut icon" href="" mce_href="" type="image/x-icon" /> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta receiveName="viewport" content="width=device-width, initial-scale=1">
<title>订单管理--发货列表</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<script type="text/javascript" src="${path}/commons/js/common/datePicker/WdatePicker.js"></script>
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
		<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment" id = "saleID">
					<p class = "tit">
						<em>订单号：</em><input type = "text" class = "num" id="code" value="${order.code }">
						<em>运单号：</em><input type = "text" class = "num" id="logisticsNumber" value="${logisticsNumber }">
						<em>收货人手机：</em><input type = "text" class = "num" id="phone" value="${order.phone }">
						<em>收货人姓名：</em><input type = "text" class = "num" id="receiveName" value="${order.receiveName }"></br></br>
						<em>时间：</em><input type = "text" class = "time" onFocus="WdatePicker({lang:'zh-cn', dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="startdate" value="${startdate }">
						<font>&nbsp到&nbsp</font><input type = "text" class = "time" onFocus="WdatePicker({lang:'zh-cn', dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="enddate" value="${enddate }">
						<em>订单状态：</em>
						<select id="status">
							<option value="0">选择</option>
							<option value="3">待发货</option>
							<option value="1">待付款</option>
							<option value="4">待收货</option>
							<option value="2">待确认</option>
							<option value="5">交易完成</option>
							<option value="6">交易关闭</option>
						</select>
						<a class = "redBtn" onclick="clickPageSubmit('');">查询</a><a class = "redBtn" onclick="resetQuery();">重置</a>
					</p>
					<div class = "afterSale">
						<p><em>发货列表</em><a class = "grayBtn" href="javascript:exportOrder()">导出订单</a></p>
						<table width = "100%" id="orderlist">
							<%@include file="/WEB-INF/views/order/order_list.jsp"%>
						</table>
						<%@include file="/WEB-INF/views/common/paging.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="${path }/order/tolist" method="post" class="orderlistForm" style="display: none;">
		<input type="hidden" name="receiveName" class="orderFormreceiveName"/>
		<input type="hidden" name="code" class="orderFormCode"/>
		<input type="hidden" name="logisticsNumber" class="orderFormLogisticsNumber"/>
		<input type="hidden" name="phone" class="orderFormPhone"/>
		<input type="hidden" name="startdate" class="orderFormStartDate"/>
		<input type="hidden" name="enddate" class="orderFormEndDate"/>
		<input type="hidden" name="status" class="orderFormStatus"/>
		<input type="hidden" name="pageSize" class="orderFormreceiveNamePageSize"/>
		<input type="hidden" name="pageNo" class="orderFormreceiveNamePageNo">
	</form>
	<form action="${path }/order/exportOrder" method="post" class="exportOrderForm" style="display: none;">
		<input type="hidden" name="receiveName" class="exportOrderFormreceiveName"/>
		<input type="hidden" name="code" class="exportOrderFormCode"/>
		<input type="hidden" name="phone" class="exportOrderFormPhone"/>
		<input type="hidden" name="startdate" class="exportOrderFormStartDate"/>
		<input type="hidden" name="enddate" class="exportOrderFormEndDate"/>
		<input type="hidden" name="status" class="exportOrderFormStatus"/>
		<input type="hidden" name="selectArray" class="exportOrderFormSelectArray"/>
	</form>
</body>

</html>
<script type="text/javascript">
var selectArray = new Array();
$(function(){
	$("#status").val('${order.status}');
});
/**
 * 分页点击事件
 * 
 * @param pageno
 */
function clickPageSubmit(pageno) {
	$("#orderlist").empty();
	if (pageno == '') {
		pageno = 1;
	} else {
		pageNo = pageno;
	}
	$(".orderFormreceiveName").val($.trim($("#receiveName").val())); 
	$(".orderFormCode").val($.trim($("#code").val()));
	$(".orderFormLogisticsNumber").val($.trim($("#logisticsNumber").val()));
	$(".orderFormPhone").val($.trim($("#phone").val()));
	$(".orderFormStartDate").val($.trim($("#startdate").val()));
	$(".orderFormEndDate").val($.trim($("#enddate").val()));
	$(".orderFormStatus").val($.trim($("#status").val()));
	$(".orderFormreceiveNamePageSize").val(5);
	$(".orderFormreceiveNamePageNo").val(pageno);
	$(".orderlistForm").submit();
}
function resetQuery() {
	$("#receiveName").val("");
	$("#code").val("");
	$("#phone").val("");
	$("#startdate").val("");
	$("#enddate").val("");
	$("#status").val("");
}

function exportOrder() {
	selectArray = [];
	$("[name = checkbox]:checkbox").each(function(index, element){
		if ($(element).is(':checked') && $(element).val() != '') {
			selectArray.push($(element).val());
		}
	});
	if (selectArray.length != 0) {
		console.log(selectArray);
		var orderIds = '';
		for (var i = 0; i < selectArray.length; i++) {
			if (orderIds == '') {
				orderIds = orderIds + "'" + selectArray[i] + "'"; 
			} else {
				orderIds = orderIds + ",'" + selectArray[i] + "'";
			}
		}
		$(".exportOrderFormSelectArray").val(orderIds);
		$(".exportOrderForm").submit();
	} else {
		$(".exportOrderFormreceiveName").val($.trim($("#receiveName").val()));
		$(".exportOrderFormCode").val($.trim($("#code").val()));
		$(".exportOrderFormPhone").val($.trim($("#phone").val()));
		$(".exportOrderFormStartDate").val($.trim($("#startdate").val()));
		$(".exportOrderFormEndDate").val($.trim($("#enddate").val()));
		$(".exportOrderFormStatus").val($.trim($("#status").val()));
		$(".exportOrderForm").submit();
	}
	
	
}
</script>