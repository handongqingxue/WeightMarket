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
	$("#gsxx_div").css("width",setFitWidthInParent("body")+"px");
});

function openEditXxsqDialog(flag){
	$("#xxsqBg_div").css("display",flag==1?"block":"none");
}

function openEditYszcDialog(flag){
	$("#yszcBg_div").css("display",flag==1?"block":"none");
}

function openEditCompanyDialog(flag){
	$("#editCompanyBg_div").css("display",flag==1?"block":"none");
}

function checkEditXxsqInfo(){
	if(checkXxsq()){
		editSystemInfo("xxsq");
	}
}

function checkEditYszcInfo(){
	if(checkYszc()){
		editSystemInfo("yszc");
	}
}

function checkEditCompany(){
	if(checkCompanyName()){
		if(checkContactAddress()){
			if(checkContactTel1()){
				if(checkContactTel2()){
					editSystemInfo("gsxx");
				}
			}
		}
	}
}

function editSystemInfo(flag){
	var params;
	if(flag=="xxsq"){
		var grxxsq=$("#grxxsq").val();
		params={grxxsq:grxxsq};
	}
	else if(flag=="yszc"){
		var yszc=$("#yszc").val();
		params={yszc:yszc};
	}
	else if(flag=="gsxx"){
		var companyName=$("#companyName").val();
		var contactAddress=$("#contactAddress").val();
		var contactTel1=$("#contactTel1").val();
		var contactTel2=$("#contactTel2").val();
		params={companyName:companyName,contactAddress:contactAddress,contactTel1:contactTel1,contactTel2:contactTel2};
	}
	$.post(bgPath+"editSystemInfo",
		params,
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

function focusYszc(){
	var yszc = $("#yszc").val();
	if(yszc=="隐私政策不能为空"){
		$("#yszc").val("");
		$("#yszc").css("color", "#555555");
	}
}

//验证隐私政策
function checkYszc(){
	var yszc = $("#yszc").val();
	if(yszc==null||yszc==""||yszc=="隐私政策不能为空"){
		$("#yszc").css("color","#E15748");
    	$("#yszc").val("隐私政策不能为空");
    	return false;
	}
	else
		return true;
}

function focusCompanyName(){
	var companyName = $("#companyName").val();
	if(companyName=="公司名称不能为空"){
		$("#companyName").val("");
		$("#companyName").css("color", "#555555");
	}
}

//验证公司名称
function checkCompanyName(){
	var companyName = $("#companyName").val();
	if(companyName==null||companyName==""||companyName=="公司名称不能为空"){
		$("#companyName").css("color","#E15748");
    	$("#companyName").val("公司名称不能为空");
    	return false;
	}
	else
		return true;
}

function focusContactAddress(){
	var contactAddress = $("#contactAddress").val();
	if(contactAddress=="联系地址不能为空"){
		$("#contactAddress").val("");
		$("#contactAddress").css("color", "#555555");
	}
}

//验证联系地址
function checkContactAddress(){
	var contactAddress = $("#contactAddress").val();
	if(contactAddress==null||contactAddress==""||contactAddress=="联系地址不能为空"){
		$("#contactAddress").css("color","#E15748");
    	$("#contactAddress").val("联系地址不能为空");
    	return false;
	}
	else
		return true;
}

function focusContactTel1(){
	var contactTel1 = $("#contactTel1").val();
	if(contactTel1=="联系电话不能为空"){
		$("#contactTel1").val("");
		$("#contactTel1").css("color", "#555555");
	}
}

//验证联系电话
function checkContactTel1(){
	var contactTel1 = $("#contactTel1").val();
	if(contactTel1==null||contactTel1==""||contactTel1=="联系电话不能为空"){
		$("#contactTel1").css("color","#E15748");
    	$("#contactTel1").val("联系电话不能为空");
    	return false;
	}
	else
		return true;
}

function focusContactTel2(){
	var contactTel2 = $("#contactTel2").val();
	if(contactTel2=="座机不能为空"){
		$("#contactTel2").val("");
		$("#contactTel2").css("color", "#555555");
	}
}

//验证座机
function checkContactTel2(){
	var contactTel2 = $("#contactTel2").val();
	if(contactTel2==null||contactTel2==""||contactTel2=="座机不能为空"){
		$("#contactTel2").css("color","#E15748");
    	$("#contactTel2").val("座机不能为空");
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
.xxsqBg_div,.yszcBg_div{
	width: 100%;
	height:100%;
	background: rgba(0,0,0,0.65);
	position: fixed;
	display: none;
	z-index: 1001;
}
.xxsqBg_div .xxsq_div,.yszcBg_div .yszc_div{
	width:500px;
	height:400px;
	margin:100px auto;
	background: #f8f8f8;
	border-radius: 6px;
}
.xxsqBg_div .xxsq_div .title,.yszcBg_div .yszc_div .title{
	font-size: 22px;
	color: #4CAF50;
	text-align: center;
	padding-top: 20px;
}
.xxsqBg_div .xxsq_div .content_div,.yszcBg_div .yszc_div .content_div{
	width:450px;
	height:260px;
	margin:20px auto 0;
}
.xxsqBg_div .xxsq_div textarea,.yszcBg_div .yszc_div textarea{
	width: 100%;
	height:100%;
	border: 1px solid #DDE0E2;
}
.xxsqBg_div .xxsq_div .but_div,.yszcBg_div .yszc_div .but_div{
	width:168px;
	margin: auto;
	padding-top: 20px;
}
.xxsqBg_div .xxsq_div .but,.yszcBg_div .yszc_div .but{
	width: 76px;
	padding: 5px 10px;
	font-size: 14px;
	border: 1px solid #d9d9d9;
	border-radius: 4px;
	cursor: pointer;
}
.xxsqBg_div .xxsq_div .cancel_but,.yszcBg_div .yszc_div .cancel_but{
	color: #323232;
	background: #FFF;
}
.xxsqBg_div .xxsq_div .submit_but,.yszcBg_div .yszc_div .submit_but{
	color: #FFF;
	background: #4CAF52;
	margin-left: 12px;
}

.editCompanyBg_div{
	width: 100%;height:100%;
	background: rgba(0,0,0,0.65);
	position: fixed;
	display: none;
	z-index: 1001;
}
.editCompany_div{
	width:500px;
	height:340px;
	margin:100px auto;
	background: #f8f8f8;
	border-radius: 6px;
}
.editCompany_div .title{
	font-size: 22px;
	color: #4CAF50;
	text-align: center;
	padding-top: 20px;
}
.editCompany_div .gsmc_div,.editCompany_div .lxdz_div,.editCompany_div .lxdh1_div,.editCompany_div .lxdh2_div{
	width:310px;
	margin: auto;
	padding-top: 20px;
}
.editCompany_div .dhjpgz_span{
	margin-top: 36px;
	position: absolute;
}
.editCompany_div input{
	width: 200px;
	height:30px;
	margin-left: 20px;
	border: 1px solid #DDE0E2;
}
.editCompany_div textarea{
	width: 200px;
	height:100px;
	margin-left: 108px;
	border: 1px solid #DDE0E2;
}
.editCompany_div .but_div{
	width:168px;
	margin: auto;
	padding-top: 20px;
}
.editCompany_div .but{
	width: 76px;
	padding: 5px 10px;
	font-size: 14px;
	border: 1px solid #d9d9d9;
	border-radius: 4px;
	cursor: pointer;
}
.editCompany_div .cancel_but{
	color: #323232;
	background: #FFF;
}
.editCompany_div .submit_but{
	color: #FFF;
	background: #4CAF52;
	margin-left: 12px;
}

.xxsqyszc_div{
	margin-top:20px;
	margin-left: 238px;
	padding-top:40px;
	padding-bottom: 1px;
	padding-left:40px;
	background-color:#FAFDFE;
}
.xxsqyszc_div .title_div{
	font-size: 20px;
	color: #373737;
	font-weight:700;
}
.xxsqyszc_div .xxsq_div,.edit_xxsq_div{
	margin-top:20px;
}
.xxsqyszc_div .yszc_div,.edit_yszc_div{
	margin-top:20px;
	margin-bottom:40px;
}
.xxsq_title_div,.yszc_title_div{
	font-size: 15px;
	color: #373737;
	font-weight: 700;
}
.xxsq_content_div,.yszc_content_div{
	width:97%; 
	margin-top:20px;
	font-size: 15px;
}
.edit_xxsq_span,.edit_yszc_span{
	font-size: 15px;
	color: #357bb3;
	cursor: pointer;
}

.gsxx_div{
	height:370px;
	margin:20px 0 40px 238px;
	padding-top:40px;
	padding-left:40px;
	background-color:#FAFDFE;
}
.gsxx_div .title_div{
	font-size: 20px;
	color: #373737;
	font-weight:700;
}
.gsxx_div .attr_div{
	margin-top:40px;
}
.gsxx_div .attr_div .key_span{
	font-size: 15px;
	color: #373737;
	font-weight: 700;
}
.gsxx_div .attr_div .value_span{
	font-size: 15px;
}
.gsxx_div .attr_div .ec_but_span{
	font-size: 15px;
	color: #357bb3;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="xxsqBg_div" id="xxsqBg_div">
	<div class="xxsq_div">
		<h4 class="title">信息授权</h4>
		<div class="content_div">
			<textarea rows="10" cols="30" id="grxxsq" onfocus="focusXxsq()" onblur="checkXxsq()">${requestScope.systemInfo.grxxsq }</textarea>
		</div>
		<div class="but_div">
			<button class="but cancel_but" onclick="openEditXxsqDialog(0)">取消</button>
			<button class="but submit_but" onclick="checkEditXxsqInfo()">提交</button>
		</div>
	</div>
</div>

<div class="yszcBg_div" id="yszcBg_div">
	<div class="yszc_div">
		<h4 class="title">隐私政策</h4>
		<div class="content_div">
			<textarea rows="10" cols="30" id="yszc" onfocus="focusYszc()" onblur="checkYszc()">${requestScope.systemInfo.yszc }</textarea>
		</div>
		<div class="but_div">
			<button class="but cancel_but" onclick="openEditYszcDialog(0)">取消</button>
			<button class="but submit_but" onclick="checkEditYszcInfo()">提交</button>
		</div>
	</div>
</div>

<div class="editCompanyBg_div" id="editCompanyBg_div">
	<div class="editCompany_div">
		<h4 class="title">公司信息</h4>
		<div class="gsmc_div">
			<span>公&nbsp;&nbsp;司&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;称</span>
			<input type="text" id="companyName" value="${requestScope.systemInfo.companyName }" onfocus="focusCompanyName()" onblur="checkCompanyName()"/>
		</div>
		<div class="lxdz_div">
			<span>公&nbsp;&nbsp;司&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址</span>
			<input type="text" id="contactAddress" value="${requestScope.systemInfo.contactAddress }" onfocus="focusContactAddress()" onblur="checkContactAddress()"/>
		</div>
		<div class="lxdh1_div">
			<span>联&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;话</span>
			<input type="text" id="contactTel1" value="${requestScope.systemInfo.contactTel1 }" onfocus="focusContactTel1()" onblur="checkContactTel1()"/>
		</div>
		<div class="lxdh2_div">
			<span>座&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</span>
			<input type="text" id="contactTel2" value="${requestScope.systemInfo.contactTel2 }" onfocus="focusContactTel2()" onblur="checkContactTel2()"/>
		</div>
		<div class="but_div">
			<button class="but cancel_but" onclick="openEditCompanyDialog(0)">取消</button>
			<button class="but submit_but" onclick="checkEditCompany()">提交</button>
		</div>
	</div>
</div>
		
<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div class="xxsqyszc_div" id="xxsqyszc_div">
		<div class="title_div">信息授权与隐私政策设置</div>
		<div class="xxsq_div">
			<div class="xxsq_title_div">信&nbsp;&nbsp;息&nbsp;&nbsp;&nbsp;授&nbsp;&nbsp;权</div>
			<div class="xxsq_content_div">${requestScope.systemInfo.grxxsq }</div>
		</div>
		<div class="edit_xxsq_div">
			<span class="edit_xxsq_span" onclick="openEditXxsqDialog(1)">修改信息授权</span>
		</div>
		<div class="yszc_div">
			<div class="yszc_title_div">隐&nbsp;&nbsp;私&nbsp;&nbsp;&nbsp;政&nbsp;&nbsp;策</div>
			<div class="yszc_content_div">${requestScope.systemInfo.yszc }</div>
		</div>
		<div class="edit_yszc_div">
			<span class="edit_yszc_span" onclick="openEditYszcDialog(1)">修改隐私政策</span>
		</div>
	</div>
	<div class="gsxx_div" id="gsxx_div">
		<div class="title_div">公司信息</div>
		<div class="attr_div">
			<span class="key_span">公&nbsp;&nbsp;司&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;称：</span>
			<span class="value_span">${requestScope.systemInfo.companyName }</span>
		</div>
		<div class="attr_div">
			<span class="key_span">联&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址：</span>
			<span class="value_span">${requestScope.systemInfo.contactAddress }</span>
		</div>
		<div class="attr_div">
			<span class="key_span">联&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;话：</span>
			<span class="value_span">${requestScope.systemInfo.contactTel1 }</span>
		</div>
		<div class="attr_div">
			<span class="key_span">座&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</span>
			<span class="value_span">${requestScope.systemInfo.contactTel2 }</span>
		</div>
		<div class="attr_div">
			<span class="ec_but_span" onclick="openEditCompanyDialog(1)">修改公司信息</span>
		</div>
	</div>
	<%@include file="../../foot.jsp"%>
</div>
</body>
</html>