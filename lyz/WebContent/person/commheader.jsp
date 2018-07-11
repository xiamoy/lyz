<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
	.nav.white{background: none;}
	.nav.white .logo{display:none;}  
	.nav.white .logoBig img{width:100%;}
	.catgry{font-weight:900}
</style>

<!--头 -->
<header>
	<article>
		<div class="mt-logo">
			<!--顶部导航条 -->
			<%@include file="/home/head.jsp"%>
		</div>
		</div>
	</article>
</header>
<div class="nav-table">
	<div class="long-title">
		<span class="all-goods">全部分类</span>
	</div>
	<div class="nav-cont">
		<ul>
			<li class="index"><a
				href="${pageContext.request.contextPath }/home/home.jsp">首页</a></li>
			<!-- <li class="qc"><a href="#">闪购</a></li>
			<li class="qc"><a href="#">限时抢</a></li>
			<li class="qc"><a href="#">团购</a></li>
			<li class="qc last"><a href="#">大包装</a></li> -->
		</ul>
	</div>
</div>
<b class="line"></b>