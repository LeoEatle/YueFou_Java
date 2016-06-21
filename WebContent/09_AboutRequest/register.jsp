<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录入表单信息</title>
</head>
<body>
	<form action="do_register.jsp" method="post">
		用户名: <input name="userName"  type = "text"/>
		密码: <input name="password" type="text"/>	
		<input type="submit" value="提交">
	</form>
</body>
</html>