<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.yhmall.system.po.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String sessionIdValue = null;
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie : cookies) {
		if ("yhmall_session_id".equals(cookie.getName())) {
			sessionIdValue = cookie.getValue();
			break;
		}
	}
	AdminPo po = null;
	if(sessionIdValue != null){
		po = JSON.parseObject(sessionIdValue, AdminPo.class);
	}
	if(po == null) {
	   po = (AdminPo)request.getAttribute("adminPo");
	}
	%>
<div class = "head clearfix">
	<dl class = "first">
		<dd>欢迎使用约惠管理系统</dd>
	</dl>
	<dl class = "leftTxt leftWid">
					<dd>你好，liling</dd>
				</dl>
				<dl class = "leftWid" style="cursor: pointer;"  onclick="location.href='${path}/admin/editpassword'"> 
				<!-- <dl class = "leftWid changeClo"> -->
					<dd><img src = "${path}/commons/images/tou1.png">&nbsp<em>修改密码</em></dd>
				</dl>
				<dl class = "leftWid" style="cursor: pointer;" onclick="location.href='${path}/admin/loginout'">
					<dd><img src = "${path}/commons/images/tou2.png">&nbsp<em>退出系统</em></dd>
				</dl>
				<%--<dl class = "leftWid">
					<dd><em>店铺设置</em></dd>
				</dl>
	 <dl class = "first">
		<dd class="nowHeaderUrl">当前位置：供应商后台商品管理 >创建用户</dd>
	</dl>
	<dl class = "name">
		<dd>你好，<%=po.getName() %></dd>
	</dl>
	<dl class = "provider_dl">
		<dd onclick="location.href='${path}/admin/editpassword'"><em>修改密码</em><img src = "${path}/commons/images/tou1.png"></dd>
		<dd onclick="location.href='${path}/admin/loginout'"><em>退出系统</em><img src = "${path}/commons/images/tou2.png"></dd>
	</dl> --%>
</div>
<!-- 面包屑 -->
			<div class = "miaobaoxie">
				<p><em>您所在的位置：</em><img src = "${path}/commons/images/shou.png">&nbsp;<em class="nowHeaderUrl">首页</em></p>
			</div>