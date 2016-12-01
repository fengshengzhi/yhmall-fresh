$(document).ready(function(){
	//表单校验
	$("#registerForm").validate({
	   onkeyup:false,
	   rules: {
	    	//用户名
	        "admin.name" : {
	            required : true,
	            isLegalText:true,
	            rangelength: [4, 20],
	            isExistName :true
	        },
	        //电话号码
			"admin.phone" : {
		        required : true,
		        isMobile:true,
		        checkPhoneEixsts:true
		    },
	        //验证码
			"smsCode" : {
		        required : true
		    },
	        //邮箱
			"admin.email" : {
		        required : true,
		        isEmail:true
		    },
	        //密码
			"admin.password" : {
		        required : true,
		        rangelength: [1, 30]
		    },
	        //确认密码
			"confirmpassword" : {
		        required : true,
		        rangelength: [1, 30],
		        equalTo: '#password'
		    }
	    },
	    messages : {
	    	//用户姓名
	        "admin.name" : {
	            required : "请输入用户名！",
	            rangelength: "请输入正确的用户名，长度为{0}-{1}个字符！",
	            isLegalText: "请输入正确的用户名，勿包含特殊字符！"
	        },
	        //电话号码
			"admin.phone" : {
	            required : "请输入手机号！",
	            isMobile:"请输入正确的手机号"
	        },
	        //验证码
			"smsCode" : {
	            required : "请输入验证码！"
	        },
	        //邮箱
			"admin.email" : {
	            required : "请输入邮箱！",
	            isEmail:"请输入正确的邮箱"
	        },
	        //密码
			"admin.password" : {
	            required : "请输入密码！",
	            rangelength: "请输入正确的密码，长度为{0}-{1}个字符！"
	        },
	        //确认密码
			"confirmpassword" : {
	            required : "请输入确认密码！",
	            rangelength: "请输入正确的确认密码，长度为{0}-{1}个字符！",
	            equalTo: "两次输入密码不相同"
	        }
	    },
	    errorPlacement: function(error, element) {
	    	if(element.parent().find("label.error").length<=0) {
				$(element).parents(".dingwei").find(".tipInfo_id").append(error);
			}
		},
		success:function(element){
			$("[name='"+element[0].htmlFor+"']").parent().find("label.error").remove();
		}
	});
});

function tologin(){
	window.self.location = path+'/admin/tologin.do';
}
//注册提交信息
function register(){
	//判断校验是否通过
	if(!$("#registerForm").valid()){
		return;
    }
	$("#registerForm").ajaxSubmit({
        type: "POST",
        url: path + "/admin/register",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.location = path+"/admin/toeditinfo";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}
//获取验证码
function getcode(t){
	if(!$(t).hasClass("geting")){
		var phone=$("#phone").attr("value");
		//校验手机号
		var mobile = /^1[2-9]{1}[0-9]{9}$/;
		if(!mobile.test(phone)){
			alert("请输入正确的手机号");
			return;
		}else{
			var key = $("#key").val();
			//异步加载数据
			$.ajax({
		        type: "POST",
		        url: path+"/admin/register/isuse",
		        dataType: "json",
		        data: {"phone":phone,"key":key},
		        success: function(res) {
		        	if(res.success) {
		        		return;
		        	} else{
		        		alert(res.msg);
		        	}
		        }
		    });
		}
		n=119;
		$(t).addClass("geting hasclick").html("120s后重新获取");
			settime=setInterval(function(){
				if(n==0){
					$(t).removeClass("geting").html("重新获取");
					clearInterval(settime);
					}
				else{
					$(t).html(n+"s后重新获取");
					n--;
					}
				},1000);
	}
}