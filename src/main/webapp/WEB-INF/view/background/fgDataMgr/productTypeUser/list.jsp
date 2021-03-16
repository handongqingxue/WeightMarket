<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
.tab1_div{
	margin-top:20px;
	margin-left: 220px;
}
</style>
<title>Insert title here</title>
<%@include file="../../js.jsp"%>
<script type="text/javascript">
var bgPath='<%=basePath%>'+"background/";
$(function(){
	initCTSDTB();
	initCTEDTB();
	initDealCBB();
	initSearchLB();
	initTab1();
});

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
	dealCBB=$("#deal_cbb").combobox({
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
			var createTimeStart=ctsDTB.datetimebox("getValue");
			var createTimeEnd=cteDTB.datetimebox("getValue");
			var deal=dealCBB.combobox("getValue");
			tab1.datagrid("load",{userName:userName,phone:phone,createTimeStart:createTimeStart,createTimeEnd:createTimeEnd,deal:deal});
		}
	});
}

function initTab1(){
	tab1=$("#tab1").datagrid({
		title:"产品种类客户查询",
		url:bgPath+"selectProductTypeUserList",
		toolbar:"#toolbar",
		width:setFitWidthInParent("body"),
		pagination:true,
		pageSize:10,
		columns:[[
			{field:"userName",title:"用户名",width:150},
			{field:"phone",title:"手机号",width:150},
            {field:"createTime",title:"创建时间",width:150},
            {field:"deal",title:"处理情况",width:150,formatter:function(value,row){
            	return (value?"已":"未")+"处理";
            }},
            {field:"id",title:"操作",width:110,formatter:function(value,row){
            	//var str="<a onclick=\"checkById('1','"+value+"')\">通过</a>&nbsp;&nbsp;"
            		//+"<a onclick=\"checkById('2','"+value+"')\">不通过</a>";
            	var str="<a href=\"detail?id="+value+"\">详情</a>";
            	return str;
            }}
	    ]],
        onLoadSuccess:function(data){
			if(data.total==0){
				$(this).datagrid("appendRow",{userName:"<div style=\"text-align:center;\">暂无信息<div>"});
				$(this).datagrid("mergeCells",{index:0,field:"userName",colspan:5});
				data.total=0;
			}
			
			$(".panel-header").css("background","linear-gradient(to bottom,#F4F4F4 0,#F4F4F4 20%)");
			$(".panel-header .panel-title").css("color","#000");
			$(".panel-header .panel-title").css("font-size","15px");
			$(".panel-header .panel-title").css("padding-left","10px");
			$(".panel-header, .panel-body").css("border-color","#ddd");
		}
	});
}

function setFitWidthInParent(o){
	var width=$(o).css("width");
	return width.substring(0,width.length-2)-210;
}
</script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div class="tab1_div" id="tab1_div">
		<div id="toolbar" style="height:32px;">
			<span style="margin-left: 13px;">用户名：</span>
			<input type="text" id="userName" placeholder="请输入用户名" style="width: 120px;height: 25px;"/>
			<span style="margin-left: 13px;">手机号：</span>
			<input type="text" id="phone" placeholder="请输入手机号" style="width: 120px;height: 25px;"/>
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