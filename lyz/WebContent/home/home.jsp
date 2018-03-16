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
	System.out.println("home.jsp :"+categorys+";"+products);
		
	String user = (String)request.getSession().getAttribute("login_user");
    System.out.println("get user :"+user);
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
					<li class="qc"><a href="#shop_shangou">限时秒杀</a></li>
					<li class="qc"><a href="#changeSale">优惠换购</a></li>
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
											<i><img src="${catgry.cimage }"></i><a class="ml-22"
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



			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img src="../images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

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
							<div id="member-login" class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<!-- <a href="#"><strong>0</strong>待付款</a>
								<a href="#"><strong>0</strong>待评价</a> -->
							</div>
							<div class="clear"></div>
						</div>

					</ul>
					<!--<div class="advTip"><img src="../images/advTip.jpg"/></div>-->
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
							<img src="${saleProd.pimage } "></img></a>
						</div>
					</div>
				</c:forEach>
							

			</div>
			<div class="clear "></div>

			<!--秒杀-->
			<div class="am-container recommendation" id="shop_shangou">
				<div class="sale-mt">
					<i></i> <em class="sale-title">限时秒杀</em>
					<div class="s-time" id="countdown">
						<span id="h" class="hh">00</span> <span id="m" class="mm">00</span>
						<span id="s" class="ss">00</span>
					</div>
				</div>
				<div class="am-g am-g-fixed sale">
					<div class="am-u-sm-3 sale-item">
						<div class="s-img">
							<a href="# "><img src="../images/sale3.jpg" /></a>
						</div>
						<div class="s-info">
							<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
							<div class="s-price">
								￥<b>9.90</b> <a class="s-buy" href="#">秒杀</a>
							</div>
						</div>
					</div>

					<div class="am-u-sm-3 sale-item">
						<div class="s-img">
							<a href="# "><img src="../images/sale2.jpg" /></a>
						</div>
						<div class="s-info">
							<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
							<div class="s-price">
								￥<b>9.90</b> <a class="s-buy" href="#">秒杀</a>
							</div>
						</div>
					</div>

					<div class="am-u-sm-3 sale-item">
						<div class="s-img">
							<a href="# "><img src="../images/sale1.jpg" /></a>
						</div>
						<div class="s-info">
							<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
							<div class="s-price">
								￥<b>9.90</b> <a class="s-buy" href="#">秒杀</a>
							</div>
						</div>
					</div>
					<div class="am-u-sm-3 sale-item">
						<div class="s-img">
							<a href="# "><img src="../images/sale2.jpg " /></a>
						</div>
						<div class="s-info">
							<a href="#"><p class="s-title">ZEK 原味海苔</p></a>
							<div class="s-price">
								￥<b>9.90</b> <a class="s-buy" href="#">秒杀</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>


			<!--热门活动 -->

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
			<div class="clear "></div>


			<div id="f1">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="../images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f2">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="../images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="../images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="../images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="../images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="../images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>


			<div id="f3">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="../images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f4">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="../images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="../images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="../images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="../images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="../images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>


			<div id="f5">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="../images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f6">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="../images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="../images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="../images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="../images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="../images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>



			<div id="f7">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="../images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>

			<div id="f8">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="../images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="../images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="../images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="../images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="../images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>

			<div id="f9">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="../images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="../images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f10">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="../images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="../images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="../images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="../images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="../images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="../images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>

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


	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="../images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								<li>用户名sl1903</li>
								<li>级&nbsp;别普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="# " class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">0</p>
				</div>
				<!--<div id="asset " class="item ">
						<a href="# ">
							<span class="view "></span>
						</a>
						<div class="mp_tooltip ">
							我的资产
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>-->

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="../images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<!--<div id="broadcast " class="item ">
						<a href="# ">
							<span class="chongzhi "><img src="../images/chongzhi.png " /></span>
						</a>
						<div class="mp_tooltip ">
							我要充值
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>-->

				<div class="quick_toggle ">
					<!--<li class="qtitem ">
							<a href="# "><span class="kfzx "></span></a>
							<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
						</li>-->
					<!--二维码 -->
					<!--<li class="qtitem ">
							<a href="#none "><span class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display:none; "><img src="../images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
						</li>-->
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div>
				</a> <a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div>
				</a> <a href="# " target="_blank " class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
		</div>
	</div>
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