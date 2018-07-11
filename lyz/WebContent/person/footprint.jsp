<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的足迹</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/footstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
	</head>

	<body>
		<!--头 -->
		<%@include file="/person/commheader.jsp" %>
		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-foot">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的足迹</strong> / <small>Browser&nbsp;History</small></div>
						</div>
						<hr/>
						
						<c:choose>
							<c:when test="${empty session_history_prod }">
								您还没有浏览过任何商品,去首页逛逛吧
							</c:when>
							<c:otherwise>
					
								<!--足迹列表 -->
								<c:forEach items="${session_history_prod }" var="prod">						 
								<div class="goods">
									<div class="goods-date" data-date="2015-12-21">
										<s class="line"></s>
									</div>
		
									<div class="goods-box first-box">
										<div class="goods-pic">
											<div class="goods-pic-box">
												<a class="goods-pic-link" target="_blank" href="#" title="${prod.pname }">
													<img src="${pageContext.request.contextPath }/${prod.pimage}" class="goods-img"></a>
											</div>
											<a class="goods-delete" href="${pageContext.request.contextPath }/product/delFootProd?pid=${prod.pid}"><i class="am-icon-trash"></i></a>
											<!-- <div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div> -->
										</div>
		
										<div class="goods-attr">
											<div class="good-title">
												<a class="title" href="#" target="_blank">${prod.pname }</a>
											</div>
											<div class="goods-price">
												<span class="g_price">                                    
		                                        <span>¥</span><strong>${prod.shopPrice }</strong>
												</span>
												<span class="g_price g_price-original">                                    
		                                        <span>¥</span><strong>${prod.marketPrice }</strong>
												</span>
											</div>
											<div class="clear"></div>
											<div class="goods-num">
												
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</c:otherwise>
						 </c:choose>

					</div>
				</div>

				<!--底部-->
				<%@include file="/home/foot.jsp" %>				
			</div>

			<%@include file="/person/commaside.jsp" %>			
			
		</div>

	</body>

</html>