
/*
 * 新增提现记录
 */
function newWithdraw() {
	var url = path + "/business/withdraw/add";
	console.log(url);
	layer.open({
		type : 2,
		title: "提现申请",
		skin: 'layui-layer-rim',
		area: ['800px', '550px'],
		content: url
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
		url :  path+"/business/withdraw/withdrawlist",
		data : {pagenum:pageNo},
		dataType : "html",
		success : function(result) {
			$("#dataList").html(result);
		}
	});
	
}