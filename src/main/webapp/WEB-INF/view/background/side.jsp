<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>边框导航栏</title>
<script type="text/javascript">

</script>
<style type="text/css">
.side {
	position: fixed;
	top: 50px;
	bottom: 0;
	height: 100%;
	justify-content: center;
	display: flex;
}

.head {
	align-items: center;
	position: relative;
	height: 50px;
	background-color: #20A0FF !important;
}

.headTitle, .headTitle>h1 {
	padding-left: 15px;
	margin: 0px auto;
}
.layui-nav .layui-nav-item a{
	color:#000;
}
.layui-nav .layui-nav-item .pointer-img{
	margin-top: 18px;
	margin-left: 18px;
	position: absolute;
}
.layui-nav .level-ul{
	height: 800px;
	margin-right: 10px;
	overflow-y:scroll;
}
.layui-nav .first-level-div{
	width: 92%; 
	margin: 20px auto 0; 
	border: #CAD9EA solid 1px;
	background-color: #F5FAFE;
}
.layui-nav .first-level{
    font-size: 15px;
	font-weight: bold;
	background-color: #E7F4FD;
}
.layui-nav,.layui-side{
	background-color: #FAFDFE;
}
.layui-side{
	border-right:#86B9D6 solid 1px;
}
.layui-layout-admin .layui-header{
	background-color:  #E7F4FD;
}
.line_div{
	width:100%;
	height: 1px;
	background-color: #CAD9EA;
}

</style>
</head>
<body>
	<div class="layui-header ">
		<div class="layui-logo">
			<img alt="" src="<%=basePath%>resource/image/qrcode.png"/>
			<a>智能称重营销后台</a>
		</div>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item"><a href="javascript:;"> <img
					src="http://t.cn/RCzsdCq" class="layui-nav-img">
					${sessionScope.admin.userName }
			</a></li>
			<li class="layui-nav-item"><a href="<%=basePath%>background/exit">退出</a>
			</li>
		</ul>
	</div>

	<div class="layui-side ">
		<div class="layui-side-scroll">
			<ul class="layui-nav layui-nav-tree layui-inline level-ul" lay-filter="demo">
				<shiro:hasRole  name="admin">
  				<!--  有权限   -->
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							商家管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/merchant/check/list">
							&nbsp;&nbsp;&nbsp;商家审核
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/merchant/all/list">
							&nbsp;&nbsp;&nbsp;综合查询
						</a>
					</li>
				</div>
				</shiro:hasRole>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							系统管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/sysMgr/sysSet/set">
							&nbsp;&nbsp;&nbsp;系统设置
						</a>
					</li>
				</div>
				<shiro:hasRole  name="admin">
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							行业管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/trade/cc/list">
							&nbsp;&nbsp;&nbsp;行业抽成
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/trade/trade/list">
							&nbsp;&nbsp;&nbsp;行业查询
						</a>
					</li>
				</div>
				</shiro:hasRole>
				<div class="first-level-div">
					<li class="layui-nav-item first-level">
						<a>
							前台数据管理
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/fgDataMgr/productNeed/list">
							&nbsp;&nbsp;&nbsp;产品需求
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/fgDataMgr/getPriceUser/list">
							&nbsp;&nbsp;&nbsp;报价用户
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/merchantCard/hanRec/list">
							&nbsp;&nbsp;&nbsp;案例展示
						</a>
					</li>
					<div class="line_div"></div>
					<li class="layui-nav-item">
						<img class="pointer-img" alt="" src="<%=basePath%>resource/image/ico_3.gif" />
						<a href="<%=basePath%>background/merchantCard/hanRec/list">
							&nbsp;&nbsp;&nbsp;产品种类客户
						</a>
					</li>
				</div>
			</ul>
		</div>
	</div>
</body>
</html>