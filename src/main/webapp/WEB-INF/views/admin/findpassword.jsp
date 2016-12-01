<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
    <head>
        <title>找回密码</title>
		<%@include file="/WEB-INF/views/common/base.jsp"%>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/findpasswordvalidate.js"></script>
		<script type="text/javascript" src="${path}/commons/js/admin/findpassword.js"></script>
    </head>
    <body>
        <div id = "retrievePassword" class = "login">
            <img src = "${path}/commons/images/logo_register.png" class= "loginImg"/>
            <div class = "content clearfix">
                <form id="retrievePasswordForm">
                <div class = "left">
                    <h2>找回密码</h2>
                    <p class="dingwei"><em>用户名：</em><input type = "text" name="admin.name"><span class = "tipInfo_id"></span></p>
                    <p class="dingwei"><em>手机号：</em><input type = "text" name="admin.phone" id="phone"><span class = "tipInfo_id"></span></p>
                    <p class="dingwei"><em>验证码：</em><input type = "text" class = "test" id="tucode" name ="tuCode"><img src = "${path}/admin/getvalatecode" class = "testImg"><span class = "tipInfo_id"></span></p>
                    <p class="dingwei"><em class="Short_message fot">短信验证码：</em><input type = "text" name = "smsCode" class = "test"><a href="javascript:;" class = "testImg sendMesg" onclick="getcode(this)">发送验证码</a><span class = "tipInfo_id"></span></p>
                    <p class="dingwei"><a href="javascript:tosave()" class="loginBtn registerBtn">提交</a></p>
                    <p><a class = "Return" href="javascript:tologin()">返回登陆</a></p>
                </div>
                <input  type="hidden" value="${key }" name="key" id="key"/>
		        <input  type="hidden" value="${uuid }" name="uuid" id="uuid"/>
		        </form>
                <div class = "right">
                    <p class = "first"></p>
                    <p></p>
                    <p><img src = "${path}/commons/images/erwei.png" class = "erwei"></p>
                    <p class = "h"><em class = "erwei">扫描二维码进入约惠商城</em></p>
                </div>
            </div>
        </div>
        <div class = "login_foot"></div>
    </body>
</html>