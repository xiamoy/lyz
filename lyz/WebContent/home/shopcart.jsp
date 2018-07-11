<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>

	</head>

	<body>
		<%@include file="/home/head.jsp" %>
		
			<!--购物车 -->
			<div class="concent">
			<form id="cartItms" name="cartItms" action="${pageContext.request.contextPath }/cart/settle" method="post">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
							</div>
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
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<c:if test="${empty session_shop_cart || empty session_shop_cart.cartItems }">
								<div class="bundle-hd">
									<div class="bd-promos">
										<div class="bd-has-promo">购物车空空如也,亲,请先去逛逛去吧</div>
									</div>
								</div>
								<div class="clear"></div>
							</c:if>
							<div class="bundle-main">
							
							<c:if test="${not empty session_shop_cart.cartItems }">
							<c:forEach items="${session_shop_cart.cartItems }" var="cart" >
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="J_CheckBox_170037950254" name="items" value="${cart.product.pid }" type="checkbox">
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${cart.product.pid}" target="_blank" data-title="${cart.product.pname }" class="J_MakePoint" data-point="tbcart.8.12">
												<img style="width:130px;height:130px" src="${pageContext.request.contextPath }/${cart.product.pimage }" class="itempic J_ItemImg"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="${pageContext.request.contextPath}/product/prodintro.action?pid=${cart.product.pid}" target="_blank" 
													title="${cart.product.pname }" class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.product.pname }</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
									<div class="item-props "></div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${cart.product.marketPrice }</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${cart.product.shopPrice }</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input id="min" class="min am-btn" name="" type="button" value="-" />
													<input id="text_box" class="text_box" name="item_count" type="text" value="${cart.count }" style="width:30px;" />
													<input id="add" class="add am-btn" name="" type="button" value="+" />
													<input id="item_stock" name="item_stock" style="display:none" value="${cart.product.stock }"/>
												</div>
											</div>
										</div>
									</li>
									<li id="tdSum" class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number" name="subTotal" >${cart.subtotal }</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											
											<a href="javascript:;" onclick="removeFromCart('${cart.product.pid}')" data-point-url="#" class="delete"> 删除</a>
										</div>
									</li>
								</ul>
							</c:forEach>	
							</c:if>	
								
							</div>
						</div>
					</tr>
					<div class="clear"></div>
					
				</div>
				<div class="clear"></div>

			<c:if test="${not empty session_shop_cart.cartItems }">
				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="operations">
						<a href="${pageContext.request.contextPath}/cart/clearCart"  hidefocus="true"  >删除</a>
						
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span>
							<em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total" name="sumPrice">0.00</em></strong>
						</div>
						<div class="btn-area">
							<a href="#"  id="J_Go" class="submit-btn" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span>结&nbsp;算</span></a>
						</div>
					</div>

				</div>
			</c:if>
		</form>
			<%@include file="/home/foot.jsp" %>

		</div>
		
		<!--引导 -->
	</body>
	
	<script type="text/javascript">
		function removeFromCart(pid){
			if(confirm("确定要删除该商品吗?")){
				location.href="${pageContext.request.contextPath}/cart/removeItem?pid="+pid;
			}
		}
		
		function clear(){
			location.href = "${pageContext.request.contextPath}/cart/clearCart";
		}
		
		$(document).ready(function(){	
			$(".item-content #min").each(function(){
				$(this).click(function(){
					var val = parseInt($(this).siblings("#text_box").val());
					var price_text = $(this).parents("li.td-amount").siblings("li.td-price").find("em.J_Price").text();
					var price= (parseFloat(price_text)).toFixed(2);
					var sub_text = $(this).parents("li.td-amount").siblings("li.td-sum").find("em.J_ItemSum");
					var subtotal = (parseFloat($(sub_text).text())).toFixed(2);
				
					if(val>1){
						$(this).siblings("#text_box").val(val-1);
						$(sub_text).text(subtotal-price);
						var checked = $(this).parents("li.td-amount").siblings("li.td-chk").find(".check").prop("checked");
						console.log("min :"+checked);
						if(checked){
							var total = (parseFloat($("#J_Total").text())).toFixed(2);
							$("#J_Total").text(total-price);
						}
					}
								
				});
			});
			
			$(".item-content #add").each(function(){
				$(this).click(function(){
					var count = parseInt($(this).siblings("#text_box").val());
					var stock = $(this).siblings("#item_stock").val();
					var price_text = $(this).parents("li.td-amount").siblings("li.td-price").find("em.J_Price").text();
					var price=  parseFloat((price_text));
					
					var sub_text = $(this).parents("li.td-amount").siblings("li.td-sum").find("em.J_ItemSum").text();
					var subtotal = parseFloat(sub_text);
					if(count<stock){
						$(this).siblings("#text_box").val(count+1);
						subtotal = (subtotal+price).toFixed(2);
				
						$(this).parents("li.td-amount").siblings("li.td-sum").find("em.J_ItemSum").text(subtotal);
						
						var checked = $(this).parents("li.td-amount").siblings("li.td-chk").find(".check").prop("checked");
						console.log("add :"+checked);
						if(checked){
							var total = parseFloat($("#J_Total").text());
							$("#J_Total").text((total+price).toFixed(2));
						}
					}
					
				});
			})
			
		});
			
		
		//select all and part
		$("#J_SelectAllCbx2").click(function(){
			if($(this).is(':checked')){
				$("input[name='items']").each(function(){
					$(this).attr("checked",true); 
				});
			}else{
				$("input[name='items']").each(function(){
					$(this).removeAttr("checked"); 
				});
			}
		});
		
		$("input[type=checkbox]").click(function(){
			var count = $("input[name='items']:checked").length;
			$("#J_SelectedItemsCount").text(count);
			var total = 0;
			
			$("input[name='items']:checked").each(function(){
				var sum = $(this).parent().parent().siblings("#tdSum").find("em").text();
				total+= Number(sum);
			}); 
			$("#J_Total").text(total.toFixed(2));
		});
		
		$("#J_Go").click(function(){
			var count = $("input[name='items']:checked").length;
			if(count<=0){
				alert("至少选择一件商品！");
				return;
			}
			$("#cartItms").submit();
		})
		
		function submitCart(){
			var count = $("input[name='items']:checked").length;
			alert(count);
			document.getElementById("cartItms").submit();
		}
		
	</script>

</html>