<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求详情</title>
<%@include file="../../js.jsp"%>
<style type="text/css">
.center_con_div{
	width: 100%;
	height: 90vh;
	margin-left:205px;
	overflow-y: scroll;
	position: absolute;
}
.page_location_div{
	height: 50px;
	line-height: 50px;
	margin-left: 20px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
var path='<%=basePath %>';
var dialogTop=10;
var dialogLeft=20;
var ddNum=0;
$(function(){
	initDetailDialog();

	initDialogPosition();//将不同窗体移动到主要内容区域
});

function initDialogPosition(){
	//基本属性组
	var ddpw=$("body").find(".panel.window").eq(ddNum);
	var ddws=$("body").find(".window-shadow").eq(ddNum);

	var ccDiv=$("#center_con_div");
	ccDiv.append(ddpw);
	ccDiv.append(ddws);
}

function initDetailDialog(){
	dialogTop+=20;
	$("#detail_div").dialog({
		title:"需求信息",
		width:setFitWidthInParent("body","detail_div"),
		height:295,
		top:dialogTop,
		left:dialogLeft
	});

	$("#detail_div table").css("width",(setFitWidthInParent("body","detail_div_table"))+"px");
	$("#detail_div table").css("magin","-100px");
	$("#detail_div table td").css("padding-left","50px");
	$("#detail_div table td").css("padding-right","20px");
	$("#detail_div table td").css("font-size","15px");
	$("#detail_div table tr").each(function(i){
		$(this).css("height",(i==1?150:45)+"px");
	});

	$(".panel.window").eq(ddNum).css("margin-top","20px");
	$(".panel.window .panel-title").eq(ddNum).css("color","#000");
	$(".panel.window .panel-title").eq(ddNum).css("font-size","15px");
	$(".panel.window .panel-title").eq(ddNum).css("padding-left","10px");
	
	$(".panel-header, .panel-body").css("border-color","#ddd");
	
	//以下的是表格下面的面板
	$(".window-shadow").eq(ddNum).css("margin-top","20px");
	$(".window,.window .window-body").eq(ddNum).css("border-color","#ddd");
}

function setFitWidthInParent(parent,self){
	var space=0;
	switch (self) {
	case "detail_div":
		space=340;
		break;
	case "detail_div_table":
	case "panel_window":
		space=355;
		break;
	}
	var width=$(parent).css("width");
	return width.substring(0,width.length-2)-space;
}
</script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
	<%@include file="../../side.jsp"%>
	<div class="center_con_div" id="center_con_div">
		<div class="page_location_div">需求详情</div>
		
		<div id="detail_div">
			<input type="hidden" name="id" value="${requestScope.productNeed.id }"/>
			<table>
			  <tr style="border-bottom: #CAD9EA solid 1px;">
				<td align="right" style="width:15%;">
					需求名称
				</td>
				<td style="width:30%;">
					<span>${requestScope.productNeed.name }</span>
				</td>
				<td align="right" style="width:15%;">
					排序
				</td>
				<td style="width:30%;">
					<span>${requestScope.productNeed.sort }</span>
				</td>
			  </tr>
			  <tr style="border-bottom: #CAD9EA solid 1px;">
				<td align="right" style="width:15%;">
					描述
				</td>
				<td style="width:30%;">
					<span>${requestScope.productNeed.describe }</span>
				</td>
				<td align="right" style="width:15%;">
				</td>
				<td style="width:30%;">
				</td>
			  </tr>
			</table>
		</div>
		<%@include file="../../foot.jsp"%>
	</div>
</div>
</body>
</html>