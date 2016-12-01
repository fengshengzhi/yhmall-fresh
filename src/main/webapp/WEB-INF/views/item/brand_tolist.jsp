<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<!-- <link rel="shortcut icon" href="" mce_href="" type="image/x-icon" /> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>品牌列表</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<%@include file="/WEB-INF/views/common/cutimage.jsp"%>
<script type="text/javascript" src="${path}/commons/js/common/layer/layer.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/uploadImg.js"></script>
<script type="text/javascript" src="${path}/commons/js/item/brand_add.js"></script>
<style type="text/css">
  .layui-layer-title{
	float:none !important;
}
.layui-layer-content{
	width:700px !important;
}
#newadd{
	height: 368px;
	border: none;
}
.layui-layer-rim{
	height: 480px !important;
} 
</style>
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
		<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment">
					<p class = "tit"><a class = "applyBtn" id="">申请品牌</a></p>
					<table width = "100%" id="brandtable">
			
						<%@include file="/WEB-INF/views/item/brand_list.jsp"%>
				
					</table>
				</div>
			</div>
	</div>
		</div>
				<div class = "coment" style="display:none; border: none" id="editBrandBox">
					<form id="brandaddForm">
					<div id = "newadd">
						<p class = "first"><em>品牌名称</em><input type= "text" class = "goodname" value="${itemBrand.name }" name="name" id="brandName"/><input type="hidden" id="brandId" value="${itemBrand.id }" name="id"/></p>
						<p><em>品牌LOGO</em><a class = "redBtn newloadBtn">上传图片</a><input type="file" class="newupload" id="logo" name="logos"/></p>
						<p>
							<span class = "imgw">
							<img src = "${itemBrand.logo }" class = "infoimg" />
							</span>
							<input type="hidden" name="logo" value="${itemBrand.logo }" />
						</p>
						<p>
							<em>品牌网址</em><input name="url" type = "text"  id="url" class = "goodname lastIuput" value="${itemBrand.url}" style="margin-left: 13px !important;"/>
						</p>
						<p class = "last" style="margin-bottom: 0px !important;">
							<a class = "redBtn saveSend" href="javascript:;" onclick="savedata();" style="margin-left:82px;margin-top:-3px;">保存并送审</a>
						</p>
					</div>
					</form>
				</div>
</body>
<%-- <form action="${path }/brand/tolist" method="post" class="brandlistForm" style="display: none;">
		<input type="hidden" name="pageSize" class="itemFormNamePageSize"/>
		<input type="hidden" name="pageNo" class="itemFormNamePageNo">
</form> --%>
</html>
<script type="text/javascript">
var index;
$(document).ready(function(){
	$(".applyBtn").live("click", function() {
		index = layer.open({
			  type: 1,
			  title: "编辑品牌",
			  skin: 'layui-layer-rim',
			  area: ['840px', '500px'],
			  content: $('#editBrandBox'),
			  cancel : function() {
					$("#brandId").val("");
					$("#brandName").val("");
					$("#url").val("");
					$("input[name='logo']").val("");
					$(".infoimg").attr("src", "");
			  }
		});
		if ($(this).attr("id") != '') {
			$.ajax({
				async : false,
				type : "post",
				url : "${path}/brand/toSaveItemBrand",
				data : {
					"id" : $(this).attr("id"),
				},
				dataType : "json",
				success : function(data) {
					if (data.success) {
						console.log(data);
						$("#brandId").val(data.data.id);
						$("#brandName").val(data.data.name);
						$("#url").val(data.data.url);
						$("input[name='logo']").val(data.data.logo);
						$(".infoimg").attr("src", data.data.logo);
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
				}
			});
		}
	});
});


/**
 * 分页点击事件
 * 
 * @param pageno
 */
 function clickPageSubmit(pageno) {
		pageNo = pageno;
		$.ajax({
			async : false,
			type : "post",
			url :  path+"/brand/list",
			data : {
				"pageNo" : pageNo
	 			},
			dataType : "html",
			success : function(result) {
				$("#brandtable").html(result);
			}
		});
	}
 
 
/* function clickPageSubmit(pageno) {
	pageNo = pageno;
	$(".itemFormNamePageSize").val(10);
	$(".itemFormNamePageNo").val(pageno);
	$(".brandlistForm").submit();
} */

</script>
