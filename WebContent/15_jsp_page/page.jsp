<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>page对象示例</title>
</head>
<body>
	<%
		out.println("page对象的字符串"+ page.toString());
		page.getClass();
		page.hashCode();//hashcode是java每个对象独有的一串整形数
		//page.equals(obj);
		
	%>
</body>
</html>