<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
    <head>
        <title>修改个人供应商审核资料</title>
        <%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/editpersonalinfo.js"></script>
    </head>
    <body>
        <div id = "uploadData" class = "login">
            <img src = "${path}/commons/images/logo_register.png" class= "loginImg"/>
            <!--个人修改审核资料-->
            <div class = "content clearfix upload_info">
                <div class = "left">
					<div class = "perID">
					   <form id="personalform">
						<h2>修改审核资料<span>审核状态:
						<c:choose>
						   <c:when test="${status==1}">
						            通过
						   </c:when>
						   <c:when test="${status==2}">
						        不通过(${remark})
						   </c:when>
						   <c:otherwise>
						        待审核
						   </c:otherwise>
						</c:choose>
						</span></h2>
						<p><em class="Short_message"><s>*</s>姓名：</em><input type = "text" name="po.name" value="${po.name}"></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p>
							<em class="Short_message"><s>*</s>身份证：</em><input type = "text" class = "testtow" name="po.legalCardNum" value="${po.legalCardNum}">
							<a class = "upload_per dis1 uploadBtn">正面</a><input type = "file" class = "upload_CD  dis1 hideUp" onchange="previewImage('cardImgShow','身份证正面')" id="cardImgShow" name="cardImgShow"/>
							<a class = "upload_per disn uploadBtn">反面</a><input type = "file" class = "upload_CD  dis1 hideUp2" onchange="previewImage('cardImgOtherShow','身份证反面')" id="cardImgOtherShow" name="cardImgOtherShow"/>
						</p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p class="notes"><font class = "tips_id">注:请上传法人身份证正反面</font></p>
					    <p><a class = "loginBtn logle upload_perBtn upload_btn" href="javascript:savepersonal()">修改资料</a></p>
						<input type="hidden" name="po.cardImgShow" id="cardImgShow" value="${po.cardImgShow}"/>
					    <input type="hidden" name="po.cardImgOtherShow" id="cardImgOtherShow" value="${po.cardImgOtherShow}"/>
					    <input type="hidden" name="po.id" value="${po.id}"/>
					    </form>
					</div>
                </div>
                <div class = "right">
                    <p id="tu">
						<span><img id="cardImgShow1" src = "${po.cardImgShow}" class = "per_info"><b>身份证(正)</b></span>
						<span><img id="cardImgOtherShow1" src = "${po.cardImgOtherShow}" class = "per_info"><b>身份证(反)</b></span>
					</p>
                </div>
            </div>
        </div>
        <div class = "login_foot"></div>
    </body>