<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<!-- <link rel="shortcut icon" href="" mce_href="" type="image/x-icon" /> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>品牌申请</title>
<%@include file="/WEB-INF/views/common/base.jsp"%>
<%@include file="/WEB-INF/views/common/cutimage.jsp"%>
<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/uploadImg.js"></script>
<script type="text/javascript" src="${path}/commons/js/item/brand_add.js"></script>
</head>
<body class = "gray_body">
	<div class = "provider clearfix" id = "provider">
		<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment">
					<p class = "tit"><em>品牌申请</em></p>
					<form id="brandaddForm">
					<div id = "newadd">
						<p class = "first"><em>品牌名称</em><input type= "text" class = "goodname" value="${itemBrand.name }" name="name"/><input type="hidden" id="brandId" value="${itemBrand.id }" name="id"/></p>
						<p><em>品牌LOGO</em><a class = "redBtn newloadBtn">上传图片</a><input type="file" class="newupload" id="logo" name="logos"/></p>
						<p>
							<span class = "imgw">
							<img src = "${itemBrand.logo }" class = "infoimg" />
							<!-- <a class = "changeBtn">更换</a>
							<img src = "images/afda.png" class = "loadDel"/> -->
							</span>
							<input type="hidden" name="logo" value="${itemBrand.logo }"/>
						</p>
						<p>
							<em>品牌网址</em><input name="url" type = "text" class = "goodname lastIuput" value="${itemBrand.url}" style="margin-left: 13px !important;"/>
						</p>
						<p class = "last">
							<a class = "redBtn saveSend" href="javascript:;" onclick="savedata();">保存并送审</a>
							<a class = "redBtn saveSend" style="margin: 0 30px;">返回</a>
						</p>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>