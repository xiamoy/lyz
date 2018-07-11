<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>请求详情</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>


	</head>

	<body>
		<!--头 -->
		<%@include file="/person/commheader.jsp" %>
		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-orderinfo">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">请求详情</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--进度条-->
						<%-- <div class="m-progress">
							<div class="m-progress-list">
								<span class="step-1 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                   <p class="stage-name">拍下商品</p>
                                </span>
								<span class="step-2 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                   <p class="stage-name">卖家发货</p>
                                </span>
								<span class="step-3 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">3<em class="bg"></em></i>
                                   <p class="stage-name">确认收货</p>
                                </span>
								<span class="step-4 step">
                                   <em class="u-progress-stage-bg"></em>
                                   <i class="u-stage-icon-inner">4<em class="bg"></em></i>
                                   <p class="stage-name">交易完成</p>
                                </span>
								<span class="u-progress-placeholder"></span>
							</div>
							<div class="u-progress-bar total-steps-2">
								<div class="u-progress-bar-inner"></div>
							</div>
						</div>
						 --%>
						<div class="order-infoaside">
							
							<div class="order-addresslist">
								<div class="order-address">
									<div class="icon-add">
									</div>
									<p class="new-tit new-p-re">
										<span class="new-txt">${order.name }</span>
										<span class="new-txt-rd2">${order.telephone }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">收货地址：</span>
											<span class="province">${order.address }</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="order-infomain">
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

								<div class="order-status3">
									<div class="order-title">
										<div class="dd-num">订单编号：<a href="javascript:;">${order.oid }</a></div>
										<span>成交时间：<fmt:formatDate type="date" value="${order.ordertime }"/></span>
									</div>
									<div class="order-content">
										<div class="order-left">
										<c:forEach items="${order.items }" var="item"> 
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${item.product.pid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath }/${item.product.pimage}" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="javascript:;">
																<p>${item.product.pname }</p>
																<p class="info-little"> </p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${item.product.shopPrice }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${item.count }
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
												<div class="item-amount">
													合计：${order.total }
												</div>
											</li>
											<div class="move-right">
											<c:if test="${order.state==0 }">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">已付款</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu">
														等待发货</div>
												</li>
											</c:if>
											<c:if test="${order.state==1 }">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">已发货</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu">
														<a class="whitecolor" href="${pageContext.request.contextPath }/order/confirmOrder?oid=${order.oid}">确认收货</a>
													</div>
												</li>
											</c:if>
											<c:if test="${order.state==2 }">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">已收货</p>
														<p class="order-info">
															<a style="color:red;" href="${pageContext.request.contextPath }/order/toCommts?oid=${order.oid}">去评价</a>
														</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu">
														<a class="whitecolor" href="${pageContext.request.contextPath }/order/delOrder?oid=${order.oid}">删除订单</a>
													</div>
												</li>
											</c:if>
											<c:if test="${order.state==3 }">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">已关闭</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu">
														<a class="whitecolor" href="${pageContext.request.contextPath }/order/delOrder?oid=${order.oid}">删除订单</a>
													</div>
												</li>
											</c:if>
											</div>
										</div>
										
									</div>

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

	</body>

</html>