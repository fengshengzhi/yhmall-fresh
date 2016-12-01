$(document).ready(function(){
	//表单校验
	$("#rloginForm").validate({
	rules: {
    	//用户名
        "userName" : {
            required : true,
            isLegalText:true
        },
        //密码
		"passWord" : {
	        required : true
	    }
    },
    messages : {
    	//用户姓名
        "userName" : {
            required : "用户名不能为空！",
            isLegalText: "请输入正确的用户名，勿包含特殊字符！"
        },
        
        //密码
		"passWord" : {
            required : "密码不能为空！"
        },
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
	//登录
	$("#loginBtn").live('click',function(){
		//判断校验是否通过
		if(!$("#rloginForm").valid()){
		   return;
	    }
		 $.ajax({
				async : false,
				type : "post",
				url :  path+"/admin/login",
				data : {userName:$("#userName").val(),
					passWord:$("#passWord").val(),
					mark:$("#mark").val()},
				dataType : "json",
				success : function(result) {
					if(result.success){
						if(result.data==1){
							//老用户登录成功页
							window.location = path+"/business/index";
						} else if(result.data==2){
							//个人供应商资料修改页
							window.location = path+"/admin/editpersonalinfo";
						}else if(result.data==3){
							//企业供应商资料修改页
							window.location = path+"/admin/editcompanyinfo";
						}else if(result.data==4){
							//上传供应商资料
							window.location = path+"/admin/toeditinfo";
						}
		          	 } else {
                       alert(result.msg);
		          	 }
					
				}
			});
	});
});

function toregister(){
	window.self.location = path+'/admin/toregister';
}

function tofindpassword(){
	window.self.location = path+'/admin/findpassword';
}