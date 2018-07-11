<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="../css/style.css" rel="stylesheet" />
			

		<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="../basic/js/quick_links.js"></script>

		<script type="text/javascript" src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="../js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="../js/list.js"></script>
		<script type="text/javascript" src="../js/modifyNum.js"></script>
	</head>

	<body>


		<!--顶部导航条 -->
		<%@include file="/home/head.jsp" %>
		
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${pageContext.request.contextPath }/home/home.jsp">首页</a></li>
                              <!--   <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc last"><a href="#">大包装</a></li> -->
							</ul>
						</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="${pageContext.request.contextPath }/product/initProduct">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="${pageContext.request.contextPath }/${prod_item.pimage}" title="pic" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath }/${prod_item.pimage}" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath }/${prod_item.pimage}" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="${pageContext.request.contextPath }/${prod_item.pimage}">
								<img  src="${pageContext.request.contextPath }/${prod_item.pimage}" alt="细节展示放大镜特效" rel="${pageContext.request.contextPath }/${prod_item.pimage}" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath }/${prod_item.pimage}" 
												mid="${pageContext.request.contextPath }/${prod_item.pimage}" 
												big="${pageContext.request.contextPath }/${prod_item.pimage}"></a>
									</div>
								</li>
								
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">
						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>${prod_item.pname } </h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<dd><em>¥</em><b class="sys_item_price">${prod_item.shopPrice}</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>市场价</dt>
									<dd><em>¥</em><b class="sys_item_mktprice">${prod_item.marketPrice}</b></dd>									
								</li>
								<div class="clear"></div>
							</div>

							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">${prod_item.sales}</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">${prod_item.prodComments.size()}</span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title"><span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<!-- <div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:void(0);" title="关闭" class="close">×</a>
										</div> -->
										<div class="theme-popbod dform">
											<form id="loginform" class="theme-signin" name="loginform" action="" method="post">											
												 <input type="hidden" name="pid" value="${prod_item.pid }"> 
													<div class="theme-signin-left">

													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="item_count" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">
																<input id="item_stock" name="item_stock" type="button" value="${prod_item.stock }"/></span>件</span>
														</dd>

													</div>
													<div class="clear"></div>

												</div>
											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							
						</div>

						<div class="pay">
							<div class="pay-opt">
							<a href="${pageContext.request.contextPath }/home/home.jsp"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a><span class="am-icon-heart am-icon-fw"></span></a>
							
							</div>
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" onclick="submitOrder(2)" title="点此按钮到下一步确认购买信息" href="javascript:void(0)" >立即购买</a>
								</div>
							</li>
							
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" onclick="submitOrder(1)"  title="加入购物车" href="javascript:void(0)"><i></i>加入购物车</a>
								</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>
					<script>
					
					function submitOrder(num){
						var count = parseInt(document.getElementById("text_box").value);
						 var stock = parseInt(document.getElementById("item_stock").value);
						 if(count>stock){
						 	alert("您选择已超出库存量！");
						 	return;
						 }
						if(num==1){
							document.loginform.action="${pageContext.request.contextPath}/cart/addCart";
						}else{
							document.loginform.action="${pageContext.request.contextPath}/cart/directBuy.action";
						}
						document.loginform.submit();
					}
					</script>
					

				</div>

				<!--优惠套装-->
				<div class="match">
					<div class="match-title"></div>
				</div>
				<div class="clear"></div>
				
							
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>最近浏览</h2>        
					            </div>
						     	<c:forEach items="${session_history_prod }" var="hisProd">
							     	<c:if  test="${prod_item.pid != hisProd.pid }">
							     		 <li class="first">
								      	<div class="p-img">                    
								      		<a  href="${pageContext.request.contextPath }/product/prodintro.action?pid=${hisProd.pid}"> 
								      		<img class="" style="width:160px;height:160px" src="${pageContext.request.contextPath }/${hisProd.pimage}"> 
								      		</a>               
								      	</div>
								      	<div class="p-name"><a href="${pageContext.request.contextPath }/product/prodintro.action?pid=${hisProd.pid}">
								      		${hisProd.pname }
								      	</a>
								      	</div>
								      	<div class="p-price"><strong>${hisProd.shopPrice }</strong></div>
								      </li>
								      </c:if>
						     	</c:forEach>
							     
							     
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="javascript:void(0)"><span class="index-needs-dt-txt">宝贝详情</span></a>
								</li>

								<li>
									<a href="javascript:void(0)"><span class="index-needs-dt-txt">全部评价</span></a>
								</li>

							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">
										 <div class="attr-list-hd tm-clear">
											<h4>产品描述：</h4></div>
										<div class="clear"></div>
										
										<c:choose>
											<c:when  test="${fn:contains(prod_item.pdesc,';' )}">
												<ul id="J_AttrUL">
													<c:forEach items="${fn:split(prod_item.pdesc,';')}" var="des_param">
														<li title="">${des_param }</li>
													</c:forEach>
												</ul>
											</c:when>
											<c:otherwise>
												${prod_item.pdesc }	
											</c:otherwise>
										</c:choose>
										<div class="clear"></div>
									</div>

									<div class="details">
										<div class="attr-list-hd after-market-hd">
											<h4>商品细节</h4>
										</div>
										<div class="twlistNews">
											<img alt="" src="${pageContext.request.contextPath }/${prod_item.pimage }">
											<!-- <img src="../images/tw1.jpg" />
											<img src="../images/tw2.jpg" />
											<img src="../images/tw3.jpg" />
											<img src="../images/tw4.jpg" />
											<img src="../images/tw5.jpg" />
											<img src="../images/tw6.jpg" />
											<img src="../images/tw7.jpg" /> -->
										</div>
									</div>
									<div class="clear"></div>

								</div>

								<div class="am-tab-panel am-fade">
									
                                    <div class="actor-new">
                                    	<c:choose>
                                    	<c:when test="${prod_item.prodComments.size()!=0 }">
	                                    	<div class="rate">                
	                                   			<strong><fmt:formatNumber type="percent"  value="${prod_item.goodCount/prod_item.prodComments.size() }" />
	                                   			</strong><br> <span>好评度</span>
	                                    	</div>
	                                        <dl>                    
	                                            <dt>买家印象</dt>                    
	                                             <dd class="p-bfc">
	                                       			<q class="comm-tags"><span>Level 1</span><em>好评</em></q>
	                                       			<q class="comm-tags"><span>Level 2</span><em>中评</em></q>
	                                       			<q class="comm-tags"><span>Level 3</span><em>差评</em></q>
	                                            </dd>                                       
	                                         </dl> 
                                         </c:when>
                                         <c:otherwise>
                                    				还没有相关评价
                                    			</c:otherwise>
                                         </c:choose> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(${prod_item.prodComments.size()})</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(${prod_item.goodCount })</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(${prod_item.midCount })</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(${prod_item.badCount })</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<ul class="am-comments-list am-comments-list-flip">
									<c:forEach var="comment_item" items="${prod_item.prodComments }">
										<li class="am-comment">
											<!-- 评论容器 -->
											
												<img class="am-comment-avatar" src="../images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											
											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="javascript:void(0)" class="am-comment-author">${comment_item.poster }</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">${comment_item.postdate }</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${comment_item.description }
														</div>
														<div class="tb-r-act-bar">
															评价等级：&nbsp;&nbsp;${comment_item.level }
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										</c:forEach>
										
									</ul>

									<div class="clear"></div>

									<!--分页 -->
									<!-- <ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div> -->

									<!-- <div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="javascript:void(0)" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div> -->

								</div>

							</div>

						</div>

						<div class="clear"></div>

						<%@include file="/home/foot.jsp" %>
					</div>

				</div>
			</div>
			
			<!--菜单 -->
	
	</body>

</html>