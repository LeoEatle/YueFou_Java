
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 设置相对路径 -->	
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/Yuefou/" ;   
%>   
<base href="<%=basePath%>" > 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Material Design fonts -->

<link rel="stylesheet" type="text/css"
	href="dist/css/googleapis_css.css" />
<link rel="stylesheet" type="text/css"
	href="dist/css/googleapis_icon.css" />
<!-- Bootstrap -->
<link rel="stylesheet" href="dist/css/bootstrap.min.css">
<!-- Bootstrap Material Design -->
<link rel="stylesheet" type="text/css"
	href="dist/css/bootstrap-material-design.css">
<link rel="stylesheet" type="text/css" href="dist/css/ripples.min.css">
<title>登陆成功提示页面</title>
<style type="text/css">
#message {
	text-align: center;
}
</style>
</head>
<body>

	<div id="message" class="alert alert-dismissible alert-success">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>欢迎<%request.getParameter("uname"); %>！</strong> 你现在可以享受约否的乐趣了！ 
		
		<a
			href="<%=request.getContextPath()%>/Yuefou/index.jsp"
			class="btn btn-raised btn-default">返回主页</a>


	</div>

	<script type="text/javascript" src="dist/js/jquery.min.js"></script>
	<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="dist/js/material.min.js"></script>
	<script type="text/javascript" src="dist/js/ripples.min.js"></script>
	<script type="text/javascript" src="dist/js/index.js"></script>


</body>
</html>