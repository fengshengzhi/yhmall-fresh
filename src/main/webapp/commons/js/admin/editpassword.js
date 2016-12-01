$(document).ready(function(){
	//表单校验
	$("#passwordForm").validate({
	   onkeyup:false,
	   rules: {
	        //密码
			"admin.password" : {
		        required : true,
		        rangelength: [1, 30]
		    },
	        //确认密码
			"confirmpassword" : {
		        required : true,
		        rangelength: [1, 30],
		        equalTo: '#pass'
		    }
	    },
	    messages : {
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
			if(element.parent().find("label.error").length<=0)
	   	 		error.appendTo(element.parent());
	   	 	//console.log(error.text());
		},
		success:function(element){
			//element.remove();
			$("[name='"+element[0].htmlFor+"']").parent().find("label.error").remove();
		}
	});
});

function tologin(){
	window.self.location = path+'/admin/tologin.do';
	
}
//提交信息
function save(){
	//判断校验是否通过
	if(!$("#passwordForm").valid()){
	   return;
    }
	$("#passwordForm").ajaxSubmit({
        type: "POST",
        url: path + "/admin/saveeditpassword",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.location = path+"/business/index";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}