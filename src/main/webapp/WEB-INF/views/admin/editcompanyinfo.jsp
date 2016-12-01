<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
    <head>
        <title>修改企业审核资料</title>
        <%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    </head>
    <body>
        <div id = "uploadData" class = "login">
            <!--个人上传审核资料-->
            <div class = "content clearfix upload_info">
                <div class = "left">
					<div class = "perID perID1">
					 <form id="companyinfo">
						<h2>修改企业审核资料<span>审核状态:
						<c:choose>
						   <c:when test="${po.status==1}">
						            通过
						   </c:when>
						   <c:when test="${po.status==2}">
						        不通过(${remark})
						   </c:when>
						   <c:otherwise>
						        待审核
						   </c:otherwise>
						</c:choose>
                         </span></h2>
						<p><em class="Short_message"><s>*</s>营业执照：</em><input type = "text" class = "testtow" name="po.licenseNum" value="${po.licenseNum}"><a class = "upload_per dis1">上传营业执照</a><input type = "file" class = "upload_CD  dis1" onchange="previewImage('licenseImage','营业执照')" id="licenseImage" name="licenseImage"/></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p><em class="Short_message"><s>*</s>组织机构：</em><input type = "text" class = "testtow" name="po.orgNum" value="${po.orgNum}"><a class = "upload_per dis1">上传组织机构证</a><input type = "file" class = "upload_CD  dis1" onchange="previewImage('orgImage','组织机构证')" id="orgImage" name="orgImage"/></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p><em class="Short_message"><s>*</s>税务登记证：</em><input type = "text" class = "testtow" name="po.taxNum" value="${po.taxNum}"><a class = "upload_per dis1">上传税务登记证</a><input type = "file" class = "upload_CD  dis1" onchange="previewImage('taxImage','税务登记证')" id="taxImage" name="taxImage"/></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p>
							<em class="Short_message"><s>*</s>法人身份证：</em><input type = "text" class = "testtow" name="po.legalCardNum" value="${po.legalCardNum}">
							<a class = "upload_per dis1 uploadBtn">正面</a><input type = "file" class = "upload_CD  dis1 hideUp" onchange="previewImage('cardImgShow','身份证正面')" id="cardImgShow" name="cardImgShow"/>
							<a class = "upload_per disn uploadBtn">反面</a><input type = "file" class = "upload_CD  dis1 hideUp2" onchange="previewImage('cardImgOtherShow','身份证反面')" id="cardImgOtherShow" name="cardImgOtherShow"/>
						</p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>						
						<p class="notes"><font class = "tips_id">注:请上传法人身份证正反面</font></p>
						<p><em class="Short_message"><s>*</s>法人名称：</em><input type = "text" class = "testtow" name="po.legalName" value="${po.legalName}"></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p><em class="Short_message"><s>*</s>企业名称：</em><input type = "text" class = "testtow" name="po.name" value="${po.name}"></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<input type="hidden" name="po.cardImgShow" id="cardImgShowa" value="${po.cardImgShow}"/>
					    <input type="hidden" name="po.cardImgOtherShow" id="cardImgOtherShowa" value="${po.cardImgShow}"/>
                        <input type="hidden" name="po.taxImage" id="taxImagea" value="${po.taxImage}"/>
					    <input type="hidden" name="po.orgImage" id="orgImagea" value="${po.orgImage}"/>
					    <input type="hidden" name="po.licenseImage" id="licenseImagea" value="${po.licenseImage}"/>
					    <input type="hidden" name="po.id" value="${po.id}"/>
					</form>
						<p><a class = "loginBtn logle upload_perBtn upload_btn" href="javascript:savecompany()">修改资料</a></p>
					</div>
                </div>
                <div class = "right">
                    <p id="tu">
                        <span><img id="licenseImage1" src = "${po.licenseImage}" class = "per_info"><b>营业执照</b></span>
						<span><img id="orgImage1" src = "${po.orgImage}" class = "per_info"><b>组织机构</b></span>
						<span><img id="taxImage1" src = "${po.taxImage}" class = "per_info"><b>税务登记证</b></span>
						<span><img id="cardImgShow1" src = "${po.cardImgShow}" class = "per_info"><b>身份证(正)</b></span>
						<span><img id="cardImgOtherShow1" src = "${po.cardImgOtherShow}" class = "per_info"><b>身份证(反)</b></span>
					</p>
                </div>
            </div>
        </div>
        <div class = "login_foot"></div>
        <script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/editcompanyinfo.js"></script>
    </body>
</html>