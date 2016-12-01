
/*function turntoadd(){
	window.self.location = path+'/business/bankcard/add';
}

function turntoedit(id){
	window.self.location = path+'/business/bankcard/edit?id='+id;
}*/

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
				required:true,
				digits:true
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
				required:"请输入银行卡号!",
				digits:"银行卡号暂时只支持数字!"
	        }
	    },
	    errorPlacement: function(error, element) {
			if(element.parent().find("label.error").length<=0) {
				error.appendTo(element.parent());
				error.css("color","red");
			}
		},
		success:function(element){
			$("[name='"+element[0].htmlFor+"']").parent().find("label.error").remove();
		}
	});
	
});


// 弹出层索引
var index;

/*
* 新增银行账号
*/
function turntoadd() {
	index = layer.open({
		  type: 1,
		  title: "新增银行账号",
		  skin: 'layui-layer-rim',
		  area: ['850px', '600px'],
		  content: $('#editCardBox'),
		  cancel: function() {
			  $("#po_id").val("");
			  $("#po_cardName").val("");
			  $("#po_bankBrandch").val("");
			  $("#po_cardNo").val("");
		  }
	});
}

/*
* 修改银行账号信息
*/
function turntoedit(id) {
	var url = path + "/business/bankcard/edit";
	console.log(url + "  " + id);
	index = layer.open({
		type: 1,
		title: "修改银行账号信息",
		skin: 'layui-layer-rim',
		area: ['850px','600px'],
		content:  $('#editCardBox'),
		cancel: function() {
			  $("#po_id").val("");
			  $("#po_cardName").val("");
			  $("#po_bankBrandch").val("");
			  $("#po_cardNo").val("");
			  $("#get").attr("checked","checked");
		}
	});
	$.ajax({
		async : false,
		url : url,
		type: "post",
		data:{
			"id" : id
		},
		dataType : "json",
		success : function(data) {
			if (data.success) {
				$("#po_id").val(data.data.id);
			  	$("#po_cardName").val(data.data.cardName);
			  	$("#po_bankBrandch").val(data.data.bankBranch);
				$("#po_cardNo").val(data.data.cardNo);
				if(data.data.status == 1) {
					$("#get").attr("checked","checked");
				} else {
					$("#noget").attr("checked", "checked");
				}
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
		}
	});
}


/*
 * 保存信息 或 更新信息
 */
function savedata(){
	//判断校验是否通过
	if(!$("#dataform").valid()){
		return false;
    }
	$("#dataform").ajaxSubmit({
        type: "POST",
        url: path + "/business/bankcard/save",
        dataType: "json",
        success: function(res) {
        	if(res.success){
        		$("body").tip({ynclose :true,status : "right",content :"操作成功！",width:"280"});
        		layer.close(index);
          		window.location = path+"/business/bankcard/bankcard";
          	 } else {
                 alert(res.msg);
          	 }
        }
    });
}

/**
 * 分页点击事件
 * 
 * @param pageno
 */
function clickPageSubmit(pageno) {
	pageNo = pageno;
	$.ajax({
		async : false,
		type : "post",
		url :  path+"/business/bankcard/cardlist",
		data : {pagenum:pageNo},
		dataType : "html",
		success : function(result) {
			$("#dataList").html(result);
		}
	});
	
}