<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
		
		
		<c:if test="${page!=null && page.pagecount>1}">
 							<div class="yhbusiness_page" style="">
	 							<c:if test="${page.total!=0}" >
	 								<c:if test="${page.pageNo>1 }" >
	 									<a href="javascript:;" pagebegin="1" onclick="clickPageSubmit(${page.pageNo-1 })">上一页</a>
	 								</c:if>
	 							<c:forEach begin="${page.showPageHead}" end="${page.showPageEnd}" varStatus="i">
										<c:if test="${page.showPageHead+i.count-1==page.pageNo }" >
											<a style="background-color: #ea2e49;" href="javascript:;" pagebegin="${page.showPageHead+i.count-1}" onclick="clickPageSubmit(${page.showPageHead+i.count-1})">${page.showPageHead+i.count-1}</a>
										</c:if>
										<c:if test="${page.showPageHead+i.count-1!=page.pageNo }" >
											<a href="javascript:;" pagebegin="${page.showPageHead+i.count-1}" onclick="clickPageSubmit(${page.showPageHead+i.count-1})">${page.showPageHead+i.count-1}</a>
										</c:if>
									</c:forEach>
									<c:if test="${page.pagecount>page.pageNo }" >
										<a href="javascript:;" pagebegin="${page.pageNo+1 }"  onclick="clickPageSubmit(${page.pageNo+1 })">下一页</a>
									</c:if>
									
									
									<input style="*+padding:3px 0;float: left;" type="text" name="pagebegin" value="${page.pageNo}" class="pageimgs"/>
									<a href="#" id="pageimgs" maxpage="${page.pagecount}">跳转</a>
								</c:if>
 							</div></c:if>
<script type="text/javascript">
$('#pageimgs').live('click', function() {
	 var  matchnum = /^[0-9]*$/;
	 var val = $(".pageimgs").val();
	    if(!matchnum.test(val)){
	    	$(".pageimgs").val("");
	    	return false;
	     }
	var totalPage = "${page.pagecount}";
	if(Number(val) > Number(totalPage)){
		$('.pageimgs').val(totalPage);
	}
	clickPageSubmit($('.pageimgs').val());
	}); 
</script>
<style>
.yhbusiness_page{
	text-align: center;
	padding-left: 20px;
}
.yhbusiness_page a {
    border: 1px solid #888;
    float: left;
    font-size: 12px;
    margin-left: 2px;
    padding: 5px 8px;
    text-decoration: none;
    color: gray;
}
.yhbusiness_page  input {
    border: 1px solid #bbb;
    font-size: 12px;
    margin-left: 2px;
    padding: 5px 0;
    text-align: center;
    width: 30px;
}
</style>
