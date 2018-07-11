<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人中心</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/systyle.css" rel="stylesheet" type="text/css">
				
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			function currentTime(){ 
				var date = new Date();
				var l = ["日","一","二","三","四","五","六"];
				var d = date.getDay();
				var str = "星期" + l[d];
				$('#day').text(date.getDate());
				$("#wk").text(str);
				$("#date").text(date.getFullYear()+"."+(date.getMonth()+1));
			} 	
			$(document).ready(function(){
				setInterval("currentTime()",50); 
			});
			
			
		</script>
	</head>

	<body>
		<%@include file="/person/commheader.jsp" %>
		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--个人信息 -->
								<div class="m-bg"></div>
								<div class="m-userinfo">
									<div class="m-baseinfo">
										<a href="information.html">
											<img src="../images/getAvatar.do.jpg">
										</a>
										<em class="s-name">(${login_user.username })<span class="vip1"></em>
										<div class="s-prestige am-btn am-round">
											</span>会员福利</div>
									</div>
									<div class="m-right">
										<div class="m-new">
											<a href="javascript:;"><i class="am-icon-bell-o"></i>消息</a>
										</div>
										<div class="m-address">
											<a href="${pageContext.request.contextPath }/person/address.jsp" class="i-trigger">我的收货地址</a>
										</div>
									</div>
								</div>

								<!--个人资产-->
								
							</div>
							<div class="box-container-bottom"></div>

							<!--订单 -->
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>我的订单
									<a class="i-load-more-item-shadow" href="${pageContext.request.contextPath }/order/allOrders">全部订单</a>
								</div>
								<ul>
									
									<li><a href="${pageContext.request.contextPath }/order/allOrders"><i><img src="../images/send.png"/></i><span>待发货<em class="m-num">${waitSend }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath }/order/allOrders"><i><img src="../images/receive.png"/></i><span>待收货<em class="m-num">${waitConfirm }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath }/order/allOrders"><i><img src="../images/comment.png"/></i><span>待评价<em class="m-num">${waitComment }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath }/order/allOrders"><i><img src="../images/refund.png"/></i><span>已关闭<em class="m-num">${orderClose }</em></span></a></li>
								</ul>
							</div>
							
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>我的换购
									<a class="i-load-more-item-shadow" href="${pageContext.request.contextPath }/user/allRequests">全部请求</a>
								</div>
								<ul>
									
									<li><a href="${pageContext.request.contextPath }/user/allRequests"><i><img src="../images/send.png"/></i><span>等他同意<em class="m-num">${oth_waitAgree}</em></span></a></li>
									<li><a href="${pageContext.request.contextPath }/user/allRequests"><i><img src="../images/receive.png"/></i><span>他已同意<em class="m-num">${oth_alreadyAgree }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath }/user/allRequests"><i><img src="../images/comment.png"/></i><span>等我同意<em class="m-num">${own_waitAgree }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath }/user/allRequests"><i><img src="../images/refund.png"/></i><span>我已同意<em class="m-num">${own_alreadyAgree }</em></span></a></li>
								</ul>
							</div>
							
							
							
							<!--九宫格-->
							<!--<div class="user-patternIcon">
								<div class="s-bar">
									<i class="s-icon"></i>我的常用
								</div>
								<ul>

									<a href="../home/shopcart.html"><li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i><img src="../images/iconbig.png"/><p>购物车</p></li></a>
									<a href="collection.html"><li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i><img src="../images/iconsmall1.png"/><p>我的收藏</p></li></a>
									<a href="../home/home.html"><li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i><img src="../images/iconsmall0.png"/><p>为你推荐</p></li></a>
									<a href="comment.html"><li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i><img src="../images/iconsmall3.png"/><p>好评宝贝</p></li></a>
									<a href="foot.html"><li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i><img src="../images/iconsmall2.png"/><p>我的足迹</p></li></a>                                                                        
								</ul>
							</div> -->
						</div>
					</div>
					<div class="wrap-right">

						<!-- 日历-->
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em id="day">21</em>
									<span id="wk">星期一</span>
									<span id="date">2015.12</span>
								</div>
							</div>
							
						</div>

					</div>
				</div>
				<!--底部-->
				<%@include file="/home/foot.jsp" %>
			</div>
			
			<%@include file="/person/commaside.jsp" %>
			
		</div>
		<!--引导 -->
		<!-- <div class="navCir">
			<li><a href="../home/home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="../home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div> -->
	</body>

</html>