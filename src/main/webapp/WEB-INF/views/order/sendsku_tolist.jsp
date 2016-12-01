<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<!-- <link rel="shortcut icon" href="" mce_href="" type="image/x-icon" /> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>发货</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
	<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment" id = "sendgoods_id">
					<p class = "tit">
						<em class = "first">订单编号：</em><font>${orderPo.code }</font>
						<em>成交时间：</em><font>2016-19-1 13:43</font>
						<em>买家：</em><font>${orderPo.receiveName }</font>
					</p>
					<table width = "100%">
						<tr class = "first">
							<td class = "list1 bind_list">商品图片</td>
							<td class = "list2">商品名</td>
							<td class = "list3">商品编号</td>
							<td class = "list4">数量</td>
							<td class = "list5">规格</td>
						</tr>
						<c:forEach items="${orderItemList}" var="orderItemSku" varStatus="status">
						<tr>
							<td class = "list1 bind_list"><img src = "${orderItemSku.imageUrl }"></td>
							<td class = "list2"><em>${orderItemSku.skuName }</em></td>
							<td class = "list3">${orderItemSku.skuCode }</td>
							<td class = "list4">${orderItemSku.skuNum }</td>
							<td class = "list5"><!-- <em>颜色：</em><font>黑色</font><em class = "bigID">尺码：</em><font>均码</font> -->${orderItemSku.properyValues }</td>
						</tr>
						</c:forEach>
						<tr class = "last"><td colspan = "5">收货信息：<font>${orderPo.receiveName } /${orderPo.phone } /${userAddress.province}${userAddress.city }${userAddress.area }${userAddress.address }</font></br></br>
						买家备注：<font class = "spe">${orderPo.serviceComment }！</font>
						</td></tr>
					</table>
					<c:if test="${!empty orderDispatchList}">
					<c:forEach items="${orderDispatchList}" var="orderDispatch" varStatus="status">
					<form id="${orderDispatch.id}">
					<p class = "add_info">
						<em>选择物流：</em>
						<select> <!-- style="margin:0 -4px" -->
							<option value="0">请选择</option>
							<option value="中通物流">中通物流</option>
							<option value="顺丰物流">顺丰物流</option>
							<option value="圆通物流">圆通物流</option>
							<option value="申通物流">申通物流</option>
							<option value="天天物流">天天物流</option>
							<option value="韵达物流">韵达物流</option>
							<option value="其他">其他</option>
						</select>
						<em class = "num">运单号：</em><input type = "text" class="logisticsNumber" value="${orderDispatch.logisticsNumber }"/>
						<c:choose> 
							<c:when test="${status.index + 1 == 1}">
								<img src = "${path}/commons/images/addbtn.png" onclick="addOrderDispatch();" /><!-- style="margin-left: 15px !important" --><font>增加物流</font>
							</c:when>
							<c:otherwise>  
								<img src = "${path}/commons/images/minus.png" onclick="delOrderDispatch('${orderDispatch.id}');" ><!-- style="margin-left: 15px !important" --><font>删除物流</font>
							</c:otherwise>  
						</c:choose>
						<input type="hidden" value="${orderDispatch.id}" class="id"/>
					</p>
					</form>
					</c:forEach>
					</c:if>
					<c:if test="${fn:length(orderDispatchList) == 0 }">
					<form>
					<p class = "add_info">
						<em>选择物流：</em>
						<select ><!-- style="margin:0 -4px;" -->
							<option value="0">请选择</option>
							<option value="中通物流">中通物流</option>
							<option value="顺丰物流">顺丰物流</option>
							<option value="圆通物流">圆通物流</option>
							<option value="申通物流">申通物流</option>
							<option value="天天物流">天天物流</option>
							<option value="韵达物流">韵达物流</option>
							<option value="其他">其他</option>
						</select>
						<em class = "num">运单号：</em><input type = "text" class="logisticsNumber"/>
						<img src = "${path}/commons/images/addbtn.png" onclick="addOrderDispatch();" ><!-- style="margin-left: 15px !important" --><font>增加物流</font>
					</p>
					</form>
					</c:if>
					<p id="beforForm" class = "add_info last"><a class = "redBtn send_saveBtn">保存</a></p>
				</div>
			</div>
		</div>
	</div>
	<input id="orderId" type="hidden" value="${orderPo.id }"/>
</body>
</html>
<script type="text/javascript">
var count = 0;
var orderdispatchArray = new Array();
var deldispatchArray = new Array();
function del(count) {
	$("#" + count + "form").remove();
}
function delOrderDispatch(id) {
	deldispatchArray.push(id);
	$("#" + id).remove();
}
$(function(){
	<c:if test="${!empty orderDispatchList}">
		<c:forEach items="${orderDispatchList}" var="orderDispatch" varStatus="status">
			$("#${orderDispatch.id}").find("select").val('${orderDispatch.logisticsName}');
		</c:forEach>
	</c:if>
});
function addOrderDispatch() {
	count ++;
	$("#beforForm").before("<form id='"+ count + "form'><p class = 'add_info'><em>选择物流：  </em>"
						+ "<select style='margin-right: 4px;'><option value='0'>请选择</option>"
						+ "<option value='中通物流'>中通物流</option>"
						+ "<option value='顺丰物流'>顺丰物流</option>"
						+ "<option value='圆通物流'>圆通物流</option>"
						+ "<option value='申通物流'>申通物流</option>"
						+ "<option value='天天物流'>天天物流</option>"
						+ "<option value='韵达物流'>韵达物流</option>"
						+ "<option value='其他'>其他</option>"
						+ "</select>"
						+ "<em class = 'num'>运单号：</em><input type = 'text' class='logisticsNumber'></input>"
						+ "<img src = '" + path+ "/commons/images/minus.png' onclick='del("+ count +")' style='margin-left: 24px;'>"
						+ "<font>删除物流</font><input class='id' type='hidden' value=''/></p></form>");
}
$(".send_saveBtn").on("click", function(){
	orderdispatchArray = [];
	$("#sendgoods_id").children("form").each(function(index, element){
		var orderDispatch = new Object();
		orderDispatch.logisticsName = $(element).find("select option:selected").val();
		orderDispatch.id = $(element).find(".id").val();
		orderDispatch.logisticsNumber = $(element).find(".logisticsNumber").val();
		orderdispatchArray.push(orderDispatch);
	});
	console.log(orderdispatchArray);
	$.ajax({
		async : false,
		type : "post",
		url : "${path}/order/saveOrderDispatch",
		data : {
			"orderId" : $("#orderId").val(),
			"orderdispatchArray" : JSON.stringify(orderdispatchArray), 
			"deldispatchArray" : JSON.stringify(deldispatchArray)
		},
		dataType : "json",
		success : function(data) {
			console.log(data);
			if (data.success) {
				alert("发货成功");
				window.location.href = path + "/order/tolist";
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
		}
	});
});
</script>