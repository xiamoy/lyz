<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<style type="text/css">
.text-ellipsis {
	width: 40px;
	overflow: hidden;
	text-overflow: ellipsis;
}

</style>
</head>

<body>
	<!--头 -->
	<%@include file="/person/commheader.jsp"%>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<!-- <li><a href="#tab2">待付款</a></li> -->
							<!-- <li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
							<li><a href="#tab5">待评价</a></li> -->
						</ul>

						<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active" id="tab1">
						<div class="order-top">
							<div class="th th-item">
								<td class="td-inner">商品</td>
							</div>
							<div class="th th-price">
								<td class="td-inner">单价</td>
							</div>
							<div class="th th-number">
								<td class="td-inner">数量</td>
							</div>
							<div class="th th-operation">
								<td class="td-inner">商品操作</td>
							</div>
							<div class="th th-amount">
								<td class="td-inner">合计</td>
							</div>
							<div class="th th-status">
								<td class="td-inner">交易状态</td>
							</div>
							<div class="th th-change">
								<td class="td-inner">交易操作</td>
							</div>
						</div>

						<div class="order-main">
							<div class="order-list">

								<!--交易成功-->
								<c:forEach items="${user_all_orders }" var="order"> 
								<div class="order-status5">
									<div class="order-title">
										<div class="dd-num">订单编号：
										<a  href="${pageContext.request.contextPath }/order/orderDetail?oid=${order.oid}">${order.oid }</a>
										</div>
										<span>成交时间：<fmt:formatDate type="date" value="${order.ordertime }"/></span>
									</div>
									<div class="order-content">
										<div class="order-left">
											<c:forEach items="${order.items }" var="oitem"> 
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${oitem.product.pid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath }/${oitem.product.pimage}" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${oitem.product.pname }</p>
																<p class="info-little"></p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${oitem.product.shopPrice }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${oitem.count }
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">

													</div>
												</li>
											</ul>
											</c:forEach>
											

										</div>
										
										<div class="order-right">
											<li class="td td-amount">
												<div class="item-amount">合计：${order.total }</div>
											</li>
											<div class="move-right">
												<c:if test="${order.state==0 }">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已付款</p>
															<p class="order-info">
																<a href="${pageContext.request.contextPath }/order/orderDetail?oid=${order.oid}" target="main">订单详情</a>
															</p>
															
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">等待发货</div>
													</li>	
												 </c:if>
												 
												 <c:if test="${order.state==1 }">
												 	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已发货</p>
															<p class="order-info">
																<a  href="${pageContext.request.contextPath }/order/orderDetail?oid=${order.oid}" target="main">订单详情</a>
															</p>
															
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/order/confirmOrder?oid=${order.oid}">确认收货</a>
														</div>
													</li>
												 
												  </c:if>
												  
												  <c:if test="${order.state==2 }">
												  	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已收货</p>
															<p class="order-info">
																<a href="${pageContext.request.contextPath }/order/orderDetail?oid=${order.oid}" target="main">订单详情</a>
															</p>
															<p ><a style="color:red;" href="${pageContext.request.contextPath }/order/toCommts?oid=${order.oid}">评价商品</a></p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/order/delOrder?oid=${order.oid}">删除订单</a> 
														</div>
													</li>
												  </c:if>
												   <c:if test="${order.state==3 }">
												  	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已关闭</p>
															<p class="order-info">
																<a href="${pageContext.request.contextPath }/order/orderDetail?oid=${order.oid}" target="main">订单详情</a>
															</p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/order/delOrder?oid=${order.oid}">删除订单</a>
														</div>
													</li>
												  </c:if>
												
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							
							</div>

						</div>

					</div>
					<!-- END -->							
						
						</div>

					</div>
				</div>
			</div>

			<!--底部-->
			<%@include file="/home/foot.jsp"%>
		</div>

		<%@include file="/person/commaside.jsp"%>
	</div>
</body>


</html>