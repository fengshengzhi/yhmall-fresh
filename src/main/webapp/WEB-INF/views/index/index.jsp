<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<!-- <link rel="shortcut icon" href="" mce_href="" type="image/x-icon" /> -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>首页</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<link rel="stylesheet" href="${path}/commons/css/box.css">
<script type="text/javascript" src="${path}/commons/js/common/layer/layer.js"></script>
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
	<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment homePageID" id = "saleID">
					<div class = "homePage clearfix">
						<div class = " first clearfix" onclick="gotoOrder(3);">
							<ul>
								<li class = "imgbg color1"><img src = "${path}/commons/images/deliver_goods.png"></li>
								<li class = "txtbg"><p class = "on txt_col1">待发货订单</p><p class = "num">${backOrder }单</p></li>
							</ul>
						</div>
						<div class = "clearfix" onclick="gotoOrder(5);">
							<ul>
								<li class = "imgbg color2"><img src = "${path}//commons/images/return_goods.png"></li>
								<li class = "txtbg"><p class = "on txt_col2">已完成订单</p><p>${finishOrder }单</p></li>
							</ul>
						</div> 
						<div class = "clearfix">
							<ul>
								<li class = "imgbg color3"><img src = "${path}//commons/images/withdraw_money.png"></li>
								<li class = "txtbg"><p class = "on txt_col3">可提现金额</p><p>10单</p></li>
							</ul>
						</div>
						<div class = "clearfix">
							<ul>
								<li class = "imgbg color4"><img src = "${path}//commons/images/Total_amount.png"></li>
								<li class = "txtbg"><p class = "on txt_col4">账户总金额</p><p>10单</p></li>
							</ul>
						</div>
					</div>
					<div class = "homeID">
						<p>商品库存监控</p>
						<table width = "100%" id="skulist">
							<%@include file="/WEB-INF/views/index/skulist.jsp"%>
					    </table>
					    <%@include file="/WEB-INF/views/common/paging.jsp"%>
					</div>
				</div>
			</div>
		</div>
		<form action="${path }/business/index" method="post" class="skuListForm" style="display: none;">
			<input type="hidden" name="pageSize" class="skuFormNamePageSize"/>
			<input type="hidden" name="pageNo" class="skuFormNamePageNo">
		</form>
	</div>
	<!-- 弹出层 -->
		<div  id="gray_body" style="display:none" class="gray_body">
			<div  id="alert_id" class="alert_id">
				<p><em>原库存：</em><input type = "text" id="oldStock"></p>
				<p><em>新存库：</em><input type = "text" id="newStock"></p>
				<!-- <p><em>姓名：</em><select><option>请选择</option></select></p> -->
				<p><a class = "redBtn sureBtn">确定</a><a class = "redBtn cancelBox" id="cancelBox">取消</a></p>
				<input type = "hidden" value="" id="parameter">
			</div>
		</div>
</body>
</html>
<script type="text/javascript">
var index = null;
$(document).ready(function(){
	$("#modification").live("click", function() {
		$("#parameter").val($(this).attr("skuId"));
		$("#oldStock").val($(this).parent().prev().html()); 
		index = layer.open({
			  type: 1,
			  title: "修改库存",
			  skin: 'layui-layer-rim',
			  area: ['500px', '300px'],
			  content: $('#gray_body')
		});
		
	});
	$("#cancelBox").live("click", function() {
		layer.close(index);
	});
	$(".sureBtn").live("click", function() {
		var skuId = $("#parameter").val();
		var stock = $("#newStock").val();
		var stockCheck = new Number(stock); 
		if(isNaN(stockCheck)) {
			$("body").tip({ynclose :true,status : "error",content :"库存必须输入数字",width:"280"});
			return ;
		} else if (stockCheck.valueOf() <= 0) {
			$("body").tip({ynclose :true,status : "error",content :"库存必须大于0",width:"280"});
			return ;
		}
		$.ajax({
			async : false,
			type : "post",
			url : "${path}/item/updateItemSkuStock",
			data : {
				"id" : skuId,
				"stock" :stock
			},
			dataType : "json",
			success : function(data) {
				if (data.success) {
					$("#box_parent").hide();
					$("body").tip({ynclose : true,status : "right",content : "修改库存成功! "});
					window.location.href = path + "/business/index";
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
			}
		});
		
	});
})
function gotoOrder (status) {
	window.location.href = "${path}/order/tolist?status=" + status;
}
/**
 * 分页点击事件
 * 
 * @param pageno
 */
function clickPageSubmit(pageno) {
	$("#skulist").empty();
	$(".skuFormNamePageSize").val(5);
	$(".skuFormNamePageNo").val(pageno);
	$(".skuListForm").submit();
}
</script>