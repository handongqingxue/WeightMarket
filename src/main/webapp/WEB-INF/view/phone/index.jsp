<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
	+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" href="<%=basePath %>resource/css/phone/index.css"/>
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
var path='<%=basePath %>';
var gpuInterval,zxcykhInterval;
$(function(){
	//setInterval("moveGPUItemDiv()","3000");
	//setInterval("moveZXCYKHItemDiv()","3000");
	initGPUListDiv();
});

function initGPUListDiv(){
	$.post("selectGetPriceUserList",
		{deal:false},
		function(result){
			var gpuListDiv=$("#gpu_list_div");
			gpuListDiv.empty();
			if(result.message=="ok"){
				var gpuList=result.data;
				for(var i=0;i<gpuList.length;i++){
					var gpu=gpuList[i];
					var appendStr="";
						appendStr+="<div class=\"item_div\">";
						appendStr+="<img class=\"call_img\" src=\""+path+"resource/image/001.png\"/>";
						appendStr+="<div class=\"userName1_div\">"+gpu.xhUserName+"</div>";
						appendStr+="<div class=\"phone1_div\">"+gpu.xhPhone+"</div>";
						appendStr+="<div class=\"time_div\">"+gpu.timeAgo+"</div>";
						appendStr+="</div>";
					gpuListDiv.append(appendStr);
				}
			}
		}
	,"json");
}

function showXXSQYSZCDiv(show){
	$("#xxsqyszc_bg_div").css("display",show?"block":"none");
}

//将获取报价客户列表里的第一项移动到最后一项，实现列表刷新
function refreshGPU(){
	var gpuListDiv=$("#gpu_list_div");
	var itemDiv=gpuListDiv.find(".item_div").eq(0);
	gpuListDiv.append(itemDiv);
}

//将最新参与客户列表里的第一项移动到最后一项，实现列表刷新
function refreshZXCYKH(){
	var zxcykhListDiv=$("#zxcykh_list_div");
	var itemDiv=zxcykhListDiv.find(".item_div").eq(0);
	zxcykhListDiv.append(itemDiv);
}

function moveGPUItemDiv(){
	var gpuListDiv=$("#gpu_list_div");
	var itemDiv=gpuListDiv.find(".item_div").eq(0);
	gpuInterval=setInterval(function(){
		var marginTop=itemDiv.css("margin-top");
		marginTop=marginTop.substring(0,marginTop.length-2);
		//console.log(marginTop);
		marginTop--;
		itemDiv.css("margin-top",marginTop+"px");
		if(marginTop<=-33){
			clearInterval(gpuInterval);
			refreshGPU();
			itemDiv.css("margin-top","0px");
		}
	},"10");
}

//将最新参与客户列表里的某一项向上移动
function moveZXCYKHItemDiv(){
	var zxcykhListDiv=$("#zxcykh_list_div");
	var itemDiv=zxcykhListDiv.find(".item_div").eq(0);
	zxcykhInterval=setInterval(function(){
		var marginTop=itemDiv.css("margin-top");
		marginTop=marginTop.substring(0,marginTop.length-2);
		//console.log(marginTop);
		marginTop--;
		itemDiv.css("margin-top",marginTop+"px");
		if(marginTop<=-33){
			clearInterval(zxcykhInterval);
			refreshZXCYKH();
			itemDiv.css("margin-top","0px");
		}
	},"10");
}

function checkGetPriceUserInfo(){
	if(checkGetPriceUserName()){
		if(checkGetPricePhone()){
			if(checkProductNeedId()){
				addGetPriceUser();
			}
		}
	}
}

function addGetPriceUser(){
	var userName=$("#get_price_div #userName").val();
	var phone=$("#get_price_div #phone").val();
	var radChecked=$("input[id^='pn_rad']:checked");
	var radId=radChecked.attr("id");
	var pnId=radId.substring(6,radId.length);
	$.post("addGetPriceUser",
		{userName:userName,phone:phone,pnId:pnId},
		function(result){
			showAGPUWarnDiv(result.status==1?true:false,result.msg);
		}
	,"json");
}

function checkGetPriceUserName(){
	var userName=$("#get_price_div #userName").val();
	if(userName==null||userName==""){
		showUserNameWarnDiv(true);
    	return false;
	}
	else
		return true;
}

function checkGetPricePhone(){
	var phone=$("#get_price_div #phone").val();
	if(phone==null||phone==""){
		showPhoneWarnDiv(true);
    	return false;
	}
	else
		return true;
}

function checkProductNeedId(){
	var radChecked=$("input[id^='pn_rad']:checked");
	if(radChecked.length==0){
		showPNWarnDiv(true);
    	return false;
	}
	else{
		return true;
	}
}

