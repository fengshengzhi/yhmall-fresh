<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  		<%@include file="/WEB-INF/views/common/base.jsp"%>
  		<%@include file="/WEB-INF/views/common/cutimage.jsp"%>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script charset="utf-8" type="text/javascript"  src="${path}/commons/js/item/add.js"></script>
		<script charset="utf-8" type="text/javascript"  src="${path}/commons/js/common/uploadImg.js"></script>
		<script charset="utf-8" type="text/javascript"  src="${path}/commons/js/common/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
.showGuiGe{display: none;}
.itemImg0,.itemImg1,.itemImg2,.itemImg3,.itemImg4,.itemImg5,.nowImg{width:64px;height:64px;}
#updateImgButtonTop2{ cursor: pointer;
    font-size: 100px;
    height: 32px !important;
    left: 111px;
    margin: 0;
    opacity: 0;
    position: absolute;
    top: -6px;
    width: 119px;}
   .updateImgButton0{  cursor: pointer;
    font-size: 100px;
    height: 33px !important;
    left: 113px;
    opacity: 0;
    position: absolute;
    top: -6px;
    width: 119px;}
 .updateImgButton{ cursor: pointer;
    font-size: 100px;
    height: 82px !important;
    left: -7px;
    margin: 0;
    opacity: 0;
    position: absolute;
    top: -2px;
    width: 112px;}
