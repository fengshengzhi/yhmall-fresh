<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
    <head>
        <title>上传审核资料</title>
        <%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    </head>
    <body>
        <div id = "uploadData" class = "login">
            <img src = "${path}/commons/images/logo_register.png" class= "loginImg"/>
            <!--notClick未点击色----alreadyClick已点击色-->
            <div class="Choice"><span class="notClick on">企业</span><span class="notClick mailbox">个人</span></div>
            <!--个人上传审核资料-->
            <div class = "content clearfix upload_info">
                <div class = "left">
					<div class = "perID perID1">
					 <form id="companyinfo">
						<h2>上传审核资料</h2>
						<p><em class="Short_message"><s>*</s>营业执照：</em><input type = "text" class = "testtow" name="po.licenseNum"><a class = "upload_per dis1">上传营业执照</a><input type = "file" class = "upload_CD  dis1" onchange="previewImage('licenseImage','营业执照')" id="licenseImage" name="licenseImage"/></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p><em class="Short_message"><s>*</s>组织机构：</em><input type = "text" class = "testtow" name="po.orgNum"><a class = "upload_per dis1">上传组织机构证</a><input type = "file" class = "upload_CD  dis1" onchange="previewImage('orgImage','组织机构证')" id="orgImage" name="orgImage"/></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p><em class="Short_message"><s>*</s>税务登记证：</em><input type = "text" class = "testtow" name="po.taxNum"><a class = "upload_per dis1">上传税务登记证</a><input type = "file" class = "upload_CD  dis1" onchange="previewImage('taxImage','税务登记证')" id="taxImage" name="taxImage"/></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p>
							<em class="Short_message"><s>*</s>法人身份证：</em><input type = "text" class = "testtow" name="po.legalCardNum">
							<a class = "upload_per dis1 uploadBtn">正面</a><input type = "file" class = "upload_CD  dis1 hideUp" onchange="previewImage('cardImgShow','身份证正面')" id="cardImgShow" name="cardImgShow"/>
							<a class = "upload_per disn uploadBtn">反面</a><input type = "file" class = "upload_CD  dis1 hideUp2" onchange="previewImage('cardImgOtherShow','身份证反面')" id="cardImgOtherShow" name="cardImgOtherShow"/>
						</p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>						
						<p class="notes"><font class = "tips_id">注:请上传法人身份证正反面</font></p>
						<p><em class="Short_message"><s>*</s>法人名称：</em><input type = "text" class = "testtow" name="po.legalName"></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p><em class="Short_message"><s>*</s>企业名称：</em><input type = "text" class = "testtow" name="po.name"></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<input type="hidden" name="po.cardImgShow" id="cardImgShowa"/>
					    <input type="hidden" name="po.cardImgOtherShow" id="cardImgOtherShowa"/>
                        <input type="hidden" name="po.taxImage" id="taxImagea"/>
					    <input type="hidden" name="po.orgImage" id="orgImagea"/>
					    <input type="hidden" name="po.licenseImage" id="licenseImagea"/>
					</form>
						<p><a class = "loginBtn logle upload_perBtn upload_btn" href="javascript:savecompany()">提交审核</a></p>
					</div>
					<div class = "perID perID2" >
					 <form id="personalform">
						<h2>上传审核资料</h2>
						<p><em class="Short_message"><s>*</s>姓名：</em><input type = "text" name="personalpo.name"></p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p>
							<em class="Short_message"><s>*</s>身份证：</em><input type = "text" class = "testtow" name="personalpo.legalCardNum">
							<a class = "upload_per dis1 uploadBtn">正面</a><input type = "file" class = "upload_CD  dis1 hideUp" onchange="previewImage('personalCardImgShow','身份证正面')" id="personalCardImgShow" name="personalCardImgShow"/>
							<a class = "upload_per disn uploadBtn">反面</a><input type = "file" class = "upload_CD  dis1 hideUp2" onchange="previewImage('personalCardImgOtherShow','身份证反面')" id="personalCardImgOtherShow" name="personalCardImgOtherShow"/>
						</p>
						<p class = "tipIn"><span class = "shenhe_tip"><span></p>
						<p class="notes"><font class = "tips_id">注:请上传法人身份证正反面</font></p>
					    <input type="hidden" name="personalpo.cardImgShow" id="personalcardImgShowa"/>
					    <input type="hidden" name="personalpo.cardImgOtherShow" id="personalCardImgOtherShowa"/>
					 </form>
						<p><a class = "loginBtn logle upload_btn" href="javascript:savepersonal()">提交审核</a></p>
					</div>
                </div>
                <div class = "right">
                    <p id="tu">
					</p>
                </div>
            </div>
        </div>
        <div class = "login_foot"></div>
        <script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/editinfo.js"></script>
    </body>
</html>