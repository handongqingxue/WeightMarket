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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
function openTaoBaoApp(){
	var u = navigator.userAgent;
    var isWeixin = u.toLowerCase().indexOf('micromessenger') !== -1; // 微信内
    var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端
    var isIOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

    // 微信内
    if(isWeixin) {
        alert('请在浏览器上打开')
    } else {
    	//https://blog.csdn.net/zgh0711/article/details/70855256
        //android端
        if (isAndroid) {
            //安卓app的scheme协议
            //window.location.href = "https://m.tb.cn/h.4lCRaMS?sm=810657";
            window.location.href = 'taobao://';
            setTimeout(function(){
                let hidden = window.document.hidden || window.document.mozHidden || window.document.msHidden ||window.document.webkitHidden 
                if(typeof hidden =="undefined" || hidden ==false){
                    //应用宝下载地址 (emmm 找不到淘宝应用宝的地址，这里放的是 lucky coffee 地址)
                    window.location.href ="https://a.app.qq.com/o/simple.jsp?pkgname=com.taobao.litetao";
                }
            }, 2000);
        }
        //ios端
        if (isIOS) {
            //ios的scheme协议
            window.location.href = 'taobao://'
            setTimeout(function(){
                let hidden = window.document.hidden || window.document.mozHidden || window.document.msHidden ||window.document.webkitHidden 
                if(typeof hidden =="undefined" || hidden ==false){
                    //App store下载地址
                    window.location.href = "http://itunes.apple.com/app/id387682726";
                }
            }, 2000);
        }
    }
}
</script>
<title>Insert title here</title>
</head>
<body>
<!-- 
<a href="https://t.asczwa.com/taobao?backurl=https://m.tb.cn/h.4lwHoJZ?sm=2b92c8" rel="external nofollow">打开淘宝app</a>
 -->
 <input type="button" value="打开淘宝app" onclick="openTaoBaoApp()"/>
</body>
</html>