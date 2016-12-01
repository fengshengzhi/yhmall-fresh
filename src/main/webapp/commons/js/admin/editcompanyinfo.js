$(document).ready(function(){
	$("#provider_left").height($(window).height());
	$(".cont dl dd em").click(function(){
		  $(this).addClass("on").parent().siblings().find("em").removeClass("on");
	});
	$(".cont dl dt").find("img").click(function(){
		alert("am");
		  $(this).closest("dd").attr('display','none');
	});
	
	$(".right").height($(".content").height());
	//企业表单校验
	$("#companyinfo").validate({
		rules: {
	    	//营业执照
	        "po.licenseNum" : {
	            required : true,
	            isLegalText:true
	        },
	        //组织机构代码
			"po.orgNum" : {
				required:true,
				isLegalText:true
		    },
	        //税务登记证
			"po.taxNum" : {
				required:true,
				isLegalText:true
		    },
	        //法人身份证
			"po.legalName" : {
				required:true,
				isLegalText:true
		    },
	        //企业名称
			"po.name" : {
				required:true,
				isLegalText:true
		    },
	        //身份证
			"po.legalCardNum" : {
				required:true,
				isCard:true
		    }
	    },
	    messages : {
	    	//营业执照
	        "po.licenseNum" : {
	            required : "营业执照编码不能为空！",
	            isLegalText: "请输入正确的营业执照编码，勿包含特殊字符！"
	        },   
	        //组织机构代码
			"po.orgNum" : {
				required : "组织机构代码不能为空！",
	            isLegalText: "请输入正确的组织机构代码，勿包含特殊字符！"
	        },
	        //税务登记证
			"po.taxNum" : {
				required : "税务登记证不能为空！",
	            isLegalText: "请输入正确的税务登记证，勿包含特殊字符！"
		    },
	        //法人名称
			"po.legalName" : {
				required : "法人名称不能为空！",
	            isLegalText: "请输入正确的法人名称，勿包含特殊字符！"
		    },
	        //企业名称
			"po.name" : {
				required : "企业名称不能为空！",
	            isLegalText: "请输入正确的企业名称，勿包含特殊字符！"
		    },
	        //身份证
			"po.legalCardNum" : {
				required:"请输入身份证号码!",
				isCard:"请输入正确的身份证号码!"
	        }
	    },
	    errorPlacement: function(error, element) {
	    	if($(element).parent("p").next().find("label.error").length<=0){
				$(element).parent("p").next().find(".shenhe_tip").append(error);
			}
		},
		success:function(element){
			//element.remove();
			$("[name='"+element[0].htmlFor+"']").parent().next().find("label.error").remove();
		}
	});
	
	
});

//企业信息
function savecompany(){
	//判断校验是否通过
	if(!$("#companyinfo").valid()){
	   return;
    }
	$("#companyinfo").ajaxSubmit({
        type: "POST",
        url: path + "/admin/supplier/updatecompany",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.location = path+"/admin/editcompanyinfo";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}

//上传图片
function previewImage(file,filename){
//	//弹出忙等
//	$(".big_pic_bg,.big_pic_wrap").show();
//	
	var reg	= new RegExp(/[\.GIF || \.gif || \.jpg || \.jpeg || \.bmp || \.png|| \.JPG|| \.JPEG|| \.BMP]$/);
	if (! reg.test($("#"+file).val())){
		alert("图片格式不对，请重新上传!");
		return;
	}
    $.ajaxFileUpload({
            url:path+"/imageUp", 
            secureuri:false,
            fileElementId:file,
            dataType: 'json',
            success: function (data, status){         	
            	setTimeout(function(){
            		$("#"+file+"1").attr("src",data.data.url);
            		$("#"+file+"a").val(data.data.url);        		
//	            	//关闭忙等
//	            	$(".big_pic_bg,.big_pic_wrap").hide();
            	},3000);
            }
     });

}