function showUserNameWarnDiv(show){
	if(show){
		$("#userName_warn_bg_div").css("display","block");
		setTimeout("showUserNameWarnDiv(false)","3000");
	}
	else{
		$("#userName_warn_bg_div").css("display","none");
	}
}

function showPhoneWarnDiv(show){
	if(show){
		$("#phone_warn_bg_div").css("display","block");
		setTimeout("showPhoneWarnDiv(false)","3000");
	}
	else{
		$("#phone_warn_bg_div").css("display","none");
	}
}

function showPNWarnDiv(show){
	if(show){
		$("#pn_warn_bg_div").css("display","block");
		setTimeout("showPNWarnDiv(false)","3000");
	}
	else{
		$("#pn_warn_bg_div").css("display","none");
	}
}

function showAGPUWarnDiv(show,msg){
	if(show){
		$("#agpu_warn_bg_div").css("display","block");
		$("#agpu_warn_div").text(msg);
		setTimeout("showAGPUWarnDiv(false)","3000");
	}
	else{
		$("#agpu_warn_bg_div").css("display","none");
		$("#agpu_warn_div").text("");
	}
}
</script>
<title>营销页面</title>
<style>

</style>
</head>
<body>
<div class="userName_warn_bg_div" id="userName_warn_bg_div">
	<div class="warn_div userName_warn_div">请输入姓名</div>
</div>
<div class="phone_warn_bg_div" id="phone_warn_bg_div">
	<div class="warn_div phone_warn_div">请输入手机号</div>
</div>
<div class="pn_warn_bg_div" id="pn_warn_bg_div">
	<div class="warn_div pn_warn_div">请选择产品需求</div>
</div>
<div class="agpu_warn_bg_div" id="agpu_warn_bg_div">
	<div class="warn_div agpu_warn_div" id="agpu_warn_div"></div>
</div>
<div class="xxsqyszc_bg_div" id="xxsqyszc_bg_div">
	<div class="xxsqyszc_div">
		<div class="title_div">个人信息授权与隐私政策<span class="close_span" onclick="showXXSQYSZCDiv(false)">X</span></div>
		<div class="content_div">
尊敬的用户，您选择使用“自动输入历史信息”功能，您同意本平台在法律允许的范围内，收集您输入的信息，您已知晓并同意在您浏览使用本平台建站服务搭建的页面时， 我们会帮您预先填写上次输入的历史信息，您的历史信息仅用于页面的预填充，且只有您点击提交按钮之后信息才会传递给商家使用。 本平台非常重视用户信息的保护，详见 <a class="yszc_a">《隐私政策》</a>
		</div>
	</div>
</div>

<img class="logo_img" src="<%=basePath %>resource/image/b91440230303c04be46f77ac31bbb390.jpg"/>
<a href="tel:15712773653">
	<div class="tel_div">
		<img class="tel_img" src="<%=basePath %>resource/image/202103100002.png"/>
		<div class="text_div">电话</div>
	</div>
</a>
<div class="get_price_div" id="get_price_div">
	<div class="title_div">青岛市福利，立即获取报价</div>
	<div class="user_count_div">已有<span class="user_count_span">100</span>人获取了产品价格</div>
	<div class="userName_div">
		<span class="userName_span">姓名</span><span class="biTian_span">*</span>
		<div class="un_inp_div">
			<input class="userName_inp" id="userName" type="text" placeholder="请输入姓名"/>
		</div>
	</div>
	<div class="phone_div">
		<span class="phone_span">电话</span><span class="biTian_span">*</span>
		<div class="phone_inp_div">
			<input class="phone_inp" id="phone" type="text" placeholder="请输入手机号"/>
		</div>
	</div>
	<div class="product_need_div">
		<div class="pn_text_span">产品需求<span class="biTian_span">*</span></div>
		<div class="list_div">
			<div class="item_div">
				<input type="radio" name="pn" id="pn_rad1"/>
				<span>无人值守地磅称重系统</span>
			</div>
			<div class="item_div">
				<input type="radio" name="pn" id="pn_rad2"/>
				<span>无人值守地磅称重系统</span>
			</div>
			<div class="item_div">
				<input type="radio" name="pn" id="pn_rad3"/>
				<span>无人值守地磅称重系统</span>
			</div>
			<div class="item_div">
				<input type="radio" name="pn" id="pn_rad4"/>
				<span>无人值守地磅称重系统</span>
			</div>
			<div class="item_div">
				<input type="radio" name="pn" id="pn_rad5"/>
				<span>无人值守地磅称重系统</span>
			</div>
		</div>
		<div class="zdsrlsxx_div">
			<input type="checkbox"/>
			<span class="zdsrlsxx_span">自动输入历史信息</span>
			<span class="xxsqyszc_span" onclick="showXXSQYSZCDiv(true)">《个人信息授权与隐私政策》</span>
		</div>
		<div class="get_price_but_div" onclick="checkGetPriceUserInfo()">立即获取报价</div>
	</div>
