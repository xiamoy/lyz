<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".comment-list .item-opinion li").click(function() {	
					$(this).prevAll().children('i').removeClass("active");
					$(this).nextAll().children('i').removeClass("active");
					$(this).children('i').addClass("active");
					
					var text= $(this).contents().filter(function(){
						return this.nodeType==3;
					}).text();
					//console.log(text);
					if (text=='好评') {
						$(this).siblings("input").val("1");
					} else if(text=='中评'){
						$(this).siblings("input").val("2");
					}else{
						$(this).siblings("input").val("3");
					}
					
				});
				
				$("#publish").click(function(){
					 var len = $(".comment-list .item-opinion li i.active").length;
					 if(len==0){
						 alert("请填写完再提交");
						 return;
					 }
					$("#commtform").submit();
				})
	     	});
			
			
		
		</script>		
	</head>

	<body>
		<!--头 -->
		<%@include file="/person/commheader.jsp" %>
		
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
						<!--多个商品评论-->
						<form id="commtform" action="${pageContext.request.contextPath }/order/postCommt" method="post">
 							<c:forEach items="${orderitems}" var="oitem">
							<div class="comment-list">
								<input type="hidden" name="pid" value="${oitem.product.pid }" />
								<input type="hidden" name="oid" value="${oitem.order.oid }" />
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${pageContext.request.contextPath }/${oitem.product.pimage}" class="itempic">
									</a>
								</div>

								<div class="item-title">
									<div class="item-name">
										<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${oitem.product.pid}">
											<p class="item-basic-info">${oitem.product.pname }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little"></div>
										<div class="item-price">
											价格：<strong>${oitem.product.shopPrice }元</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea name="commt" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								
								<div class="item-opinion">
									<li><i class="op1"></i>好评</li>
									<li><i class="op2"></i>中评</li>
									<li><i class="op3"></i>差评</li>
									<input  type="hidden" name="level" value="" />
								</div>
							</div>
							</c:forEach>
								
								<div class="info-btn">
									<div id="publish" class="am-btn am-btn-danger">发表评论</div>
								</div>										
							</form>
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