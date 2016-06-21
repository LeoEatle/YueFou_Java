<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>session示例</p>
session的唯一标识：<%= session.getId() %><br/>
session的创建时间: <%= session.getCreationTime() %>
session的最后访问时间：<%= session.getLastAccessedTime() %>
session的失效时间：<%= session.getMaxInactiveInterval() %>


</body>
</html>