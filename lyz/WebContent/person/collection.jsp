<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的换购商品</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/colstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
	</head>

	<body>
		<!--头 -->
		<%@include file="/person/commheader.jsp" %>
		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-collection">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的换购商品</strong> / <small>My&nbsp;Exchange</small></div>
						</div>
						<hr/>
						
						
						<c:choose>
							<c:when test="${ empty look_change_goods }">
								您还没有想要交换的商品哦
							</c:when>
							<c:otherwise>
							<form action="${pageContext.request.contextPath }/user/changeGoods" method="post"> 
								<div class="you-like">
									<div class="s-bar">
										我想要交换的
										<!-- <a class="am-badge am-badge-danger am-round">降价</a>
										<a class="am-badge am-badge-danger am-round">下架</a> -->
									</div>
									<div class="s-content">
										<c:forEach items="${look_change_goods }" var="lgoods">
										<div class="s-item-wrap">
									<div class="s-item">

										<div class="s-pic">
											<a href="${pageContext.request.contextPath }/goods/goodsInfo?cgid=${lgoods.cgid}" class="s-pic-link">
												<img style="width:186px;height:186px" src="${pageContext.request.contextPath }/${lgoods.gimage }" 
												alt="${lgoods.gdesc }" title="${lgoods.gname }" class="s-pic-img s-guess-item-img">
											</a>
										</div>
										<div class="s-info">
											<div class="s-title"><a href="${pageContext.request.contextPath }/goods/goodsInfo?cgid=${lgoods.cgid}" title="${lgoods.gdesc }">${lgoods.gname }</a></div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">${lgoods.price }</em></span>
										
											</div>
											<div class="s-extra-box">
												<span class="s-comment">请求人数: ${lgoods.changeRequests.size() }</span>
												
											</div>
										</div>
										<div class="s-tp">
											<span class="ui-btn-loading-before">交换</span>
											<i class="am-icon-shopping-cart"></i>
											<span class="ui-btn-loading-before buy">
												<input type="radio" name="exgoods" value="${lgoods.cgid }" />
											</span>
											<p>
												<!-- <a href="javascript:;" class="c-nodo J_delFav_btn">取消收藏</a> -->
											</p>
										</div>
									</div>
								</div>
								</c:forEach>
									 </div>
								</div>
							</c:otherwise>
						</c:choose>
						
						
						<div class="you-like">
							<div class="s-bar">
								我的可换商品
								<a class="am-badge am-badge-danger am-round"></a>
								<a class="am-badge am-badge-danger am-round"></a>
							</div>
							<div class="s-content">
								<c:forEach items="${userGoods}" var="goods">  
								<div class="s-item-wrap">
									<div class="s-item">

										<div class="s-pic">
											<a href="${pageContext.request.contextPath }/goods/goodsInfo?cgid=${goods.cgid}" class="s-pic-link">
												<img style="width:186px;height:186px" src="${pageContext.request.contextPath }/${goods.gimage}" alt="${goods.gdesc }" title="${goods.gname }" class="s-pic-img s-guess-item-img">
											</a>
										</div>
										<div class="s-info">
											<div class="s-title"><a href="#" title="${goods.gdesc }">${goods.gname }</a></div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">${goods.price }</em></span>
											
											</div>
											<div class="s-extra-box">
												<span class="s-comment">请求人数: ${goods.changeRequests.size() }</span>
				
											</div>
											
										</div>
										<div class="s-tp">
											<span class="ui-btn-loading-before">交换</span>
											<i class="am-icon-shopping-cart"></i>
											<span class="ui-btn-loading-before buy">
												<input type="radio" name="owngoods" value="${goods.cgid }"/>
											</span>
											<p>
												<a href="javascript:;" class="c-nodo J_delFav_btn">取消收藏</a>
											</p>
										</div>
									</div>
								</div>
								</c:forEach>

							</div>
						</div>
						<div class="s-more-btn i-load-more-item" data-screen="0">
							<input type="submit" name="submtRequest" value="提交请求"/>
						</div>
						
					</form>
					
					</div>

				</div>
				
				<!--底部-->
				<%@include file="/home/foot.jsp" %>				
			</div>

			<%@include file="/person/commaside.jsp" %>			
			
		</div>

	</body>

</html>