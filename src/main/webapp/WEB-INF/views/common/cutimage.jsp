<%@page import="com.alibaba.fastjson.JSON"%>
<%@page import="com.yhmall.system.po.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}/commons/css/jcrop.css">
<link rel="stylesheet" href="${path}/commons/css/jquery.Jcrop.css">
<script type="text/javascript" src="${path}/commons/js/common/jquery.Jcrop.js"></script>
<style>
.jc-demo-box{min-width: 400px;}
.container{
	left: 50%;
    margin: -155px 0 0 -195px;
    position: absolute;
    top: 50%;
    z-index: 99;
}
#cancelUploadImg,#nocutImgButton,#cutImgButton{margin:5px;float: right;}
</style>
<div class="container" id="cutImageBox" style="display: none;">
 <div class="inline-labels" style="display: none;">
    <label>X1 <input type="text" size="4" id="x1" name="x1" /></label>
    <label>Y1 <input type="text" size="4" id="y1" name="y1" /></label>
    <label>X2 <input type="text" size="4" id="x2" name="x2" /></label>
    <label>Y2 <input type="text" size="4" id="y2" name="y2" /></label>
    <label>W <input type="text" size="4" id="w" name="w" /></label>
    <label>H <input type="text" size="4" id="h" name="h" /></label>
    </div>
<div class="row">
<div class="span12">
<div class="jc-demo-box">
  <img src="" id="target" class="sourcePath" alt="[Jcrop Example]" />
   <a class = "redBtn sureBtn" id="cutImgButton">裁剪保存</a>&nbsp;&nbsp;<a class = "redBtn" id="nocutImgButton">直接保存</a>&nbsp;&nbsp;<a class = "redBtn sureBtn" id="cancelUploadImg">取消</a>&nbsp;&nbsp;
</div>

</div>
</div>
</div>