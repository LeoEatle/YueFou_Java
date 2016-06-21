<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="10kb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	out.println("leoeatle");
	out.print("great");
	out.newLine();
	out.flush();
	
	out.println("获取当前缓冲区大小: " + out.getBufferSize());
	out.println("获取缓冲区剩余字节数目: "+ out.getRemaining());//缓冲区大小可以通过page buffer控制
%>

</body>
</html>