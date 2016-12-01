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
	<table width = "100%" id="itemlist">
<tr class="first">
	<td class="list1">序号</td>
	<!-- 	<td class = "list2">商品ID</td> -->
	<td class="list3">商品名</td>
	<td class="list4">商品编号</td>
	<td class="list5">品牌</td>
	<td class="list6 food">商品分类</td>
	<td class="list7">上架专区</td>
	<td class="list8 look">审核结果</td>
	<td class="list9">是否上架</td>
	<td class="list10">创建时间</td>
	<td class="list11">操作</td>
</tr>
<c:forEach items="${page.list}" var="item" varStatus="status">
	<tr>
		<td class="list1 bind_list">${status.index + 1}</td>
		<!-- <td class = "list2">134342</td> -->
		<td class="list3">${item.name }</td>
		<td class="list4">${item.code }</td>
		<td class="list5">${item.brandName }</td>
		<td class="list6 food">${item.categoryidsecondName }</td>
		<td class="list7">${item.areaName }</td>
		<c:if test="${item.status == 1}">
			<td class="list8 look">审核通过</td>
		</c:if>
		<c:if test="${item.status == 0}">
			<td class="list8 look">待审核</td>
		</c:if>
		<c:if test="${item.status == 2}">
			<td class="list8 look">未通过，理由：${item.isupdescribe}</td>
		</c:if>
		<c:if test="${item.isup == 0}">
			<td class="list9">待上架</td>
		</c:if>
		<c:if test="${item.isup == 1}">
			<td class="list9">已全部上架</td>
		</c:if>
		<c:if test="${item.isup == 2}">
			<td class="list9">PC端已上架</td>
		</c:if>
		<c:if test="${item.isup == 3}">
			<td class="list9">微信端已上架</td>
		</c:if>
		<td class="list10">${item.createdate }</td>
		<td class="list11">
			<em class="edit" onclick="modifyItem('${item.id}', ${item.isup });">编辑商品</em>
			<em class="down" onclick="modifyIsup('${item.id}', ${item.isup });">下架</em>
		</td>
	</tr>
</c:forEach>
</table>
<%@include file="/WEB-INF/views/common/paging.jsp"%>
<script type="text/javascript">
var pageNo ="${page.pageNo}";
function modifyItem(id, isup) {
	if (isup == 1 || isup == 3) {
		layer.msg("请先下架该商品才能编辑！！！", {
			skin: 'layui-layer-rim',
			icon: 5
		}, function(){});
		return ;
	}
	window.location.href = path + "/item/toSaveItem?itemid=" + id;
}
function modifyIsup(id, isup) {
	if (isup !=1  && isup != 3) {
		layer.msg("该商品未上架，无法下架！！！", {
			skin: 'layui-layer-rim',
			time: 3000,
			icon: 5
		}, function(){});
		return ;
	} else {
		layer.confirm('您确定要下架该商品吗?', {
			 skin: 'layui-layer-rim',
			 area: ['400px', '200px'],
			 title: "商品下架"
			}, function(){
				$.ajax({
					async : false,
					type : "post",
					url : "${path}/item/updateItemIsup",
					data : {
						"id" : id,
						"isup" :0
					},
					dataType : "json",
					success : function(data) {
						if (data.success) {
							$("body").tip({ynclose : true,status : "right",content : "下架成功！ "});
							window.location.href = path + "/item/tolist";
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
					}
				});
			}, function(){
			});
	}
}
</script>