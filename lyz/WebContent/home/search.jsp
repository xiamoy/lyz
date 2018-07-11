<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>搜索页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="../css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../js/script.js"></script>
	</head>

	<body>

		<!--顶部导航条 -->
		<%@include file="/home/head.jsp" %>
		
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
			   <div class="long-title"><span class="all-goods">全部分类</span></div>
			   <div class="nav-cont">
					<ul>
			     		 <li class="index"><a href="${pageContext.request.contextPath }/home/home.jsp">首页</a></li>
                         <!-- <li class="qc"><a href="#">闪购</a></li>
                         <li class="qc"><a href="#">限时抢</a></li>
                         <li class="qc"><a href="#">团购</a></li>
                         <li class="qc last"><a href="#">大包装</a></li> -->
					</ul>
				</div>
			</div>

					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">														
							<div class="searchAbout">
								<span class="font-pale"></span>
								<a title="坚果" href="#"></a>
								<a title="瓜子" href="#"></a>
								<a title="鸡腿" href="#"></a>

							</div>
							<ul class="select">
								<p class="title font-normal">
									<span class="fl"></span>
									<span class="total fl">搜索到<strong class="num">${search_kword_product.size() }</strong>件相关商品</span>
								</p>
								<div class="clear"></div>
					        
							</ul>
							<div class="clear"></div>
                        </div>
							<div class="search-content">
							<c:choose>
								<c:when test="${ empty  search_kword_product}">
									<div id="noresult" style="margin:20px;font-size:18px;color:red">没有找到相关产品，更换下关键词试试吧 </div>
								</c:when>
								<c:otherwise>
									<div class="sort">
										<li class="first"><a title="综合">综合排序</a></li>
										<li><a title="销量">销量排序</a></li>
										<li><a title="价格">价格优先</a></li>
										<li class="big"><a title="评价" href="#">评价为主</a></li>
									</div>
									<div class="clear"></div>
									<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									<c:forEach items="${search_kword_product }" var="prod">
										<li>
											<div class="i-pic limit">
												<a href="${pageContext.request.contextPath }/product/prodintro.action?pid=${prod.pid}">
												<img src="${pageContext.request.contextPath }/${prod.pimage}" /> </a>										
												<p class="title fl">${prod.pname }</p>
												<p class="price fl">
													<b>¥</b>
													<strong>${prod.shopPrice }</strong>
												</p>
												<p class="number fl">
													销量<span>${prod.sales }</span>
												</p>
											</div>
										</li>
									</c:forEach>
									</ul>
								</c:otherwise>
							</c:choose>
							
								
							</div>
							
							<!--分页 -->
						
						</div>
					</div>
					
					<%@include file="/home/foot.jsp" %>					
				</div>

			</div>
		
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>

		<div class="theme-popover-mask"></div>

	</body>

</html>