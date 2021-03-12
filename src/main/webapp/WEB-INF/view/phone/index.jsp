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
var interval;
$(function(){
	setInterval("moveItemDiv()","3000");
});

//将列表里的第一项移动到最后一项，实现列表刷新
function refreshZXCYKH(){
	var zxcykhListDiv=$("#zxcykhList_div");
	var itemDiv=zxcykhListDiv.find(".item_div").eq(0);
	zxcykhListDiv.append(itemDiv);
}

//将列表里的某一项向上移动
function moveItemDiv(){
	var zxcykhListDiv=$("#zxcykhList_div");
	var itemDiv=zxcykhListDiv.find(".item_div").eq(0);
	interval=setInterval(function(){
		var marginTop=itemDiv.css("margin-top");
		marginTop=marginTop.substring(0,marginTop.length-2);
		//console.log(marginTop);
		marginTop--;
		itemDiv.css("margin-top",marginTop+"px");
		if(marginTop<=-33){
			clearInterval(interval);
			refreshZXCYKH();
			itemDiv.css("margin-top","0px");
		}
	},"10");
}
</script>
<title>营销页面</title>
<style>

</style>
</head>
<body>
<img class="logo_img" src="<%=basePath %>resource/image/b91440230303c04be46f77ac31bbb390.jpg"/>
<a href="tel:15712773653">
	<div class="tel_div">
		<img class="tel_img" src="<%=basePath %>resource/image/202103100002.png"/>
		<div class="text_div">电话</div>
	</div>
</a>
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
	<div class="list_div" id="zxcykhList_div">
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