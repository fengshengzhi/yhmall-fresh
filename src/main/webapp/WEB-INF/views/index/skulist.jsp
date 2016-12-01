<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<tr class="first">
	<td class="list1">序号</td>
	<td class="list2">商品名</td>
	<td class="list3">商品编号</td>
	<td class="list4">品牌</td>
	<td class="list5">目前库存数量</td>
	<td class="list6">操作</td>
</tr>
<c:forEach items="${page.list}" var="itemsku" varStatus="status">
	<tr>
		<td class="list1">${status.index + 1}</td>
		<td class="list2">${itemsku.name }</td>
		<td class="list3">${itemsku.code }</td>
		<td class="list5">${itemsku.brandName }</td>
		<td class="list4 red">剩余：${itemsku.stock }</td>
		<td class="list6"><a class="redBtn" id="modification" skuId="${itemsku.id }">修改库存</a></td>
	</tr>
</c:forEach>
<script type="text/javascript">
	var pageNo = "${page.pageNo}";
</script>
