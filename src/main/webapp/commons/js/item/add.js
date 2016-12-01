var objSkuArray = new Array();
var bro=$.browser;
var existItemCode = 0;
var existSkuCode = 0;
var flushItemProperty = 0;
/*var propertySelectedArray = new Array();*/
/**
 * 定义一组
 */
var ObjSku = function(propertyValueIds,skuId,itemId,stoce,price,marketPrice,code,salePrice,skuWegiht){
	this.propertyValueIds = propertyValueIds;
	this.skuId=skuId;
	this.itemId =itemId;
	this.stoce =stoce;
	this.price =price;
	this.marketPrice =marketPrice;
	this.code =code;
	this.salePrice =salePrice;
	this.skuWegiht = skuWegiht;
	ObjSku.prototype.run = function(){
		return "我选的组为：propertyValueIds="+propertyValueIds+";code="+this.code + ";price="+this.price;
	};
};
/**
 * 取到listPropertyJSON数据
 */
var dataProperty;

var content_item;

$(document).ready(function(){
	
	KindEditor.ready(function(K) {
		content_item = K.create("#MyTextarea",{
				resizeType:2,
				uploadJson : path +'/imageUp',
		        fileManagerJson : path+'/imageUp',
		        allowFileManager : true,
		        items:['image','link', 'unlink','|','fontsize','forecolor','bold','italic','underline','strikethrough','removeformat','|'
				       ,'justifyleft' ,
				       'justifycenter' ,'justifyright','justifyfull']
			});
		 
	});
	
	/**
	 * 组合属性回选
	 */
	if($(".checkPropertyValueFromAction").length>0){
		
		$(".checkPropertyValueFromAction").each(function(){
			var propertyValueIds =$(this).find(".checkPropertyValueFromAction0").val();
			var skuId =$(this).find(".checkPropertyValueFromAction1").val();
			var itemId =$(this).find(".checkPropertyValueFromAction2").val();
			var skuStock =$(this).find(".checkPropertyValueFromAction3").val();
			var skuPrice =$(this).find(".checkPropertyValueFromAction4").val();
			var marketPrice =$(this).find(".checkPropertyValueFromAction5").val();
			var skuCode =$(this).find(".checkPropertyValueFromAction6").val();
			var marketPrice =$(this).find(".checkPropertyValueFromAction7").val();
			var skuWegiht =$(this).find(".checkPropertyValueFromAction8").val();
			var obj = new ObjSku(propertyValueIds,skuId,itemId,skuStock,skuPrice,marketPrice,skuCode,marketPrice,skuWegiht);
			objSkuArray.push(obj);
		});
	}
	
	/**
	 * 添加SKU组合
	 */
	$(".saveSkusButton").live("click",function(){
		var itemName=$.trim($(".itemName").val());
		if(itemName == ''){
			$("body").tip({ynclose :false,status : "error",content :"请输入商品名。",width:"280"});
			return false;
		}
		var description = $.trim($(".itemDescription").val());
		if(description == ''){
			$("body").tip({ynclose :false,status : "error",content :"请输入商品简述。",width:"280"});
			return false;
		}
		var itemCode = $.trim($(".itemCode").val());
		if(itemCode == ''){
			$("body").tip({ynclose :false,status : "error",content :"请输入商品编号。",width:"280"});
			return false;
		}else{
			if(existItemCode == 1){
				$("body").tip({ynclose :false,status : "error",content :"编号已存在。",width:"280"});
				return false;
			}
		}
		if(existSkuCode == 1){
			$("body").tip({ynclose :false,status : "error",content :"SKU已存在。",width:"280"});
			return false;
		}
		
		var itemImg0 =$(".itemImg0").attr("src");
		if(itemImg0.indexOf("pinpai")>0){
			$("body").tip({ynclose :false,status : "error",content :"请上传商品主图。",width:"280"});
			return false;
		}
		var itemPropertyIds = "";
		$(".itemPropertyValueClassOn").each(function(){
			itemPropertyIds += $(this).attr("itempropertyid")+"-";
		});
		if(itemPropertyIds ==""){
			$("body").tip({ynclose :false,status : "error",content :"请选择商品规格。",width:"280"});
			return false;
		}
		var itemBrandId = $.trim($(".itemBrandId").val());
		if(itemBrandId == ''){
			$("body").tip({ynclose :false,status : "error",content :"请选择品牌。",width:"280"});
			return false;
		}
		if($(".itemPropertyValueClassOn").length == 0 || $(".myCheckedSkus .myCheckedSkusListValue").length == 0){
			$("body").tip({ynclose :false,status : "error",content :"至少添加一组商品规格。",width:"280"});
			return false;
		}else{
			var itemPictures = "";
			$(".skuImages .nowImg").each(function(){
				var src = $(this).attr("src");
				if(src.indexOf("pinpai")>0){
					
				}else{
					itemPictures += (src+",");
				}
			});
			var data ={
					"id":$(".itemId").val(),
					"keyword":$(".itemKeyword").val(),
             		"name":itemName,
             		"image":itemImg0,
             		"areaId":$(".itemAreaid").val(),
             		"code":itemCode,
             		"brandid":itemBrandId,
             		"skuSum":$(".myCheckedSkus .myCheckedSkusListValue").length,
             		"categoryidfirst":$(".itemCategorysFirst").val(),
             		"categoryidsecond":$(".itemCategorysSecond").val(),
             		"description":description,
             		"itemPictures":itemPictures,
             		"itemPropertyIds":itemPropertyIds
             		
			};
			data["itemdetail"] = content_item.html();
			var i = 0;
			var notSuitChecked =0;
			$(".myCheckedSkusListValue").each(function(){
				var propertyValueIds =$(this).attr("propertyValueIds");
				if(propertyValueIds.substring(0,propertyValueIds.length-1).split("-").length!=$(".itemPropertyValueClassOn").length){
					$("body").tip({ynclose :false,status : "error",content :"添加的规格组合与所选规则不匹配。",width:"280"});
					$(this).find(".tab1").css("color","#ea2e49");
					notSuitChecked =1;
				}else{
					$(this).find(".tab1").css("color","#1e1e1e");
				}
				data["propertyValueIds"+i] = propertyValueIds;
				data["skuId"+i] =$(this).attr("skuId");
				data["stoce"+i] =$(this).find(".tab2 input").val();
				data["price"+i] =$(this).find(".tab5 input").val();
				data["marketPrice"+i] =$(this).find(".tab4 input").val();
				var skuCode = $.trim($(this).find(".tab6 input").val());
				if(skuCode == ''){
					$(this).find(".tab6 input").css("border","1px solid red");
					$("body").tip({ynclose :false,status : "error",content :"请输入SKU。",width:"280"});
					return false;
				}else{
					$(this).find(".tab6 input").css("border","1px solid #1e1e1e");
				}
				data["code"+i] = skuCode;
				data["salePrice"+i] =$(this).find(".tab4 input").val();
				data["skuWegiht"+i] =$(this).find(".tab3 input").val();
				data["postage"+i] =$(this).find(".tab7 .myCheckedPostage").val();
				i++;
			});
			if(notSuitChecked ==1 ){
				return false;
			}
			/*for(var i=0;i<objSkuArray.length;i++){
				data["propertyValueIds"+i] =objSkuArray[i].propertyValueIds;
				data["skuId"+i] =objSkuArray[i].skuId;
				data["stoce"+i] =objSkuArray[i].stoce;
				data["price"+i] =objSkuArray[i].price;
				data["marketPrice"+i] =objSkuArray[i].marketPrice;
				data["code"+i] =objSkuArray[i].code;
				data["salePrice"+i] =objSkuArray[i].salePrice;
				data["skuWegiht"+i] =objSkuArray[i].skuWegiht;
			}*/
			$.ajax({
				async : false,
				type : "post",
				url : path +"/item/saveItem",
				data :data,
				dataType : "json",
				success : function(data) {
					if(data.success){
						$("body").tip({ynclose : true,status : "right",content : "添加成功! "});
						location.href=path+"/item/tolist";
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
				}
			
			});
		}
	});
	
	$(".itemAreaid").on("change",function(){
		var itemAreaid = $(this).val();
		if(itemAreaid == 0){
			$(".itemCategorysFirst").val(0);
			$(".itemCategorysSecond").val(0);
		}else{
			$.ajax({
				async : false,
				type : "post",
				url : path +"/itemcategory/list",
				data : {
					"areaid":itemAreaid
				},
				dataType : "json",
				success : function(data) {
					if(data.success){
						$(".itemCategorysFirst").empty();
						$(".itemCategorysSecond").empty();
						
						$('<option value="0">选择</option>').appendTo(".itemCategorysFirst");
						for(var i=0;i<data.data.length;i++){
							$('<option value="'+data.data[i].id+'">'+data.data[i].name+'</option>').appendTo(".itemCategorysFirst");
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
				}
			});
		}
	});
	$(".itemCategorysFirst").on("change",function(){
		var itemCategorysFirstId = $(this).val();
		if(itemCategorysFirstId == 0){
			$(".itemCategorysSecond").val(0);
		}else{
			$.ajax({
				async : false,
				type : "post",
				url : path + "/itemcategory/listSecond",
				data : {
					"itemCategorysFirstId":itemCategorysFirstId
				},
				dataType : "json",
				success : function(data) {
					if(data.success){
						$(".itemCategorysSecond").empty();
						$('<option value="0">选择</option>').appendTo(".itemCategorysSecond");
						for(var i=0;i<data.data.length;i++){
							$('<option value="'+data.data[i].id+'">'+data.data[i].name+'</option>').appendTo(".itemCategorysSecond");
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
				}
			});
		}
		
		
	});
	$(".itemCategorysSecond").on("change",function(){
		var itemCategorysSecondId = $(this).val();
		if(itemCategorysSecondId == 0){
		
		}else{
			$.ajax({
				async : false,
				type : "post",
				url :  path +"/itemcategory/listProperty",
				data : {
					"itemCategorysSecondId":itemCategorysSecondId
				},
				dataType : "json",
				success : function(data) {
					var imgUrl = path+"/commons/images/sep.png";
					
					if(data.success){
						dataProperty = data;
						$(".itemPropertyList").empty();
						$(".itemPropertyValueList .itemPropertyValue").remove();
						var myCheckedSkuGuiGe = $(".itemPropertyValueList").find(".myCheckedSkuGuiGe").html();
						$(".itemPropertyValueList").find(".myCheckedSkuGuiGe").remove();
						for(var i=0;i<data.data.length;i++){
							var classId = data.data[i].id;
							/**
							 * 编辑商品回选
							 */
							var checkItemProperty = 0;
							if(flushItemProperty == 0){
								if($(".itemPropertyIds").val().indexOf(classId)>=0){
									checkItemProperty = 1;
								}
							}
							if(checkItemProperty == 1){
								/*propertySelectedArray.push(classId);*/
								$('<a style="border:1px solid #ea2e49;" itempropertyid="'+classId+'" class="itemPropertyValueClassOn itemPropertyValueClass '+classId+'" href="javascript:;">'+data.data[i].name+'<i class="checkItemPropertyValueClass"><img src="'+imgUrl+'" class = "spe"></i></a>').appendTo(".itemPropertyList");
							}else{
								$('<a  itempropertyid="'+classId+'" class="itemPropertyValueClass '+classId+'" href="javascript:;">'+data.data[i].name+'</a>').appendTo(".itemPropertyList");
							}
							
							
							for(var j=0;j<data.data[i].itemPropertyValuesSet.length;j++){
								
								if(j==0){
									var first = "";
									if(i == 0){
										first = "first";
									}else{
										
									}
									var checkItemPropertyClass = "display:none;";
									if(checkItemProperty == 1)
										checkItemPropertyClass = "display:block;";
									$('<div style="'+checkItemPropertyClass+'" class = "clearfix '+first+' itemPropertyValue"><ul class="first"><li><em>'+data.data[i].name+'<s>*</s></em></li></ul><ul class="colorval itemPropertyValue'+classId+' clearfix"></ul></div>').appendTo(".itemPropertyValueList");
									
									/*$('<div class="itemPropertyValue itemPropertyValue'+classId+'">'+
			                                '<p class="not_exceeding Select_color_top colod">'+data.data[i].name+'</span><span class="colod_span">*</p></div>').prependTo(".itemPropertyValueList")*/
			                                
								}
								$(' <li checkpropertyvalueid="'+data.data[i].itemPropertyValuesSet[j].id+'" class="checkPropertyValue"><span class="">'+data.data[i].itemPropertyValuesSet[j].value+'</span></li>').appendTo(".itemPropertyValue"+classId);
								
							}
							
						}
						$('<div class="myCheckedSkuGuiGe">'+myCheckedSkuGuiGe+'</div>').appendTo(".itemPropertyValueList");
						$(".showGuiGe").show();
						flushItemProperty =1;
						$("body").tip({ynclose : true,status : "right",content : "请选择商品规则! "});
					}else{
						$(".showGuiGe").hide();
						$("body").tip({ynclose :false,status : "error",content :data.msg,width:"280"});
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
				}
			});
		}
		
		
	});
	
	/**
	 * 选中或者取消规格
	 */
	$(".itemPropertyValueClass").live("click",function(){
		
		if ($(".myCheckedSkusListValue").length == 0) {
			/*propertySelectedArray.push($(this).attr("itempropertyid"));*/
		} else {
			$("body").tip({ynclose :false,status : "error",content :"你只能在已经选择的一组规格中添加sku，若想更改，请先删除已经添加的sku。",width:"540"});
			return false;
		}
		
		var itempropertyid = $(this).attr("itempropertyid");
		
		var imgUrl = path+"/commons/images/sep.png";
		if($(this).find(".checkItemPropertyValueClass").length>0){
			$(this).css("border","1px solid #c4c4c4");
			$(this).find(".checkItemPropertyValueClass").remove();
			$(this).removeClass("itemPropertyValueClassOn");
			
			$(".itemPropertyValue"+itempropertyid).parents(".itemPropertyValue:eq(0)").hide();
		}else{
			$(".itemPropertyValue"+itempropertyid).parents(".itemPropertyValue:eq(0)").show();
			
			$(this).css("border","1px solid #ea2e49");
			$(this).addClass("itemPropertyValueClassOn");
			$('<i class="checkItemPropertyValueClass"><img src="'+imgUrl+'" class = "spe"></i>').appendTo(this);
		}
	});
	$(".checkPropertyValue").live("click",function(){
		
		$(this).parents(".itemPropertyValue:eq(0)").find(".checkPropertyValue").removeClass("checkPropertyValueYes");
		$(this).parents(".itemPropertyValue:eq(0)").find(".checkPropertyValue").removeClass("on");
		$(this).parents(".itemPropertyValue:eq(0)").find(".checkPropertyValue").find(".checkPropertyValueYesImg").remove();
		$(this).addClass("checkPropertyValueYes");
		$(this).addClass("on");
		var imgUrl = path+"/commons/images/sep.png";
		$('<i class="checkPropertyValueYesImg"><img src="'+imgUrl+'" class = "spe"></i>').appendTo(this);
		/**
		 * 组合属性值赋值
		 */
		var allGuiGe="";
		var propertyValueIds="";
		for(var i=0;i<$(".checkPropertyValueYes").length;i++){
			var pid = ($('.checkPropertyValueYes:eq('+i+')').attr("checkpropertyvalueid"));
			propertyValueIds += pid;
			propertyValueIds += "-";
			allGuiGe += ($('.checkPropertyValueYes:eq('+i+')').find("span").html()+"\\");
		}
		$(".allGuiGe").html(allGuiGe);
		for(var i=0;i<objSkuArray.length;i++){
		    if(objSkuArray[i].propertyValueIds == propertyValueIds){
		    	this.propertyValueIds = propertyValueIds;
		    	this.skuId=skuId;
		    	this.itemId =itemId;
		    	this.stoce =stoce;
		    	this.price =price;
		    	this.marketPrice =marketPrice;
		    	this.code =code;
		    	this.salePrice =salePrice;
		    	this.skuWegiht = skuWegiht;
		    	
		    	$(".skuStock").val(objSkuArray[i].stoce );
				$(".skuPrice").val(objSkuArray[i].price );
				$(".skuWegiht").val(objSkuArray[i].skuWegiht);
				
				$(".skuCode").val(objSkuArray[i].code);
				$(".marketPrice").val(objSkuArray[i].marketPrice);
		    }
		    	
		}
		
	});
	/**
	 * 删除组合
	 */
	$(".deleteGroupPropertyValue").live("click",function(){
		
		if($(".checkPropertyValueYes").length< dataProperty.data.length){
			$("body").tip({ynclose :false,status : "error",content :"请选择一组商品规格再删除。",width:"280"});
			return false;
		}else{
			
			var propertyValueIds = "";
			var skuId="";
			var itemId = $(".itemId").val();
			
			for(var i=0;i<$(".checkPropertyValueYes").length;i++){
				var pid = ($('.checkPropertyValueYes:eq('+i+')').attr("checkpropertyvalueid"));
				propertyValueIds += pid;
				propertyValueIds += "-";
			}
			for(var i=0;i<objSkuArray.length;i++){
			    if(objSkuArray[i].propertyValueIds == propertyValueIds)
			    	objSkuArray.splice(i,1);
			}
			$("body").tip({ynclose : true,status : "right",content : "删除成功! "});
		}
	})
	/**
	 * 选择属性组合
	 */
	$(".addGroupPropertyValue").live("click",function(){
	/*	console.log(propertySelectedArray);*/
		
		var itemPropertyValueClassOnLength = $(".itemPropertyValueClassOn").length;
		if($(".checkPropertyValueYes").length< itemPropertyValueClassOnLength){
		//if($(".checkPropertyValueYes").length< dataProperty.data.length){
			$("body").tip({ynclose :false,status : "error",content :"请选择一组商品规格再添加。",width:"280"});
			return false;
		}else{
			
			var propertyValueIds = "";
			var skuId;
			var itemId = $(".itemId").val();
			
			for(var i=0;i<$(".checkPropertyValueYes").length;i++){
				var pid = ($('.checkPropertyValueYes:eq('+i+')').attr("checkpropertyvalueid"));
				propertyValueIds += pid;
				propertyValueIds += "-";
			}
			for(var i=0;i<objSkuArray.length;i++){
			    if(objSkuArray[i].propertyValueIds == propertyValueIds){
			    	if(objSkuArray[i].skuId != null && objSkuArray[i].skuId !=''){
			    		skuId = objSkuArray[i].skuId;
			    	}
			    	objSkuArray.splice(i,1);
			    }
			    	
			}
			
			var skuStock = $(".skuStock:eq(0)").val();
			var skuPrice = $(".skuPrice:eq(0)").val();
			var skuWegiht = $(".skuWegiht:eq(0)").val();
			var skuStock = $(".skuStock:eq(0)").val();
			var skuCode = $(".skuCode").val();
			var marketPrice = $(".skuMarketPrice").val();
			var postage = $(".postage").val();
			/*if(skuStock == 0){
				$("body").tip({ynclose :false,status : "error",content :"库存不能为0。",width:"280"});
				return false;
			}else{*/
				var obj = new ObjSku(propertyValueIds,skuId,itemId,skuStock,skuPrice,marketPrice,skuCode,marketPrice,skuWegiht);
				objSkuArray.push(obj);
				
				/**
				 * 打印数据
				 
				for(var i=0;i<objSkuArray.length;i++){
				    
				    	alert(objSkuArray[i].run());
				}*/
				var postageHtml = '<select class="postage"><option value="0" selected="selected">全国包邮</option><option value="1">运费自结算</option></select>';
				if(postage == 1){
					postageHtml = '<select class="postage"><option value="0">全国包邮</option><option value="1" selected="selected">运费自结算</option></select>';
				}
				if($("."+propertyValueIds).length>0){
					$("."+propertyValueIds).empty();
					$('<td class = "tab1">'+$(".allGuiGe").html()+'</td>'+
							'<td class = "tab2"><input type = "text" onkeyup="this.value=this.value.replace(/\D/g,\'\')" value="'+skuStock+'"></td>'+
							'<td class = "tab3"><input class="vfloat" type = "text" value="'+skuWegiht+'">kg</td>'+
							'<td class = "tab4"><input class="vfloat" type = "text" value="'+marketPrice+'"></td>'+
							'<td class = "tab5"><input class="vfloat" type = "text" value="'+skuPrice+'"></td>'+
							'<td class = "tab6"><input type = "text" class = "sku mySkuList" value="'+skuCode+'" ></td>'+
							'<td class = "tab7">'+postageHtml+'<a class = "red_btn deleteCheckedSku">删除</a></td>').appendTo("."+propertyValueIds);
				}else{
					var redirectWrite = $(".myCheckedSkus").find(".redirectWrite").html();
					$(".redirectWrite").remove();
					
					$('<tr skuId="" propertyValueIds="'+propertyValueIds+'"  class="myCheckedSkusListValue '+propertyValueIds+'"><td class = "tab1">'+$(".allGuiGe").html()+'</td>'+
							'<td class = "tab2"><input type = "text" onkeyup="this.value=this.value.replace(/\D/g,\'\')" value="'+skuStock+'"></td>'+
							'<td class = "tab3"><input class="vfloat" type = "text" value="'+skuWegiht+'">kg</td>'+
							'<td class = "tab4"><input class="vfloat" type = "text" value="'+marketPrice+'"></td>'+
							'<td class = "tab5"><input class="vfloat" type = "text" value="'+skuPrice+'"></td>'+
							'<td class = "tab6"><input type = "text" class = "sku mySkuList" value="'+skuCode+'" ></td>'+
							'<td class = "tab7">'+postageHtml+'<a class = "red_btn deleteCheckedSku">删除</a></td></tr>').appendTo(".myCheckedSkus");
					$('<tr class = "last_data redirectWrite">'+redirectWrite+'</tr>').appendTo(".myCheckedSkus");
				}
				
				$("body").tip({ynclose : true,status : "right",content : "添加成功! "});
				/*$(".itemPropertyList a").each(function(index, element) {
					propertySelectedArray.push($(element).attr("itempropertyid"));
				}); */
				
		}
	});
	
	$("#updateImgButton,#updateImgButtonTop2").live("change",function(){
		uploadImage($(this).attr("id"), function(url) {
			$(".itemImg0").attr("src", url);
			$(".itemImage").val(url);
		},1);
	});
	$(".updateImgButton,.updateImgButton0").live("change",function(){
		var icount = $(this).attr("icount");
		uploadImage($(this).attr("id"), function(url) {
			if(icount == 0){
				var flag = 0;
				$(".skuImages .nowImg").each(function(){
					if($(this).attr("src").indexOf("pinpai")>0){
						$(this).attr("src", url);
						flag++;
						return false;
					}
				});
				if(flag == 0){
					$(".skuImages .nowImg:eq("+skuImagesCount+")").attr("src", url);
					skuImagesCount ++;
					if(skuImagesCount>4)
						skuImagesCount =0;
				}
			}else{
				$("#updateImgButton"+icount).parents(".imgwChange:eq(0)").find(".nowImg").attr("src", url);
			}
			
		},1);
	});
	$(".vfloat").live("keyup",function(){
		var v = $(this).val();
		var reg = /^[0-9]+.?[0-9]{0,2}$/;//用来验证数字，包括小数的正则
		if(!reg.test(v)){
			$("body").tip({ynclose :true,status : "error",content :"请输入整数或者保留两位小数！",width:"280"});
			$(this).val(0);
		}else{
			
		}
	});
	$(".addVALl").live("click",function(){
		$(".myCheckedSkusListValue").each(function(){
			$(this).find(".tab2 input").val($(".stockAll").val());
			$(this).find(".tab5 input").val($(".priceAll").val());
			$(this).find(".tab3 input").val($(".weightAll").val());
		});
	});
	$(".MyTextareaUploadImg").live("click",function(){
		$(".ke-icon-image").click();
	});
	$(".deleteCheckedSku").live("click",function(){
		if(confirm("确定删除吗？"))
			$(this).parents(".myCheckedSkusListValue:eq(0)").remove();
	});
	$(".delNowImg").live("click",function(){
		$(this).parents(".imgwChange:eq(0)").find(".nowImg").attr("src",path+"/commons/images/pinpai.png");
	});
	
	$(".mySkuList,.skuCode").live("blur",function(){
		var itemCode = $.trim($(this).val());
		var skuId = $(this).parents("tr:eq(0)").attr("skuid");
		if(itemCode == ''){
			$("body").tip({ynclose :false,status : "error",content :"SKU不能为空。",width:"280"});
			return false;
		}
		var flag = 0;
		$(".myCheckedSkusListValue").each(function(){
			var skuCode = $.trim($(this).find(".tab6 input").val());
			if(skuCode == itemCode)
				flag ++;
		});
		if( $(this).hasClass("mySkuList")&&flag>1){
			existSkuCode = 1;
			$("body").tip({ynclose :false,status : "error",content :"SKU不能输入相同值。",width:"280"});
			return false;
		}
		if(($(this).hasClass("skuCode"))&&flag>=1){
			$("body").tip({ynclose :false,status : "error",content :"SKU不能输入相同值。",width:"280"});
			return false;
		}
		$.ajax({
			async : false,
			type : "post",
			url : path +"/item/skuExsitCode",
			data :{
				"code":itemCode,
				"id":skuId
			},
			dataType : "json",
			success : function(data) {
				if(data.success){
					existSkuCode = 0;
					$("body").tip({ynclose : true,status : "right",content : "SKU正确! "});
				}else{
					existSkuCode = 1;
					$("body").tip({ynclose :false,status : "error",content :"SKU已存在。",width:"280"});
					return false;
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
			}
		
		});
	});
	$(".itemCode").live("blur",function(){
		var itemCode = $.trim($(this).val());
		if(itemCode == ''){
			$("body").tip({ynclose :false,status : "error",content :"编号不能为空。",width:"280"});
			return false;
		}
		
		$.ajax({
			async : false,
			type : "post",
			url : path +"/item/itemExsitCode",
			data :{
				"code":itemCode,
				"id":$(".itemId").val()
			},
			dataType : "json",
			success : function(data) {
				if(data.success){
					existItemCode = 0;
					$("body").tip({ynclose : true,status : "right",content : "编号正确! "});
				}else{
					existItemCode = 1;
					$("body").tip({ynclose :false,status : "error",content :"编号已存在。",width:"280"});
					return false;
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$("body").tip({ynclose :false,status : "error",content :"网络错误",width:"280"});
			}
		
		});
	});
});
var skuImagesCount = 0;