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
	//个人表单校验
	$("#personalform").validate({
		rules: {
	    	//用户名
	        "po.name" : {
	            required : true,
	            isLegalText:true
	        },
	        //身份证
			"po.legalCardNum" : {
				required:true,
				isCard:true
		    }
	    },
	    messages : {
	    	//用户姓名
	        "po.name" : {
	            required : "姓名不能为空！",
	            isLegalText: "请输入正确的用户名，勿包含特殊字符！"
	        },
	        
	        //身份证
			"po.legalCardNum" : {
				required:"请输入证件号码!",
				isCard:"请输入正确的证件号码!"
	        }
	    },
	    errorPlacement: function(error, element) {
	    	if($(element).parent("p").next().find("label.error").length<=0){
				$(element).parent("p").next().find(".shenhe_tip").append(error);
			}
		},
		success:function(element){
			$("[name='"+element[0].htmlFor+"']").parent().next().find("label.error").remove();
		}
	});
});

//个人信息
function savepersonal(){
	//判断校验是否通过
	if(!$("#personalform").valid()){
		return;
    }
	$("#personalform").ajaxSubmit({
        type: "POST",
        url: path + "/admin/supplier/updatepersonal",
        dataType: "json",
        success: function(res) {
        	if(res.success){
          		window.location = path+"/admin/editpersonalinfo";
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
