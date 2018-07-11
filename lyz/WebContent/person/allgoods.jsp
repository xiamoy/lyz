<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>换购商品管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/footstyle.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
				
		<%@include file="/person/commheader.jsp" %>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-foot">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的商品</strong> / <small>Browser&nbsp;History</small></div>
						</div>
						<hr/>
						
						<c:choose>
							<c:when test="${empty allGoods }">
								您还没有添加过任何商品,去首页逛逛吧
							</c:when>
							<c:otherwise>
					
								<!--列表 -->
								<c:forEach items="${allGoods }" var="good">						 
								<div class="goods">
									<div class="goods-date" data-date="2015-12-21">
										<s class="line"></s>
									</div>
		
									<div class="goods-box first-box">
										<div class="goods-pic">
											<div class="goods-pic-box">
												<a class="goods-pic-link"  href="${pageContext.request.contextPath }/goods/goodsInfo?cgid=${good.cgid}" title="${good.gname }">
													<img style="width:186px;height:186px" src="${pageContext.request.contextPath }/${good.gimage}" class="goods-img"></a>
											</div>
											<a class="goods-delete" href="${pageContext.request.contextPath }/goods/deleteGoods?cgid=${good.cgid}"><i class="am-icon-trash"></i></a>
										</div>
		
										<div class="goods-attr">
											<div class="good-title">
												<a class="title" href="#" target="_blank">${good.gname }</a>
											</div>
											<div class="goods-price">
												<span class="g_price">                                    
		                                        <span>¥</span><strong>${good.price }</strong>
												</span>
												<%-- <span class="g_price g_price-original">                                    
		                                        <span>¥</span><strong>${prod.marketPrice }</strong>
												</span> --%>
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
					
					
					<!-- Add New Goods -->
					<!--例子-->
					<div class="add-dress">
						<!--标题 -->
						<!-- <div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
						</div> -->

						<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
							<form id="newGoodForm" action="${pageContext.request.contextPath }/goods/addNewGoods"
									 method="post"  class="am-form am-form-horizontal">
								<input type="hidden" name="redirectpath" value="person/address.jsp"/>
								<div class="am-form-group">
									<label for="good-name" class="am-form-label">商品名</label>
									<div class="am-form-content">
										<input type="text" name="gname" id="good-name" placeholder="商品名称">
									</div>
								</div>

								<div class="am-form-group">
									<label for="good-price" class="am-form-label">商品价格</label>
									<div class="am-form-content">
										<input id="good-price" name="price" placeholder="用以交换价值参考" type="email">
									</div>
								</div>
								<div class="am-form-group">
									<label for="good-image" class="am-form-label">商品图片</label>
									<div class="am-form-content">
										<input id="good-image" name="imgpath" placeholder="上传图片" type="file">
									</div>
								</div>

								<div class="am-form-group">
									<label for="good-intro" class="am-form-label">详细描述</label>
									<div class="am-form-content">
										<textarea class="" rows="3" id="good-intro" name="desc" placeholder="商品详细信息"></textarea>
										<small>描述商品详细信息，增加交换几率...</small>
									</div>
								</div>

								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<a id="addGoodForm" class="am-btn am-btn-danger">保存</a>
										<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
									</div>
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
		
		<script type="text/javascript">
			$(document).ready(function() {							
			
				$("#addGoodForm").click(function(){
					$("#newGoodForm").submit();
				})
				
			});
						
		</script>
	</body>

</html>