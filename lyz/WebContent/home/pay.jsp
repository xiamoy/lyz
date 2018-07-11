<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>

<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />

<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/address.js"></script>
<script type="text/javascript" src="../js/modifyNum.js"></script>

</head>

<body>

	<!--顶部导航条 -->
	<%@include file="/home/head.jsp"%>

	<div class="concent">
		<!--地址 -->
	
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
				</div>
				<div class="clear"></div>
				<ul>
					<div class="per-border"></div>
					<c:if test="${empty login_user.addresses }">
						<li class="user-addresslist defaultAddr">您还没有地址哦，先增加一个吧</li>
					</c:if>
					<c:if test="${not empty login_user.addresses }">
						<c:forEach items="${login_user.addresses }" var="addrs">
							<c:choose>
								<c:when test="${addrs.isDefault == 1 }">
									<li class="user-addresslist defaultAddr">
								</c:when>
								<c:otherwise>
									<li class="user-addresslist">
								</c:otherwise>
							</c:choose>

							<div class="address-left">
								<div class="user DefaultAddr">
									<input class="addressid" name="addressid" type="hidden" value="${addrs.aid }" />
									<span class="buy-address-detail"> <span class="buy-user">${addrs.receiver }
									</span> <span class="buy-phone">${addrs.telephone }</span>
									</span>
								</div>
								<div class="default-address DefaultAddr">
									<span class="buy-line-title buy-line-title-type">收货地址：</span> <span
										class="buy--address-detail">${addrs.address } </span> </span>
								</div>
								<c:if test="${addrs.isDefault == 1 }">
									<ins class="deftip">默认地址</ins>
								</c:if>

							</div>
							<div class="address-right">
								<a href="#"> <span
									class="am-icon-angle-right am-icon-lg"></span></a>
							</div>
							<div class="clear"></div>

							<div class="new-addr-btn">
							 
							<a href="${pageContext.request.contextPath }/user/setDeftAddrs?aid=${addrs.aid}&flag=home"
									class="hidden">设为默认</a>
								
								 <span class="new-addr-bar hidden">|</span>
								<!-- <a href="#">编辑</a> <span class="new-addr-bar">|</span> --> 
								<a	href="${pageContext.request.contextPath }/user/delAddrs?aid=${addrs.aid}&flag=home" >删除</a>
							</div>

							</li>
						</c:forEach>
					</c:if>

				</ul>

				<div class="clear"></div>
			</div>
			<!--物流  TODO-->

			<!--支付方式 TODO-->

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last">
							<form id="orderForm" method="post" action="${pageContext.request.contextPath }/order/subOrder">
								 <input id="totalPrice" name="total" type="hidden" value="${cart.subtotal }" /> 
							<div class="bundle-main">
								<input id="addid" name="addid" type="hidden" value="${login_user.deafaultAddress.aid}"/>
								<c:forEach items="${topay_shop_cart.cartItems }" var="cart">
									<ul class="item-content clearfix">
										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic">
													<a href="${pageContext.request.contextPath }/product/prodintro.action?pid=${cart.product.pid}" class="J_MakePoint"> 
													<img src="${pageContext.request.contextPath }/${cart.product.pimage}"	class="itempic J_ItemImg"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<input type="hidden" name="pro_id" value="${cart.product.pid}"/>
														<a href="${pageContext.request.contextPath }/product/prodintro.action?pid=${cart.product.pid}" class="item-title J_MakePoint"
															data-point="tbcart.8.11">${cart.product.pname }</a>
													</div>
												</div>
											</li>

											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now">${cart.product.shopPrice }</em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<input id="min" class="min am-btn" name="" type="button" value="-" />
														<input id="text_box" class="text_box" name="product_count" type="text" 	value="${cart.count }" style="width: 30px;" /> 
														<input id="add" class="add am-btn" name="" type="button" value="+" />
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number">${cart.subtotal }</em>
											</div>
										</li>
									</ul>
								</c:forEach>
								<div class="clear"></div>
								</div>
								</form>
						</div>
					</tr>

					<div class="clear"></div>
				</div>

			</div>
			<div class="clear"></div>
			<div class="pay-total">
				<!--留言-->
				<div class="order-extra">
					<div class="order-user-info">
						<div id="holyshit257" class="memo">
							<label>买家留言：</label> <input type="text"
								title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
								placeholder="选填,建议填写和卖家达成一致的说明"
								class="memo-input J_MakePoint c2c-text-default memo-close">
							<div class="msg hidden J-msg">
								<p class="error">最多输入500个字符</p>
							</div>
						</div>
					</div>

				</div>
				<!--优惠券  TODO-->

			</div>
			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计 <span>¥</span><em class="pay-sum">${topay_shop_cart.total }</em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee">${topay_shop_cart.total }</em>
							</span>
						</div>

						<div id="holyshit268" class="pay-address">
							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
									class="buy--address-detail"> ${login_user.deafaultAddress.address } </span> </span>
							</p>
							<p class="buy-footer-address">
								<span class="buy-line-title">收货人：</span> <span
									class="buy-address-detail"> <span class="buy-user">${login_user.deafaultAddress.receiver }
								</span> <span class="buy-phone">${login_user.deafaultAddress.telephone }</span>
								</span>
							</p>
						</div>
					</div>

					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
							<a id="J_Go" href="javascript:;"	class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>


	<!-- include footer jsp file -->
	<%@include file="/home/foot.jsp"%>

	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form id="addAddrsForm" action="${pageContext.request.contextPath }/user/addAddress" method="post" 
				class="am-form am-form-horizontal">
				<input type="hidden" name="redirectpath" value="home/pay.jsp"/>
				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" name="receiver" id="user-name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" name="telephone" placeholder="手机号必填" type="email" />
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" name="detailAddrs" placeholder="输入详细地址"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div id="saveAddrs" class="am-btn am-btn-danger" >保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>
</body>
<script type="text/javascript">
	$(".address li.user-addresslist").click(function(){
		/* $(".address li.user-addresslist.defaultAddr") */
		$("#addid").val($(this).find(".addressid").val());
	 	var buyer = $(this).find(".buy-address-detail .buy-user").text();
		var phone = $(this).find(".buy-address-detail .buy-phone").text();
		var address= $(this).find(".buy--address-detail").text(); 
		$("#holyshit268 .buy--address-detail").text(address);
		$("#holyshit268 .buy-user").text(buyer);
		$("#holyshit268 .buy-phone").text(phone);
	});
	
	$("#saveAddrs").click(function(){
		$("#addAddrsForm").submit();
	});
	$("#J_Go").click(function(){
		$("#totalPrice").val($("#J_ActualFee").text());
		$("#orderForm").submit();
	})
	
	
</script>
</html>