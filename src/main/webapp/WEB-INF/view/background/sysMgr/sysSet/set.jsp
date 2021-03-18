<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="../../js.jsp"%>
<script type="text/javascript">
var path='<%=basePath %>';
var bgPath='<%=basePath%>'+"background/";
$(function(){
	$("#xxsqyszc_div").css("width",setFitWidthInParent("body")+"px");
});

function openEditXxsqDialog(flag){
	$("#xxsqBg_div").css("display",flag==1?"block":"none");
}

function checkEditXxsqInfo(){
	if(checkXxsq()){
		var grxxsq=$("#grxxsq").val();
		$.post(bgPath+"editSystemInfo",
			{grxxsq:grxxsq},
			function(data){
				if(data.message=="ok"){
					alert(data.info);
					location.href=location.href;
				}
				else
					alert(data.info);
			}
		,"json");
	}
}

function focusXxsq(){
	var grxxsq = $("#grxxsq").val();
	if(grxxsq=="信息授权不能为空"){
		$("#grxxsq").val("");
		$("#grxxsq").css("color", "#555555");
	}
}

//验证信息授权
function checkXxsq(){
	var grxxsq = $("#grxxsq").val();
	if(grxxsq==null||grxxsq==""||grxxsq=="信息授权不能为空"){
		$("#grxxsq").css("color","#E15748");
    	$("#grxxsq").val("信息授权不能为空");
    	return false;
	}
	else
		return true;
}
	
function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-310;
}
</script>
<style type="text/css">
.xxsqBg_div{
	width: 100%;height:100%;
	background: rgba(0,0,0,0.65);
	position: fixed;
	display: none;
	z-index: 1001;
}
.xxsq_div{
	width:500px;height:400px;margin:100px auto;background: #f8f8f8;border-radius: 6px;
}
.xxsq_div .title{
	font-size: 22px;color: #4CAF50;text-align: center;padding-top: 20px;
}
.xxsq_div .content_div{
	width:450px;height:260px;margin:20px auto 0;
}
.xxsq_div textarea{
	width: 100%;height:100%;border: 1px solid #DDE0E2;
}
.xxsq_div .but_div{
	width:168px;margin: auto;padding-top: 20px;
}
.xxsq_div .but{
	width: 76px;padding: 5px 10px;font-size: 14px;border: 1px solid #d9d9d9;border-radius: 4px;cursor: pointer;
}
.xxsq_div .cancel_but{
	color: #323232;background: #FFF;
}
.xxsq_div .submit_but{
	color: #FFF;background: #4CAF52;margin-left: 12px;
}
</style>
</head>
<body>
<div class="xxsqBg_div" id="xxsqBg_div">
	<div class="xxsq_div">
		<h4 class="title">信息授权</h4>
		<div class="content_div">
			<textarea rows="10" cols="30" id="grxxsq"></textarea>
		</div>
		<div class="but_div">
			<button class="but cancel_but" onclick="openEditXxsqDialog(0)">取消</button>
			<button class="but submit_but" onclick="checkEditXxsqInfo()">提交</button>
		</div>
	</div>
</div>
		
<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div id="xxsqyszc_div" style="height:370px;margin-top:20px;margin-left: 238px;padding-top:40px;padding-left:40px;background-color:#FAFDFE;">
		<div style="font-size: 20px;color: #373737;font-weight:700;">信息授权与隐私政策设置</div>
		<div style="margin-top:40px;">
			<div style="font-size: 15px;color: #373737;font-weight: 700;">信&nbsp;&nbsp;息&nbsp;&nbsp;&nbsp;授&nbsp;&nbsp;权</div>
			<div style="margin-top:10px;font-size: 15px;">${requestScope.systemInfo.grxxsq }</div>
		</div>
		<div style="margin-top:40px;">
			<span style="font-size: 15px;color: #357bb3;cursor: pointer;" onclick="openEditXxsqDialog(1)">修改信息授权</span>
		</div>
	</div>
	<%@include file="../../foot.jsp"%>
</div>
</body>
</html>