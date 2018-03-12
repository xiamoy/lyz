<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome Shop</title>


<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/css/styles.css" />


</head>
<body>
<!-- <form method="post" action="user/login">
	<input name="username" />
	<br>
	<input name="password" type="password"/>
	<input type="submit" value="login in" />
</form>
 -->

<%
	request.getRequestDispatcher("/product/category").forward(request, response);
%>

</body>
</html>