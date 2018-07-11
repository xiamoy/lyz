<%@page import="java.util.Map"%>
<%@page import="com.lyz.user.bean.Category"%>
<%@page import="com.lyz.user.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.lyz.user.constant.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List<Category> categorys = (List<Category>)request.getSession().getAttribute(Constants.category_all);
	Map<String,List<Product>> products =(Map<String,List<Product>>) request.getSession().getAttribute(Constants.product_on_category);
	//System.out.println("home.jsp :"+categorys+";"+products);
		
	User user = (User)request.getSession().getAttribute("login_user");
    //System.out.println("get user :"+user);
	if(user!=null){
		System.out.println("user is :"+user);
%>


<%		
	}
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />

<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="../css/skin.css" rel="stylesheet" type="text/css" />
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<script src="../js/leftTimer.js"></script>


</head>

<body>

	<!-- include common head jsp -->
	<%@include file="/home/head.jsp"%>

	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.jsp"><img
						src="../images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img src="../images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img src="../images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img src="../images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">

			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="home.html">首页</a></li>
					<li class="qc"><a href="#shop_shangou">优惠换购</a></li>
					
				</ul>
				
			</div>

			<!--侧边导航 -->

			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">
							
							<!-- begin use jstl to list products -->
							<c:forEach var="catgry" items="${category_all }">
														
								<li class="appliance js_toggle relative first">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<i><img src="${pageContext.request.contextPath}/${catgry.cimage }"></i><a class="ml-22"
												title="">${catgry.cname }</a>
										</h3>
										<em>&gt;</em>
									</div>
									
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">											
														<dl class="dl-sort">
															<dt>
																<span title="${catgry.cname }">${catgry.cname }</span>
															</dt>
									
															<c:forEach var="prod" items="${product_on_category[catgry.cid]}" varStatus="list_count">
															<c:if test="${list_count.index<10 }">
																<dd>
																	<a title="${prod.pname }" href="${pageContext.request.contextPath}/product/prodintro.action?pid=${prod.pid}"><span>${prod.pname }</span></a>
																</dd>
															</c:if>
															</c:forEach>
														</dl>
														
													</div>
										
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								</c:forEach>
								
								<!-- end list products -->	
							</ul>
						</div>
					</div>

				</div>
			</div>


			<!--轮播-->

			<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>

			<!--走马灯 -->

			<div class="marqueen">
				<span class="marqueen-title">商城入口</span>
				<div class="demo">

					<ul>
						
						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="../person/information.jsp"> <img
									src="../images/getAvatar.do.jpg">
								</a> <em> Hi,<span id="login-name" class="s-name">小叮当</span> <!--<a href="#"><p>点击更多优惠活动</p></a>-->
								</em>
							</div>
							<div id="member-logout" class="member-logout">
								<a class="am-btn-warning btn" href="${pageContext.request.contextPath}/home/login.jsp">登录</a> <a
									class="am-btn-warning btn" href="${pageContext.request.contextPath}/home/register.jsp">注册</a>
							</div>
						<!-- 	<div id="member-login" class="member-login">
								<a href="#"><strong>0</strong>待收货</a> 
								<a href="#"><strong>0</strong>待发货</a>
								 <a href="#"><strong>0</strong>待付款</a>
								<a href="#"><strong>0</strong>待评价</a> 
							</div> -->
							<div class="clear"></div>
						</div>

					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
	</div>
	
	
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->
			<div class="am-g am-g-fixed recommendation am-margin-top-lg">
				<div class="clock am-u-sm-3"">
					<!--TODO 更换图片-->
					<!--<img src="../images/2016.png "></img>-->
					<p>
						热销<br>推荐
					</p>
				</div>
				
				<!-- list top sale product -->
				<c:forEach var="saleProd" items="${top_sale_product }">
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3 style="width:120px;height:48px;overflow:hidden;text-overflow:ellipsis;"><nobr>${saleProd.pname }</nobr> </h3>
							<h4 >已售 <i style="color:red">${saleProd.sales }</i></h4>
						</div>
						<div class="recommendationMain one">
							<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${saleProd.pid}">
							<img src="${pageContext.request.contextPath}/${saleProd.pimage } "></img></a>
						</div>
					</div>
				</c:forEach>
							

			</div>
			<div class="clear "></div>

			<!--秒杀-->
			<div class="am-container recommendation" id="shop_shangou">
				<div class="sale-mt">
				<div style="text-align:center;font-size:20px;height:40px;padding:5px auto">精彩换购</div>
					
				</div>
				<div class="am-g am-g-fixed sale">
					<c:forEach items="${top_home_goods }" var="goods"> 
						<div class="am-u-sm-3 sale-item">
							<div class="s-img">
								<a href="${pageContext.request.contextPath }/goods/goodsInfo?cgid=${goods.cgid} "><img style="width:220px;height:220px" src="${pageContext.request.contextPath }/${goods.gimage}" /></a>
							</div>
							<div class="s-info">
								<a href="#"><p class="s-title">${goods.gname }</p></a>
								<div class="s-price">
									￥<b>${goods.price }</b> <a class="s-buy" href="${pageContext.request.contextPath }/goods/goodsInfo?cgid=${goods.cgid}">查看详情</a>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
			<div class="clear"></div>


			<!--热门活动 -->
<!-- 
			<div id="changeSale" class="am-container activity ">
				<div class="shopTitle ">
					<h4>换购活动</h4>
					<h3>每期换购 优惠享不停</h3>
					<span class="more "> <a href="# ">全部活动<i
							class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
					</span>
				</div>
				<div class="am-g am-g-fixed ">
					<div class="am-u-sm-3 ">
						<div class="icon-sale one "></div>
						<h4>Top1</h4>
						<div class="activityMain ">
							<img src="../images/activity1.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale two "></div>
						<h4>Top2</h4>
						<div class="activityMain ">
							<img src="../images/activity2.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>Top3</h4>
						<div class="activityMain ">
							<img src="../images/activity3.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 last ">
						<div class="icon-sale "></div>
						<h4>Top4</h4>
						<div class="activityMain ">
							<img src="../images/activity.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

				</div>
			</div>
			<div class="clear "></div> -->
			
			
			<!-- include foot jsp file -->
			<%@include file="/home/foot.jsp"%>


		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home.jsp"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div>


	<!-- 菜单 -->
	
	<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
	<script type="text/javascript " src="../basic/js/quick_links.js "></script>
	<!--<script src="../basic/js/jquery-1.7.min.js">
			var searchNav = $(".nav-cont");
			$(window).scroll(function(){
				if($(window).scrollTop()>300){
					searchNav.addClass("ScrollNav");
				}else{
					searchNav.removeClass("ScrollNav");}
				})
		</script>-->
</body>

</html>