</div>
<div class="gpu_list_div" id="gpu_list_div">
	<!-- 
	<div class="item_div">
		<img class="call_img" src="<%=basePath %>resource/image/001.png"/>
		<div class="userName1_div">李**</div>
		<div class="phone1_div">136******26</div>
		<div class="time_div">1天前</div>
	</div>
	 -->
</div>
<video style="width:100%;" controls="" preload="none"  x5-playsinline="" playsinline="" webkit-playsinline="" poster="<%=basePath %>resource/image/202011240038.png">
	<source src="<%=basePath %>resource/video/202011240037.mp4"></source>
</video>
<img class="sfhydyxnt_img" src="<%=basePath %>resource/image/d06cdcf93c2e042fb6fe48ae989f292c.jpg"/>
<div style="background-color:#035CAF;width:100%;height:50px;line-height:50px;color:#fff;text-align:center;font-size:20px;">辰麒帮您解决所有问题</div>
<img class="xtys_img" src="<%=basePath %>resource/image/96f18448915071b9fe4d49bf318b0a6e.jpg@q_80.jpg"/>
<div class="cpzlqq_div">
	<div class="title_div">16种系列  产品种类齐全</div>
	<div class="ytj_div">已提交了<span class="ytj_span">100</span>人</div>
	<div class="userName_div">
		<input class="userName_inp" placeholder="请输入姓名(必填)"/>
	</div>
	<div class="phone_div">
		<input class="phone_inp" placeholder="请输入手机号(必填)"/>
	</div>
	<div class="submit_but_div">提交</div>
</div>
<div class="zxcykh_div">
	<div class="title_div">最新参与客户</div>
	<div class="list_div" id="zxcykh_list_div">
		<div class="item_div">
			<img class="call_img" src="<%=basePath %>resource/image/001.png"/>
			<div class="userName1_div">李**</div>
			<div class="password_div">136******26</div>
			<div class="time_div">1天前</div>
		</div>
		<div class="item_div">
			<img class="call_img" src="<%=basePath %>resource/image/001.png"/>
			<div class="userName1_div">于**</div>
			<div class="password_div">187******28</div>
			<div class="time_div">2天前</div>
		</div>
		<div class="item_div">
			<img class="call_img" src="<%=basePath %>resource/image/001.png"/>
			<div class="userName1_div">燕**</div>
			<div class="password_div">135******62</div>
			<div class="time_div">3天前</div>
		</div>
		<div class="item_div">
			<img class="call_img" src="<%=basePath %>resource/image/001.png"/>
			<div class="userName1_div">彭**</div>
			<div class="password_div">133******38</div>
			<div class="time_div">4天前</div>
		</div>
	</div>
</div>
<div class="alzs_div">
	<div class="title_div">案例展示</div>
	<div class="desc_div">集众人智慧，聚众人合力</div>
	<div class="list_div">
		<div class="item_div">
			<img class="alzs_img" src="<%=basePath %>resource/image/202103100003.png"/>
			<div class="text_div">索通发展有限公司</div>
		</div>
		<div class="item_div qiLi_div">
			<img class="alzs_img" src="<%=basePath %>resource/image/202103100004.png"/>
			<div class="text_div">齐力碳素有限公司</div>
		</div>
		<div class="item_div chuangXin_div">
			<img class="alzs_img" src="<%=basePath %>resource/image/202103100005.png"/>
			<div class="text_div">创新碳素有限公司</div>
		</div>
		<div class="item_div qiTa_div">
			<img class="alzs_img" src="<%=basePath %>resource/image/202103100006.png"/>
			<div class="text_div">其他</div>
		</div>
	</div>
</div>
<div class="lxwm_div">
	<div class="title_div">联系我们</div>
	<div class="desc_div">集众人智慧，聚众人合力</div>
	<div class="lxxx_div">
		<div class="gsmc_div">公司名称：青岛华凌科技有限公司</div>
		<div class="lxdh_div">联系电话：15712773653（微信同号）</div>
		<div class="lxdz_div">联系地址：山东省青岛市黄岛区双珠路288号东方金石大厦8F</div>
	</div>
</div>
<div class="qdhlkjyxgs_div">青岛华凌科技有限公司</div>
</body>
</html>