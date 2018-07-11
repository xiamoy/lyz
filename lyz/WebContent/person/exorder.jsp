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

<title>换购请求管理</title>

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
							<strong class="am-text-danger am-text-lg">请求管理</strong> / <small>Request</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">我发出的请求</a></li>
							<li><a href="#tab2">我收到的请求</a></li>
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
								<td class="td-inner">商品请求人</td>
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
								<c:forEach items="${sendRequests }" var="ureqst"> 
								<div class="order-status5">
									<div class="order-title">
										<div class="dd-num">订单编号：
										<a  href="${pageContext.request.contextPath }">${ureqst.crid }</a>
										</div>
										<span>请求时间：<fmt:formatDate type="date" value="${ureqst.createtime }"/></span>
									</div>
									<div class="order-content">
										<div class="order-left">
											<!-- src goods -->
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/goods/goodsInfo?cgid=${ureqst.srcGoods.cgid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath }/${ureqst.srcGoods.gimage}" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${ureqst.srcGoods.gname }</p>
																<p class="info-little"></p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${ureqst.srcGoods.price }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>1
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
													<span>${ureqst.srcGoods.user.username }的请求</span>
													</div>
												</li>
											</ul>
											<!-- dest goods -->
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/goods/goodsInfo?cgid=${ureqst.destGoods.cgid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath }/${ureqst.destGoods.gimage}" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${ureqst.destGoods.gname }</p>
																<p class="info-little"></p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${ureqst.destGoods.price }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>1
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<span>${ureqst.destGoods.user.username }</span>
													</div>
												</li>
											</ul>
										</div>
										
										<div class="order-right">
											<!-- <li class="td td-amount">
												<div class="item-amount">合计：</div>
											</li> -->
											<div class="move-right">
												<c:if test="${ureqst.state==0 }">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已请求</p>
															<%-- <p class="order-info">
																<a href="${pageContext.request.contextPath }" target="main">请求详情</a>
															</p> --%>
															<p ><a style="color:red;" href="${pageContext.request.contextPath}/goods/deleRequest?crid=${ureqst.crid}">撤销请求</a></p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">等待同意</div>
													</li>	
												 </c:if>
												 
												 <c:if test="${ureqst.state==1 }">
												 	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已成交</p>
															<%-- <p class="order-info">
																<a  href="${pageContext.request.contextPath }" target="main">请求详情</a>
															</p> --%>
															<p class="order-info">
																联系方法:
																<c:choose>
																	<c:when test="${not empty ureqst.destGoods.user.email }">
																		${ureqst.destGoods.user.email }
																	</c:when>
																	<c:otherwise>
																		${ureqst.destGoods.user.telephone }
																	</c:otherwise>
																</c:choose>
																
															</p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/goods/deleRequest?crid=${ureqst.crid}">删除请求</a>
														</div>
													</li>
												 
												  </c:if>
												  
												   <c:if test="${ureqst.state==2 }">
												 	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">对方已拒绝</p>
															<p class="order-info">
																联系方法:
																<c:choose>
																	<c:when test="${not empty ureqst.destGoods.user.email }">
																		${ureqst.destGoods.user.email }
																	</c:when>
																	<c:otherwise>
																		${ureqst.destGoods.user.telephone }
																	</c:otherwise>
																</c:choose>
																
															</p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/goods/deleRequest?crid=${ureqst.crid}">删除请求</a>
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
					
					<!-- END MySendRequest -->							
						
						<div class="am-tab-panel am-fade" id="tab2">
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
							<!-- <div class="th th-amount">
								<td class="td-inner">合计</td>
							</div> -->
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
								<c:forEach items="${sendMeReq}" var="sendre"> 
								<div class="order-status5">
									<div class="order-title">
										<div class="dd-num">请求编号：
										<a  href="${pageContext.request.contextPath }">${sendre.crid }</a>
										</div>
										<span>请求时间：<fmt:formatDate type="date" value="${sendre.createtime }"/></span>
									</div>
									<div class="order-content">
										<div class="order-left">
											<!-- src goods -->
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/goods/goodsInfo?cgid=${sendre.srcGoods.cgid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath }/${sendre.srcGoods.gimage}" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${sendre.srcGoods.gname }</p>
																<p class="info-little"></p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${sendre.srcGoods.price }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>1
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<span>${sendre.srcGoods.user.username }的请求</span>
													</div>
												</li>
											</ul>
											<!-- dest goods -->
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/goods/goodsInfo?cgid=${sendre.destGoods.cgid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath }/${sendre.destGoods.gimage}" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${sendre.destGoods.gname }</p>
																<p class="info-little"></p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${sendre.destGoods.price }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>1
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														<span>${sendre.destGoods.user.username }</span>
													</div>
												</li>
											</ul>
										</div>
										
										<div class="order-right">
											<!-- <li class="td td-amount">
												<div class="item-amount">合计：</div>
											</li> -->
											<div class="move-right">
												<c:if test="${sendre.state==0 }">
													<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已请求</p>
															<p ><a style="color:red;" href="${pageContext.request.contextPath}/goods/refuseRequest?crid=${sendre.crid}">拒绝交换</a></p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu"><a style="color:white" href="${pageContext.request.contextPath}/goods/agreeRequest?crid=${sendre.crid}">同意请求</a> </div>
													</li>	
												 </c:if>
												 
												 <c:if test="${sendre.state==1 }">
												 	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已成交</p>
															<p class="order-info">
																联系方法:
																<c:choose>
																	<c:when test="${not empty sendre.destGoods.user.email }">
																		${sendre.destGoods.user.email }
																	</c:when>
																	<c:otherwise>
																		${sendre.destGoods.user.telephone }
																	</c:otherwise>
																</c:choose>
																
															</p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/goods/deleRequest?crid=${sendre.crid}">删除请求</a>
														</div>
													</li>
												 
												  </c:if>
												  
												   <c:if test="${sendre.state==2 }">
												 	<li class="td td-status">
														<div class="item-status">
															<p class="Mystatus">已拒绝</p>
															
															<p class="order-info"></p>
														</div>
													</li>
													<li class="td td-change">
														<div class="am-btn am-btn-danger anniu">
															<a style="color:white" href="${pageContext.request.contextPath }/goods/deleRequest?crid=${sendre.crid}">删除请求</a>
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