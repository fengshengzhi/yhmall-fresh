<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
    String pathlist =  request.getScheme()
    		+ "://"
    		+ request.getServerName()
    		+ (request.getServerPort() != 80 ? ":"
    				+ request.getServerPort() : "") +request.getContextPath();
    String urllist = request.getServletPath();
	request.setAttribute("path",pathlist);
	request.setAttribute("url",urllist);
%>
<tr class="first">
	<td class="list1">序号</td>
	<td class="list2">品牌名称</td>
	<td class="list3">品牌图片</td>
	<td class="list4">品牌网址</td>
	<td class="list5">审核状态</td>
	<td class="list6">创建时间</td>
	<td class="list7">操作</td>
</tr>
<c:forEach items="${page.list}" var="itemBrand" varStatus="status">
	<tr>
		<td class="list1">${status.index+1}</td>
		<td class="list2">${itemBrand.name}</td>
		<td class="list3"><img src="${itemBrand.logo }"  style="width:80px;height:50px"> </td>
		<td class="list4"><span title="${itemBrand.url}" class="spe_sleID">${itemBrand.url}</span></td>
		<c:if test="${itemBrand.isup == 0}">
			<td class="list5">待审核</td>
		</c:if>
		<c:if test="${itemBrand.isup == 1}">
			<td class="list5">审核通过</td>
		</c:if>
		<c:if test="${itemBrand.isup == 2}">
			<td class="list5">审核不通过: ${itemBrand.isupdescribe }</td>
		</c:if>

		<td class="list6"><fmt:formatDate value="${itemBrand.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td class="list7"><a class="editor_red applyBtn"
			 id="${itemBrand.id}">编辑品牌</a></td>
	</tr>
</c:forEach>
	<%@include file="/WEB-INF/views/common/paging.jsp"%>
<script type="text/javascript">
var pageNo ="${page.pageNo}";
</script>