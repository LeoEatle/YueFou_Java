<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面访问数据</title>
</head>
<body>
<%
	Object obj = application.getAttribute("counter");
	if(obj == null){
		application.setAttribute("counter", new Integer(1));
		
	}else{
		int counterValue = Integer.parseInt(obj.toString());
		out.println("该页面被访问了 " + counterValue + " 次<br/>");
		counterValue++;
		application.setAttribute("counter", counterValue);
	}
%>

</body>
</html>