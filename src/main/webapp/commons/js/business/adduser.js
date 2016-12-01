$(document).ready(function(){
	
	//表单校验
	$("#dataform").validate({
		rules: {
			//用户名
	        "po.name" : {
	            required : true,
	            isLegalText:true,
	            rangelength: [4, 20],
	            isExistName :true
	        },
	        //密码
			"po.password" : {
		        required : true,
		        rangelength: [1, 30]
		    }
	    },
	    messages : {
	    	//用户姓名
	        "admin.name" : {
	            required : "请输入用户名！",
	            rangelength: "请输入正确的用户名，长度为{0}-{1}个字符！",
	            isLegalText: "请输入正确的用户名，勿包含特殊字符！"
	        },
	        
	        //密码
			"admin.password" : {
	            required : "请输入密码！",
	            rangelength: "请输入正确的密码，长度为{0}-{1}个字符！"
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

//保存信息
function savedata(){
	//判断校验是否通过
	if(!$("#dataform").valid()){
		return false;
    }
	$("#dataform").ajaxSubmit({
        type: "POST",
        url: path + "/business/user/save",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.location = path+"/business/user/user";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}