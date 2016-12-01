$(document).ready(function(){
	
	//表单校验
	$("#dataform").validate({
		rules: {
	    	//分支
	        "po.bankBranch" : {
	            required : true,
	            isLegalText:true
	        },
	        //卡号
			"po.cardNo" : {
				required:true
		    }
	    },
	    messages : {
	    	//用户姓名
	        "po.bankBranch" : {
	            required : "开户银行及支行不能为空！",
	            isLegalText: "请输入正确的开户银行及支行，勿包含特殊字符！"
	        },
	        
	        //卡号
			"po.cardNo" : {
				required:"请输入银行卡号!"
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
        url: path + "/business/bankcard/update",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.location = path+"/business/bankcard/bankcard";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}