$(document).ready(function(){
	// 校验提现金额必须小于可用金额
	jQuery.validator.addMethod("checkPice", function(value, element) {
		var amt = $("#amt").val();
		var withdrawPrice = $("#withdrawPrice").val();
		var isPass=true;
		if(withdrawPrice<=amt){
			isPass=false;
		}
		return this.optional(element)||isPass;
	}, "提现金额大于可用金额，请重新输入!");
	
	//表单校验
	$("#dataform").validate({
		rules: {
	    	//提现金额
	        "po.withdrawPrice" : {
	        	required: true,
	        	max:9999999.99,
				checkIntAndNum: true,
				checkPice: true
	        }
	    },
	    messages : {
	    	//提现金额
	        "po.withdrawPrice" : {
	        	required: "请输入提现金额！",
	        	max: "请输入小于9999999.99的正数",
				checkIntAndNum: "只能输入整数或者保留两位的小数！"
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
        url: path + "/business/withdraw/save",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.parent.location = path+"/business/withdraw/withdraw";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}