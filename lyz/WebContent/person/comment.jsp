<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>评价管理</title>
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
		<!--头 -->
		<%@include file="/person/commheader.jsp"%>
		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有评价</a></li>
								<!-- <li><a href="#tab2">有图评价</a></li> -->
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="comment-main">
										<div class="comment-list">
											<c:if test="${empty userCommts }">
												<p>您还没有评价过任何商品哦</p>
											</c:if>
											<c:if test="${not empty userCommts }">
												<c:forEach items="${userCommts }" var="commt">
													<ul class="item-list">												
												<div class="comment-top">
													<div class="th th-price">
														<td class="td-inner">评价</td>
													</div>
													<div class="th th-item">
														<td class="td-inner">商品</td>
													</div>													
												</div>
												<li class="td td-item">
													<div class="item-pic">
														<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${commt.product.pid}" class="J_MakePoint">
															<img src="${pageContext.request.contextPath	 }/${commt.product.pimage }" class="itempic">
														</a>
													</div>
												</li>

												<li class="td td-comment">
													<div class="item-title">
														<div class="item-opinion">
															
														</div>
														<div class="item-name">
															<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${commt.product.pid}">
																<p class="item-basic-info">${commt.product.pname }</p>
															</a>
														</div>
													</div>
													<div class="item-comment">${commt.description }	</div>

													<div class="item-info">
														<div>
															<p class="info-little"> 
																<span>
																	<c:if test="${commt.level==1 }">好评</c:if>
																	<c:if test="${commt.level==2 }">中评</c:if>
																	<c:if test="${commt.level==3 }">差评</c:if>
																</span>
																<span><a style="color:red;" href="${pageContext.request.contextPath}/product/delProdCommt?cid=${commt.cid}">删除该评价</a> </span>
															</p>
															<p class="info-time">${commt.postdate }</p>

														</div>
													</div>
												</li>

											</ul>
												</c:forEach>
											</c:if>
											

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