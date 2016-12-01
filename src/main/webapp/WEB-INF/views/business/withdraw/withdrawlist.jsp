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
     <table width = "100%">
			<tr class = "first">
				<td class = "list1 bind_list">序号</td>
				<td class = "list2 record">提现账户</td>
				<td class = "list3">流水号</td>
				<td class = "list4">提现时间</td>
				<td class = "list5">提现金额</td>
				<td class = "list6">提现状态</td>
			</tr>
			<c:forEach items="${page.list}" var="po" varStatus="status">
            <tr>
		        <td class = "list1 bind_list">${status.index+1}</td>
		        <td class = "list2 record">${po.account}</td>
				<td class = "list3">${po.code}</td>
				<td class = "list4"><fmt:formatDate value="${po.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td class = "list5">￥${po.withdrawPrice}</td>
				<c:if test="${po.status == 0}">
				    <td class = "list6">审核中</td>
			    </c:if>
				<c:if test="${po.status == 1}">
				    <td class = "list6">审核通过</td>
			    </c:if>
			    <c:if test="${po.status == 2}">
				    <td class = "list6">审核不通过</td>
			    </c:if>
		</tr>
    </c:forEach>
	</table>
    <%@include file="/WEB-INF/views/common/paging.jsp"%>
    <script type="text/javascript">
         var pageNo ="${page.pageNo}";
    </script>
