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
		<td class = "list2">用户名</td>
		<td class = "list3">操作员名称</td>
		<td class = "list5">创建时间</td>
		<td class = "list6">操作</td>
	</tr>
    <c:forEach items="${page.list}" var="user" varStatus="status">
   <tr>
		<td class = "list1 bind_list">${status.index+1}</td>
		<td class = "list2">${user.name}</td>
		<td class = "list3">${user.createUser}</td>
		<td class = "list5"><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    <td class = "list6 creat_new_user"><a class = "editor_red" href="javascript:turntoedit('${user.id}')">编辑权限</a></td>					
	</tr>
    </c:forEach>
    </table>
    <%@include file="/WEB-INF/views/common/paging.jsp"%>
    <script type="text/javascript">
         var pageNo ="${page.pageNo}";
    </script>
