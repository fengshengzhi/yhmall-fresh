<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <table width = "100%">
	 <tr class = "first">
		<td class = "list1 bind_list">序号</td>
		<td class = "list2">开户名称</td>
		<td class = "list3">开户行及支行</td>
		<td class = "list4">开户号码</td>
		<td class = "list5">是否启用</td>
		<td class = "list6">创建时间</td>
		<td class = "list7">操作</td>
	 </tr>
    <c:forEach items="${page.list}" var="card" varStatus="status">
	   <tr>
			<td class = "list1 bind_list">${status.index+1}</td>
			<td class = "list2">${card.cardName}</td>
			<td class = "list3">${card.bankBranch}</td>
			<td class = "list4">${card.cardNo} </td>
			<c:if test="${card.status == 1}">
			    <td class="list5">启用</td>
		    </c:if>
			<c:if test="${card.status == 0}">
			    <td class="list5">停用</td>
		    </c:if>
			<td class = "list6">
				<fmt:formatDate value="${card.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
			<td class = "list7">
				<a class = "editor_gray" href="javascript:turntoedit('${card.id}')">编辑</a>
			</td>
		</tr>
    </c:forEach>
</table>
<%@include file="/WEB-INF/views/common/paging.jsp"%>
<script type="text/javascript">
     var pageNo ="${page.pageNo}";
</script>
