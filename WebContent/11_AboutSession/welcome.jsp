<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎进入约否</title>
</head>
<body>
	<%
		if(session.getAttribute("userName") != null){
	%>
	欢迎：<%= session.getAttribute("userName") %>
	<a href="logout.jsp">注销</a>
	<br />
	<%
		} else{ 
	%>
	请先登录
	<a href="login.jsp">登录</a>
	<%
		}
	%>
	
	<%
		if(session.isNew()){
	%>
	<br /> 欢迎新的加入者！

	<%
		}else{ 
	%>
	您已经是会员了！
	<%
		} 
	%>



</body>
</html>