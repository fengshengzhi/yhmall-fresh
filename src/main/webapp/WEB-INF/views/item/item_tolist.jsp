<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<!-- <link rel="shortcut icon" href="" mce_href="" type="image/x-icon" /> -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>商品管理--商品列表</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<script type="text/javascript" src="${path}/commons/js/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/layer/layer.js"></script>
<link rel="stylesheet" href="${path}/commons/css/box.css">
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
		<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment" id = "saleID">
					<p class = "tit">
						<em>商品名：</em><input type = "text" class = "num" id="name" value="${item.name }">
						<em>商品编码：</em><input type = "text" class = "num" id="code" value="${item.code }">
						<em>时间：</em><input type = "text" class = "time" onFocus="WdatePicker({lang:'zh-cn', dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="startdate" value="${startdate }"><font>&nbsp到&nbsp</font><input value="${enddate }" type = "text" onFocus="WdatePicker({lang:'zh-cn', dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="enddate" class = "time">
						<em>商品分类：</em>
						<select class="itemCategorysSecond" value="${item.categoryidsecond }">
							<option value="0">选择</option>
							<c:forEach items="${listSecondCategory}" var="itemCategory" varStatus="status">
								<option value="${itemCategory.id}">${itemCategory.name }</option>
							</c:forEach>
						</select>
						<em>上架状态：</em>
						<select id="isup">
							<option value="-1">请选择</option>
							<option value="0">待上架</option>
							<option value="1">已全部上架</option>
							<option value="2">PC端已上架</option>
							<option value="3">微信端已上架</option>
							<option value="4">app端已上架</option>
						</select>
						<em>审核状态：</em>
						<select id="status">
						<option value="-1">请选择</option>
						<option value="1">审核通过</option>
						<option value="2">审核未通过</option>
						</select>
						<a class = "redBtn" onclick="clickPageSubmit();">查询</a><a class = "redBtn" onclick="resetQuery();">重置</a>
					</p>
					<div class = "afterSale">
						<p><a class = "redBtn" onclick="modifyItem('');">新增商品</a></p>
					      <div  id="dataList" style="width: 100%!important;">
							<%@include file="/WEB-INF/views/item/item_list.jsp"%>
                        </div>						
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- 	<form action="${path }/item/tolist" method="post" class="itemlistForm" style="display: none;">
		<input type="hidden" name="name" class="itemFormName"/>
		<input type="hidden" name="code" class="itemFormCode"/>
		<input type="hidden" name="startdate" class="itemFormStartDate"/>
		<input type="hidden" name="enddate" class="itemFormEndDate"/>
		<input type="hidden" name="categoryidsecond" class="itemFormCidSecond"/>
		<input type="hidden" name="pageSize" class="itemFormNamePageSize"/>
		<input type="hidden" name="pageNo" class="itemFormNamePageNo">
	</form> --%>
	
	
	
</body>
</html>
<script type="text/javascript">
/* $(function(){
	$(".itemCategorysSecond").val("${item.categoryidsecond }");
}); */
/**
 * 分页点击事件
 * 
 * @param pageno
 */
/* function clickPageSubmit(pageno) {
	$("#itemlist").empty();
	var categoryidsecond = '';
	if ($(".itemCategorysSecond option:selected").val() == '0' || $(".itemCategorysSecond option:selected").val() == '') {
		categoryidsecond = '';
	} else {
		categoryidsecond = $(".itemCategorysSecond option:selected").val();
	}
	pageNo = pageno;
	$(".itemFormName").val($.trim($("#name").val()));
	$(".itemFormCode").val($.trim($("#code").val()));
	$(".itemFormStartDate").val($.trim($("#startdate").val()));
	$(".itemFormEndDate").val($.trim($("#enddate").val()));
	$(".itemFormCidSecond").val(categoryidsecond);
	$(".itemFormNamePageSize").val(5);
	$(".itemFormNamePageNo").val(pageno);
	$(".itemlistForm").submit();
} */

function clickPageSubmit(pageno) {
	$("#itemlist").empty();
	var categoryidsecond = '';
	if ($(".itemCategorysSecond option:selected").val() == '0' || $(".itemCategorysSecond option:selected").val() == '') {
		categoryidsecond = '';
	} else {
		categoryidsecond = $(".itemCategorysSecond option:selected").val();
	}
	
	pageNo = pageno;
	$.ajax({
		async : false,
		type : "post",
		url :  path+"/item/list",
		data : {
			"pageNo" : pageNo,
			"name" : $.trim($("#name").val()),
			"code" : $.trim($("#code").val()),
			"startdate" : $.trim($("#startdate").val()),
			"enddate" : $.trim($("#enddate").val()),
			"categoryidsecond" : categoryidsecond,
			"isup" : $("#isup option:selected").val(),
			"status" : $("#status option:selected").val(),
 			},
		dataType : "html",
		success : function(result) {
			$("#dataList").html(result);
		}
	});
}





function resetQuery() {
	$("#name").val("");
	$("#code").val("");
	$("#startdate").val("");
	$("#enddate").val("");
	$(".itemCategorysSecond").val("0");
	$("#isup").val("-1");
	$("#status").val("-1");
}
</script>