<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class = "provider_left">
	<p class = "logo_bg"><img src = "${path}/commons/images/logo.png"></p>
	
	<div class = "cont menuAllList">
	<dl class = "firstPage" onclick="location.href='${path}/'" style="cursor: pointer;">
					<dt>
						<img src = "${path}/commons/images/house.png" class = "tipID">
						<em>首页</em>
					</dt>
				</dl>
	   <c:forEach items="${menus}" var="menu" varStatus="i">
	     <dl>
			<dt class = "leftImg">
			<img src = "${path}/commons/images/bag.png" class ="first tipID"/> 
				<em>${menu.po.name}</em>
		<%-- 		<img src = "${path}/commons/images/plus.png" class = "second"> --%>
			</dt>
			 <c:forEach items="${menu.sub}" var="sub" varStatus="f">
			   <dd url="${path}${sub.url}" id="yhmall_left_url${i.count}${f.count}"><em>${sub.name}</em></dd>
			 </c:forEach>
			 <dt><img src = "${path}/commons/images/dis.png" class = "distanceImg"></dt>
		 </dl>
	   </c:forEach>
	</div>
</div>
		
<script>

var yhmall_left_url_suit = 0;
	$(document).ready(function(){
		var nowUrl = window.location.href;
		var yhmall_left_url = $.cookie('yhmall_left_url');
		
		$(".menuAllList dd").each(function(){
			var url = $(this).attr("url");
			if(url != undefined && nowUrl.indexOf(url)>=0){
				$(this).addClass("on");
				$.cookie('yhmall_left_url',$(this).attr("id"),{expires:365,path:'/'});
				$(".nowHeaderUrl").html("当前位置：供应商后台商品管理 >"+$(this).find("em").html());
				yhmall_left_url_suit =1;
				return false;
			}
		});
		if(yhmall_left_url_suit == 0){
			$("#"+yhmall_left_url).addClass("on");
			$(".nowHeaderUrl").html("当前位置：商城后台商品管理 >"+$("#"+yhmall_left_url).find("em").html());
		}
		$(".menuAllList dd").live("click",function(){
			var url = $(this).attr("url");
			location.href= url;
		});
		/* $(".menuAllList dt").click(function(){
			  $(this).parents("dl:eq(0)").find("dd").toggle();
			  var src = $(this).parent().find(".second").attr("src");
			  if(src.indexOf("plus")>0){
				  $(this).parents("dl:eq(0)").find(".second").attr("src",path+"/commons/images/minus_sign.png");
			  }
			 else{
				  $(this).parents("dl:eq(0)").find(".second").attr("src",path+"/commons/images/plus.png"); 
				  
			  }
		}); */
	 	$(".homepage").bind("click", function() {
			window.location.href="${path}/business/index";
		}); 
	});
	


</script>