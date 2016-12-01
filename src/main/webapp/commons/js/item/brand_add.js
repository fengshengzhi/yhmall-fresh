$(function() {
	$("#logo").on("change", function() {
		uploadImage($(this).attr("id"), function(url) {
			$(".infoimg").attr("src", url);
			$("[name=logo]").val(url);
		},0);
	});

	jQuery.validator.addMethod("checkLogo", function(value, element) {
		var isPass = true;
		if (value == "") {
			isPass = false;
		}
		return  this.optional(element) || isPass;
	}, "请上传品牌照片!");
	//表单校验
	$("#brandaddForm").validate(
			{
				rules : {
					//用户名
					"name" : {
						required : true,
						isLegalText : true,
					},
					"url" : {
						required : true,
						isLegalText : true,
						url : true
					},
					"logo" : {
						checkLogo : true
					},
				},
				messages : {
					//用户姓名
					"name" : {
						required : "请输入品牌名称！",
						isLegalText : "请输入正确的品牌名称，勿包含特殊字符！"
					},
					"url" : {
						required : "请输入品牌网址！",
						isLegalText : "请输入正确的品牌名称，勿包含特殊字符！",
						url : "您输入的不是合法网址,应该类似http://www.baidu.com"
					},
					"logo" : {
						checkLogo : "请上传品牌照片!"
					}
				},
				errorPlacement : function(error, element) {
					if (element.parent().find("label.error").length <= 0)
						error.appendTo(element.parent());
				},
				success : function(element) {
					$("[name='" + element[0].htmlFor + "']").parent().find(
							"label.error").remove();
				}
			});

});
//保存信息
function savedata() {
	//判断校验是否通过
	if (!$("#brandaddForm").valid()) {
		return;
	}
	$("#brandaddForm").ajaxSubmit({
		type : "POST",
		url : path + "/brand/save",
		dataType : "json",
		success : function(res) {
			if (res.success) {
				window.location.href = path + "/brand/tolist";
			} else {
				alert(res.msg);
			}
		}
	});
}
