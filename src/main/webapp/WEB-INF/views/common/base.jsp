<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
    String path =  request.getScheme()
    		+ "://"
    		+ request.getServerName()
    		+ (request.getServerPort() != 80 ? ":"
    				+ request.getServerPort() : "") +request.getContextPath();
    String url = request.getServletPath();
	request.setAttribute("path",path);
	request.setAttribute("url",url);
%>
<link rel="stylesheet" href="${path}/commons/css/base.css">
<link rel="stylesheet" href="${path}/commons/css/login.css">
<script type="text/javascript" src="${path}/commons/js/common/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/layer/layer.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/jquery-form.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/jquery.validate.min.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/jquery-Validate_expand.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/jquery-ajaxfileupload.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/jquery.cookie.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/popup/popup.js"></script>
<script type="text/javascript" src="${path}/commons/js/common/popup/popup-ui.js"></script>	
<script type="text/javascript">
var path="${path}";
$(document).ready(function(){
	var lefth= $(".provider_left").height();
	var rightH = $(".provider_right").height();
	if(lefth>rightH){
		return false;
	}
	else{
		$(".provider_left").height($(".provider_right").height());
	}
});
</script>