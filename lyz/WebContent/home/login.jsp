<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>

<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
</head>

<%
	
	 Object defaultUser =  request.getSession().getAttribute("register_user");
	if(defaultUser!=null){ 
		String regist_user = (String)defaultUser;
%>
<script type="text/javascript">
$(document).ready(function(){
	 var user = '<%=regist_user %>'; 
	$("#user").val(user);
});

</script>
<%
	 } 
%>

<body>

	<div class="login-boxtitle">
		<a href="home.jsp"><img alt="logo" src="../images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="../images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>
				
				<div class="login-form">
					<form method="post" action="${pageContext.request.contextPath }/user/login">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="username" id="user" placeholder="邮箱/手机/用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password"
								placeholder="请输入密码">
						</div>
						
						
						<div class="am-cf">
							<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
						</div>  
						
					</form>
				</div>

					<div class="login-links">
							<a href="#" class="am-fr">忘记密码</a> 
							<a	href="register.jsp" class="zcnext am-fr am-btn-default">注册</a> <br />
					</div>
								
			</div>
		</div>
	</div>


	<%@include file="/home/foot.jsp" %>
</body>

</html>