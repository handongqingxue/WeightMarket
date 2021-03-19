<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.deal_gpu_bg_div{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.45);
	position: fixed;
	z-index: 9016;
	display:none;
}
.deal_gpu_div{
	width: 1000px;
	height: 500px;
	margin: 100px auto 0;
	background-color: #fff;
	border-radius:5px;
	position: absolute;
	left: 0;
	right: 0;
}
.deal_gpu_div .xgst_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	border-bottom: #eee solid 1px;
}
.deal_gpu_div .xgst_span{
	margin-left: 30px;
}
.deal_gpu_div .close_span{
	float: right;margin-right: 30px;cursor: pointer;
}
.deal_gpu_dialog_div{
	width: 1000px;
	height: 450px;
	overflow-y: scroll;
	position: absolute;
}
.deal_gpu_div .title_div{
	width: 100%;height: 50px;line-height: 50px;
}
.deal_gpu_div .title_span{
	margin-left: 30px;
}

.tab1_div{
	margin-top:20px;
	margin-left: 220px;
}
</style>
<title>Insert title here</title>
<%@include file="../../js.jsp"%>
<script type="text/javascript">
var bgPath='<%=basePath%>'+"background/";
var dgpujbsxzdNum=0;
$(function(){
	initCTSDTB();
	initCTEDTB();
	initDealCBB();
	initSearchLB();
	initTab1();
	initDealGPUJBSXZDialog();//处理报价用户窗口

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//修改运输商
	var dgpujbsxdpw=$("body").find(".panel.window").eq(dgpujbsxzdNum);
	var dgpujbsxdws=$("body").find(".window-shadow").eq(dgpujbsxzdNum);

	var dgpudDiv=$("#deal_gpu_dialog_div");
	dgpudDiv.append(dgpujbsxdpw);
	dgpudDiv.append(dgpujbsxdws);
}

function initDealGPUJBSXZDialog(){
	initDealDialogCBB();
	
	dealGPUDialog=$("#deal_gpu_jbsxz_dialog_div").dialog({
		title:"处理报价用户",
		width:setEditFitWidthInParent("#deal_gpu_div","deal_gpu_jbsxz_dialog_div"),
		height:350,
		top:10,
		left:20,
		buttons:[
           {text:"取消",id:"cancel_but",iconCls:"icon-cancel",handler:function(){
        	   openDealGPUDialog(0);
           }},
           {text:"保存",id:"ok_but",iconCls:"icon-save",handler:function(){
        	    dealById();
           }}
        ]
	});

	$("#deal_gpu_jbsxz_dialog_div table").css("width",(setEditFitWidthInParent("#deal_gpu_div","deal_gpu_jbsxz_dialog_table"))+"px");
	$("#deal_gpu_jbsxz_dialog_div table").css("magin","-100px");
	$("#deal_gpu_jbsxz_dialog_div table td").css("padding-left","50px");
	$("#deal_gpu_jbsxz_dialog_div table td").css("padding-right","20px");
	$("#deal_gpu_jbsxz_dialog_div table td").css("font-size","15px");
	$("#deal_gpu_jbsxz_dialog_div table tr").each(function(i){
		$(this).css("height",(i==2?150:45)+"px");
	});

	$(".panel.window").eq(dgpujbsxzdNum).css("margin-top","40px");
	$(".panel.window .panel-title").eq(dgpujbsxzdNum).css("color","#000");
	$(".panel.window .panel-title").eq(dgpujbsxzdNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(dgpujbsxzdNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").eq(dgpujbsxzdNum).css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(dgpujbsxzdNum).css("margin-top","40px");
	$(".window,.window .window-body").css("border-color","#ddd");

	$("#deal_gpu_jbsxz_dialog_div #cancel_but").css("left","30%");
	$("#deal_gpu_jbsxz_dialog_div #cancel_but").css("position","absolute");

	$("#deal_gpu_jbsxz_dialog_div #ok_but").css("left","45%");
	$("#deal_gpu_jbsxz_dialog_div #ok_but").css("position","absolute");
	$(".dialog-button").css("background-color","#fff");
	$(".dialog-button .l-btn-text").css("font-size","20px");
	openDealGPUJBSXZDialog(0);
}

function openDealGPUDialog(flag){
	if(flag==1){
		$("#deal_gpu_bg_div").css("display","block");
	}
	else{
		initDealGPUDiaValue(null);
		$("#deal_gpu_bg_div").css("display","none");
	}
	openDealGPUJBSXZDialog(flag);
}

function openDealGPUJBSXZDialog(flag){
	if(flag==1){
		dealGPUDialog.dialog("open");
	}
	else{
		dealGPUDialog.dialog("close");
	}
}

function initCTSDTB(){
	ctsDTB=$('#cts_dtb').datetimebox({
        required:false
    });
}

function initCTEDTB(){
	cteDTB=$('#cte_dtb').datetimebox({
        required:false
    });
}

function initDealCBB(){
	dealCBB=$("#toolbar #deal_cbb").combobox({
		valueField:"value",
		textField:"text",
		//multiple:true,
		data:[{value:"",text:"请选择"},{value:"0",text:"未处理"},{value:"1",text:"已处理"}]
	});
}

function initSearchLB(){
	$("#search_but").linkbutton({
		iconCls:"icon-search",
		onClick:function(){
			var userName=$("#toolbar #userName").val();
			var phone=$("#toolbar #phone").val();
			var pnName=$("#toolbar #pnName").val();
			var createTimeStart=ctsDTB.datetimebox("getValue");
			var createTimeEnd=cteDTB.datetimebox("getValue");
			var deal=dealCBB.combobox("getValue");
			tab1.datagrid("load",{userName:userName,phone:phone,pnName:pnName,createTimeStart:createTimeStart,createTimeEnd:createTimeEnd,deal:deal});
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"报价用户查询",
		url:bgPath+"selectGetPriceUserList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"userName",title:"用户名",width:150},
			{field:"phone",title:"手机号",width:150},
			{field:"pnName",title:"需求名称",width:200},
            {field:"createTime",title:"创建时间",width:150},
            {field:"deal",title:"处理情况",width:80,formatter:function(value,row){
            	return (value?"已":"未")+"处理";
            }},
			{field:"memo",title:"备注",width:300},
            {field:"id",title:"操作",width:110,formatter:function(value,row){
            	//var str="<a onclick=\"checkById('1','"+value+"')\">通过</a>&nbsp;&nbsp;"
            		//+"<a onclick=\"checkById('2','"+value+"')\">不通过</a>";
            	var str="<a onclick=\"dealGPUTabRow()\">处理</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{userName:"<div style=\"text-align:center;\">暂无信息<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"userName",colspan:7});
				data.total=0;
			}
			
			//$(".panel-header").css("background","linear-gradient(to bottom,#F4F4F4 0,#F4F4F4 20%)");
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");
		}
	});
}

function dealGPUTabRow(){
	var row=tab1.datagrid("getSelected");
	if (row == null) {
		$.messager.alert("提示","请选择要处理的信息！","warning");
		return false;
	}
	initDealGPUDiaValue(row);
	openDealGPUDialog(1);
}

function initDealGPUDiaValue(row){
	if(row==null){
		$("#deal_gpu_div #id").val("");
		$("#deal_gpu_div #userName").text("");
		$("#deal_gpu_div #phone").text("");
		$("#deal_gpu_div #pnName").text("");
		$("#deal_gpu_div #createTime").text("");
		dealDCBB.combobox("setValue","");
		$("#deal_gpu_div #memo").val("");
	}
	else{
		$("#deal_gpu_div #id").val(row.id);
		$("#deal_gpu_div #userName").text(row.userName);
		$("#deal_gpu_div #phone").text(row.phone);
		$("#deal_gpu_div #pnName").text(row.pnName);
		$("#deal_gpu_div #createTime").text(row.createTime);
		dealDCBB.combobox("setValue",row.deal?"1":"0");
		$("#deal_gpu_div #memo").val(row.memo);
	}
}

function initDealDialogCBB(){
	dealDCBB=$("#deal_gpu_jbsxz_dialog_div #deal_cbb").combobox({
		valueField:"value",
		textField:"text",
		data:[{"value":"","text":"请选择处理状态"},{"value":"1","text":"已处理"},{"value":"0","text":"未处理"}]
	});
}

function dealById(){
	var id=$("#deal_gpu_div #id").val();
	var deal=dealDCBB.combobox("getValue")=="1"?true:false;
	var memo=$("#deal_gpu_div #memo").val();
	$.post(bgPath+"dealGPUById",
		{id:id,deal:deal,memo:memo},
		function(data){
			if(data.message=="ok"){
				alert(data.info);
				openDealGPUDialog(0);
				tab1.datagrid("load");
			}
			else{
				alert(data.info);
			}
		}
	,"json");
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-210;
}

function setEditFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "deal_gpu_jbsxz_dialog_table":
		space=65;
		break;
	case "deal_gpu_jbsxz_dialog_div":
		space=50;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
</head>
<body>
<div class="deal_gpu_bg_div" id="deal_gpu_bg_div">
	<div class="deal_gpu_div" id="deal_gpu_div">
		<div class="xgst_div">
			<span class="xgst_span">处理报价用户</span>
			<span class="close_span" onclick="openDealGPUDialog(0)">X</span>
		</div>
		<div class="deal_gpu_dialog_div" id="deal_gpu_dialog_div">
			<div class="title_div">
				<span class="title_span">前台数据管理-报价用户-处理</span>
			</div>
			<div id="deal_gpu_jbsxz_dialog_div">
				<input type="hidden" id="id"/>
				<table>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						用户名
					</td>
					<td style="width:30%;">
						<span id="userName"></span>
					</td>
					<td align="right" style="width:15%;">
						手机号
					</td>
					<td style="width:30%;">
						<span id="phone"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						需求名称
					</td>
					<td style="width:30%;">
						<span id="pnName"></span>
					</td>
					<td align="right" style="width:15%;">
						创建时间
					</td>
					<td style="width:30%;">
						<span id="createTime"></span>
					</td>
				  </tr>
				  <tr style="border-bottom: #CAD9EA solid 1px;">
					<td align="right" style="width:15%;">
						处理情况
					</td>
					<td style="width:30%;">
						<input id="deal_cbb"/>
					</td>
					<td align="right" style="width:15%;">
						备注
					</td>
					<td style="width:30%;">
						<textarea rows="5" cols="20" id="memo"></textarea>
					</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div class="tab1_div" id="tab1_div">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">用户名：</span>
			<input type="text" id="userName" placeholder="请输入用户名" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">手机号：</span>
			<input type="text" id="phone" placeholder="请输入手机号" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">需求名称：</span>
			<input type="text" id="pnName" placeholder="请输入需求名称" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">创建时间：</span>
			<input id="cts_dtb"/>
			-
			<input id="cte_dtb"/>
			<span style="margin-left: 13px;">处理情况：</span>
			<input id="deal_cbb"/>
			<a id="search_but" style="margin-left: 13px;">查询</a>
		</div>
		<table id="tab1">
		</table>
	</div>
	<%@include file="../../foot.jsp"%>
</div>
</body>
</html>