#updateImgButton{position:absolute; width:103px;top:0; margin:0; left:0; cursor: pointer; font-size:100px; height:80px !important; filter:alpha(opacity:0); opacity: 0;}
#newaddID .itemContent{margin-bottom: 10px;}
#newaddID .itemContent div{margin:0px !important;}
.ke-container-default,.ke-toolbar,.ke-statusbar{width: 100%!important;}
#newaddID p.last{margin-top: 10px;}
.checkPropertyValue{cursor: pointer;}
</style>
    </head>
  <body class = "gray_body">
    
    <%-- <c:forEach items="${checkPropertyValue }" var="checkPropertyValue">
    	<div class="checkPropertyValueFromAction" style="display: none;">
    		<input class="checkPropertyValueFromAction0" value="${checkPropertyValue[0]}">
    		<input class="checkPropertyValueFromAction1" value="${checkPropertyValue[1]}">
    		<input class="checkPropertyValueFromAction2" value="${checkPropertyValue[2]}">
    		<input class="checkPropertyValueFromAction3" value="${checkPropertyValue[3]}">
    		<input class="checkPropertyValueFromAction4" value="${checkPropertyValue[4]}">
    		<input class="checkPropertyValueFromAction5" value="${checkPropertyValue[5]}">
    		<input class="checkPropertyValueFromAction6" value="${checkPropertyValue[6]}">
    		<input class="checkPropertyValueFromAction7" value="${checkPropertyValue[7]}">
    		<input class="checkPropertyValueFromAction8" value="${checkPropertyValue[8]}">
    	</div>
    	
     </c:forEach> --%>
    
    <input type="hidden" value="${item.id }" class="itemId"> 
    <input type="hidden" value="${item.image }" class="itemImage"> 
	<input type="hidden" value="${item.itemPropertyIds }" class="itemPropertyIds"> 

	<div class = "provider clearfix" id = "provider">
		<%@include file="/WEB-INF/views/common/left.jsp"%>
		<div class = "provider_right">
			 <%@include file="/WEB-INF/views/common/header.jsp"%>
			<div class = "provider_coment" id = "provider_apply">
				<div class = "coment addnewgood">
					<p class = "tit"><em>填写商品信息</em></p>
					<div id = "newaddID">
						<p class = "first"><em>商品名<s>*</s></em><span><input type= "text"  class = "dis itemName" maxlength="30" placeholder = "请简洁说明这是什么商品，不超过30个字" value="${item.name }" class = "itemName"></span></p>
						<p><em>商品简述<s>*</s></em><span><textarea  placeholder = "请描述一下您的商品" class = "dis tex itemDescription">${item.description }</textarea></span></p>
						<p><em>编号<s>*</s></em><span><input type= "text" class = "num itemCode" placeholder="唯一编号不可重复" value="${item.code }"></span></p>
						<p><em>关键字<s>*</s></em><span><input type= "text" class = "num itemKeyword" placeholder="请输入关键字，多个以逗号隔开" value="${item.keyword }"></span></p>
						<p><em>上架区<s>*</s></em><span>
						<select id="" class="itemAreaid">
                        <option value="0" selected="">选择</option>
                         <c:forEach items="${itemAreas}" var="itemAreas">
							<option value="${itemAreas.id }">${itemAreas.name }</option> 
						</c:forEach>
                    </select>
						
						</span></p>
						<p><em>商品一级分类<s>*</s></em><span>
						 <select id="" class="itemCategorysFirst">
                        <option value="0" selected="">选择</option>
                    </select></span></p>
						<p><em>商品二级分类<s>*</s></em><span>
						 <select id="stext3_bold" class="itemCategorysSecond">
                        <option value="0" selected="">选择</option>
                    </select>
						</span></p>
						<p><em>品牌<s>*</s></em><span> 
						<select id="itemBrandId" class="itemBrandId">
                        <option value="0" selected="">选择</option>
                         <c:forEach items="${itemBrands}" var="itemBrand">
							<option value="${itemBrand.id }">${itemBrand.name }</option> 
						</c:forEach>
                    </select></span></p>
                    	<p style="position: relative;">
                    		<input type="file" size="31" id="updateImgButtonTop2" name="mp3file">
							<a class = "redBtn unloadimg">上传图片</a>
						</p>
						<p style="position: relative;">
							<span class = "imgw imgwChange">
							<c:if test="${item.image!=null && item.image!='' }">
								<img src = "${item.image}" class = "infoimg itemImg0 updateImg nowImg"/>
							</c:if>
							<c:if test="${item.image==null || item.image=='' }">
								<img src = "${path }/commons/images/pinpai.png" class = "infoimg itemImg0 updateImg nowImg"/>
							</c:if>
							
							<a class = "changeBtn">更换</a>
							<input type="file" style="" size="31" id="updateImgButton" name="mp3file">
							<img src = "${path }/commons/images/afda.png" class = "loadDel delNowImg"/>
							</span>
						</p>
						<p style="position: relative;">
							<input type="file" size="31" icount="0" id="updateImgButton0" class="updateImgButton0" name="mp3file">
							<a class = "redBtn unloadimg">上传图片</a><font class = "tip">图片不得超过5张</font>
						</p>
						<p class="skuImages">
							<c:forEach items="${itemPictureList }"  varStatus="i" var="itemPictureList">
								<c:if test="${i.count ==1 }">
									<span class = "imgw imgwChange"  style="position: relative;">
								</c:if>
								<c:if test="${i.count !=1 }">
									<span class = "imgwChange"  style="position: relative;">
								</c:if>
								<input type="file" size="31" icount="${i.count}" id="updateImgButton${i.count}" class="updateImgButton" name="mp3file">
								<c:if test="${itemPictureList.url !=null && itemPictureList.url !='' }">
									<img src = "${itemPictureList.url}" class = "infoimg itemImg${i.count} nowImg"/>
								</c:if>
								<c:if test="${itemPictureList.url ==null || itemPictureList.url =='' }">
									<img src = "${path }/commons/images/pinpai.png" class = "infoimg itemImg${i.count} nowImg"/>
								</c:if>
								
								<a class = "changeBtn">更换</a>
								
								<img src = "${path }/commons/images/afda.png" class = "loadDel delNowImg"/>
								</span>
							</c:forEach>
							
							
							<%-- <span class = "imgwChange">
							<img src = "${path }/commons/images/pinpai.png" class = "infoimg itemImg2"/>
							<a class = "changeBtn">更换</a>
							<img src = "${path }/commons/images/afda.png" class = "loadDel"/>
							</span>
							<span class = "imgwChange">
							<img src = "${path }/commons/images/pinpai.png" class = "infoimg itemImg3"/>
							<a class = "changeBtn">更换</a>
							<img src = "${path }/commons/images/afda.png" class = "loadDel"/>
							</span>
							<span class = "imgwChange">
							<img src = "${path }/commons/images/pinpai.png" class = "infoimg itemImg4"/>
							<a class = "changeBtn">更换</a>
							<img src = "${path }/commons/images/afda.png" class = "loadDel"/>
							</span>
							<span class = "imgwChange">
							<img src = "${path }/commons/images/pinpai.png" class = "infoimg itemImg5"/>
							<a class = "changeBtn">更换</a>
							<img src = "${path }/commons/images/afda.png" class = "loadDel"/>
							</span> --%>
						</p>
					<p class = "price showGuiGe">
							<em>商品规格<s>*</s></em>
							<span class="itemPropertyList">
							<a class = "first">颜色<i><img src = "${path }/commons/images/sep.png" class = "spe"></i></a>
							<a>尺码</a></span>
						</p>
						<div class = "newgoods itemPropertyValueList showGuiGe">
							<div class = "first clearfix itemPropertyValue">
								<ul class = "first"><li><em>颜色<s>*</s></em></li></ul>
								<ul class = "colorval clearfix">
									<li class = "on">黑色<i><img src = "${path }/commons/images/sep.png" class = "spe"></i></li>
									<li>白色</li>
									<li>灰色</li>
									<li>深灰</li>
									<li>红色</li>
									<li>紫色</li>
									<li>蓝色</li>
									<li>金属色</li>
									<li>绿色</li>
									<li>军绿色</li>
									<li>棕色</li>
									<li>柠檬黄</li>
									<li>裸色</li>
									<li>驼色</li>
								</ul>
							</div>
							<%-- <div class = "clearfix">
								<ul class = "first"><li><em>尺码<s>*</s></em></li></ul>
								<ul class = "colorval clearfixl">
									<li class = "on">XXS<i><img src = "${path }/commons/images/sep.png" class = "spe"></i></li>
									<li>均码</li>
									<li>XS</li>
									<li>S</li>
									<li>M</li>
									<li>L</li>
									<li>XL</li>
									<li>XXL</li>
									<li>XXXL</li>
								</ul>
							</div>
							<div class = "clearfix">
								<ul class = "first"><li><em>材质<s>*</s></em></li></ul>
								<ul class = "colorval clearfixl">
									<li class = "on">绵<i><img src = "images/sep.png" class = "spe"></i></li>
									<li>化纤</li>
									<li>雪纺</li>
								</ul>
							</div> --%>
							<div class="myCheckedSkuGuiGe">
							
							
							<table>
								<tr class = "first">
									<td class = "tab1">规格</td>
									<td class = "tab2">库存</td>
									<td class = "tab3">重量</td>
									<td class = "tab4">市场价</td>
									<td class = "tab5">结算价格</td>
									<td class = "tab6">SKU</td>
									<td class = "tab7">运费</td>
								</tr>
								<tr>
									<td class = "tab1 allGuiGe"></td>
									<td class = "tab2"><input type = "text"  class="skuStock" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
									<td class = "tab3"><input type = "text" class="skuWegiht vfloat"  value="0">kg</td>
									<td class = "tab4"><input type = "text" class="skuMarketPrice vfloat" value="0"></td>
									<td class = "tab5"><input type = "text" class="skuPrice vfloat" value="0"></td>
									<td class = "tab6"><input class = "sku skuCode" type = "text"></td>
									<td class = "tab7">
										<select class="postage"><option value="0">全国包邮</option><option value="1">运费自结算</option>
										</select>
										<a class = "red_btn addGroupPropertyValue" href="javascript:;">添加</a></td>
								</tr>
								<!-- <tr>
									<td class = "tab1">白色\均码\绵</td>
									<td class = "tab2"><input type = "text"></td>
									<td class = "tab3"><input type = "text">kg</td>
									<td class = "tab4"><input type = "text"></td>
									<td class = "tab5"><input type = "text"></td>
									<td class = "tab6"><input class = "sku" type = "text"></td>
									<td class = "tab7"><select><option>全国包邮</option></select><a class = "red_btn">添加</a></td>
								</tr>
								<tr>
									<td class = "tab1">白色\均码\绵</td>
									<td class = "tab2"><input type = "text"></td>
									<td class = "tab3"><input type = "text">kg</td>
									<td class = "tab4"><input type = "text"></td>
									<td class = "tab5"><input type = "text"></td>
									<td class = "tab6"><input class = "sku"type = "text"></td>
									<td class = "tab7"><select><option>全国包邮</option></select><a class = "red_btn">添加</a></td>
								</tr> -->
							</table></div>
						</div>
						<div class = "newgoods showGuiGe">
							<table class="myCheckedSkus">
								<tr class = "first">
									<td class = "tab1">规格</td>
									<td class = "tab2">库存</td>
									<td class = "tab3">重量</td>
									<td class = "tab4">市场价</td>
									<td class = "tab5">结算价格</td>
									<td class = "tab6">SKU</td>
									<td class = "tab7">运费</td>
								</tr>
								 <c:forEach items="${checkPropertyValue }" var="checkPropertyValue">
								 	<tr propertyValueIds="${checkPropertyValue[0]}" skuId="${checkPropertyValue[1]}" class="${checkPropertyValue[0]} myCheckedSkusListValue">
									<td class = "tab1">${checkPropertyValue[9]}</td>
									<td class = "tab2"><input type = "text" value="${checkPropertyValue[3]}" onkeyup="this.value=this.value.replace(/\D/g,'')"></td>
									<td class = "tab3"><input class="vfloat" type = "text" value="${checkPropertyValue[8]}">kg</td>
									<td class = "tab4"><input class="vfloat" type = "text" value="${checkPropertyValue[5]}"></td>
									<td class = "tab5"><input class="vfloat" type = "text" value="${checkPropertyValue[4]}"></td>
									<td class = "tab6"><input type = "text" class = "sku mySkuList" value="${checkPropertyValue[6]}" ></td>
									<td class = "tab7">
									<select class="myCheckedPostage">
										<c:if test="${ checkPropertyValue[10] == 0}">
											<option value="0" selected="selected">全国包邮</option>
											<option value="1">运费自结算</option>
										</c:if>
										<c:if test="${ checkPropertyValue[10] == 1}">
											<option value="0">全国包邮</option>
											<option value="1" selected="selected">运费自结算</option>
										</c:if>
									</select>
									<a class = "red_btn deleteCheckedSku">删除</a></td>
								</tr>
								 </c:forEach>
								
								<tr class = "last_data redirectWrite">
									<td colspan = '7'>
									<em>一字填写：</em>
									<font>库存</font><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" class="stockAll">
									<font>重量</font><input type = "text" class="weightAll vfloat">
									<font>价格</font><input type = "text" class="priceAll vfloat">
									<a class = "red_btn addVALl">添加</a>
									</td>
								</tr>
							</table>
						</div>
						<p class = "msgimg">
							<em>商品详情<s>*</s></em>
							<span><a class = "redBtn MyTextareaUploadImg">上传图片</a>
						</p>
						<div class = "newgoods itemContent">
							<textarea id ="MyTextarea" name="MyTextarea" >${item.itemdetail }</textarea>
						</div>
						<p class = "last">
							<a class= "redBtn addSaveBtn saveSkusButton">保存</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			if("${item.brandid}" !='' && "${item.brandid}" !='0'){
				$(".itemBrandId").val("${item.brandid}");
			}
			if("${item.areaId}" !='' && "${item.areaId}" !='0'){
				$(".itemAreaid").val("${item.areaId}");
				$(".itemAreaid").trigger("change");
			}
			
			if("${item.categoryidfirst}" !='' && "${item.categoryidfirst}" !='0'){
				$(".itemCategorysFirst").val("${item.categoryidfirst}");
				$(".itemCategorysFirst").trigger("change");
			}
			if("${item.categoryidsecond}" !='' && "${item.categoryidsecond}" !='0'){
				$(".itemCategorysSecond").val("${item.categoryidsecond}");
				$(".itemCategorysSecond").trigger("change");
			}
		});
	</script>
</body>