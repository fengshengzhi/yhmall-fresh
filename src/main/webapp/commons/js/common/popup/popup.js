/**
 + ---------------------------------------- +
 + 365框架 v2.0
 + Author: 杜恒
 + QQ: 252072933
 + Mail: duheng1100@163.com
 + ---------------------------------------- +
 + Date: 2013-03-12
 + ---------------------------------------- +
**/
 ;(function ($) {
	
	 $.fn.extend({
        popup: function(options) {
			var defaults = { 
				width:'350', //窗体宽度
				height:'350', //窗体高度
				show:false,//是否默认显示
				click:null,//点击按钮对象 id或者class
				clickcalback:null,//点击按钮对象回调函数
				calback:null  //回调
			}
			var object = this.selector; //当前调用的对象
			var options = $.extend({},defaults, options);
			var popuicss = '.js-plug-wrap-popup{display:none;  }\
							.js-plug-wrap-popup .js-plug-popup-mask{ z-index:999;position:fixed; left:0; top:0; width:100%; height:100%;background:#000;opacity:0.5;filter:alpha(opacity=50);}\
							.js-plug-wrap-popup-box{position:fixed; top:30%;left:50%; margin-left:-225px; z-index:9999; min-width:450px; *+width:550px; border:3px solid #a3aeb5; background-color:#fff;}\
							.js-plug-wrap-popup-top{cursor:move; display:block; padding:20px 25px; height:21px; border-bottom:1px solid #ededed; border-top:1px solid #fff; background-color:#f7f7f7;}\
							.js-plug-wrap-popup-top span{ float:left; line-height:21px; font-family:"微软雅黑"; font-size:20px; color:#606569;}\
							.js-plug-wrap-popup-top a{ float:right; width:21px; height:21px; cursor:pointer;}\
							.js-plug-wrap-popup-con{ margin:30px 40px; display:block;}\
						';						
			if (this.selector && 0==$('#popupui_tmp').length) $("head").append("<style type='text/css' id='popupui_tmp'>"+popuicss+"</style>");			
            function isFunction( fn ) { /*判断是否是函数类型*/
			 return  !!fn && !fn.nodeName && fn.constructor != String &&
					 fn.constructor != RegExp && fn.constructor != Array &&/function/i.test( fn + "" );
			}
			
			function show(){
				$(object).parents(".js-plug-wrap-popup").fadeIn();
				
			}
			function hide(){
				$(object).parents(".js-plug-wrap-popup").hide();
			}
	
			return this.each(function() {
				var o = options,item = $(this);
				var s_calback = o.calback,s_click = o.click,s_clickcalback = o.clickcalback;
					s_show = o.show;
				s_width = o.width;s_height = o.height;
				var closeImage = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo3NjU5MDVDRkI3NzlFMzExOUEwQUJCRTA2QkUxNzhCRiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3QzA4QTkwQzg2N0ExMUUzQUQ1Q0RERjA0QjhGRDRFQSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3QzA4QTkwQjg2N0ExMUUzQUQ1Q0RERjA0QjhGRDRFQSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjlBOUJEOEY5Qzc4NEUzMTE5OERGODFEOTM0OEM5M0YwIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjc2NTkwNUNGQjc3OUUzMTE5QTBBQkJFMDZCRTE3OEJGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+G0PRVAAAAQdJREFUeNqU1T8OgjAUBvDaA3ACRrt4BSfdcOEUcCi4hCw4mKiJ4QosOOoF9AK+kldTsH8+mnwDhP4G3td0db7dBa8tpaLklIfAl6IcKSWl0y+kBbaUDeVKWS8AL7yvZWdEDZjwhykIGzDl58TAGq0tUMxgBYLCgmvJ//Dl2JjyRgWCgp1cowNlB8IxUDuDGRQCZwhoT9+Gnx64RcA5auC9BxYI6EKXwE7Qhxq4jKCFCwyhio9saFW+HssFxUZ7/IeiYBCWIKiHdgjUbQJLENRtOAVaMYElCA5A3X6wRhsQFCDcSO7bBwRjsHYKyVdAZsEx0Ae/2enMoAzc+45eBO65HeMd9RVgAEyoYGi9OYiBAAAAAElFTkSuQmCC';
				/*功能实现区域*/
				 item.wrap('<div class="js-plug-wrap-popup-con"></div>');
				 item.parent(".js-plug-wrap-popup-con").wrap('<div class="js-plug-wrap-popup-box">\
					<div class="js-plug-wrap-popup-top"><span>提示</span><a class="js-plug-popup-close"><img src='+closeImage+' width="21" height="21" /></a></div>\
				 </div>');
				item.parents(".js-plug-wrap-popup-box").wrap('<div class="js-plug-wrap-popup"></div>');				
				item.parents(".js-plug-wrap-popup").append('<div class="js-plug-popup-mask"></div>');
				item.parents(".js-plug-wrap-popup-box").draggable();
				/*默认显示*/
				if(s_show == true){
					show();
				}
				/*点击按钮弹出*/
				$(s_click).bind("click",function(){
					 /*调用显示弹出函数*/
					
					if(isFunction(s_clickcalback)){/*启用点击按钮回调函数*/
						s_clickcalback(show);
					}else{
						show();
					};
				});
				
				item.parents(".js-plug-wrap-popup").find(".js-plug-popup-close").bind("click",function(){
					hide();
				});
				
				
				if(s_calback != null){
					s_calback(hide);
				};
            });
					
        },
        tip: function(options){
					var defaults = { 
						width:'260',
						height:'30',
						status:'statusing', //操作状态提示 statusing(操作进行中) , error(操作错误) ,right (操作正确)
						content:'这里是提示内容',//这里是提示内容
						position:'fixed',//定位方式 fixed，absolute ,relative(relative暂未开放，用得到再加)
						ynclose:true,//是否开启自动关闭；
						dis_time:1500,//需要显示时间
						top:0,
						left:50,
						calback:null
					};
					var _seltip = this.selector; //当前调用的对象
					var options = $.extend({},defaults, options);
					var closeimg = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAQBAMAAAD+CqKmAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODc2RDFEQzdGQzdEMTFFMUJGMUNGNTNBQzlDMzU5MzgiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6ODc2RDFEQzhGQzdEMTFFMUJGMUNGNTNBQzlDMzU5MzgiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4NzZEMURDNUZDN0QxMUUxQkYxQ0Y1M0FDOUMzNTkzOCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4NzZEMURDNkZDN0QxMUUxQkYxQ0Y1M0FDOUMzNTkzOCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Prj0Ny8AAAAYUExURXAjJP///wgpRhBFcRg6AyRcAE4REnAjJA+1LOkAAAACdFJOUwAAdpPNOAAAAGdJREFUCNdVzKsNwwAMBuGfBV8e5fEGkSeI5AUCPECJcZjXL63hSadPDt5SJ6T82rzfpfM5Upv7tXS/R+Yj3FG3yGTG2AYwaAMrqICQnavV91Nx76HV7PxUffeIW5hBFUQwY2wD+Kd/v2wn2XGW2mkAAAAASUVORK5CYII=';			 
					var micon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAACUEAQAAABgS71nAAAAAmJLR0T//xSrMc0AAAAJcEhZcwAAAEgAAABIAEbJaz4AAAN7SURBVGje7ZrLS1RRHMd/3tExnTYuWghBYA8sQrCSkdlFgn9BG2cnbqJFS10GgQqVWpkPtDfuXEcFSgt7EFGpi6ByKG3c5NQF0abm8WlxZjje6713pmnR5nw2M/M79/s79zzuwPd3j4gLOHoUhobgzRtIpSCZhBcvoL8fDh4UP6CmBkZGIJfDl0wGLl0Cy3KJw2F4/JiymZ2FUGhHgps3yxcXuXixIG5thXxeNySTEI+DbeuYbavY+rqOpdNw4IDAxIQzczyuEre3K6FtQ3u7isXjzmsHBgQ+fHAGbRuiUZ2k+D0add4VwMuXom7FjU7iLwZYX7dEqqqkYixLYGXFfwjRaPAQXr0SuHPHexKLgp0J3ZM4NCQQizmDySR0dXkvYzKpY5kMHDlSmKQHD/5+I129umMn1tfD8+fli588gXDY9TzU1cH9+8HCfB5GR3eJnYliMbh7Fz5/VqJ0Gj5+hKkpaG2tfMkNBoPBYDAYDAaD4b8DbW0wPa089c+fkM0qyzM+Hmh5YM8euHXLWQoo03Qp27ewUNruZbOetk/1XNpowrlz+veNGwVxNFpaPD8PoZCqtayt6eEcPy5w+3aweHUV9u1TnQ0MONuuXxf49EkHtrbg2zf9O52GU6eUOBbTc1Dk3TtXBaOnB06fVs4coLtbiSMRtZRuNjZEF55+/IC9e5XgwgWYmNCTPDbmPTzbdlUwdoqqq9VnZ6f/3lhcFJic1IF8Hs6c0UkaGuDrV/8JHh4WOHnS2UMioYcyM+MvzmahubnQ09SUs3F0FM6eDV7ekRHXVn761DkUr7pRkYcPPZ6HcFj1XFxCLzIZuHy5OME+T+WxY3DlCiwuwvfvsLEBb9/C4CAcPvy//24MBoPBYDAYDAaD4R9Qb/ynp5X9y+Vgexvev1cVjJaWAGFdHdy7F2z1cjm4dg1qalxirxfX+by6i0Rit/V99Mjh3LxfWC8v6/bV1d3thVfnqoLhZa5TKejthb4+2Nz0s77VIufPex9iiEREOjrU99ra3e2hkEhPj8/tASwt6SF8+eJ9zevXlkhjY+WLvn+/JRLgg0sSDlsia2uVJ0gkLJH5+coTzM0JnDjhvYylJvHXL2hqKlzgPgkCyvYH7YPBQdE91NfDs2eUjWcFIxJRB3uCDjT9/q2KcoFnMFpaYHgYlpZUHSWV0hWMQ4fc1/8BOIK4ctZOz2YAAAAASUVORK5CYII=';
					var close = function (){
									$("#tip-box").slideUp();
								}
					 return this.each(function() {
						var o = options,_this = this;calback = o.calback;
							d_status = o.status , d_width = o.width , d_height = o.height ,d_content = o.content ,d_position = o.position ,d_top = o.top , d_left = o.left ,d_ynclose = o.ynclose ,d_dis_time = o.dis_time;
						if(0 >= $("#tip-box").length){
							 var item = $('<div id="tip-box" style="z-index:99999;"><em id="closess-status" class="closess-status"  title="关闭"></em><span class="tipContent" style="margin-left:10px;"></span></div>');
							 $('body').append(item);
						}
						 $("#tip-box").css({width:d_width+"px",height:d_height+"px",display:"none",fontFamily:"&#23435;&#20307;",fontSize:"12px",color:"#fff",borderRadius:"3px",lineHeight:d_height+"px"});
						 $("#tip-box").find(".tipContent").html(d_content);
						if(d_status =='statusing'){
							$("#tip-box").css({backgroundColor:'#0c71c7',boxShadow:'0 4px 4px rgba(0, 0, 0, 0.2)',border:'1px solid #006096'});
							$('.tip-status').width(16).height(16).css({display:'block',float:'left',background:'url('+micon+') 0 -132px no-repeat',margin:'7'+'px'});
							$('.closess-status').width(8).height(8).css({display:'block',float:'right',background:'url('+closeimg+') no-repeat',margin:'11'+'px',cursor:'pointer'});
						}else if(d_status =='error'){
							$("#tip-box").css({backgroundColor:'#CD3237',boxShadow:'0 4px 4px rgba(0, 0, 0, 0.2)',border:'1px solid #CA3E3E'});
							$('.tip-status').width(16).height(16).css({display:'block',float:'left',background:'url('+micon+') no-repeat',margin:'7'+'px'});
							$('.closess-status').width(8).height(8).css({display:'block',float:'right',background:'url('+closeimg+') -8px 0 no-repeat',margin:'11'+'px',cursor:'pointer'});
						}else{
							if(d_status =='right'){
								$("#tip-box").css({backgroundColor:'#43AB00',boxShadow:'0 4px 4px rgba(0, 0, 0, 0.2)',border:'1px solid #338100'});
								$('.tip-status').width(16).height(16).css({display:'block',float:'left',background:'url('+micon+') 0 -66px no-repeat',margin:'7'+'px'});
								$('.closess-status').width(8).height(8).css({display:'block',float:'right',background:'url('+closeimg+') -16px 0 no-repeat',margin:'11'+'px',cursor:'pointer'});
							}
						}
							//出现位置
							if(d_position == 'fixed'){
								$("#tip-box").css({position:d_position,top:d_top+'px',left:d_left+'%',marginLeft:-d_width/2+'px'});
							}else if(d_position == 'absolute'){
								$("#tip-box").css({position:d_position,top:d_top+'px',left:d_left+'%',marginLeft:-d_width/2+'px'});
							}else{
								if(d_position == 'relative'){
								return true;
								}
							}
							$("#tip-box").slideDown();
							$("#tip-box").find("#closess-status").click(function(){
								close();
							});
						if(calback != null){
							calback(close);
						}else{
							if(d_ynclose == true){
								setTimeout(function(){
									close();
								},d_dis_time);
							}
						}	
					 });
		}
    });
})(jQuery);


