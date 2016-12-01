
function turntoadd(){
	window.self.location = path+'/business/user/add';
}

function turntoedit(id){
	window.self.location = path+'/business/user/edit?id='+id;
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
		url :  path+"/business/user/userlist",
		data : {pagenum:pageNo},
		dataType : "html",
		success : function(result) {
			$("#dataList").html(result);
		}
	});
	
}