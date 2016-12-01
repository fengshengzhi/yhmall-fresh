var sourcePath;
var uploadImgCallback;
function uploadImage(file,callback,iscut){
		var reg	= new RegExp(/[\.GIF || \.gif || \.jpg || \.jpeg || \.bmp || \.png|| \.JPG|| \.JPEG|| \.BMP]$/);
		if (! reg.test($("#"+file).val())){
			$("body").tip({ynclose :false,status : "error",content :"图片格式必须为jpg、jpeg、png、bmp、gif! ",width:"280"});
			return false;
		}
		
		$("body").tip({status:"statusing",content:"正在上传,请稍后...",ynclose:false});
	    $.ajaxFileUpload({
	            url:path+"/imageUp", 
	            secureuri:false,
	            fileElementId:file,
	            dataType: 'json',
	            success: function (data, status){
	          		$("body").tip({ynclose : true,status : "right",content : "上传成功! "});
	          		if(typeof callback === "function" ){
	          			uploadImgCallback = callback;
	          			if(iscut ==1){
	          				sourcePath = data.data.url;
	          				$(".sourcePath").attr("src",sourcePath);
	          				
	          				jcrop_api.setImage(sourcePath);
	          			    jcrop_api.setOptions({ bgOpacity: .6 });
	          			    setTimeout(function(){
	          			    	$("#cutImageBox").show();
	          			    },1000)
	          			    
	          			}else{
	          				callback(data.data.url);
	          			}
					}
	            }
	     });
	}

function showCoords(c)
{
  $('#x1').val(c.x);
  $('#y1').val(c.y);
  $('#x2').val(c.x2);
  $('#y2').val(c.y2);
  $('#w').val(c.w);
  $('#h').val(c.h);
};

function clearCoords()
{
  $('#coords input').val('');
};


var jcrop_api;
jQuery(function($){
    
    $('#target').Jcrop({
      onChange:   showCoords,
      onSelect:   showCoords,
      onRelease:  clearCoords
    },function(){
      jcrop_api = this;
    });

    $('#coords').on('change','input',function(e){
      var x1 = $('#x1').val(),
          x2 = $('#x2').val(),
          y1 = $('#y1').val(),
          y2 = $('#y2').val();
      jcrop_api.setSelect([x1,y1,x2,y2]);
    });
	$("#nocutImgButton").click(function(){
		uploadImgCallback(sourcePath);
		$("#cutImageBox").hide();
    });
	$("#cancelUploadImg").click(function(){
		$("#cutImageBox").hide();
    });
    $("#cutImgButton").click(function(){
    	if($("#w").val() == '' || $("#w").val() == '0'){
    		$("body").tip({ynclose :false,status : "error",content :"请先选择图片区域。",width:"280"});
    		return false;
    	}
    	$.ajax({
			async : false,
			type : "post",
			url : path +"/cutImage",
			data :{
				"x1":$("#x1").val(),
				"y1":$("#y1").val(),
				"width":$("#w").val(),
				"height":$("#h").val(),
				"sourcePath":$(".sourcePath").attr("src")
			},
			dataType : "json",
			success : function(data) {
				$("#cutImageBox").hide();
				uploadImgCallback(data.data.url);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
			}
		
		});
    	
    });
  });
