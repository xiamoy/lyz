<%@page import="com.lyz.user.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Object sessionUser = request.getSession().getAttribute("login_user");
	if (sessionUser != null) {
		User loginUser = (User)sessionUser;
		String username = loginUser.getUsername();
%>
<script>
	var uname= '<%=username%>';
	window.onload = function() {
		$("#loginTag").text("你好 " + uname);
		$("#loginTag").append("&nbsp;&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/user/logout' target='_top' class='h'>退出</a> ");
		$("#login-name").text(uname);
		$("#member-logout").hide();
		$("#member-login").show();
		
	}
</script>
<%
	}
%>

<!-- <div class="hmtop"> -->
	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div id="loginTag" class="menu-hd">
					<a href="${pageContext.request.contextPath}/home/login.jsp" target="_top" class="h">亲，请登录 </a> 
					<a href="${pageContext.request.contextPath}/home/register.jsp" target="_top">免费注册</a>
				</div>
				
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath}/product/initProduct" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${pageContext.request.contextPath}/user/personInfo" target="_top"><i
						class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="${pageContext.request.contextPath }/home/shopcart.jsp" target="_top"><i
						class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
						id="J_MiniCartNum" class="h"></strong></a>
				</div>
			</div>
			<!-- <div class="topMessage favorite">
				<div class="menu-hd">
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
			</div> -->
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="../images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="../images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="${pageContext.request.contextPath }/product/search" mathod="post">
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>
<!-- </div> -->
