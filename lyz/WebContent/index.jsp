<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome Shop</title>

<link rel="stylesheet" href="css/styles.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>

</head>
<body>
<div id="head">
  <div class="banner"><span>LOGIN IN</span><em class="space">|</em><span>REGISTER</span></div>
</div>
<form  action="user/login" method="post" >
  <input name="username" value=""/><br/>
  <input name="password" type="password" value=""/><br/>
  <input type="submit" value="提交"/>
</form>
</body>
</html>