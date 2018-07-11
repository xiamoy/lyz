<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                        <!-- <li class="qc"><a href="#">闪购</a></li>
                        <li class="qc"><a href="#">限时抢</a></li>
                        <li class="qc"><a href="#">团购</a></li>
                        <li class="qc last"><a href="#">大包装</a></li> -->
					</ul>
				   
				</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="#">首页</a></li>
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
									<img src="${pageContext.request.contextPath }/${goods.gimage}" title="pic" />
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
								<a href="${pageContext.request.contextPath }/${goods.gimage}">
								<img src="${pageContext.request.contextPath }/${goods.gimage}" 
									alt="细节展示放大镜特效" rel="${pageContext.request.contextPath }/${goods.gimage}" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath }/${goods.gimage}" 
											mid="${pageContext.request.contextPath }/${goods.gimage}" big="${pageContext.request.contextPath }/${goods.gimage}"></a>
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
							<h1>${goods.gname } </h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>市场价值</dt>
									<dd><em>¥</em><b class="sys_item_price">${goods.price }</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>商品联系人</dt>
									<dd><em>&nbsp;&nbsp;</em><b class="sys_item_price">
									<%-- <c:choose>
										<c:when test="${not empty goods.user.email}">
											${goods.user.email }
										</c:when>
										<c:otherwise>
											${goods.user.telephone }
										</c:otherwise>
									</c:choose> --%>
										${goods.user.username }
									</b></dd>
								</li>
								<div class="clear"></div>
							</div>

							<!--地址-->
							<div class="tb-detail-hd">
								<li class="price iteminfo_price" style="font-size:16px">商品描述</li>
								<div ><b class="font-size:18px;padding:8px">${goods.gdesc }</b>	</div>

							</div>
							
						
							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label"></span><span class="tm-count"></span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">请求人数</span><span class="tm-count">${goods.changeRequests.size() }</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label"></span><span class="tm-count"></span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							
							<div class="clear"></div>
							<!--活动	-->
						</div>

						<div class="pay">
							<%-- <div class="pay-opt">
							<a href="${pageContext.request.contextPath }/home/home.jsp"><span class="am-icon-home am-icon-fw">首页</span></a>
							<a><span class="am-icon-heart am-icon-fw">收藏</span></a>
							
							</div> --%>
							<input type="hidden" id="guid" value="${goods.user.uid }" />
							<input type="hidden" id="loginuid" value="${login_user.uid }" />
							<input type="hidden" id="excgid" value="${goods.cgid }" />
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a  id="LikBuy" title="点此按钮到下一步确认交换" href="#">加入交换</a>
								</div>
							</li>
							<!-- <li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入交换的心愿单" href="#"><i></i>加入换单</a>
								</div>
							</li> -->
						</div>

					</div>
					<div class="clear"></div>
				</div>
			
			</div>
			
			<!--菜单 -->
			<%@include file="/home/foot.jsp" %>
	</body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#LikBuy").click(function(){
				if($("#loginuid").val()!=""){
					if($("#guid").val()==$("#loginuid").val()){
						alert("不能交换自己的商品");
						return ;
					}else{
						location.href="${pageContext.request.contextPath }/goods/addGoods?cgid="+$("#excgid").val();
					}
						
				}else {
					location.href="${pageContext.request.contextPath}/home/login.jsp";
				}
			})
		})
	</script>

</html>