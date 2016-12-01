//字符串过滤
function stringFilter(str) {
       str=str.replace( new RegExp("[%`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）&;—|{}【】‘；：”“'。，、？]" ,"g" ),'' );
        return str;
}

//手机号校验
function isMobile(mobile){
	if (null === mobile || "" === mobile) {
		return false;
	} else {
		var reg = /^0?(13[0-9]|14[57]|15[012356789]|17[0678]|18[0-9])[0-9]{8}$/;
		if (!reg.test(mobile)) {
			return false;
		} else {
			return true;
		}
	}
}

function isPostCode(obj){
	if(null==obj || obj.length==0 ){
		return false;  
	}
    var re= /^[0-9][0-9]{5}$/;
    if(re.test(obj)){
    	return true;
    }else{
    	return false; 
    }	
}   



