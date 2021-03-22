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
var gpuSmInterval,gpuMmtInterval,zxcykhMmtInterval;
//以下这块代码是防止打开其他窗口时，定时器仍在运行导致滚字幕加速。打开其他窗口时，必须暂停计时器，等切换回来再启动计时器
//参考链接：https://www.imooc.com/article/39384?block_id=tuijian_wz
document.onvisibilitychange=function(){   
	if(document.visibilityState=="visible"){//启动计时器
		gpuSmInterval=setInterval("moveGPUItemDiv()","3000");
	}
	else{//停止计时器
		clearInterval(gpuSmInterval);
	} 
}

$(function(){
	gpuSmInterval=setInterval("moveGPUItemDiv()","3000");
	initPnListDiv();
	initGPUListDiv();
	initAlzsListDiv();
	initSystemInfo();
	setTimeout("showNewBridge(false)","1000");//一开始隐藏百度商桥，等点击在线咨询后才显示。因为百度商桥是延迟加载的，必须等一秒后才隐藏
});

function initPnListDiv(){
	$.post("selectProdNeedList",
		function(result){
			var pnListDiv=$("#pn_list_div");
			pnListDiv.empty();
			if(result.message=="ok"){
				var pnList=result.data;
				var pnLength=pnList.length;
				for(var i=0;i<pnLength;i++){
					var pn=pnList[i];
					var appendStr="<div class=\"item_div\">";
						appendStr+="<input type=\"radio\" name=\"pn\" id=\"pn_rad"+pn.id+"\"/>";
						appendStr+="<span>"+pn.name+"</span>";
						appendStr+="</div>";
					pnListDiv.append(appendStr);
				}
			}
		}
	,"json");
}

function initGPUListDiv(){
	$.post("selectGetPriceUserList",
		{deal:false},
		function(result){
			var gpuListDiv=$("#gpu_list_div");
			gpuListDiv.empty();
			if(result.message=="ok"){
				var gpuList=result.data;
				var gpuLength=gpuList.length;
				$("#get_price_div #user_count_span").text(gpuLength);
				for(var i=0;i<gpuLength;i++){
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
			else{
				$("#get_price_div #user_count_span").text(0);
			}
		}
	,"json");
}

function initAlzsListDiv(){
	$.post("selectExampleShowList",
		function(result){
			var alzsListDiv=$("#alzs_list_div");
			alzsListDiv.empty();
			if(result.message=="ok"){
				var marginTop;
				var marginLeft;
				var esList=result.data;
				for(var i=0;i<esList.length;i++){
					if(i==0){
						marginTop=0;
						marginLeft=0;
					}
					else if(i%2==1){
						marginTop=-130;
						marginLeft=170;
					}
					else if(i%2==0){
						marginTop=23;
						marginLeft=0;
					}
					var es=esList[i];
					var appendStr="<div class=\"item_div\" style=\"margin-top:"+marginTop+"px;margin-left:"+marginLeft+"px;\">";
						appendStr+="<img class=\"alzs_img\" src=\""+es.imgUrl+"\"/>";
						appendStr+="<div class=\"text_div\">"+es.name+"</div>";
						appendStr+="</div>";
					alzsListDiv.append(appendStr);
				}
			}
		}
	,"json");
}

function initSystemInfo(){
	$.post("getSystemInfo",
		function(data){
			if(data.message=="ok"){
				var systemInfo=data.systemInfo;
				$("#xxsqyszc_div #content_div").html(systemInfo.grxxsq+"<a class=\"yszc_a\" href=\"goSecretPolicy\">《隐私政策》</a>");
				$("#gsmc_div").text("公司名称："+systemInfo.companyName);
				$("#lxdh1_div").text("联系电话："+systemInfo.contactTel1);
				$("#lxdh2_div").text(systemInfo.contactTel2);
				$("#lxdz_div").text("联系地址："+systemInfo.contactAddress);
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

function moveGPUItemDiv(){
	var gpuListDiv=$("#gpu_list_div");
	var itemDiv=gpuListDiv.find(".item_div").eq(0);
	gpuMmtInterval=setInterval(function(){
		var marginTop=itemDiv.css("margin-top");
		marginTop=marginTop.substring(0,marginTop.length-2);
		//console.log(marginTop);
		marginTop--;
		itemDiv.css("margin-top",marginTop+"px");
		if(marginTop<=-33){
			clearInterval(gpuMmtInterval);
			refreshGPU();
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

function showNewBridge(show){
	$("#newBridge").css("display",show?"block":"none");
}

var _hmt = _hmt || [];
(function() {
	var hm = document.createElement('script');
	hm.src = '//hm.baidu.com/hm.js?2d58e7ee2c6bd4eb74b0893c5a3a92a4';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(hm, s);
})();

function openChatDialog(){
	//https://blog.csdn.net/p445098355/article/details/104272962
    var system ={};  
	var p = navigator.platform;       
	system.win = p.indexOf("Win") == 0;  
	system.mac = p.indexOf("Mac") == 0;  
	system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);     
	if(system.win||system.mac||system.xll){//如果是电脑跳转到
	   $("ins[data-id='313568']").click();
	}
	else{//如果是手机,跳转到
	   $("ins[id='nb_invite_ok']").click();
	}
}
</script>
<title>辰麒智能门禁称重系统</title>
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
	<div class="xxsqyszc_div" id="xxsqyszc_div">
		<div class="title_div">个人信息授权与隐私政策<span class="close_span" onclick="showXXSQYSZCDiv(false)">X</span></div>
		<div class="content_div" id="content_div"></div>
	</div>
</div>

<img class="logo_img" src="<%=basePath %>resource/image/b91440230303c04be46f77ac31bbb390.png"/>
<a href="tel:15712773653">
	<div class="tel_div">
		<img class="tel_img" src="<%=basePath %>resource/image/202103100002.png"/>
		<div class="text_div">电话</div>
	</div>
</a>
<div class="get_price_div" id="get_price_div">
	<div class="title_div">立即获取参考报价</div>
	<div class="user_count_div">已有<span class="user_count_span" id="user_count_span"></span>人获取了产品价格</div>
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
		<div class="list_div" id="pn_list_div">
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
</div>
<video style="width:100%;" controls="" preload="none"  x5-playsinline="" playsinline="" webkit-playsinline="" poster="<%=basePath %>resource/image/202011240038.png">
	<source src="<%=basePath %>resource/video/202011240037.mp4"></source>
</video>
<img class="sfhydyxnt_img" src="<%=basePath %>resource/image/d06cdcf93c2e042fb6fe48ae989f292c.png"/>
<img class="xtys_img" src="<%=basePath %>resource/image/96f18448915071b9fe4d49bf318b0a6e.jpg@q_80.png"/>
<div class="alzs_div">
	<div class="title_div">案例展示</div>
	<div class="desc_div">集众人智慧，聚众人合力</div>
	<div class="list_div" id="alzs_list_div">
	</div>
</div>
<div class="lxwm_div">
	<div class="title_div">联系我们</div>
	<div class="lxxx_div">
		<div class="gsmc_div" id="gsmc_div"></div>
		<div class="lxdh1_div" id="lxdh1_div"></div>
		<div class="lxdh2_div" id="lxdh2_div"></div>
		<div class="lxdz_div" id="lxdz_div"></div>
	</div>
</div>
<div class="qdhlkjyxgs_div">青岛华凌科技有限公司</div>
<div style="width: 100%;height: 45px;"></div>
<div class="zxzx_div" onclick="openChatDialog()">在线咨询</div>
</body>
</html>