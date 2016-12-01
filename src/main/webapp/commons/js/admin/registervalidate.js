/**
 * 校验用户是否已存在
 */
jQuery.validator.addMethod("isExistName",function(value,element){
	var isPass = false;
	$.ajax({
		url:path+"/admin/register/valivatename",
		type:"post",
		async:false,
		data:{"userName":value},
		dataType : "json",
		success:function(result){
			isPass = result.success;
		},
		error:function(result){
			result = result.success;
		}
	});
	return this.optional(element) || isPass;
},"已被使用,请更换其它用户名!");

jQuery.validator.addMethod("checkPhoneEixsts", function(value, element) {
	var isPass = false;
	$.ajax({
		url:path+"/admin/register/valivatephone",
		type:"post",
		async:false,
		data:{"phone":value},
		dataType : "json",
		success:function(result){
			isPass = result.success;
		},
		error:function(result){
			isPass = result.success;
		}
	});
	return this.optional(element) || isPass;
}, "此手机号已被注册,请用其他手机号!");