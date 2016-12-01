<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tr class="first">
	<td class="list1"><input type="checkbox" onclick="selectAll(this);" value=""/>全选</td>
	<td class="list2">序号</td>
	<td class="list3">订单号</td>
	<td class="list4">收件人</td>
	<td class="list5">手机</td>
	<td class="list6">收件人地址</td>
	<td class="list7">创建时间</td>
	<td class="list8">状态</td>
	<td class="list9">操作人</td>
	<td class="list10">操作</td>
</tr>
<c:forEach items="${page.list}" var="order" varStatus="status">
	<tr>
		<td class="list1 bind_list"><input type="checkbox" name="checkbox" value="${order.id }"/></td>
		<td class="list2">${status.index + 1}</td>
		<td class="list3">${order.code }</td>
		<td class="list4">${order.receiveName}</td>
		<td class="list5">${order.phone }</td>
		<td class="list6">${order.address}</td>
		<td class="list7"><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<c:if test="${order.status == 3}">
		<td class="list8">未发货</td>
		</c:if>
		<c:if test="${order.status == 4}">
		<td class="list8">已经发货</td>
		</c:if>
		<c:if test="${order.status == 5}">
		<td class="list8">已成交</td>
		</c:if>
		<td class="list9">张三</td>
		<td class="list10"><a class="redBtn" onclick="tosendsku('${order.id}');">发货</a></td>
	</tr>
</c:forEach>
<script type="text/javascript">
var pageNo ="${page.pageNo}";

function tosendsku(id) {
	window.location.href = path + "/order/tosendsku?id=" + id;
}

function selectAll(thiss) {
	if ($(thiss).attr('checked')) {
		$("[name = checkbox]:checkbox").attr("checked", true);
	} else {
		$("[name = checkbox]:checkbox").attr("checked", false);
	}
}
</script>
